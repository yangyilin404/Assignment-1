; ModuleID = 'Test-Cases/branch.c'
source_filename = "Test-Cases/branch.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0) #0 !dbg !10 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 0, ptr %2, align 4
  store i32 %0, ptr %3, align 4
  call void @llvm.dbg.declare(metadata ptr %3, metadata !15, metadata !DIExpression()), !dbg !16
  call void @llvm.dbg.declare(metadata ptr %4, metadata !17, metadata !DIExpression()), !dbg !18
  %5 = load i32, ptr %3, align 4, !dbg !19
  %6 = icmp sgt i32 %5, 10, !dbg !21
  br i1 %6, label %7, label %10, !dbg !22

7:                                                ; preds = %1
  %8 = load i32, ptr %3, align 4, !dbg !23
  %9 = add nsw i32 %8, 1, !dbg !24
  store i32 %9, ptr %4, align 4, !dbg !25
  br label %11, !dbg !26

10:                                               ; preds = %1
  store i32 10, ptr %4, align 4, !dbg !27
  br label %11

11:                                               ; preds = %10, %7
  %12 = load i32, ptr %4, align 4, !dbg !28
  %13 = load i32, ptr %3, align 4, !dbg !29
  %14 = add nsw i32 %13, 1, !dbg !30
  %15 = icmp sge i32 %12, %14, !dbg !31
  call void @svf_assert(i1 noundef zeroext %15), !dbg !32
  %16 = load i32, ptr %2, align 4, !dbg !33
  ret i32 %16, !dbg !33
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @svf_assert(i1 noundef zeroext) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7, !8}
!llvm.ident = !{!9}

!0 = distinct !DICompileUnit(language: DW_LANG_C11, file: !1, producer: "clang version 16.0.4 (https://github.com/bjjwwang/LLVM-compile 2259018fffaba36b5e50dce52fb5aa97b417ce4f)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "Test-Cases/branch.c", directory: "/home/yyl/SA-BIT2026-SVF-video/Assignment-1/Assignment-1-IR", checksumkind: CSK_MD5, checksum: "a590f03cd6b66b2793385cea91dee08c")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 8, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"uwtable", i32 2}
!8 = !{i32 7, !"frame-pointer", i32 2}
!9 = !{!"clang version 16.0.4 (https://github.com/bjjwwang/LLVM-compile 2259018fffaba36b5e50dce52fb5aa97b417ce4f)"}
!10 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 4, type: !11, scopeLine: 4, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !14)
!11 = !DISubroutineType(types: !12)
!12 = !{!13, !13}
!13 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!14 = !{}
!15 = !DILocalVariable(name: "x", arg: 1, scope: !10, file: !1, line: 4, type: !13)
!16 = !DILocation(line: 4, column: 14, scope: !10)
!17 = !DILocalVariable(name: "y", scope: !10, file: !1, line: 5, type: !13)
!18 = !DILocation(line: 5, column: 6, scope: !10)
!19 = !DILocation(line: 6, column: 5, scope: !20)
!20 = distinct !DILexicalBlock(scope: !10, file: !1, line: 6, column: 5)
!21 = !DILocation(line: 6, column: 7, scope: !20)
!22 = !DILocation(line: 6, column: 5, scope: !10)
!23 = !DILocation(line: 7, column: 7, scope: !20)
!24 = !DILocation(line: 7, column: 9, scope: !20)
!25 = !DILocation(line: 7, column: 5, scope: !20)
!26 = !DILocation(line: 7, column: 3, scope: !20)
!27 = !DILocation(line: 9, column: 5, scope: !20)
!28 = !DILocation(line: 10, column: 13, scope: !10)
!29 = !DILocation(line: 10, column: 16, scope: !10)
!30 = !DILocation(line: 10, column: 17, scope: !10)
!31 = !DILocation(line: 10, column: 14, scope: !10)
!32 = !DILocation(line: 10, column: 2, scope: !10)
!33 = !DILocation(line: 11, column: 1, scope: !10)
