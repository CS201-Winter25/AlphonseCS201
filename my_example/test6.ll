; ModuleID = 'my_example/test6.c'
source_filename = "my_example/test6.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-macosx15.0.0"

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define void @test6(i32 noundef %c, i32 noundef %d, i32 noundef %e, i32 noundef %i, i32 noundef %j) #0 {
entry:
  %c.addr = alloca i32, align 4
  %d.addr = alloca i32, align 4
  %e.addr = alloca i32, align 4
  %i.addr = alloca i32, align 4
  %j.addr = alloca i32, align 4
  %a = alloca i32, align 4
  %b = alloca i32, align 4
  %t1 = alloca i32, align 4
  %t2 = alloca i32, align 4
  %t3 = alloca i32, align 4
  %t4 = alloca i32, align 4
  store i32 %c, ptr %c.addr, align 4
  store i32 %d, ptr %d.addr, align 4
  store i32 %e, ptr %e.addr, align 4
  store i32 %i, ptr %i.addr, align 4
  store i32 %j, ptr %j.addr, align 4
  store i32 10, ptr %a, align 4
  store i32 40, ptr %b, align 4
  %0 = load i32, ptr %i.addr, align 4
  %1 = load i32, ptr %j.addr, align 4
  %mul = mul nsw i32 %0, %1
  store i32 %mul, ptr %t1, align 4
  %2 = load i32, ptr %t1, align 4
  %add = add nsw i32 %2, 40
  store i32 %add, ptr %c.addr, align 4
  store i32 150, ptr %t2, align 4
  %3 = load i32, ptr %c.addr, align 4
  %mul1 = mul nsw i32 150, %3
  store i32 %mul1, ptr %d.addr, align 4
  %4 = load i32, ptr %i.addr, align 4
  store i32 %4, ptr %e.addr, align 4
  %5 = load i32, ptr %i.addr, align 4
  %6 = load i32, ptr %j.addr, align 4
  %mul2 = mul nsw i32 %5, %6
  store i32 %mul2, ptr %t3, align 4
  %7 = load i32, ptr %i.addr, align 4
  %mul3 = mul nsw i32 %7, 10
  store i32 %mul3, ptr %t4, align 4
  %8 = load i32, ptr %t1, align 4
  %9 = load i32, ptr %t4, align 4
  %add4 = add nsw i32 %8, %9
  store i32 %add4, ptr %c.addr, align 4
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
