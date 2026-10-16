; ModuleID = 'Test-Cases/demo.c'
source_filename = "Test-Cases/demo.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@tgetstr.initstr = internal global [25 x i8] c"select* From City ..\00\00\00\00\00", align 16, !dbg !0

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @tgetstr() #0 !dbg !2 {
  ret ptr @tgetstr.initstr, !dbg !22
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 !dbg !23 {
  %1 = alloca i32, align 4
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca [5 x i32], align 16
  %8 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  call void @llvm.dbg.declare(metadata ptr %2, metadata !27, metadata !DIExpression()), !dbg !28
  %9 = call ptr @tgetstr(), !dbg !29
  store ptr %9, ptr %2, align 8, !dbg !28
  call void @llvm.dbg.declare(metadata ptr %3, metadata !30, metadata !DIExpression()), !dbg !31
  %10 = load ptr, ptr %2, align 8, !dbg !32
  store ptr %10, ptr %3, align 8, !dbg !31
  call void @llvm.dbg.declare(metadata ptr %4, metadata !33, metadata !DIExpression()), !dbg !34
  %11 = load ptr, ptr %3, align 8, !dbg !35
  store ptr %11, ptr %4, align 8, !dbg !34
  %12 = load ptr, ptr %4, align 8, !dbg !36
  call void @broadcast(ptr noundef %12), !dbg !37
  call void @llvm.dbg.declare(metadata ptr %5, metadata !38, metadata !DIExpression()), !dbg !40
  call void @llvm.dbg.declare(metadata ptr %6, metadata !41, metadata !DIExpression()), !dbg !42
  store i32 1, ptr %6, align 4, !dbg !42
  store ptr %6, ptr %5, align 8, !dbg !43
  %13 = load ptr, ptr %5, align 8, !dbg !44
  store i32 3, ptr %13, align 4, !dbg !45
  %14 = load i32, ptr %6, align 4, !dbg !46
  %15 = icmp eq i32 %14, 3, !dbg !47
  call void @svf_assert(i1 noundef zeroext %15), !dbg !48
  call void @llvm.dbg.declare(metadata ptr %7, metadata !49, metadata !DIExpression()), !dbg !53
  call void @llvm.dbg.declare(metadata ptr %8, metadata !54, metadata !DIExpression()), !dbg !55
  store i32 0, ptr %8, align 4, !dbg !55
  br label %16, !dbg !56

16:                                               ; preds = %19, %0
  %17 = load i32, ptr %8, align 4, !dbg !57
  %18 = icmp slt i32 %17, 5, !dbg !58
  br i1 %18, label %19, label %24, !dbg !56

19:                                               ; preds = %16
  %20 = load i32, ptr %8, align 4, !dbg !59
  %21 = add nsw i32 %20, 1, !dbg !59
  store i32 %21, ptr %8, align 4, !dbg !59
  %22 = sext i32 %21 to i64, !dbg !61
  %23 = getelementptr inbounds [5 x i32], ptr %7, i64 0, i64 %22, !dbg !61
  store i32 10, ptr %23, align 4, !dbg !62
  br label %16, !dbg !56, !llvm.loop !63

24:                                               ; preds = %16
  ret i32 0, !dbg !66
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare void @broadcast(ptr noundef) #2

declare void @svf_assert(i1 noundef zeroext) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!8}
!llvm.module.flags = !{!14, !15, !16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "initstr", scope: !2, file: !3, line: 9, type: !11, isLocal: true, isDefinition: true)
!2 = distinct !DISubprogram(name: "tgetstr", scope: !3, file: !3, line: 7, type: !4, scopeLine: 7, spFlags: DISPFlagDefinition, unit: !8, retainedNodes: !10)
!3 = !DIFile(filename: "Test-Cases/demo.c", directory: "/home/yyl/SA-BIT2026-SVF-video/Assignment-1/Assignment-1-IR", checksumkind: CSK_MD5, checksum: "cdd10c41d4dbbe45ab3a2151f745700c")
!4 = !DISubroutineType(types: !5)
!5 = !{!6}
!6 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "clang version 16.0.4 (https://github.com/bjjwwang/LLVM-compile 2259018fffaba36b5e50dce52fb5aa97b417ce4f)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, globals: !9, splitDebugInlining: false, nameTableKind: None)
!9 = !{!0}
!10 = !{}
!11 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 200, elements: !12)
!12 = !{!13}
!13 = !DISubrange(count: 25)
!14 = !{i32 7, !"Dwarf Version", i32 5}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 8, !"PIC Level", i32 2}
!18 = !{i32 7, !"PIE Level", i32 2}
!19 = !{i32 7, !"uwtable", i32 2}
!20 = !{i32 7, !"frame-pointer", i32 2}
!21 = !{!"clang version 16.0.4 (https://github.com/bjjwwang/LLVM-compile 2259018fffaba36b5e50dce52fb5aa97b417ce4f)"}
!22 = !DILocation(line: 10, column: 5, scope: !2)
!23 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 16, type: !24, scopeLine: 16, spFlags: DISPFlagDefinition, unit: !8, retainedNodes: !10)
!24 = !DISubroutineType(types: !25)
!25 = !{!26}
!26 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!27 = !DILocalVariable(name: "injection", scope: !23, file: !3, line: 19, type: !6)
!28 = !DILocation(line: 19, column: 11, scope: !23)
!29 = !DILocation(line: 19, column: 23, scope: !23)
!30 = !DILocalVariable(name: "s", scope: !23, file: !3, line: 20, type: !6)
!31 = !DILocation(line: 20, column: 11, scope: !23)
!32 = !DILocation(line: 20, column: 15, scope: !23)
!33 = !DILocalVariable(name: "b", scope: !23, file: !3, line: 21, type: !6)
!34 = !DILocation(line: 21, column: 11, scope: !23)
!35 = !DILocation(line: 21, column: 15, scope: !23)
!36 = !DILocation(line: 22, column: 15, scope: !23)
!37 = !DILocation(line: 22, column: 5, scope: !23)
!38 = !DILocalVariable(name: "p", scope: !23, file: !3, line: 25, type: !39)
!39 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !26, size: 64)
!40 = !DILocation(line: 25, column: 10, scope: !23)
!41 = !DILocalVariable(name: "a", scope: !23, file: !3, line: 26, type: !26)
!42 = !DILocation(line: 26, column: 9, scope: !23)
!43 = !DILocation(line: 27, column: 7, scope: !23)
!44 = !DILocation(line: 28, column: 6, scope: !23)
!45 = !DILocation(line: 28, column: 8, scope: !23)
!46 = !DILocation(line: 29, column: 16, scope: !23)
!47 = !DILocation(line: 29, column: 18, scope: !23)
!48 = !DILocation(line: 29, column: 5, scope: !23)
!49 = !DILocalVariable(name: "arr", scope: !23, file: !3, line: 32, type: !50)
!50 = !DICompositeType(tag: DW_TAG_array_type, baseType: !26, size: 160, elements: !51)
!51 = !{!52}
!52 = !DISubrange(count: 5)
!53 = !DILocation(line: 32, column: 9, scope: !23)
!54 = !DILocalVariable(name: "i", scope: !23, file: !3, line: 33, type: !26)
!55 = !DILocation(line: 33, column: 9, scope: !23)
!56 = !DILocation(line: 34, column: 5, scope: !23)
!57 = !DILocation(line: 34, column: 11, scope: !23)
!58 = !DILocation(line: 34, column: 13, scope: !23)
!59 = !DILocation(line: 35, column: 10, scope: !60)
!60 = distinct !DILexicalBlock(scope: !23, file: !3, line: 34, column: 18)
!61 = !DILocation(line: 35, column: 6, scope: !60)
!62 = !DILocation(line: 35, column: 14, scope: !60)
!63 = distinct !{!63, !56, !64, !65}
!64 = !DILocation(line: 36, column: 5, scope: !23)
!65 = !{!"llvm.loop.mustprogress"}
!66 = !DILocation(line: 38, column: 5, scope: !23)
