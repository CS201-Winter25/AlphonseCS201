#include "llvm/IR/PassManager.h"
#include "llvm/IR/Instructions.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/FileSystem.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"
#include "llvm/Support/FormatVariadic.h"
#include <unordered_map>
#include "llvm/ADT/Hashing.h"

using namespace llvm;

// Encapsulates opcode and value numbers of left and right operands
struct ExprRec {
  unsigned Op, LeftVN, RightVN;
  bool operator==(const ExprRec &O) const {
    return Op == O.Op && LeftVN == O.LeftVN && RightVN == O.RightVN;
  }
};

// Uses LLVM's built-in hash_combine to generate a combined hash
struct ExprRecHash {
  std::size_t operator()(const ExprRec &E) const {
    return llvm::hash_combine(E.Op, E.LeftVN, E.RightVN);
  }
};

namespace {
struct LocalValueNumberPass : PassInfoMixin<LocalValueNumberPass> {
  PreservedAnalyses run(Function &F, FunctionAnalysisManager &) {
    // Open (or create) the output file: append mode
    std::error_code EC;
    raw_fd_ostream FileOut("ValueNumberingOutput.log", EC,
                           sys::fs::OF_Append | sys::fs::OF_Text);
    if (EC) {
      errs() << "Error opening file: " << EC.message() << "\n";
      return PreservedAnalyses::all();
    }

    // First, output the function name (both to file and terminal), formatted similarly to "Figure 2"
    FileOut << "ValueNumbering: " << F.getName() << "\n";
    errs()   << "ValueNumbering: " << F.getName() << "\n";

    // Mapping: Value -> ValueNumber
    std::unordered_map<Value*, unsigned> valNumMap;
    // Mapping: Expression (opcode, LHS, RHS) -> ValueNumber
    std::unordered_map<ExprRec, unsigned, ExprRecHash> exprNumMap;

    unsigned currVN = 1;

    // If V has not been assigned a VN, assign one
    auto ensureVN = [&](Value *V) {
      if (auto it = valNumMap.find(V); it != valNumMap.end())
        return it->second;
      return valNumMap[V] = currVN++;
    };

    for (auto &BB : F) {
      for (auto &InstRef : BB) {
        bool isRelevant = false, isRedundant = false;
        unsigned instVN = 0; // Value number of the instruction
        std::string operandDesc; // Stores information displayed in the right column

        // 1) Handle store instructions
        if (auto *st = dyn_cast<StoreInst>(&InstRef)) {
          isRelevant = true;
          unsigned valVN = ensureVN(st->getValueOperand());
          // Update VN of the "pointer" itself to valVN
          valNumMap[st->getPointerOperand()] = valVN;
          instVN = valVN;
          // Styled like "Figure 2": "1 = 1"
          operandDesc = (Twine(valVN) + " = " + Twine(valVN)).str();

        // 2) Handle load instructions
        } else if (auto *ld = dyn_cast<LoadInst>(&InstRef)) {
          isRelevant = true;
          unsigned ptrVN = ensureVN(ld->getPointerOperand());
          instVN = ptrVN;
          valNumMap[&InstRef] = instVN;
          operandDesc = (Twine(instVN) + " = " + Twine(instVN)).str();

        // 3) Handle binary operations: add / sub / mul / udiv / sdiv
        } else if (auto *bo = dyn_cast<BinaryOperator>(&InstRef)) {
          unsigned opcode = bo->getOpcode();
          if (opcode == Instruction::Add || opcode == Instruction::Sub ||
              opcode == Instruction::Mul || opcode == Instruction::UDiv ||
              opcode == Instruction::SDiv) {
            isRelevant = true;
            // Get VN of operands
            unsigned lhsVN = ensureVN(bo->getOperand(0));
            unsigned rhsVN = ensureVN(bo->getOperand(1));

            // Check if the expression has appeared before in the expression map
            ExprRec key{opcode, lhsVN, rhsVN};
            if (auto it = exprNumMap.find(key); it != exprNumMap.end()) {
              instVN = it->second;
              isRedundant = true;
            } else {
              instVN = currVN++;
              exprNumMap[key] = instVN;
            }
            valNumMap[&InstRef] = instVN;

            // Construct right-column description, e.g., "3 = 1 add 2 (redundant)"
            operandDesc = (Twine(instVN) + " = " +
                           Twine(lhsVN) + " " + bo->getOpcodeName() + " " +
                           Twine(rhsVN) +
                           (isRedundant ? " (redundant)" : "")).str();
          }
        }

        // Output if the instruction is relevant (store / load / add / sub / mul / div)
        if (isRelevant) {
          // Convert instruction to string (left column)
          std::string instStr;
          {
            raw_string_ostream rso(instStr);
            InstRef.print(rso);
          }

          // "Two-column alignment" output: left column is the instruction (width 50), right column is operandDesc
          // Output both to file and terminal
          FileOut << formatv("  {0,-50} {1}\n", instStr, operandDesc);
          errs()   << formatv("  {0,-50} {1}\n", instStr, operandDesc);
        }
      }
    }

    FileOut << "\n";
    errs()   << "\n";

    return PreservedAnalyses::all();
  }

  static bool isRequired() { return true; }
};
}

// Register with the new Pass Manager
llvm::PassPluginLibraryInfo getValueNumberingPluginInfo() {
  return {LLVM_PLUGIN_API_VERSION, "LocalValueNumberPass", LLVM_VERSION_STRING,
          [](PassBuilder &PB) {
            PB.registerPipelineParsingCallback(
                [](StringRef Name, FunctionPassManager &FPM,
                   ArrayRef<PassBuilder::PipelineElement>) {
                  if (Name == "value-numbering") {
                    FPM.addPass(LocalValueNumberPass());
                    return true;
                  }
                  return false;
                });
          }};
}

extern "C" LLVM_ATTRIBUTE_WEAK ::llvm::PassPluginLibraryInfo
llvmGetPassPluginInfo() {
  return getValueNumberingPluginInfo();
}
