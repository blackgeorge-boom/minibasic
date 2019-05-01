; ModuleID = 'minibasic program'
source_filename = "minibasic program"

@vars = private global [26 x i32] zeroinitializer, align 16
@nl = private constant [2 x i8] c"\0A\00", align 1

declare void @writeInteger(i64)

declare void @writeString(i8*)

define i32 @main() {
entry:
  store i32 0, i32* getelementptr inbounds ([26 x i32], [26 x i32]* @vars, i64 0, i64 23), align 4
  br label %loop

loop:                                             ; preds = %inside, %entry
  %iter = phi i32 [ 42, %entry ], [ %remaining, %inside ]
  %loop_cond = icmp sgt i32 %iter, 0
  br i1 %loop_cond, label %inside, label %after

inside:                                           ; preds = %loop
  %remaining = add i32 %iter, -1
  %x = load i32, i32* getelementptr inbounds ([26 x i32], [26 x i32]* @vars, i64 0, i64 23), align 4
  %addtmp = add i32 %x, 1
  store i32 %addtmp, i32* getelementptr inbounds ([26 x i32], [26 x i32]* @vars, i64 0, i64 23), align 4
  %ext = zext i32 %addtmp to i64
  call void @writeInteger(i64 %ext)
  call void @writeString(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @nl, i64 0, i64 0))
  br label %loop

after:                                            ; preds = %loop
  ret i32 0
}
