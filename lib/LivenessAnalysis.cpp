#include "llvm/IR/LegacyPassManager.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/FormatVariadic.h"
#include "llvm/Support/Format.h"
#include <unordered_map>
#include <unordered_set>

using namespace llvm;

namespace {
    void visitor(Function &function) {  
        // Lambda for printing value sets
        auto printValueSet = [](const std::unordered_set<std::string> &vals) {
            bool first = true;
            for (const auto &v : vals) {
                if (!first) errs() << " ";
                errs() << v;
                first = false;
            }
            errs() << "\n";
        };

        // Use unordered_map for faster lookup
        std::unordered_map<const BasicBlock*, std::unordered_set<std::string>> UEVAR, VARKILL, LIVEOUT;

        // Compute UEVAR and VARKILL
        for (auto &BB : function) {
            std::unordered_set<std::string> ueSet, killSet, definedInBlock;

            for (auto &I : BB) {
                if (auto *sval = dyn_cast<StoreInst>(&I)) {
                    Value *sptr = sval->getPointerOperand();
                    if (sptr->hasName()) {
                        std::string defVar = sptr->getName().str();
                        killSet.insert(defVar);
                        definedInBlock.insert(defVar);
                    }
                }

                for (auto &Op : I.operands()) {
                    if (auto *lval = dyn_cast<LoadInst>(&Op)) {
                        Value *lptr = lval->getPointerOperand();
                        if (lptr->hasName()) {
                            std::string varName = lptr->getName().str();
                            if (!killSet.count(varName)) {
                                ueSet.insert(varName);
                            }
                        }
                    }
                }
            }

            UEVAR[&BB] = std::move(ueSet);
            VARKILL[&BB] = std::move(killSet);
            LIVEOUT[&BB] = {};
        }

        // Worklist-based iterative LiveOut computation
        std::vector<BasicBlock*> worklist;
        for (auto &BB : function) {
            worklist.push_back(&BB);
        }

        while (!worklist.empty()) {
            BasicBlock *BB = worklist.back();
            worklist.pop_back();
            std::unordered_set<std::string> newLiveOut;

            for (auto *Succ : successors(BB)) {
                newLiveOut.insert(UEVAR[Succ].begin(), UEVAR[Succ].end());
                for (const auto &v : LIVEOUT[Succ]) {
                    if (!VARKILL[Succ].count(v)) {
                        newLiveOut.insert(v);
                    }
                }
            }

            if (newLiveOut != LIVEOUT[BB]) {
                LIVEOUT[BB] = std::move(newLiveOut);
                for (auto *Pred : predecessors(BB)) {
                    worklist.push_back(Pred);
                }
            }
        }

        // Print results
        for (auto &BB : function) {
            errs() << "----- " << (BB.hasName() ? BB.getName().str() : "Unnamed_BB") << " -----\n";
            errs() << "UEVAR: "; printValueSet(UEVAR[&BB]);
            errs() << "VARKILL: "; printValueSet(VARKILL[&BB]);
            errs() << "LIVEOUT: "; printValueSet(LIVEOUT[&BB]);
        }
    }

    struct Live : PassInfoMixin<Live> {
        PreservedAnalyses run(Function &F, FunctionAnalysisManager &) {
            visitor(F);
            return PreservedAnalyses::all();
        }

        static bool isRequired() { return true; }
    };
}

// LLVM Pass Plugin Interface
llvm::PassPluginLibraryInfo getmyLivedPluginInfo() {
    return {LLVM_PLUGIN_API_VERSION, "liveness_analysis", LLVM_VERSION_STRING,
            [](PassBuilder &PB) {
            PB.registerPipelineParsingCallback(
                [](StringRef Name, FunctionPassManager &FPM,
                   ArrayRef<PassBuilder::PipelineElement>) {
                    if (Name == "liveness_analysis") {
                        FPM.addPass(Live());
                        return true;
                    }
                    return false;
                });
            }};
}

extern "C" LLVM_ATTRIBUTE_WEAK ::llvm::PassPluginLibraryInfo llvmGetPassPluginInfo() {
    return getmyLivedPluginInfo();
}