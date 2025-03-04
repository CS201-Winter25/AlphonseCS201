; ModuleID = 'phase3TestCases/case3.c'
source_filename = "phase3TestCases/case3.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-macosx15.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @test() #0 {
entry:
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %c = alloca i32, align 4
  %d = alloca i32, align 4
  %e = alloca i32, align 4
  %f = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 5, ptr %a, align 4
  store i32 4, ptr %b, align 4
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %i, align 4
  %cmp = icmp slt i32 %0, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32, ptr %a, align 4
  %2 = load i32, ptr %d, align 4
  %add = add nsw i32 %1, %2
  store i32 %add, ptr %c, align 4
  %3 = load i32, ptr %c, align 4
  %4 = load i32, ptr %a, align 4
  %mul = mul nsw i32 %3, %4
  store i32 %mul, ptr %e, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %5 = load i32, ptr %i, align 4
  %inc = add nsw i32 %5, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !6

for.end:                                          ; preds = %for.cond
  %6 = load i32, ptr %e, align 4
  %7 = load i32, ptr %d, align 4
  %cmp1 = icmp sgt i32 %6, %7
  br i1 %cmp1, label %if.then, label %if.else

if.then:                                          ; preds = %for.end
  %8 = load i32, ptr %d, align 4
  %9 = load i32, ptr %c, align 4
  %mul2 = mul nsw i32 %8, %9
  store i32 %mul2, ptr %f, align 4
  br label %if.end

if.else:                                          ; preds = %for.end
  %10 = load i32, ptr %e, align 4
  %11 = load i32, ptr %b, align 4
  %div = sdiv i32 %10, %11
  store i32 %div, ptr %e, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  ret void
}

attributes #0 = { noinline nounwind optnone ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 2, !"SDK Version", [2 x i32] [i32 15, i32 2]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 8, !"PIC Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 1}
!5 = !{!"Homebrew clang version 19.1.7"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
