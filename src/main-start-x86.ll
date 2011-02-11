target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:32"
target triple = "i386-unknown-linux-gnu"
%A.148603128 = type {i8, i8, i8, i8}
%A.148602984 = type {%A.148603128, i8, i8, i8, i8}
@debug = global %A.148602984 zeroinitializer, align 1
%A.148603888 = type {i8, i8, i8, i8, i8}
@feature = global %A.148603888 zeroinitializer, align 1
define [0 x i8]* @sys_zalloc(i32 %nbytes.arg) nounwind {
L.0:
	%rv.0 = alloca [0 x i8]*
	%nbytes = alloca i32
	store i32 %nbytes.arg, i32* %nbytes
	%ptr = alloca [0 x i8]*
	%0 = load i32* %nbytes
	%1 = call [0 x i8]* @malloc(i32 %0)
	store [0 x i8]* %1, [0 x i8]** %ptr
	%2 = load [0 x i8]** %ptr
	%3 = load i32* %nbytes
	call void @memset([0 x i8]* %2, i32 0, i32 %3)
	%4 = load [0 x i8]** %ptr
	store [0 x i8]* %4, [0 x i8]** %rv.0
	br label %return
return:
	%5 = load [0 x i8]** %rv.0
	ret [0 x i8]* %5
}
define [0 x i8]* @sys_memdup([0 x i8]* %fm.arg, i32 %len.arg) nounwind {
L.0:
	%rv.0 = alloca [0 x i8]*
	%fm = alloca [0 x i8]*
	%len = alloca i32
	store [0 x i8]* %fm.arg, [0 x i8]** %fm
	store i32 %len.arg, i32* %len
	%ptr = alloca [0 x i8]*
	%0 = load i32* %len
	%1 = call [0 x i8]* @malloc(i32 %0)
	store [0 x i8]* %1, [0 x i8]** %ptr
	%2 = load [0 x i8]** %ptr
	%3 = load [0 x i8]** %fm
	%4 = load i32* %len
	call void @memcpy([0 x i8]* %2, [0 x i8]* %3, i32 %4)
	%5 = load [0 x i8]** %ptr
	store [0 x i8]* %5, [0 x i8]** %rv.0
	br label %return
return:
	%6 = load [0 x i8]** %rv.0
	ret [0 x i8]* %6
}
define zeroext i8 @zstr_eq([0 x i8]* %s1.arg, [0 x i8]* %s2.arg, i32 %max.arg) nounwind {
L.0:
	%rv.0 = alloca i8
	%s1 = alloca [0 x i8]*
	%s2 = alloca [0 x i8]*
	%max = alloca i32
	store [0 x i8]* %s1.arg, [0 x i8]** %s1
	store [0 x i8]* %s2.arg, [0 x i8]** %s2
	store i32 %max.arg, i32* %max
	%i = alloca i32
	store i32 0, i32* %i
	br label %L.1
L.1:
	%0 = load i32* %i
	%1 = load i32* %max
	%2 = icmp ult i32 %0, %1
	br i1 %2, label %L.4, label %L.5
L.4:
	%3 = load [0 x i8]** %s1
	%4 = load i32* %i
	%5 = getelementptr [0 x i8]* %3, i32 0, i32 %4
	%6 = load i8* %5
	%7 = load [0 x i8]** %s2
	%8 = load i32* %i
	%9 = getelementptr [0 x i8]* %7, i32 0, i32 %8
	%10 = load i8* %9
	%11 = icmp eq i8 %6, %10
	br label %L.5
L.5:
	%12 = phi i1 [ false, %L.1 ], [ %11, %L.4 ]
	%13 = xor i1 %12, true
	br i1 %13, label %L.2, label %L.3
L.3:
	%14 = load [0 x i8]** %s1
	%15 = load i32* %i
	%16 = getelementptr [0 x i8]* %14, i32 0, i32 %15
	%17 = load i8* %16
	%18 = icmp eq i8 %17, 0
	br i1 %18, label %L.7, label %L.6
L.7:
	store i8 1, i8* %rv.0
	br label %return
L.6:
	%19 = load i32* %i
	%20 = add i32 %19, 1
	store i32 %20, i32* %i
	br label %L.1
L.2:
	store i8 0, i8* %rv.0
	br label %return
return:
	%21 = load i8* %rv.0
	ret i8 %21
}
define i32 @zstr_len([0 x i8]* %s.arg, i32 %max.arg) nounwind {
L.0:
	%rv.0 = alloca i32
	%s = alloca [0 x i8]*
	%max = alloca i32
	store [0 x i8]* %s.arg, [0 x i8]** %s
	store i32 %max.arg, i32* %max
	%i = alloca i32
	store i32 0, i32* %i
	br label %L.1
L.1:
	%0 = load i32* %i
	%1 = load i32* %max
	%2 = icmp ult i32 %0, %1
	br i1 %2, label %L.4, label %L.5
L.4:
	%3 = load [0 x i8]** %s
	%4 = load i32* %i
	%5 = getelementptr [0 x i8]* %3, i32 0, i32 %4
	%6 = load i8* %5
	%7 = icmp ne i8 %6, 0
	br label %L.5
L.5:
	%8 = phi i1 [ false, %L.1 ], [ %7, %L.4 ]
	%9 = xor i1 %8, true
	br i1 %9, label %L.2, label %L.3
L.3:
	%10 = load i32* %i
	%11 = add i32 %10, 1
	store i32 %11, i32* %i
	br label %L.1
L.2:
	%12 = load i32* %i
	store i32 %12, i32* %rv.0
	br label %return
return:
	%13 = load i32* %rv.0
	ret i32 %13
}
define i32 @zstr_find([0 x i8]* %s.arg, i8 zeroext %c.arg, i32 %max.arg) nounwind {
L.0:
	%rv.0 = alloca i32
	%s = alloca [0 x i8]*
	%c = alloca i8
	%max = alloca i32
	store [0 x i8]* %s.arg, [0 x i8]** %s
	store i8 %c.arg, i8* %c
	store i32 %max.arg, i32* %max
	%i = alloca i32
	store i32 0, i32* %i
	br label %L.1
L.1:
	%0 = load i32* %i
	%1 = load i32* %max
	%2 = icmp ult i32 %0, %1
	br i1 %2, label %L.6, label %L.7
L.6:
	%3 = load [0 x i8]** %s
	%4 = load i32* %i
	%5 = getelementptr [0 x i8]* %3, i32 0, i32 %4
	%6 = load i8* %5
	%7 = load i8* %c
	%8 = icmp ne i8 %6, %7
	br label %L.7
L.7:
	%9 = phi i1 [ false, %L.1 ], [ %8, %L.6 ]
	br i1 %9, label %L.4, label %L.5
L.4:
	%10 = load [0 x i8]** %s
	%11 = load i32* %i
	%12 = getelementptr [0 x i8]* %10, i32 0, i32 %11
	%13 = load i8* %12
	%14 = icmp ne i8 %13, 0
	br label %L.5
L.5:
	%15 = phi i1 [ false, %L.7 ], [ %14, %L.4 ]
	%16 = xor i1 %15, true
	br i1 %16, label %L.2, label %L.3
L.3:
	%17 = load i32* %i
	%18 = add i32 %17, 1
	store i32 %18, i32* %i
	br label %L.1
L.2:
	%19 = load i32* %i
	store i32 %19, i32* %rv.0
	br label %return
return:
	%20 = load i32* %rv.0
	ret i32 %20
}
define i32 @zstr_rfind([0 x i8]* %s.arg, i8 zeroext %c.arg, i32 %max.arg) nounwind {
L.0:
	%rv.0 = alloca i32
	%s = alloca [0 x i8]*
	%c = alloca i8
	%max = alloca i32
	store [0 x i8]* %s.arg, [0 x i8]** %s
	store i8 %c.arg, i8* %c
	store i32 %max.arg, i32* %max
	%i = alloca i32
	%0 = load [0 x i8]** %s
	%1 = load i32* %max
	%2 = call i32 @zstr_len([0 x i8]* %0, i32 %1)
	store i32 %2, i32* %i
	br label %L.1
L.1:
	%3 = load [0 x i8]** %s
	%4 = load i32* %i
	%5 = getelementptr [0 x i8]* %3, i32 0, i32 %4
	%6 = load i8* %5
	%7 = load i8* %c
	%8 = icmp ne i8 %6, %7
	%9 = xor i1 %8, true
	br i1 %9, label %L.2, label %L.3
L.3:
	%10 = load i32* %i
	%11 = icmp eq i32 %10, 0
	br i1 %11, label %L.5, label %L.4
L.5:
	%12 = load i32* %max
	store i32 %12, i32* %i
	br label %L.2
L.4:
	%13 = load i32* %i
	%14 = sub i32 %13, 1
	store i32 %14, i32* %i
	br label %L.1
L.2:
	%15 = load i32* %i
	store i32 %15, i32* %rv.0
	br label %return
return:
	%16 = load i32* %rv.0
	ret i32 %16
}
define void @zstr_copy([0 x i8]* %to.arg, [0 x i8]* %fm.arg, i32 %max.arg) nounwind {
L.0:
	%to = alloca [0 x i8]*
	%fm = alloca [0 x i8]*
	%max = alloca i32
	store [0 x i8]* %to.arg, [0 x i8]** %to
	store [0 x i8]* %fm.arg, [0 x i8]** %fm
	store i32 %max.arg, i32* %max
	%i = alloca i32
	store i32 0, i32* %i
	br label %L.1
L.1:
	%0 = load i32* %i
	%1 = load i32* %max
	%2 = icmp ult i32 %0, %1
	%3 = xor i1 %2, true
	br i1 %3, label %L.2, label %L.3
L.3:
	%4 = load [0 x i8]** %fm
	%5 = load i32* %i
	%6 = getelementptr [0 x i8]* %4, i32 0, i32 %5
	%7 = load i8* %6
	%8 = load [0 x i8]** %to
	%9 = load i32* %i
	%10 = getelementptr [0 x i8]* %8, i32 0, i32 %9
	store i8 %7, i8* %10
	%11 = load [0 x i8]** %fm
	%12 = load i32* %i
	%13 = getelementptr [0 x i8]* %11, i32 0, i32 %12
	%14 = load i8* %13
	%15 = icmp eq i8 %14, 0
	br i1 %15, label %L.2, label %L.4
L.4:
	%16 = load i32* %i
	%17 = add i32 %16, 1
	store i32 %17, i32* %i
	br label %L.1
L.2:
	br label %return
return:
	ret void
}
define void @zstr_cat([0 x i8]* %to.arg, [0 x i8]* %fm.arg, i32 %max.arg) nounwind {
L.0:
	%to = alloca [0 x i8]*
	%fm = alloca [0 x i8]*
	%max = alloca i32
	store [0 x i8]* %to.arg, [0 x i8]** %to
	store [0 x i8]* %fm.arg, [0 x i8]** %fm
	store i32 %max.arg, i32* %max
	%i = alloca i32
	%j = alloca i32
	%0 = load [0 x i8]** %to
	%1 = load i32* %max
	%2 = call i32 @zstr_len([0 x i8]* %0, i32 %1)
	store i32 %2, i32* %i
	store i32 0, i32* %j
	br label %L.1
L.1:
	%3 = load i32* %i
	%4 = load i32* %max
	%5 = icmp ult i32 %3, %4
	%6 = xor i1 %5, true
	br i1 %6, label %L.2, label %L.3
L.3:
	%7 = load [0 x i8]** %fm
	%8 = load i32* %j
	%9 = getelementptr [0 x i8]* %7, i32 0, i32 %8
	%10 = load i8* %9
	%11 = load [0 x i8]** %to
	%12 = load i32* %i
	%13 = getelementptr [0 x i8]* %11, i32 0, i32 %12
	store i8 %10, i8* %13
	%14 = load [0 x i8]** %fm
	%15 = load i32* %j
	%16 = getelementptr [0 x i8]* %14, i32 0, i32 %15
	%17 = load i8* %16
	%18 = icmp eq i8 %17, 0
	br i1 %18, label %L.2, label %L.4
L.4:
	%19 = load i32* %i
	%20 = add i32 %19, 1
	store i32 %20, i32* %i
	%21 = load i32* %j
	%22 = add i32 %21, 1
	store i32 %22, i32* %j
	br label %L.1
L.2:
	br label %return
return:
	ret void
}
define void @out_nl(i32 %chan.arg) nounwind {
L.0:
	%chan = alloca i32
	store i32 %chan.arg, i32* %chan
	%0 = load i32* %chan
	%1 = getelementptr [2 x i8]* @.str1
	%2 = bitcast [2 x i8]* %1 to [0 x i8]*
	%3 = call i32 @write(i32 %0, [0 x i8]* %2, i32 1)
	br label %return
return:
	ret void
}
define void @out_chr(i32 %chan.arg, i8 zeroext %c.arg) nounwind {
L.0:
	%chan = alloca i32
	%c = alloca i8
	store i32 %chan.arg, i32* %chan
	store i8 %c.arg, i8* %c
	%buf = alloca [1 x i8]
	%0 = load i8* %c
	%1 = getelementptr [1 x i8]* %buf, i32 0, i32 0
	store i8 %0, i8* %1
	%2 = load i32* %chan
	%3 = getelementptr [1 x i8]* %buf
	%4 = bitcast [1 x i8]* %3 to [0 x i8]*
	%5 = call i32 @write(i32 %2, [0 x i8]* %4, i32 1)
	br label %return
return:
	ret void
}
define void @out_str(i32 %chan.arg, [0 x i8]* %s.arg) nounwind {
L.0:
	%chan = alloca i32
	%s = alloca [0 x i8]*
	store i32 %chan.arg, i32* %chan
	store [0 x i8]* %s.arg, [0 x i8]** %s
	%len = alloca i32
	%0 = load [0 x i8]** %s
	%1 = bitcast [0 x i8]* %0 to [0 x i8]*
	%2 = call i32 @zstr_len([0 x i8]* %1, i32 65535)
	store i32 %2, i32* %len
	%3 = load i32* %chan
	%4 = load [0 x i8]** %s
	%5 = bitcast [0 x i8]* %4 to [0 x i8]*
	%6 = load i32* %len
	%7 = call i32 @write(i32 %3, [0 x i8]* %5, i32 %6)
	br label %return
return:
	ret void
}
define void @out_strn(i32 %chan.arg, [0 x i8]* %s.arg, i32 %len.arg) nounwind {
L.0:
	%chan = alloca i32
	%s = alloca [0 x i8]*
	%len = alloca i32
	store i32 %chan.arg, i32* %chan
	store [0 x i8]* %s.arg, [0 x i8]** %s
	store i32 %len.arg, i32* %len
	%0 = load i32* %chan
	%1 = load [0 x i8]** %s
	%2 = bitcast [0 x i8]* %1 to [0 x i8]*
	%3 = load i32* %len
	%4 = call i32 @write(i32 %0, [0 x i8]* %2, i32 %3)
	br label %return
return:
	ret void
}
@out_hex = internal constant [16 x i8] [ i8 48, i8 49, i8 50, i8 51, i8 52, i8 53, i8 54, i8 55, i8 56, i8 57, i8 65, i8 66, i8 67, i8 68, i8 69, i8 70 ], align 1
define void @out_hex8(i32 %chan.arg, i8 zeroext %in.arg) nounwind {
L.0:
	%chan = alloca i32
	%in = alloca i8
	store i32 %chan.arg, i32* %chan
	store i8 %in.arg, i8* %in
	%buf = alloca [2 x i8]
	%0 = load i8* %in
	%1 = lshr i8 %0, 4
	%2 = and i8 %1, 15
	%3 = zext i8 %2 to i32
	%4 = getelementptr [16 x i8]* @out_hex, i32 0, i32 %3
	%5 = load i8* %4
	%6 = getelementptr [2 x i8]* %buf, i32 0, i32 0
	store i8 %5, i8* %6
	%7 = load i8* %in
	%8 = and i8 %7, 15
	%9 = zext i8 %8 to i32
	%10 = getelementptr [16 x i8]* @out_hex, i32 0, i32 %9
	%11 = load i8* %10
	%12 = getelementptr [2 x i8]* %buf, i32 0, i32 1
	store i8 %11, i8* %12
	%13 = load i32* %chan
	%14 = getelementptr [2 x i8]* %buf
	%15 = bitcast [2 x i8]* %14 to [0 x i8]*
	%16 = call i32 @write(i32 %13, [0 x i8]* %15, i32 2)
	br label %return
return:
	ret void
}
define void @out_hex16(i32 %chan.arg, i16 zeroext %in.arg) nounwind {
L.0:
	%chan = alloca i32
	%in = alloca i16
	store i32 %chan.arg, i32* %chan
	store i16 %in.arg, i16* %in
	%buf = alloca [4 x i8]
	%0 = load i16* %in
	%1 = lshr i16 %0, 12
	%2 = and i16 %1, 15
	%3 = zext i16 %2 to i32
	%4 = getelementptr [16 x i8]* @out_hex, i32 0, i32 %3
	%5 = load i8* %4
	%6 = getelementptr [4 x i8]* %buf, i32 0, i32 0
	store i8 %5, i8* %6
	%7 = load i16* %in
	%8 = lshr i16 %7, 8
	%9 = and i16 %8, 15
	%10 = zext i16 %9 to i32
	%11 = getelementptr [16 x i8]* @out_hex, i32 0, i32 %10
	%12 = load i8* %11
	%13 = getelementptr [4 x i8]* %buf, i32 0, i32 1
	store i8 %12, i8* %13
	%14 = load i16* %in
	%15 = lshr i16 %14, 4
	%16 = and i16 %15, 15
	%17 = zext i16 %16 to i32
	%18 = getelementptr [16 x i8]* @out_hex, i32 0, i32 %17
	%19 = load i8* %18
	%20 = getelementptr [4 x i8]* %buf, i32 0, i32 2
	store i8 %19, i8* %20
	%21 = load i16* %in
	%22 = and i16 %21, 15
	%23 = zext i16 %22 to i32
	%24 = getelementptr [16 x i8]* @out_hex, i32 0, i32 %23
	%25 = load i8* %24
	%26 = getelementptr [4 x i8]* %buf, i32 0, i32 3
	store i8 %25, i8* %26
	%27 = load i32* %chan
	%28 = getelementptr [4 x i8]* %buf
	%29 = bitcast [4 x i8]* %28 to [0 x i8]*
	%30 = call i32 @write(i32 %27, [0 x i8]* %29, i32 4)
	br label %return
return:
	ret void
}
define void @out_hex32(i32 %chan.arg, i32 %in.arg) nounwind {
L.0:
	%chan = alloca i32
	%in = alloca i32
	store i32 %chan.arg, i32* %chan
	store i32 %in.arg, i32* %in
	%buf = alloca [8 x i8]
	%i = alloca i8
	store i8 7, i8* %i
	br label %L.1
L.1:
	%0 = load i32* %in
	%1 = and i32 %0, 15
	%2 = getelementptr [16 x i8]* @out_hex, i32 0, i32 %1
	%3 = load i8* %2
	%4 = load i8* %i
	%5 = zext i8 %4 to i32
	%6 = getelementptr [8 x i8]* %buf, i32 0, i32 %5
	store i8 %3, i8* %6
	%7 = load i8* %i
	%8 = icmp eq i8 %7, 0
	br i1 %8, label %L.2, label %L.3
L.3:
	%9 = load i8* %i
	%10 = sub i8 %9, 1
	store i8 %10, i8* %i
	%11 = load i32* %in
	%12 = lshr i32 %11, 4
	store i32 %12, i32* %in
	br label %L.1
L.2:
	%13 = load i32* %chan
	%14 = getelementptr [8 x i8]* %buf
	%15 = bitcast [8 x i8]* %14 to [0 x i8]*
	%16 = call i32 @write(i32 %13, [0 x i8]* %15, i32 8)
	br label %return
return:
	ret void
}
define void @out_hex64(i32 %chan.arg, i64 %in.arg) nounwind {
L.0:
	%chan = alloca i32
	%in = alloca i64
	store i32 %chan.arg, i32* %chan
	store i64 %in.arg, i64* %in
	%buf = alloca [16 x i8]
	%i = alloca i8
	store i8 15, i8* %i
	br label %L.1
L.1:
	%0 = load i64* %in
	%1 = and i64 %0, 15
	%2 = trunc i64 %1 to i32
	%3 = getelementptr [16 x i8]* @out_hex, i32 0, i32 %2
	%4 = load i8* %3
	%5 = load i8* %i
	%6 = zext i8 %5 to i32
	%7 = getelementptr [16 x i8]* %buf, i32 0, i32 %6
	store i8 %4, i8* %7
	%8 = load i8* %i
	%9 = icmp eq i8 %8, 0
	br i1 %9, label %L.2, label %L.3
L.3:
	%10 = load i8* %i
	%11 = sub i8 %10, 1
	store i8 %11, i8* %i
	%12 = load i64* %in
	%13 = lshr i64 %12, 4
	store i64 %13, i64* %in
	br label %L.1
L.2:
	%14 = load i32* %chan
	%15 = getelementptr [16 x i8]* %buf
	%16 = bitcast [16 x i8]* %15 to [0 x i8]*
	%17 = call i32 @write(i32 %14, [0 x i8]* %16, i32 16)
	br label %return
return:
	ret void
}
@out_digits32 = internal constant [35 x i32] [ i32 4000000000, i32 2000000000, i32 1000000000, i32 500000000, i32 400000000, i32 200000000, i32 100000000, i32 50000000, i32 40000000, i32 20000000, i32 10000000, i32 5000000, i32 4000000, i32 2000000, i32 1000000, i32 500000, i32 400000, i32 200000, i32 100000, i32 50000, i32 40000, i32 20000, i32 10000, i32 5000, i32 4000, i32 2000, i32 1000, i32 500, i32 400, i32 200, i32 100, i32 50, i32 40, i32 20, i32 10 ], align 4
define void @out_uint32(i32 %chan.arg, i32 %in.arg) nounwind {
L.0:
	%chan = alloca i32
	%in = alloca i32
	store i32 %chan.arg, i32* %chan
	store i32 %in.arg, i32* %in
	%buf = alloca [11 x i8]
	%i = alloca i8
	%c = alloca i8
	%j = alloca i8
	%n = alloca i32
	%prefix = alloca i8
	store i32 0, i32* %n
	store i8 1, i8* %prefix
	store i8 4, i8* %j
	store i8 0, i8* %c
	store i8 0, i8* %i
	br label %L.1
L.1:
	%0 = load i8* %i
	%1 = icmp ult i8 %0, 35
	%2 = xor i1 %1, true
	br i1 %2, label %L.2, label %L.3
L.3:
	%3 = load i8* %i
	%4 = zext i8 %3 to i32
	%5 = getelementptr [35 x i32]* @out_digits32, i32 0, i32 %4
	%6 = load i32* %5
	%7 = load i32* %in
	%8 = icmp ule i32 %6, %7
	br i1 %8, label %L.5, label %L.4
L.5:
	%9 = load i32* %in
	%10 = load i8* %i
	%11 = zext i8 %10 to i32
	%12 = getelementptr [35 x i32]* @out_digits32, i32 0, i32 %11
	%13 = load i32* %12
	%14 = sub i32 %9, %13
	store i32 %14, i32* %in
	%15 = load i8* %c
	%16 = load i8* %j
	%17 = add i8 %15, %16
	store i8 %17, i8* %c
	br label %L.4
L.4:
	%18 = load i8* %j
	%19 = zext i8 %18 to i32
	switch i32 %19, label %L.6 [
		i32 5, label %L.8
		i32 4, label %L.9
		i32 2, label %L.10
		i32 1, label %L.11
	]
L.8:
	store i8 4, i8* %j
	br label %L.7
L.9:
	store i8 2, i8* %j
	br label %L.7
L.10:
	store i8 1, i8* %j
	br label %L.7
L.11:
	%20 = load i8* %c
	%21 = icmp ne i8 %20, 0
	br i1 %21, label %L.13, label %L.12
L.12:
	%22 = load i8* %prefix
	%23 = icmp ne i8 %22, 0
	%24 = xor i1 %23, true
	br label %L.13
L.13:
	%25 = phi i1 [ true, %L.11 ], [ %24, %L.12 ]
	br i1 %25, label %L.15, label %L.14
L.15:
	store i8 0, i8* %prefix
	%26 = load i8* %c
	%27 = add i8 %26, 48
	%28 = load i32* %n
	%29 = getelementptr [11 x i8]* %buf, i32 0, i32 %28
	store i8 %27, i8* %29
	%30 = load i32* %n
	%31 = add i32 %30, 1
	store i32 %31, i32* %n
	br label %L.14
L.14:
	store i8 0, i8* %c
	store i8 5, i8* %j
	br label %L.7
L.6:
	br label %L.7
L.7:
	%32 = load i8* %i
	%33 = add i8 %32, 1
	store i8 %33, i8* %i
	br label %L.1
L.2:
	%34 = load i32* %in
	%35 = add i32 %34, 48
	%36 = trunc i32 %35 to i8
	%37 = load i32* %n
	%38 = getelementptr [11 x i8]* %buf, i32 0, i32 %37
	store i8 %36, i8* %38
	%39 = load i32* %chan
	%40 = getelementptr [11 x i8]* %buf
	%41 = bitcast [11 x i8]* %40 to [0 x i8]*
	%42 = load i32* %n
	%43 = add i32 %42, 1
	%44 = call i32 @write(i32 %39, [0 x i8]* %41, i32 %43)
	br label %return
return:
	ret void
}
define void @out_int32(i32 %chan.arg, i32 %in.arg) nounwind {
L.0:
	%chan = alloca i32
	%in = alloca i32
	store i32 %chan.arg, i32* %chan
	store i32 %in.arg, i32* %in
	%ui = alloca i32
	%0 = load i32* %in
	%1 = icmp slt i32 %0, 0
	br i1 %1, label %L.2, label %L.3
L.2:
	%2 = load i32* %chan
	%3 = getelementptr [2 x i8]* @.str4
	%4 = bitcast [2 x i8]* %3 to [0 x i8]*
	%5 = call i32 @write(i32 %2, [0 x i8]* %4, i32 1)
	%6 = load i32* %in
	%7 = sub i32 0, %6
	store i32 %7, i32* %ui
	br label %L.1
L.3:
	%8 = load i32* %in
	store i32 %8, i32* %ui
	br label %L.1
L.1:
	%9 = load i32* %chan
	%10 = load i32* %ui
	call void @out_uint32(i32 %9, i32 %10)
	br label %return
return:
	ret void
}
define void @out_uint16(i32 %chan.arg, i16 zeroext %in.arg) alwaysinline nounwind {
L.0:
	%chan = alloca i32
	%in = alloca i16
	store i32 %chan.arg, i32* %chan
	store i16 %in.arg, i16* %in
	%0 = load i32* %chan
	%1 = load i16* %in
	%2 = zext i16 %1 to i32
	call void @out_uint32(i32 %0, i32 %2)
	br label %return
return:
	ret void
}
define void @out_int16(i32 %chan.arg, i16 signext %in.arg) alwaysinline nounwind {
L.0:
	%chan = alloca i32
	%in = alloca i16
	store i32 %chan.arg, i32* %chan
	store i16 %in.arg, i16* %in
	%0 = load i32* %chan
	%1 = load i16* %in
	%2 = sext i16 %1 to i32
	call void @out_int32(i32 %0, i32 %2)
	br label %return
return:
	ret void
}
define void @out_uint64(i32 %chan.arg, i64 %in.arg) nounwind {
L.0:
	%chan = alloca i32
	%in = alloca i64
	store i32 %chan.arg, i32* %chan
	store i64 %in.arg, i64* %in
	%buf = alloca [20 x i8]
	%i = alloca i8
	store i8 20, i8* %i
	%0 = load i64* %in
	%1 = icmp eq i64 %0, 0
	br i1 %1, label %L.2, label %L.3
L.2:
	%2 = load i8* %i
	%3 = sub i8 %2, 1
	store i8 %3, i8* %i
	%4 = load i8* %i
	%5 = zext i8 %4 to i32
	%6 = getelementptr [20 x i8]* %buf, i32 0, i32 %5
	store i8 48, i8* %6
	br label %L.1
L.3:
	br label %L.4
L.4:
	%7 = load i64* %in
	%8 = icmp ne i64 %7, 0
	%9 = xor i1 %8, true
	br i1 %9, label %L.5, label %L.6
L.6:
	%10 = load i8* %i
	%11 = sub i8 %10, 1
	store i8 %11, i8* %i
	%12 = load i64* %in
	%13 = urem i64 %12, 10
	%14 = add i64 %13, 48
	%15 = trunc i64 %14 to i8
	%16 = load i8* %i
	%17 = zext i8 %16 to i32
	%18 = getelementptr [20 x i8]* %buf, i32 0, i32 %17
	store i8 %15, i8* %18
	%19 = load i64* %in
	%20 = udiv i64 %19, 10
	store i64 %20, i64* %in
	br label %L.4
L.5:
	br label %L.1
L.1:
	%21 = load i32* %chan
	%22 = load i8* %i
	%23 = zext i8 %22 to i32
	%24 = getelementptr [20 x i8]* %buf, i32 0, i32 %23
	%25 = bitcast i8* %24 to [20 x i8]*
	%26 = getelementptr [20 x i8]* %25
	%27 = bitcast [20 x i8]* %26 to [0 x i8]*
	%28 = load i8* %i
	%29 = zext i8 %28 to i32
	%30 = sub i32 20, %29
	%31 = call i32 @write(i32 %21, [0 x i8]* %27, i32 %30)
	br label %return
return:
	ret void
}
define void @out_int64(i32 %chan.arg, i64 %in.arg) nounwind {
L.0:
	%chan = alloca i32
	%in = alloca i64
	store i32 %chan.arg, i32* %chan
	store i64 %in.arg, i64* %in
	%ui = alloca i64
	%0 = load i64* %in
	%1 = icmp slt i64 %0, 0
	br i1 %1, label %L.2, label %L.3
L.2:
	%2 = load i32* %chan
	%3 = getelementptr [2 x i8]* @.str5
	%4 = bitcast [2 x i8]* %3 to [0 x i8]*
	%5 = call i32 @write(i32 %2, [0 x i8]* %4, i32 1)
	%6 = load i64* %in
	%7 = sub i64 0, %6
	store i64 %7, i64* %ui
	br label %L.1
L.3:
	%8 = load i64* %in
	store i64 %8, i64* %ui
	br label %L.1
L.1:
	%9 = load i32* %chan
	%10 = load i64* %ui
	call void @out_uint64(i32 %9, i64 %10)
	br label %return
return:
	ret void
}
define void @out_uint(i32 %chan.arg, i32 %in.arg) alwaysinline nounwind {
L.0:
	%chan = alloca i32
	%in = alloca i32
	store i32 %chan.arg, i32* %chan
	store i32 %in.arg, i32* %in
	br i1 0, label %L.2, label %L.3
L.2:
	%0 = load i32* %chan
	%1 = load i32* %in
	%2 = zext i32 %1 to i64
	call void @out_uint64(i32 %0, i64 %2)
	br label %L.1
L.3:
	%3 = load i32* %chan
	%4 = load i32* %in
	call void @out_uint32(i32 %3, i32 %4)
	br label %L.1
L.1:
	br label %return
return:
	ret void
}
define void @out_int(i32 %chan.arg, i32 %in.arg) alwaysinline nounwind {
L.0:
	%chan = alloca i32
	%in = alloca i32
	store i32 %chan.arg, i32* %chan
	store i32 %in.arg, i32* %in
	br i1 0, label %L.2, label %L.3
L.2:
	%0 = load i32* %chan
	%1 = load i32* %in
	%2 = sext i32 %1 to i64
	call void @out_int64(i32 %0, i64 %2)
	br label %L.1
L.3:
	%3 = load i32* %chan
	%4 = load i32* %in
	call void @out_int32(i32 %3, i32 %4)
	br label %L.1
L.1:
	br label %return
return:
	ret void
}
@lex_ErrMsg = internal constant [66 x [0 x i8]*] [ [0 x i8] * bitcast( [30 x i8]* getelementptr( [30 x i8]* @.str7 )  to [0 x i8]* ), [0 x i8] * bitcast( [42 x i8]* getelementptr( [42 x i8]* @.str8 )  to [0 x i8]* ), [0 x i8] * bitcast( [44 x i8]* getelementptr( [44 x i8]* @.str9 )  to [0 x i8]* ), [0 x i8] * bitcast( [23 x i8]* getelementptr( [23 x i8]* @.str10 )  to [0 x i8]* ), [0 x i8] * bitcast( [23 x i8]* getelementptr( [23 x i8]* @.str11 )  to [0 x i8]* ), [0 x i8] * bitcast( [29 x i8]* getelementptr( [29 x i8]* @.str12 )  to [0 x i8]* ), [0 x i8] * bitcast( [53 x i8]* getelementptr( [53 x i8]* @.str13 )  to [0 x i8]* ), [0 x i8] * bitcast( [25 x i8]* getelementptr( [25 x i8]* @.str14 )  to [0 x i8]* ), [0 x i8] * bitcast( [20 x i8]* getelementptr( [20 x i8]* @.str15 )  to [0 x i8]* ), [0 x i8] * bitcast( [16 x i8]* getelementptr( [16 x i8]* @.str16 )  to [0 x i8]* ), [0 x i8] * bitcast( [11 x i8]* getelementptr( [11 x i8]* @.str17 )  to [0 x i8]* ), [0 x i8] * bitcast( [20 x i8]* getelementptr( [20 x i8]* @.str18 )  to [0 x i8]* ), [0 x i8] * bitcast( [23 x i8]* getelementptr( [23 x i8]* @.str19 )  to [0 x i8]* ), [0 x i8] * bitcast( [28 x i8]* getelementptr( [28 x i8]* @.str20 )  to [0 x i8]* ), [0 x i8] * bitcast( [18 x i8]* getelementptr( [18 x i8]* @.str21 )  to [0 x i8]* ), [0 x i8] * bitcast( [24 x i8]* getelementptr( [24 x i8]* @.str22 )  to [0 x i8]* ), [0 x i8] * bitcast( [35 x i8]* getelementptr( [35 x i8]* @.str23 )  to [0 x i8]* ), [0 x i8] * bitcast( [28 x i8]* getelementptr( [28 x i8]* @.str24 )  to [0 x i8]* ), [0 x i8] * bitcast( [25 x i8]* getelementptr( [25 x i8]* @.str25 )  to [0 x i8]* ), [0 x i8] * bitcast( [25 x i8]* getelementptr( [25 x i8]* @.str26 )  to [0 x i8]* ), [0 x i8] * bitcast( [25 x i8]* getelementptr( [25 x i8]* @.str27 )  to [0 x i8]* ), [0 x i8] * bitcast( [26 x i8]* getelementptr( [26 x i8]* @.str28 )  to [0 x i8]* ), [0 x i8] * bitcast( [33 x i8]* getelementptr( [33 x i8]* @.str29 )  to [0 x i8]* ), [0 x i8] * bitcast( [34 x i8]* getelementptr( [34 x i8]* @.str30 )  to [0 x i8]* ), [0 x i8] * bitcast( [25 x i8]* getelementptr( [25 x i8]* @.str31 )  to [0 x i8]* ), [0 x i8] * bitcast( [20 x i8]* getelementptr( [20 x i8]* @.str32 )  to [0 x i8]* ), [0 x i8] * bitcast( [45 x i8]* getelementptr( [45 x i8]* @.str33 )  to [0 x i8]* ), [0 x i8] * bitcast( [49 x i8]* getelementptr( [49 x i8]* @.str34 )  to [0 x i8]* ), [0 x i8] * bitcast( [44 x i8]* getelementptr( [44 x i8]* @.str35 )  to [0 x i8]* ), [0 x i8] * bitcast( [37 x i8]* getelementptr( [37 x i8]* @.str36 )  to [0 x i8]* ), [0 x i8] * bitcast( [46 x i8]* getelementptr( [46 x i8]* @.str37 )  to [0 x i8]* ), [0 x i8] * bitcast( [19 x i8]* getelementptr( [19 x i8]* @.str38 )  to [0 x i8]* ), [0 x i8] * bitcast( [26 x i8]* getelementptr( [26 x i8]* @.str39 )  to [0 x i8]* ), [0 x i8] * bitcast( [26 x i8]* getelementptr( [26 x i8]* @.str40 )  to [0 x i8]* ), [0 x i8] * bitcast( [28 x i8]* getelementptr( [28 x i8]* @.str41 )  to [0 x i8]* ), [0 x i8] * bitcast( [36 x i8]* getelementptr( [36 x i8]* @.str42 )  to [0 x i8]* ), [0 x i8] * bitcast( [34 x i8]* getelementptr( [34 x i8]* @.str43 )  to [0 x i8]* ), [0 x i8] * bitcast( [51 x i8]* getelementptr( [51 x i8]* @.str44 )  to [0 x i8]* ), [0 x i8] * bitcast( [28 x i8]* getelementptr( [28 x i8]* @.str45 )  to [0 x i8]* ), [0 x i8] * bitcast( [37 x i8]* getelementptr( [37 x i8]* @.str46 )  to [0 x i8]* ), [0 x i8] * bitcast( [13 x i8]* getelementptr( [13 x i8]* @.str47 )  to [0 x i8]* ), [0 x i8] * bitcast( [33 x i8]* getelementptr( [33 x i8]* @.str48 )  to [0 x i8]* ), [0 x i8] * bitcast( [33 x i8]* getelementptr( [33 x i8]* @.str49 )  to [0 x i8]* ), [0 x i8] * bitcast( [41 x i8]* getelementptr( [41 x i8]* @.str50 )  to [0 x i8]* ), [0 x i8] * bitcast( [25 x i8]* getelementptr( [25 x i8]* @.str51 )  to [0 x i8]* ), [0 x i8] * bitcast( [21 x i8]* getelementptr( [21 x i8]* @.str52 )  to [0 x i8]* ), [0 x i8] * bitcast( [34 x i8]* getelementptr( [34 x i8]* @.str53 )  to [0 x i8]* ), [0 x i8] * bitcast( [29 x i8]* getelementptr( [29 x i8]* @.str54 )  to [0 x i8]* ), [0 x i8] * bitcast( [29 x i8]* getelementptr( [29 x i8]* @.str55 )  to [0 x i8]* ), [0 x i8] * bitcast( [14 x i8]* getelementptr( [14 x i8]* @.str56 )  to [0 x i8]* ), [0 x i8] * bitcast( [13 x i8]* getelementptr( [13 x i8]* @.str57 )  to [0 x i8]* ), [0 x i8] * bitcast( [13 x i8]* getelementptr( [13 x i8]* @.str58 )  to [0 x i8]* ), [0 x i8] * bitcast( [35 x i8]* getelementptr( [35 x i8]* @.str59 )  to [0 x i8]* ), [0 x i8] * bitcast( [27 x i8]* getelementptr( [27 x i8]* @.str60 )  to [0 x i8]* ), [0 x i8] * bitcast( [33 x i8]* getelementptr( [33 x i8]* @.str61 )  to [0 x i8]* ), [0 x i8] * bitcast( [41 x i8]* getelementptr( [41 x i8]* @.str62 )  to [0 x i8]* ), [0 x i8] * bitcast( [37 x i8]* getelementptr( [37 x i8]* @.str63 )  to [0 x i8]* ), [0 x i8] * bitcast( [49 x i8]* getelementptr( [49 x i8]* @.str64 )  to [0 x i8]* ), [0 x i8] * bitcast( [22 x i8]* getelementptr( [22 x i8]* @.str65 )  to [0 x i8]* ), [0 x i8] * bitcast( [32 x i8]* getelementptr( [32 x i8]* @.str66 )  to [0 x i8]* ), [0 x i8] * bitcast( [43 x i8]* getelementptr( [43 x i8]* @.str67 )  to [0 x i8]* ), [0 x i8] * bitcast( [19 x i8]* getelementptr( [19 x i8]* @.str68 )  to [0 x i8]* ), [0 x i8]* zeroinitializer, [0 x i8] * bitcast( [33 x i8]* getelementptr( [33 x i8]* @.str69 )  to [0 x i8]* ), [0 x i8] * bitcast( [23 x i8]* getelementptr( [23 x i8]* @.str70 )  to [0 x i8]* ), [0 x i8] * bitcast( [25 x i8]* getelementptr( [25 x i8]* @.str71 )  to [0 x i8]* ) ], align 4
@lex_keywords = internal constant [82 x [0 x i8]*] [ [0 x i8] * bitcast( [1 x i8]* getelementptr( [1 x i8]* @.str73 )  to [0 x i8]* ), [0 x i8] * bitcast( [10 x i8]* getelementptr( [10 x i8]* @.str74 )  to [0 x i8]* ), [0 x i8] * bitcast( [2 x i8]* getelementptr( [2 x i8]* @.str75 )  to [0 x i8]* ), [0 x i8] * bitcast( [2 x i8]* getelementptr( [2 x i8]* @.str76 )  to [0 x i8]* ), [0 x i8] * bitcast( [2 x i8]* getelementptr( [2 x i8]* @.str77 )  to [0 x i8]* ), [0 x i8] * bitcast( [2 x i8]* getelementptr( [2 x i8]* @.str78 )  to [0 x i8]* ), [0 x i8] * bitcast( [3 x i8]* getelementptr( [3 x i8]* @.str79 )  to [0 x i8]* ), [0 x i8] * bitcast( [2 x i8]* getelementptr( [2 x i8]* @.str80 )  to [0 x i8]* ), [0 x i8] * bitcast( [2 x i8]* getelementptr( [2 x i8]* @.str81 )  to [0 x i8]* ), [0 x i8] * bitcast( [2 x i8]* getelementptr( [2 x i8]* @.str82 )  to [0 x i8]* ), [0 x i8] * bitcast( [3 x i8]* getelementptr( [3 x i8]* @.str83 )  to [0 x i8]* ), [0 x i8] * bitcast( [3 x i8]* getelementptr( [3 x i8]* @.str84 )  to [0 x i8]* ), [0 x i8] * bitcast( [2 x i8]* getelementptr( [2 x i8]* @.str85 )  to [0 x i8]* ), [0 x i8] * bitcast( [2 x i8]* getelementptr( [2 x i8]* @.str86 )  to [0 x i8]* ), [0 x i8] * bitcast( [2 x i8]* getelementptr( [2 x i8]* @.str87 )  to [0 x i8]* ), [0 x i8] * bitcast( [2 x i8]* getelementptr( [2 x i8]* @.str88 )  to [0 x i8]* ), [0 x i8] * bitcast( [2 x i8]* getelementptr( [2 x i8]* @.str89 )  to [0 x i8]* ), [0 x i8] * bitcast( [2 x i8]* getelementptr( [2 x i8]* @.str90 )  to [0 x i8]* ), [0 x i8] * bitcast( [2 x i8]* getelementptr( [2 x i8]* @.str91 )  to [0 x i8]* ), [0 x i8] * bitcast( [2 x i8]* getelementptr( [2 x i8]* @.str92 )  to [0 x i8]* ), [0 x i8] * bitcast( [2 x i8]* getelementptr( [2 x i8]* @.str93 )  to [0 x i8]* ), [0 x i8] * bitcast( [3 x i8]* getelementptr( [3 x i8]* @.str94 )  to [0 x i8]* ), [0 x i8] * bitcast( [3 x i8]* getelementptr( [3 x i8]* @.str95 )  to [0 x i8]* ), [0 x i8] * bitcast( [2 x i8]* getelementptr( [2 x i8]* @.str96 )  to [0 x i8]* ), [0 x i8] * bitcast( [3 x i8]* getelementptr( [3 x i8]* @.str97 )  to [0 x i8]* ), [0 x i8] * bitcast( [3 x i8]* getelementptr( [3 x i8]* @.str98 )  to [0 x i8]* ), [0 x i8] * bitcast( [2 x i8]* getelementptr( [2 x i8]* @.str99 )  to [0 x i8]* ), [0 x i8] * bitcast( [2 x i8]* getelementptr( [2 x i8]* @.str100 )  to [0 x i8]* ), [0 x i8] * bitcast( [3 x i8]* getelementptr( [3 x i8]* @.str101 )  to [0 x i8]* ), [0 x i8] * bitcast( [3 x i8]* getelementptr( [3 x i8]* @.str102 )  to [0 x i8]* ), [0 x i8] * bitcast( [3 x i8]* getelementptr( [3 x i8]* @.str103 )  to [0 x i8]* ), [0 x i8] * bitcast( [3 x i8]* getelementptr( [3 x i8]* @.str104 )  to [0 x i8]* ), [0 x i8] * bitcast( [2 x i8]* getelementptr( [2 x i8]* @.str105 )  to [0 x i8]* ), [0 x i8] * bitcast( [2 x i8]* getelementptr( [2 x i8]* @.str106 )  to [0 x i8]* ), [0 x i8] * bitcast( [2 x i8]* getelementptr( [2 x i8]* @.str107 )  to [0 x i8]* ), [0 x i8] * bitcast( [2 x i8]* getelementptr( [2 x i8]* @.str108 )  to [0 x i8]* ), [0 x i8] * bitcast( [2 x i8]* getelementptr( [2 x i8]* @.str109 )  to [0 x i8]* ), [0 x i8] * bitcast( [2 x i8]* getelementptr( [2 x i8]* @.str110 )  to [0 x i8]* ), [0 x i8] * bitcast( [7 x i8]* getelementptr( [7 x i8]* @.str111 )  to [0 x i8]* ), [0 x i8] * bitcast( [7 x i8]* getelementptr( [7 x i8]* @.str112 )  to [0 x i8]* ), [0 x i8] * bitcast( [6 x i8]* getelementptr( [6 x i8]* @.str113 )  to [0 x i8]* ), [0 x i8] * bitcast( [5 x i8]* getelementptr( [5 x i8]* @.str114 )  to [0 x i8]* ), [0 x i8] * bitcast( [4 x i8]* getelementptr( [4 x i8]* @.str115 )  to [0 x i8]* ), [0 x i8] * bitcast( [6 x i8]* getelementptr( [6 x i8]* @.str116 )  to [0 x i8]* ), [0 x i8] * bitcast( [5 x i8]* getelementptr( [5 x i8]* @.str117 )  to [0 x i8]* ), [0 x i8] * bitcast( [8 x i8]* getelementptr( [8 x i8]* @.str118 )  to [0 x i8]* ), [0 x i8] * bitcast( [7 x i8]* getelementptr( [7 x i8]* @.str119 )  to [0 x i8]* ), [0 x i8] * bitcast( [3 x i8]* getelementptr( [3 x i8]* @.str120 )  to [0 x i8]* ), [0 x i8] * bitcast( [5 x i8]* getelementptr( [5 x i8]* @.str121 )  to [0 x i8]* ), [0 x i8] * bitcast( [5 x i8]* getelementptr( [5 x i8]* @.str122 )  to [0 x i8]* ), [0 x i8] * bitcast( [3 x i8]* getelementptr( [3 x i8]* @.str123 )  to [0 x i8]* ), [0 x i8] * bitcast( [4 x i8]* getelementptr( [4 x i8]* @.str124 )  to [0 x i8]* ), [0 x i8] * bitcast( [6 x i8]* getelementptr( [6 x i8]* @.str125 )  to [0 x i8]* ), [0 x i8] * bitcast( [3 x i8]* getelementptr( [3 x i8]* @.str126 )  to [0 x i8]* ), [0 x i8] * bitcast( [5 x i8]* getelementptr( [5 x i8]* @.str127 )  to [0 x i8]* ), [0 x i8] * bitcast( [5 x i8]* getelementptr( [5 x i8]* @.str128 )  to [0 x i8]* ), [0 x i8] * bitcast( [5 x i8]* getelementptr( [5 x i8]* @.str129 )  to [0 x i8]* ), [0 x i8] * bitcast( [7 x i8]* getelementptr( [7 x i8]* @.str130 )  to [0 x i8]* ), [0 x i8] * bitcast( [6 x i8]* getelementptr( [6 x i8]* @.str131 )  to [0 x i8]* ), [0 x i8] * bitcast( [3 x i8]* getelementptr( [3 x i8]* @.str132 )  to [0 x i8]* ), [0 x i8] * bitcast( [5 x i8]* getelementptr( [5 x i8]* @.str133 )  to [0 x i8]* ), [0 x i8] * bitcast( [4 x i8]* getelementptr( [4 x i8]* @.str134 )  to [0 x i8]* ), [0 x i8] * bitcast( [7 x i8]* getelementptr( [7 x i8]* @.str135 )  to [0 x i8]* ), [0 x i8] * bitcast( [10 x i8]* getelementptr( [10 x i8]* @.str136 )  to [0 x i8]* ), [0 x i8] * bitcast( [4 x i8]* getelementptr( [4 x i8]* @.str137 )  to [0 x i8]* ), [0 x i8] * bitcast( [4 x i8]* getelementptr( [4 x i8]* @.str138 )  to [0 x i8]* ), [0 x i8] * bitcast( [3 x i8]* getelementptr( [3 x i8]* @.str139 )  to [0 x i8]* ), [0 x i8] * bitcast( [3 x i8]* getelementptr( [3 x i8]* @.str140 )  to [0 x i8]* ), [0 x i8] * bitcast( [3 x i8]* getelementptr( [3 x i8]* @.str141 )  to [0 x i8]* ), [0 x i8] * bitcast( [3 x i8]* getelementptr( [3 x i8]* @.str142 )  to [0 x i8]* ), [0 x i8] * bitcast( [3 x i8]* getelementptr( [3 x i8]* @.str143 )  to [0 x i8]* ), [0 x i8] * bitcast( [4 x i8]* getelementptr( [4 x i8]* @.str144 )  to [0 x i8]* ), [0 x i8] * bitcast( [9 x i8]* getelementptr( [9 x i8]* @.str145 )  to [0 x i8]* ), [0 x i8] * bitcast( [7 x i8]* getelementptr( [7 x i8]* @.str146 )  to [0 x i8]* ), [0 x i8] * bitcast( [8 x i8]* getelementptr( [8 x i8]* @.str147 )  to [0 x i8]* ), [0 x i8] * bitcast( [6 x i8]* getelementptr( [6 x i8]* @.str148 )  to [0 x i8]* ), [0 x i8] * bitcast( [7 x i8]* getelementptr( [7 x i8]* @.str149 )  to [0 x i8]* ), [0 x i8] * bitcast( [10 x i8]* getelementptr( [10 x i8]* @.str150 )  to [0 x i8]* ), [0 x i8] * bitcast( [4 x i8]* getelementptr( [4 x i8]* @.str151 )  to [0 x i8]* ), [0 x i8] * bitcast( [4 x i8]* getelementptr( [4 x i8]* @.str152 )  to [0 x i8]* ), [0 x i8] * bitcast( [5 x i8]* getelementptr( [5 x i8]* @.str153 )  to [0 x i8]* ), [0 x i8] * bitcast( [5 x i8]* getelementptr( [5 x i8]* @.str154 )  to [0 x i8]* ) ], align 4
%lex.SearchPathEntry = type {%lex.SearchPathEntry*, [1024 x i8]}
@lex_pathhead = internal global %lex.SearchPathEntry* zeroinitializer, align 4
@lex_pathtail = internal global %lex.SearchPathEntry* zeroinitializer, align 4
%lex.FileListEntry = type {%lex.FileListEntry*, i16, [256 x i8]}
@lex_filehead = internal global %lex.FileListEntry* zeroinitializer, align 4
@lex_filetail = internal global %lex.FileListEntry* zeroinitializer, align 4
%lex.FileContext = type {%lex.FileContext*, i32, i16, i16, i16, i8, i8, %lex.SearchPathEntry*, [256 x i8], [4096 x i8]}
@lex_f = internal global %lex.FileContext* zeroinitializer, align 4
@lex_ErrorCount = internal global i8 0, align 1
@lex_Token = internal global i8 0, align 1
@lex_Ident = internal global [64 x i8] zeroinitializer, align 1
@lex_Number = internal global i64 0, align 4
@lex_StringLen = internal global i8 0, align 1
@lex_StringBuf = internal global [128 x i8] zeroinitializer, align 1
define zeroext i16 @lex_Lineno() nounwind {
L.0:
	%rv.0 = alloca i16
	%0 = load %lex.FileContext** @lex_f
	%1 = icmp eq %lex.FileContext* %0, null
	br i1 %1, label %L.2, label %L.1
L.2:
	store i16 0, i16* %rv.0
	br label %return
L.1:
	%2 = load %lex.FileContext** @lex_f
	%3 = getelementptr %lex.FileContext* %2, i32 0, i32 2
	%4 = load i16* %3
	store i16 %4, i16* %rv.0
	br label %return
return:
	%5 = load i16* %rv.0
	ret i16 %5
}
define void @lex_ErrorSub(i8 zeroext %error.arg) nounwind {
L.0:
	%error = alloca i8
	store i8 %error.arg, i8* %error
	%0 = load %lex.FileContext** @lex_f
	%1 = getelementptr %lex.FileContext* %0, i32 0, i32 7
	%2 = load %lex.SearchPathEntry** %1
	%3 = icmp ne %lex.SearchPathEntry* %2, null
	br i1 %3, label %L.2, label %L.1
L.2:
	%4 = load %lex.FileContext** @lex_f
	%5 = getelementptr %lex.FileContext* %4, i32 0, i32 7
	%6 = load %lex.SearchPathEntry** %5
	%7 = getelementptr %lex.SearchPathEntry* %6, i32 0, i32 1
	%8 = getelementptr [1024 x i8]* %7
	%9 = bitcast [1024 x i8]* %8 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %9)
	call void @out_chr(i32 2, i8 47)
	br label %L.1
L.1:
	%10 = load %lex.FileContext** @lex_f
	%11 = getelementptr %lex.FileContext* %10, i32 0, i32 8
	%12 = getelementptr [256 x i8]* %11
	%13 = bitcast [256 x i8]* %12 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %13)
	call void @out_chr(i32 2, i8 58)
	%14 = call i16 @lex_Lineno()
	%15 = zext i16 %14 to i32
	call void @out_uint(i32 2, i32 %15)
	%16 = getelementptr [3 x i8]* @.str155
	%17 = bitcast [3 x i8]* %16 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %17)
	%18 = load i8* %error
	%19 = icmp uge i8 %18, 2
	br i1 %19, label %L.4, label %L.5
L.4:
	%20 = load i8* %error
	%21 = icmp uge i8 %20, 62
	br i1 %21, label %L.7, label %L.6
L.7:
	%22 = getelementptr [10 x i8]* @.str156
	%23 = bitcast [10 x i8]* %22 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %23)
	br label %L.6
L.6:
	%24 = getelementptr [8 x i8]* @.str157
	%25 = bitcast [8 x i8]* %24 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %25)
	%26 = load i8* @lex_ErrorCount
	%27 = add i8 %26, 1
	store i8 %27, i8* @lex_ErrorCount
	br label %L.3
L.5:
	%28 = getelementptr [10 x i8]* @.str158
	%29 = bitcast [10 x i8]* %28 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %29)
	br label %L.3
L.3:
	%30 = load i8* %error
	%31 = zext i8 %30 to i32
	%32 = getelementptr [66 x [0 x i8]*]* @lex_ErrMsg, i32 0, i32 %31
	%33 = load [0 x i8]** %32
	%34 = bitcast [0 x i8]* %33 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %34)
	%35 = load i8* @lex_ErrorCount
	%36 = zext i8 %35 to i32
	%37 = icmp uge i32 %36, 10
	br i1 %37, label %L.9, label %L.8
L.9:
	%38 = getelementptr [27 x i8]* @.str159
	%39 = bitcast [27 x i8]* %38 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %39)
	call void @exit(i32 1)
	br label %L.8
L.8:
	br label %return
return:
	ret void
}
define void @lex_Error(i8 zeroext %error.arg) nounwind {
L.0:
	%error = alloca i8
	store i8 %error.arg, i8* %error
	%0 = load i8* %error
	call void @lex_ErrorSub(i8 %0)
	call void @out_nl(i32 2)
	br label %return
return:
	ret void
}
define void @lex_ErrorS(i8 zeroext %error.arg, [0 x i8]* %msg.arg) nounwind {
L.0:
	%error = alloca i8
	%msg = alloca [0 x i8]*
	store i8 %error.arg, i8* %error
	store [0 x i8]* %msg.arg, [0 x i8]** %msg
	%0 = load i8* %error
	call void @lex_ErrorSub(i8 %0)
	%1 = load [0 x i8]** %msg
	%2 = bitcast [0 x i8]* %1 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %2)
	call void @out_nl(i32 2)
	br label %return
return:
	ret void
}
define void @lex_ErrorI(i8 zeroext %error.arg, [0 x i8]* %ident.arg) nounwind {
L.0:
	%error = alloca i8
	%ident = alloca [0 x i8]*
	store i8 %error.arg, i8* %error
	store [0 x i8]* %ident.arg, [0 x i8]** %ident
	%0 = load i8* %error
	call void @lex_ErrorSub(i8 %0)
	%1 = load [0 x i8]** %ident
	%2 = bitcast [0 x i8]* %1 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %2)
	call void @out_nl(i32 2)
	br label %return
return:
	ret void
}
define void @lex_ErrorT(i8 zeroext %error.arg, i8 zeroext %tok.arg) nounwind {
L.0:
	%error = alloca i8
	%tok = alloca i8
	store i8 %error.arg, i8* %error
	store i8 %tok.arg, i8* %tok
	%0 = load i8* %error
	call void @lex_ErrorSub(i8 %0)
	call void @out_chr(i32 2, i8 39)
	%1 = load i8* %tok
	%2 = zext i8 %1 to i32
	%3 = getelementptr [82 x [0 x i8]*]* @lex_keywords, i32 0, i32 %2
	%4 = load [0 x i8]** %3
	%5 = bitcast [0 x i8]* %4 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %5)
	call void @out_chr(i32 2, i8 39)
	call void @out_nl(i32 2)
	br label %return
return:
	ret void
}
define %lex.SearchPathEntry* @lex_SearchPathAdd([0 x i8]* %newpath.arg, i8 zeroext %prepend.arg) nounwind {
L.0:
	%rv.0 = alloca %lex.SearchPathEntry*
	%newpath = alloca [0 x i8]*
	%prepend = alloca i8
	store [0 x i8]* %newpath.arg, [0 x i8]** %newpath
	store i8 %prepend.arg, i8* %prepend
	%np = alloca %lex.SearchPathEntry*
	%0 = call [0 x i8]* @malloc(i32 1028)
	%1 = bitcast [0 x i8]* %0 to %lex.SearchPathEntry*
	store %lex.SearchPathEntry* %1, %lex.SearchPathEntry** %np
	%2 = load %lex.SearchPathEntry** %np
	%3 = getelementptr %lex.SearchPathEntry* %2, i32 0, i32 1
	%4 = getelementptr [1024 x i8]* %3
	%5 = bitcast [1024 x i8]* %4 to [0 x i8]*
	%6 = load [0 x i8]** %newpath
	%7 = bitcast [0 x i8]* %6 to [0 x i8]*
	call void @zstr_copy([0 x i8]* %5, [0 x i8]* %7, i32 1024)
	%8 = load %lex.SearchPathEntry** @lex_pathhead
	%9 = icmp eq %lex.SearchPathEntry* %8, null
	br i1 %9, label %L.2, label %L.3
L.2:
	%10 = load %lex.SearchPathEntry** %np
	%11 = getelementptr %lex.SearchPathEntry* %10, i32 0, i32 0
	store %lex.SearchPathEntry* null, %lex.SearchPathEntry** %11
	%12 = load %lex.SearchPathEntry** %np
	store %lex.SearchPathEntry* %12, %lex.SearchPathEntry** @lex_pathhead
	%13 = load %lex.SearchPathEntry** %np
	store %lex.SearchPathEntry* %13, %lex.SearchPathEntry** @lex_pathtail
	br label %L.1
L.3:
	%14 = load i8* %prepend
	%15 = icmp ne i8 %14, 0
	br i1 %15, label %L.5, label %L.6
L.5:
	%16 = load %lex.SearchPathEntry** @lex_pathhead
	%17 = load %lex.SearchPathEntry** %np
	%18 = getelementptr %lex.SearchPathEntry* %17, i32 0, i32 0
	store %lex.SearchPathEntry* %16, %lex.SearchPathEntry** %18
	%19 = load %lex.SearchPathEntry** %np
	store %lex.SearchPathEntry* %19, %lex.SearchPathEntry** @lex_pathhead
	br label %L.4
L.6:
	%20 = load %lex.SearchPathEntry** %np
	%21 = getelementptr %lex.SearchPathEntry* %20, i32 0, i32 0
	store %lex.SearchPathEntry* null, %lex.SearchPathEntry** %21
	%22 = load %lex.SearchPathEntry** %np
	%23 = load %lex.SearchPathEntry** @lex_pathtail
	%24 = getelementptr %lex.SearchPathEntry* %23, i32 0, i32 0
	store %lex.SearchPathEntry* %22, %lex.SearchPathEntry** %24
	%25 = load %lex.SearchPathEntry** %np
	store %lex.SearchPathEntry* %25, %lex.SearchPathEntry** @lex_pathtail
	br label %L.4
L.4:
	br label %L.1
L.1:
	%26 = getelementptr %A.148602984* @debug, i32 0, i32 2
	%27 = load i8* %26
	%28 = icmp ne i8 %27, 0
	br i1 %28, label %L.8, label %L.7
L.8:
	%pp = alloca %lex.SearchPathEntry*
	%29 = getelementptr [18 x i8]* @.str160
	%30 = bitcast [18 x i8]* %29 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %30)
	%31 = load %lex.SearchPathEntry** @lex_pathhead
	store %lex.SearchPathEntry* %31, %lex.SearchPathEntry** %pp
	br label %L.9
L.9:
	%32 = load %lex.SearchPathEntry** %pp
	%33 = icmp ne %lex.SearchPathEntry* %32, null
	%34 = xor i1 %33, true
	br i1 %34, label %L.10, label %L.11
L.11:
	%35 = load %lex.SearchPathEntry** %pp
	%36 = getelementptr %lex.SearchPathEntry* %35, i32 0, i32 1
	%37 = getelementptr [1024 x i8]* %36
	%38 = bitcast [1024 x i8]* %37 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %38)
	call void @out_chr(i32 2, i8 58)
	%39 = load %lex.SearchPathEntry** %pp
	%40 = getelementptr %lex.SearchPathEntry* %39, i32 0, i32 0
	%41 = load %lex.SearchPathEntry** %40
	store %lex.SearchPathEntry* %41, %lex.SearchPathEntry** %pp
	br label %L.9
L.10:
	%42 = getelementptr [3 x i8]* @.str161
	%43 = bitcast [3 x i8]* %42 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %43)
	br label %L.7
L.7:
	%44 = load %lex.SearchPathEntry** %np
	store %lex.SearchPathEntry* %44, %lex.SearchPathEntry** %rv.0
	br label %return
return:
	%45 = load %lex.SearchPathEntry** %rv.0
	ret %lex.SearchPathEntry* %45
}
define zeroext i8 @lex_FileCheck([0 x i8]* %filename.arg) nounwind {
L.0:
	%rv.0 = alloca i8
	%filename = alloca [0 x i8]*
	store [0 x i8]* %filename.arg, [0 x i8]** %filename
	%fp = alloca %lex.FileListEntry*
	%0 = load %lex.FileListEntry** @lex_filehead
	store %lex.FileListEntry* %0, %lex.FileListEntry** %fp
	br label %L.1
L.1:
	%1 = load %lex.FileListEntry** %fp
	%2 = icmp ne %lex.FileListEntry* %1, null
	%3 = xor i1 %2, true
	br i1 %3, label %L.2, label %L.3
L.3:
	%4 = load %lex.FileListEntry** %fp
	%5 = getelementptr %lex.FileListEntry* %4, i32 0, i32 2
	%6 = getelementptr [256 x i8]* %5
	%7 = bitcast [256 x i8]* %6 to [0 x i8]*
	%8 = load [0 x i8]** %filename
	%9 = bitcast [0 x i8]* %8 to [0 x i8]*
	%10 = call i8 @zstr_eq([0 x i8]* %7, [0 x i8]* %9, i32 256)
	%11 = icmp ne i8 %10, 0
	br i1 %11, label %L.5, label %L.4
L.5:
	store i8 0, i8* %rv.0
	br label %return
L.4:
	%12 = load %lex.FileListEntry** %fp
	%13 = getelementptr %lex.FileListEntry* %12, i32 0, i32 0
	%14 = load %lex.FileListEntry** %13
	store %lex.FileListEntry* %14, %lex.FileListEntry** %fp
	br label %L.1
L.2:
	store i8 1, i8* %rv.0
	br label %return
return:
	%15 = load i8* %rv.0
	ret i8 %15
}
define zeroext i8 @lex_FileOpen([0 x i8]* %filename.arg) nounwind {
L.0:
	%rv.0 = alloca i8
	%filename = alloca [0 x i8]*
	store [0 x i8]* %filename.arg, [0 x i8]** %filename
	%nf = alloca %lex.FileContext*
	%fd = alloca i32
	%pp = alloca %lex.SearchPathEntry*
	%fp = alloca %lex.FileListEntry*
	%i = alloca i16
	%pathbuf = alloca [1024 x i8]
	%0 = call [0 x i8]* @malloc(i32 4372)
	%1 = bitcast [0 x i8]* %0 to %lex.FileContext*
	store %lex.FileContext* %1, %lex.FileContext** %nf
	%2 = load %lex.FileContext** @lex_f
	%3 = icmp ne %lex.FileContext* %2, null
	br i1 %3, label %L.2, label %L.3
L.2:
	%4 = load %lex.SearchPathEntry** @lex_pathhead
	store %lex.SearchPathEntry* %4, %lex.SearchPathEntry** %pp
	br label %L.4
L.4:
	%5 = load %lex.SearchPathEntry** %pp
	%6 = icmp ne %lex.SearchPathEntry* %5, null
	%7 = xor i1 %6, true
	br i1 %7, label %L.5, label %L.6
L.6:
	%8 = getelementptr [1024 x i8]* %pathbuf
	%9 = bitcast [1024 x i8]* %8 to [0 x i8]*
	%10 = load %lex.SearchPathEntry** %pp
	%11 = getelementptr %lex.SearchPathEntry* %10, i32 0, i32 1
	%12 = getelementptr [1024 x i8]* %11
	%13 = bitcast [1024 x i8]* %12 to [0 x i8]*
	call void @zstr_copy([0 x i8]* %9, [0 x i8]* %13, i32 1024)
	%14 = getelementptr [1024 x i8]* %pathbuf
	%15 = bitcast [1024 x i8]* %14 to [0 x i8]*
	%16 = getelementptr [2 x i8]* @.str162
	%17 = bitcast [2 x i8]* %16 to [0 x i8]*
	call void @zstr_cat([0 x i8]* %15, [0 x i8]* %17, i32 1024)
	%18 = getelementptr [1024 x i8]* %pathbuf
	%19 = bitcast [1024 x i8]* %18 to [0 x i8]*
	%20 = call i32 @zstr_len([0 x i8]* %19, i32 1024)
	%21 = trunc i32 %20 to i16
	store i16 %21, i16* %i
	%22 = getelementptr [1024 x i8]* %pathbuf
	%23 = bitcast [1024 x i8]* %22 to [0 x i8]*
	%24 = load [0 x i8]** %filename
	%25 = bitcast [0 x i8]* %24 to [0 x i8]*
	call void @zstr_cat([0 x i8]* %23, [0 x i8]* %25, i32 1024)
	%26 = getelementptr [1024 x i8]* %pathbuf
	%27 = bitcast [1024 x i8]* %26 to [0 x i8]*
	%28 = getelementptr [5 x i8]* @.str163
	%29 = bitcast [5 x i8]* %28 to [0 x i8]*
	call void @zstr_cat([0 x i8]* %27, [0 x i8]* %29, i32 1024)
	%30 = getelementptr [1024 x i8]* %pathbuf
	%31 = bitcast [1024 x i8]* %30 to [0 x i8]*
	%32 = call i32 @open([0 x i8]* %31, i32 0, i32 0)
	store i32 %32, i32* %fd
	%33 = load i32* %fd
	%34 = icmp sge i32 %33, 0
	br i1 %34, label %L.5, label %L.7
L.7:
	%35 = load %lex.SearchPathEntry** %pp
	%36 = getelementptr %lex.SearchPathEntry* %35, i32 0, i32 0
	%37 = load %lex.SearchPathEntry** %36
	store %lex.SearchPathEntry* %37, %lex.SearchPathEntry** %pp
	br label %L.4
L.5:
	%38 = load i32* %fd
	%39 = icmp sge i32 %38, 0
	br i1 %39, label %L.9, label %L.8
L.9:
	%40 = call [0 x i8]* @malloc(i32 264)
	%41 = bitcast [0 x i8]* %40 to %lex.FileListEntry*
	store %lex.FileListEntry* %41, %lex.FileListEntry** %fp
	%42 = load %lex.FileListEntry** %fp
	%43 = getelementptr %lex.FileListEntry* %42, i32 0, i32 2
	%44 = getelementptr [256 x i8]* %43
	%45 = bitcast [256 x i8]* %44 to [0 x i8]*
	%46 = load [0 x i8]** %filename
	%47 = bitcast [0 x i8]* %46 to [0 x i8]*
	call void @zstr_copy([0 x i8]* %45, [0 x i8]* %47, i32 256)
	%48 = load %lex.FileListEntry** @lex_filehead
	%49 = icmp eq %lex.FileListEntry* %48, null
	br i1 %49, label %L.11, label %L.12
L.11:
	%50 = load %lex.FileListEntry** %fp
	store %lex.FileListEntry* %50, %lex.FileListEntry** @lex_filehead
	br label %L.10
L.12:
	%51 = load %lex.FileListEntry** %fp
	%52 = load %lex.FileListEntry** @lex_filetail
	%53 = getelementptr %lex.FileListEntry* %52, i32 0, i32 0
	store %lex.FileListEntry* %51, %lex.FileListEntry** %53
	br label %L.10
L.10:
	%54 = load %lex.FileListEntry** %fp
	store %lex.FileListEntry* %54, %lex.FileListEntry** @lex_filetail
	br label %L.8
L.8:
	br label %L.1
L.3:
	%55 = getelementptr [1024 x i8]* %pathbuf
	%56 = bitcast [1024 x i8]* %55 to [0 x i8]*
	%57 = load [0 x i8]** %filename
	%58 = bitcast [0 x i8]* %57 to [0 x i8]*
	call void @zstr_copy([0 x i8]* %56, [0 x i8]* %58, i32 1024)
	%59 = getelementptr [1024 x i8]* %pathbuf
	%60 = bitcast [1024 x i8]* %59 to [0 x i8]*
	%61 = call i32 @open([0 x i8]* %60, i32 0, i32 0)
	store i32 %61, i32* %fd
	%62 = getelementptr [1024 x i8]* %pathbuf
	%63 = bitcast [1024 x i8]* %62 to [0 x i8]*
	%64 = call i32 @zstr_rfind([0 x i8]* %63, i8 47, i32 1024)
	%65 = trunc i32 %64 to i16
	store i16 %65, i16* %i
	%66 = load i16* %i
	%67 = zext i16 %66 to i32
	%68 = icmp eq i32 %67, 1024
	br i1 %68, label %L.14, label %L.15
L.14:
	%69 = getelementptr [2 x i8]* @.str164
	%70 = bitcast [2 x i8]* %69 to [0 x i8]*
	%71 = call %lex.SearchPathEntry* @lex_SearchPathAdd([0 x i8]* %70, i8 1)
	store %lex.SearchPathEntry* %71, %lex.SearchPathEntry** %pp
	store i16 0, i16* %i
	br label %L.13
L.15:
	%72 = load i16* %i
	%73 = zext i16 %72 to i32
	%74 = getelementptr [1024 x i8]* %pathbuf, i32 0, i32 %73
	store i8 0, i8* %74
	%75 = getelementptr [1024 x i8]* %pathbuf
	%76 = bitcast [1024 x i8]* %75 to [0 x i8]*
	%77 = call %lex.SearchPathEntry* @lex_SearchPathAdd([0 x i8]* %76, i8 1)
	store %lex.SearchPathEntry* %77, %lex.SearchPathEntry** %pp
	%78 = load i16* %i
	%79 = add i16 %78, 1
	store i16 %79, i16* %i
	br label %L.13
L.13:
	br label %L.1
L.1:
	%80 = getelementptr %A.148602984* @debug, i32 0, i32 2
	%81 = load i8* %80
	%82 = icmp ne i8 %81, 0
	br i1 %82, label %L.17, label %L.16
L.17:
	%83 = getelementptr [13 x i8]* @.str165
	%84 = bitcast [13 x i8]* %83 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %84)
	%85 = load %lex.SearchPathEntry** %pp
	%86 = icmp ne %lex.SearchPathEntry* %85, null
	br i1 %86, label %L.19, label %L.18
L.19:
	%87 = load %lex.SearchPathEntry** %pp
	%88 = getelementptr %lex.SearchPathEntry* %87, i32 0, i32 1
	%89 = getelementptr [1024 x i8]* %88
	%90 = bitcast [1024 x i8]* %89 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %90)
	call void @out_chr(i32 2, i8 47)
	br label %L.18
L.18:
	%91 = load i16* %i
	%92 = zext i16 %91 to i32
	%93 = getelementptr [1024 x i8]* %pathbuf, i32 0, i32 %92
	%94 = bitcast i8* %93 to [1024 x i8]*
	%95 = getelementptr [1024 x i8]* %94
	%96 = bitcast [1024 x i8]* %95 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %96)
	%97 = getelementptr [3 x i8]* @.str166
	%98 = bitcast [3 x i8]* %97 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %98)
	br label %L.16
L.16:
	%99 = getelementptr %A.148603888* @feature, i32 0, i32 2
	%100 = load i8* %99
	%101 = icmp ne i8 %100, 0
	br i1 %101, label %L.21, label %L.20
L.21:
	%102 = getelementptr [5 x i8]* @.str167
	%103 = bitcast [5 x i8]* %102 to [0 x i8]*
	call void @out_str(i32 1, [0 x i8]* %103)
	%104 = load %lex.SearchPathEntry** %pp
	%105 = icmp ne %lex.SearchPathEntry* %104, null
	br i1 %105, label %L.22, label %L.23
L.22:
	%106 = load %lex.SearchPathEntry** %pp
	%107 = getelementptr %lex.SearchPathEntry* %106, i32 0, i32 1
	%108 = getelementptr [1024 x i8]* %107, i32 0, i32 0
	%109 = load i8* %108
	%110 = icmp ne i8 %109, 46
	br i1 %110, label %L.25, label %L.24
L.24:
	%111 = load %lex.SearchPathEntry** %pp
	%112 = getelementptr %lex.SearchPathEntry* %111, i32 0, i32 1
	%113 = getelementptr [1024 x i8]* %112, i32 0, i32 1
	%114 = load i8* %113
	%115 = icmp ne i8 %114, 0
	br label %L.25
L.25:
	%116 = phi i1 [ true, %L.22 ], [ %115, %L.24 ]
	br label %L.23
L.23:
	%117 = phi i1 [ false, %L.21 ], [ %116, %L.25 ]
	br i1 %117, label %L.27, label %L.26
L.27:
	%118 = load %lex.SearchPathEntry** %pp
	%119 = getelementptr %lex.SearchPathEntry* %118, i32 0, i32 1
	%120 = getelementptr [1024 x i8]* %119
	%121 = bitcast [1024 x i8]* %120 to [0 x i8]*
	call void @out_str(i32 1, [0 x i8]* %121)
	call void @out_chr(i32 1, i8 47)
	br label %L.26
L.26:
	%122 = load i16* %i
	%123 = zext i16 %122 to i32
	%124 = getelementptr [1024 x i8]* %pathbuf, i32 0, i32 %123
	%125 = bitcast i8* %124 to [1024 x i8]*
	%126 = getelementptr [1024 x i8]* %125
	%127 = bitcast [1024 x i8]* %126 to [0 x i8]*
	call void @out_str(i32 1, [0 x i8]* %127)
	br label %L.20
L.20:
	%128 = load i32* %fd
	%129 = icmp slt i32 %128, 0
	br i1 %129, label %L.29, label %L.28
L.29:
	store i8 0, i8* %rv.0
	br label %return
L.28:
	%130 = load %lex.FileContext** %nf
	%131 = getelementptr %lex.FileContext* %130, i32 0, i32 8
	%132 = getelementptr [256 x i8]* %131
	%133 = bitcast [256 x i8]* %132 to [0 x i8]*
	%134 = load i16* %i
	%135 = zext i16 %134 to i32
	%136 = getelementptr [1024 x i8]* %pathbuf, i32 0, i32 %135
	%137 = bitcast i8* %136 to [1024 x i8]*
	%138 = getelementptr [1024 x i8]* %137
	%139 = bitcast [1024 x i8]* %138 to [0 x i8]*
	call void @zstr_copy([0 x i8]* %133, [0 x i8]* %139, i32 256)
	%140 = load %lex.SearchPathEntry** %pp
	%141 = load %lex.FileContext** %nf
	%142 = getelementptr %lex.FileContext* %141, i32 0, i32 7
	store %lex.SearchPathEntry* %140, %lex.SearchPathEntry** %142
	%143 = load i32* %fd
	%144 = load %lex.FileContext** %nf
	%145 = getelementptr %lex.FileContext* %144, i32 0, i32 1
	store i32 %143, i32* %145
	%146 = load %lex.FileContext** %nf
	%147 = getelementptr %lex.FileContext* %146, i32 0, i32 2
	store i16 1, i16* %147
	%148 = load %lex.FileContext** %nf
	%149 = getelementptr %lex.FileContext* %148, i32 0, i32 3
	store i16 0, i16* %149
	%150 = load %lex.FileContext** %nf
	%151 = getelementptr %lex.FileContext* %150, i32 0, i32 4
	store i16 0, i16* %151
	%152 = load %lex.FileContext** @lex_f
	%153 = load %lex.FileContext** %nf
	%154 = getelementptr %lex.FileContext* %153, i32 0, i32 0
	store %lex.FileContext* %152, %lex.FileContext** %154
	%155 = load %lex.FileContext** %nf
	store %lex.FileContext* %155, %lex.FileContext** @lex_f
	store i8 1, i8* %rv.0
	br label %return
return:
	%156 = load i8* %rv.0
	ret i8 %156
}
define void @lex_FileClose() nounwind {
L.0:
	%of = alloca %lex.FileContext*
	%0 = load %lex.FileContext** @lex_f
	%1 = icmp ne %lex.FileContext* %0, null
	br i1 %1, label %L.2, label %L.1
L.2:
	%2 = load %lex.FileContext** @lex_f
	%3 = getelementptr %lex.FileContext* %2, i32 0, i32 1
	%4 = load i32* %3
	call void @close(i32 %4)
	%5 = getelementptr %A.148602984* @debug, i32 0, i32 2
	%6 = load i8* %5
	%7 = icmp ne i8 %6, 0
	br i1 %7, label %L.4, label %L.3
L.4:
	%8 = getelementptr [13 x i8]* @.str168
	%9 = bitcast [13 x i8]* %8 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %9)
	%10 = load %lex.FileContext** @lex_f
	%11 = getelementptr %lex.FileContext* %10, i32 0, i32 7
	%12 = load %lex.SearchPathEntry** %11
	%13 = icmp ne %lex.SearchPathEntry* %12, null
	br i1 %13, label %L.6, label %L.5
L.6:
	%14 = load %lex.FileContext** @lex_f
	%15 = getelementptr %lex.FileContext* %14, i32 0, i32 7
	%16 = load %lex.SearchPathEntry** %15
	%17 = getelementptr %lex.SearchPathEntry* %16, i32 0, i32 1
	%18 = getelementptr [1024 x i8]* %17
	%19 = bitcast [1024 x i8]* %18 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %19)
	call void @out_chr(i32 2, i8 47)
	br label %L.5
L.5:
	%20 = load %lex.FileContext** @lex_f
	%21 = getelementptr %lex.FileContext* %20, i32 0, i32 8
	%22 = getelementptr [256 x i8]* %21
	%23 = bitcast [256 x i8]* %22 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %23)
	%24 = getelementptr [3 x i8]* @.str169
	%25 = bitcast [3 x i8]* %24 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %25)
	br label %L.3
L.3:
	%26 = load %lex.FileContext** @lex_f
	store %lex.FileContext* %26, %lex.FileContext** %of
	%27 = load %lex.FileContext** %of
	%28 = getelementptr %lex.FileContext* %27, i32 0, i32 0
	%29 = load %lex.FileContext** %28
	store %lex.FileContext* %29, %lex.FileContext** @lex_f
	br label %L.1
L.1:
	br label %return
return:
	ret void
}
define void @lex_FillBuf() nounwind {
L.0:
	%k = alloca i32
	%0 = load %lex.FileContext** @lex_f
	%1 = getelementptr %lex.FileContext* %0, i32 0, i32 1
	%2 = load i32* %1
	%3 = load %lex.FileContext** @lex_f
	%4 = getelementptr %lex.FileContext* %3, i32 0, i32 9
	%5 = getelementptr [4096 x i8]* %4
	%6 = bitcast [4096 x i8]* %5 to [0 x i8]*
	%7 = call i32 @read(i32 %2, [0 x i8]* %6, i32 4096)
	store i32 %7, i32* %k
	%8 = load i32* %k
	%9 = icmp slt i32 %8, 0
	br i1 %9, label %L.2, label %L.1
L.2:
	store i32 0, i32* %k
	br label %L.1
L.1:
	%10 = load %lex.FileContext** @lex_f
	%11 = getelementptr %lex.FileContext* %10, i32 0, i32 3
	store i16 0, i16* %11
	%12 = load i32* %k
	%13 = trunc i32 %12 to i16
	%14 = load %lex.FileContext** @lex_f
	%15 = getelementptr %lex.FileContext* %14, i32 0, i32 4
	store i16 %13, i16* %15
	br label %return
return:
	ret void
}
define zeroext i8 @lex_EscChar(i8 zeroext %c.arg) nounwind {
L.0:
	%rv.0 = alloca i8
	%c = alloca i8
	store i8 %c.arg, i8* %c
	%0 = load i8* %c
	%1 = zext i8 %0 to i32
	switch i32 %1, label %L.1 [
		i32 110, label %L.3
		i32 114, label %L.4
		i32 116, label %L.5
		i32 98, label %L.6
		i32 118, label %L.7
		i32 102, label %L.8
	]
L.3:
	store i8 10, i8* %c
	br label %L.2
L.4:
	store i8 13, i8* %c
	br label %L.2
L.5:
	store i8 9, i8* %c
	br label %L.2
L.6:
	store i8 8, i8* %c
	br label %L.2
L.7:
	store i8 11, i8* %c
	br label %L.2
L.8:
	store i8 12, i8* %c
	br label %L.2
L.1:
	br label %L.2
L.2:
	%2 = load i8* %c
	store i8 %2, i8* %rv.0
	br label %return
return:
	%3 = load i8* %rv.0
	ret i8 %3
}
define i32 @lex_EscHex(i8 zeroext %c.arg, i32 %h.arg) nounwind {
L.0:
	%rv.0 = alloca i32
	%c = alloca i8
	%h = alloca i32
	store i8 %c.arg, i8* %c
	store i32 %h.arg, i32* %h
	%0 = load i8* %c
	%1 = zext i8 %0 to i32
	switch i32 %1, label %L.1 [
		i32 48, label %L.3
		i32 49, label %L.3
		i32 50, label %L.3
		i32 51, label %L.3
		i32 52, label %L.3
		i32 53, label %L.3
		i32 54, label %L.3
		i32 55, label %L.3
		i32 56, label %L.3
		i32 57, label %L.3
		i32 65, label %L.4
		i32 66, label %L.4
		i32 67, label %L.4
		i32 68, label %L.4
		i32 69, label %L.4
		i32 70, label %L.4
		i32 97, label %L.5
		i32 98, label %L.5
		i32 99, label %L.5
		i32 100, label %L.5
		i32 101, label %L.5
		i32 102, label %L.5
	]
L.3:
	%2 = load i8* %c
	%3 = sub i8 %2, 48
	store i8 %3, i8* %c
	br label %L.2
L.4:
	%4 = load i8* %c
	%5 = sub i8 %4, 65
	%6 = add i8 %5, 10
	store i8 %6, i8* %c
	br label %L.2
L.5:
	%7 = load i8* %c
	%8 = sub i8 %7, 97
	%9 = add i8 %8, 10
	store i8 %9, i8* %c
	br label %L.2
L.1:
	call void @lex_Error(i8 6)
	%10 = load i32* %h
	store i32 %10, i32* %rv.0
	br label %return
L.2:
	%11 = load i32* %h
	%12 = shl i32 %11, 4
	%13 = load i8* %c
	%14 = zext i8 %13 to i32
	%15 = or i32 %12, %14
	store i32 %15, i32* %rv.0
	br label %return
return:
	%16 = load i32* %rv.0
	ret i32 %16
}
@lex_unicodemax = internal constant [4 x i32] [ i32 127, i32 2047, i32 65535, i32 1114111 ], align 4
@lex_utf8pfx = internal constant [5 x i8] [ i8 0, i8 192, i8 224, i8 240, i8 248 ], align 1
define i32 @lex_EscUTF8(i32 %unicode.arg, i32 %j.arg) nounwind {
L.0:
	%rv.0 = alloca i32
	%unicode = alloca i32
	%j = alloca i32
	store i32 %unicode.arg, i32* %unicode
	store i32 %j.arg, i32* %j
	%n = alloca i32
	%i = alloca i32
	%k = alloca i32
	store i32 0, i32* %n
	br label %L.1
L.1:
	%0 = load i32* %unicode
	%1 = load i32* %n
	%2 = getelementptr [4 x i32]* @lex_unicodemax, i32 0, i32 %1
	%3 = load i32* %2
	%4 = icmp ule i32 %0, %3
	br i1 %4, label %L.2, label %L.3
L.3:
	%5 = load i32* %n
	%6 = add i32 %5, 1
	store i32 %6, i32* %n
	%7 = load i32* %n
	%8 = icmp ugt i32 %7, 3
	br i1 %8, label %L.2, label %L.4
L.4:
	br label %L.1
L.2:
	%9 = load i32* %n
	%10 = icmp uge i32 %9, 4
	br i1 %10, label %L.6, label %L.7
L.6:
	call void @lex_Error(i8 7)
	store i32 0, i32* %rv.0
	br label %return
L.7:
	%11 = load i32* %j
	%12 = load i32* %n
	%13 = add i32 %11, %12
	%14 = add i32 %13, 1
	store i32 %14, i32* %k
	%15 = load i32* %k
	%16 = icmp uge i32 %15, 127
	br i1 %16, label %L.9, label %L.8
L.9:
	call void @lex_Error(i8 9)
	store i32 0, i32* %rv.0
	br label %return
L.8:
	%17 = load i32* %n
	store i32 %17, i32* %i
	br label %L.10
L.10:
	%18 = load i32* %i
	%19 = icmp ugt i32 %18, 0
	%20 = xor i1 %19, true
	br i1 %20, label %L.11, label %L.12
L.12:
	%21 = load i32* %unicode
	%22 = trunc i32 %21 to i8
	%23 = and i8 63, %22
	%24 = or i8 128, %23
	%25 = load i32* %j
	%26 = load i32* %i
	%27 = add i32 %25, %26
	%28 = getelementptr [128 x i8]* @lex_StringBuf, i32 0, i32 %27
	store i8 %24, i8* %28
	%29 = load i32* %unicode
	%30 = lshr i32 %29, 6
	store i32 %30, i32* %unicode
	%31 = load i32* %i
	%32 = sub i32 %31, 1
	store i32 %32, i32* %i
	br label %L.10
L.11:
	%33 = load i32* %n
	%34 = getelementptr [5 x i8]* @lex_utf8pfx, i32 0, i32 %33
	%35 = load i8* %34
	%36 = load i32* %unicode
	%37 = trunc i32 %36 to i8
	%38 = or i8 %35, %37
	%39 = load i32* %j
	%40 = getelementptr [128 x i8]* @lex_StringBuf, i32 0, i32 %39
	store i8 %38, i8* %40
	br label %L.5
L.5:
	%41 = load i32* %k
	store i32 %41, i32* %rv.0
	br label %return
return:
	%42 = load i32* %rv.0
	ret i32 %42
}
define zeroext i8 @lex_Next() nounwind {
L.0:
	%rv.0 = alloca i8
	%state = alloca i8
	%c = alloca i8
	%tok = alloca i8
	%i = alloca i16
	%e = alloca i16
	%j = alloca i8
	%str = alloca i8
	%h = alloca i32
	%n = alloca i64
	store i8 0, i8* %state
	store i8 0, i8* %tok
	%0 = load %lex.FileContext** @lex_f
	%1 = getelementptr %lex.FileContext* %0, i32 0, i32 3
	%2 = load i16* %1
	store i16 %2, i16* %i
	%3 = load %lex.FileContext** @lex_f
	%4 = getelementptr %lex.FileContext* %3, i32 0, i32 4
	%5 = load i16* %4
	store i16 %5, i16* %e
	br label %L.1
L.1:
	%6 = load i16* %i
	%7 = load i16* %e
	%8 = icmp uge i16 %6, %7
	br i1 %8, label %L.4, label %L.3
L.4:
	call void @lex_FillBuf()
	%9 = load %lex.FileContext** @lex_f
	%10 = getelementptr %lex.FileContext* %9, i32 0, i32 3
	%11 = load i16* %10
	store i16 %11, i16* %i
	%12 = load %lex.FileContext** @lex_f
	%13 = getelementptr %lex.FileContext* %12, i32 0, i32 4
	%14 = load i16* %13
	store i16 %14, i16* %e
	%15 = load i16* %e
	%16 = icmp eq i16 %15, 0
	br i1 %16, label %L.6, label %L.5
L.6:
	%17 = load i8* %state
	%18 = zext i8 %17 to i32
	switch i32 %18, label %L.7 [
		i32 0, label %L.9
		i32 2, label %L.10
		i32 3, label %L.10
		i32 4, label %L.10
	]
L.9:
	br label %L.8
L.10:
	call void @lex_Error(i8 3)
	br label %L.8
L.7:
	call void @lex_Error(i8 4)
	br label %L.8
L.8:
	store i8 1, i8* %tok
	br label %L.2
L.5:
	br label %L.3
L.3:
	%19 = load %lex.FileContext** @lex_f
	%20 = getelementptr %lex.FileContext* %19, i32 0, i32 9
	%21 = load i16* %i
	%22 = zext i16 %21 to i32
	%23 = getelementptr [4096 x i8]* %20, i32 0, i32 %22
	%24 = load i8* %23
	store i8 %24, i8* %c
	%25 = load i8* %state
	%26 = zext i8 %25 to i32
	switch i32 %26, label %L.11 [
		i32 0, label %L.13
		i32 1, label %L.14
		i32 2, label %L.15
		i32 3, label %L.16
		i32 4, label %L.17
		i32 5, label %L.18
		i32 6, label %L.19
		i32 7, label %L.20
		i32 8, label %L.21
		i32 9, label %L.22
		i32 10, label %L.23
		i32 11, label %L.24
		i32 12, label %L.25
		i32 13, label %L.26
		i32 14, label %L.27
		i32 18, label %L.28
		i32 15, label %L.29
		i32 16, label %L.30
		i32 17, label %L.31
		i32 19, label %L.32
		i32 20, label %L.33
		i32 21, label %L.34
		i32 22, label %L.35
		i32 23, label %L.36
		i32 24, label %L.37
		i32 26, label %L.37
		i32 27, label %L.37
		i32 28, label %L.37
		i32 30, label %L.37
		i32 31, label %L.37
		i32 32, label %L.37
		i32 33, label %L.37
		i32 34, label %L.37
		i32 35, label %L.37
		i32 36, label %L.37
		i32 25, label %L.38
		i32 29, label %L.39
		i32 37, label %L.39
	]
L.13:
	%27 = load i8* %c
	%28 = zext i8 %27 to i32
	switch i32 %28, label %L.40 [
		i32 58, label %L.42
		i32 59, label %L.43
		i32 44, label %L.44
		i32 64, label %L.45
		i32 126, label %L.46
		i32 94, label %L.47
		i32 42, label %L.48
		i32 37, label %L.49
		i32 40, label %L.50
		i32 41, label %L.51
		i32 123, label %L.52
		i32 125, label %L.53
		i32 63, label %L.54
		i32 91, label %L.55
		i32 93, label %L.56
		i32 46, label %L.57
		i32 47, label %L.58
		i32 33, label %L.59
		i32 60, label %L.60
		i32 62, label %L.61
		i32 61, label %L.62
		i32 43, label %L.63
		i32 45, label %L.64
		i32 38, label %L.65
		i32 124, label %L.66
		i32 48, label %L.67
		i32 49, label %L.68
		i32 50, label %L.68
		i32 51, label %L.68
		i32 52, label %L.68
		i32 53, label %L.68
		i32 54, label %L.68
		i32 55, label %L.68
		i32 56, label %L.68
		i32 57, label %L.68
		i32 39, label %L.69
		i32 34, label %L.70
		i32 65, label %L.71
		i32 66, label %L.71
		i32 67, label %L.71
		i32 68, label %L.71
		i32 69, label %L.71
		i32 70, label %L.71
		i32 71, label %L.71
		i32 72, label %L.71
		i32 73, label %L.71
		i32 74, label %L.71
		i32 75, label %L.71
		i32 76, label %L.71
		i32 77, label %L.71
		i32 78, label %L.71
		i32 79, label %L.71
		i32 80, label %L.71
		i32 81, label %L.71
		i32 82, label %L.71
		i32 83, label %L.71
		i32 84, label %L.71
		i32 85, label %L.71
		i32 86, label %L.71
		i32 87, label %L.71
		i32 88, label %L.71
		i32 89, label %L.71
		i32 90, label %L.71
		i32 97, label %L.71
		i32 98, label %L.71
		i32 99, label %L.71
		i32 100, label %L.71
		i32 101, label %L.71
		i32 102, label %L.71
		i32 103, label %L.71
		i32 104, label %L.71
		i32 105, label %L.71
		i32 106, label %L.71
		i32 107, label %L.71
		i32 108, label %L.71
		i32 109, label %L.71
		i32 110, label %L.71
		i32 111, label %L.71
		i32 112, label %L.71
		i32 113, label %L.71
		i32 114, label %L.71
		i32 115, label %L.71
		i32 116, label %L.71
		i32 117, label %L.71
		i32 118, label %L.71
		i32 119, label %L.71
		i32 120, label %L.71
		i32 121, label %L.71
		i32 122, label %L.71
		i32 95, label %L.71
	]
L.42:
	store i8 3, i8* %tok
	%29 = load i16* %i
	%30 = add i16 %29, 1
	store i16 %30, i16* %i
	br label %L.41
L.43:
	store i8 4, i8* %tok
	%31 = load i16* %i
	%32 = add i16 %31, 1
	store i16 %32, i16* %i
	br label %L.41
L.44:
	store i8 5, i8* %tok
	%33 = load i16* %i
	%34 = add i16 %33, 1
	store i16 %34, i16* %i
	br label %L.41
L.45:
	store i8 7, i8* %tok
	%35 = load i16* %i
	%36 = add i16 %35, 1
	store i16 %36, i16* %i
	br label %L.41
L.46:
	store i8 13, i8* %tok
	%37 = load i16* %i
	%38 = add i16 %37, 1
	store i16 %38, i16* %i
	br label %L.41
L.47:
	store i8 17, i8* %tok
	%39 = load i16* %i
	%40 = add i16 %39, 1
	store i16 %40, i16* %i
	br label %L.41
L.48:
	store i8 18, i8* %tok
	%41 = load i16* %i
	%42 = add i16 %41, 1
	store i16 %42, i16* %i
	br label %L.41
L.49:
	store i8 20, i8* %tok
	%43 = load i16* %i
	%44 = add i16 %43, 1
	store i16 %44, i16* %i
	br label %L.41
L.50:
	store i8 32, i8* %tok
	%45 = load i16* %i
	%46 = add i16 %45, 1
	store i16 %46, i16* %i
	br label %L.41
L.51:
	store i8 33, i8* %tok
	%47 = load i16* %i
	%48 = add i16 %47, 1
	store i16 %48, i16* %i
	br label %L.41
L.52:
	store i8 36, i8* %tok
	%49 = load i16* %i
	%50 = add i16 %49, 1
	store i16 %50, i16* %i
	br label %L.41
L.53:
	store i8 37, i8* %tok
	%51 = load i16* %i
	%52 = add i16 %51, 1
	store i16 %52, i16* %i
	br label %L.41
L.54:
	store i8 8, i8* %tok
	%53 = load i16* %i
	%54 = add i16 %53, 1
	store i16 %54, i16* %i
	br label %L.41
L.55:
	store i8 34, i8* %tok
	%55 = load i16* %i
	%56 = add i16 %55, 1
	store i16 %56, i16* %i
	br label %L.41
L.56:
	store i8 35, i8* %tok
	%57 = load i16* %i
	%58 = add i16 %57, 1
	store i16 %58, i16* %i
	br label %L.41
L.57:
	store i8 5, i8* %state
	br label %L.41
L.58:
	store i8 1, i8* %state
	br label %L.41
L.59:
	store i8 11, i8* %state
	br label %L.41
L.60:
	store i8 8, i8* %state
	br label %L.41
L.61:
	store i8 9, i8* %state
	br label %L.41
L.62:
	store i8 10, i8* %state
	br label %L.41
L.63:
	store i8 6, i8* %state
	br label %L.41
L.64:
	store i8 7, i8* %state
	br label %L.41
L.65:
	store i8 12, i8* %state
	br label %L.41
L.66:
	store i8 13, i8* %state
	br label %L.41
L.67:
	store i64 0, i64* %n
	store i8 14, i8* %state
	br label %L.41
L.68:
	%59 = load i8* %c
	%60 = sub i8 %59, 48
	%61 = zext i8 %60 to i64
	store i64 %61, i64* %n
	store i8 18, i8* %state
	br label %L.41
L.69:
	store i8 20, i8* %state
	br label %L.41
L.70:
	store i8 0, i8* %j
	store i8 22, i8* %state
	br label %L.41
L.71:
	%62 = load i8* %c
	%63 = getelementptr [64 x i8]* @lex_Ident, i32 0, i32 0
	store i8 %62, i8* %63
	store i8 1, i8* %j
	store i8 19, i8* %state
	br label %L.41
L.40:
	br label %L.41
L.41:
	br label %L.12
L.14:
	%64 = load i8* %c
	%65 = zext i8 %64 to i32
	switch i32 %65, label %L.72 [
		i32 47, label %L.74
		i32 42, label %L.75
	]
L.74:
	store i8 2, i8* %state
	br label %L.73
L.75:
	store i8 3, i8* %state
	br label %L.73
L.72:
	store i8 19, i8* %tok
	br label %L.73
L.73:
	br label %L.12
L.15:
	%66 = load i8* %c
	%67 = icmp eq i8 %66, 10
	br i1 %67, label %L.77, label %L.76
L.77:
	store i8 0, i8* %state
	br label %L.76
L.76:
	br label %L.12
L.16:
	%68 = load i8* %c
	%69 = icmp eq i8 %68, 42
	br i1 %69, label %L.79, label %L.78
L.79:
	store i8 4, i8* %state
	br label %L.78
L.78:
	br label %L.12
L.17:
	%70 = load i8* %c
	%71 = icmp eq i8 %70, 47
	br i1 %71, label %L.81, label %L.82
L.81:
	store i8 0, i8* %state
	br label %L.80
L.82:
	store i8 3, i8* %state
	br label %L.80
L.80:
	br label %L.12
L.18:
	%72 = load i8* %c
	%73 = zext i8 %72 to i32
	switch i32 %73, label %L.83 [
		i32 46, label %L.85
	]
L.85:
	store i8 6, i8* %tok
	%74 = load i16* %i
	%75 = add i16 %74, 1
	store i16 %75, i16* %i
	br label %L.84
L.83:
	store i8 2, i8* %tok
	br label %L.84
L.84:
	br label %L.12
L.19:
	%76 = load i8* %c
	%77 = zext i8 %76 to i32
	switch i32 %77, label %L.86 [
		i32 61, label %L.88
	]
L.88:
	store i8 10, i8* %tok
	%78 = load i16* %i
	%79 = add i16 %78, 1
	store i16 %79, i16* %i
	br label %L.87
L.86:
	store i8 14, i8* %tok
	br label %L.87
L.87:
	br label %L.12
L.20:
	%80 = load i8* %c
	%81 = zext i8 %80 to i32
	switch i32 %81, label %L.89 [
		i32 61, label %L.91
	]
L.91:
	store i8 11, i8* %tok
	%82 = load i16* %i
	%83 = add i16 %82, 1
	store i16 %83, i16* %i
	br label %L.90
L.89:
	store i8 15, i8* %tok
	br label %L.90
L.90:
	br label %L.12
L.21:
	%84 = load i8* %c
	%85 = zext i8 %84 to i32
	switch i32 %85, label %L.92 [
		i32 61, label %L.94
		i32 60, label %L.95
	]
L.94:
	store i8 28, i8* %tok
	%86 = load i16* %i
	%87 = add i16 %86, 1
	store i16 %87, i16* %i
	br label %L.93
L.95:
	store i8 21, i8* %tok
	%88 = load i16* %i
	%89 = add i16 %88, 1
	store i16 %89, i16* %i
	br label %L.93
L.92:
	store i8 26, i8* %tok
	br label %L.93
L.93:
	br label %L.12
L.22:
	%90 = load i8* %c
	%91 = zext i8 %90 to i32
	switch i32 %91, label %L.96 [
		i32 61, label %L.98
		i32 62, label %L.99
	]
L.98:
	store i8 29, i8* %tok
	%92 = load i16* %i
	%93 = add i16 %92, 1
	store i16 %93, i16* %i
	br label %L.97
L.99:
	store i8 22, i8* %tok
	%94 = load i16* %i
	%95 = add i16 %94, 1
	store i16 %95, i16* %i
	br label %L.97
L.96:
	store i8 27, i8* %tok
	br label %L.97
L.97:
	br label %L.12
L.23:
	%96 = load i8* %c
	%97 = zext i8 %96 to i32
	switch i32 %97, label %L.100 [
		i32 61, label %L.102
	]
L.102:
	store i8 24, i8* %tok
	%98 = load i16* %i
	%99 = add i16 %98, 1
	store i16 %99, i16* %i
	br label %L.101
L.100:
	store i8 9, i8* %tok
	br label %L.101
L.101:
	br label %L.12
L.24:
	%100 = load i8* %c
	%101 = zext i8 %100 to i32
	switch i32 %101, label %L.103 [
		i32 61, label %L.105
	]
L.105:
	store i8 25, i8* %tok
	%102 = load i16* %i
	%103 = add i16 %102, 1
	store i16 %103, i16* %i
	br label %L.104
L.103:
	store i8 12, i8* %tok
	br label %L.104
L.104:
	br label %L.12
L.25:
	%104 = load i8* %c
	%105 = zext i8 %104 to i32
	switch i32 %105, label %L.106 [
		i32 38, label %L.108
	]
L.108:
	store i8 30, i8* %tok
	%106 = load i16* %i
	%107 = add i16 %106, 1
	store i16 %107, i16* %i
	br label %L.107
L.106:
	store i8 23, i8* %tok
	br label %L.107
L.107:
	br label %L.12
L.26:
	%108 = load i8* %c
	%109 = zext i8 %108 to i32
	switch i32 %109, label %L.109 [
		i32 124, label %L.111
	]
L.111:
	store i8 31, i8* %tok
	%110 = load i16* %i
	%111 = add i16 %110, 1
	store i16 %111, i16* %i
	br label %L.110
L.109:
	store i8 16, i8* %tok
	br label %L.110
L.110:
	br label %L.12
L.27:
	%112 = load i8* %c
	%113 = zext i8 %112 to i32
	switch i32 %113, label %L.112 [
		i32 98, label %L.114
		i32 111, label %L.115
		i32 120, label %L.116
		i32 48, label %L.117
		i32 49, label %L.117
		i32 50, label %L.117
		i32 51, label %L.117
		i32 52, label %L.117
		i32 53, label %L.117
		i32 54, label %L.117
		i32 55, label %L.117
		i32 56, label %L.117
		i32 57, label %L.117
		i32 95, label %L.118
	]
L.114:
	store i8 15, i8* %state
	br label %L.113
L.115:
	store i8 16, i8* %state
	br label %L.113
L.116:
	store i8 17, i8* %state
	br label %L.113
L.117:
	%114 = load i8* %c
	%115 = sub i8 %114, 48
	%116 = zext i8 %115 to i64
	store i64 %116, i64* %n
	store i8 18, i8* %state
	br label %L.113
L.118:
	store i8 18, i8* %state
	br label %L.113
L.112:
	%117 = load i64* %n
	store i64 %117, i64* @lex_Number
	store i8 38, i8* %tok
	br label %L.113
L.113:
	br label %L.12
L.28:
	%118 = load i8* %c
	%119 = zext i8 %118 to i32
	switch i32 %119, label %L.119 [
		i32 48, label %L.121
		i32 49, label %L.121
		i32 50, label %L.121
		i32 51, label %L.121
		i32 52, label %L.121
		i32 53, label %L.121
		i32 54, label %L.121
		i32 55, label %L.121
		i32 56, label %L.121
		i32 57, label %L.121
		i32 95, label %L.122
	]
L.121:
	%120 = load i64* %n
	%121 = mul i64 %120, 10
	%122 = load i8* %c
	%123 = sub i8 %122, 48
	%124 = zext i8 %123 to i64
	%125 = add i64 %121, %124
	store i64 %125, i64* %n
	br label %L.120
L.122:
	br label %L.120
L.119:
	%126 = load i64* %n
	store i64 %126, i64* @lex_Number
	store i8 38, i8* %tok
	br label %L.120
L.120:
	br label %L.12
L.29:
	%127 = load i8* %c
	%128 = zext i8 %127 to i32
	switch i32 %128, label %L.123 [
		i32 48, label %L.125
		i32 49, label %L.125
		i32 95, label %L.126
	]
L.125:
	%129 = load i64* %n
	%130 = shl i64 %129, 1
	%131 = load i8* %c
	%132 = sub i8 %131, 48
	%133 = zext i8 %132 to i64
	%134 = add i64 %130, %133
	store i64 %134, i64* %n
	br label %L.124
L.126:
	br label %L.124
L.123:
	%135 = load i64* %n
	store i64 %135, i64* @lex_Number
	store i8 38, i8* %tok
	br label %L.124
L.124:
	br label %L.12
L.30:
	%136 = load i8* %c
	%137 = zext i8 %136 to i32
	switch i32 %137, label %L.127 [
		i32 48, label %L.129
		i32 49, label %L.129
		i32 50, label %L.129
		i32 51, label %L.129
		i32 52, label %L.129
		i32 53, label %L.129
		i32 54, label %L.129
		i32 55, label %L.129
		i32 95, label %L.130
	]
L.129:
	%138 = load i64* %n
	%139 = shl i64 %138, 3
	%140 = load i8* %c
	%141 = sub i8 %140, 48
	%142 = zext i8 %141 to i64
	%143 = add i64 %139, %142
	store i64 %143, i64* %n
	br label %L.128
L.130:
	br label %L.128
L.127:
	%144 = load i64* %n
	store i64 %144, i64* @lex_Number
	store i8 38, i8* %tok
	br label %L.128
L.128:
	br label %L.12
L.31:
	%145 = load i8* %c
	%146 = zext i8 %145 to i32
	switch i32 %146, label %L.131 [
		i32 48, label %L.133
		i32 49, label %L.133
		i32 50, label %L.133
		i32 51, label %L.133
		i32 52, label %L.133
		i32 53, label %L.133
		i32 54, label %L.133
		i32 55, label %L.133
		i32 56, label %L.133
		i32 57, label %L.133
		i32 65, label %L.134
		i32 66, label %L.134
		i32 67, label %L.134
		i32 68, label %L.134
		i32 69, label %L.134
		i32 70, label %L.134
		i32 97, label %L.135
		i32 98, label %L.135
		i32 99, label %L.135
		i32 100, label %L.135
		i32 101, label %L.135
		i32 102, label %L.135
		i32 95, label %L.136
	]
L.133:
	%147 = load i64* %n
	%148 = shl i64 %147, 4
	%149 = load i8* %c
	%150 = sub i8 %149, 48
	%151 = zext i8 %150 to i64
	%152 = add i64 %148, %151
	store i64 %152, i64* %n
	br label %L.132
L.134:
	%153 = load i64* %n
	%154 = shl i64 %153, 4
	%155 = load i8* %c
	%156 = sub i8 %155, 65
	%157 = add i8 %156, 10
	%158 = zext i8 %157 to i64
	%159 = add i64 %154, %158
	store i64 %159, i64* %n
	br label %L.132
L.135:
	%160 = load i64* %n
	%161 = shl i64 %160, 4
	%162 = load i8* %c
	%163 = sub i8 %162, 97
	%164 = add i8 %163, 10
	%165 = zext i8 %164 to i64
	%166 = add i64 %161, %165
	store i64 %166, i64* %n
	br label %L.132
L.136:
	br label %L.132
L.131:
	%167 = load i64* %n
	store i64 %167, i64* @lex_Number
	store i8 38, i8* %tok
	br label %L.132
L.132:
	br label %L.12
L.32:
	%168 = load i8* %c
	%169 = zext i8 %168 to i32
	switch i32 %169, label %L.137 [
		i32 65, label %L.139
		i32 66, label %L.139
		i32 67, label %L.139
		i32 68, label %L.139
		i32 69, label %L.139
		i32 70, label %L.139
		i32 71, label %L.139
		i32 72, label %L.139
		i32 73, label %L.139
		i32 74, label %L.139
		i32 75, label %L.139
		i32 76, label %L.139
		i32 77, label %L.139
		i32 78, label %L.139
		i32 79, label %L.139
		i32 80, label %L.139
		i32 81, label %L.139
		i32 82, label %L.139
		i32 83, label %L.139
		i32 84, label %L.139
		i32 85, label %L.139
		i32 86, label %L.139
		i32 87, label %L.139
		i32 88, label %L.139
		i32 89, label %L.139
		i32 90, label %L.139
		i32 97, label %L.139
		i32 98, label %L.139
		i32 99, label %L.139
		i32 100, label %L.139
		i32 101, label %L.139
		i32 102, label %L.139
		i32 103, label %L.139
		i32 104, label %L.139
		i32 105, label %L.139
		i32 106, label %L.139
		i32 107, label %L.139
		i32 108, label %L.139
		i32 109, label %L.139
		i32 110, label %L.139
		i32 111, label %L.139
		i32 112, label %L.139
		i32 113, label %L.139
		i32 114, label %L.139
		i32 115, label %L.139
		i32 116, label %L.139
		i32 117, label %L.139
		i32 118, label %L.139
		i32 119, label %L.139
		i32 120, label %L.139
		i32 121, label %L.139
		i32 122, label %L.139
		i32 48, label %L.139
		i32 49, label %L.139
		i32 50, label %L.139
		i32 51, label %L.139
		i32 52, label %L.139
		i32 53, label %L.139
		i32 54, label %L.139
		i32 55, label %L.139
		i32 56, label %L.139
		i32 57, label %L.139
		i32 95, label %L.139
	]
L.139:
	%170 = load i8* %c
	%171 = load i8* %j
	%172 = zext i8 %171 to i32
	%173 = getelementptr [64 x i8]* @lex_Ident, i32 0, i32 %172
	store i8 %170, i8* %173
	%174 = load i8* %j
	%175 = add i8 %174, 1
	store i8 %175, i8* %j
	br label %L.138
L.137:
	%176 = load i8* %j
	%177 = zext i8 %176 to i32
	%178 = getelementptr [64 x i8]* @lex_Ident, i32 0, i32 %177
	store i8 0, i8* %178
	store i8 40, i8* %tok
	br label %L.138
L.138:
	br label %L.12
L.33:
	store i8 0, i8* %str
	%179 = load i8* %c
	%180 = zext i8 %179 to i32
	switch i32 %180, label %L.140 [
		i32 39, label %L.142
		i32 10, label %L.143
		i32 92, label %L.144
	]
L.142:
	call void @lex_Error(i8 5)
	store i8 0, i8* %state
	br label %L.141
L.143:
	call void @lex_Error(i8 2)
	store i8 0, i8* %state
	br label %L.141
L.144:
	store i8 23, i8* %state
	br label %L.141
L.140:
	%181 = load i8* %c
	%182 = zext i8 %181 to i32
	store i32 %182, i32* %h
	store i8 21, i8* %state
	br label %L.141
L.141:
	br label %L.12
L.34:
	%183 = load i8* %c
	%184 = zext i8 %183 to i32
	switch i32 %184, label %L.145 [
		i32 39, label %L.147
	]
L.147:
	%185 = load i32* %h
	%186 = zext i32 %185 to i64
	store i64 %186, i64* @lex_Number
	store i8 38, i8* %tok
	%187 = load i16* %i
	%188 = add i16 %187, 1
	store i16 %188, i16* %i
	br label %L.146
L.145:
	call void @lex_Error(i8 5)
	store i8 0, i8* %state
	br label %L.146
L.146:
	br label %L.12
L.35:
	store i8 1, i8* %str
	%189 = load i8* %c
	%190 = zext i8 %189 to i32
	switch i32 %190, label %L.148 [
		i32 34, label %L.150
		i32 10, label %L.151
		i32 92, label %L.152
	]
L.150:
	%191 = load i8* %j
	%192 = zext i8 %191 to i32
	%193 = getelementptr [128 x i8]* @lex_StringBuf, i32 0, i32 %192
	store i8 0, i8* %193
	%194 = load i8* %j
	%195 = add i8 %194, 1
	store i8 %195, i8* @lex_StringLen
	store i8 39, i8* %tok
	%196 = load i16* %i
	%197 = add i16 %196, 1
	store i16 %197, i16* %i
	br label %L.149
L.151:
	call void @lex_Error(i8 2)
	store i8 0, i8* %state
	br label %L.149
L.152:
	store i8 23, i8* %state
	br label %L.149
L.148:
	%198 = load i8* %j
	%199 = zext i8 %198 to i32
	%200 = icmp ult i32 %199, 127
	br i1 %200, label %L.154, label %L.155
L.154:
	%201 = load i8* %c
	%202 = load i8* %j
	%203 = zext i8 %202 to i32
	%204 = getelementptr [128 x i8]* @lex_StringBuf, i32 0, i32 %203
	store i8 %201, i8* %204
	%205 = load i8* %j
	%206 = add i8 %205, 1
	store i8 %206, i8* %j
	br label %L.153
L.155:
	call void @lex_Error(i8 9)
	br label %L.153
L.153:
	br label %L.149
L.149:
	br label %L.12
L.36:
	%207 = load i8* %c
	%208 = zext i8 %207 to i32
	switch i32 %208, label %L.156 [
		i32 10, label %L.158
		i32 120, label %L.159
		i32 117, label %L.160
		i32 85, label %L.161
	]
L.158:
	call void @lex_Error(i8 2)
	store i8 0, i8* %state
	br label %L.157
L.159:
	store i32 0, i32* %h
	store i8 24, i8* %state
	br label %L.157
L.160:
	store i32 0, i32* %h
	store i8 26, i8* %state
	br label %L.157
L.161:
	store i32 0, i32* %h
	store i8 30, i8* %state
	br label %L.157
L.156:
	%209 = load i8* %str
	%210 = icmp ne i8 %209, 0
	br i1 %210, label %L.163, label %L.164
L.163:
	%211 = load i8* %j
	%212 = zext i8 %211 to i32
	%213 = icmp ult i32 %212, 127
	br i1 %213, label %L.166, label %L.167
L.166:
	%214 = load i8* %c
	%215 = call i8 @lex_EscChar(i8 %214)
	%216 = load i8* %j
	%217 = zext i8 %216 to i32
	%218 = getelementptr [128 x i8]* @lex_StringBuf, i32 0, i32 %217
	store i8 %215, i8* %218
	%219 = load i8* %j
	%220 = add i8 %219, 1
	store i8 %220, i8* %j
	br label %L.165
L.167:
	call void @lex_Error(i8 9)
	br label %L.165
L.165:
	store i8 22, i8* %state
	br label %L.162
L.164:
	%221 = load i8* %c
	%222 = call i8 @lex_EscChar(i8 %221)
	%223 = zext i8 %222 to i32
	store i32 %223, i32* %h
	store i8 21, i8* %state
	br label %L.162
L.162:
	br label %L.157
L.157:
	br label %L.12
L.37:
	%224 = load i8* %c
	%225 = zext i8 %224 to i32
	switch i32 %225, label %L.168 [
		i32 10, label %L.170
	]
L.170:
	call void @lex_Error(i8 2)
	store i8 0, i8* %state
	br label %L.169
L.168:
	%226 = load i8* %c
	%227 = load i32* %h
	%228 = call i32 @lex_EscHex(i8 %226, i32 %227)
	store i32 %228, i32* %h
	%229 = load i8* %state
	%230 = add i8 %229, 1
	store i8 %230, i8* %state
	br label %L.169
L.169:
	br label %L.12
L.38:
	%231 = load i8* %c
	%232 = zext i8 %231 to i32
	switch i32 %232, label %L.171 [
		i32 10, label %L.173
	]
L.173:
	call void @lex_Error(i8 2)
	store i8 0, i8* %state
	br label %L.172
L.171:
	%233 = load i8* %c
	%234 = load i32* %h
	%235 = call i32 @lex_EscHex(i8 %233, i32 %234)
	store i32 %235, i32* %h
	%236 = load i8* %str
	%237 = icmp ne i8 %236, 0
	br i1 %237, label %L.175, label %L.176
L.175:
	%238 = load i8* %j
	%239 = zext i8 %238 to i32
	%240 = icmp ult i32 %239, 127
	br i1 %240, label %L.178, label %L.179
L.178:
	%241 = load i32* %h
	%242 = trunc i32 %241 to i8
	%243 = load i8* %j
	%244 = zext i8 %243 to i32
	%245 = getelementptr [128 x i8]* @lex_StringBuf, i32 0, i32 %244
	store i8 %242, i8* %245
	%246 = load i8* %j
	%247 = add i8 %246, 1
	store i8 %247, i8* %j
	br label %L.177
L.179:
	call void @lex_Error(i8 9)
	br label %L.177
L.177:
	store i8 22, i8* %state
	br label %L.174
L.176:
	store i8 21, i8* %state
	br label %L.174
L.174:
	br label %L.172
L.172:
	br label %L.12
L.39:
	%248 = load i8* %c
	%249 = zext i8 %248 to i32
	switch i32 %249, label %L.180 [
		i32 10, label %L.182
	]
L.182:
	call void @lex_Error(i8 2)
	store i8 0, i8* %state
	br label %L.181
L.180:
	%250 = load i8* %c
	%251 = load i32* %h
	%252 = call i32 @lex_EscHex(i8 %250, i32 %251)
	store i32 %252, i32* %h
	%253 = load i8* %str
	%254 = icmp ne i8 %253, 0
	br i1 %254, label %L.184, label %L.185
L.184:
	%255 = load i32* %h
	%256 = load i8* %j
	%257 = zext i8 %256 to i32
	%258 = call i32 @lex_EscUTF8(i32 %255, i32 %257)
	%259 = trunc i32 %258 to i8
	store i8 %259, i8* %j
	store i8 22, i8* %state
	br label %L.183
L.185:
	store i8 21, i8* %state
	br label %L.183
L.183:
	br label %L.181
L.181:
	br label %L.12
L.11:
	br label %L.12
L.12:
	%260 = load i8* %tok
	%261 = icmp ne i8 %260, 0
	br i1 %261, label %L.2, label %L.186
L.186:
	%262 = load i8* %c
	%263 = icmp eq i8 %262, 10
	br i1 %263, label %L.188, label %L.187
L.188:
	%264 = load %lex.FileContext** @lex_f
	%265 = getelementptr %lex.FileContext* %264, i32 0, i32 2
	%266 = load i16* %265
	%267 = add i16 %266, 1
	store i16 %267, i16* %265
	br label %L.187
L.187:
	%268 = load i16* %i
	%269 = add i16 %268, 1
	store i16 %269, i16* %i
	br label %L.1
L.2:
	%270 = load i16* %i
	%271 = load %lex.FileContext** @lex_f
	%272 = getelementptr %lex.FileContext* %271, i32 0, i32 3
	store i16 %270, i16* %272
	%273 = load i8* %tok
	store i8 %273, i8* @lex_Token
	%274 = load i8* %tok
	store i8 %274, i8* %rv.0
	br label %return
return:
	%275 = load i8* %rv.0
	ret i8 %275
}
define zeroext i8 @lex_Expect(i8 zeroext %expect.arg) nounwind {
L.0:
	%rv.0 = alloca i8
	%expect = alloca i8
	store i8 %expect.arg, i8* %expect
	%tok = alloca i8
	%0 = load i8* @lex_Token
	%1 = load i8* %expect
	%2 = icmp eq i8 %0, %1
	br i1 %2, label %L.2, label %L.3
L.2:
	%3 = call i8 @lex_Next()
	store i8 %3, i8* %tok
	br label %L.1
L.3:
	%4 = load i8* %expect
	call void @lex_ErrorT(i8 10, i8 %4)
	br label %L.1
L.1:
	%5 = load i8* %tok
	store i8 %5, i8* %rv.0
	br label %return
return:
	%6 = load i8* %rv.0
	ret i8 %6
}
define zeroext i8 @lex_Keyword([0 x i8]* %toklist.arg) nounwind {
L.0:
	%rv.0 = alloca i8
	%toklist = alloca [0 x i8]*
	store [0 x i8]* %toklist.arg, [0 x i8]** %toklist
	%tok = alloca i8
	%i = alloca i32
	%0 = load i8* @lex_Token
	%1 = icmp eq i8 %0, 40
	br i1 %1, label %L.2, label %L.1
L.2:
	store i32 0, i32* %i
	br label %L.3
L.3:
	%2 = load [0 x i8]** %toklist
	%3 = load i32* %i
	%4 = getelementptr [0 x i8]* %2, i32 0, i32 %3
	%5 = load i8* %4
	store i8 %5, i8* %tok
	%6 = load i8* %tok
	%7 = icmp eq i8 %6, 0
	br i1 %7, label %L.4, label %L.5
L.5:
	%8 = getelementptr [64 x i8]* @lex_Ident
	%9 = bitcast [64 x i8]* %8 to [0 x i8]*
	%10 = load i8* %tok
	%11 = zext i8 %10 to i32
	%12 = getelementptr [82 x [0 x i8]*]* @lex_keywords, i32 0, i32 %11
	%13 = load [0 x i8]** %12
	%14 = getelementptr [0 x i8]* %13
	%15 = call i8 @zstr_eq([0 x i8]* %9, [0 x i8]* %14, i32 63)
	%16 = icmp ne i8 %15, 0
	br i1 %16, label %L.7, label %L.6
L.7:
	%17 = load i8* %tok
	store i8 %17, i8* %rv.0
	br label %return
L.6:
	%18 = load i32* %i
	%19 = add i32 %18, 1
	store i32 %19, i32* %i
	br label %L.3
L.4:
	br label %L.1
L.1:
	%20 = load i8* @lex_Token
	store i8 %20, i8* %rv.0
	br label %return
return:
	%21 = load i8* %rv.0
	ret i8 %21
}
define void @lex_WhereAmI([0 x i8]* %msg.arg) nounwind {
L.0:
	%msg = alloca [0 x i8]*
	store [0 x i8]* %msg.arg, [0 x i8]** %msg
	%0 = load [0 x i8]** %msg
	%1 = bitcast [0 x i8]* %0 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %1)
	%2 = getelementptr [6 x i8]* @.str172
	%3 = bitcast [6 x i8]* %2 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %3)
	%4 = load i8* @lex_Token
	%5 = zext i8 %4 to i32
	%6 = getelementptr [82 x [0 x i8]*]* @lex_keywords, i32 0, i32 %5
	%7 = load [0 x i8]** %6
	%8 = bitcast [0 x i8]* %7 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %8)
	%9 = load i8* @lex_Token
	%10 = icmp eq i8 %9, 40
	br i1 %10, label %L.2, label %L.1
L.2:
	%11 = getelementptr [3 x i8]* @.str173
	%12 = bitcast [3 x i8]* %11 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %12)
	%13 = getelementptr [64 x i8]* @lex_Ident
	%14 = bitcast [64 x i8]* %13 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %14)
	call void @out_chr(i32 2, i8 34)
	br label %L.1
L.1:
	call void @out_nl(i32 2)
	br label %return
return:
	ret void
}
@lex_plist = internal constant [2 x i8] [ i8 33, i8 0 ]
@lex_alist = internal constant [2 x i8] [ i8 35, i8 0 ]
@lex_glist = internal constant [2 x i8] [ i8 37, i8 0 ]
define zeroext i8 @lex_Skip([0 x i8]* %toklist.arg) nounwind {
L.0:
	%rv.0 = alloca i8
	%toklist = alloca [0 x i8]*
	store [0 x i8]* %toklist.arg, [0 x i8]** %toklist
	%tok = alloca i8
	%ttok = alloca i8
	%i = alloca i32
	%0 = call i8 @lex_Next()
	store i8 %0, i8* %tok
	br label %L.1
L.1:
	%1 = load i8* %tok
	%2 = icmp ne i8 %1, 1
	%3 = xor i1 %2, true
	br i1 %3, label %L.2, label %L.3
L.3:
	store i32 0, i32* %i
	br label %L.4
L.4:
	%4 = load [0 x i8]** %toklist
	%5 = load i32* %i
	%6 = getelementptr [0 x i8]* %4, i32 0, i32 %5
	%7 = load i8* %6
	store i8 %7, i8* %ttok
	%8 = load i8* %ttok
	%9 = icmp eq i8 %8, 0
	br i1 %9, label %L.8, label %L.7
L.7:
	%10 = load i8* %tok
	%11 = load i8* %ttok
	%12 = icmp eq i8 %10, %11
	br label %L.8
L.8:
	%13 = phi i1 [ true, %L.4 ], [ %12, %L.7 ]
	br i1 %13, label %L.5, label %L.6
L.6:
	%14 = load i32* %i
	%15 = add i32 %14, 1
	store i32 %15, i32* %i
	br label %L.4
L.5:
	%16 = load i8* %ttok
	%17 = icmp ne i8 %16, 0
	br i1 %17, label %L.2, label %L.9
L.9:
	%18 = load i8* %tok
	%19 = zext i8 %18 to i32
	switch i32 %19, label %L.10 [
		i32 32, label %L.12
		i32 34, label %L.13
		i32 36, label %L.14
	]
L.12:
	%20 = getelementptr [2 x i8]* @lex_plist
	%21 = bitcast [2 x i8]* %20 to [0 x i8]*
	%22 = call i8 @lex_Skip([0 x i8]* %21)
	store i8 %22, i8* %tok
	br label %L.11
L.13:
	%23 = getelementptr [2 x i8]* @lex_alist
	%24 = bitcast [2 x i8]* %23 to [0 x i8]*
	%25 = call i8 @lex_Skip([0 x i8]* %24)
	store i8 %25, i8* %tok
	br label %L.11
L.14:
	%26 = getelementptr [2 x i8]* @lex_glist
	%27 = bitcast [2 x i8]* %26 to [0 x i8]*
	%28 = call i8 @lex_Skip([0 x i8]* %27)
	store i8 %28, i8* %tok
	br label %L.11
L.10:
	br label %L.11
L.11:
	%29 = call i8 @lex_Next()
	store i8 %29, i8* %tok
	br label %L.1
L.2:
	%30 = load i8* %tok
	store i8 %30, i8* %rv.0
	br label %return
return:
	%31 = load i8* %rv.0
	ret i8 %31
}
define zeroext i8 @lex_Want([0 x i8]* %toklist.arg) nounwind {
L.0:
	%rv.0 = alloca i8
	%toklist = alloca [0 x i8]*
	store [0 x i8]* %toklist.arg, [0 x i8]** %toklist
	%tok = alloca i8
	%0 = load i8* @lex_Token
	store i8 %0, i8* %tok
	%1 = load i8* %tok
	%2 = load [0 x i8]** %toklist
	%3 = getelementptr [0 x i8]* %2, i32 0, i32 0
	%4 = load i8* %3
	%5 = icmp ne i8 %1, %4
	br i1 %5, label %L.2, label %L.1
L.2:
	%6 = load [0 x i8]** %toklist
	%7 = getelementptr [0 x i8]* %6, i32 0, i32 0
	%8 = load i8* %7
	call void @lex_ErrorT(i8 10, i8 %8)
	%9 = load [0 x i8]** %toklist
	%10 = call i8 @lex_Skip([0 x i8]* %9)
	store i8 %10, i8* %tok
	br label %L.1
L.1:
	%11 = load i8* %tok
	store i8 %11, i8* %rv.0
	br label %return
return:
	%12 = load i8* %rv.0
	ret i8 %12
}
%type.TypeListEntry = type {%type.TypeListEntry*, %type.TypeNode*}
%symb.SymbNode = type {%symb.SymbNode*, %type.TypeNode*, %symb.SymbNode*, %symb.SymbNode*, %type.TypeListEntry*, %symb.SymbNode*, %symb.SymbNode*, i64, i64, i16, i16, i16, i8, i8, i8, i8, i8, i8, i8, [0 x i8]}
%type.TypeNode = type {%type.TypeNode*, %type.TypeNode*, %symb.SymbNode*, %symb.SymbNode*, %symb.SymbNode*, i64, i64, i32, i32, i32, i16, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8}
@type_unkntype = internal global %type.TypeNode* zeroinitializer, align 4
@type_booltype = internal global %type.TypeNode* zeroinitializer, align 4
@type_bytetype = internal global %type.TypeNode* zeroinitializer, align 4
@type_wordtype = internal global %type.TypeNode* zeroinitializer, align 4
@type_swordtype = internal global %type.TypeNode* zeroinitializer, align 4
@type_memtype = internal global %type.TypeNode* zeroinitializer, align 4
@type_uinttypes = internal global [4 x %type.TypeNode*] zeroinitializer, align 4
@type_inttypes = internal global [4 x %type.TypeNode*] zeroinitializer, align 4
@target_DefaultTarget = internal constant [4 x i8] c"x86\00"
@target_TargetName = internal global [0 x i8]* zeroinitializer, align 4
%target.SizeAlign = type {i8, i8}
%target.TargetT = type {[0 x i8]*, [0 x i8]*, i8, i8, i8, i8, i8, i8, %target.SizeAlign, [8 x %target.SizeAlign]}
@target_Targets = internal constant [11 x %target.TargetT] [ %target.TargetT { [0 x i8] * bitcast( [4 x i8]* getelementptr( [4 x i8]* @.str180 )  to [0 x i8]* ), [0 x i8] * bitcast( [23 x i8]* getelementptr( [23 x i8]* @.str181 )  to [0 x i8]* ), i8 2, i8 8, i8 32, i8 0, i8 0, i8 4, %target.SizeAlign { i8 32, i8 32 }, [8 x %target.SizeAlign] [ %target.SizeAlign { i8 8, i8 8 }, %target.SizeAlign { i8 16, i8 16 }, %target.SizeAlign { i8 32, i8 32 }, %target.SizeAlign { i8 64, i8 32 }, %target.SizeAlign { i8 0, i8 0 }, %target.SizeAlign { i8 0, i8 0 }, %target.SizeAlign { i8 0, i8 0 }, %target.SizeAlign { i8 0, i8 0 } ] }, %target.TargetT { [0 x i8] * bitcast( [7 x i8]* getelementptr( [7 x i8]* @.str193 )  to [0 x i8]* ), [0 x i8] * bitcast( [25 x i8]* getelementptr( [25 x i8]* @.str194 )  to [0 x i8]* ), i8 2, i8 8, i8 64, i8 0, i8 0, i8 4, %target.SizeAlign { i8 64, i8 64 }, [8 x %target.SizeAlign] [ %target.SizeAlign { i8 8, i8 8 }, %target.SizeAlign { i8 16, i8 16 }, %target.SizeAlign { i8 32, i8 32 }, %target.SizeAlign { i8 64, i8 64 }, %target.SizeAlign { i8 0, i8 0 }, %target.SizeAlign { i8 0, i8 0 }, %target.SizeAlign { i8 0, i8 0 }, %target.SizeAlign { i8 0, i8 0 } ] }, %target.TargetT { [0 x i8] * bitcast( [7 x i8]* getelementptr( [7 x i8]* @.str206 )  to [0 x i8]* ), [0 x i8] * bitcast( [25 x i8]* getelementptr( [25 x i8]* @.str207 )  to [0 x i8]* ), i8 2, i8 8, i8 64, i8 0, i8 0, i8 4, %target.SizeAlign { i8 64, i8 64 }, [8 x %target.SizeAlign] [ %target.SizeAlign { i8 8, i8 8 }, %target.SizeAlign { i8 16, i8 16 }, %target.SizeAlign { i8 32, i8 32 }, %target.SizeAlign { i8 64, i8 64 }, %target.SizeAlign { i8 0, i8 0 }, %target.SizeAlign { i8 0, i8 0 }, %target.SizeAlign { i8 0, i8 0 }, %target.SizeAlign { i8 0, i8 0 } ] }, %target.TargetT { [0 x i8] * bitcast( [14 x i8]* getelementptr( [14 x i8]* @.str219 )  to [0 x i8]* ), [0 x i8] * bitcast( [22 x i8]* getelementptr( [22 x i8]* @.str220 )  to [0 x i8]* ), i8 2, i8 8, i8 64, i8 0, i8 0, i8 4, %target.SizeAlign { i8 64, i8 64 }, [8 x %target.SizeAlign] [ %target.SizeAlign { i8 8, i8 8 }, %target.SizeAlign { i8 16, i8 16 }, %target.SizeAlign { i8 32, i8 32 }, %target.SizeAlign { i8 64, i8 64 }, %target.SizeAlign { i8 0, i8 0 }, %target.SizeAlign { i8 0, i8 0 }, %target.SizeAlign { i8 0, i8 0 }, %target.SizeAlign { i8 0, i8 0 } ] }, %target.TargetT { [0 x i8] * bitcast( [7 x i8]* getelementptr( [7 x i8]* @.str232 )  to [0 x i8]* ), [0 x i8] * bitcast( [23 x i8]* getelementptr( [23 x i8]* @.str233 )  to [0 x i8]* ), i8 2, i8 8, i8 16, i8 1, i8 0, i8 3, %target.SizeAlign { i8 16, i8 16 }, [8 x %target.SizeAlign] [ %target.SizeAlign { i8 8, i8 8 }, %target.SizeAlign { i8 16, i8 16 }, %target.SizeAlign { i8 32, i8 16 }, %target.SizeAlign { i8 0, i8 0 }, %target.SizeAlign { i8 0, i8 0 }, %target.SizeAlign { i8 0, i8 0 }, %target.SizeAlign { i8 0, i8 0 }, %target.SizeAlign { i8 0, i8 0 } ] }, %target.TargetT { [0 x i8] * bitcast( [10 x i8]* getelementptr( [10 x i8]* @.str245 )  to [0 x i8]* ), [0 x i8] * bitcast( [23 x i8]* getelementptr( [23 x i8]* @.str246 )  to [0 x i8]* ), i8 2, i8 8, i8 32, i8 1, i8 0, i8 4, %target.SizeAlign { i8 32, i8 32 }, [8 x %target.SizeAlign] [ %target.SizeAlign { i8 8, i8 8 }, %target.SizeAlign { i8 16, i8 16 }, %target.SizeAlign { i8 32, i8 32 }, %target.SizeAlign { i8 64, i8 32 }, %target.SizeAlign { i8 0, i8 0 }, %target.SizeAlign { i8 0, i8 0 }, %target.SizeAlign { i8 0, i8 0 }, %target.SizeAlign { i8 0, i8 0 } ] }, %target.TargetT { [0 x i8] * bitcast( [6 x i8]* getelementptr( [6 x i8]* @.str258 )  to [0 x i8]* ), [0 x i8] * bitcast( [18 x i8]* getelementptr( [18 x i8]* @.str259 )  to [0 x i8]* ), i8 1, i8 8, i8 32, i8 1, i8 0, i8 4, %target.SizeAlign { i8 32, i8 32 }, [8 x %target.SizeAlign] [ %target.SizeAlign { i8 8, i8 8 }, %target.SizeAlign { i8 16, i8 16 }, %target.SizeAlign { i8 32, i8 32 }, %target.SizeAlign { i8 64, i8 32 }, %target.SizeAlign { i8 0, i8 0 }, %target.SizeAlign { i8 0, i8 0 }, %target.SizeAlign { i8 0, i8 0 }, %target.SizeAlign { i8 0, i8 0 } ] }, %target.TargetT { [0 x i8] * bitcast( [6 x i8]* getelementptr( [6 x i8]* @.str271 )  to [0 x i8]* ), [0 x i8] * bitcast( [20 x i8]* getelementptr( [20 x i8]* @.str272 )  to [0 x i8]* ), i8 1, i8 8, i8 64, i8 1, i8 0, i8 4, %target.SizeAlign { i8 64, i8 64 }, [8 x %target.SizeAlign] [ %target.SizeAlign { i8 8, i8 8 }, %target.SizeAlign { i8 16, i8 16 }, %target.SizeAlign { i8 32, i8 32 }, %target.SizeAlign { i8 64, i8 64 }, %target.SizeAlign { i8 0, i8 0 }, %target.SizeAlign { i8 0, i8 0 }, %target.SizeAlign { i8 0, i8 0 }, %target.SizeAlign { i8 0, i8 0 } ] }, %target.TargetT { [0 x i8] * bitcast( [6 x i8]* getelementptr( [6 x i8]* @.str284 )  to [0 x i8]* ), [0 x i8] * bitcast( [22 x i8]* getelementptr( [22 x i8]* @.str285 )  to [0 x i8]* ), i8 1, i8 8, i8 64, i8 1, i8 0, i8 4, %target.SizeAlign { i8 64, i8 64 }, [8 x %target.SizeAlign] [ %target.SizeAlign { i8 8, i8 8 }, %target.SizeAlign { i8 16, i8 16 }, %target.SizeAlign { i8 32, i8 32 }, %target.SizeAlign { i8 64, i8 64 }, %target.SizeAlign { i8 0, i8 0 }, %target.SizeAlign { i8 0, i8 0 }, %target.SizeAlign { i8 0, i8 0 }, %target.SizeAlign { i8 0, i8 0 } ] }, %target.TargetT { [0 x i8] * bitcast( [8 x i8]* getelementptr( [8 x i8]* @.str297 )  to [0 x i8]* ), [0 x i8] * bitcast( [22 x i8]* getelementptr( [22 x i8]* @.str298 )  to [0 x i8]* ), i8 1, i8 8, i8 64, i8 1, i8 0, i8 4, %target.SizeAlign { i8 64, i8 64 }, [8 x %target.SizeAlign] [ %target.SizeAlign { i8 8, i8 8 }, %target.SizeAlign { i8 16, i8 16 }, %target.SizeAlign { i8 32, i8 32 }, %target.SizeAlign { i8 64, i8 64 }, %target.SizeAlign { i8 0, i8 0 }, %target.SizeAlign { i8 0, i8 0 }, %target.SizeAlign { i8 0, i8 0 }, %target.SizeAlign { i8 0, i8 0 } ] }, %target.TargetT { [0 x i8] * bitcast( [5 x i8]* getelementptr( [5 x i8]* @.str310 )  to [0 x i8]* ), [0 x i8] * bitcast( [21 x i8]* getelementptr( [21 x i8]* @.str311 )  to [0 x i8]* ), i8 1, i8 8, i8 32, i8 1, i8 0, i8 4, %target.SizeAlign { i8 32, i8 32 }, [8 x %target.SizeAlign] [ %target.SizeAlign { i8 8, i8 8 }, %target.SizeAlign { i8 16, i8 16 }, %target.SizeAlign { i8 32, i8 32 }, %target.SizeAlign { i8 64, i8 32 }, %target.SizeAlign { i8 0, i8 0 }, %target.SizeAlign { i8 0, i8 0 }, %target.SizeAlign { i8 0, i8 0 }, %target.SizeAlign { i8 0, i8 0 } ] } ], align 4
@target_Target = internal global %target.TargetT* zeroinitializer, align 4
define void @target_list() nounwind {
L.0:
	%i = alloca i8
	%0 = getelementptr [42 x i8]* @.str322
	%1 = bitcast [42 x i8]* %0 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %1)
	store i8 0, i8* %i
	br label %L.1
L.1:
	%2 = load i8* %i
	%3 = zext i8 %2 to i32
	%4 = icmp ult i32 %3, 11
	%5 = xor i1 %4, true
	br i1 %5, label %L.2, label %L.3
L.3:
	%6 = load i8* %i
	%7 = zext i8 %6 to i32
	%8 = getelementptr [11 x %target.TargetT]* @target_Targets, i32 0, i32 %7
	%9 = getelementptr %target.TargetT* %8, i32 0, i32 0
	%10 = load [0 x i8]** %9
	%11 = bitcast [0 x i8]* %10 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %11)
	%12 = getelementptr [3 x i8]* @.str323
	%13 = bitcast [3 x i8]* %12 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %13)
	%14 = load i8* %i
	%15 = zext i8 %14 to i32
	%16 = getelementptr [11 x %target.TargetT]* @target_Targets, i32 0, i32 %15
	%17 = getelementptr %target.TargetT* %16, i32 0, i32 1
	%18 = load [0 x i8]** %17
	%19 = bitcast [0 x i8]* %18 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %19)
	call void @out_nl(i32 2)
	%20 = load i8* %i
	%21 = add i8 %20, 1
	store i8 %21, i8* %i
	br label %L.1
L.2:
	br label %return
return:
	ret void
}
define zeroext i8 @target_set([0 x i8]* %name.arg) nounwind {
L.0:
	%rv.0 = alloca i8
	%name = alloca [0 x i8]*
	store [0 x i8]* %name.arg, [0 x i8]** %name
	%i = alloca i8
	%0 = load [0 x i8]** %name
	%1 = icmp eq [0 x i8]* %0, null
	br i1 %1, label %L.2, label %L.1
L.2:
	%2 = bitcast [4 x i8]* @target_DefaultTarget to [0 x i8]*
	store [0 x i8]* %2, [0 x i8]** %name
	br label %L.1
L.1:
	store i8 0, i8* %i
	br label %L.3
L.3:
	%3 = load i8* %i
	%4 = zext i8 %3 to i32
	%5 = icmp ult i32 %4, 11
	%6 = xor i1 %5, true
	br i1 %6, label %L.4, label %L.5
L.5:
	%7 = load [0 x i8]** %name
	%8 = bitcast [0 x i8]* %7 to [0 x i8]*
	%9 = load i8* %i
	%10 = zext i8 %9 to i32
	%11 = getelementptr [11 x %target.TargetT]* @target_Targets, i32 0, i32 %10
	%12 = getelementptr %target.TargetT* %11, i32 0, i32 0
	%13 = load [0 x i8]** %12
	%14 = bitcast [0 x i8]* %13 to [0 x i8]*
	%15 = call i8 @zstr_eq([0 x i8]* %8, [0 x i8]* %14, i32 63)
	%16 = icmp ne i8 %15, 0
	br i1 %16, label %L.7, label %L.6
L.7:
	%17 = load i8* %i
	%18 = zext i8 %17 to i32
	%19 = getelementptr [11 x %target.TargetT]* @target_Targets, i32 0, i32 %18
	store %target.TargetT* %19, %target.TargetT** @target_Target
	%20 = load i8* %i
	%21 = zext i8 %20 to i32
	%22 = getelementptr [11 x %target.TargetT]* @target_Targets, i32 0, i32 %21
	%23 = getelementptr %target.TargetT* %22, i32 0, i32 0
	%24 = load [0 x i8]** %23
	%25 = bitcast [0 x i8]* %24 to [0 x i8]*
	store [0 x i8]* %25, [0 x i8]** @target_TargetName
	store i8 1, i8* %rv.0
	br label %return
L.6:
	%26 = load i8* %i
	%27 = add i8 %26, 1
	store i8 %27, i8* %i
	br label %L.3
L.4:
	store i8 0, i8* %rv.0
	br label %return
return:
	%28 = load i8* %rv.0
	ret i8 %28
}
define i32 @target_isize(i32 %bits.arg) nounwind {
L.0:
	%rv.0 = alloca i32
	%bits = alloca i32
	store i32 %bits.arg, i32* %bits
	%i = alloca i8
	store i8 0, i8* %i
	br label %L.1
L.1:
	%0 = load i8* %i
	%1 = load %target.TargetT** @target_Target
	%2 = getelementptr %target.TargetT* %1, i32 0, i32 7
	%3 = load i8* %2
	%4 = icmp ult i8 %0, %3
	br i1 %4, label %L.4, label %L.5
L.4:
	%5 = load %target.TargetT** @target_Target
	%6 = getelementptr %target.TargetT* %5, i32 0, i32 9
	%7 = load i8* %i
	%8 = zext i8 %7 to i32
	%9 = getelementptr [8 x %target.SizeAlign]* %6, i32 0, i32 %8
	%10 = getelementptr %target.SizeAlign* %9, i32 0, i32 0
	%11 = load i8* %10
	%12 = zext i8 %11 to i32
	%13 = load i32* %bits
	%14 = icmp ult i32 %12, %13
	br label %L.5
L.5:
	%15 = phi i1 [ false, %L.1 ], [ %14, %L.4 ]
	%16 = xor i1 %15, true
	br i1 %16, label %L.2, label %L.3
L.3:
	%17 = load i8* %i
	%18 = add i8 %17, 1
	store i8 %18, i8* %i
	br label %L.1
L.2:
	%19 = load %target.TargetT** @target_Target
	%20 = getelementptr %target.TargetT* %19, i32 0, i32 9
	%21 = load i8* %i
	%22 = zext i8 %21 to i32
	%23 = getelementptr [8 x %target.SizeAlign]* %20, i32 0, i32 %22
	%24 = getelementptr %target.SizeAlign* %23, i32 0, i32 0
	%25 = load i8* %24
	%26 = zext i8 %25 to i32
	store i32 %26, i32* %rv.0
	br label %return
return:
	%27 = load i32* %rv.0
	ret i32 %27
}
define i32 @target_ialign(i32 %bits.arg) nounwind {
L.0:
	%rv.0 = alloca i32
	%bits = alloca i32
	store i32 %bits.arg, i32* %bits
	%i = alloca i8
	store i8 0, i8* %i
	br label %L.1
L.1:
	%0 = load i8* %i
	%1 = load %target.TargetT** @target_Target
	%2 = getelementptr %target.TargetT* %1, i32 0, i32 7
	%3 = load i8* %2
	%4 = icmp ult i8 %0, %3
	br i1 %4, label %L.4, label %L.5
L.4:
	%5 = load %target.TargetT** @target_Target
	%6 = getelementptr %target.TargetT* %5, i32 0, i32 9
	%7 = load i8* %i
	%8 = zext i8 %7 to i32
	%9 = getelementptr [8 x %target.SizeAlign]* %6, i32 0, i32 %8
	%10 = getelementptr %target.SizeAlign* %9, i32 0, i32 0
	%11 = load i8* %10
	%12 = zext i8 %11 to i32
	%13 = load i32* %bits
	%14 = icmp ult i32 %12, %13
	br label %L.5
L.5:
	%15 = phi i1 [ false, %L.1 ], [ %14, %L.4 ]
	%16 = xor i1 %15, true
	br i1 %16, label %L.2, label %L.3
L.3:
	%17 = load i8* %i
	%18 = add i8 %17, 1
	store i8 %18, i8* %i
	br label %L.1
L.2:
	%19 = load %target.TargetT** @target_Target
	%20 = getelementptr %target.TargetT* %19, i32 0, i32 9
	%21 = load i8* %i
	%22 = zext i8 %21 to i32
	%23 = getelementptr [8 x %target.SizeAlign]* %20, i32 0, i32 %22
	%24 = getelementptr %target.SizeAlign* %23, i32 0, i32 1
	%25 = load i8* %24
	%26 = zext i8 %25 to i32
	store i32 %26, i32* %rv.0
	br label %return
return:
	%27 = load i32* %rv.0
	ret i32 %27
}
@symb_level = internal global i8 0, align 1
@symb_curpack = internal global %symb.SymbNode* zeroinitializer, align 4
@symb_curproc = internal global %symb.SymbNode* zeroinitializer, align 4
%symb.symblist = type {%symb.SymbNode*, %symb.SymbNode*}
@symb_symbs = internal global [32 x %symb.symblist] zeroinitializer, align 4
define zeroext i8 @symb_IsAnon([0 x i8]* %id.arg) nounwind {
L.0:
	%rv.0 = alloca i8
	%id = alloca [0 x i8]*
	store [0 x i8]* %id.arg, [0 x i8]** %id
	%0 = load [0 x i8]** %id
	%1 = bitcast [0 x i8]* %0 to [0 x i8]*
	%2 = getelementptr [2 x i8]* @.str324
	%3 = bitcast [2 x i8]* %2 to [0 x i8]*
	%4 = call i8 @zstr_eq([0 x i8]* %1, [0 x i8]* %3, i32 63)
	store i8 %4, i8* %rv.0
	br label %return
return:
	%5 = load i8* %rv.0
	ret i8 %5
}
define zeroext i8 @symb_IsUniqueLocal(%symb.SymbNode* %s.arg, [0 x i8]* %id.arg) nounwind {
L.0:
	%rv.0 = alloca i8
	%s = alloca %symb.SymbNode*
	%id = alloca [0 x i8]*
	store %symb.SymbNode* %s.arg, %symb.SymbNode** %s
	store [0 x i8]* %id.arg, [0 x i8]** %id
	%0 = load [0 x i8]** %id
	%1 = call i8 @symb_IsAnon([0 x i8]* %0)
	%2 = icmp ne i8 %1, 0
	br i1 %2, label %L.2, label %L.1
L.2:
	store i8 1, i8* %rv.0
	br label %return
L.1:
	br label %L.3
L.3:
	%3 = load %symb.SymbNode** %s
	%4 = icmp ne %symb.SymbNode* %3, null
	%5 = xor i1 %4, true
	br i1 %5, label %L.4, label %L.5
L.5:
	%6 = load %symb.SymbNode** %s
	%7 = getelementptr %symb.SymbNode* %6, i32 0, i32 19
	%8 = getelementptr [0 x i8]* %7
	%9 = load [0 x i8]** %id
	%10 = bitcast [0 x i8]* %9 to [0 x i8]*
	%11 = call i8 @zstr_eq([0 x i8]* %8, [0 x i8]* %10, i32 63)
	%12 = icmp ne i8 %11, 0
	br i1 %12, label %L.7, label %L.6
L.7:
	store i8 0, i8* %rv.0
	br label %return
L.6:
	%13 = load %symb.SymbNode** %s
	%14 = getelementptr %symb.SymbNode* %13, i32 0, i32 0
	%15 = load %symb.SymbNode** %14
	store %symb.SymbNode* %15, %symb.SymbNode** %s
	br label %L.3
L.4:
	store i8 1, i8* %rv.0
	br label %return
return:
	%16 = load i8* %rv.0
	ret i8 %16
}
define zeroext i8 @symb_IsUniqueMethod(%symb.SymbNode* %s.arg, [0 x i8]* %id.arg) nounwind {
L.0:
	%rv.0 = alloca i8
	%s = alloca %symb.SymbNode*
	%id = alloca [0 x i8]*
	store %symb.SymbNode* %s.arg, %symb.SymbNode** %s
	store [0 x i8]* %id.arg, [0 x i8]** %id
	br label %L.1
L.1:
	%0 = load %symb.SymbNode** %s
	%1 = icmp ne %symb.SymbNode* %0, null
	%2 = xor i1 %1, true
	br i1 %2, label %L.2, label %L.3
L.3:
	%3 = load %symb.SymbNode** %s
	%4 = getelementptr %symb.SymbNode* %3, i32 0, i32 19
	%5 = getelementptr [0 x i8]* %4
	%6 = load [0 x i8]** %id
	%7 = bitcast [0 x i8]* %6 to [0 x i8]*
	%8 = call i8 @zstr_eq([0 x i8]* %5, [0 x i8]* %7, i32 63)
	%9 = icmp ne i8 %8, 0
	br i1 %9, label %L.5, label %L.4
L.5:
	store i8 0, i8* %rv.0
	br label %return
L.4:
	%10 = load %symb.SymbNode** %s
	%11 = getelementptr %symb.SymbNode* %10, i32 0, i32 6
	%12 = load %symb.SymbNode** %11
	store %symb.SymbNode* %12, %symb.SymbNode** %s
	br label %L.1
L.2:
	store i8 1, i8* %rv.0
	br label %return
return:
	%13 = load i8* %rv.0
	ret i8 %13
}
define void @symb_MakeVisable(%symb.SymbNode* %s.arg) nounwind {
L.0:
	%s = alloca %symb.SymbNode*
	store %symb.SymbNode* %s.arg, %symb.SymbNode** %s
	%0 = load i8* @symb_level
	%1 = zext i8 %0 to i32
	%2 = getelementptr [32 x %symb.symblist]* @symb_symbs, i32 0, i32 %1
	%3 = getelementptr %symb.symblist* %2, i32 0, i32 0
	%4 = load %symb.SymbNode** %3
	%5 = icmp eq %symb.SymbNode* %4, null
	br i1 %5, label %L.2, label %L.3
L.2:
	%6 = load %symb.SymbNode** %s
	%7 = load i8* @symb_level
	%8 = zext i8 %7 to i32
	%9 = getelementptr [32 x %symb.symblist]* @symb_symbs, i32 0, i32 %8
	%10 = getelementptr %symb.symblist* %9, i32 0, i32 0
	store %symb.SymbNode* %6, %symb.SymbNode** %10
	br label %L.1
L.3:
	%11 = load %symb.SymbNode** %s
	%12 = load i8* @symb_level
	%13 = zext i8 %12 to i32
	%14 = getelementptr [32 x %symb.symblist]* @symb_symbs, i32 0, i32 %13
	%15 = getelementptr %symb.symblist* %14, i32 0, i32 1
	%16 = load %symb.SymbNode** %15
	%17 = getelementptr %symb.SymbNode* %16, i32 0, i32 0
	store %symb.SymbNode* %11, %symb.SymbNode** %17
	br label %L.1
L.1:
	%18 = load %symb.SymbNode** %s
	%19 = load i8* @symb_level
	%20 = zext i8 %19 to i32
	%21 = getelementptr [32 x %symb.symblist]* @symb_symbs, i32 0, i32 %20
	%22 = getelementptr %symb.symblist* %21, i32 0, i32 1
	store %symb.SymbNode* %18, %symb.SymbNode** %22
	br label %return
return:
	ret void
}
define %symb.SymbNode* @symb_New(i8 zeroext %kind.arg, [0 x i8]* %name.arg, i8 zeroext %private.arg) nounwind {
L.0:
	%rv.0 = alloca %symb.SymbNode*
	%kind = alloca i8
	%name = alloca [0 x i8]*
	%private = alloca i8
	store i8 %kind.arg, i8* %kind
	store [0 x i8]* %name.arg, [0 x i8]** %name
	store i8 %private.arg, i8* %private
	%s = alloca %symb.SymbNode*
	store %symb.SymbNode* null, %symb.SymbNode** %s
	%0 = load i8* %private
	%1 = icmp ne i8 %0, 0
	%2 = xor i1 %1, true
	br i1 %2, label %L.2, label %L.1
L.2:
	%3 = load i8* @symb_level
	%4 = zext i8 %3 to i32
	%5 = getelementptr [32 x %symb.symblist]* @symb_symbs, i32 0, i32 %4
	%6 = getelementptr %symb.symblist* %5, i32 0, i32 0
	%7 = load %symb.SymbNode** %6
	store %symb.SymbNode* %7, %symb.SymbNode** %s
	br label %L.3
L.3:
	%8 = load %symb.SymbNode** %s
	%9 = icmp ne %symb.SymbNode* %8, null
	br i1 %9, label %L.6, label %L.7
L.6:
	%10 = load %symb.SymbNode** %s
	%11 = getelementptr %symb.SymbNode* %10, i32 0, i32 19
	%12 = getelementptr [0 x i8]* %11
	%13 = load [0 x i8]** %name
	%14 = bitcast [0 x i8]* %13 to [0 x i8]*
	%15 = call i8 @zstr_eq([0 x i8]* %12, [0 x i8]* %14, i32 63)
	%16 = icmp ne i8 %15, 0
	%17 = xor i1 %16, true
	br label %L.7
L.7:
	%18 = phi i1 [ false, %L.3 ], [ %17, %L.6 ]
	%19 = xor i1 %18, true
	br i1 %19, label %L.4, label %L.5
L.5:
	%20 = load %symb.SymbNode** %s
	%21 = getelementptr %symb.SymbNode* %20, i32 0, i32 0
	%22 = load %symb.SymbNode** %21
	store %symb.SymbNode* %22, %symb.SymbNode** %s
	br label %L.3
L.4:
	br label %L.1
L.1:
	%23 = load %symb.SymbNode** %s
	%24 = icmp ne %symb.SymbNode* %23, null
	br i1 %24, label %L.9, label %L.8
L.9:
	%25 = load %symb.SymbNode** %s
	%26 = getelementptr %symb.SymbNode* %25, i32 0, i32 14
	%27 = load i8* %26
	%28 = icmp ne i8 %27, 0
	%29 = xor i1 %28, true
	br i1 %29, label %L.11, label %L.10
L.11:
	%30 = load [0 x i8]** %name
	call void @lex_ErrorI(i8 13, [0 x i8]* %30)
	br label %L.10
L.10:
	%31 = load %symb.SymbNode** %s
	store %symb.SymbNode* %31, %symb.SymbNode** %rv.0
	br label %return
L.8:
	%32 = load [0 x i8]** %name
	%33 = bitcast [0 x i8]* %32 to [0 x i8]*
	%34 = call i32 @zstr_len([0 x i8]* %33, i32 63)
	%35 = add i32 60, %34
	%36 = call [0 x i8]* @malloc(i32 %35)
	%37 = bitcast [0 x i8]* %36 to %symb.SymbNode*
	store %symb.SymbNode* %37, %symb.SymbNode** %s
	%38 = load %symb.SymbNode** %s
	%39 = getelementptr %symb.SymbNode* %38, i32 0, i32 19
	%40 = getelementptr [0 x i8]* %39
	%41 = load [0 x i8]** %name
	%42 = bitcast [0 x i8]* %41 to [0 x i8]*
	call void @zstr_copy([0 x i8]* %40, [0 x i8]* %42, i32 63)
	%43 = load i8* %kind
	%44 = load %symb.SymbNode** %s
	%45 = getelementptr %symb.SymbNode* %44, i32 0, i32 12
	store i8 %43, i8* %45
	%46 = load %symb.SymbNode** %s
	%47 = getelementptr %symb.SymbNode* %46, i32 0, i32 0
	store %symb.SymbNode* null, %symb.SymbNode** %47
	%48 = load %symb.SymbNode** @symb_curpack
	%49 = load %symb.SymbNode** %s
	%50 = getelementptr %symb.SymbNode* %49, i32 0, i32 2
	store %symb.SymbNode* %48, %symb.SymbNode** %50
	%51 = load %symb.SymbNode** @symb_curproc
	%52 = icmp ne %symb.SymbNode* %51, null
	br i1 %52, label %L.13, label %L.14
L.13:
	%53 = load %symb.SymbNode** %s
	%54 = getelementptr %symb.SymbNode* %53, i32 0, i32 13
	store i8 0, i8* %54
	br label %L.12
L.14:
	%55 = load %symb.SymbNode** @symb_curpack
	%56 = icmp ne %symb.SymbNode* %55, null
	br i1 %56, label %L.16, label %L.17
L.16:
	%57 = load %symb.SymbNode** %s
	%58 = getelementptr %symb.SymbNode* %57, i32 0, i32 13
	store i8 1, i8* %58
	br label %L.15
L.17:
	%59 = load %symb.SymbNode** %s
	%60 = getelementptr %symb.SymbNode* %59, i32 0, i32 13
	store i8 2, i8* %60
	br label %L.15
L.15:
	br label %L.12
L.12:
	%61 = call i16 @lex_Lineno()
	%62 = load %symb.SymbNode** %s
	%63 = getelementptr %symb.SymbNode* %62, i32 0, i32 10
	store i16 %61, i16* %63
	%64 = load i8* %private
	%65 = icmp ne i8 %64, 0
	%66 = xor i1 %65, true
	br i1 %66, label %L.19, label %L.18
L.19:
	%67 = load i8* @symb_level
	%68 = zext i8 %67 to i32
	%69 = getelementptr [32 x %symb.symblist]* @symb_symbs, i32 0, i32 %68
	%70 = getelementptr %symb.symblist* %69, i32 0, i32 0
	%71 = load %symb.SymbNode** %70
	%72 = icmp eq %symb.SymbNode* %71, null
	br i1 %72, label %L.21, label %L.22
L.21:
	%73 = load %symb.SymbNode** %s
	%74 = load i8* @symb_level
	%75 = zext i8 %74 to i32
	%76 = getelementptr [32 x %symb.symblist]* @symb_symbs, i32 0, i32 %75
	%77 = getelementptr %symb.symblist* %76, i32 0, i32 0
	store %symb.SymbNode* %73, %symb.SymbNode** %77
	br label %L.20
L.22:
	%78 = load %symb.SymbNode** %s
	%79 = load i8* @symb_level
	%80 = zext i8 %79 to i32
	%81 = getelementptr [32 x %symb.symblist]* @symb_symbs, i32 0, i32 %80
	%82 = getelementptr %symb.symblist* %81, i32 0, i32 1
	%83 = load %symb.SymbNode** %82
	%84 = getelementptr %symb.SymbNode* %83, i32 0, i32 0
	store %symb.SymbNode* %78, %symb.SymbNode** %84
	br label %L.20
L.20:
	%85 = load %symb.SymbNode** %s
	%86 = load i8* @symb_level
	%87 = zext i8 %86 to i32
	%88 = getelementptr [32 x %symb.symblist]* @symb_symbs, i32 0, i32 %87
	%89 = getelementptr %symb.symblist* %88, i32 0, i32 1
	store %symb.SymbNode* %85, %symb.SymbNode** %89
	br label %L.18
L.18:
	%90 = load %symb.SymbNode** %s
	store %symb.SymbNode* %90, %symb.SymbNode** %rv.0
	br label %return
return:
	%91 = load %symb.SymbNode** %rv.0
	ret %symb.SymbNode* %91
}
define %symb.SymbNode* @symb_NewFile([0 x i8]* %path.arg, [0 x i8]* %file.arg) nounwind {
L.0:
	%rv.0 = alloca %symb.SymbNode*
	%path = alloca [0 x i8]*
	%file = alloca [0 x i8]*
	store [0 x i8]* %path.arg, [0 x i8]** %path
	store [0 x i8]* %file.arg, [0 x i8]** %file
	%full = alloca [1024 x i8]
	%0 = getelementptr [1024 x i8]* %full
	%1 = bitcast [1024 x i8]* %0 to [0 x i8]*
	%2 = load [0 x i8]** %path
	%3 = bitcast [0 x i8]* %2 to [0 x i8]*
	call void @zstr_copy([0 x i8]* %1, [0 x i8]* %3, i32 1024)
	%4 = getelementptr [1024 x i8]* %full
	%5 = bitcast [1024 x i8]* %4 to [0 x i8]*
	%6 = getelementptr [2 x i8]* @.str325
	%7 = bitcast [2 x i8]* %6 to [0 x i8]*
	call void @zstr_cat([0 x i8]* %5, [0 x i8]* %7, i32 1024)
	%8 = getelementptr [1024 x i8]* %full
	%9 = bitcast [1024 x i8]* %8 to [0 x i8]*
	%10 = load [0 x i8]** %file
	%11 = bitcast [0 x i8]* %10 to [0 x i8]*
	call void @zstr_cat([0 x i8]* %9, [0 x i8]* %11, i32 1024)
	%12 = getelementptr [1024 x i8]* %full
	%13 = bitcast [1024 x i8]* %12 to [0 x i8]*
	%14 = call %symb.SymbNode* @symb_New(i8 7, [0 x i8]* %13, i8 1)
	store %symb.SymbNode* %14, %symb.SymbNode** %rv.0
	br label %return
return:
	%15 = load %symb.SymbNode** %rv.0
	ret %symb.SymbNode* %15
}
define %symb.SymbNode* @symb_Clone(%symb.SymbNode* %os.arg, [0 x i8]* %name.arg) nounwind {
L.0:
	%rv.0 = alloca %symb.SymbNode*
	%os = alloca %symb.SymbNode*
	%name = alloca [0 x i8]*
	store %symb.SymbNode* %os.arg, %symb.SymbNode** %os
	store [0 x i8]* %name.arg, [0 x i8]** %name
	%ns = alloca %symb.SymbNode*
	%0 = load [0 x i8]** %name
	%1 = call %symb.SymbNode* @symb_New(i8 8, [0 x i8]* %0, i8 0)
	store %symb.SymbNode* %1, %symb.SymbNode** %ns
	%2 = load %symb.SymbNode** %os
	%3 = load %symb.SymbNode** %ns
	%4 = getelementptr %symb.SymbNode* %3, i32 0, i32 2
	store %symb.SymbNode* %2, %symb.SymbNode** %4
	%5 = load %symb.SymbNode** %ns
	store %symb.SymbNode* %5, %symb.SymbNode** %rv.0
	br label %return
return:
	%6 = load %symb.SymbNode** %rv.0
	ret %symb.SymbNode* %6
}
define %symb.SymbNode* @symb_FindLocal(%symb.SymbNode* %as.arg, [0 x i8]* %name.arg) nounwind {
L.0:
	%rv.0 = alloca %symb.SymbNode*
	%as = alloca %symb.SymbNode*
	%name = alloca [0 x i8]*
	store %symb.SymbNode* %as.arg, %symb.SymbNode** %as
	store [0 x i8]* %name.arg, [0 x i8]** %name
	%s = alloca %symb.SymbNode*
	%0 = load %symb.SymbNode** %as
	store %symb.SymbNode* %0, %symb.SymbNode** %s
	br label %L.1
L.1:
	%1 = load %symb.SymbNode** %s
	%2 = icmp ne %symb.SymbNode* %1, null
	br i1 %2, label %L.4, label %L.5
L.4:
	%3 = load %symb.SymbNode** %s
	%4 = getelementptr %symb.SymbNode* %3, i32 0, i32 19
	%5 = getelementptr [0 x i8]* %4
	%6 = load [0 x i8]** %name
	%7 = bitcast [0 x i8]* %6 to [0 x i8]*
	%8 = call i8 @zstr_eq([0 x i8]* %5, [0 x i8]* %7, i32 63)
	%9 = icmp ne i8 %8, 0
	%10 = xor i1 %9, true
	br label %L.5
L.5:
	%11 = phi i1 [ false, %L.1 ], [ %10, %L.4 ]
	%12 = xor i1 %11, true
	br i1 %12, label %L.2, label %L.3
L.3:
	%13 = load %symb.SymbNode** %s
	%14 = getelementptr %symb.SymbNode* %13, i32 0, i32 0
	%15 = load %symb.SymbNode** %14
	store %symb.SymbNode* %15, %symb.SymbNode** %s
	br label %L.1
L.2:
	%16 = load %symb.SymbNode** %s
	store %symb.SymbNode* %16, %symb.SymbNode** %rv.0
	br label %return
return:
	%17 = load %symb.SymbNode** %rv.0
	ret %symb.SymbNode* %17
}
define %symb.SymbNode* @symb_FindMethod(%symb.SymbNode* %as.arg, [0 x i8]* %name.arg) nounwind {
L.0:
	%rv.0 = alloca %symb.SymbNode*
	%as = alloca %symb.SymbNode*
	%name = alloca [0 x i8]*
	store %symb.SymbNode* %as.arg, %symb.SymbNode** %as
	store [0 x i8]* %name.arg, [0 x i8]** %name
	%s = alloca %symb.SymbNode*
	%0 = load %symb.SymbNode** %as
	store %symb.SymbNode* %0, %symb.SymbNode** %s
	br label %L.1
L.1:
	%1 = load %symb.SymbNode** %s
	%2 = icmp ne %symb.SymbNode* %1, null
	br i1 %2, label %L.4, label %L.5
L.4:
	%3 = load %symb.SymbNode** %s
	%4 = getelementptr %symb.SymbNode* %3, i32 0, i32 19
	%5 = getelementptr [0 x i8]* %4
	%6 = load [0 x i8]** %name
	%7 = bitcast [0 x i8]* %6 to [0 x i8]*
	%8 = call i8 @zstr_eq([0 x i8]* %5, [0 x i8]* %7, i32 63)
	%9 = icmp ne i8 %8, 0
	%10 = xor i1 %9, true
	br label %L.5
L.5:
	%11 = phi i1 [ false, %L.1 ], [ %10, %L.4 ]
	%12 = xor i1 %11, true
	br i1 %12, label %L.2, label %L.3
L.3:
	%13 = load %symb.SymbNode** %s
	%14 = getelementptr %symb.SymbNode* %13, i32 0, i32 6
	%15 = load %symb.SymbNode** %14
	store %symb.SymbNode* %15, %symb.SymbNode** %s
	br label %L.1
L.2:
	%16 = load %symb.SymbNode** %s
	store %symb.SymbNode* %16, %symb.SymbNode** %rv.0
	br label %return
return:
	%17 = load %symb.SymbNode** %rv.0
	ret %symb.SymbNode* %17
}
define %symb.SymbNode* @symb_FindPackage(%symb.SymbNode* %ps.arg) nounwind {
L.0:
	%rv.0 = alloca %symb.SymbNode*
	%ps = alloca %symb.SymbNode*
	store %symb.SymbNode* %ps.arg, %symb.SymbNode** %ps
	%s = alloca %symb.SymbNode*
	%tok = alloca i8
	store %symb.SymbNode* null, %symb.SymbNode** %s
	%0 = load i8* @lex_Token
	store i8 %0, i8* %tok
	%1 = load i8* %tok
	%2 = icmp eq i8 %1, 40
	br i1 %2, label %L.2, label %L.1
L.2:
	%3 = call i8 @lex_Next()
	store i8 %3, i8* %tok
	br label %L.1
L.1:
	br label %L.3
L.3:
	%4 = load i8* %tok
	%5 = icmp ne i8 %4, 2
	br i1 %5, label %L.6, label %L.5
L.6:
	%6 = call i8 @lex_Expect(i8 2)
	br label %L.4
L.5:
	%7 = call i8 @lex_Next()
	store i8 %7, i8* %tok
	%8 = load i8* %tok
	%9 = icmp ne i8 %8, 40
	br i1 %9, label %L.8, label %L.7
L.8:
	%10 = call i8 @lex_Expect(i8 40)
	br label %L.4
L.7:
	%11 = load %symb.SymbNode** %ps
	%12 = getelementptr %symb.SymbNode* %11, i32 0, i32 5
	%13 = load %symb.SymbNode** %12
	%14 = getelementptr [64 x i8]* @lex_Ident
	%15 = bitcast [64 x i8]* %14 to [0 x i8]*
	%16 = call %symb.SymbNode* @symb_FindLocal(%symb.SymbNode* %13, [0 x i8]* %15)
	store %symb.SymbNode* %16, %symb.SymbNode** %s
	%17 = load %symb.SymbNode** %s
	%18 = icmp eq %symb.SymbNode* %17, null
	br i1 %18, label %L.11, label %L.10
L.10:
	%19 = load %symb.SymbNode** %s
	%20 = getelementptr %symb.SymbNode* %19, i32 0, i32 12
	%21 = load i8* %20
	%22 = icmp ne i8 %21, 6
	br label %L.11
L.11:
	%23 = phi i1 [ true, %L.7 ], [ %22, %L.10 ]
	br i1 %23, label %L.4, label %L.9
L.9:
	%24 = call i8 @lex_Next()
	store i8 %24, i8* %tok
	%25 = load %symb.SymbNode** %s
	store %symb.SymbNode* %25, %symb.SymbNode** %ps
	br label %L.3
L.4:
	%26 = load %symb.SymbNode** %s
	store %symb.SymbNode* %26, %symb.SymbNode** %rv.0
	br label %return
return:
	%27 = load %symb.SymbNode** %rv.0
	ret %symb.SymbNode* %27
}
define %symb.SymbNode* @symb_FindTop([0 x i8]* %name.arg) nounwind {
L.0:
	%rv.0 = alloca %symb.SymbNode*
	%name = alloca [0 x i8]*
	store [0 x i8]* %name.arg, [0 x i8]** %name
	%s = alloca %symb.SymbNode*
	%i = alloca i8
	%0 = load i8* @symb_level
	store i8 %0, i8* %i
	br label %L.1
L.1:
	%1 = load i8* %i
	%2 = zext i8 %1 to i32
	%3 = getelementptr [32 x %symb.symblist]* @symb_symbs, i32 0, i32 %2
	%4 = getelementptr %symb.symblist* %3, i32 0, i32 0
	%5 = load %symb.SymbNode** %4
	store %symb.SymbNode* %5, %symb.SymbNode** %s
	br label %L.3
L.3:
	%6 = load %symb.SymbNode** %s
	%7 = icmp ne %symb.SymbNode* %6, null
	%8 = xor i1 %7, true
	br i1 %8, label %L.4, label %L.5
L.5:
	%9 = load %symb.SymbNode** %s
	%10 = getelementptr %symb.SymbNode* %9, i32 0, i32 19
	%11 = getelementptr [0 x i8]* %10
	%12 = load [0 x i8]** %name
	%13 = bitcast [0 x i8]* %12 to [0 x i8]*
	%14 = call i8 @zstr_eq([0 x i8]* %11, [0 x i8]* %13, i32 63)
	%15 = icmp ne i8 %14, 0
	br i1 %15, label %L.7, label %L.6
L.7:
	%16 = load %symb.SymbNode** %s
	%17 = getelementptr %symb.SymbNode* %16, i32 0, i32 12
	%18 = load i8* %17
	%19 = icmp eq i8 %18, 8
	br i1 %19, label %L.9, label %L.8
L.9:
	%20 = load %symb.SymbNode** %s
	%21 = getelementptr %symb.SymbNode* %20, i32 0, i32 2
	%22 = load %symb.SymbNode** %21
	store %symb.SymbNode* %22, %symb.SymbNode** %s
	br label %L.8
L.8:
	%23 = load %symb.SymbNode** %s
	%24 = getelementptr %symb.SymbNode* %23, i32 0, i32 17
	store i8 1, i8* %24
	%25 = load %symb.SymbNode** %s
	store %symb.SymbNode* %25, %symb.SymbNode** %rv.0
	br label %return
L.6:
	%26 = load %symb.SymbNode** %s
	%27 = getelementptr %symb.SymbNode* %26, i32 0, i32 0
	%28 = load %symb.SymbNode** %27
	store %symb.SymbNode* %28, %symb.SymbNode** %s
	br label %L.3
L.4:
	%29 = load i8* %i
	%30 = icmp eq i8 %29, 0
	br i1 %30, label %L.2, label %L.10
L.10:
	%31 = load i8* %i
	%32 = sub i8 %31, 1
	store i8 %32, i8* %i
	br label %L.1
L.2:
	store %symb.SymbNode* null, %symb.SymbNode** %rv.0
	br label %return
return:
	%33 = load %symb.SymbNode** %rv.0
	ret %symb.SymbNode* %33
}
define %symb.SymbNode* @symb_Find([0 x i8]* %name.arg) nounwind {
L.0:
	%rv.0 = alloca %symb.SymbNode*
	%name = alloca [0 x i8]*
	store [0 x i8]* %name.arg, [0 x i8]** %name
	%s = alloca %symb.SymbNode*
	%0 = load [0 x i8]** %name
	%1 = call %symb.SymbNode* @symb_FindTop([0 x i8]* %0)
	store %symb.SymbNode* %1, %symb.SymbNode** %s
	%2 = load %symb.SymbNode** %s
	%3 = icmp ne %symb.SymbNode* %2, null
	br i1 %3, label %L.1, label %L.2
L.1:
	%4 = load %symb.SymbNode** %s
	%5 = getelementptr %symb.SymbNode* %4, i32 0, i32 12
	%6 = load i8* %5
	%7 = icmp eq i8 %6, 6
	br label %L.2
L.2:
	%8 = phi i1 [ false, %L.0 ], [ %7, %L.1 ]
	br i1 %8, label %L.4, label %L.3
L.4:
	%9 = load %symb.SymbNode** %s
	%10 = call %symb.SymbNode* @symb_FindPackage(%symb.SymbNode* %9)
	store %symb.SymbNode* %10, %symb.SymbNode** %s
	br label %L.3
L.3:
	%11 = load %symb.SymbNode** %s
	store %symb.SymbNode* %11, %symb.SymbNode** %rv.0
	br label %return
return:
	%12 = load %symb.SymbNode** %rv.0
	ret %symb.SymbNode* %12
}
define %symb.SymbNode* @symb_Save() nounwind {
L.0:
	%rv.0 = alloca %symb.SymbNode*
	%0 = load i8* @symb_level
	%1 = zext i8 %0 to i32
	%2 = getelementptr [32 x %symb.symblist]* @symb_symbs, i32 0, i32 %1
	%3 = getelementptr %symb.symblist* %2, i32 0, i32 0
	%4 = load %symb.SymbNode** %3
	store %symb.SymbNode* %4, %symb.SymbNode** %rv.0
	br label %return
return:
	%5 = load %symb.SymbNode** %rv.0
	ret %symb.SymbNode* %5
}
define void @symb_Push(%symb.SymbNode* %init.arg) nounwind {
L.0:
	%init = alloca %symb.SymbNode*
	store %symb.SymbNode* %init.arg, %symb.SymbNode** %init
	%0 = load i8* @symb_level
	%1 = zext i8 %0 to i32
	%2 = icmp ult i32 %1, 31
	br i1 %2, label %L.2, label %L.3
L.2:
	%3 = load i8* @symb_level
	%4 = add i8 %3, 1
	store i8 %4, i8* @symb_level
	%5 = load %symb.SymbNode** %init
	%6 = icmp eq %symb.SymbNode* %5, null
	br i1 %6, label %L.5, label %L.6
L.5:
	%7 = load i8* @symb_level
	%8 = zext i8 %7 to i32
	%9 = getelementptr [32 x %symb.symblist]* @symb_symbs, i32 0, i32 %8
	%10 = getelementptr %symb.symblist* %9, i32 0, i32 0
	store %symb.SymbNode* null, %symb.SymbNode** %10
	%11 = load i8* @symb_level
	%12 = zext i8 %11 to i32
	%13 = getelementptr [32 x %symb.symblist]* @symb_symbs, i32 0, i32 %12
	%14 = getelementptr %symb.symblist* %13, i32 0, i32 1
	store %symb.SymbNode* null, %symb.SymbNode** %14
	br label %L.4
L.6:
	%15 = load %symb.SymbNode** %init
	%16 = load i8* @symb_level
	%17 = zext i8 %16 to i32
	%18 = getelementptr [32 x %symb.symblist]* @symb_symbs, i32 0, i32 %17
	%19 = getelementptr %symb.symblist* %18, i32 0, i32 0
	store %symb.SymbNode* %15, %symb.SymbNode** %19
	br label %L.7
L.7:
	%20 = load %symb.SymbNode** %init
	%21 = getelementptr %symb.SymbNode* %20, i32 0, i32 0
	%22 = load %symb.SymbNode** %21
	%23 = icmp ne %symb.SymbNode* %22, null
	%24 = xor i1 %23, true
	br i1 %24, label %L.8, label %L.9
L.9:
	%25 = load %symb.SymbNode** %init
	%26 = getelementptr %symb.SymbNode* %25, i32 0, i32 0
	%27 = load %symb.SymbNode** %26
	store %symb.SymbNode* %27, %symb.SymbNode** %init
	br label %L.7
L.8:
	%28 = load %symb.SymbNode** %init
	%29 = load i8* @symb_level
	%30 = zext i8 %29 to i32
	%31 = getelementptr [32 x %symb.symblist]* @symb_symbs, i32 0, i32 %30
	%32 = getelementptr %symb.symblist* %31, i32 0, i32 1
	store %symb.SymbNode* %28, %symb.SymbNode** %32
	br label %L.4
L.4:
	br label %L.1
L.3:
	br label %L.1
L.1:
	br label %return
return:
	ret void
}
define void @symb_Pop() nounwind {
L.0:
	%0 = load i8* @symb_level
	%1 = icmp ugt i8 %0, 0
	br i1 %1, label %L.2, label %L.3
L.2:
	%2 = getelementptr %A.148603888* @feature, i32 0, i32 1
	%3 = load i8* %2
	%4 = icmp ne i8 %3, 0
	br i1 %4, label %L.4, label %L.5
L.4:
	%5 = load %symb.SymbNode** @symb_curproc
	%6 = icmp ne %symb.SymbNode* %5, null
	br label %L.5
L.5:
	%7 = phi i1 [ false, %L.2 ], [ %6, %L.4 ]
	br i1 %7, label %L.7, label %L.6
L.7:
	%s = alloca %symb.SymbNode*
	%8 = load i8* @symb_level
	%9 = zext i8 %8 to i32
	%10 = getelementptr [32 x %symb.symblist]* @symb_symbs, i32 0, i32 %9
	%11 = getelementptr %symb.symblist* %10, i32 0, i32 0
	%12 = load %symb.SymbNode** %11
	store %symb.SymbNode* %12, %symb.SymbNode** %s
	br label %L.8
L.8:
	%13 = load %symb.SymbNode** %s
	%14 = icmp ne %symb.SymbNode* %13, null
	%15 = xor i1 %14, true
	br i1 %15, label %L.9, label %L.10
L.10:
	%16 = load %symb.SymbNode** %s
	%17 = getelementptr %symb.SymbNode* %16, i32 0, i32 17
	%18 = load i8* %17
	%19 = icmp ne i8 %18, 0
	%20 = xor i1 %19, true
	br i1 %20, label %L.11, label %L.12
L.11:
	%21 = load %symb.SymbNode** %s
	%22 = getelementptr %symb.SymbNode* %21, i32 0, i32 16
	%23 = load i8* %22
	%24 = icmp ne i8 %23, 0
	%25 = xor i1 %24, true
	br label %L.12
L.12:
	%26 = phi i1 [ false, %L.10 ], [ %25, %L.11 ]
	br i1 %26, label %L.14, label %L.13
L.14:
	%27 = getelementptr [4 x i8]* @.str326
	%28 = bitcast [4 x i8]* %27 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %28)
	%29 = load %symb.SymbNode** @symb_curpack
	%30 = icmp ne %symb.SymbNode* %29, null
	br i1 %30, label %L.16, label %L.15
L.16:
	%31 = load %symb.SymbNode** @symb_curpack
	%32 = getelementptr %symb.SymbNode* %31, i32 0, i32 19
	%33 = getelementptr [0 x i8]* %32
	call void @out_str(i32 2, [0 x i8]* %33)
	call void @out_chr(i32 2, i8 46)
	br label %L.15
L.15:
	%34 = load %symb.SymbNode** @symb_curproc
	%35 = getelementptr %symb.SymbNode* %34, i32 0, i32 19
	%36 = getelementptr [0 x i8]* %35
	call void @out_str(i32 2, [0 x i8]* %36)
	%37 = getelementptr [10 x i8]* @.str327
	%38 = bitcast [10 x i8]* %37 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %38)
	%39 = load %symb.SymbNode** %s
	%40 = getelementptr %symb.SymbNode* %39, i32 0, i32 19
	%41 = getelementptr [0 x i8]* %40
	call void @out_str(i32 2, [0 x i8]* %41)
	call void @out_nl(i32 2)
	br label %L.13
L.13:
	%42 = load %symb.SymbNode** %s
	%43 = getelementptr %symb.SymbNode* %42, i32 0, i32 0
	%44 = load %symb.SymbNode** %43
	store %symb.SymbNode* %44, %symb.SymbNode** %s
	br label %L.8
L.9:
	br label %L.6
L.6:
	%45 = load i8* @symb_level
	%46 = sub i8 %45, 1
	store i8 %46, i8* @symb_level
	br label %L.1
L.3:
	br label %L.1
L.1:
	br label %return
return:
	ret void
}
define void @symb_NewIntrinsic([0 x i8]* %name.arg, i8 zeroext %valu.arg) nounwind {
L.0:
	%name = alloca [0 x i8]*
	%valu = alloca i8
	store [0 x i8]* %name.arg, [0 x i8]** %name
	store i8 %valu.arg, i8* %valu
	%s = alloca %symb.SymbNode*
	%0 = load [0 x i8]** %name
	%1 = call %symb.SymbNode* @symb_New(i8 5, [0 x i8]* %0, i8 0)
	store %symb.SymbNode* %1, %symb.SymbNode** %s
	%2 = load i8* %valu
	%3 = zext i8 %2 to i64
	%4 = load %symb.SymbNode** %s
	%5 = getelementptr %symb.SymbNode* %4, i32 0, i32 7
	store i64 %3, i64* %5
	br label %return
return:
	ret void
}
define void @symb_InitDecl() nounwind {
L.0:
	%t = alloca %type.TypeNode*
	%s = alloca %symb.SymbNode*
	%s0 = alloca %symb.SymbNode*
	%s1 = alloca %symb.SymbNode*
	%0 = call %type.TypeNode* @type_New(i8 1)
	store %type.TypeNode* %0, %type.TypeNode** %t
	%1 = load %type.TypeNode** %t
	%2 = getelementptr %type.TypeNode* %1, i32 0, i32 7
	store i32 1, i32* %2
	%3 = getelementptr [5 x i8]* @.str328
	%4 = bitcast [5 x i8]* %3 to [0 x i8]*
	%5 = call %symb.SymbNode* @symb_New(i8 1, [0 x i8]* %4, i8 1)
	store %symb.SymbNode* %5, %symb.SymbNode** %s1
	%6 = load %symb.SymbNode** %s1
	%7 = getelementptr %symb.SymbNode* %6, i32 0, i32 7
	store i64 1, i64* %7
	%8 = getelementptr [6 x i8]* @.str329
	%9 = bitcast [6 x i8]* %8 to [0 x i8]*
	%10 = call %symb.SymbNode* @symb_New(i8 1, [0 x i8]* %9, i8 1)
	store %symb.SymbNode* %10, %symb.SymbNode** %s0
	%11 = load %symb.SymbNode** %s0
	%12 = getelementptr %symb.SymbNode* %11, i32 0, i32 7
	store i64 0, i64* %12
	%13 = load %symb.SymbNode** %s1
	%14 = load %symb.SymbNode** %s0
	%15 = getelementptr %symb.SymbNode* %14, i32 0, i32 0
	store %symb.SymbNode* %13, %symb.SymbNode** %15
	%16 = load %symb.SymbNode** %s0
	%17 = load %type.TypeNode** %t
	%18 = getelementptr %type.TypeNode* %17, i32 0, i32 3
	store %symb.SymbNode* %16, %symb.SymbNode** %18
	%19 = load %type.TypeNode** %t
	call void @type_Final(%type.TypeNode* %19)
	%20 = getelementptr [9 x i8]* @.str330
	%21 = bitcast [9 x i8]* %20 to [0 x i8]*
	%22 = call %symb.SymbNode* @symb_New(i8 2, [0 x i8]* %21, i8 0)
	store %symb.SymbNode* %22, %symb.SymbNode** %s
	%23 = load %type.TypeNode** %t
	%24 = load %symb.SymbNode** %s
	%25 = getelementptr %symb.SymbNode* %24, i32 0, i32 1
	store %type.TypeNode* %23, %type.TypeNode** %25
	%26 = load %symb.SymbNode** %s
	%27 = load %type.TypeNode** %t
	%28 = getelementptr %type.TypeNode* %27, i32 0, i32 2
	store %symb.SymbNode* %26, %symb.SymbNode** %28
	%29 = load %type.TypeNode** %t
	store %type.TypeNode* %29, %type.TypeNode** @type_booltype
	%30 = load %symb.SymbNode** %s
	%31 = getelementptr [8 x i8]* @.str331
	%32 = bitcast [8 x i8]* %31 to [0 x i8]*
	%33 = call %symb.SymbNode* @symb_Clone(%symb.SymbNode* %30, [0 x i8]* %32)
	store %symb.SymbNode* %33, %symb.SymbNode** %s
	%34 = getelementptr [6 x i8]* @.str332
	%35 = bitcast [6 x i8]* %34 to [0 x i8]*
	%36 = call %symb.SymbNode* @symb_New(i8 1, [0 x i8]* %35, i8 0)
	store %symb.SymbNode* %36, %symb.SymbNode** %s
	%37 = load %type.TypeNode** %t
	%38 = load %symb.SymbNode** %s
	%39 = getelementptr %symb.SymbNode* %38, i32 0, i32 1
	store %type.TypeNode* %37, %type.TypeNode** %39
	%40 = load %symb.SymbNode** %s
	%41 = getelementptr %symb.SymbNode* %40, i32 0, i32 7
	store i64 0, i64* %41
	%42 = getelementptr [5 x i8]* @.str333
	%43 = bitcast [5 x i8]* %42 to [0 x i8]*
	%44 = call %symb.SymbNode* @symb_New(i8 1, [0 x i8]* %43, i8 0)
	store %symb.SymbNode* %44, %symb.SymbNode** %s
	%45 = load %type.TypeNode** %t
	%46 = load %symb.SymbNode** %s
	%47 = getelementptr %symb.SymbNode* %46, i32 0, i32 1
	store %type.TypeNode* %45, %type.TypeNode** %47
	%48 = load %symb.SymbNode** %s
	%49 = getelementptr %symb.SymbNode* %48, i32 0, i32 7
	store i64 1, i64* %49
	%50 = getelementptr [6 x i8]* @.str334
	%51 = bitcast [6 x i8]* %50 to [0 x i8]*
	%52 = load %target.TargetT** @target_Target
	%53 = getelementptr %target.TargetT* %52, i32 0, i32 3
	%54 = load i8* %53
	%55 = zext i8 %54 to i32
	%56 = call %type.TypeNode* @type_NewBuiltin(i8 2, [0 x i8]* %51, i32 %55)
	store %type.TypeNode* %56, %type.TypeNode** @type_bytetype
	%57 = getelementptr [8 x i8]* @.str335
	%58 = bitcast [8 x i8]* %57 to [0 x i8]*
	%59 = call %type.TypeNode* @type_NewBuiltin(i8 5, [0 x i8]* %58, i32 0)
	store %type.TypeNode* %59, %type.TypeNode** @type_memtype
	%60 = load %type.TypeNode** @type_bytetype
	%61 = load %type.TypeNode** @type_memtype
	%62 = getelementptr %type.TypeNode* %61, i32 0, i32 0
	store %type.TypeNode* %60, %type.TypeNode** %62
	%63 = load %target.TargetT** @target_Target
	%64 = getelementptr %target.TargetT* %63, i32 0, i32 3
	%65 = load i8* %64
	%66 = zext i8 %65 to i32
	%67 = load %type.TypeNode** @type_memtype
	%68 = getelementptr %type.TypeNode* %67, i32 0, i32 9
	store i32 %66, i32* %68
	%69 = load %type.TypeNode** @type_memtype
	%70 = getelementptr %type.TypeNode* %69, i32 0, i32 16
	store i8 1, i8* %70
	%71 = getelementptr [9 x i8]* @.str336
	%72 = bitcast [9 x i8]* %71 to [0 x i8]*
	%73 = load %target.TargetT** @target_Target
	%74 = getelementptr %target.TargetT* %73, i32 0, i32 8
	%75 = getelementptr %target.SizeAlign* %74, i32 0, i32 0
	%76 = load i8* %75
	%77 = zext i8 %76 to i32
	%78 = call %type.TypeNode* @type_NewBuiltin(i8 4, [0 x i8]* %72, i32 %77)
	store %type.TypeNode* %78, %type.TypeNode** %t
	%79 = load %type.TypeNode** @type_memtype
	%80 = load %type.TypeNode** %t
	%81 = getelementptr %type.TypeNode* %80, i32 0, i32 0
	store %type.TypeNode* %79, %type.TypeNode** %81
	%82 = load %target.TargetT** @target_Target
	%83 = getelementptr %target.TargetT* %82, i32 0, i32 8
	%84 = getelementptr %target.SizeAlign* %83, i32 0, i32 1
	%85 = load i8* %84
	%86 = zext i8 %85 to i32
	%87 = load %type.TypeNode** %t
	%88 = getelementptr %type.TypeNode* %87, i32 0, i32 9
	store i32 %86, i32* %88
	%89 = getelementptr [6 x i8]* @.str337
	%90 = bitcast [6 x i8]* %89 to [0 x i8]*
	%91 = load %target.TargetT** @target_Target
	%92 = getelementptr %target.TargetT* %91, i32 0, i32 4
	%93 = load i8* %92
	%94 = zext i8 %93 to i32
	%95 = call %type.TypeNode* @type_NewBuiltin(i8 2, [0 x i8]* %90, i32 %94)
	store %type.TypeNode* %95, %type.TypeNode** @type_wordtype
	%96 = getelementptr [5 x i8]* @.str338
	%97 = bitcast [5 x i8]* %96 to [0 x i8]*
	%98 = load %target.TargetT** @target_Target
	%99 = getelementptr %target.TargetT* %98, i32 0, i32 4
	%100 = load i8* %99
	%101 = zext i8 %100 to i32
	%102 = call %type.TypeNode* @type_NewBuiltin(i8 3, [0 x i8]* %97, i32 %101)
	store %type.TypeNode* %102, %type.TypeNode** @type_swordtype
	%103 = getelementptr [7 x i8]* @.str339
	%104 = bitcast [7 x i8]* %103 to [0 x i8]*
	%105 = call %type.TypeNode* @type_NewBuiltin(i8 2, [0 x i8]* %104, i32 8)
	%106 = getelementptr [4 x %type.TypeNode*]* @type_uinttypes, i32 0, i32 0
	store %type.TypeNode* %105, %type.TypeNode** %106
	%107 = getelementptr [6 x i8]* @.str340
	%108 = bitcast [6 x i8]* %107 to [0 x i8]*
	%109 = call %type.TypeNode* @type_NewBuiltin(i8 3, [0 x i8]* %108, i32 8)
	%110 = getelementptr [4 x %type.TypeNode*]* @type_inttypes, i32 0, i32 0
	store %type.TypeNode* %109, %type.TypeNode** %110
	%111 = getelementptr [8 x i8]* @.str341
	%112 = bitcast [8 x i8]* %111 to [0 x i8]*
	%113 = call %type.TypeNode* @type_NewBuiltin(i8 2, [0 x i8]* %112, i32 16)
	%114 = getelementptr [4 x %type.TypeNode*]* @type_uinttypes, i32 0, i32 1
	store %type.TypeNode* %113, %type.TypeNode** %114
	%115 = getelementptr [7 x i8]* @.str342
	%116 = bitcast [7 x i8]* %115 to [0 x i8]*
	%117 = call %type.TypeNode* @type_NewBuiltin(i8 3, [0 x i8]* %116, i32 16)
	%118 = getelementptr [4 x %type.TypeNode*]* @type_inttypes, i32 0, i32 1
	store %type.TypeNode* %117, %type.TypeNode** %118
	%119 = getelementptr [8 x i8]* @.str343
	%120 = bitcast [8 x i8]* %119 to [0 x i8]*
	%121 = call %type.TypeNode* @type_NewBuiltin(i8 2, [0 x i8]* %120, i32 32)
	%122 = getelementptr [4 x %type.TypeNode*]* @type_uinttypes, i32 0, i32 2
	store %type.TypeNode* %121, %type.TypeNode** %122
	%123 = getelementptr [7 x i8]* @.str344
	%124 = bitcast [7 x i8]* %123 to [0 x i8]*
	%125 = call %type.TypeNode* @type_NewBuiltin(i8 3, [0 x i8]* %124, i32 32)
	%126 = getelementptr [4 x %type.TypeNode*]* @type_inttypes, i32 0, i32 2
	store %type.TypeNode* %125, %type.TypeNode** %126
	%127 = getelementptr [8 x i8]* @.str345
	%128 = bitcast [8 x i8]* %127 to [0 x i8]*
	%129 = call %type.TypeNode* @type_NewBuiltin(i8 2, [0 x i8]* %128, i32 64)
	%130 = getelementptr [4 x %type.TypeNode*]* @type_uinttypes, i32 0, i32 3
	store %type.TypeNode* %129, %type.TypeNode** %130
	%131 = getelementptr [7 x i8]* @.str346
	%132 = bitcast [7 x i8]* %131 to [0 x i8]*
	%133 = call %type.TypeNode* @type_NewBuiltin(i8 3, [0 x i8]* %132, i32 64)
	%134 = getelementptr [4 x %type.TypeNode*]* @type_inttypes, i32 0, i32 3
	store %type.TypeNode* %133, %type.TypeNode** %134
	%135 = call %type.TypeNode* @type_New(i8 0)
	store %type.TypeNode* %135, %type.TypeNode** @type_unkntype
	%136 = load %target.TargetT** @target_Target
	%137 = getelementptr %target.TargetT* %136, i32 0, i32 3
	%138 = load i8* %137
	%139 = zext i8 %138 to i32
	%140 = load %type.TypeNode** @type_unkntype
	%141 = getelementptr %type.TypeNode* %140, i32 0, i32 7
	store i32 %139, i32* %141
	%142 = load %target.TargetT** @target_Target
	%143 = getelementptr %target.TargetT* %142, i32 0, i32 3
	%144 = load i8* %143
	%145 = zext i8 %144 to i32
	%146 = load %type.TypeNode** @type_unkntype
	%147 = getelementptr %type.TypeNode* %146, i32 0, i32 9
	store i32 %145, i32* %147
	%148 = getelementptr [5 x i8]* @.str347
	%149 = bitcast [5 x i8]* %148 to [0 x i8]*
	call void @symb_NewIntrinsic([0 x i8]* %149, i8 1)
	%150 = getelementptr [5 x i8]* @.str348
	%151 = bitcast [5 x i8]* %150 to [0 x i8]*
	call void @symb_NewIntrinsic([0 x i8]* %151, i8 2)
	%152 = getelementptr [5 x i8]* @.str349
	%153 = bitcast [5 x i8]* %152 to [0 x i8]*
	call void @symb_NewIntrinsic([0 x i8]* %153, i8 3)
	br label %return
return:
	ret void
}
define void @symb_Init() nounwind {
L.0:
	store i8 0, i8* @symb_level
	%0 = getelementptr [32 x %symb.symblist]* @symb_symbs, i32 0, i32 0
	%1 = getelementptr %symb.symblist* %0, i32 0, i32 0
	store %symb.SymbNode* null, %symb.SymbNode** %1
	%2 = getelementptr [32 x %symb.symblist]* @symb_symbs, i32 0, i32 0
	%3 = getelementptr %symb.symblist* %2, i32 0, i32 1
	store %symb.SymbNode* null, %symb.SymbNode** %3
	call void @symb_InitDecl()
	br label %return
return:
	ret void
}
define void @symb_DumpST(%symb.SymbNode* %s.arg, i8 zeroext %full.arg) nounwind {
L.0:
	%s = alloca %symb.SymbNode*
	%full = alloca i8
	store %symb.SymbNode* %s.arg, %symb.SymbNode** %s
	store i8 %full.arg, i8* %full
	%0 = load %symb.SymbNode** %s
	%1 = getelementptr %symb.SymbNode* %0, i32 0, i32 19
	%2 = getelementptr [0 x i8]* %1
	call void @out_str(i32 2, [0 x i8]* %2)
	call void @out_chr(i32 2, i8 58)
	%3 = load %symb.SymbNode** %s
	%4 = getelementptr %symb.SymbNode* %3, i32 0, i32 1
	%5 = load %type.TypeNode** %4
	%6 = load i8* %full
	call void @type_DumpT(%type.TypeNode* %5, i8 %6)
	br label %return
return:
	ret void
}
define void @symb_DumpFormals(%symb.SymbNode* %ss.arg) nounwind {
L.0:
	%ss = alloca %symb.SymbNode*
	store %symb.SymbNode* %ss.arg, %symb.SymbNode** %ss
	call void @out_chr(i32 2, i8 40)
	%0 = load %symb.SymbNode** %ss
	%1 = icmp ne %symb.SymbNode* %0, null
	br i1 %1, label %L.2, label %L.1
L.2:
	br label %L.3
L.3:
	%2 = load %symb.SymbNode** %ss
	call void @symb_DumpST(%symb.SymbNode* %2, i8 0)
	%3 = load %symb.SymbNode** %ss
	%4 = getelementptr %symb.SymbNode* %3, i32 0, i32 0
	%5 = load %symb.SymbNode** %4
	store %symb.SymbNode* %5, %symb.SymbNode** %ss
	%6 = load %symb.SymbNode** %ss
	%7 = icmp eq %symb.SymbNode* %6, null
	br i1 %7, label %L.4, label %L.5
L.5:
	%8 = getelementptr [3 x i8]* @.str350
	%9 = bitcast [3 x i8]* %8 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %9)
	br label %L.3
L.4:
	br label %L.1
L.1:
	call void @out_chr(i32 2, i8 41)
	br label %return
return:
	ret void
}
define void @symb_DumpS(%symb.SymbNode* %s.arg) nounwind {
L.0:
	%s = alloca %symb.SymbNode*
	store %symb.SymbNode* %s.arg, %symb.SymbNode** %s
	%tl = alloca %type.TypeListEntry*
	%0 = load %symb.SymbNode** %s
	%1 = getelementptr %symb.SymbNode* %0, i32 0, i32 12
	%2 = load i8* %1
	%3 = zext i8 %2 to i32
	switch i32 %3, label %L.1 [
		i32 1, label %L.3
		i32 2, label %L.4
		i32 3, label %L.5
		i32 4, label %L.6
		i32 5, label %L.7
		i32 6, label %L.8
		i32 8, label %L.9
	]
L.3:
	%4 = getelementptr [10 x i8]* @.str351
	%5 = bitcast [10 x i8]* %4 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %5)
	%6 = load %symb.SymbNode** %s
	call void @symb_DumpST(%symb.SymbNode* %6, i8 0)
	call void @out_chr(i32 2, i8 61)
	%7 = load %symb.SymbNode** %s
	%8 = getelementptr %symb.SymbNode* %7, i32 0, i32 7
	%9 = load i64* %8
	call void @out_hex64(i32 2, i64 %9)
	br label %L.2
L.4:
	%10 = getelementptr [6 x i8]* @.str352
	%11 = bitcast [6 x i8]* %10 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %11)
	%12 = load %symb.SymbNode** %s
	call void @symb_DumpST(%symb.SymbNode* %12, i8 1)
	br label %L.2
L.5:
	%13 = getelementptr [5 x i8]* @.str353
	%14 = bitcast [5 x i8]* %13 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %14)
	%15 = load %symb.SymbNode** %s
	call void @symb_DumpST(%symb.SymbNode* %15, i8 0)
	br label %L.2
L.6:
	%16 = getelementptr [7 x i8]* @.str354
	%17 = bitcast [7 x i8]* %16 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %17)
	%18 = load %symb.SymbNode** %s
	%19 = getelementptr %symb.SymbNode* %18, i32 0, i32 19
	%20 = getelementptr [0 x i8]* %19
	call void @out_str(i32 2, [0 x i8]* %20)
	br label %L.2
L.7:
	%21 = load %symb.SymbNode** %s
	%22 = getelementptr %symb.SymbNode* %21, i32 0, i32 7
	%23 = load i64* %22
	%24 = icmp eq i64 %23, 0
	br i1 %24, label %L.11, label %L.12
L.11:
	%25 = getelementptr [6 x i8]* @.str355
	%26 = bitcast [6 x i8]* %25 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %26)
	%27 = load %symb.SymbNode** %s
	%28 = getelementptr %symb.SymbNode* %27, i32 0, i32 19
	%29 = getelementptr [0 x i8]* %28
	call void @out_str(i32 2, [0 x i8]* %29)
	%30 = load %symb.SymbNode** %s
	%31 = getelementptr %symb.SymbNode* %30, i32 0, i32 3
	%32 = load %symb.SymbNode** %31
	call void @symb_DumpFormals(%symb.SymbNode* %32)
	%33 = load %symb.SymbNode** %s
	%34 = getelementptr %symb.SymbNode* %33, i32 0, i32 4
	%35 = load %type.TypeListEntry** %34
	store %type.TypeListEntry* %35, %type.TypeListEntry** %tl
	%36 = load %type.TypeListEntry** %tl
	%37 = icmp ne %type.TypeListEntry* %36, null
	br i1 %37, label %L.14, label %L.13
L.14:
	call void @out_chr(i32 2, i8 58)
	br label %L.15
L.15:
	%38 = load %type.TypeListEntry** %tl
	%39 = getelementptr %type.TypeListEntry* %38, i32 0, i32 1
	%40 = load %type.TypeNode** %39
	call void @type_DumpT(%type.TypeNode* %40, i8 0)
	%41 = load %type.TypeListEntry** %tl
	%42 = getelementptr %type.TypeListEntry* %41, i32 0, i32 0
	%43 = load %type.TypeListEntry** %42
	store %type.TypeListEntry* %43, %type.TypeListEntry** %tl
	%44 = load %type.TypeListEntry** %tl
	%45 = icmp eq %type.TypeListEntry* %44, null
	br i1 %45, label %L.16, label %L.17
L.17:
	call void @out_chr(i32 2, i8 44)
	br label %L.15
L.16:
	br label %L.13
L.13:
	br label %L.10
L.12:
	%46 = getelementptr [11 x i8]* @.str356
	%47 = bitcast [11 x i8]* %46 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %47)
	%48 = load %symb.SymbNode** %s
	%49 = getelementptr %symb.SymbNode* %48, i32 0, i32 19
	%50 = getelementptr [0 x i8]* %49
	call void @out_str(i32 2, [0 x i8]* %50)
	%51 = getelementptr [3 x i8]* @.str357
	%52 = bitcast [3 x i8]* %51 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %52)
	br label %L.10
L.10:
	br label %L.2
L.8:
	%53 = getelementptr [9 x i8]* @.str358
	%54 = bitcast [9 x i8]* %53 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %54)
	%55 = load %symb.SymbNode** %s
	%56 = getelementptr %symb.SymbNode* %55, i32 0, i32 19
	%57 = getelementptr [0 x i8]* %56
	call void @out_str(i32 2, [0 x i8]* %57)
	br label %L.2
L.9:
	%58 = getelementptr [7 x i8]* @.str359
	%59 = bitcast [7 x i8]* %58 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %59)
	%60 = load %symb.SymbNode** %s
	%61 = getelementptr %symb.SymbNode* %60, i32 0, i32 19
	%62 = getelementptr [0 x i8]* %61
	call void @out_str(i32 2, [0 x i8]* %62)
	br label %L.2
L.1:
	%63 = getelementptr [11 x i8]* @.str360
	%64 = bitcast [11 x i8]* %63 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %64)
	%65 = load %symb.SymbNode** %s
	%66 = getelementptr %symb.SymbNode* %65, i32 0, i32 19
	%67 = getelementptr [0 x i8]* %66
	call void @out_str(i32 2, [0 x i8]* %67)
	call void @out_nl(i32 2)
	br label %L.2
L.2:
	call void @out_nl(i32 2)
	br label %return
return:
	ret void
}
define void @symb_Dump(i8 zeroext %n.arg) nounwind {
L.0:
	%n = alloca i8
	store i8 %n.arg, i8* %n
	%stop = alloca i32
	%i = alloca i32
	%s = alloca %symb.SymbNode*
	%0 = load i8* @symb_level
	%1 = load i8* %n
	%2 = icmp ult i8 %0, %1
	br i1 %2, label %L.2, label %L.3
L.2:
	store i32 0, i32* %stop
	br label %L.1
L.3:
	%3 = load i8* @symb_level
	%4 = add i8 %3, 1
	%5 = load i8* %n
	%6 = sub i8 %4, %5
	%7 = zext i8 %6 to i32
	store i32 %7, i32* %stop
	br label %L.1
L.1:
	%8 = load i8* @symb_level
	%9 = zext i8 %8 to i32
	store i32 %9, i32* %i
	br label %L.4
L.4:
	%10 = getelementptr [11 x i8]* @.str361
	%11 = bitcast [11 x i8]* %10 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %11)
	%12 = load i32* %i
	call void @out_uint(i32 2, i32 %12)
	%13 = getelementptr [6 x i8]* @.str362
	%14 = bitcast [6 x i8]* %13 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %14)
	%15 = load i32* %i
	%16 = getelementptr [32 x %symb.symblist]* @symb_symbs, i32 0, i32 %15
	%17 = getelementptr %symb.symblist* %16, i32 0, i32 0
	%18 = load %symb.SymbNode** %17
	store %symb.SymbNode* %18, %symb.SymbNode** %s
	br label %L.6
L.6:
	%19 = load %symb.SymbNode** %s
	%20 = icmp ne %symb.SymbNode* %19, null
	%21 = xor i1 %20, true
	br i1 %21, label %L.7, label %L.8
L.8:
	%22 = load %symb.SymbNode** %s
	call void @symb_DumpS(%symb.SymbNode* %22)
	%23 = load %symb.SymbNode** %s
	%24 = getelementptr %symb.SymbNode* %23, i32 0, i32 0
	%25 = load %symb.SymbNode** %24
	store %symb.SymbNode* %25, %symb.SymbNode** %s
	br label %L.6
L.7:
	%26 = load i32* %i
	%27 = load i32* %stop
	%28 = icmp ule i32 %26, %27
	br i1 %28, label %L.5, label %L.9
L.9:
	%29 = load i32* %i
	%30 = sub i32 %29, 1
	store i32 %30, i32* %i
	br label %L.4
L.5:
	br label %return
return:
	ret void
}
@ast_NumChildDefault = internal constant [71 x i8] [ i8 0, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 0, i8 0, i8 0, i8 4, i8 5, i8 5, i8 0, i8 8, i8 1, i8 1, i8 2, i8 3, i8 1, i8 4, i8 4, i8 4, i8 4, i8 1, i8 1, i8 2, i8 1, i8 1, i8 1, i8 1, i8 1, i8 1, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 2, i8 3, i8 8, i8 1, i8 2, i8 3, i8 8, i8 4, i8 1, i8 3 ], align 1
%ast.AstNode = type {i8, i8, i8, i8, i16, i16, i16, i16, i64, %type.TypeNode*, %symb.SymbNode*, [0 x %ast.AstNode*]}
define %ast.AstNode* @ast_Alloc(i8 zeroext %op.arg, i16 zeroext %nc.arg) nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%op = alloca i8
	%nc = alloca i16
	store i8 %op.arg, i8* %op
	store i16 %nc.arg, i16* %nc
	%pa = alloca %ast.AstNode*
	%0 = load i16* %nc
	%1 = zext i16 %0 to i32
	%2 = mul i32 %1, 4
	%3 = add i32 28, %2
	%4 = call [0 x i8]* @sys_zalloc(i32 %3)
	%5 = bitcast [0 x i8]* %4 to %ast.AstNode*
	store %ast.AstNode* %5, %ast.AstNode** %pa
	%6 = load i8* %op
	%7 = load %ast.AstNode** %pa
	%8 = getelementptr %ast.AstNode* %7, i32 0, i32 0
	store i8 %6, i8* %8
	%9 = call i16 @lex_Lineno()
	%10 = load %ast.AstNode** %pa
	%11 = getelementptr %ast.AstNode* %10, i32 0, i32 4
	store i16 %9, i16* %11
	%12 = load %ast.AstNode** %pa
	%13 = getelementptr %ast.AstNode* %12, i32 0, i32 5
	store i16 0, i16* %13
	%14 = load i16* %nc
	%15 = load %ast.AstNode** %pa
	%16 = getelementptr %ast.AstNode* %15, i32 0, i32 6
	store i16 %14, i16* %16
	%17 = load %ast.AstNode** %pa
	store %ast.AstNode* %17, %ast.AstNode** %rv.0
	br label %return
return:
	%18 = load %ast.AstNode** %rv.0
	ret %ast.AstNode* %18
}
define %ast.AstNode* @ast_Expand(%ast.AstNode* %po.arg, i16 zeroext %newsize.arg) nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%po = alloca %ast.AstNode*
	%newsize = alloca i16
	store %ast.AstNode* %po.arg, %ast.AstNode** %po
	store i16 %newsize.arg, i16* %newsize
	%pn = alloca %ast.AstNode*
	%size = alloca i16
	%i = alloca i16
	%0 = load %ast.AstNode** %po
	%1 = getelementptr %ast.AstNode* %0, i32 0, i32 6
	%2 = load i16* %1
	store i16 %2, i16* %size
	br label %L.1
L.1:
	%3 = load i16* %size
	%4 = load i16* %newsize
	%5 = icmp ult i16 %3, %4
	%6 = xor i1 %5, true
	br i1 %6, label %L.2, label %L.3
L.3:
	%7 = load i16* %size
	%8 = icmp uge i16 %7, 16
	br i1 %8, label %L.5, label %L.6
L.5:
	%9 = load i16* %size
	%10 = add i16 %9, 16
	store i16 %10, i16* %size
	br label %L.4
L.6:
	%11 = load i16* %size
	%12 = mul i16 2, %11
	store i16 %12, i16* %size
	br label %L.4
L.4:
	br label %L.1
L.2:
	%13 = load %ast.AstNode** %po
	%14 = getelementptr %ast.AstNode* %13, i32 0, i32 0
	%15 = load i8* %14
	%16 = load i16* %size
	%17 = call %ast.AstNode* @ast_Alloc(i8 %15, i16 %16)
	store %ast.AstNode* %17, %ast.AstNode** %pn
	%18 = load %ast.AstNode** %po
	%19 = getelementptr %ast.AstNode* %18, i32 0, i32 0
	%20 = load i8* %19
	%21 = load %ast.AstNode** %pn
	%22 = getelementptr %ast.AstNode* %21, i32 0, i32 0
	store i8 %20, i8* %22
	%23 = load %ast.AstNode** %po
	%24 = getelementptr %ast.AstNode* %23, i32 0, i32 1
	%25 = load i8* %24
	%26 = load %ast.AstNode** %pn
	%27 = getelementptr %ast.AstNode* %26, i32 0, i32 1
	store i8 %25, i8* %27
	%28 = load %ast.AstNode** %po
	%29 = getelementptr %ast.AstNode* %28, i32 0, i32 2
	%30 = load i8* %29
	%31 = load %ast.AstNode** %pn
	%32 = getelementptr %ast.AstNode* %31, i32 0, i32 2
	store i8 %30, i8* %32
	%33 = load %ast.AstNode** %po
	%34 = getelementptr %ast.AstNode* %33, i32 0, i32 3
	%35 = load i8* %34
	%36 = load %ast.AstNode** %pn
	%37 = getelementptr %ast.AstNode* %36, i32 0, i32 3
	store i8 %35, i8* %37
	%38 = load %ast.AstNode** %po
	%39 = getelementptr %ast.AstNode* %38, i32 0, i32 4
	%40 = load i16* %39
	%41 = load %ast.AstNode** %pn
	%42 = getelementptr %ast.AstNode* %41, i32 0, i32 4
	store i16 %40, i16* %42
	%43 = load %ast.AstNode** %po
	%44 = getelementptr %ast.AstNode* %43, i32 0, i32 5
	%45 = load i16* %44
	%46 = load %ast.AstNode** %pn
	%47 = getelementptr %ast.AstNode* %46, i32 0, i32 5
	store i16 %45, i16* %47
	%48 = load %ast.AstNode** %po
	%49 = getelementptr %ast.AstNode* %48, i32 0, i32 7
	%50 = load i16* %49
	%51 = load %ast.AstNode** %pn
	%52 = getelementptr %ast.AstNode* %51, i32 0, i32 7
	store i16 %50, i16* %52
	%53 = load %ast.AstNode** %po
	%54 = getelementptr %ast.AstNode* %53, i32 0, i32 8
	%55 = load i64* %54
	%56 = load %ast.AstNode** %pn
	%57 = getelementptr %ast.AstNode* %56, i32 0, i32 8
	store i64 %55, i64* %57
	%58 = load %ast.AstNode** %po
	%59 = getelementptr %ast.AstNode* %58, i32 0, i32 9
	%60 = load %type.TypeNode** %59
	%61 = load %ast.AstNode** %pn
	%62 = getelementptr %ast.AstNode* %61, i32 0, i32 9
	store %type.TypeNode* %60, %type.TypeNode** %62
	%63 = load %ast.AstNode** %po
	%64 = getelementptr %ast.AstNode* %63, i32 0, i32 10
	%65 = load %symb.SymbNode** %64
	%66 = load %ast.AstNode** %pn
	%67 = getelementptr %ast.AstNode* %66, i32 0, i32 10
	store %symb.SymbNode* %65, %symb.SymbNode** %67
	store i16 0, i16* %i
	br label %L.7
L.7:
	%68 = load i16* %i
	%69 = load %ast.AstNode** %po
	%70 = getelementptr %ast.AstNode* %69, i32 0, i32 6
	%71 = load i16* %70
	%72 = icmp ult i16 %68, %71
	%73 = xor i1 %72, true
	br i1 %73, label %L.8, label %L.9
L.9:
	%74 = load %ast.AstNode** %po
	%75 = getelementptr %ast.AstNode* %74, i32 0, i32 11
	%76 = load i16* %i
	%77 = zext i16 %76 to i32
	%78 = getelementptr [0 x %ast.AstNode*]* %75, i32 0, i32 %77
	%79 = load %ast.AstNode** %78
	%80 = load %ast.AstNode** %pn
	%81 = getelementptr %ast.AstNode* %80, i32 0, i32 11
	%82 = load i16* %i
	%83 = zext i16 %82 to i32
	%84 = getelementptr [0 x %ast.AstNode*]* %81, i32 0, i32 %83
	store %ast.AstNode* %79, %ast.AstNode** %84
	%85 = load i16* %i
	%86 = add i16 %85, 1
	store i16 %86, i16* %i
	br label %L.7
L.8:
	%87 = load i16* %size
	%88 = load %ast.AstNode** %pn
	%89 = getelementptr %ast.AstNode* %88, i32 0, i32 6
	store i16 %87, i16* %89
	%90 = load %ast.AstNode** %pn
	store %ast.AstNode* %90, %ast.AstNode** %rv.0
	br label %return
return:
	%91 = load %ast.AstNode** %rv.0
	ret %ast.AstNode* %91
}
define %ast.AstNode* @ast_New(i8 zeroext %op.arg, %type.TypeNode* %t.arg) nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%op = alloca i8
	%t = alloca %type.TypeNode*
	store i8 %op.arg, i8* %op
	store %type.TypeNode* %t.arg, %type.TypeNode** %t
	%pa = alloca %ast.AstNode*
	%0 = load i8* %op
	%1 = load i8* %op
	%2 = zext i8 %1 to i32
	%3 = getelementptr [71 x i8]* @ast_NumChildDefault, i32 0, i32 %2
	%4 = load i8* %3
	%5 = zext i8 %4 to i16
	%6 = call %ast.AstNode* @ast_Alloc(i8 %0, i16 %5)
	store %ast.AstNode* %6, %ast.AstNode** %pa
	%7 = load %type.TypeNode** %t
	%8 = load %ast.AstNode** %pa
	%9 = getelementptr %ast.AstNode* %8, i32 0, i32 9
	store %type.TypeNode* %7, %type.TypeNode** %9
	%10 = load %type.TypeNode** %t
	%11 = icmp ne %type.TypeNode* %10, null
	br i1 %11, label %L.2, label %L.1
L.2:
	%12 = load %type.TypeNode** %t
	%13 = getelementptr %type.TypeNode* %12, i32 0, i32 11
	%14 = load i8* %13
	%15 = load %ast.AstNode** %pa
	%16 = getelementptr %ast.AstNode* %15, i32 0, i32 1
	store i8 %14, i8* %16
	%17 = load %type.TypeNode** %t
	%18 = getelementptr %type.TypeNode* %17, i32 0, i32 8
	%19 = load i32* %18
	%20 = trunc i32 %19 to i8
	%21 = load %ast.AstNode** %pa
	%22 = getelementptr %ast.AstNode* %21, i32 0, i32 2
	store i8 %20, i8* %22
	br label %L.1
L.1:
	%23 = load %ast.AstNode** %pa
	store %ast.AstNode* %23, %ast.AstNode** %rv.0
	br label %return
return:
	%24 = load %ast.AstNode** %rv.0
	ret %ast.AstNode* %24
}
define %ast.AstNode* @ast_New1(i8 zeroext %op.arg, %type.TypeNode* %t.arg, %ast.AstNode* %pc0.arg) nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%op = alloca i8
	%t = alloca %type.TypeNode*
	%pc0 = alloca %ast.AstNode*
	store i8 %op.arg, i8* %op
	store %type.TypeNode* %t.arg, %type.TypeNode** %t
	store %ast.AstNode* %pc0.arg, %ast.AstNode** %pc0
	%pa = alloca %ast.AstNode*
	%n = alloca i16
	%0 = load i8* %op
	%1 = zext i8 %0 to i32
	%2 = getelementptr [71 x i8]* @ast_NumChildDefault, i32 0, i32 %1
	%3 = load i8* %2
	%4 = zext i8 %3 to i16
	store i16 %4, i16* %n
	%5 = load i16* %n
	%6 = icmp ult i16 %5, 1
	br i1 %6, label %L.2, label %L.1
L.2:
	store i16 1, i16* %n
	br label %L.1
L.1:
	%7 = load i8* %op
	%8 = load i16* %n
	%9 = call %ast.AstNode* @ast_Alloc(i8 %7, i16 %8)
	store %ast.AstNode* %9, %ast.AstNode** %pa
	%10 = load %ast.AstNode** %pc0
	%11 = load %ast.AstNode** %pa
	%12 = getelementptr %ast.AstNode* %11, i32 0, i32 11
	%13 = getelementptr [0 x %ast.AstNode*]* %12, i32 0, i32 0
	store %ast.AstNode* %10, %ast.AstNode** %13
	%14 = load %ast.AstNode** %pa
	%15 = getelementptr %ast.AstNode* %14, i32 0, i32 5
	store i16 1, i16* %15
	%16 = load %type.TypeNode** %t
	%17 = load %ast.AstNode** %pa
	%18 = getelementptr %ast.AstNode* %17, i32 0, i32 9
	store %type.TypeNode* %16, %type.TypeNode** %18
	%19 = load %ast.AstNode** %pc0
	%20 = getelementptr %ast.AstNode* %19, i32 0, i32 1
	%21 = load i8* %20
	%22 = load %ast.AstNode** %pa
	%23 = getelementptr %ast.AstNode* %22, i32 0, i32 1
	store i8 %21, i8* %23
	%24 = load %ast.AstNode** %pc0
	%25 = getelementptr %ast.AstNode* %24, i32 0, i32 2
	%26 = load i8* %25
	%27 = load %ast.AstNode** %pa
	%28 = getelementptr %ast.AstNode* %27, i32 0, i32 2
	store i8 %26, i8* %28
	%29 = load %ast.AstNode** %pa
	store %ast.AstNode* %29, %ast.AstNode** %rv.0
	br label %return
return:
	%30 = load %ast.AstNode** %rv.0
	ret %ast.AstNode* %30
}
define %ast.AstNode* @ast_New2(i8 zeroext %op.arg, %type.TypeNode* %t.arg, %ast.AstNode* %pc0.arg, %ast.AstNode* %pc1.arg) nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%op = alloca i8
	%t = alloca %type.TypeNode*
	%pc0 = alloca %ast.AstNode*
	%pc1 = alloca %ast.AstNode*
	store i8 %op.arg, i8* %op
	store %type.TypeNode* %t.arg, %type.TypeNode** %t
	store %ast.AstNode* %pc0.arg, %ast.AstNode** %pc0
	store %ast.AstNode* %pc1.arg, %ast.AstNode** %pc1
	%pa = alloca %ast.AstNode*
	%n = alloca i16
	%0 = load i8* %op
	%1 = zext i8 %0 to i32
	%2 = getelementptr [71 x i8]* @ast_NumChildDefault, i32 0, i32 %1
	%3 = load i8* %2
	%4 = zext i8 %3 to i16
	store i16 %4, i16* %n
	%5 = load i16* %n
	%6 = icmp ult i16 %5, 2
	br i1 %6, label %L.2, label %L.1
L.2:
	store i16 2, i16* %n
	br label %L.1
L.1:
	%7 = load i8* %op
	%8 = load i16* %n
	%9 = call %ast.AstNode* @ast_Alloc(i8 %7, i16 %8)
	store %ast.AstNode* %9, %ast.AstNode** %pa
	%10 = load %ast.AstNode** %pc0
	%11 = load %ast.AstNode** %pa
	%12 = getelementptr %ast.AstNode* %11, i32 0, i32 11
	%13 = getelementptr [0 x %ast.AstNode*]* %12, i32 0, i32 0
	store %ast.AstNode* %10, %ast.AstNode** %13
	%14 = load %ast.AstNode** %pc1
	%15 = load %ast.AstNode** %pa
	%16 = getelementptr %ast.AstNode* %15, i32 0, i32 11
	%17 = getelementptr [0 x %ast.AstNode*]* %16, i32 0, i32 1
	store %ast.AstNode* %14, %ast.AstNode** %17
	%18 = load %ast.AstNode** %pa
	%19 = getelementptr %ast.AstNode* %18, i32 0, i32 5
	store i16 2, i16* %19
	%20 = load %type.TypeNode** %t
	%21 = load %ast.AstNode** %pa
	%22 = getelementptr %ast.AstNode* %21, i32 0, i32 9
	store %type.TypeNode* %20, %type.TypeNode** %22
	%23 = load %ast.AstNode** %pc0
	%24 = getelementptr %ast.AstNode* %23, i32 0, i32 1
	%25 = load i8* %24
	%26 = load %ast.AstNode** %pa
	%27 = getelementptr %ast.AstNode* %26, i32 0, i32 1
	store i8 %25, i8* %27
	%28 = load %ast.AstNode** %pc0
	%29 = getelementptr %ast.AstNode* %28, i32 0, i32 2
	%30 = load i8* %29
	%31 = load %ast.AstNode** %pa
	%32 = getelementptr %ast.AstNode* %31, i32 0, i32 2
	store i8 %30, i8* %32
	%33 = load %ast.AstNode** %pa
	store %ast.AstNode* %33, %ast.AstNode** %rv.0
	br label %return
return:
	%34 = load %ast.AstNode** %rv.0
	ret %ast.AstNode* %34
}
define %ast.AstNode* @ast_New3(i8 zeroext %op.arg, %type.TypeNode* %t.arg, %ast.AstNode* %pc0.arg, %ast.AstNode* %pc1.arg, %ast.AstNode* %pc2.arg) nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%op = alloca i8
	%t = alloca %type.TypeNode*
	%pc0 = alloca %ast.AstNode*
	%pc1 = alloca %ast.AstNode*
	%pc2 = alloca %ast.AstNode*
	store i8 %op.arg, i8* %op
	store %type.TypeNode* %t.arg, %type.TypeNode** %t
	store %ast.AstNode* %pc0.arg, %ast.AstNode** %pc0
	store %ast.AstNode* %pc1.arg, %ast.AstNode** %pc1
	store %ast.AstNode* %pc2.arg, %ast.AstNode** %pc2
	%pa = alloca %ast.AstNode*
	%n = alloca i16
	%0 = load i8* %op
	%1 = zext i8 %0 to i32
	%2 = getelementptr [71 x i8]* @ast_NumChildDefault, i32 0, i32 %1
	%3 = load i8* %2
	%4 = zext i8 %3 to i16
	store i16 %4, i16* %n
	%5 = load i16* %n
	%6 = icmp ult i16 %5, 3
	br i1 %6, label %L.2, label %L.1
L.2:
	store i16 3, i16* %n
	br label %L.1
L.1:
	%7 = load i8* %op
	%8 = load i16* %n
	%9 = call %ast.AstNode* @ast_Alloc(i8 %7, i16 %8)
	store %ast.AstNode* %9, %ast.AstNode** %pa
	%10 = load %ast.AstNode** %pc0
	%11 = load %ast.AstNode** %pa
	%12 = getelementptr %ast.AstNode* %11, i32 0, i32 11
	%13 = getelementptr [0 x %ast.AstNode*]* %12, i32 0, i32 0
	store %ast.AstNode* %10, %ast.AstNode** %13
	%14 = load %ast.AstNode** %pc1
	%15 = load %ast.AstNode** %pa
	%16 = getelementptr %ast.AstNode* %15, i32 0, i32 11
	%17 = getelementptr [0 x %ast.AstNode*]* %16, i32 0, i32 1
	store %ast.AstNode* %14, %ast.AstNode** %17
	%18 = load %ast.AstNode** %pc2
	%19 = load %ast.AstNode** %pa
	%20 = getelementptr %ast.AstNode* %19, i32 0, i32 11
	%21 = getelementptr [0 x %ast.AstNode*]* %20, i32 0, i32 2
	store %ast.AstNode* %18, %ast.AstNode** %21
	%22 = load %ast.AstNode** %pa
	%23 = getelementptr %ast.AstNode* %22, i32 0, i32 5
	store i16 3, i16* %23
	%24 = load %type.TypeNode** %t
	%25 = load %ast.AstNode** %pa
	%26 = getelementptr %ast.AstNode* %25, i32 0, i32 9
	store %type.TypeNode* %24, %type.TypeNode** %26
	%27 = load %ast.AstNode** %pc0
	%28 = getelementptr %ast.AstNode* %27, i32 0, i32 1
	%29 = load i8* %28
	%30 = load %ast.AstNode** %pa
	%31 = getelementptr %ast.AstNode* %30, i32 0, i32 1
	store i8 %29, i8* %31
	%32 = load %ast.AstNode** %pc0
	%33 = getelementptr %ast.AstNode* %32, i32 0, i32 2
	%34 = load i8* %33
	%35 = load %ast.AstNode** %pa
	%36 = getelementptr %ast.AstNode* %35, i32 0, i32 2
	store i8 %34, i8* %36
	%37 = load %ast.AstNode** %pa
	store %ast.AstNode* %37, %ast.AstNode** %rv.0
	br label %return
return:
	%38 = load %ast.AstNode** %rv.0
	ret %ast.AstNode* %38
}
define %ast.AstNode* @ast_Child(%ast.AstNode* %pp.arg, %ast.AstNode* %pc.arg) nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%pp = alloca %ast.AstNode*
	%pc = alloca %ast.AstNode*
	store %ast.AstNode* %pp.arg, %ast.AstNode** %pp
	store %ast.AstNode* %pc.arg, %ast.AstNode** %pc
	%n = alloca i16
	%0 = load %ast.AstNode** %pp
	%1 = icmp ne %ast.AstNode* %0, null
	br i1 %1, label %L.2, label %L.1
L.2:
	%2 = load %ast.AstNode** %pp
	%3 = getelementptr %ast.AstNode* %2, i32 0, i32 5
	%4 = load i16* %3
	%5 = add i16 %4, 1
	store i16 %5, i16* %n
	%6 = load i16* %n
	%7 = load %ast.AstNode** %pp
	%8 = getelementptr %ast.AstNode* %7, i32 0, i32 6
	%9 = load i16* %8
	%10 = icmp ugt i16 %6, %9
	br i1 %10, label %L.4, label %L.3
L.4:
	%11 = load %ast.AstNode** %pp
	%12 = load i16* %n
	%13 = call %ast.AstNode* @ast_Expand(%ast.AstNode* %11, i16 %12)
	store %ast.AstNode* %13, %ast.AstNode** %pp
	br label %L.3
L.3:
	%14 = load %ast.AstNode** %pc
	%15 = load %ast.AstNode** %pp
	%16 = getelementptr %ast.AstNode* %15, i32 0, i32 11
	%17 = load %ast.AstNode** %pp
	%18 = getelementptr %ast.AstNode* %17, i32 0, i32 5
	%19 = load i16* %18
	%20 = zext i16 %19 to i32
	%21 = getelementptr [0 x %ast.AstNode*]* %16, i32 0, i32 %20
	store %ast.AstNode* %14, %ast.AstNode** %21
	%22 = load i16* %n
	%23 = load %ast.AstNode** %pp
	%24 = getelementptr %ast.AstNode* %23, i32 0, i32 5
	store i16 %22, i16* %24
	br label %L.1
L.1:
	%25 = load %ast.AstNode** %pp
	store %ast.AstNode* %25, %ast.AstNode** %rv.0
	br label %return
return:
	%26 = load %ast.AstNode** %rv.0
	ret %ast.AstNode* %26
}
define %ast.AstNode* @ast_ChildIndexed(%ast.AstNode* %pp.arg, i16 zeroext %n.arg, %ast.AstNode* %pc.arg) nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%pp = alloca %ast.AstNode*
	%n = alloca i16
	%pc = alloca %ast.AstNode*
	store %ast.AstNode* %pp.arg, %ast.AstNode** %pp
	store i16 %n.arg, i16* %n
	store %ast.AstNode* %pc.arg, %ast.AstNode** %pc
	%0 = load i16* %n
	%1 = add i16 %0, 1
	store i16 %1, i16* %n
	%2 = load i16* %n
	%3 = load %ast.AstNode** %pp
	%4 = getelementptr %ast.AstNode* %3, i32 0, i32 6
	%5 = load i16* %4
	%6 = icmp ugt i16 %2, %5
	br i1 %6, label %L.2, label %L.1
L.2:
	%7 = load %ast.AstNode** %pp
	%8 = load i16* %n
	%9 = call %ast.AstNode* @ast_Expand(%ast.AstNode* %7, i16 %8)
	store %ast.AstNode* %9, %ast.AstNode** %pp
	br label %L.1
L.1:
	%10 = load %ast.AstNode** %pc
	%11 = load %ast.AstNode** %pp
	%12 = getelementptr %ast.AstNode* %11, i32 0, i32 11
	%13 = load i16* %n
	%14 = sub i16 %13, 1
	%15 = zext i16 %14 to i32
	%16 = getelementptr [0 x %ast.AstNode*]* %12, i32 0, i32 %15
	store %ast.AstNode* %10, %ast.AstNode** %16
	%17 = load i16* %n
	%18 = load %ast.AstNode** %pp
	%19 = getelementptr %ast.AstNode* %18, i32 0, i32 5
	store i16 %17, i16* %19
	%20 = load %ast.AstNode** %pp
	store %ast.AstNode* %20, %ast.AstNode** %rv.0
	br label %return
return:
	%21 = load %ast.AstNode** %rv.0
	ret %ast.AstNode* %21
}
define %ast.AstNode* @ast_Const(%type.TypeNode* %t.arg, i64 %value.arg) nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%t = alloca %type.TypeNode*
	%value = alloca i64
	store %type.TypeNode* %t.arg, %type.TypeNode** %t
	store i64 %value.arg, i64* %value
	%pa = alloca %ast.AstNode*
	%0 = load %type.TypeNode** %t
	%1 = call %ast.AstNode* @ast_New(i8 7, %type.TypeNode* %0)
	store %ast.AstNode* %1, %ast.AstNode** %pa
	%2 = load i64* %value
	%3 = load %ast.AstNode** %pa
	%4 = getelementptr %ast.AstNode* %3, i32 0, i32 8
	store i64 %2, i64* %4
	%5 = load %type.TypeNode** %t
	%6 = icmp ne %type.TypeNode* %5, null
	br i1 %6, label %L.2, label %L.1
L.2:
	%7 = load %type.TypeNode** %t
	%8 = getelementptr %type.TypeNode* %7, i32 0, i32 11
	%9 = load i8* %8
	%10 = load %ast.AstNode** %pa
	%11 = getelementptr %ast.AstNode* %10, i32 0, i32 1
	store i8 %9, i8* %11
	%12 = load %type.TypeNode** %t
	%13 = getelementptr %type.TypeNode* %12, i32 0, i32 8
	%14 = load i32* %13
	%15 = trunc i32 %14 to i8
	%16 = load %ast.AstNode** %pa
	%17 = getelementptr %ast.AstNode* %16, i32 0, i32 2
	store i8 %15, i8* %17
	br label %L.1
L.1:
	%18 = load %ast.AstNode** %pa
	store %ast.AstNode* %18, %ast.AstNode** %rv.0
	br label %return
return:
	%19 = load %ast.AstNode** %rv.0
	ret %ast.AstNode* %19
}
@ast_OpName = internal constant [71 x [0 x i8]*] [ [0 x i8] * bitcast( [5 x i8]* getelementptr( [5 x i8]* @.str365 )  to [0 x i8]* ), [0 x i8] * bitcast( [4 x i8]* getelementptr( [4 x i8]* @.str366 )  to [0 x i8]* ), [0 x i8] * bitcast( [5 x i8]* getelementptr( [5 x i8]* @.str367 )  to [0 x i8]* ), [0 x i8] * bitcast( [5 x i8]* getelementptr( [5 x i8]* @.str368 )  to [0 x i8]* ), [0 x i8] * bitcast( [8 x i8]* getelementptr( [8 x i8]* @.str369 )  to [0 x i8]* ), [0 x i8] * bitcast( [7 x i8]* getelementptr( [7 x i8]* @.str370 )  to [0 x i8]* ), [0 x i8] * bitcast( [7 x i8]* getelementptr( [7 x i8]* @.str371 )  to [0 x i8]* ), [0 x i8] * bitcast( [6 x i8]* getelementptr( [6 x i8]* @.str372 )  to [0 x i8]* ), [0 x i8] * bitcast( [7 x i8]* getelementptr( [7 x i8]* @.str373 )  to [0 x i8]* ), [0 x i8] * bitcast( [4 x i8]* getelementptr( [4 x i8]* @.str374 )  to [0 x i8]* ), [0 x i8] * bitcast( [5 x i8]* getelementptr( [5 x i8]* @.str375 )  to [0 x i8]* ), [0 x i8] * bitcast( [6 x i8]* getelementptr( [6 x i8]* @.str376 )  to [0 x i8]* ), [0 x i8] * bitcast( [4 x i8]* getelementptr( [4 x i8]* @.str377 )  to [0 x i8]* ), [0 x i8] * bitcast( [7 x i8]* getelementptr( [7 x i8]* @.str378 )  to [0 x i8]* ), [0 x i8] * bitcast( [6 x i8]* getelementptr( [6 x i8]* @.str379 )  to [0 x i8]* ), [0 x i8] * bitcast( [5 x i8]* getelementptr( [5 x i8]* @.str380 )  to [0 x i8]* ), [0 x i8] * bitcast( [7 x i8]* getelementptr( [7 x i8]* @.str381 )  to [0 x i8]* ), [0 x i8] * bitcast( [6 x i8]* getelementptr( [6 x i8]* @.str382 )  to [0 x i8]* ), [0 x i8] * bitcast( [6 x i8]* getelementptr( [6 x i8]* @.str383 )  to [0 x i8]* ), [0 x i8] * bitcast( [6 x i8]* getelementptr( [6 x i8]* @.str384 )  to [0 x i8]* ), [0 x i8] * bitcast( [5 x i8]* getelementptr( [5 x i8]* @.str385 )  to [0 x i8]* ), [0 x i8] * bitcast( [6 x i8]* getelementptr( [6 x i8]* @.str386 )  to [0 x i8]* ), [0 x i8] * bitcast( [4 x i8]* getelementptr( [4 x i8]* @.str387 )  to [0 x i8]* ), [0 x i8] * bitcast( [4 x i8]* getelementptr( [4 x i8]* @.str388 )  to [0 x i8]* ), [0 x i8] * bitcast( [6 x i8]* getelementptr( [6 x i8]* @.str389 )  to [0 x i8]* ), [0 x i8] * bitcast( [5 x i8]* getelementptr( [5 x i8]* @.str390 )  to [0 x i8]* ), [0 x i8] * bitcast( [6 x i8]* getelementptr( [6 x i8]* @.str391 )  to [0 x i8]* ), [0 x i8] * bitcast( [5 x i8]* getelementptr( [5 x i8]* @.str392 )  to [0 x i8]* ), [0 x i8] * bitcast( [5 x i8]* getelementptr( [5 x i8]* @.str393 )  to [0 x i8]* ), [0 x i8] * bitcast( [6 x i8]* getelementptr( [6 x i8]* @.str394 )  to [0 x i8]* ), [0 x i8] * bitcast( [5 x i8]* getelementptr( [5 x i8]* @.str395 )  to [0 x i8]* ), [0 x i8] * bitcast( [4 x i8]* getelementptr( [4 x i8]* @.str396 )  to [0 x i8]* ), [0 x i8] * bitcast( [4 x i8]* getelementptr( [4 x i8]* @.str397 )  to [0 x i8]* ), [0 x i8] * bitcast( [4 x i8]* getelementptr( [4 x i8]* @.str398 )  to [0 x i8]* ), [0 x i8] * bitcast( [4 x i8]* getelementptr( [4 x i8]* @.str399 )  to [0 x i8]* ), [0 x i8] * bitcast( [4 x i8]* getelementptr( [4 x i8]* @.str400 )  to [0 x i8]* ), [0 x i8] * bitcast( [4 x i8]* getelementptr( [4 x i8]* @.str401 )  to [0 x i8]* ), [0 x i8] * bitcast( [4 x i8]* getelementptr( [4 x i8]* @.str402 )  to [0 x i8]* ), [0 x i8] * bitcast( [3 x i8]* getelementptr( [3 x i8]* @.str403 )  to [0 x i8]* ), [0 x i8] * bitcast( [3 x i8]* getelementptr( [3 x i8]* @.str404 )  to [0 x i8]* ), [0 x i8] * bitcast( [4 x i8]* getelementptr( [4 x i8]* @.str405 )  to [0 x i8]* ), [0 x i8] * bitcast( [4 x i8]* getelementptr( [4 x i8]* @.str406 )  to [0 x i8]* ), [0 x i8] * bitcast( [4 x i8]* getelementptr( [4 x i8]* @.str407 )  to [0 x i8]* ), [0 x i8] * bitcast( [4 x i8]* getelementptr( [4 x i8]* @.str408 )  to [0 x i8]* ), [0 x i8] * bitcast( [4 x i8]* getelementptr( [4 x i8]* @.str409 )  to [0 x i8]* ), [0 x i8] * bitcast( [4 x i8]* getelementptr( [4 x i8]* @.str410 )  to [0 x i8]* ), [0 x i8] * bitcast( [4 x i8]* getelementptr( [4 x i8]* @.str411 )  to [0 x i8]* ), [0 x i8] * bitcast( [4 x i8]* getelementptr( [4 x i8]* @.str412 )  to [0 x i8]* ), [0 x i8] * bitcast( [5 x i8]* getelementptr( [5 x i8]* @.str413 )  to [0 x i8]* ), [0 x i8] * bitcast( [5 x i8]* getelementptr( [5 x i8]* @.str414 )  to [0 x i8]* ), [0 x i8] * bitcast( [5 x i8]* getelementptr( [5 x i8]* @.str415 )  to [0 x i8]* ), [0 x i8] * bitcast( [5 x i8]* getelementptr( [5 x i8]* @.str416 )  to [0 x i8]* ), [0 x i8] * bitcast( [4 x i8]* getelementptr( [4 x i8]* @.str417 )  to [0 x i8]* ), [0 x i8] * bitcast( [4 x i8]* getelementptr( [4 x i8]* @.str418 )  to [0 x i8]* ), [0 x i8] * bitcast( [4 x i8]* getelementptr( [4 x i8]* @.str419 )  to [0 x i8]* ), [0 x i8] * bitcast( [4 x i8]* getelementptr( [4 x i8]* @.str420 )  to [0 x i8]* ), [0 x i8] * bitcast( [4 x i8]* getelementptr( [4 x i8]* @.str421 )  to [0 x i8]* ), [0 x i8] * bitcast( [3 x i8]* getelementptr( [3 x i8]* @.str422 )  to [0 x i8]* ), [0 x i8] * bitcast( [4 x i8]* getelementptr( [4 x i8]* @.str423 )  to [0 x i8]* ), [0 x i8] * bitcast( [5 x i8]* getelementptr( [5 x i8]* @.str424 )  to [0 x i8]* ), [0 x i8] * bitcast( [4 x i8]* getelementptr( [4 x i8]* @.str425 )  to [0 x i8]* ), [0 x i8] * bitcast( [5 x i8]* getelementptr( [5 x i8]* @.str426 )  to [0 x i8]* ), [0 x i8] * bitcast( [7 x i8]* getelementptr( [7 x i8]* @.str427 )  to [0 x i8]* ), [0 x i8] * bitcast( [4 x i8]* getelementptr( [4 x i8]* @.str428 )  to [0 x i8]* ), [0 x i8] * bitcast( [5 x i8]* getelementptr( [5 x i8]* @.str429 )  to [0 x i8]* ), [0 x i8] * bitcast( [5 x i8]* getelementptr( [5 x i8]* @.str430 )  to [0 x i8]* ), [0 x i8] * bitcast( [3 x i8]* getelementptr( [3 x i8]* @.str431 )  to [0 x i8]* ), [0 x i8] * bitcast( [4 x i8]* getelementptr( [4 x i8]* @.str432 )  to [0 x i8]* ), [0 x i8] * bitcast( [3 x i8]* getelementptr( [3 x i8]* @.str433 )  to [0 x i8]* ), [0 x i8] * bitcast( [4 x i8]* getelementptr( [4 x i8]* @.str434 )  to [0 x i8]* ), [0 x i8] * bitcast( [5 x i8]* getelementptr( [5 x i8]* @.str435 )  to [0 x i8]* ) ], align 4
@ast_KindName = internal constant [8 x [0 x i8]*] [ [0 x i8] * bitcast( [5 x i8]* getelementptr( [5 x i8]* @.str437 )  to [0 x i8]* ), [0 x i8] * bitcast( [5 x i8]* getelementptr( [5 x i8]* @.str438 )  to [0 x i8]* ), [0 x i8] * bitcast( [5 x i8]* getelementptr( [5 x i8]* @.str439 )  to [0 x i8]* ), [0 x i8] * bitcast( [5 x i8]* getelementptr( [5 x i8]* @.str440 )  to [0 x i8]* ), [0 x i8] * bitcast( [4 x i8]* getelementptr( [4 x i8]* @.str441 )  to [0 x i8]* ), [0 x i8] * bitcast( [6 x i8]* getelementptr( [6 x i8]* @.str442 )  to [0 x i8]* ), [0 x i8] * bitcast( [7 x i8]* getelementptr( [7 x i8]* @.str443 )  to [0 x i8]* ), [0 x i8] * bitcast( [8 x i8]* getelementptr( [8 x i8]* @.str444 )  to [0 x i8]* ) ], align 4
define void @ast_Print(%ast.AstNode* %node.arg) nounwind {
L.0:
	%node = alloca %ast.AstNode*
	store %ast.AstNode* %node.arg, %ast.AstNode** %node
	%s = alloca %symb.SymbNode*
	%t = alloca %type.TypeNode*
	%0 = load %ast.AstNode** %node
	%1 = getelementptr %ast.AstNode* %0, i32 0, i32 0
	%2 = load i8* %1
	%3 = zext i8 %2 to i32
	%4 = getelementptr [71 x [0 x i8]*]* @ast_OpName, i32 0, i32 %3
	%5 = load [0 x i8]** %4
	%6 = bitcast [0 x i8]* %5 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %6)
	call void @out_chr(i32 2, i8 40)
	%7 = load %ast.AstNode** %node
	%8 = getelementptr %ast.AstNode* %7, i32 0, i32 1
	%9 = load i8* %8
	%10 = zext i8 %9 to i32
	%11 = getelementptr [8 x [0 x i8]*]* @ast_KindName, i32 0, i32 %10
	%12 = load [0 x i8]** %11
	%13 = bitcast [0 x i8]* %12 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %13)
	%14 = getelementptr [5 x i8]* @.str445
	%15 = bitcast [5 x i8]* %14 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %15)
	%16 = load %ast.AstNode** %node
	%17 = getelementptr %ast.AstNode* %16, i32 0, i32 2
	%18 = load i8* %17
	%19 = zext i8 %18 to i32
	call void @out_uint(i32 2, i32 %19)
	%20 = getelementptr [5 x i8]* @.str446
	%21 = bitcast [5 x i8]* %20 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %21)
	%22 = load %ast.AstNode** %node
	%23 = getelementptr %ast.AstNode* %22, i32 0, i32 4
	%24 = load i16* %23
	%25 = zext i16 %24 to i32
	call void @out_uint(i32 2, i32 %25)
	%26 = getelementptr [5 x i8]* @.str447
	%27 = bitcast [5 x i8]* %26 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %27)
	%28 = load %ast.AstNode** %node
	%29 = getelementptr %ast.AstNode* %28, i32 0, i32 5
	%30 = load i16* %29
	%31 = zext i16 %30 to i32
	call void @out_uint(i32 2, i32 %31)
	%32 = load %ast.AstNode** %node
	%33 = getelementptr %ast.AstNode* %32, i32 0, i32 9
	%34 = load %type.TypeNode** %33
	store %type.TypeNode* %34, %type.TypeNode** %t
	%35 = load %ast.AstNode** %node
	%36 = getelementptr %ast.AstNode* %35, i32 0, i32 0
	%37 = load i8* %36
	%38 = zext i8 %37 to i32
	switch i32 %38, label %L.1 [
		i32 7, label %L.3
		i32 16, label %L.3
		i32 20, label %L.3
		i32 24, label %L.3
		i32 8, label %L.4
		i32 5, label %L.5
		i32 9, label %L.5
		i32 70, label %L.5
		i32 10, label %L.5
		i32 3, label %L.5
		i32 4, label %L.5
		i32 12, label %L.6
	]
L.3:
	%39 = getelementptr [8 x i8]* @.str448
	%40 = bitcast [8 x i8]* %39 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %40)
	%41 = load %ast.AstNode** %node
	%42 = getelementptr %ast.AstNode* %41, i32 0, i32 0
	%43 = load i8* %42
	%44 = icmp eq i8 %43, 7
	br i1 %44, label %L.7, label %L.8
L.7:
	%45 = load %ast.AstNode** %node
	%46 = getelementptr %ast.AstNode* %45, i32 0, i32 1
	%47 = load i8* %46
	%48 = icmp eq i8 %47, 3
	br label %L.8
L.8:
	%49 = phi i1 [ false, %L.3 ], [ %48, %L.7 ]
	br i1 %49, label %L.10, label %L.11
L.10:
	%50 = load %ast.AstNode** %node
	%51 = getelementptr %ast.AstNode* %50, i32 0, i32 8
	%52 = load i64* %51
	call void @out_int64(i32 2, i64 %52)
	br label %L.9
L.11:
	%53 = load %ast.AstNode** %node
	%54 = getelementptr %ast.AstNode* %53, i32 0, i32 8
	%55 = load i64* %54
	call void @out_uint64(i32 2, i64 %55)
	br label %L.9
L.9:
	br label %L.2
L.4:
	%56 = getelementptr [5 x i8]* @.str449
	%57 = bitcast [5 x i8]* %56 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %57)
	%58 = load %ast.AstNode** %node
	%59 = getelementptr %ast.AstNode* %58, i32 0, i32 8
	%60 = load i64* %59
	%61 = trunc i64 %60 to i32
	call void @out_uint32(i32 2, i32 %61)
	%62 = getelementptr [9 x i8]* @.str450
	%63 = bitcast [9 x i8]* %62 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %63)
	%64 = load %ast.AstNode** %node
	%65 = getelementptr %ast.AstNode* %64, i32 0, i32 10
	%66 = load %symb.SymbNode** %65
	%67 = bitcast %symb.SymbNode* %66 to [0 x i8]*
	%68 = bitcast [0 x i8]* %67 to [0 x i8]*
	%69 = load %ast.AstNode** %node
	%70 = getelementptr %ast.AstNode* %69, i32 0, i32 9
	%71 = load %type.TypeNode** %70
	%72 = getelementptr %type.TypeNode* %71, i32 0, i32 6
	%73 = load i64* %72
	%74 = sub i64 %73, 1
	%75 = trunc i64 %74 to i32
	call void @out_strn(i32 2, [0 x i8]* %68, i32 %75)
	call void @out_chr(i32 2, i8 34)
	br label %L.2
L.5:
	%76 = getelementptr [7 x i8]* @.str451
	%77 = bitcast [7 x i8]* %76 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %77)
	%78 = load %ast.AstNode** %node
	%79 = getelementptr %ast.AstNode* %78, i32 0, i32 10
	%80 = load %symb.SymbNode** %79
	store %symb.SymbNode* %80, %symb.SymbNode** %s
	%81 = load %symb.SymbNode** %s
	%82 = icmp ne %symb.SymbNode* %81, null
	br i1 %82, label %L.13, label %L.14
L.13:
	%83 = load %symb.SymbNode** %s
	%84 = getelementptr %symb.SymbNode* %83, i32 0, i32 19
	%85 = getelementptr [0 x i8]* %84
	call void @out_str(i32 2, [0 x i8]* %85)
	br label %L.12
L.14:
	%86 = getelementptr [7 x i8]* @.str452
	%87 = bitcast [7 x i8]* %86 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %87)
	br label %L.12
L.12:
	br label %L.2
L.6:
	store %type.TypeNode* null, %type.TypeNode** %t
	br label %L.2
L.1:
	br label %L.2
L.2:
	call void @out_chr(i32 2, i8 41)
	%88 = load %type.TypeNode** %t
	%89 = icmp ne %type.TypeNode* %88, null
	br i1 %89, label %L.16, label %L.15
L.16:
	call void @out_chr(i32 2, i8 58)
	%90 = load %type.TypeNode** %t
	call void @type_DumpT(%type.TypeNode* %90, i8 0)
	br label %L.15
L.15:
	call void @out_nl(i32 2)
	br label %return
return:
	ret void
}
@ast_blanks = internal constant [65 x i8] c"                                                                \00"
define void @ast_DumpSub(%ast.AstNode* %tree.arg, i32 %level.arg) nounwind {
L.0:
	%tree = alloca %ast.AstNode*
	%level = alloca i32
	store %ast.AstNode* %tree.arg, %ast.AstNode** %tree
	store i32 %level.arg, i32* %level
	%i = alloca i16
	%0 = getelementptr [65 x i8]* @ast_blanks
	%1 = bitcast [65 x i8]* %0 to [0 x i8]*
	%2 = load i32* %level
	%3 = call i32 @write(i32 2, [0 x i8]* %1, i32 %2)
	%4 = load %ast.AstNode** %tree
	%5 = icmp eq %ast.AstNode* %4, null
	br i1 %5, label %L.2, label %L.3
L.2:
	%6 = getelementptr [8 x i8]* @.str454
	%7 = bitcast [8 x i8]* %6 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %7)
	br label %L.1
L.3:
	%8 = load %ast.AstNode** %tree
	call void @ast_Print(%ast.AstNode* %8)
	store i16 0, i16* %i
	br label %L.4
L.4:
	%9 = load i16* %i
	%10 = load %ast.AstNode** %tree
	%11 = getelementptr %ast.AstNode* %10, i32 0, i32 5
	%12 = load i16* %11
	%13 = icmp ult i16 %9, %12
	%14 = xor i1 %13, true
	br i1 %14, label %L.5, label %L.6
L.6:
	%15 = load %ast.AstNode** %tree
	%16 = getelementptr %ast.AstNode* %15, i32 0, i32 11
	%17 = load i16* %i
	%18 = zext i16 %17 to i32
	%19 = getelementptr [0 x %ast.AstNode*]* %16, i32 0, i32 %18
	%20 = load %ast.AstNode** %19
	%21 = load i32* %level
	%22 = add i32 %21, 1
	call void @ast_DumpSub(%ast.AstNode* %20, i32 %22)
	%23 = load i16* %i
	%24 = add i16 %23, 1
	store i16 %24, i16* %i
	br label %L.4
L.5:
	br label %L.1
L.1:
	br label %return
return:
	ret void
}
define void @ast_Dump(%ast.AstNode* %tree.arg) nounwind {
L.0:
	%tree = alloca %ast.AstNode*
	store %ast.AstNode* %tree.arg, %ast.AstNode** %tree
	%0 = load %ast.AstNode** %tree
	call void @ast_DumpSub(%ast.AstNode* %0, i32 0)
	br label %return
return:
	ret void
}
%type.fwd = type {%type.fwd*, %symb.SymbNode*, %type.TypeNode*}
@type_fwdlist = internal global %type.fwd* zeroinitializer, align 4
define void @type_FwdAdd(%symb.SymbNode* %s.arg, %type.TypeNode* %t.arg) nounwind {
L.0:
	%s = alloca %symb.SymbNode*
	%t = alloca %type.TypeNode*
	store %symb.SymbNode* %s.arg, %symb.SymbNode** %s
	store %type.TypeNode* %t.arg, %type.TypeNode** %t
	%f = alloca %type.fwd*
	%0 = call [0 x i8]* @sys_zalloc(i32 12)
	%1 = bitcast [0 x i8]* %0 to %type.fwd*
	store %type.fwd* %1, %type.fwd** %f
	%2 = load %symb.SymbNode** %s
	%3 = load %type.fwd** %f
	%4 = getelementptr %type.fwd* %3, i32 0, i32 1
	store %symb.SymbNode* %2, %symb.SymbNode** %4
	%5 = load %type.TypeNode** %t
	%6 = load %type.fwd** %f
	%7 = getelementptr %type.fwd* %6, i32 0, i32 2
	store %type.TypeNode* %5, %type.TypeNode** %7
	%8 = load %type.fwd** @type_fwdlist
	%9 = load %type.fwd** %f
	%10 = getelementptr %type.fwd* %9, i32 0, i32 0
	store %type.fwd* %8, %type.fwd** %10
	%11 = load %type.fwd** %f
	store %type.fwd* %11, %type.fwd** @type_fwdlist
	%12 = load %symb.SymbNode** %s
	%13 = getelementptr %symb.SymbNode* %12, i32 0, i32 14
	store i8 1, i8* %13
	br label %return
return:
	ret void
}
define void @type_FwdFix(%symb.SymbNode* %s.arg, %type.TypeNode* %bt.arg) nounwind {
L.0:
	%s = alloca %symb.SymbNode*
	%bt = alloca %type.TypeNode*
	store %symb.SymbNode* %s.arg, %symb.SymbNode** %s
	store %type.TypeNode* %bt.arg, %type.TypeNode** %bt
	%f = alloca %type.fwd*
	%fn = alloca %type.fwd*
	%fp = alloca %type.fwd*
	store %type.fwd* null, %type.fwd** %fp
	%0 = load %type.fwd** @type_fwdlist
	store %type.fwd* %0, %type.fwd** %f
	br label %L.1
L.1:
	%1 = load %type.fwd** %f
	%2 = icmp ne %type.fwd* %1, null
	%3 = xor i1 %2, true
	br i1 %3, label %L.2, label %L.3
L.3:
	%4 = load %type.fwd** %f
	%5 = getelementptr %type.fwd* %4, i32 0, i32 0
	%6 = load %type.fwd** %5
	store %type.fwd* %6, %type.fwd** %fn
	%7 = load %symb.SymbNode** %s
	%8 = load %type.fwd** %f
	%9 = getelementptr %type.fwd* %8, i32 0, i32 1
	%10 = load %symb.SymbNode** %9
	%11 = icmp eq %symb.SymbNode* %7, %10
	br i1 %11, label %L.5, label %L.4
L.5:
	%12 = load %type.TypeNode** %bt
	%13 = load %type.fwd** %f
	%14 = getelementptr %type.fwd* %13, i32 0, i32 2
	%15 = load %type.TypeNode** %14
	%16 = getelementptr %type.TypeNode* %15, i32 0, i32 0
	store %type.TypeNode* %12, %type.TypeNode** %16
	%17 = load %type.fwd** %fp
	%18 = icmp ne %type.fwd* %17, null
	br i1 %18, label %L.7, label %L.8
L.7:
	%19 = load %type.fwd** %fn
	%20 = load %type.fwd** %fp
	%21 = getelementptr %type.fwd* %20, i32 0, i32 0
	store %type.fwd* %19, %type.fwd** %21
	br label %L.6
L.8:
	%22 = load %type.fwd** %fn
	store %type.fwd* %22, %type.fwd** @type_fwdlist
	br label %L.6
L.6:
	br label %L.4
L.4:
	%23 = load %type.fwd** %f
	store %type.fwd* %23, %type.fwd** %fp
	%24 = load %type.fwd** %fn
	store %type.fwd* %24, %type.fwd** %f
	br label %L.1
L.2:
	%25 = load %symb.SymbNode** %s
	%26 = getelementptr %symb.SymbNode* %25, i32 0, i32 14
	store i8 0, i8* %26
	br label %return
return:
	ret void
}
define zeroext i8 @type_Same(%type.TypeNode* %a.arg, %type.TypeNode* %b.arg) nounwind {
L.0:
	%rv.0 = alloca i8
	%a = alloca %type.TypeNode*
	%b = alloca %type.TypeNode*
	store %type.TypeNode* %a.arg, %type.TypeNode** %a
	store %type.TypeNode* %b.arg, %type.TypeNode** %b
	%0 = load %type.TypeNode** %a
	%1 = load %type.TypeNode** %b
	%2 = icmp eq %type.TypeNode* %0, %1
	br i1 %2, label %L.2, label %L.1
L.1:
	%3 = load %type.TypeNode** %a
	%4 = getelementptr %type.TypeNode* %3, i32 0, i32 2
	%5 = load %symb.SymbNode** %4
	%6 = load %type.TypeNode** %b
	%7 = getelementptr %type.TypeNode* %6, i32 0, i32 2
	%8 = load %symb.SymbNode** %7
	%9 = icmp eq %symb.SymbNode* %5, %8
	br label %L.2
L.2:
	%10 = phi i1 [ true, %L.0 ], [ %9, %L.1 ]
	br i1 %10, label %L.4, label %L.3
L.4:
	store i8 1, i8* %rv.0
	br label %return
L.3:
	store i8 0, i8* %rv.0
	br label %return
return:
	%11 = load i8* %rv.0
	ret i8 %11
}
@type_KindName = internal constant [8 x [0 x i8]*] [ [0 x i8] * bitcast( [7 x i8]* getelementptr( [7 x i8]* @.str456 )  to [0 x i8]* ), [0 x i8] * bitcast( [5 x i8]* getelementptr( [5 x i8]* @.str457 )  to [0 x i8]* ), [0 x i8] * bitcast( [5 x i8]* getelementptr( [5 x i8]* @.str458 )  to [0 x i8]* ), [0 x i8] * bitcast( [5 x i8]* getelementptr( [5 x i8]* @.str459 )  to [0 x i8]* ), [0 x i8] * bitcast( [4 x i8]* getelementptr( [4 x i8]* @.str460 )  to [0 x i8]* ), [0 x i8] * bitcast( [6 x i8]* getelementptr( [6 x i8]* @.str461 )  to [0 x i8]* ), [0 x i8] * bitcast( [7 x i8]* getelementptr( [7 x i8]* @.str462 )  to [0 x i8]* ), [0 x i8] * bitcast( [8 x i8]* getelementptr( [8 x i8]* @.str463 )  to [0 x i8]* ) ], align 4
define zeroext i8 @type_Compat(%type.TypeNode* %t1.arg, %type.TypeNode* %t2.arg) nounwind {
L.0:
	%rv.0 = alloca i8
	%t1 = alloca %type.TypeNode*
	%t2 = alloca %type.TypeNode*
	store %type.TypeNode* %t1.arg, %type.TypeNode** %t1
	store %type.TypeNode* %t2.arg, %type.TypeNode** %t2
	%0 = load %type.TypeNode** %t1
	%1 = icmp eq %type.TypeNode* %0, null
	br i1 %1, label %L.2, label %L.1
L.1:
	%2 = load %type.TypeNode** %t2
	%3 = icmp eq %type.TypeNode* %2, null
	br label %L.2
L.2:
	%4 = phi i1 [ true, %L.0 ], [ %3, %L.1 ]
	br i1 %4, label %L.4, label %L.3
L.4:
	store i8 1, i8* %rv.0
	br label %return
L.3:
	%5 = load %type.TypeNode** %t1
	%6 = load %type.TypeNode** %t2
	%7 = icmp eq %type.TypeNode* %5, %6
	br i1 %7, label %L.6, label %L.5
L.6:
	store i8 1, i8* %rv.0
	br label %return
L.5:
	%8 = load %type.TypeNode** %t1
	%9 = getelementptr %type.TypeNode* %8, i32 0, i32 11
	%10 = load i8* %9
	%11 = load %type.TypeNode** %t2
	%12 = getelementptr %type.TypeNode* %11, i32 0, i32 11
	%13 = load i8* %12
	%14 = icmp ne i8 %10, %13
	br i1 %14, label %L.8, label %L.7
L.8:
	store i8 0, i8* %rv.0
	br label %return
L.7:
	%15 = load %type.TypeNode** %t2
	%16 = getelementptr %type.TypeNode* %15, i32 0, i32 11
	%17 = load i8* %16
	%18 = zext i8 %17 to i32
	switch i32 %18, label %L.9 [
		i32 2, label %L.11
		i32 3, label %L.11
		i32 1, label %L.12
		i32 6, label %L.12
		i32 4, label %L.13
		i32 5, label %L.14
	]
L.11:
	store i8 1, i8* %rv.0
	br label %return
L.12:
	%19 = load %type.TypeNode** %t2
	%20 = getelementptr %type.TypeNode* %19, i32 0, i32 0
	%21 = load %type.TypeNode** %20
	%22 = icmp ne %type.TypeNode* %21, null
	br i1 %22, label %L.16, label %L.15
L.16:
	%23 = load %type.TypeNode** %t1
	%24 = load %type.TypeNode** %t2
	%25 = getelementptr %type.TypeNode* %24, i32 0, i32 0
	%26 = load %type.TypeNode** %25
	%27 = call i8 @type_Compat(%type.TypeNode* %23, %type.TypeNode* %26)
	store i8 %27, i8* %rv.0
	br label %return
L.15:
	store i8 0, i8* %rv.0
	br label %return
L.13:
	%28 = load %type.TypeNode** %t1
	%29 = getelementptr %type.TypeNode* %28, i32 0, i32 0
	%30 = load %type.TypeNode** %29
	%31 = load %type.TypeNode** %t2
	%32 = getelementptr %type.TypeNode* %31, i32 0, i32 0
	%33 = load %type.TypeNode** %32
	%34 = call i8 @type_Compat(%type.TypeNode* %30, %type.TypeNode* %33)
	store i8 %34, i8* %rv.0
	br label %return
L.14:
	%35 = load %type.TypeNode** %t1
	%36 = getelementptr %type.TypeNode* %35, i32 0, i32 0
	%37 = load %type.TypeNode** %36
	%38 = load %type.TypeNode** %t2
	%39 = getelementptr %type.TypeNode* %38, i32 0, i32 0
	%40 = load %type.TypeNode** %39
	%41 = call i8 @type_Compat(%type.TypeNode* %37, %type.TypeNode* %40)
	store i8 %41, i8* %rv.0
	br label %return
L.9:
	br label %L.10
L.10:
	store i8 0, i8* %rv.0
	br label %return
return:
	%42 = load i8* %rv.0
	ret i8 %42
}
define zeroext i8 @type_NeedSwap(%type.TypeNode* %t.arg, i8 zeroext %to.arg) nounwind {
L.0:
	%rv.0 = alloca i8
	%t = alloca %type.TypeNode*
	%to = alloca i8
	store %type.TypeNode* %t.arg, %type.TypeNode** %t
	store i8 %to.arg, i8* %to
	%fm = alloca i8
	%0 = load %type.TypeNode** %t
	%1 = getelementptr %type.TypeNode* %0, i32 0, i32 7
	%2 = load i32* %1
	%3 = load %target.TargetT** @target_Target
	%4 = getelementptr %target.TargetT* %3, i32 0, i32 3
	%5 = load i8* %4
	%6 = zext i8 %5 to i32
	%7 = icmp ule i32 %2, %6
	br i1 %7, label %L.2, label %L.1
L.2:
	store i8 0, i8* %rv.0
	br label %return
L.1:
	%8 = load %type.TypeNode** %t
	%9 = getelementptr %type.TypeNode* %8, i32 0, i32 14
	%10 = load i8* %9
	store i8 %10, i8* %fm
	%11 = load i8* %fm
	%12 = icmp eq i8 %11, 0
	br i1 %12, label %L.4, label %L.3
L.4:
	%13 = load %target.TargetT** @target_Target
	%14 = getelementptr %target.TargetT* %13, i32 0, i32 2
	%15 = load i8* %14
	store i8 %15, i8* %fm
	br label %L.3
L.3:
	%16 = load i8* %to
	%17 = icmp eq i8 %16, 0
	br i1 %17, label %L.6, label %L.5
L.6:
	%18 = load %target.TargetT** @target_Target
	%19 = getelementptr %target.TargetT* %18, i32 0, i32 2
	%20 = load i8* %19
	store i8 %20, i8* %to
	br label %L.5
L.5:
	%21 = load i8* %fm
	%22 = load i8* %to
	%23 = icmp ne i8 %21, %22
	%24 = zext i1 %23 to i8
	store i8 %24, i8* %rv.0
	br label %return
return:
	%25 = load i8* %rv.0
	ret i8 %25
}
define %type.TypeNode* @type_New(i8 zeroext %kind.arg) nounwind {
L.0:
	%rv.0 = alloca %type.TypeNode*
	%kind = alloca i8
	store i8 %kind.arg, i8* %kind
	%t = alloca %type.TypeNode*
	%0 = call [0 x i8]* @sys_zalloc(i32 64)
	%1 = bitcast [0 x i8]* %0 to %type.TypeNode*
	store %type.TypeNode* %1, %type.TypeNode** %t
	%2 = load i8* %kind
	%3 = load %type.TypeNode** %t
	%4 = getelementptr %type.TypeNode* %3, i32 0, i32 11
	store i8 %2, i8* %4
	%5 = load %type.TypeNode** %t
	store %type.TypeNode* %5, %type.TypeNode** %rv.0
	br label %return
return:
	%6 = load %type.TypeNode** %rv.0
	ret %type.TypeNode* %6
}
define %type.TypeNode* @type_Clone(%type.TypeNode* %ot.arg) nounwind {
L.0:
	%rv.0 = alloca %type.TypeNode*
	%ot = alloca %type.TypeNode*
	store %type.TypeNode* %ot.arg, %type.TypeNode** %ot
	%nt = alloca %type.TypeNode*
	%0 = load %type.TypeNode** %ot
	%1 = getelementptr %type.TypeNode* %0, i32 0, i32 11
	%2 = load i8* %1
	%3 = call %type.TypeNode* @type_New(i8 %2)
	store %type.TypeNode* %3, %type.TypeNode** %nt
	%4 = load %type.TypeNode** %ot
	%5 = load %type.TypeNode* %4
	%6 = load %type.TypeNode** %nt
	store %type.TypeNode %5, %type.TypeNode* %6
	%7 = load %type.TypeNode** %nt
	%8 = getelementptr %type.TypeNode* %7, i32 0, i32 2
	store %symb.SymbNode* null, %symb.SymbNode** %8
	%9 = load %type.TypeNode** %nt
	%10 = getelementptr %type.TypeNode* %9, i32 0, i32 21
	store i8 0, i8* %10
	br label %return
return:
	%11 = load %type.TypeNode** %rv.0
	ret %type.TypeNode* %11
}
define %type.TypeNode* @type_ChangeOrder(%type.TypeNode* %told.arg, i8 zeroext %neworder.arg) nounwind {
L.0:
	%rv.0 = alloca %type.TypeNode*
	%told = alloca %type.TypeNode*
	%neworder = alloca i8
	store %type.TypeNode* %told.arg, %type.TypeNode** %told
	store i8 %neworder.arg, i8* %neworder
	%t = alloca %type.TypeNode*
	%0 = load %type.TypeNode** %told
	%1 = call %type.TypeNode* @type_Clone(%type.TypeNode* %0)
	store %type.TypeNode* %1, %type.TypeNode** %t
	%2 = load i8* %neworder
	%3 = load %type.TypeNode** %t
	%4 = getelementptr %type.TypeNode* %3, i32 0, i32 14
	store i8 %2, i8* %4
	%5 = load %type.TypeNode** %t
	%6 = getelementptr %type.TypeNode* %5, i32 0, i32 21
	store i8 1, i8* %6
	%7 = load %type.TypeNode** %t
	store %type.TypeNode* %7, %type.TypeNode** %rv.0
	br label %return
return:
	%8 = load %type.TypeNode** %rv.0
	ret %type.TypeNode* %8
}
@type_askip1 = internal constant [4 x i8] [ i8 33, i8 4, i8 0, i8 0 ], align 1
@type_askip2 = internal constant [5 x i8] [ i8 5, i8 33, i8 4, i8 0, i8 0 ], align 1
@type_tattrlist = internal constant [14 x i8] [ i8 62, i8 63, i8 64, i8 65, i8 66, i8 67, i8 68, i8 69, i8 70, i8 71, i8 81, i8 80, i8 75, i8 0 ]
define %type.TypeNode* @type_Attributes(%symb.SymbNode* %s.arg, %type.TypeNode* %t.arg, [0 x i8]* %sattrlist.arg) nounwind {
L.0:
	%rv.0 = alloca %type.TypeNode*
	%s = alloca %symb.SymbNode*
	%t = alloca %type.TypeNode*
	%sattrlist = alloca [0 x i8]*
	store %symb.SymbNode* %s.arg, %symb.SymbNode** %s
	store %type.TypeNode* %t.arg, %type.TypeNode** %t
	store [0 x i8]* %sattrlist.arg, [0 x i8]** %sattrlist
	%tok = alloca i8
	%atok = alloca i8
	br label %L.1
L.1:
	%0 = call i8 @lex_Next()
	store i8 %0, i8* %tok
	%1 = load i8* %tok
	%2 = icmp eq i8 %1, 40
	br i1 %2, label %L.4, label %L.5
L.4:
	%3 = getelementptr [14 x i8]* @type_tattrlist
	%4 = bitcast [14 x i8]* %3 to [0 x i8]*
	%5 = call i8 @lex_Keyword([0 x i8]* %4)
	store i8 %5, i8* %atok
	%6 = load i8* %atok
	%7 = load i8* %tok
	%8 = icmp ne i8 %6, %7
	br i1 %8, label %L.7, label %L.8
L.7:
	%9 = call i8 @lex_Next()
	store i8 %9, i8* %tok
	%10 = load %type.TypeNode** %t
	%11 = getelementptr %type.TypeNode* %10, i32 0, i32 21
	%12 = load i8* %11
	%13 = icmp ne i8 %12, 0
	br i1 %13, label %L.10, label %L.9
L.10:
	%14 = load %type.TypeNode** %t
	%15 = call %type.TypeNode* @type_Clone(%type.TypeNode* %14)
	store %type.TypeNode* %15, %type.TypeNode** %t
	br label %L.9
L.9:
	%16 = load i8* %atok
	%17 = zext i8 %16 to i32
	switch i32 %17, label %L.11 [
		i32 62, label %L.13
		i32 63, label %L.14
		i32 64, label %L.15
		i32 65, label %L.16
		i32 66, label %L.17
		i32 67, label %L.18
		i32 68, label %L.19
		i32 69, label %L.20
		i32 70, label %L.21
		i32 71, label %L.22
		i32 81, label %L.23
		i32 80, label %L.24
		i32 75, label %L.25
	]
L.13:
	%18 = load %type.TypeNode** %t
	%19 = getelementptr %type.TypeNode* %18, i32 0, i32 12
	store i8 2, i8* %19
	br label %L.12
L.14:
	%20 = load %type.TypeNode** %t
	%21 = getelementptr %type.TypeNode* %20, i32 0, i32 12
	store i8 1, i8* %21
	br label %L.12
L.15:
	%22 = load %type.TypeNode** %t
	%23 = getelementptr %type.TypeNode* %22, i32 0, i32 13
	store i8 2, i8* %23
	br label %L.12
L.16:
	%24 = load %type.TypeNode** %t
	%25 = getelementptr %type.TypeNode* %24, i32 0, i32 13
	store i8 1, i8* %25
	br label %L.12
L.17:
	%26 = load %type.TypeNode** %t
	%27 = getelementptr %type.TypeNode* %26, i32 0, i32 14
	store i8 2, i8* %27
	br label %L.12
L.18:
	%28 = load %type.TypeNode** %t
	%29 = getelementptr %type.TypeNode* %28, i32 0, i32 14
	store i8 1, i8* %29
	br label %L.12
L.19:
	%30 = load %type.TypeNode** %t
	%31 = getelementptr %type.TypeNode* %30, i32 0, i32 15
	store i8 1, i8* %31
	br label %L.12
L.20:
	%32 = load %type.TypeNode** %t
	%33 = getelementptr %type.TypeNode* %32, i32 0, i32 15
	store i8 2, i8* %33
	br label %L.12
L.21:
	%34 = load %type.TypeNode** %t
	%35 = getelementptr %type.TypeNode* %34, i32 0, i32 17
	store i8 1, i8* %35
	br label %L.12
L.22:
	%36 = load %type.TypeNode** %t
	%37 = getelementptr %type.TypeNode* %36, i32 0, i32 18
	store i8 1, i8* %37
	br label %L.12
L.23:
	%38 = load i8* %tok
	%39 = icmp eq i8 %38, 32
	br i1 %39, label %L.27, label %L.26
L.27:
	%40 = call i8 @lex_Next()
	store i8 %40, i8* %tok
	%41 = load %type.TypeNode** @type_wordtype
	%42 = call i64 @expr_ConstScalar(%type.TypeNode* %41)
	%43 = load %target.TargetT** @target_Target
	%44 = getelementptr %target.TargetT* %43, i32 0, i32 3
	%45 = load i8* %44
	%46 = zext i8 %45 to i64
	%47 = mul i64 %42, %46
	%48 = trunc i64 %47 to i32
	%49 = load %type.TypeNode** %t
	%50 = getelementptr %type.TypeNode* %49, i32 0, i32 8
	store i32 %48, i32* %50
	%51 = call i8 @lex_Expect(i8 33)
	br label %L.26
L.26:
	br label %L.12
L.24:
	%52 = load i8* %tok
	%53 = icmp eq i8 %52, 32
	br i1 %53, label %L.29, label %L.28
L.29:
	%54 = call i8 @lex_Next()
	store i8 %54, i8* %tok
	%55 = load %type.TypeNode** @type_wordtype
	%56 = call i64 @expr_ConstScalar(%type.TypeNode* %55)
	%57 = trunc i64 %56 to i32
	%58 = load %type.TypeNode** %t
	%59 = getelementptr %type.TypeNode* %58, i32 0, i32 7
	store i32 %57, i32* %59
	%60 = call i8 @lex_Expect(i8 33)
	br label %L.28
L.28:
	br label %L.12
L.25:
	%61 = load i8* %tok
	%62 = icmp eq i8 %61, 32
	br i1 %62, label %L.31, label %L.30
L.31:
	%63 = call i8 @lex_Next()
	store i8 %63, i8* %tok
	%64 = load %type.TypeNode** @type_wordtype
	%65 = call i64 @expr_ConstScalar(%type.TypeNode* %64)
	%66 = load %target.TargetT** @target_Target
	%67 = getelementptr %target.TargetT* %66, i32 0, i32 3
	%68 = load i8* %67
	%69 = zext i8 %68 to i64
	%70 = mul i64 %65, %69
	%71 = trunc i64 %70 to i32
	%72 = load %type.TypeNode** %t
	%73 = getelementptr %type.TypeNode* %72, i32 0, i32 9
	store i32 %71, i32* %73
	%74 = call i8 @lex_Expect(i8 33)
	br label %L.30
L.30:
	br label %L.12
L.11:
	br label %L.12
L.12:
	br label %L.6
L.8:
	%75 = load %symb.SymbNode** %s
	%76 = icmp ne %symb.SymbNode* %75, null
	br i1 %76, label %L.33, label %L.34
L.33:
	%77 = load [0 x i8]** %sattrlist
	%78 = bitcast [0 x i8]* %77 to [0 x i8]*
	%79 = call i8 @lex_Keyword([0 x i8]* %78)
	store i8 %79, i8* %atok
	%80 = load i8* %atok
	%81 = load i8* %tok
	%82 = icmp ne i8 %80, %81
	br i1 %82, label %L.36, label %L.37
L.36:
	%83 = call i8 @lex_Next()
	store i8 %83, i8* %tok
	%84 = load i8* %atok
	%85 = zext i8 %84 to i32
	switch i32 %85, label %L.38 [
		i32 76, label %L.40
		i32 73, label %L.41
		i32 72, label %L.42
		i32 74, label %L.43
	]
L.40:
	%86 = load %symb.SymbNode** %s
	%87 = getelementptr %symb.SymbNode* %86, i32 0, i32 13
	store i8 5, i8* %87
	br label %L.39
L.41:
	%88 = load %symb.SymbNode** %s
	%89 = getelementptr %symb.SymbNode* %88, i32 0, i32 13
	store i8 2, i8* %89
	br label %L.39
L.42:
	%90 = load i8* %tok
	%91 = icmp eq i8 %90, 32
	br i1 %91, label %L.45, label %L.46
L.45:
	%92 = call i8 @lex_Next()
	store i8 %92, i8* %tok
	%93 = load %type.TypeNode** @type_wordtype
	%94 = call i64 @expr_ConstScalar(%type.TypeNode* %93)
	%95 = load %symb.SymbNode** %s
	%96 = getelementptr %symb.SymbNode* %95, i32 0, i32 8
	store i64 %94, i64* %96
	%97 = call i8 @lex_Expect(i8 33)
	%98 = load %symb.SymbNode** %s
	%99 = getelementptr %symb.SymbNode* %98, i32 0, i32 13
	store i8 4, i8* %99
	br label %L.44
L.46:
	%100 = load %symb.SymbNode** %s
	%101 = getelementptr %symb.SymbNode* %100, i32 0, i32 13
	store i8 3, i8* %101
	br label %L.44
L.44:
	br label %L.39
L.43:
	%102 = getelementptr [64 x i8]* @lex_Ident
	%103 = bitcast [64 x i8]* %102 to [0 x i8]*
	call void @lex_ErrorI(i8 25, [0 x i8]* %103)
	%104 = load i8* %tok
	%105 = icmp eq i8 %104, 32
	br i1 %105, label %L.48, label %L.47
L.48:
	%106 = call i8 @lex_Next()
	store i8 %106, i8* %tok
	%107 = getelementptr [4 x i8]* @type_askip1
	%108 = bitcast [4 x i8]* %107 to [0 x i8]*
	%109 = call i8 @lex_Skip([0 x i8]* %108)
	store i8 %109, i8* %tok
	br label %L.47
L.47:
	br label %L.39
L.38:
	br label %L.39
L.39:
	br label %L.35
L.37:
	%110 = getelementptr [64 x i8]* @lex_Ident
	%111 = bitcast [64 x i8]* %110 to [0 x i8]*
	call void @lex_ErrorI(i8 25, [0 x i8]* %111)
	br label %L.35
L.35:
	br label %L.32
L.34:
	%112 = getelementptr [64 x i8]* @lex_Ident
	%113 = bitcast [64 x i8]* %112 to [0 x i8]*
	call void @lex_ErrorI(i8 25, [0 x i8]* %113)
	%114 = call i8 @lex_Next()
	store i8 %114, i8* %tok
	br label %L.32
L.32:
	br label %L.6
L.6:
	br label %L.3
L.5:
	call void @lex_Error(i8 11)
	%115 = getelementptr [5 x i8]* @type_askip2
	%116 = bitcast [5 x i8]* %115 to [0 x i8]*
	%117 = call i8 @lex_Skip([0 x i8]* %116)
	store i8 %117, i8* %tok
	br label %L.3
L.3:
	%118 = load i8* @lex_Token
	store i8 %118, i8* %tok
	%119 = load i8* %tok
	%120 = icmp ne i8 %119, 5
	br i1 %120, label %L.2, label %L.49
L.49:
	br label %L.1
L.2:
	%121 = load %type.TypeNode** %t
	store %type.TypeNode* %121, %type.TypeNode** %rv.0
	br label %return
return:
	%122 = load %type.TypeNode** %rv.0
	ret %type.TypeNode* %122
}
@type_nattrlist = internal constant [1 x i8] [ i8 0 ]
define %type.TypeNode* @type_TypeAttributes(%type.TypeNode* %t.arg) nounwind {
L.0:
	%rv.0 = alloca %type.TypeNode*
	%t = alloca %type.TypeNode*
	store %type.TypeNode* %t.arg, %type.TypeNode** %t
	%0 = load %type.TypeNode** %t
	%1 = getelementptr [1 x i8]* @type_nattrlist
	%2 = bitcast [1 x i8]* %1 to [0 x i8]*
	%3 = call %type.TypeNode* @type_Attributes(%symb.SymbNode* null, %type.TypeNode* %0, [0 x i8]* %2)
	store %type.TypeNode* %3, %type.TypeNode** %rv.0
	br label %return
return:
	%4 = load %type.TypeNode** %rv.0
	ret %type.TypeNode* %4
}
@type_vattrlist = internal constant [4 x i8] [ i8 72, i8 73, i8 0, i8 0 ], align 1
define %type.TypeNode* @type_VarAttributes(%symb.SymbNode* %s.arg, %type.TypeNode* %t.arg) nounwind {
L.0:
	%rv.0 = alloca %type.TypeNode*
	%s = alloca %symb.SymbNode*
	%t = alloca %type.TypeNode*
	store %symb.SymbNode* %s.arg, %symb.SymbNode** %s
	store %type.TypeNode* %t.arg, %type.TypeNode** %t
	%0 = load %symb.SymbNode** %s
	%1 = load %type.TypeNode** %t
	%2 = getelementptr [4 x i8]* @type_vattrlist
	%3 = bitcast [4 x i8]* %2 to [0 x i8]*
	%4 = call %type.TypeNode* @type_Attributes(%symb.SymbNode* %0, %type.TypeNode* %1, [0 x i8]* %3)
	store %type.TypeNode* %4, %type.TypeNode** %rv.0
	br label %return
return:
	%5 = load %type.TypeNode** %rv.0
	ret %type.TypeNode* %5
}
@type_pattrlist = internal constant [3 x i8] [ i8 72, i8 76, i8 0 ], align 1
define void @type_ProcAttributes(%symb.SymbNode* %s.arg) nounwind {
L.0:
	%s = alloca %symb.SymbNode*
	store %symb.SymbNode* %s.arg, %symb.SymbNode** %s
	%t = alloca %type.TypeNode*
	%0 = load %symb.SymbNode** %s
	%1 = load %symb.SymbNode** %s
	%2 = getelementptr %symb.SymbNode* %1, i32 0, i32 1
	%3 = load %type.TypeNode** %2
	%4 = getelementptr [3 x i8]* @type_pattrlist
	%5 = bitcast [3 x i8]* %4 to [0 x i8]*
	%6 = call %type.TypeNode* @type_Attributes(%symb.SymbNode* %0, %type.TypeNode* %3, [0 x i8]* %5)
	store %type.TypeNode* %6, %type.TypeNode** %t
	%7 = load %type.TypeNode** %t
	%8 = load %symb.SymbNode** %s
	%9 = getelementptr %symb.SymbNode* %8, i32 0, i32 1
	store %type.TypeNode* %7, %type.TypeNode** %9
	br label %return
return:
	ret void
}
define zeroext i8 @type_bitsize(i64 %x.arg) nounwind {
L.0:
	%rv.0 = alloca i8
	%x = alloca i64
	store i64 %x.arg, i64* %x
	%t = alloca i64
	%n = alloca i8
	store i8 1, i8* %n
	store i64 1, i64* %t
	br label %L.1
L.1:
	%0 = load i64* %t
	%1 = load i64* %x
	%2 = icmp ult i64 %0, %1
	%3 = xor i1 %2, true
	br i1 %3, label %L.2, label %L.3
L.3:
	%4 = load i64* %t
	%5 = shl i64 %4, 1
	store i64 %5, i64* %t
	%6 = load i64* %t
	%7 = add i64 %6, 1
	store i64 %7, i64* %t
	%8 = load i8* %n
	%9 = add i8 %8, 1
	store i8 %9, i8* %n
	br label %L.1
L.2:
	%10 = load i8* %n
	store i8 %10, i8* %rv.0
	br label %return
return:
	%11 = load i8* %rv.0
	ret i8 %11
}
define zeroext i16 @type_FieldPad(%symb.SymbNode* %prev.arg, i32 %pad.arg, i16 zeroext %index.arg) nounwind {
L.0:
	%rv.0 = alloca i16
	%prev = alloca %symb.SymbNode*
	%pad = alloca i32
	%index = alloca i16
	store %symb.SymbNode* %prev.arg, %symb.SymbNode** %prev
	store i32 %pad.arg, i32* %pad
	store i16 %index.arg, i16* %index
	%last = alloca %symb.SymbNode*
	%s = alloca %symb.SymbNode*
	%0 = load %symb.SymbNode** %prev
	%1 = getelementptr %symb.SymbNode* %0, i32 0, i32 0
	%2 = load %symb.SymbNode** %1
	store %symb.SymbNode* %2, %symb.SymbNode** %last
	br label %L.1
L.1:
	%3 = load i32* %pad
	%4 = icmp ugt i32 %3, 0
	%5 = xor i1 %4, true
	br i1 %5, label %L.2, label %L.3
L.3:
	%6 = getelementptr [2 x i8]* @.str470
	%7 = bitcast [2 x i8]* %6 to [0 x i8]*
	%8 = call %symb.SymbNode* @symb_New(i8 4, [0 x i8]* %7, i8 1)
	store %symb.SymbNode* %8, %symb.SymbNode** %s
	%9 = load %type.TypeNode** @type_bytetype
	%10 = load %symb.SymbNode** %s
	%11 = getelementptr %symb.SymbNode* %10, i32 0, i32 1
	store %type.TypeNode* %9, %type.TypeNode** %11
	%12 = load i16* %index
	%13 = load %symb.SymbNode** %s
	%14 = getelementptr %symb.SymbNode* %13, i32 0, i32 9
	store i16 %12, i16* %14
	%15 = load %symb.SymbNode** %s
	%16 = load %symb.SymbNode** %prev
	%17 = getelementptr %symb.SymbNode* %16, i32 0, i32 0
	store %symb.SymbNode* %15, %symb.SymbNode** %17
	%18 = load %symb.SymbNode** %s
	store %symb.SymbNode* %18, %symb.SymbNode** %prev
	%19 = load i16* %index
	%20 = add i16 %19, 1
	store i16 %20, i16* %index
	%21 = load i32* %pad
	%22 = sub i32 %21, 1
	store i32 %22, i32* %pad
	br label %L.1
L.2:
	%23 = load %symb.SymbNode** %last
	%24 = load %symb.SymbNode** %prev
	%25 = getelementptr %symb.SymbNode* %24, i32 0, i32 0
	store %symb.SymbNode* %23, %symb.SymbNode** %25
	%26 = load i16* %index
	store i16 %26, i16* %rv.0
	br label %return
return:
	%27 = load i16* %rv.0
	ret i16 %27
}
define void @type_Final(%type.TypeNode* %t.arg) nounwind {
L.0:
	%t = alloca %type.TypeNode*
	store %type.TypeNode* %t.arg, %type.TypeNode** %t
	%align = alloca i32
	%tlo = alloca i32
	%thi = alloca i32
	%f = alloca %symb.SymbNode*
	%prev = alloca %symb.SymbNode*
	%index = alloca i16
	%offs = alloca i32
	%mod = alloca i32
	%0 = load %type.TypeNode** %t
	%1 = icmp ne %type.TypeNode* %0, null
	br i1 %1, label %L.1, label %L.2
L.1:
	%2 = load %type.TypeNode** %t
	%3 = getelementptr %type.TypeNode* %2, i32 0, i32 21
	%4 = load i8* %3
	%5 = icmp ne i8 %4, 0
	%6 = xor i1 %5, true
	br label %L.2
L.2:
	%7 = phi i1 [ false, %L.0 ], [ %6, %L.1 ]
	br i1 %7, label %L.4, label %L.3
L.4:
	%8 = load %type.TypeNode** %t
	%9 = getelementptr %type.TypeNode* %8, i32 0, i32 13
	%10 = load i8* %9
	%11 = icmp eq i8 %10, 0
	br i1 %11, label %L.6, label %L.5
L.6:
	%12 = load %target.TargetT** @target_Target
	%13 = getelementptr %target.TargetT* %12, i32 0, i32 2
	%14 = load i8* %13
	%15 = load %type.TypeNode** %t
	%16 = getelementptr %type.TypeNode* %15, i32 0, i32 13
	store i8 %14, i8* %16
	br label %L.5
L.5:
	%17 = load %type.TypeNode** %t
	%18 = getelementptr %type.TypeNode* %17, i32 0, i32 14
	%19 = load i8* %18
	%20 = icmp eq i8 %19, 0
	br i1 %20, label %L.8, label %L.7
L.8:
	%21 = load %target.TargetT** @target_Target
	%22 = getelementptr %target.TargetT* %21, i32 0, i32 2
	%23 = load i8* %22
	%24 = load %type.TypeNode** %t
	%25 = getelementptr %type.TypeNode* %24, i32 0, i32 14
	store i8 %23, i8* %25
	br label %L.7
L.7:
	%26 = load %type.TypeNode** %t
	%27 = getelementptr %type.TypeNode* %26, i32 0, i32 11
	%28 = load i8* %27
	%29 = zext i8 %28 to i32
	switch i32 %29, label %L.9 [
		i32 1, label %L.11
		i32 2, label %L.11
		i32 3, label %L.12
		i32 4, label %L.13
		i32 7, label %L.13
		i32 6, label %L.14
		i32 5, label %L.15
	]
L.11:
	%30 = load %type.TypeNode** %t
	%31 = getelementptr %type.TypeNode* %30, i32 0, i32 7
	%32 = load i32* %31
	%33 = icmp eq i32 %32, 0
	br i1 %33, label %L.17, label %L.16
L.17:
	%34 = load %type.TypeNode** %t
	%35 = getelementptr %type.TypeNode* %34, i32 0, i32 6
	%36 = load i64* %35
	%37 = call i8 @type_bitsize(i64 %36)
	%38 = zext i8 %37 to i32
	%39 = load %type.TypeNode** %t
	%40 = getelementptr %type.TypeNode* %39, i32 0, i32 7
	store i32 %38, i32* %40
	br label %L.16
L.16:
	%41 = load %type.TypeNode** %t
	%42 = getelementptr %type.TypeNode* %41, i32 0, i32 8
	%43 = load i32* %42
	%44 = icmp eq i32 %43, 0
	br i1 %44, label %L.19, label %L.18
L.19:
	%45 = load %type.TypeNode** %t
	%46 = getelementptr %type.TypeNode* %45, i32 0, i32 7
	%47 = load i32* %46
	%48 = call i32 @target_isize(i32 %47)
	%49 = load %type.TypeNode** %t
	%50 = getelementptr %type.TypeNode* %49, i32 0, i32 8
	store i32 %48, i32* %50
	br label %L.18
L.18:
	%51 = load %type.TypeNode** %t
	%52 = getelementptr %type.TypeNode* %51, i32 0, i32 9
	%53 = load i32* %52
	%54 = icmp eq i32 %53, 0
	br i1 %54, label %L.21, label %L.20
L.21:
	%55 = load %type.TypeNode** %t
	%56 = getelementptr %type.TypeNode* %55, i32 0, i32 7
	%57 = load i32* %56
	%58 = call i32 @target_ialign(i32 %57)
	%59 = load %type.TypeNode** %t
	%60 = getelementptr %type.TypeNode* %59, i32 0, i32 9
	store i32 %58, i32* %60
	br label %L.20
L.20:
	br label %L.10
L.12:
	%61 = load %type.TypeNode** %t
	%62 = getelementptr %type.TypeNode* %61, i32 0, i32 7
	%63 = load i32* %62
	%64 = icmp eq i32 %63, 0
	br i1 %64, label %L.23, label %L.22
L.23:
	%65 = load %type.TypeNode** %t
	%66 = getelementptr %type.TypeNode* %65, i32 0, i32 5
	%67 = load i64* %66
	%68 = xor i64 %67, -1
	%69 = call i8 @type_bitsize(i64 %68)
	%70 = zext i8 %69 to i32
	store i32 %70, i32* %tlo
	%71 = load %type.TypeNode** %t
	%72 = getelementptr %type.TypeNode* %71, i32 0, i32 6
	%73 = load i64* %72
	%74 = call i8 @type_bitsize(i64 %73)
	%75 = zext i8 %74 to i32
	store i32 %75, i32* %thi
	%76 = load i32* %tlo
	%77 = load i32* %thi
	%78 = icmp ugt i32 %76, %77
	br i1 %78, label %L.25, label %L.26
L.25:
	%79 = load i32* %tlo
	%80 = add i32 %79, 1
	%81 = load %type.TypeNode** %t
	%82 = getelementptr %type.TypeNode* %81, i32 0, i32 7
	store i32 %80, i32* %82
	br label %L.24
L.26:
	%83 = load i32* %thi
	%84 = add i32 %83, 1
	%85 = load %type.TypeNode** %t
	%86 = getelementptr %type.TypeNode* %85, i32 0, i32 7
	store i32 %84, i32* %86
	br label %L.24
L.24:
	br label %L.22
L.22:
	%87 = load %type.TypeNode** %t
	%88 = getelementptr %type.TypeNode* %87, i32 0, i32 8
	%89 = load i32* %88
	%90 = icmp eq i32 %89, 0
	br i1 %90, label %L.28, label %L.27
L.28:
	%91 = load %type.TypeNode** %t
	%92 = getelementptr %type.TypeNode* %91, i32 0, i32 7
	%93 = load i32* %92
	%94 = call i32 @target_isize(i32 %93)
	%95 = load %type.TypeNode** %t
	%96 = getelementptr %type.TypeNode* %95, i32 0, i32 8
	store i32 %94, i32* %96
	br label %L.27
L.27:
	%97 = load %type.TypeNode** %t
	%98 = getelementptr %type.TypeNode* %97, i32 0, i32 9
	%99 = load i32* %98
	%100 = icmp eq i32 %99, 0
	br i1 %100, label %L.30, label %L.29
L.30:
	%101 = load %type.TypeNode** %t
	%102 = getelementptr %type.TypeNode* %101, i32 0, i32 7
	%103 = load i32* %102
	%104 = call i32 @target_ialign(i32 %103)
	%105 = load %type.TypeNode** %t
	%106 = getelementptr %type.TypeNode* %105, i32 0, i32 9
	store i32 %104, i32* %106
	br label %L.29
L.29:
	br label %L.10
L.13:
	%107 = load %target.TargetT** @target_Target
	%108 = getelementptr %target.TargetT* %107, i32 0, i32 8
	%109 = getelementptr %target.SizeAlign* %108, i32 0, i32 0
	%110 = load i8* %109
	%111 = zext i8 %110 to i32
	%112 = load %type.TypeNode** %t
	%113 = getelementptr %type.TypeNode* %112, i32 0, i32 7
	store i32 %111, i32* %113
	%114 = load %target.TargetT** @target_Target
	%115 = getelementptr %target.TargetT* %114, i32 0, i32 8
	%116 = getelementptr %target.SizeAlign* %115, i32 0, i32 0
	%117 = load i8* %116
	%118 = zext i8 %117 to i32
	%119 = load %type.TypeNode** %t
	%120 = getelementptr %type.TypeNode* %119, i32 0, i32 8
	store i32 %118, i32* %120
	%121 = load %target.TargetT** @target_Target
	%122 = getelementptr %target.TargetT* %121, i32 0, i32 8
	%123 = getelementptr %target.SizeAlign* %122, i32 0, i32 1
	%124 = load i8* %123
	%125 = zext i8 %124 to i32
	%126 = load %type.TypeNode** %t
	%127 = getelementptr %type.TypeNode* %126, i32 0, i32 9
	store i32 %125, i32* %127
	br label %L.10
L.14:
	store i16 0, i16* %index
	store i32 0, i32* %offs
	store i32 0, i32* %align
	store %symb.SymbNode* null, %symb.SymbNode** %prev
	%128 = load %type.TypeNode** %t
	%129 = getelementptr %type.TypeNode* %128, i32 0, i32 3
	%130 = load %symb.SymbNode** %129
	store %symb.SymbNode* %130, %symb.SymbNode** %f
	br label %L.31
L.31:
	%131 = load %symb.SymbNode** %f
	%132 = icmp ne %symb.SymbNode* %131, null
	%133 = xor i1 %132, true
	br i1 %133, label %L.32, label %L.33
L.33:
	%134 = load %symb.SymbNode** %f
	%135 = getelementptr %symb.SymbNode* %134, i32 0, i32 1
	%136 = load %type.TypeNode** %135
	%137 = icmp ne %type.TypeNode* %136, null
	br i1 %137, label %L.35, label %L.34
L.35:
	%138 = load %symb.SymbNode** %f
	%139 = getelementptr %symb.SymbNode* %138, i32 0, i32 1
	%140 = load %type.TypeNode** %139
	call void @type_Final(%type.TypeNode* %140)
	%141 = load %type.TypeNode** %t
	%142 = getelementptr %type.TypeNode* %141, i32 0, i32 12
	%143 = load i8* %142
	%144 = icmp eq i8 %143, 2
	br i1 %144, label %L.37, label %L.38
L.37:
	%145 = load i32* %offs
	%146 = load %symb.SymbNode** %f
	%147 = getelementptr %symb.SymbNode* %146, i32 0, i32 1
	%148 = load %type.TypeNode** %147
	%149 = getelementptr %type.TypeNode* %148, i32 0, i32 7
	%150 = load i32* %149
	%151 = add i32 %145, %150
	store i32 %151, i32* %offs
	br label %L.36
L.38:
	%falign = alloca i32
	%152 = load %symb.SymbNode** %f
	%153 = getelementptr %symb.SymbNode* %152, i32 0, i32 1
	%154 = load %type.TypeNode** %153
	%155 = getelementptr %type.TypeNode* %154, i32 0, i32 9
	%156 = load i32* %155
	store i32 %156, i32* %falign
	%157 = load i32* %offs
	%158 = load i32* %falign
	%159 = urem i32 %157, %158
	store i32 %159, i32* %mod
	%160 = load i32* %mod
	%161 = icmp ne i32 %160, 0
	br i1 %161, label %L.40, label %L.39
L.40:
	%162 = load %symb.SymbNode** %prev
	%163 = load i32* %falign
	%164 = load i32* %mod
	%165 = sub i32 %163, %164
	%166 = load %target.TargetT** @target_Target
	%167 = getelementptr %target.TargetT* %166, i32 0, i32 3
	%168 = load i8* %167
	%169 = zext i8 %168 to i32
	%170 = udiv i32 %165, %169
	%171 = load i16* %index
	%172 = call i16 @type_FieldPad(%symb.SymbNode* %162, i32 %170, i16 %171)
	store i16 %172, i16* %index
	%173 = load i32* %offs
	%174 = load i32* %falign
	%175 = load i32* %mod
	%176 = sub i32 %174, %175
	%177 = add i32 %173, %176
	store i32 %177, i32* %offs
	br label %L.39
L.39:
	%178 = load i32* %offs
	%179 = load %symb.SymbNode** %f
	%180 = getelementptr %symb.SymbNode* %179, i32 0, i32 1
	%181 = load %type.TypeNode** %180
	%182 = getelementptr %type.TypeNode* %181, i32 0, i32 8
	%183 = load i32* %182
	%184 = add i32 %178, %183
	store i32 %184, i32* %offs
	%185 = load i32* %falign
	%186 = load i32* %align
	%187 = icmp ugt i32 %185, %186
	br i1 %187, label %L.42, label %L.41
L.42:
	%188 = load i32* %falign
	store i32 %188, i32* %align
	br label %L.41
L.41:
	br label %L.36
L.36:
	br label %L.34
L.34:
	%189 = load i16* %index
	%190 = load %symb.SymbNode** %f
	%191 = getelementptr %symb.SymbNode* %190, i32 0, i32 9
	store i16 %189, i16* %191
	%192 = load i16* %index
	%193 = add i16 %192, 1
	store i16 %193, i16* %index
	%194 = load %symb.SymbNode** %f
	store %symb.SymbNode* %194, %symb.SymbNode** %prev
	%195 = load %symb.SymbNode** %f
	%196 = getelementptr %symb.SymbNode* %195, i32 0, i32 0
	%197 = load %symb.SymbNode** %196
	store %symb.SymbNode* %197, %symb.SymbNode** %f
	br label %L.31
L.32:
	%198 = load i32* %offs
	%199 = load %type.TypeNode** %t
	%200 = getelementptr %type.TypeNode* %199, i32 0, i32 7
	store i32 %198, i32* %200
	%201 = load i32* %offs
	%202 = load %target.TargetT** @target_Target
	%203 = getelementptr %target.TargetT* %202, i32 0, i32 4
	%204 = load i8* %203
	%205 = zext i8 %204 to i32
	%206 = icmp ule i32 %201, %205
	br i1 %206, label %L.44, label %L.45
L.44:
	%207 = load i32* %offs
	%208 = call i32 @target_isize(i32 %207)
	%209 = load %type.TypeNode** %t
	%210 = getelementptr %type.TypeNode* %209, i32 0, i32 8
	store i32 %208, i32* %210
	br label %L.43
L.45:
	%211 = load i32* %offs
	%212 = load %type.TypeNode** %t
	%213 = getelementptr %type.TypeNode* %212, i32 0, i32 8
	store i32 %211, i32* %213
	br label %L.43
L.43:
	%214 = load i32* %align
	%215 = icmp ugt i32 %214, 0
	br i1 %215, label %L.47, label %L.48
L.47:
	%216 = load %type.TypeNode** %t
	%217 = getelementptr %type.TypeNode* %216, i32 0, i32 8
	%218 = load i32* %217
	%219 = load i32* %align
	%220 = urem i32 %218, %219
	store i32 %220, i32* %mod
	%221 = load i32* %mod
	%222 = icmp ne i32 %221, 0
	br i1 %222, label %L.50, label %L.49
L.50:
	%223 = load %type.TypeNode** %t
	%224 = getelementptr %type.TypeNode* %223, i32 0, i32 8
	%225 = load i32* %224
	%226 = load i32* %align
	%227 = load i32* %mod
	%228 = sub i32 %226, %227
	%229 = add i32 %225, %228
	store i32 %229, i32* %224
	br label %L.49
L.49:
	br label %L.46
L.48:
	%230 = load %type.TypeNode** %t
	%231 = getelementptr %type.TypeNode* %230, i32 0, i32 7
	%232 = load i32* %231
	%233 = call i32 @target_ialign(i32 %232)
	store i32 %233, i32* %align
	br label %L.46
L.46:
	%234 = load %type.TypeNode** %t
	%235 = getelementptr %type.TypeNode* %234, i32 0, i32 9
	%236 = load i32* %235
	%237 = icmp eq i32 %236, 0
	br i1 %237, label %L.52, label %L.51
L.52:
	%238 = load i32* %align
	%239 = load %type.TypeNode** %t
	%240 = getelementptr %type.TypeNode* %239, i32 0, i32 9
	store i32 %238, i32* %240
	br label %L.51
L.51:
	br label %L.10
L.15:
	%241 = load %type.TypeNode** %t
	%242 = getelementptr %type.TypeNode* %241, i32 0, i32 0
	%243 = load %type.TypeNode** %242
	%244 = icmp ne %type.TypeNode* %243, null
	br i1 %244, label %L.54, label %L.53
L.54:
	%245 = load %type.TypeNode** %t
	%246 = getelementptr %type.TypeNode* %245, i32 0, i32 0
	%247 = load %type.TypeNode** %246
	call void @type_Final(%type.TypeNode* %247)
	%248 = load %type.TypeNode** %t
	%249 = getelementptr %type.TypeNode* %248, i32 0, i32 7
	%250 = load i32* %249
	%251 = icmp eq i32 %250, 0
	br i1 %251, label %L.56, label %L.55
L.56:
	%252 = load %type.TypeNode** %t
	%253 = getelementptr %type.TypeNode* %252, i32 0, i32 0
	%254 = load %type.TypeNode** %253
	%255 = getelementptr %type.TypeNode* %254, i32 0, i32 7
	%256 = load i32* %255
	%257 = zext i32 %256 to i64
	%258 = load %type.TypeNode** %t
	%259 = getelementptr %type.TypeNode* %258, i32 0, i32 6
	%260 = load i64* %259
	%261 = mul i64 %257, %260
	%262 = trunc i64 %261 to i32
	%263 = load %type.TypeNode** %t
	%264 = getelementptr %type.TypeNode* %263, i32 0, i32 7
	store i32 %262, i32* %264
	br label %L.55
L.55:
	%265 = load %type.TypeNode** %t
	%266 = getelementptr %type.TypeNode* %265, i32 0, i32 8
	%267 = load i32* %266
	%268 = icmp eq i32 %267, 0
	br i1 %268, label %L.58, label %L.57
L.58:
	%269 = load %type.TypeNode** %t
	%270 = getelementptr %type.TypeNode* %269, i32 0, i32 7
	%271 = load i32* %270
	%272 = load %type.TypeNode** %t
	%273 = getelementptr %type.TypeNode* %272, i32 0, i32 8
	store i32 %271, i32* %273
	br label %L.57
L.57:
	%274 = load %type.TypeNode** %t
	%275 = getelementptr %type.TypeNode* %274, i32 0, i32 9
	%276 = load i32* %275
	%277 = icmp eq i32 %276, 0
	br i1 %277, label %L.60, label %L.59
L.60:
	%278 = load %type.TypeNode** %t
	%279 = getelementptr %type.TypeNode* %278, i32 0, i32 12
	%280 = load i8* %279
	%281 = icmp ne i8 %280, 2
	br i1 %281, label %L.62, label %L.63
L.62:
	%282 = load %type.TypeNode** %t
	%283 = getelementptr %type.TypeNode* %282, i32 0, i32 0
	%284 = load %type.TypeNode** %283
	%285 = getelementptr %type.TypeNode* %284, i32 0, i32 9
	%286 = load i32* %285
	%287 = load %type.TypeNode** %t
	%288 = getelementptr %type.TypeNode* %287, i32 0, i32 9
	store i32 %286, i32* %288
	br label %L.61
L.63:
	%289 = load %type.TypeNode** %t
	%290 = getelementptr %type.TypeNode* %289, i32 0, i32 9
	store i32 1, i32* %290
	br label %L.61
L.61:
	br label %L.59
L.59:
	br label %L.53
L.53:
	br label %L.10
L.9:
	br label %L.10
L.10:
	%291 = load %type.TypeNode** %t
	%292 = getelementptr %type.TypeNode* %291, i32 0, i32 21
	store i8 1, i8* %292
	br label %L.3
L.3:
	br label %return
return:
	ret void
}
define %type.TypeNode* @type_Enum(%type.TypeNode* %bt.arg) nounwind {
L.0:
	%rv.0 = alloca %type.TypeNode*
	%bt = alloca %type.TypeNode*
	store %type.TypeNode* %bt.arg, %type.TypeNode** %bt
	%tok = alloca i8
	%t = alloca %type.TypeNode*
	%vn = alloca %symb.SymbNode*
	%pvn = alloca %symb.SymbNode*
	%v = alloca i32
	%vmax = alloca i32
	%0 = call i8 @lex_Next()
	store i8 %0, i8* %tok
	%1 = call %type.TypeNode* @type_New(i8 1)
	store %type.TypeNode* %1, %type.TypeNode** %t
	store i32 0, i32* %v
	store i32 0, i32* %vmax
	store %symb.SymbNode* null, %symb.SymbNode** %pvn
	%2 = load %type.TypeNode** %bt
	%3 = icmp ne %type.TypeNode* %2, null
	br i1 %3, label %L.2, label %L.1
L.2:
	%vb = alloca %symb.SymbNode*
	%4 = load %type.TypeNode** %bt
	%5 = getelementptr %type.TypeNode* %4, i32 0, i32 11
	%6 = load i8* %5
	%7 = icmp eq i8 %6, 1
	br i1 %7, label %L.4, label %L.5
L.4:
	%8 = load %type.TypeNode** %bt
	%9 = getelementptr %type.TypeNode* %8, i32 0, i32 3
	%10 = load %symb.SymbNode** %9
	store %symb.SymbNode* %10, %symb.SymbNode** %vb
	br label %L.6
L.6:
	%11 = load %symb.SymbNode** %vb
	%12 = icmp ne %symb.SymbNode* %11, null
	%13 = xor i1 %12, true
	br i1 %13, label %L.7, label %L.8
L.8:
	%14 = load %symb.SymbNode** %vb
	%15 = getelementptr %symb.SymbNode* %14, i32 0, i32 19
	%16 = getelementptr [0 x i8]* %15
	%17 = call %symb.SymbNode* @symb_New(i8 1, [0 x i8]* %16, i8 1)
	store %symb.SymbNode* %17, %symb.SymbNode** %vn
	%18 = load %symb.SymbNode** %pvn
	%19 = icmp ne %symb.SymbNode* %18, null
	br i1 %19, label %L.10, label %L.11
L.10:
	%20 = load %symb.SymbNode** %vn
	%21 = load %symb.SymbNode** %pvn
	%22 = getelementptr %symb.SymbNode* %21, i32 0, i32 0
	store %symb.SymbNode* %20, %symb.SymbNode** %22
	br label %L.9
L.11:
	%23 = load %symb.SymbNode** %vn
	%24 = load %type.TypeNode** %t
	%25 = getelementptr %type.TypeNode* %24, i32 0, i32 3
	store %symb.SymbNode* %23, %symb.SymbNode** %25
	br label %L.9
L.9:
	%26 = load %symb.SymbNode** %vn
	store %symb.SymbNode* %26, %symb.SymbNode** %pvn
	%27 = load %symb.SymbNode** %vb
	%28 = getelementptr %symb.SymbNode* %27, i32 0, i32 7
	%29 = load i64* %28
	%30 = trunc i64 %29 to i32
	store i32 %30, i32* %v
	%31 = load i32* %v
	%32 = zext i32 %31 to i64
	%33 = load %symb.SymbNode** %vn
	%34 = getelementptr %symb.SymbNode* %33, i32 0, i32 7
	store i64 %32, i64* %34
	%35 = load i32* %v
	%36 = load i32* %vmax
	%37 = icmp ugt i32 %35, %36
	br i1 %37, label %L.13, label %L.12
L.13:
	%38 = load i32* %v
	store i32 %38, i32* %vmax
	br label %L.12
L.12:
	%39 = load %symb.SymbNode** %vb
	%40 = getelementptr %symb.SymbNode* %39, i32 0, i32 0
	%41 = load %symb.SymbNode** %40
	store %symb.SymbNode* %41, %symb.SymbNode** %vb
	br label %L.6
L.7:
	%42 = load i32* %v
	%43 = add i32 %42, 1
	store i32 %43, i32* %v
	br label %L.3
L.5:
	call void @lex_Error(i8 54)
	br label %L.3
L.3:
	br label %L.1
L.1:
	br label %L.14
L.14:
	%44 = load i8* %tok
	%45 = icmp eq i8 %44, 40
	br i1 %45, label %L.17, label %L.18
L.17:
	%46 = load %type.TypeNode** %t
	%47 = getelementptr %type.TypeNode* %46, i32 0, i32 3
	%48 = load %symb.SymbNode** %47
	%49 = getelementptr [64 x i8]* @lex_Ident
	%50 = bitcast [64 x i8]* %49 to [0 x i8]*
	%51 = call i8 @symb_IsUniqueLocal(%symb.SymbNode* %48, [0 x i8]* %50)
	%52 = icmp ne i8 %51, 0
	%53 = xor i1 %52, true
	br i1 %53, label %L.20, label %L.19
L.20:
	%54 = getelementptr [64 x i8]* @lex_Ident
	%55 = bitcast [64 x i8]* %54 to [0 x i8]*
	call void @lex_ErrorI(i8 13, [0 x i8]* %55)
	br label %L.19
L.19:
	%56 = getelementptr [64 x i8]* @lex_Ident
	%57 = bitcast [64 x i8]* %56 to [0 x i8]*
	%58 = call %symb.SymbNode* @symb_New(i8 1, [0 x i8]* %57, i8 1)
	store %symb.SymbNode* %58, %symb.SymbNode** %vn
	%59 = load %symb.SymbNode** %pvn
	%60 = icmp ne %symb.SymbNode* %59, null
	br i1 %60, label %L.22, label %L.23
L.22:
	%61 = load %symb.SymbNode** %vn
	%62 = load %symb.SymbNode** %pvn
	%63 = getelementptr %symb.SymbNode* %62, i32 0, i32 0
	store %symb.SymbNode* %61, %symb.SymbNode** %63
	br label %L.21
L.23:
	%64 = load %symb.SymbNode** %vn
	%65 = load %type.TypeNode** %t
	%66 = getelementptr %type.TypeNode* %65, i32 0, i32 3
	store %symb.SymbNode* %64, %symb.SymbNode** %66
	br label %L.21
L.21:
	%67 = load %symb.SymbNode** %vn
	store %symb.SymbNode* %67, %symb.SymbNode** %pvn
	%68 = call i8 @lex_Next()
	store i8 %68, i8* %tok
	%69 = load i8* %tok
	%70 = icmp eq i8 %69, 9
	br i1 %70, label %L.25, label %L.24
L.25:
	%71 = call i8 @lex_Next()
	store i8 %71, i8* %tok
	%72 = load %type.TypeNode** @type_wordtype
	%73 = call i64 @expr_ConstScalar(%type.TypeNode* %72)
	%74 = trunc i64 %73 to i32
	store i32 %74, i32* %v
	%75 = load i8* @lex_Token
	store i8 %75, i8* %tok
	br label %L.24
L.24:
	%76 = load i32* %v
	%77 = zext i32 %76 to i64
	%78 = load %symb.SymbNode** %vn
	%79 = getelementptr %symb.SymbNode* %78, i32 0, i32 7
	store i64 %77, i64* %79
	br label %L.16
L.18:
	call void @lex_Error(i8 11)
	br label %L.16
L.16:
	%80 = load i32* %v
	%81 = load i32* %vmax
	%82 = icmp ugt i32 %80, %81
	br i1 %82, label %L.27, label %L.26
L.27:
	%83 = load i32* %v
	store i32 %83, i32* %vmax
	br label %L.26
L.26:
	%84 = load i8* %tok
	%85 = icmp ne i8 %84, 5
	br i1 %85, label %L.15, label %L.28
L.28:
	%86 = call i8 @lex_Next()
	store i8 %86, i8* %tok
	%87 = load i32* %v
	%88 = add i32 %87, 1
	store i32 %88, i32* %v
	br label %L.14
L.15:
	%89 = load %type.TypeNode** %t
	%90 = getelementptr %type.TypeNode* %89, i32 0, i32 5
	store i64 0, i64* %90
	%91 = load i32* %vmax
	%92 = zext i32 %91 to i64
	%93 = load %type.TypeNode** %t
	%94 = getelementptr %type.TypeNode* %93, i32 0, i32 6
	store i64 %92, i64* %94
	%95 = call i8 @lex_Expect(i8 33)
	%96 = load %type.TypeNode** %t
	store %type.TypeNode* %96, %type.TypeNode** %rv.0
	br label %return
return:
	%97 = load %type.TypeNode** %rv.0
	ret %type.TypeNode* %97
}
define %type.TypeNode* @type_Record(%type.TypeNode* %bt.arg) nounwind {
L.0:
	%rv.0 = alloca %type.TypeNode*
	%bt = alloca %type.TypeNode*
	store %type.TypeNode* %bt.arg, %type.TypeNode** %bt
	%tok = alloca i8
	%t = alloca %type.TypeNode*
	%ft = alloca %type.TypeNode*
	%s = alloca %symb.SymbNode*
	%ps = alloca %symb.SymbNode*
	%bs = alloca %symb.SymbNode*
	%0 = call i8 @lex_Next()
	store i8 %0, i8* %tok
	%1 = call %type.TypeNode* @type_New(i8 6)
	store %type.TypeNode* %1, %type.TypeNode** %t
	store %symb.SymbNode* null, %symb.SymbNode** %ps
	%2 = load %type.TypeNode** %bt
	%3 = load %type.TypeNode** %t
	%4 = getelementptr %type.TypeNode* %3, i32 0, i32 0
	store %type.TypeNode* %2, %type.TypeNode** %4
	%5 = load %type.TypeNode** %bt
	%6 = icmp ne %type.TypeNode* %5, null
	br i1 %6, label %L.2, label %L.1
L.2:
	%7 = load %type.TypeNode** %bt
	%8 = getelementptr %type.TypeNode* %7, i32 0, i32 11
	%9 = load i8* %8
	%10 = icmp eq i8 %9, 6
	br i1 %10, label %L.4, label %L.5
L.4:
	%11 = load %type.TypeNode** %bt
	%12 = getelementptr %type.TypeNode* %11, i32 0, i32 3
	%13 = load %symb.SymbNode** %12
	store %symb.SymbNode* %13, %symb.SymbNode** %bs
	br label %L.6
L.6:
	%14 = load %symb.SymbNode** %bs
	%15 = icmp ne %symb.SymbNode* %14, null
	%16 = xor i1 %15, true
	br i1 %16, label %L.7, label %L.8
L.8:
	%17 = load %symb.SymbNode** %bs
	%18 = getelementptr %symb.SymbNode* %17, i32 0, i32 19
	%19 = getelementptr [0 x i8]* %18
	%20 = call %symb.SymbNode* @symb_New(i8 4, [0 x i8]* %19, i8 1)
	store %symb.SymbNode* %20, %symb.SymbNode** %s
	%21 = load %symb.SymbNode** %ps
	%22 = icmp ne %symb.SymbNode* %21, null
	br i1 %22, label %L.10, label %L.11
L.10:
	%23 = load %symb.SymbNode** %s
	%24 = load %symb.SymbNode** %ps
	%25 = getelementptr %symb.SymbNode* %24, i32 0, i32 0
	store %symb.SymbNode* %23, %symb.SymbNode** %25
	br label %L.9
L.11:
	%26 = load %symb.SymbNode** %s
	%27 = load %type.TypeNode** %t
	%28 = getelementptr %type.TypeNode* %27, i32 0, i32 3
	store %symb.SymbNode* %26, %symb.SymbNode** %28
	br label %L.9
L.9:
	%29 = load %symb.SymbNode** %s
	store %symb.SymbNode* %29, %symb.SymbNode** %ps
	%30 = load %symb.SymbNode** %bs
	%31 = getelementptr %symb.SymbNode* %30, i32 0, i32 1
	%32 = load %type.TypeNode** %31
	%33 = load %symb.SymbNode** %s
	%34 = getelementptr %symb.SymbNode* %33, i32 0, i32 1
	store %type.TypeNode* %32, %type.TypeNode** %34
	%35 = load %symb.SymbNode** %bs
	%36 = getelementptr %symb.SymbNode* %35, i32 0, i32 0
	%37 = load %symb.SymbNode** %36
	store %symb.SymbNode* %37, %symb.SymbNode** %bs
	br label %L.6
L.7:
	br label %L.3
L.5:
	store %type.TypeNode* null, %type.TypeNode** %bt
	call void @lex_Error(i8 53)
	br label %L.3
L.3:
	br label %L.1
L.1:
	br label %L.12
L.12:
	%38 = load i8* %tok
	%39 = icmp eq i8 %38, 40
	%40 = xor i1 %39, true
	br i1 %40, label %L.13, label %L.14
L.14:
	%41 = call i8 @lex_Next()
	store i8 %41, i8* %tok
	%42 = load i8* %tok
	%43 = zext i8 %42 to i32
	switch i32 %43, label %L.15 [
		i32 3, label %L.17
	]
L.17:
	%44 = load %type.TypeNode** %t
	%45 = getelementptr %type.TypeNode* %44, i32 0, i32 3
	%46 = load %symb.SymbNode** %45
	%47 = getelementptr [64 x i8]* @lex_Ident
	%48 = bitcast [64 x i8]* %47 to [0 x i8]*
	%49 = call i8 @symb_IsUniqueLocal(%symb.SymbNode* %46, [0 x i8]* %48)
	%50 = icmp ne i8 %49, 0
	%51 = xor i1 %50, true
	br i1 %51, label %L.19, label %L.18
L.19:
	%52 = getelementptr [64 x i8]* @lex_Ident
	%53 = bitcast [64 x i8]* %52 to [0 x i8]*
	call void @lex_ErrorI(i8 13, [0 x i8]* %53)
	br label %L.18
L.18:
	%54 = getelementptr [64 x i8]* @lex_Ident
	%55 = bitcast [64 x i8]* %54 to [0 x i8]*
	%56 = call %symb.SymbNode* @symb_New(i8 4, [0 x i8]* %55, i8 1)
	store %symb.SymbNode* %56, %symb.SymbNode** %s
	%57 = load %symb.SymbNode** %ps
	%58 = icmp ne %symb.SymbNode* %57, null
	br i1 %58, label %L.21, label %L.22
L.21:
	%59 = load %symb.SymbNode** %s
	%60 = load %symb.SymbNode** %ps
	%61 = getelementptr %symb.SymbNode* %60, i32 0, i32 0
	store %symb.SymbNode* %59, %symb.SymbNode** %61
	br label %L.20
L.22:
	%62 = load %symb.SymbNode** %s
	%63 = load %type.TypeNode** %t
	%64 = getelementptr %type.TypeNode* %63, i32 0, i32 3
	store %symb.SymbNode* %62, %symb.SymbNode** %64
	br label %L.20
L.20:
	%65 = load %symb.SymbNode** %s
	store %symb.SymbNode* %65, %symb.SymbNode** %ps
	%66 = call i8 @lex_Next()
	store i8 %66, i8* %tok
	%67 = load i8* %tok
	%68 = call %type.TypeNode* @type_Def(i8 %67, %type.TypeNode* null)
	store %type.TypeNode* %68, %type.TypeNode** %ft
	%69 = load %type.TypeNode** %ft
	%70 = load %symb.SymbNode** %s
	%71 = getelementptr %symb.SymbNode* %70, i32 0, i32 1
	store %type.TypeNode* %69, %type.TypeNode** %71
	%72 = load i8* @lex_Token
	store i8 %72, i8* %tok
	%73 = load i8* %tok
	%74 = icmp eq i8 %73, 3
	br i1 %74, label %L.24, label %L.23
L.24:
	%75 = load %type.TypeNode** %ft
	%76 = call %type.TypeNode* @type_TypeAttributes(%type.TypeNode* %75)
	%77 = load %symb.SymbNode** %s
	%78 = getelementptr %symb.SymbNode* %77, i32 0, i32 1
	store %type.TypeNode* %76, %type.TypeNode** %78
	%79 = load i8* @lex_Token
	store i8 %79, i8* %tok
	br label %L.23
L.23:
	%80 = load i8* %tok
	%81 = icmp eq i8 %80, 9
	br i1 %81, label %L.26, label %L.25
L.26:
	%82 = call i8 @lex_Next()
	store i8 %82, i8* %tok
	%83 = getelementptr [20 x i8]* @.str471
	%84 = bitcast [20 x i8]* %83 to [0 x i8]*
	call void @lex_ErrorS(i8 0, [0 x i8]* %84)
	br label %L.25
L.25:
	br label %L.16
L.15:
	call void @lex_Error(i8 52)
	br label %L.16
L.16:
	%85 = call i8 @lex_Expect(i8 4)
	store i8 %85, i8* %tok
	br label %L.12
L.13:
	%86 = call i8 @lex_Expect(i8 37)
	store i8 %86, i8* %tok
	%87 = load %type.TypeNode** %t
	store %type.TypeNode* %87, %type.TypeNode** %rv.0
	br label %return
return:
	%88 = load %type.TypeNode** %rv.0
	ret %type.TypeNode* %88
}
define %type.TypeNode* @type_Array() nounwind {
L.0:
	%rv.0 = alloca %type.TypeNode*
	%tok = alloca i8
	%t = alloca %type.TypeNode*
	%bt = alloca %type.TypeNode*
	%0 = call i8 @lex_Next()
	store i8 %0, i8* %tok
	%1 = call %type.TypeNode* @type_New(i8 5)
	store %type.TypeNode* %1, %type.TypeNode** %t
	%2 = load i8* %tok
	%3 = icmp ne i8 %2, 35
	br i1 %3, label %L.2, label %L.3
L.2:
	%tree = alloca %ast.AstNode*
	%4 = call %ast.AstNode* @expr_Bool(%type.TypeNode* null)
	store %ast.AstNode* %4, %ast.AstNode** %tree
	%5 = load %ast.AstNode** %tree
	%6 = icmp ne %ast.AstNode* %5, null
	br i1 %6, label %L.5, label %L.4
L.5:
	%7 = load %ast.AstNode** %tree
	%8 = getelementptr %ast.AstNode* %7, i32 0, i32 0
	%9 = load i8* %8
	%10 = zext i8 %9 to i32
	switch i32 %10, label %L.6 [
		i32 7, label %L.8
		i32 2, label %L.9
	]
L.8:
	%11 = load %ast.AstNode** %tree
	%12 = getelementptr %ast.AstNode* %11, i32 0, i32 8
	%13 = load i64* %12
	%14 = load %type.TypeNode** %t
	%15 = getelementptr %type.TypeNode* %14, i32 0, i32 6
	store i64 %13, i64* %15
	%16 = load %type.TypeNode** @type_wordtype
	%17 = load %type.TypeNode** %t
	%18 = getelementptr %type.TypeNode* %17, i32 0, i32 1
	store %type.TypeNode* %16, %type.TypeNode** %18
	br label %L.7
L.9:
	%19 = load %ast.AstNode** %tree
	%20 = getelementptr %ast.AstNode* %19, i32 0, i32 9
	%21 = load %type.TypeNode** %20
	%22 = getelementptr %type.TypeNode* %21, i32 0, i32 11
	%23 = load i8* %22
	%24 = zext i8 %23 to i32
	switch i32 %24, label %L.10 [
		i32 1, label %L.12
		i32 2, label %L.12
	]
L.12:
	%25 = load %ast.AstNode** %tree
	%26 = getelementptr %ast.AstNode* %25, i32 0, i32 9
	%27 = load %type.TypeNode** %26
	%28 = getelementptr %type.TypeNode* %27, i32 0, i32 6
	%29 = load i64* %28
	%30 = add i64 %29, 1
	%31 = load %type.TypeNode** %t
	%32 = getelementptr %type.TypeNode* %31, i32 0, i32 6
	store i64 %30, i64* %32
	%33 = load %ast.AstNode** %tree
	%34 = getelementptr %ast.AstNode* %33, i32 0, i32 9
	%35 = load %type.TypeNode** %34
	%36 = load %type.TypeNode** %t
	%37 = getelementptr %type.TypeNode* %36, i32 0, i32 1
	store %type.TypeNode* %35, %type.TypeNode** %37
	br label %L.11
L.10:
	call void @lex_Error(i8 17)
	br label %L.11
L.11:
	br label %L.7
L.6:
	call void @lex_Error(i8 17)
	br label %L.7
L.7:
	br label %L.4
L.4:
	br label %L.1
L.3:
	%38 = load %type.TypeNode** %t
	%39 = getelementptr %type.TypeNode* %38, i32 0, i32 16
	store i8 1, i8* %39
	br label %L.1
L.1:
	%40 = call i8 @lex_Expect(i8 35)
	store i8 %40, i8* %tok
	%41 = load i8* %tok
	%42 = call %type.TypeNode* @type_Def(i8 %41, %type.TypeNode* null)
	store %type.TypeNode* %42, %type.TypeNode** %bt
	%43 = load %type.TypeNode** %bt
	%44 = load %type.TypeNode** %t
	%45 = getelementptr %type.TypeNode* %44, i32 0, i32 0
	store %type.TypeNode* %43, %type.TypeNode** %45
	%46 = load %type.TypeNode** %t
	store %type.TypeNode* %46, %type.TypeNode** %rv.0
	br label %return
return:
	%47 = load %type.TypeNode** %rv.0
	ret %type.TypeNode* %47
}
define %symb.SymbNode* @type_Name() nounwind {
L.0:
	%rv.0 = alloca %symb.SymbNode*
	%s = alloca %symb.SymbNode*
	%0 = getelementptr [64 x i8]* @lex_Ident
	%1 = bitcast [64 x i8]* %0 to [0 x i8]*
	%2 = call %symb.SymbNode* @symb_Find([0 x i8]* %1)
	store %symb.SymbNode* %2, %symb.SymbNode** %s
	%3 = load %symb.SymbNode** %s
	%4 = icmp ne %symb.SymbNode* %3, null
	br i1 %4, label %L.1, label %L.2
L.1:
	%5 = load %symb.SymbNode** %s
	%6 = getelementptr %symb.SymbNode* %5, i32 0, i32 12
	%7 = load i8* %6
	%8 = icmp ne i8 %7, 2
	br label %L.2
L.2:
	%9 = phi i1 [ false, %L.0 ], [ %8, %L.1 ]
	br i1 %9, label %L.4, label %L.3
L.4:
	call void @lex_Error(i8 19)
	br label %L.3
L.3:
	%10 = load %symb.SymbNode** %s
	store %symb.SymbNode* %10, %symb.SymbNode** %rv.0
	br label %return
return:
	%11 = load %symb.SymbNode** %rv.0
	ret %symb.SymbNode* %11
}
define void @type_DefProc(%symb.SymbNode* %procs.arg, %symb.SymbNode* %meths.arg) nounwind {
L.0:
	%procs = alloca %symb.SymbNode*
	%meths = alloca %symb.SymbNode*
	store %symb.SymbNode* %procs.arg, %symb.SymbNode** %procs
	store %symb.SymbNode* %meths.arg, %symb.SymbNode** %meths
	%s = alloca %symb.SymbNode*
	%prevs = alloca %symb.SymbNode*
	%t = alloca %type.TypeNode*
	%tl = alloca %type.TypeListEntry*
	%tlprev = alloca %type.TypeListEntry*
	%tok = alloca i8
	%0 = load i8* @lex_Token
	store i8 %0, i8* %tok
	%1 = load i8* %tok
	%2 = icmp eq i8 %1, 32
	br i1 %2, label %L.2, label %L.3
L.2:
	%3 = call i8 @lex_Next()
	store i8 %3, i8* %tok
	%4 = load %symb.SymbNode** %meths
	%5 = icmp ne %symb.SymbNode* %4, null
	br i1 %5, label %L.5, label %L.4
L.5:
	%6 = load %symb.SymbNode** %meths
	%7 = load %symb.SymbNode** %procs
	%8 = getelementptr %symb.SymbNode* %7, i32 0, i32 3
	store %symb.SymbNode* %6, %symb.SymbNode** %8
	br label %L.4
L.4:
	%9 = load i8* %tok
	%10 = icmp ne i8 %9, 33
	br i1 %10, label %L.7, label %L.6
L.7:
	%11 = load %symb.SymbNode** %meths
	store %symb.SymbNode* %11, %symb.SymbNode** %prevs
	br label %L.8
L.8:
	%12 = load i8* %tok
	%13 = icmp eq i8 %12, 40
	br i1 %13, label %L.11, label %L.12
L.11:
	%14 = load %symb.SymbNode** %procs
	%15 = getelementptr %symb.SymbNode* %14, i32 0, i32 3
	%16 = load %symb.SymbNode** %15
	%17 = getelementptr [64 x i8]* @lex_Ident
	%18 = bitcast [64 x i8]* %17 to [0 x i8]*
	%19 = call i8 @symb_IsUniqueLocal(%symb.SymbNode* %16, [0 x i8]* %18)
	%20 = icmp ne i8 %19, 0
	%21 = xor i1 %20, true
	br i1 %21, label %L.14, label %L.13
L.14:
	%22 = getelementptr [64 x i8]* @lex_Ident
	%23 = bitcast [64 x i8]* %22 to [0 x i8]*
	call void @lex_ErrorI(i8 13, [0 x i8]* %23)
	br label %L.13
L.13:
	%24 = getelementptr [64 x i8]* @lex_Ident
	%25 = bitcast [64 x i8]* %24 to [0 x i8]*
	%26 = call %symb.SymbNode* @symb_New(i8 3, [0 x i8]* %25, i8 1)
	store %symb.SymbNode* %26, %symb.SymbNode** %s
	%27 = call i8 @lex_Next()
	store i8 %27, i8* %tok
	%28 = load %symb.SymbNode** %s
	%29 = getelementptr %symb.SymbNode* %28, i32 0, i32 16
	store i8 1, i8* %29
	%30 = load %symb.SymbNode** %s
	%31 = getelementptr %symb.SymbNode* %30, i32 0, i32 13
	store i8 0, i8* %31
	%32 = load i8* %tok
	%33 = icmp eq i8 %32, 3
	br i1 %33, label %L.16, label %L.17
L.16:
	%34 = call i8 @lex_Next()
	store i8 %34, i8* %tok
	%35 = load i8* %tok
	%36 = call %type.TypeNode* @type_Def(i8 %35, %type.TypeNode* null)
	store %type.TypeNode* %36, %type.TypeNode** %t
	%37 = load %type.TypeNode** %t
	call void @type_Final(%type.TypeNode* %37)
	%38 = load %type.TypeNode** %t
	%39 = load %symb.SymbNode** %s
	%40 = getelementptr %symb.SymbNode* %39, i32 0, i32 1
	store %type.TypeNode* %38, %type.TypeNode** %40
	%41 = load i8* @lex_Token
	store i8 %41, i8* %tok
	br label %L.15
L.17:
	call void @lex_ErrorT(i8 10, i8 3)
	br label %L.15
L.15:
	%42 = load %symb.SymbNode** %procs
	%43 = getelementptr %symb.SymbNode* %42, i32 0, i32 3
	%44 = load %symb.SymbNode** %43
	%45 = icmp eq %symb.SymbNode* %44, null
	br i1 %45, label %L.19, label %L.18
L.19:
	%46 = load %symb.SymbNode** %s
	%47 = load %symb.SymbNode** %procs
	%48 = getelementptr %symb.SymbNode* %47, i32 0, i32 3
	store %symb.SymbNode* %46, %symb.SymbNode** %48
	br label %L.18
L.18:
	%49 = load %symb.SymbNode** %prevs
	%50 = icmp ne %symb.SymbNode* %49, null
	br i1 %50, label %L.21, label %L.20
L.21:
	%51 = load %symb.SymbNode** %s
	%52 = load %symb.SymbNode** %prevs
	%53 = getelementptr %symb.SymbNode* %52, i32 0, i32 0
	store %symb.SymbNode* %51, %symb.SymbNode** %53
	br label %L.20
L.20:
	%54 = load %symb.SymbNode** %s
	store %symb.SymbNode* %54, %symb.SymbNode** %prevs
	br label %L.10
L.12:
	call void @lex_Error(i8 11)
	br label %L.10
L.10:
	%55 = load i8* %tok
	%56 = icmp ne i8 %55, 5
	br i1 %56, label %L.9, label %L.22
L.22:
	%57 = call i8 @lex_Next()
	store i8 %57, i8* %tok
	br label %L.8
L.9:
	br label %L.6
L.6:
	%58 = call i8 @lex_Expect(i8 33)
	store i8 %58, i8* %tok
	br label %L.1
L.3:
	call void @lex_ErrorT(i8 10, i8 32)
	br label %L.1
L.1:
	%59 = load i8* %tok
	%60 = icmp eq i8 %59, 3
	br i1 %60, label %L.24, label %L.23
L.24:
	%61 = call i8 @lex_Next()
	store i8 %61, i8* %tok
	%62 = load i8* %tok
	%63 = icmp ne i8 %62, 3
	br i1 %63, label %L.26, label %L.25
L.26:
	store %type.TypeListEntry* null, %type.TypeListEntry** %tlprev
	br label %L.27
L.27:
	%64 = load i8* %tok
	%65 = call %type.TypeNode* @type_Def(i8 %64, %type.TypeNode* null)
	store %type.TypeNode* %65, %type.TypeNode** %t
	%66 = load %type.TypeNode** %t
	call void @type_Final(%type.TypeNode* %66)
	%67 = call [0 x i8]* @sys_zalloc(i32 8)
	%68 = bitcast [0 x i8]* %67 to %type.TypeListEntry*
	store %type.TypeListEntry* %68, %type.TypeListEntry** %tl
	%69 = load %type.TypeNode** %t
	%70 = load %type.TypeListEntry** %tl
	%71 = getelementptr %type.TypeListEntry* %70, i32 0, i32 1
	store %type.TypeNode* %69, %type.TypeNode** %71
	%72 = load %type.TypeListEntry** %tlprev
	%73 = icmp eq %type.TypeListEntry* %72, null
	br i1 %73, label %L.30, label %L.31
L.30:
	%74 = load %type.TypeListEntry** %tl
	%75 = load %symb.SymbNode** %procs
	%76 = getelementptr %symb.SymbNode* %75, i32 0, i32 4
	store %type.TypeListEntry* %74, %type.TypeListEntry** %76
	br label %L.29
L.31:
	%77 = load %type.TypeListEntry** %tl
	%78 = load %type.TypeListEntry** %tlprev
	%79 = getelementptr %type.TypeListEntry* %78, i32 0, i32 0
	store %type.TypeListEntry* %77, %type.TypeListEntry** %79
	br label %L.29
L.29:
	%80 = load %type.TypeListEntry** %tl
	store %type.TypeListEntry* %80, %type.TypeListEntry** %tlprev
	%81 = load i8* @lex_Token
	store i8 %81, i8* %tok
	%82 = load i8* %tok
	%83 = icmp ne i8 %82, 5
	br i1 %83, label %L.28, label %L.32
L.32:
	%84 = call i8 @lex_Next()
	store i8 %84, i8* %tok
	br label %L.27
L.28:
	%85 = load %symb.SymbNode** %procs
	%86 = getelementptr %symb.SymbNode* %85, i32 0, i32 4
	%87 = load %type.TypeListEntry** %86
	%88 = getelementptr %type.TypeListEntry* %87, i32 0, i32 1
	%89 = load %type.TypeNode** %88
	%90 = load %symb.SymbNode** %procs
	%91 = getelementptr %symb.SymbNode* %90, i32 0, i32 1
	store %type.TypeNode* %89, %type.TypeNode** %91
	br label %L.25
L.25:
	br label %L.23
L.23:
	br label %return
return:
	ret void
}
define %type.TypeNode* @type_Ref() nounwind {
L.0:
	%rv.0 = alloca %type.TypeNode*
	%tok = alloca i8
	%t = alloca %type.TypeNode*
	%bs = alloca %symb.SymbNode*
	%0 = call i8 @lex_Next()
	store i8 %0, i8* %tok
	%1 = load i8* %tok
	%2 = icmp eq i8 %1, 40
	br i1 %2, label %L.2, label %L.3
L.2:
	%3 = getelementptr [64 x i8]* @lex_Ident
	%4 = bitcast [64 x i8]* %3 to [0 x i8]*
	%5 = call i8 @symb_IsAnon([0 x i8]* %4)
	%6 = icmp ne i8 %5, 0
	br i1 %6, label %L.5, label %L.6
L.5:
	%7 = call %type.TypeNode* @type_New(i8 7)
	store %type.TypeNode* %7, %type.TypeNode** %t
	%8 = getelementptr [64 x i8]* @lex_Ident
	%9 = bitcast [64 x i8]* %8 to [0 x i8]*
	%10 = call %symb.SymbNode* @symb_New(i8 5, [0 x i8]* %9, i8 1)
	store %symb.SymbNode* %10, %symb.SymbNode** %bs
	%11 = call i8 @lex_Next()
	store i8 %11, i8* %tok
	%12 = load %symb.SymbNode** %bs
	call void @type_DefProc(%symb.SymbNode* %12, %symb.SymbNode* null)
	%13 = load %symb.SymbNode** %bs
	%14 = load %type.TypeNode** %t
	%15 = getelementptr %type.TypeNode* %14, i32 0, i32 3
	store %symb.SymbNode* %13, %symb.SymbNode** %15
	br label %L.4
L.6:
	%16 = call %type.TypeNode* @type_New(i8 4)
	store %type.TypeNode* %16, %type.TypeNode** %t
	%17 = call %symb.SymbNode* @type_Name()
	store %symb.SymbNode* %17, %symb.SymbNode** %bs
	%18 = load %symb.SymbNode** %bs
	%19 = icmp ne %symb.SymbNode* %18, null
	br i1 %19, label %L.8, label %L.9
L.8:
	%20 = load %symb.SymbNode** %bs
	%21 = getelementptr %symb.SymbNode* %20, i32 0, i32 1
	%22 = load %type.TypeNode** %21
	%23 = icmp ne %type.TypeNode* %22, null
	br i1 %23, label %L.11, label %L.12
L.11:
	%24 = load %symb.SymbNode** %bs
	%25 = getelementptr %symb.SymbNode* %24, i32 0, i32 1
	%26 = load %type.TypeNode** %25
	%27 = load %type.TypeNode** %t
	%28 = getelementptr %type.TypeNode* %27, i32 0, i32 0
	store %type.TypeNode* %26, %type.TypeNode** %28
	br label %L.10
L.12:
	%29 = load %symb.SymbNode** %bs
	%30 = load %type.TypeNode** %t
	call void @type_FwdAdd(%symb.SymbNode* %29, %type.TypeNode* %30)
	br label %L.10
L.10:
	br label %L.7
L.9:
	%31 = getelementptr [64 x i8]* @lex_Ident
	%32 = bitcast [64 x i8]* %31 to [0 x i8]*
	%33 = call %symb.SymbNode* @symb_New(i8 2, [0 x i8]* %32, i8 0)
	store %symb.SymbNode* %33, %symb.SymbNode** %bs
	%34 = load %symb.SymbNode** %bs
	%35 = load %type.TypeNode** %t
	call void @type_FwdAdd(%symb.SymbNode* %34, %type.TypeNode* %35)
	br label %L.7
L.7:
	%36 = call i8 @lex_Next()
	store i8 %36, i8* %tok
	br label %L.4
L.4:
	br label %L.1
L.3:
	%37 = call %type.TypeNode* @type_New(i8 4)
	store %type.TypeNode* %37, %type.TypeNode** %t
	%38 = load i8* %tok
	%39 = call %type.TypeNode* @type_Def(i8 %38, %type.TypeNode* null)
	%40 = load %type.TypeNode** %t
	%41 = getelementptr %type.TypeNode* %40, i32 0, i32 0
	store %type.TypeNode* %39, %type.TypeNode** %41
	br label %L.1
L.1:
	%42 = load %type.TypeNode** %t
	store %type.TypeNode* %42, %type.TypeNode** %rv.0
	br label %return
return:
	%43 = load %type.TypeNode** %rv.0
	ret %type.TypeNode* %43
}
define %type.TypeNode* @type_Def(i8 zeroext %tok.arg, %type.TypeNode* %bt.arg) nounwind {
L.0:
	%rv.0 = alloca %type.TypeNode*
	%tok = alloca i8
	%bt = alloca %type.TypeNode*
	store i8 %tok.arg, i8* %tok
	store %type.TypeNode* %bt.arg, %type.TypeNode** %bt
	%t = alloca %type.TypeNode*
	%s = alloca %symb.SymbNode*
	%vlo = alloca %ast.AstNode*
	%vhi = alloca %ast.AstNode*
	%0 = load %type.TypeNode** @type_unkntype
	store %type.TypeNode* %0, %type.TypeNode** %t
	%1 = load i8* %tok
	%2 = zext i8 %1 to i32
	switch i32 %2, label %L.1 [
		i32 38, label %L.3
		i32 14, label %L.3
		i32 15, label %L.3
		i32 40, label %L.4
		i32 7, label %L.5
		i32 32, label %L.6
		i32 36, label %L.7
		i32 34, label %L.8
	]
L.3:
	%3 = call %ast.AstNode* @expr_Bool(%type.TypeNode* null)
	store %ast.AstNode* %3, %ast.AstNode** %vlo
	%4 = load i8* @lex_Token
	%5 = icmp eq i8 %4, 6
	br i1 %5, label %L.10, label %L.11
L.10:
	%6 = call i8 @lex_Next()
	store i8 %6, i8* %tok
	%7 = call %ast.AstNode* @expr_Bool(%type.TypeNode* null)
	store %ast.AstNode* %7, %ast.AstNode** %vhi
	%8 = load %ast.AstNode** %vlo
	%9 = getelementptr %ast.AstNode* %8, i32 0, i32 0
	%10 = load i8* %9
	%11 = icmp eq i8 %10, 7
	br i1 %11, label %L.12, label %L.13
L.12:
	%12 = load %ast.AstNode** %vhi
	%13 = getelementptr %ast.AstNode* %12, i32 0, i32 0
	%14 = load i8* %13
	%15 = icmp eq i8 %14, 7
	br label %L.13
L.13:
	%16 = phi i1 [ false, %L.10 ], [ %15, %L.12 ]
	br i1 %16, label %L.15, label %L.16
L.15:
	%17 = load %ast.AstNode** %vlo
	%18 = getelementptr %ast.AstNode* %17, i32 0, i32 1
	%19 = load i8* %18
	%20 = zext i8 %19 to i32
	switch i32 %20, label %L.17 [
		i32 2, label %L.19
		i32 3, label %L.19
	]
L.19:
	%21 = load %ast.AstNode** %vlo
	%22 = getelementptr %ast.AstNode* %21, i32 0, i32 1
	%23 = load i8* %22
	%24 = call %type.TypeNode* @type_New(i8 %23)
	store %type.TypeNode* %24, %type.TypeNode** %t
	%25 = load %ast.AstNode** %vlo
	%26 = getelementptr %ast.AstNode* %25, i32 0, i32 8
	%27 = load i64* %26
	%28 = load %type.TypeNode** %t
	%29 = getelementptr %type.TypeNode* %28, i32 0, i32 5
	store i64 %27, i64* %29
	%30 = load %ast.AstNode** %vhi
	%31 = getelementptr %ast.AstNode* %30, i32 0, i32 8
	%32 = load i64* %31
	%33 = load %type.TypeNode** %t
	%34 = getelementptr %type.TypeNode* %33, i32 0, i32 6
	store i64 %32, i64* %34
	br label %L.18
L.17:
	call void @lex_Error(i8 24)
	br label %L.18
L.18:
	br label %L.14
L.16:
	call void @lex_Error(i8 60)
	br label %L.14
L.14:
	br label %L.9
L.11:
	call void @lex_ErrorT(i8 10, i8 6)
	br label %L.9
L.9:
	br label %L.2
L.4:
	%35 = call %symb.SymbNode* @type_Name()
	store %symb.SymbNode* %35, %symb.SymbNode** %s
	%36 = load %symb.SymbNode** %s
	%37 = icmp ne %symb.SymbNode* %36, null
	br i1 %37, label %L.21, label %L.22
L.21:
	%38 = load %symb.SymbNode** %s
	%39 = getelementptr %symb.SymbNode* %38, i32 0, i32 1
	%40 = load %type.TypeNode** %39
	store %type.TypeNode* %40, %type.TypeNode** %t
	br label %L.20
L.22:
	%41 = getelementptr [64 x i8]* @lex_Ident
	%42 = bitcast [64 x i8]* %41 to [0 x i8]*
	call void @lex_ErrorI(i8 12, [0 x i8]* %42)
	br label %L.20
L.20:
	%43 = call i8 @lex_Next()
	store i8 %43, i8* %tok
	br label %L.2
L.5:
	%44 = call %type.TypeNode* @type_Ref()
	store %type.TypeNode* %44, %type.TypeNode** %t
	br label %L.2
L.6:
	%45 = load %type.TypeNode** %bt
	%46 = call %type.TypeNode* @type_Enum(%type.TypeNode* %45)
	store %type.TypeNode* %46, %type.TypeNode** %t
	br label %L.2
L.7:
	%47 = load %type.TypeNode** %bt
	%48 = call %type.TypeNode* @type_Record(%type.TypeNode* %47)
	store %type.TypeNode* %48, %type.TypeNode** %t
	br label %L.2
L.8:
	%49 = call %type.TypeNode* @type_Array()
	store %type.TypeNode* %49, %type.TypeNode** %t
	br label %L.2
L.1:
	call void @lex_Error(i8 20)
	br label %L.2
L.2:
	%50 = load %type.TypeNode** %t
	store %type.TypeNode* %50, %type.TypeNode** %rv.0
	br label %return
return:
	%51 = load %type.TypeNode** %rv.0
	ret %type.TypeNode* %51
}
define %type.TypeNode* @type_NewBuiltin(i8 zeroext %kind.arg, [0 x i8]* %name.arg, i32 %size.arg) nounwind {
L.0:
	%rv.0 = alloca %type.TypeNode*
	%kind = alloca i8
	%name = alloca [0 x i8]*
	%size = alloca i32
	store i8 %kind.arg, i8* %kind
	store [0 x i8]* %name.arg, [0 x i8]** %name
	store i32 %size.arg, i32* %size
	%t = alloca %type.TypeNode*
	%s = alloca %symb.SymbNode*
	%levelsave = alloca i8
	%0 = load i8* %kind
	%1 = call %type.TypeNode* @type_New(i8 %0)
	store %type.TypeNode* %1, %type.TypeNode** %t
	%2 = load i32* %size
	%3 = load %type.TypeNode** %t
	%4 = getelementptr %type.TypeNode* %3, i32 0, i32 7
	store i32 %2, i32* %4
	%5 = load i8* %kind
	%6 = zext i8 %5 to i32
	switch i32 %6, label %L.1 [
		i32 1, label %L.3
		i32 2, label %L.3
		i32 3, label %L.4
	]
L.3:
	%7 = load %type.TypeNode** %t
	%8 = getelementptr %type.TypeNode* %7, i32 0, i32 5
	store i64 0, i64* %8
	%9 = load i32* %size
	%10 = sub i32 %9, 1
	%11 = zext i32 %10 to i64
	%12 = shl i64 1, %11
	%13 = sub i64 %12, 1
	%14 = shl i64 %13, 1
	%15 = or i64 %14, 1
	%16 = load %type.TypeNode** %t
	%17 = getelementptr %type.TypeNode* %16, i32 0, i32 6
	store i64 %15, i64* %17
	br label %L.2
L.4:
	%18 = load i32* %size
	%19 = sub i32 %18, 1
	%20 = zext i32 %19 to i64
	%21 = shl i64 1, %20
	%22 = sub i64 %21, 1
	%23 = load %type.TypeNode** %t
	%24 = getelementptr %type.TypeNode* %23, i32 0, i32 6
	store i64 %22, i64* %24
	%25 = load %type.TypeNode** %t
	%26 = getelementptr %type.TypeNode* %25, i32 0, i32 6
	%27 = load i64* %26
	%28 = xor i64 %27, -1
	%29 = load %type.TypeNode** %t
	%30 = getelementptr %type.TypeNode* %29, i32 0, i32 5
	store i64 %28, i64* %30
	br label %L.2
L.1:
	br label %L.2
L.2:
	%31 = load %type.TypeNode** %t
	call void @type_Final(%type.TypeNode* %31)
	%32 = load i8* @symb_level
	store i8 %32, i8* %levelsave
	store i8 0, i8* @symb_level
	%33 = load [0 x i8]** %name
	%34 = call %symb.SymbNode* @symb_New(i8 2, [0 x i8]* %33, i8 0)
	store %symb.SymbNode* %34, %symb.SymbNode** %s
	%35 = load i8* %levelsave
	store i8 %35, i8* @symb_level
	%36 = load %type.TypeNode** %t
	%37 = load %symb.SymbNode** %s
	%38 = getelementptr %symb.SymbNode* %37, i32 0, i32 1
	store %type.TypeNode* %36, %type.TypeNode** %38
	%39 = load %symb.SymbNode** %s
	%40 = load %type.TypeNode** %t
	%41 = getelementptr %type.TypeNode* %40, i32 0, i32 2
	store %symb.SymbNode* %39, %symb.SymbNode** %41
	%42 = load %type.TypeNode** %t
	store %type.TypeNode* %42, %type.TypeNode** %rv.0
	br label %return
return:
	%43 = load %type.TypeNode** %rv.0
	ret %type.TypeNode* %43
}
@type_packedstr = internal constant [3 x [0 x i8]*] [ [0 x i8] * bitcast( [1 x i8]* getelementptr( [1 x i8]* @.str473 )  to [0 x i8]* ), [0 x i8] * bitcast( [7 x i8]* getelementptr( [7 x i8]* @.str474 )  to [0 x i8]* ), [0 x i8] * bitcast( [7 x i8]* getelementptr( [7 x i8]* @.str475 )  to [0 x i8]* ) ], align 4
@type_bitorderstr = internal constant [3 x [0 x i8]*] [ [0 x i8] * bitcast( [1 x i8]* getelementptr( [1 x i8]* @.str477 )  to [0 x i8]* ), [0 x i8] * bitcast( [4 x i8]* getelementptr( [4 x i8]* @.str478 )  to [0 x i8]* ), [0 x i8] * bitcast( [4 x i8]* getelementptr( [4 x i8]* @.str479 )  to [0 x i8]* ) ], align 4
@type_memorderstr = internal constant [3 x [0 x i8]*] [ [0 x i8] * bitcast( [1 x i8]* getelementptr( [1 x i8]* @.str481 )  to [0 x i8]* ), [0 x i8] * bitcast( [3 x i8]* getelementptr( [3 x i8]* @.str482 )  to [0 x i8]* ), [0 x i8] * bitcast( [3 x i8]* getelementptr( [3 x i8]* @.str483 )  to [0 x i8]* ) ], align 4
@type_accessstr = internal constant [3 x [0 x i8]*] [ [0 x i8] * bitcast( [3 x i8]* getelementptr( [3 x i8]* @.str485 )  to [0 x i8]* ), [0 x i8] * bitcast( [3 x i8]* getelementptr( [3 x i8]* @.str486 )  to [0 x i8]* ), [0 x i8] * bitcast( [3 x i8]* getelementptr( [3 x i8]* @.str487 )  to [0 x i8]* ) ], align 4
@type_blanks = internal constant [65 x i8] c"                                                                \00"
define void @type_Dump2(%type.TypeNode* %t.arg, i32 %indent.arg, i8 zeroext %full.arg) nounwind {
L.0:
	%t = alloca %type.TypeNode*
	%indent = alloca i32
	%full = alloca i8
	store %type.TypeNode* %t.arg, %type.TypeNode** %t
	store i32 %indent.arg, i32* %indent
	store i8 %full.arg, i8* %full
	%s = alloca %symb.SymbNode*
	%offs = alloca i16
	%0 = load %type.TypeNode** %t
	%1 = icmp ne %type.TypeNode* %0, null
	br i1 %1, label %L.2, label %L.1
L.2:
	%2 = load %type.TypeNode** %t
	%3 = getelementptr %type.TypeNode* %2, i32 0, i32 2
	%4 = load %symb.SymbNode** %3
	%5 = icmp ne %symb.SymbNode* %4, null
	br i1 %5, label %L.3, label %L.4
L.3:
	%6 = load i8* %full
	%7 = icmp ne i8 %6, 0
	%8 = xor i1 %7, true
	br label %L.4
L.4:
	%9 = phi i1 [ false, %L.2 ], [ %8, %L.3 ]
	br i1 %9, label %L.6, label %L.7
L.6:
	%10 = load %type.TypeNode** %t
	%11 = getelementptr %type.TypeNode* %10, i32 0, i32 2
	%12 = load %symb.SymbNode** %11
	%13 = getelementptr %symb.SymbNode* %12, i32 0, i32 19
	%14 = getelementptr [0 x i8]* %13
	call void @out_str(i32 2, [0 x i8]* %14)
	br label %L.5
L.7:
	%15 = load %type.TypeNode** %t
	%16 = getelementptr %type.TypeNode* %15, i32 0, i32 11
	%17 = load i8* %16
	%18 = zext i8 %17 to i32
	switch i32 %18, label %L.8 [
		i32 2, label %L.10
		i32 3, label %L.11
		i32 1, label %L.12
		i32 6, label %L.13
		i32 5, label %L.14
		i32 4, label %L.15
		i32 7, label %L.16
	]
L.10:
	%19 = load %type.TypeNode** %t
	%20 = getelementptr %type.TypeNode* %19, i32 0, i32 5
	%21 = load i64* %20
	call void @out_uint64(i32 2, i64 %21)
	%22 = getelementptr [3 x i8]* @.str489
	%23 = bitcast [3 x i8]* %22 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %23)
	%24 = load %type.TypeNode** %t
	%25 = getelementptr %type.TypeNode* %24, i32 0, i32 6
	%26 = load i64* %25
	call void @out_uint64(i32 2, i64 %26)
	br label %L.9
L.11:
	%27 = load %type.TypeNode** %t
	%28 = getelementptr %type.TypeNode* %27, i32 0, i32 5
	%29 = load i64* %28
	call void @out_int64(i32 2, i64 %29)
	%30 = getelementptr [3 x i8]* @.str490
	%31 = bitcast [3 x i8]* %30 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %31)
	%32 = load %type.TypeNode** %t
	%33 = getelementptr %type.TypeNode* %32, i32 0, i32 6
	%34 = load i64* %33
	call void @out_int64(i32 2, i64 %34)
	br label %L.9
L.12:
	call void @out_chr(i32 2, i8 40)
	%35 = load %type.TypeNode** %t
	%36 = getelementptr %type.TypeNode* %35, i32 0, i32 3
	%37 = load %symb.SymbNode** %36
	store %symb.SymbNode* %37, %symb.SymbNode** %s
	br label %L.17
L.17:
	%38 = load %symb.SymbNode** %s
	%39 = icmp ne %symb.SymbNode* %38, null
	%40 = xor i1 %39, true
	br i1 %40, label %L.18, label %L.19
L.19:
	%41 = load %symb.SymbNode** %s
	%42 = getelementptr %symb.SymbNode* %41, i32 0, i32 19
	%43 = getelementptr [0 x i8]* %42
	call void @out_str(i32 2, [0 x i8]* %43)
	call void @out_chr(i32 2, i8 61)
	%44 = load %symb.SymbNode** %s
	%45 = getelementptr %symb.SymbNode* %44, i32 0, i32 7
	%46 = load i64* %45
	%47 = trunc i64 %46 to i32
	call void @out_uint32(i32 2, i32 %47)
	%48 = load %symb.SymbNode** %s
	%49 = getelementptr %symb.SymbNode* %48, i32 0, i32 0
	%50 = load %symb.SymbNode** %49
	store %symb.SymbNode* %50, %symb.SymbNode** %s
	%51 = load %symb.SymbNode** %s
	%52 = icmp eq %symb.SymbNode* %51, null
	br i1 %52, label %L.18, label %L.20
L.20:
	%53 = getelementptr [3 x i8]* @.str491
	%54 = bitcast [3 x i8]* %53 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %54)
	br label %L.17
L.18:
	call void @out_chr(i32 2, i8 41)
	br label %L.9
L.13:
	%55 = getelementptr [3 x i8]* @.str492
	%56 = bitcast [3 x i8]* %55 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %56)
	store i16 0, i16* %offs
	%57 = load %type.TypeNode** %t
	%58 = getelementptr %type.TypeNode* %57, i32 0, i32 3
	%59 = load %symb.SymbNode** %58
	store %symb.SymbNode* %59, %symb.SymbNode** %s
	br label %L.21
L.21:
	%60 = load %symb.SymbNode** %s
	%61 = icmp ne %symb.SymbNode* %60, null
	%62 = xor i1 %61, true
	br i1 %62, label %L.22, label %L.23
L.23:
	%63 = getelementptr [65 x i8]* @type_blanks
	%64 = bitcast [65 x i8]* %63 to [0 x i8]*
	%65 = load i32* %indent
	%66 = add i32 %65, 2
	call void @out_strn(i32 2, [0 x i8]* %64, i32 %66)
	%67 = load %symb.SymbNode** %s
	%68 = getelementptr %symb.SymbNode* %67, i32 0, i32 19
	%69 = getelementptr [0 x i8]* %68
	call void @out_str(i32 2, [0 x i8]* %69)
	%70 = getelementptr [3 x i8]* @.str493
	%71 = bitcast [3 x i8]* %70 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %71)
	%72 = load i16* %offs
	%73 = zext i16 %72 to i32
	call void @out_uint(i32 2, i32 %73)
	%74 = getelementptr [4 x i8]* @.str494
	%75 = bitcast [4 x i8]* %74 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %75)
	%76 = load %symb.SymbNode** %s
	%77 = getelementptr %symb.SymbNode* %76, i32 0, i32 1
	%78 = load %type.TypeNode** %77
	%79 = load i32* %indent
	%80 = add i32 %79, 2
	%81 = load i8* %full
	call void @type_Dump2(%type.TypeNode* %78, i32 %80, i8 %81)
	%82 = load %type.TypeNode** %t
	%83 = getelementptr %type.TypeNode* %82, i32 0, i32 12
	%84 = load i8* %83
	%85 = icmp eq i8 %84, 2
	br i1 %85, label %L.25, label %L.26
L.25:
	%86 = load i16* %offs
	%87 = zext i16 %86 to i32
	%88 = load %symb.SymbNode** %s
	%89 = getelementptr %symb.SymbNode* %88, i32 0, i32 1
	%90 = load %type.TypeNode** %89
	%91 = getelementptr %type.TypeNode* %90, i32 0, i32 7
	%92 = load i32* %91
	%93 = add i32 %87, %92
	%94 = trunc i32 %93 to i16
	store i16 %94, i16* %offs
	br label %L.24
L.26:
	%95 = load i16* %offs
	%96 = zext i16 %95 to i32
	%97 = load %symb.SymbNode** %s
	%98 = getelementptr %symb.SymbNode* %97, i32 0, i32 1
	%99 = load %type.TypeNode** %98
	%100 = getelementptr %type.TypeNode* %99, i32 0, i32 8
	%101 = load i32* %100
	%102 = load %target.TargetT** @target_Target
	%103 = getelementptr %target.TargetT* %102, i32 0, i32 3
	%104 = load i8* %103
	%105 = zext i8 %104 to i32
	%106 = udiv i32 %101, %105
	%107 = add i32 %96, %106
	%108 = trunc i32 %107 to i16
	store i16 %108, i16* %offs
	br label %L.24
L.24:
	call void @out_nl(i32 2)
	%109 = load %symb.SymbNode** %s
	%110 = getelementptr %symb.SymbNode* %109, i32 0, i32 0
	%111 = load %symb.SymbNode** %110
	store %symb.SymbNode* %111, %symb.SymbNode** %s
	br label %L.21
L.22:
	call void @out_chr(i32 2, i8 125)
	br label %L.9
L.14:
	call void @out_chr(i32 2, i8 91)
	%112 = load %type.TypeNode** %t
	%113 = getelementptr %type.TypeNode* %112, i32 0, i32 16
	%114 = load i8* %113
	%115 = icmp ne i8 %114, 0
	br i1 %115, label %L.28, label %L.29
L.28:
	call void @out_chr(i32 2, i8 42)
	br label %L.27
L.29:
	%116 = load %type.TypeNode** %t
	%117 = getelementptr %type.TypeNode* %116, i32 0, i32 6
	%118 = load i64* %117
	%119 = trunc i64 %118 to i32
	call void @out_uint32(i32 2, i32 %119)
	br label %L.27
L.27:
	call void @out_chr(i32 2, i8 93)
	%120 = load %type.TypeNode** %t
	%121 = getelementptr %type.TypeNode* %120, i32 0, i32 0
	%122 = load %type.TypeNode** %121
	%123 = load i32* %indent
	%124 = load i8* %full
	call void @type_Dump2(%type.TypeNode* %122, i32 %123, i8 %124)
	br label %L.9
L.15:
	call void @out_chr(i32 2, i8 64)
	%125 = load %type.TypeNode** %t
	%126 = getelementptr %type.TypeNode* %125, i32 0, i32 0
	%127 = load %type.TypeNode** %126
	%128 = icmp ne %type.TypeNode* %127, null
	br i1 %128, label %L.30, label %L.31
L.30:
	%129 = load %type.TypeNode** %t
	%130 = getelementptr %type.TypeNode* %129, i32 0, i32 0
	%131 = load %type.TypeNode** %130
	%132 = getelementptr %type.TypeNode* %131, i32 0, i32 2
	%133 = load %symb.SymbNode** %132
	%134 = icmp ne %symb.SymbNode* %133, null
	br label %L.31
L.31:
	%135 = phi i1 [ false, %L.15 ], [ %134, %L.30 ]
	br i1 %135, label %L.33, label %L.34
L.33:
	%136 = load %type.TypeNode** %t
	%137 = getelementptr %type.TypeNode* %136, i32 0, i32 0
	%138 = load %type.TypeNode** %137
	%139 = getelementptr %type.TypeNode* %138, i32 0, i32 2
	%140 = load %symb.SymbNode** %139
	%141 = getelementptr %symb.SymbNode* %140, i32 0, i32 19
	%142 = getelementptr [0 x i8]* %141
	call void @out_str(i32 2, [0 x i8]* %142)
	br label %L.32
L.34:
	%143 = load %type.TypeNode** %t
	%144 = getelementptr %type.TypeNode* %143, i32 0, i32 0
	%145 = load %type.TypeNode** %144
	%146 = load i32* %indent
	%147 = load i8* %full
	call void @type_Dump2(%type.TypeNode* %145, i32 %146, i8 %147)
	br label %L.32
L.32:
	br label %L.9
L.16:
	%148 = getelementptr [3 x i8]* @.str495
	%149 = bitcast [3 x i8]* %148 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %149)
	%150 = load %type.TypeNode** %t
	%151 = getelementptr %type.TypeNode* %150, i32 0, i32 3
	%152 = load %symb.SymbNode** %151
	%153 = getelementptr %symb.SymbNode* %152, i32 0, i32 3
	%154 = load %symb.SymbNode** %153
	call void @symb_DumpFormals(%symb.SymbNode* %154)
	br label %L.9
L.8:
	%155 = getelementptr [10 x i8]* @.str496
	%156 = bitcast [10 x i8]* %155 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %156)
	br label %L.9
L.9:
	%157 = getelementptr [7 x i8]* @.str497
	%158 = bitcast [7 x i8]* %157 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %158)
	%159 = load %type.TypeNode** %t
	%160 = getelementptr %type.TypeNode* %159, i32 0, i32 7
	%161 = load i32* %160
	call void @out_uint(i32 2, i32 %161)
	call void @out_chr(i32 2, i8 58)
	%162 = load %type.TypeNode** %t
	%163 = getelementptr %type.TypeNode* %162, i32 0, i32 8
	%164 = load i32* %163
	call void @out_uint(i32 2, i32 %164)
	call void @out_chr(i32 2, i8 58)
	%165 = load %type.TypeNode** %t
	%166 = getelementptr %type.TypeNode* %165, i32 0, i32 9
	%167 = load i32* %166
	call void @out_uint(i32 2, i32 %167)
	%168 = getelementptr [7 x i8]* @.str498
	%169 = bitcast [7 x i8]* %168 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %169)
	%170 = load %type.TypeNode** %t
	%171 = getelementptr %type.TypeNode* %170, i32 0, i32 12
	%172 = load i8* %171
	%173 = zext i8 %172 to i32
	%174 = getelementptr [3 x [0 x i8]*]* @type_packedstr, i32 0, i32 %173
	%175 = load [0 x i8]** %174
	%176 = bitcast [0 x i8]* %175 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %176)
	call void @out_chr(i32 2, i8 58)
	%177 = load %type.TypeNode** %t
	%178 = getelementptr %type.TypeNode* %177, i32 0, i32 14
	%179 = load i8* %178
	%180 = load %target.TargetT** @target_Target
	%181 = getelementptr %target.TargetT* %180, i32 0, i32 2
	%182 = load i8* %181
	%183 = icmp ne i8 %179, %182
	br i1 %183, label %L.36, label %L.35
L.36:
	%184 = load %type.TypeNode** %t
	%185 = getelementptr %type.TypeNode* %184, i32 0, i32 14
	%186 = load i8* %185
	%187 = zext i8 %186 to i32
	%188 = getelementptr [3 x [0 x i8]*]* @type_memorderstr, i32 0, i32 %187
	%189 = load [0 x i8]** %188
	%190 = bitcast [0 x i8]* %189 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %190)
	br label %L.35
L.35:
	call void @out_chr(i32 2, i8 58)
	%191 = load %type.TypeNode** %t
	%192 = getelementptr %type.TypeNode* %191, i32 0, i32 13
	%193 = load i8* %192
	%194 = load %target.TargetT** @target_Target
	%195 = getelementptr %target.TargetT* %194, i32 0, i32 2
	%196 = load i8* %195
	%197 = icmp ne i8 %193, %196
	br i1 %197, label %L.38, label %L.37
L.38:
	%198 = load %type.TypeNode** %t
	%199 = getelementptr %type.TypeNode* %198, i32 0, i32 13
	%200 = load i8* %199
	%201 = zext i8 %200 to i32
	%202 = getelementptr [3 x [0 x i8]*]* @type_bitorderstr, i32 0, i32 %201
	%203 = load [0 x i8]** %202
	%204 = bitcast [0 x i8]* %203 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %204)
	br label %L.37
L.37:
	call void @out_chr(i32 2, i8 58)
	%205 = load %type.TypeNode** %t
	%206 = getelementptr %type.TypeNode* %205, i32 0, i32 15
	%207 = load i8* %206
	%208 = icmp ne i8 %207, 0
	br i1 %208, label %L.40, label %L.39
L.40:
	%209 = load %type.TypeNode** %t
	%210 = getelementptr %type.TypeNode* %209, i32 0, i32 15
	%211 = load i8* %210
	%212 = zext i8 %211 to i32
	%213 = getelementptr [3 x [0 x i8]*]* @type_accessstr, i32 0, i32 %212
	%214 = load [0 x i8]** %213
	%215 = bitcast [0 x i8]* %214 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %215)
	br label %L.39
L.39:
	call void @out_chr(i32 2, i8 58)
	%216 = load %type.TypeNode** %t
	%217 = getelementptr %type.TypeNode* %216, i32 0, i32 17
	%218 = load i8* %217
	%219 = icmp ne i8 %218, 0
	br i1 %219, label %L.42, label %L.41
L.42:
	call void @out_chr(i32 2, i8 73)
	br label %L.41
L.41:
	%220 = load %type.TypeNode** %t
	%221 = getelementptr %type.TypeNode* %220, i32 0, i32 18
	%222 = load i8* %221
	%223 = icmp ne i8 %222, 0
	br i1 %223, label %L.44, label %L.43
L.44:
	call void @out_chr(i32 2, i8 79)
	br label %L.43
L.43:
	%224 = load %type.TypeNode** %t
	%225 = getelementptr %type.TypeNode* %224, i32 0, i32 20
	store i8 1, i8* %225
	%226 = load %type.TypeNode** %t
	%227 = getelementptr %type.TypeNode* %226, i32 0, i32 4
	%228 = load %symb.SymbNode** %227
	%229 = icmp ne %symb.SymbNode* %228, null
	br i1 %229, label %L.46, label %L.45
L.46:
	%230 = load %type.TypeNode** %t
	%231 = getelementptr %type.TypeNode* %230, i32 0, i32 4
	%232 = load %symb.SymbNode** %231
	store %symb.SymbNode* %232, %symb.SymbNode** %s
	%233 = getelementptr [13 x i8]* @.str499
	%234 = bitcast [13 x i8]* %233 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %234)
	br label %L.47
L.47:
	%235 = load %symb.SymbNode** %s
	call void @symb_DumpS(%symb.SymbNode* %235)
	%236 = load %symb.SymbNode** %s
	%237 = getelementptr %symb.SymbNode* %236, i32 0, i32 6
	%238 = load %symb.SymbNode** %237
	store %symb.SymbNode* %238, %symb.SymbNode** %s
	%239 = load %symb.SymbNode** %s
	%240 = icmp eq %symb.SymbNode* %239, null
	br i1 %240, label %L.48, label %L.49
L.49:
	call void @out_chr(i32 2, i8 9)
	br label %L.47
L.48:
	br label %L.45
L.45:
	br label %L.5
L.5:
	br label %L.1
L.1:
	br label %return
return:
	ret void
}
define void @type_DumpT(%type.TypeNode* %t.arg, i8 zeroext %full.arg) nounwind {
L.0:
	%t = alloca %type.TypeNode*
	%full = alloca i8
	store %type.TypeNode* %t.arg, %type.TypeNode** %t
	store i8 %full.arg, i8* %full
	%0 = load %type.TypeNode** %t
	%1 = load i8* %full
	call void @type_Dump2(%type.TypeNode* %0, i32 0, i8 %1)
	br label %return
return:
	ret void
}
@expr_skiplist = internal constant [4 x i8] [ i8 33, i8 37, i8 4, i8 0 ], align 1
define %ast.AstNode* @expr_ForceBoolean(%ast.AstNode* %tree.arg) nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%tree = alloca %ast.AstNode*
	store %ast.AstNode* %tree.arg, %ast.AstNode** %tree
	%zero = alloca %ast.AstNode*
	%0 = load %ast.AstNode** %tree
	%1 = getelementptr %ast.AstNode* %0, i32 0, i32 2
	%2 = load i8* %1
	%3 = icmp ugt i8 %2, 1
	br i1 %3, label %L.2, label %L.1
L.2:
	%4 = load %ast.AstNode** %tree
	%5 = getelementptr %ast.AstNode* %4, i32 0, i32 9
	%6 = load %type.TypeNode** %5
	%7 = call %ast.AstNode* @ast_Const(%type.TypeNode* %6, i64 0)
	store %ast.AstNode* %7, %ast.AstNode** %zero
	%8 = load %type.TypeNode** @type_booltype
	%9 = load %ast.AstNode** %tree
	%10 = load %ast.AstNode** %zero
	%11 = call %ast.AstNode* @ast_New2(i8 39, %type.TypeNode* %8, %ast.AstNode* %9, %ast.AstNode* %10)
	store %ast.AstNode* %11, %ast.AstNode** %tree
	%12 = load %ast.AstNode** %tree
	%13 = getelementptr %ast.AstNode* %12, i32 0, i32 1
	store i8 1, i8* %13
	%14 = load %ast.AstNode** %tree
	%15 = getelementptr %ast.AstNode* %14, i32 0, i32 2
	store i8 1, i8* %15
	br label %L.1
L.1:
	%16 = load %ast.AstNode** %tree
	store %ast.AstNode* %16, %ast.AstNode** %rv.0
	br label %return
return:
	%17 = load %ast.AstNode** %rv.0
	ret %ast.AstNode* %17
}
@expr_proplist = internal constant [5 x i8] [ i8 78, i8 79, i8 80, i8 81, i8 0 ]
define %ast.AstNode* @expr_Property(%type.TypeNode* %t.arg) nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%t = alloca %type.TypeNode*
	store %type.TypeNode* %t.arg, %type.TypeNode** %t
	%tree = alloca %ast.AstNode*
	%tok = alloca i8
	store %ast.AstNode* null, %ast.AstNode** %tree
	%0 = load i8* @lex_Token
	store i8 %0, i8* %tok
	%1 = load i8* %tok
	%2 = icmp eq i8 %1, 40
	br i1 %2, label %L.2, label %L.3
L.2:
	%3 = getelementptr [5 x i8]* @expr_proplist
	%4 = bitcast [5 x i8]* %3 to [0 x i8]*
	%5 = call i8 @lex_Keyword([0 x i8]* %4)
	store i8 %5, i8* %tok
	%6 = load i8* %tok
	%7 = zext i8 %6 to i32
	switch i32 %7, label %L.4 [
		i32 78, label %L.6
		i32 79, label %L.7
		i32 80, label %L.8
		i32 81, label %L.9
	]
L.6:
	%8 = load %type.TypeNode** %t
	%9 = load %type.TypeNode** %t
	%10 = getelementptr %type.TypeNode* %9, i32 0, i32 5
	%11 = load i64* %10
	%12 = call %ast.AstNode* @ast_Const(%type.TypeNode* %8, i64 %11)
	store %ast.AstNode* %12, %ast.AstNode** %tree
	br label %L.5
L.7:
	%13 = load %type.TypeNode** %t
	%14 = load %type.TypeNode** %t
	%15 = getelementptr %type.TypeNode* %14, i32 0, i32 6
	%16 = load i64* %15
	%17 = call %ast.AstNode* @ast_Const(%type.TypeNode* %13, i64 %16)
	store %ast.AstNode* %17, %ast.AstNode** %tree
	br label %L.5
L.8:
	%18 = load %type.TypeNode** @type_wordtype
	%19 = load %type.TypeNode** %t
	%20 = getelementptr %type.TypeNode* %19, i32 0, i32 7
	%21 = load i32* %20
	%22 = zext i32 %21 to i64
	%23 = call %ast.AstNode* @ast_Const(%type.TypeNode* %18, i64 %22)
	store %ast.AstNode* %23, %ast.AstNode** %tree
	br label %L.5
L.9:
	%24 = load %type.TypeNode** @type_wordtype
	%25 = load %type.TypeNode** %t
	%26 = getelementptr %type.TypeNode* %25, i32 0, i32 8
	%27 = load i32* %26
	%28 = load %target.TargetT** @target_Target
	%29 = getelementptr %target.TargetT* %28, i32 0, i32 3
	%30 = load i8* %29
	%31 = zext i8 %30 to i32
	%32 = udiv i32 %27, %31
	%33 = zext i32 %32 to i64
	%34 = call %ast.AstNode* @ast_Const(%type.TypeNode* %24, i64 %33)
	store %ast.AstNode* %34, %ast.AstNode** %tree
	br label %L.5
L.4:
	call void @lex_Error(i8 43)
	br label %L.5
L.5:
	br label %L.1
L.3:
	call void @lex_Error(i8 43)
	br label %L.1
L.1:
	%35 = call i8 @lex_Next()
	store i8 %35, i8* %tok
	%36 = load %ast.AstNode** %tree
	store %ast.AstNode* %36, %ast.AstNode** %rv.0
	br label %return
return:
	%37 = load %ast.AstNode** %rv.0
	ret %ast.AstNode* %37
}
@expr_strid = internal global i64 0, align 4
define %ast.AstNode* @expr_String() nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%tree = alloca %ast.AstNode*
	%t = alloca %type.TypeNode*
	%0 = call %type.TypeNode* @type_New(i8 5)
	store %type.TypeNode* %0, %type.TypeNode** %t
	%1 = load %type.TypeNode** @type_bytetype
	%2 = load %type.TypeNode** %t
	%3 = getelementptr %type.TypeNode* %2, i32 0, i32 0
	store %type.TypeNode* %1, %type.TypeNode** %3
	%4 = load %type.TypeNode** @type_wordtype
	%5 = load %type.TypeNode** %t
	%6 = getelementptr %type.TypeNode* %5, i32 0, i32 1
	store %type.TypeNode* %4, %type.TypeNode** %6
	%7 = load %type.TypeNode** %t
	%8 = getelementptr %type.TypeNode* %7, i32 0, i32 5
	store i64 0, i64* %8
	%9 = load i8* @lex_StringLen
	%10 = zext i8 %9 to i64
	%11 = load %type.TypeNode** %t
	%12 = getelementptr %type.TypeNode* %11, i32 0, i32 6
	store i64 %10, i64* %12
	%13 = load %type.TypeNode** %t
	%14 = call %ast.AstNode* @ast_New(i8 8, %type.TypeNode* %13)
	store %ast.AstNode* %14, %ast.AstNode** %tree
	%15 = load %ast.AstNode** %tree
	%16 = getelementptr %ast.AstNode* %15, i32 0, i32 1
	store i8 4, i8* %16
	%17 = getelementptr [128 x i8]* @lex_StringBuf
	%18 = bitcast [128 x i8]* %17 to [0 x i8]*
	%19 = load i8* @lex_StringLen
	%20 = zext i8 %19 to i32
	%21 = call [0 x i8]* @sys_memdup([0 x i8]* %18, i32 %20)
	%22 = bitcast [0 x i8]* %21 to %symb.SymbNode*
	%23 = load %ast.AstNode** %tree
	%24 = getelementptr %ast.AstNode* %23, i32 0, i32 10
	store %symb.SymbNode* %22, %symb.SymbNode** %24
	%25 = load i64* @expr_strid
	%26 = add i64 %25, 1
	store i64 %26, i64* @expr_strid
	%27 = load i64* @expr_strid
	%28 = load %ast.AstNode** %tree
	%29 = getelementptr %ast.AstNode* %28, i32 0, i32 8
	store i64 %27, i64* %29
	%30 = load %ast.AstNode** %tree
	store %ast.AstNode* %30, %ast.AstNode** %rv.0
	br label %return
return:
	%31 = load %ast.AstNode** %rv.0
	ret %ast.AstNode* %31
}
define %ast.AstNode* @expr_EnumConst(%type.TypeNode* %t.arg) nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%t = alloca %type.TypeNode*
	store %type.TypeNode* %t.arg, %type.TypeNode** %t
	%s = alloca %symb.SymbNode*
	%0 = load %type.TypeNode** %t
	%1 = getelementptr %type.TypeNode* %0, i32 0, i32 3
	%2 = load %symb.SymbNode** %1
	store %symb.SymbNode* %2, %symb.SymbNode** %s
	br label %L.1
L.1:
	%3 = load %symb.SymbNode** %s
	%4 = icmp ne %symb.SymbNode* %3, null
	%5 = xor i1 %4, true
	br i1 %5, label %L.2, label %L.3
L.3:
	%6 = load %symb.SymbNode** %s
	%7 = getelementptr %symb.SymbNode* %6, i32 0, i32 19
	%8 = getelementptr [0 x i8]* %7
	%9 = getelementptr [64 x i8]* @lex_Ident
	%10 = bitcast [64 x i8]* %9 to [0 x i8]*
	%11 = call i8 @zstr_eq([0 x i8]* %8, [0 x i8]* %10, i32 63)
	%12 = icmp ne i8 %11, 0
	br i1 %12, label %L.5, label %L.4
L.5:
	%13 = load %type.TypeNode** %t
	%14 = load %symb.SymbNode** %s
	%15 = getelementptr %symb.SymbNode* %14, i32 0, i32 7
	%16 = load i64* %15
	%17 = call %ast.AstNode* @ast_Const(%type.TypeNode* %13, i64 %16)
	store %ast.AstNode* %17, %ast.AstNode** %rv.0
	br label %return
L.4:
	%18 = load %symb.SymbNode** %s
	%19 = getelementptr %symb.SymbNode* %18, i32 0, i32 0
	%20 = load %symb.SymbNode** %19
	store %symb.SymbNode* %20, %symb.SymbNode** %s
	br label %L.1
L.2:
	%21 = getelementptr [64 x i8]* @lex_Ident
	%22 = bitcast [64 x i8]* %21 to [0 x i8]*
	call void @lex_ErrorI(i8 12, [0 x i8]* %22)
	store %ast.AstNode* null, %ast.AstNode** %rv.0
	br label %return
return:
	%23 = load %ast.AstNode** %rv.0
	ret %ast.AstNode* %23
}
define %ast.AstNode* @expr_Extend(%ast.AstNode* %tree.arg, i32 %size.arg) nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%tree = alloca %ast.AstNode*
	%size = alloca i32
	store %ast.AstNode* %tree.arg, %ast.AstNode** %tree
	store i32 %size.arg, i32* %size
	%0 = load %ast.AstNode** %tree
	%1 = getelementptr %ast.AstNode* %0, i32 0, i32 2
	%2 = load i8* %1
	%3 = zext i8 %2 to i32
	%4 = load i32* %size
	%5 = icmp ult i32 %3, %4
	br i1 %5, label %L.2, label %L.3
L.2:
	%6 = load %ast.AstNode** %tree
	%7 = getelementptr %ast.AstNode* %6, i32 0, i32 0
	%8 = load i8* %7
	%9 = icmp ne i8 %8, 7
	br i1 %9, label %L.5, label %L.4
L.5:
	%10 = load %ast.AstNode** %tree
	%11 = getelementptr %ast.AstNode* %10, i32 0, i32 1
	%12 = load i8* %11
	%13 = icmp eq i8 %12, 3
	br i1 %13, label %L.7, label %L.8
L.7:
	%14 = load %ast.AstNode** %tree
	%15 = getelementptr %ast.AstNode* %14, i32 0, i32 9
	%16 = load %type.TypeNode** %15
	%17 = load %ast.AstNode** %tree
	%18 = call %ast.AstNode* @ast_New1(i8 28, %type.TypeNode* %16, %ast.AstNode* %17)
	store %ast.AstNode* %18, %ast.AstNode** %tree
	br label %L.6
L.8:
	%19 = load %ast.AstNode** %tree
	%20 = getelementptr %ast.AstNode* %19, i32 0, i32 9
	%21 = load %type.TypeNode** %20
	%22 = load %ast.AstNode** %tree
	%23 = call %ast.AstNode* @ast_New1(i8 27, %type.TypeNode* %21, %ast.AstNode* %22)
	store %ast.AstNode* %23, %ast.AstNode** %tree
	br label %L.6
L.6:
	br label %L.4
L.4:
	%24 = load i32* %size
	%25 = trunc i32 %24 to i8
	%26 = load %ast.AstNode** %tree
	%27 = getelementptr %ast.AstNode* %26, i32 0, i32 2
	store i8 %25, i8* %27
	br label %L.1
L.3:
	%28 = load %ast.AstNode** %tree
	%29 = getelementptr %ast.AstNode* %28, i32 0, i32 2
	%30 = load i8* %29
	%31 = zext i8 %30 to i32
	%32 = load i32* %size
	%33 = icmp ugt i32 %31, %32
	br i1 %33, label %L.10, label %L.9
L.10:
	%34 = load %ast.AstNode** %tree
	%35 = getelementptr %ast.AstNode* %34, i32 0, i32 0
	%36 = load i8* %35
	%37 = icmp ne i8 %36, 7
	br i1 %37, label %L.12, label %L.11
L.12:
	%38 = load %ast.AstNode** %tree
	%39 = getelementptr %ast.AstNode* %38, i32 0, i32 9
	%40 = load %type.TypeNode** %39
	%41 = load %ast.AstNode** %tree
	%42 = call %ast.AstNode* @ast_New1(i8 29, %type.TypeNode* %40, %ast.AstNode* %41)
	store %ast.AstNode* %42, %ast.AstNode** %tree
	br label %L.11
L.11:
	%43 = load i32* %size
	%44 = trunc i32 %43 to i8
	%45 = load %ast.AstNode** %tree
	%46 = getelementptr %ast.AstNode* %45, i32 0, i32 2
	store i8 %44, i8* %46
	br label %L.9
L.9:
	br label %L.1
L.1:
	%47 = load %ast.AstNode** %tree
	store %ast.AstNode* %47, %ast.AstNode** %rv.0
	br label %return
return:
	%48 = load %ast.AstNode** %rv.0
	ret %ast.AstNode* %48
}
define %ast.AstNode* @expr_ExtendT(%ast.AstNode* %tree.arg, %type.TypeNode* %t.arg) nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%tree = alloca %ast.AstNode*
	%t = alloca %type.TypeNode*
	store %ast.AstNode* %tree.arg, %ast.AstNode** %tree
	store %type.TypeNode* %t.arg, %type.TypeNode** %t
	%0 = load %ast.AstNode** %tree
	%1 = load %type.TypeNode** %t
	%2 = getelementptr %type.TypeNode* %1, i32 0, i32 8
	%3 = load i32* %2
	%4 = call %ast.AstNode* @expr_Extend(%ast.AstNode* %0, i32 %3)
	store %ast.AstNode* %4, %ast.AstNode** %tree
	%5 = load %ast.AstNode** %tree
	store %ast.AstNode* %5, %ast.AstNode** %rv.0
	br label %return
return:
	%6 = load %ast.AstNode** %rv.0
	ret %ast.AstNode* %6
}
define %ast.AstNode* @expr_Cast(%ast.AstNode* %tree.arg, %type.TypeNode* %t.arg) nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%tree = alloca %ast.AstNode*
	%t = alloca %type.TypeNode*
	store %ast.AstNode* %tree.arg, %ast.AstNode** %tree
	store %type.TypeNode* %t.arg, %type.TypeNode** %t
	%0 = load %ast.AstNode** %tree
	%1 = icmp eq %ast.AstNode* %0, null
	br i1 %1, label %L.2, label %L.1
L.2:
	%2 = load %ast.AstNode** %tree
	store %ast.AstNode* %2, %ast.AstNode** %rv.0
	br label %return
L.1:
	%3 = load %type.TypeNode** %t
	%4 = getelementptr %type.TypeNode* %3, i32 0, i32 11
	%5 = load i8* %4
	%6 = zext i8 %5 to i32
	switch i32 %6, label %L.3 [
		i32 1, label %L.5
		i32 2, label %L.6
		i32 3, label %L.7
		i32 4, label %L.8
		i32 6, label %L.9
		i32 5, label %L.9
	]
L.5:
	%7 = load %ast.AstNode** %tree
	%8 = getelementptr %ast.AstNode* %7, i32 0, i32 1
	%9 = load i8* %8
	%10 = icmp eq i8 %9, 2
	br i1 %10, label %L.11, label %L.12
L.11:
	%11 = load %ast.AstNode** %tree
	%12 = load %type.TypeNode** %t
	%13 = call %ast.AstNode* @expr_ExtendT(%ast.AstNode* %11, %type.TypeNode* %12)
	store %ast.AstNode* %13, %ast.AstNode** %tree
	%14 = load %type.TypeNode** %t
	%15 = load %ast.AstNode** %tree
	%16 = getelementptr %ast.AstNode* %15, i32 0, i32 9
	store %type.TypeNode* %14, %type.TypeNode** %16
	%17 = load %type.TypeNode** %t
	%18 = getelementptr %type.TypeNode* %17, i32 0, i32 11
	%19 = load i8* %18
	%20 = load %ast.AstNode** %tree
	%21 = getelementptr %ast.AstNode* %20, i32 0, i32 1
	store i8 %19, i8* %21
	br label %L.10
L.12:
	call void @lex_Error(i8 40)
	br label %L.10
L.10:
	br label %L.4
L.6:
	%22 = load %ast.AstNode** %tree
	%23 = getelementptr %ast.AstNode* %22, i32 0, i32 1
	%24 = load i8* %23
	%25 = zext i8 %24 to i32
	switch i32 %25, label %L.13 [
		i32 1, label %L.15
		i32 2, label %L.15
		i32 3, label %L.15
		i32 4, label %L.16
		i32 6, label %L.17
		i32 5, label %L.17
	]
L.15:
	%26 = load %ast.AstNode** %tree
	%27 = load %type.TypeNode** %t
	%28 = call %ast.AstNode* @expr_ExtendT(%ast.AstNode* %26, %type.TypeNode* %27)
	store %ast.AstNode* %28, %ast.AstNode** %tree
	%29 = load %type.TypeNode** %t
	%30 = load %ast.AstNode** %tree
	%31 = getelementptr %ast.AstNode* %30, i32 0, i32 9
	store %type.TypeNode* %29, %type.TypeNode** %31
	%32 = load %type.TypeNode** %t
	%33 = getelementptr %type.TypeNode* %32, i32 0, i32 11
	%34 = load i8* %33
	%35 = load %ast.AstNode** %tree
	%36 = getelementptr %ast.AstNode* %35, i32 0, i32 1
	store i8 %34, i8* %36
	br label %L.14
L.16:
	%37 = load %type.TypeNode** %t
	%38 = load %ast.AstNode** %tree
	%39 = call %ast.AstNode* @ast_New1(i8 15, %type.TypeNode* %37, %ast.AstNode* %38)
	store %ast.AstNode* %39, %ast.AstNode** %tree
	%40 = load %type.TypeNode** %t
	%41 = getelementptr %type.TypeNode* %40, i32 0, i32 11
	%42 = load i8* %41
	%43 = load %ast.AstNode** %tree
	%44 = getelementptr %ast.AstNode* %43, i32 0, i32 1
	store i8 %42, i8* %44
	%45 = load %type.TypeNode** %t
	%46 = getelementptr %type.TypeNode* %45, i32 0, i32 7
	%47 = load i32* %46
	%48 = trunc i32 %47 to i8
	%49 = load %ast.AstNode** %tree
	%50 = getelementptr %ast.AstNode* %49, i32 0, i32 2
	store i8 %48, i8* %50
	br label %L.14
L.17:
	%51 = load %ast.AstNode** %tree
	%52 = getelementptr %ast.AstNode* %51, i32 0, i32 9
	%53 = load %type.TypeNode** %52
	%54 = getelementptr %type.TypeNode* %53, i32 0, i32 12
	%55 = load i8* %54
	%56 = icmp eq i8 %55, 2
	br i1 %56, label %L.18, label %L.19
L.18:
	%57 = load %ast.AstNode** %tree
	%58 = getelementptr %ast.AstNode* %57, i32 0, i32 2
	%59 = load i8* %58
	%60 = zext i8 %59 to i32
	%61 = load %type.TypeNode** %t
	%62 = getelementptr %type.TypeNode* %61, i32 0, i32 7
	%63 = load i32* %62
	%64 = icmp eq i32 %60, %63
	br label %L.19
L.19:
	%65 = phi i1 [ false, %L.17 ], [ %64, %L.18 ]
	br i1 %65, label %L.21, label %L.22
L.21:
	%66 = load %type.TypeNode** %t
	%67 = load %ast.AstNode** %tree
	%68 = getelementptr %ast.AstNode* %67, i32 0, i32 9
	store %type.TypeNode* %66, %type.TypeNode** %68
	%69 = load %type.TypeNode** %t
	%70 = getelementptr %type.TypeNode* %69, i32 0, i32 11
	%71 = load i8* %70
	%72 = load %ast.AstNode** %tree
	%73 = getelementptr %ast.AstNode* %72, i32 0, i32 1
	store i8 %71, i8* %73
	br label %L.20
L.22:
	call void @lex_Error(i8 40)
	br label %L.20
L.20:
	br label %L.14
L.13:
	call void @lex_Error(i8 40)
	br label %L.14
L.14:
	br label %L.4
L.7:
	%74 = load %ast.AstNode** %tree
	%75 = getelementptr %ast.AstNode* %74, i32 0, i32 1
	%76 = load i8* %75
	%77 = zext i8 %76 to i32
	switch i32 %77, label %L.23 [
		i32 2, label %L.25
		i32 3, label %L.25
	]
L.25:
	%78 = load %ast.AstNode** %tree
	%79 = load %type.TypeNode** %t
	%80 = call %ast.AstNode* @expr_ExtendT(%ast.AstNode* %78, %type.TypeNode* %79)
	store %ast.AstNode* %80, %ast.AstNode** %tree
	%81 = load %type.TypeNode** %t
	%82 = load %ast.AstNode** %tree
	%83 = getelementptr %ast.AstNode* %82, i32 0, i32 9
	store %type.TypeNode* %81, %type.TypeNode** %83
	%84 = load %type.TypeNode** %t
	%85 = getelementptr %type.TypeNode* %84, i32 0, i32 11
	%86 = load i8* %85
	%87 = load %ast.AstNode** %tree
	%88 = getelementptr %ast.AstNode* %87, i32 0, i32 1
	store i8 %86, i8* %88
	br label %L.24
L.23:
	call void @lex_Error(i8 40)
	br label %L.24
L.24:
	br label %L.4
L.8:
	%89 = load %ast.AstNode** %tree
	%90 = getelementptr %ast.AstNode* %89, i32 0, i32 1
	%91 = load i8* %90
	%92 = zext i8 %91 to i32
	switch i32 %92, label %L.26 [
		i32 4, label %L.28
		i32 2, label %L.29
		i32 5, label %L.30
	]
L.28:
	%93 = load %type.TypeNode** %t
	%94 = load %ast.AstNode** %tree
	%95 = call %ast.AstNode* @ast_New1(i8 15, %type.TypeNode* %93, %ast.AstNode* %94)
	store %ast.AstNode* %95, %ast.AstNode** %tree
	%96 = load %type.TypeNode** %t
	%97 = getelementptr %type.TypeNode* %96, i32 0, i32 0
	%98 = load %type.TypeNode** %97
	%99 = load %ast.AstNode** %tree
	%100 = getelementptr %ast.AstNode* %99, i32 0, i32 9
	store %type.TypeNode* %98, %type.TypeNode** %100
	%101 = load %type.TypeNode** %t
	%102 = getelementptr %type.TypeNode* %101, i32 0, i32 11
	%103 = load i8* %102
	%104 = load %ast.AstNode** %tree
	%105 = getelementptr %ast.AstNode* %104, i32 0, i32 1
	store i8 %103, i8* %105
	%106 = load %type.TypeNode** %t
	%107 = getelementptr %type.TypeNode* %106, i32 0, i32 7
	%108 = load i32* %107
	%109 = trunc i32 %108 to i8
	%110 = load %ast.AstNode** %tree
	%111 = getelementptr %ast.AstNode* %110, i32 0, i32 2
	store i8 %109, i8* %111
	br label %L.27
L.29:
	%112 = load %type.TypeNode** %t
	%113 = load %ast.AstNode** %tree
	%114 = call %ast.AstNode* @ast_New1(i8 15, %type.TypeNode* %112, %ast.AstNode* %113)
	store %ast.AstNode* %114, %ast.AstNode** %tree
	%115 = load %type.TypeNode** %t
	%116 = getelementptr %type.TypeNode* %115, i32 0, i32 0
	%117 = load %type.TypeNode** %116
	%118 = load %ast.AstNode** %tree
	%119 = getelementptr %ast.AstNode* %118, i32 0, i32 9
	store %type.TypeNode* %117, %type.TypeNode** %119
	%120 = load %type.TypeNode** %t
	%121 = getelementptr %type.TypeNode* %120, i32 0, i32 11
	%122 = load i8* %121
	%123 = load %ast.AstNode** %tree
	%124 = getelementptr %ast.AstNode* %123, i32 0, i32 1
	store i8 %122, i8* %124
	%125 = load %type.TypeNode** %t
	%126 = getelementptr %type.TypeNode* %125, i32 0, i32 7
	%127 = load i32* %126
	%128 = trunc i32 %127 to i8
	%129 = load %ast.AstNode** %tree
	%130 = getelementptr %ast.AstNode* %129, i32 0, i32 2
	store i8 %128, i8* %130
	br label %L.27
L.30:
	%131 = load %ast.AstNode** %tree
	%132 = getelementptr %ast.AstNode* %131, i32 0, i32 0
	%133 = load i8* %132
	%134 = icmp eq i8 %133, 25
	br i1 %134, label %L.32, label %L.31
L.32:
	%135 = load %ast.AstNode** %tree
	%136 = getelementptr %ast.AstNode* %135, i32 0, i32 11
	%137 = getelementptr [0 x %ast.AstNode*]* %136, i32 0, i32 0
	%138 = load %ast.AstNode** %137
	store %ast.AstNode* %138, %ast.AstNode** %tree
	br label %L.31
L.31:
	%139 = load %ast.AstNode** %tree
	%140 = getelementptr %ast.AstNode* %139, i32 0, i32 0
	%141 = load i8* %140
	%142 = icmp eq i8 %141, 18
	br i1 %142, label %L.33, label %L.34
L.33:
	%143 = load %ast.AstNode** %tree
	%144 = getelementptr %ast.AstNode* %143, i32 0, i32 9
	%145 = load %type.TypeNode** %144
	%146 = getelementptr %type.TypeNode* %145, i32 0, i32 0
	%147 = load %type.TypeNode** %146
	%148 = load %type.TypeNode** @type_bytetype
	%149 = icmp eq %type.TypeNode* %147, %148
	br label %L.34
L.34:
	%150 = phi i1 [ false, %L.31 ], [ %149, %L.33 ]
	br i1 %150, label %L.36, label %L.37
L.36:
	%151 = load %type.TypeNode** %t
	%152 = load %ast.AstNode** %tree
	%153 = call %ast.AstNode* @ast_New1(i8 15, %type.TypeNode* %151, %ast.AstNode* %152)
	store %ast.AstNode* %153, %ast.AstNode** %tree
	%154 = load %type.TypeNode** %t
	%155 = getelementptr %type.TypeNode* %154, i32 0, i32 0
	%156 = load %type.TypeNode** %155
	%157 = load %ast.AstNode** %tree
	%158 = getelementptr %ast.AstNode* %157, i32 0, i32 9
	store %type.TypeNode* %156, %type.TypeNode** %158
	%159 = load %type.TypeNode** %t
	%160 = getelementptr %type.TypeNode* %159, i32 0, i32 11
	%161 = load i8* %160
	%162 = load %ast.AstNode** %tree
	%163 = getelementptr %ast.AstNode* %162, i32 0, i32 1
	store i8 %161, i8* %163
	%164 = load %type.TypeNode** %t
	%165 = getelementptr %type.TypeNode* %164, i32 0, i32 7
	%166 = load i32* %165
	%167 = trunc i32 %166 to i8
	%168 = load %ast.AstNode** %tree
	%169 = getelementptr %ast.AstNode* %168, i32 0, i32 2
	store i8 %167, i8* %169
	br label %L.35
L.37:
	call void @lex_Error(i8 40)
	br label %L.35
L.35:
	br label %L.27
L.26:
	call void @lex_Error(i8 40)
	br label %L.27
L.27:
	br label %L.4
L.9:
	%170 = load %type.TypeNode** %t
	%171 = getelementptr %type.TypeNode* %170, i32 0, i32 12
	%172 = load i8* %171
	%173 = icmp eq i8 %172, 2
	br i1 %173, label %L.40, label %L.41
L.40:
	%174 = load %ast.AstNode** %tree
	%175 = getelementptr %ast.AstNode* %174, i32 0, i32 1
	%176 = load i8* %175
	%177 = icmp eq i8 %176, 2
	br label %L.41
L.41:
	%178 = phi i1 [ false, %L.9 ], [ %177, %L.40 ]
	br i1 %178, label %L.38, label %L.39
L.38:
	%179 = load %ast.AstNode** %tree
	%180 = getelementptr %ast.AstNode* %179, i32 0, i32 2
	%181 = load i8* %180
	%182 = zext i8 %181 to i32
	%183 = load %type.TypeNode** %t
	%184 = getelementptr %type.TypeNode* %183, i32 0, i32 7
	%185 = load i32* %184
	%186 = icmp eq i32 %182, %185
	br label %L.39
L.39:
	%187 = phi i1 [ false, %L.41 ], [ %186, %L.38 ]
	br i1 %187, label %L.43, label %L.44
L.43:
	%188 = load %type.TypeNode** %t
	%189 = load %ast.AstNode** %tree
	%190 = getelementptr %ast.AstNode* %189, i32 0, i32 9
	store %type.TypeNode* %188, %type.TypeNode** %190
	%191 = load %type.TypeNode** %t
	%192 = getelementptr %type.TypeNode* %191, i32 0, i32 11
	%193 = load i8* %192
	%194 = load %ast.AstNode** %tree
	%195 = getelementptr %ast.AstNode* %194, i32 0, i32 1
	store i8 %193, i8* %195
	br label %L.42
L.44:
	call void @lex_Error(i8 40)
	br label %L.42
L.42:
	br label %L.4
L.3:
	br label %L.4
L.4:
	%196 = load %ast.AstNode** %tree
	store %ast.AstNode* %196, %ast.AstNode** %rv.0
	br label %return
return:
	%197 = load %ast.AstNode** %rv.0
	ret %ast.AstNode* %197
}
define %ast.AstNode* @expr_ArrayPack(%type.TypeNode* %t.arg, %ast.AstNode* %intree.arg) nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%t = alloca %type.TypeNode*
	%intree = alloca %ast.AstNode*
	store %type.TypeNode* %t.arg, %type.TypeNode** %t
	store %ast.AstNode* %intree.arg, %ast.AstNode** %intree
	%offs = alloca i32
	%tsize = alloca i32
	%fsize = alloca i32
	%i = alloca i16
	%tree = alloca %ast.AstNode*
	%vpart = alloca %ast.AstNode*
	%node = alloca %ast.AstNode*
	%cpart = alloca i64
	%bt = alloca %type.TypeNode*
	store %ast.AstNode* null, %ast.AstNode** %vpart
	store i64 0, i64* %cpart
	%0 = load %ast.AstNode** %intree
	%1 = getelementptr %ast.AstNode* %0, i32 0, i32 0
	%2 = load i8* %1
	%3 = icmp ne i8 %2, 14
	br i1 %3, label %L.2, label %L.1
L.2:
	call void @lex_Error(i8 63)
	%4 = load %ast.AstNode** %tree
	store %ast.AstNode* %4, %ast.AstNode** %rv.0
	br label %return
L.1:
	%5 = load %type.TypeNode** %t
	%6 = getelementptr %type.TypeNode* %5, i32 0, i32 8
	%7 = load i32* %6
	store i32 %7, i32* %tsize
	%8 = load %type.TypeNode** %t
	%9 = getelementptr %type.TypeNode* %8, i32 0, i32 0
	%10 = load %type.TypeNode** %9
	store %type.TypeNode* %10, %type.TypeNode** %bt
	%11 = load %type.TypeNode** %bt
	%12 = getelementptr %type.TypeNode* %11, i32 0, i32 7
	%13 = load i32* %12
	store i32 %13, i32* %fsize
	%14 = load %type.TypeNode** %t
	%15 = getelementptr %type.TypeNode* %14, i32 0, i32 13
	%16 = load i8* %15
	%17 = icmp eq i8 %16, 1
	br i1 %17, label %L.4, label %L.5
L.4:
	%18 = load i32* %tsize
	store i32 %18, i32* %offs
	br label %L.3
L.5:
	store i32 0, i32* %offs
	br label %L.3
L.3:
	store i16 0, i16* %i
	br label %L.6
L.6:
	%19 = load i16* %i
	%20 = load %ast.AstNode** %intree
	%21 = getelementptr %ast.AstNode* %20, i32 0, i32 5
	%22 = load i16* %21
	%23 = icmp ult i16 %19, %22
	%24 = xor i1 %23, true
	br i1 %24, label %L.7, label %L.8
L.8:
	%25 = load %type.TypeNode** %t
	%26 = getelementptr %type.TypeNode* %25, i32 0, i32 13
	%27 = load i8* %26
	%28 = icmp eq i8 %27, 1
	br i1 %28, label %L.10, label %L.9
L.10:
	%29 = load i32* %offs
	%30 = load i32* %fsize
	%31 = sub i32 %29, %30
	store i32 %31, i32* %offs
	br label %L.9
L.9:
	%32 = load %ast.AstNode** %intree
	%33 = getelementptr %ast.AstNode* %32, i32 0, i32 11
	%34 = load i16* %i
	%35 = zext i16 %34 to i32
	%36 = getelementptr [0 x %ast.AstNode*]* %33, i32 0, i32 %35
	%37 = load %ast.AstNode** %36
	store %ast.AstNode* %37, %ast.AstNode** %node
	%38 = load %ast.AstNode** %node
	%39 = getelementptr %ast.AstNode* %38, i32 0, i32 0
	%40 = load i8* %39
	%41 = icmp eq i8 %40, 7
	br i1 %41, label %L.12, label %L.13
L.12:
	%42 = load i64* %cpart
	%43 = load %ast.AstNode** %node
	%44 = getelementptr %ast.AstNode* %43, i32 0, i32 8
	%45 = load i64* %44
	%46 = load i32* %offs
	%47 = zext i32 %46 to i64
	%48 = shl i64 %45, %47
	%49 = or i64 %42, %48
	store i64 %49, i64* %cpart
	br label %L.11
L.13:
	%50 = load %ast.AstNode** %node
	%51 = load i32* %tsize
	%52 = call %ast.AstNode* @expr_Extend(%ast.AstNode* %50, i32 %51)
	store %ast.AstNode* %52, %ast.AstNode** %node
	%53 = load %type.TypeNode** %bt
	%54 = load %ast.AstNode** %node
	%55 = load %type.TypeNode** @type_wordtype
	%56 = load i32* %offs
	%57 = zext i32 %56 to i64
	%58 = call %ast.AstNode* @ast_Const(%type.TypeNode* %55, i64 %57)
	%59 = call %ast.AstNode* @ast_New2(i8 52, %type.TypeNode* %53, %ast.AstNode* %54, %ast.AstNode* %58)
	store %ast.AstNode* %59, %ast.AstNode** %node
	%60 = load %ast.AstNode** %vpart
	%61 = icmp eq %ast.AstNode* %60, null
	br i1 %61, label %L.15, label %L.16
L.15:
	%62 = load %ast.AstNode** %node
	store %ast.AstNode* %62, %ast.AstNode** %vpart
	br label %L.14
L.16:
	%63 = load %type.TypeNode** %bt
	%64 = load %ast.AstNode** %vpart
	%65 = load %ast.AstNode** %node
	%66 = call %ast.AstNode* @ast_New2(i8 57, %type.TypeNode* %63, %ast.AstNode* %64, %ast.AstNode* %65)
	store %ast.AstNode* %66, %ast.AstNode** %vpart
	br label %L.14
L.14:
	br label %L.11
L.11:
	%67 = load %type.TypeNode** %t
	%68 = getelementptr %type.TypeNode* %67, i32 0, i32 13
	%69 = load i8* %68
	%70 = icmp ne i8 %69, 1
	br i1 %70, label %L.18, label %L.17
L.18:
	%71 = load i32* %offs
	%72 = load i32* %fsize
	%73 = add i32 %71, %72
	store i32 %73, i32* %offs
	br label %L.17
L.17:
	%74 = load i16* %i
	%75 = add i16 %74, 1
	store i16 %75, i16* %i
	br label %L.6
L.7:
	%76 = load %type.TypeNode** @type_wordtype
	%77 = load i64* %cpart
	%78 = call %ast.AstNode* @ast_Const(%type.TypeNode* %76, i64 %77)
	%79 = load i32* %tsize
	%80 = call %ast.AstNode* @expr_Extend(%ast.AstNode* %78, i32 %79)
	store %ast.AstNode* %80, %ast.AstNode** %tree
	%81 = load %ast.AstNode** %vpart
	%82 = icmp ne %ast.AstNode* %81, null
	br i1 %82, label %L.20, label %L.19
L.20:
	%83 = load %type.TypeNode** @type_wordtype
	%84 = load %ast.AstNode** %tree
	%85 = load %ast.AstNode** %vpart
	%86 = call %ast.AstNode* @ast_New2(i8 57, %type.TypeNode* %83, %ast.AstNode* %84, %ast.AstNode* %85)
	store %ast.AstNode* %86, %ast.AstNode** %tree
	br label %L.19
L.19:
	%87 = load %type.TypeNode** %t
	%88 = load %ast.AstNode** %tree
	%89 = getelementptr %ast.AstNode* %88, i32 0, i32 9
	store %type.TypeNode* %87, %type.TypeNode** %89
	%90 = load %ast.AstNode** %tree
	%91 = getelementptr %ast.AstNode* %90, i32 0, i32 1
	store i8 5, i8* %91
	%92 = load %ast.AstNode** %tree
	store %ast.AstNode* %92, %ast.AstNode** %rv.0
	br label %return
return:
	%93 = load %ast.AstNode** %rv.0
	ret %ast.AstNode* %93
}
define %ast.AstNode* @expr_ArrayConst(%type.TypeNode* %t.arg) nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%t = alloca %type.TypeNode*
	store %type.TypeNode* %t.arg, %type.TypeNode** %t
	%tree = alloca %ast.AstNode*
	%stree = alloca %ast.AstNode*
	%i = alloca i16
	%m = alloca i16
	%n = alloca i16
	%tok = alloca i8
	%once = alloca i8
	store %ast.AstNode* null, %ast.AstNode** %tree
	%0 = load i8* @lex_Token
	store i8 %0, i8* %tok
	%1 = load i8* %tok
	%2 = icmp eq i8 %1, 36
	br i1 %2, label %L.2, label %L.3
L.2:
	%3 = load %type.TypeNode** %t
	%4 = call %ast.AstNode* @ast_New(i8 14, %type.TypeNode* %3)
	store %ast.AstNode* %4, %ast.AstNode** %tree
	%5 = load i64* @expr_strid
	%6 = add i64 %5, 1
	store i64 %6, i64* @expr_strid
	%7 = load i64* @expr_strid
	%8 = load %ast.AstNode** %tree
	%9 = getelementptr %ast.AstNode* %8, i32 0, i32 8
	store i64 %7, i64* %9
	store i8 0, i8* %once
	%10 = load %type.TypeNode** %t
	%11 = getelementptr %type.TypeNode* %10, i32 0, i32 6
	%12 = load i64* %11
	%13 = trunc i64 %12 to i16
	store i16 %13, i16* %n
	%14 = load %type.TypeNode** %t
	%15 = getelementptr %type.TypeNode* %14, i32 0, i32 16
	%16 = load i8* %15
	%17 = icmp ne i8 %16, 0
	br i1 %17, label %L.5, label %L.4
L.5:
	store i16 0, i16* %n
	br label %L.4
L.4:
	store i16 0, i16* %i
	store i16 0, i16* %m
	br label %L.6
L.6:
	%18 = call i8 @lex_Next()
	store i8 %18, i8* %tok
	%19 = load i8* %tok
	%20 = icmp eq i8 %19, 34
	br i1 %20, label %L.9, label %L.8
L.9:
	%21 = call i8 @lex_Next()
	store i8 %21, i8* %tok
	%22 = load %type.TypeNode** %t
	%23 = getelementptr %type.TypeNode* %22, i32 0, i32 1
	%24 = load %type.TypeNode** %23
	%25 = call i64 @expr_ConstScalar(%type.TypeNode* %24)
	%26 = trunc i64 %25 to i16
	store i16 %26, i16* %i
	%27 = call i8 @lex_Expect(i8 35)
	store i8 %27, i8* %tok
	%28 = call i8 @lex_Expect(i8 9)
	store i8 %28, i8* %tok
	br label %L.8
L.8:
	%29 = load %type.TypeNode** %t
	%30 = getelementptr %type.TypeNode* %29, i32 0, i32 0
	%31 = load %type.TypeNode** %30
	%32 = call %ast.AstNode* @expr_Const(%type.TypeNode* %31)
	store %ast.AstNode* %32, %ast.AstNode** %stree
	%33 = load i16* %n
	%34 = icmp eq i16 %33, 0
	br i1 %34, label %L.11, label %L.10
L.10:
	%35 = load i16* %i
	%36 = load i16* %n
	%37 = icmp ult i16 %35, %36
	br label %L.11
L.11:
	%38 = phi i1 [ true, %L.8 ], [ %37, %L.10 ]
	br i1 %38, label %L.13, label %L.14
L.13:
	%39 = load %ast.AstNode** %tree
	%40 = load i16* %i
	%41 = load %ast.AstNode** %stree
	%42 = call %ast.AstNode* @ast_ChildIndexed(%ast.AstNode* %39, i16 %40, %ast.AstNode* %41)
	store %ast.AstNode* %42, %ast.AstNode** %tree
	%43 = load i16* %i
	%44 = add i16 %43, 1
	store i16 %44, i16* %i
	%45 = load i16* %i
	%46 = load i16* %m
	%47 = icmp ugt i16 %45, %46
	br i1 %47, label %L.16, label %L.15
L.16:
	%48 = load i16* %i
	store i16 %48, i16* %m
	br label %L.15
L.15:
	br label %L.12
L.14:
	%49 = load i8* %once
	%50 = icmp ne i8 %49, 0
	%51 = xor i1 %50, true
	br i1 %51, label %L.18, label %L.17
L.18:
	store i8 1, i8* %once
	call void @lex_Error(i8 58)
	br label %L.17
L.17:
	br label %L.12
L.12:
	%52 = load i8* @lex_Token
	store i8 %52, i8* %tok
	%53 = load i8* %tok
	%54 = icmp ne i8 %53, 5
	br i1 %54, label %L.7, label %L.19
L.19:
	br label %L.6
L.7:
	%55 = call i8 @lex_Expect(i8 37)
	store i8 %55, i8* %tok
	%56 = load i16* %n
	%57 = icmp eq i16 %56, 0
	br i1 %57, label %L.21, label %L.20
L.21:
	%nt = alloca %type.TypeNode*
	%58 = load i16* %m
	store i16 %58, i16* %n
	%59 = call %type.TypeNode* @type_New(i8 5)
	store %type.TypeNode* %59, %type.TypeNode** %nt
	%60 = load %type.TypeNode** %t
	%61 = getelementptr %type.TypeNode* %60, i32 0, i32 0
	%62 = load %type.TypeNode** %61
	%63 = load %type.TypeNode** %nt
	%64 = getelementptr %type.TypeNode* %63, i32 0, i32 0
	store %type.TypeNode* %62, %type.TypeNode** %64
	%65 = load %type.TypeNode** %t
	%66 = getelementptr %type.TypeNode* %65, i32 0, i32 1
	%67 = load %type.TypeNode** %66
	%68 = load %type.TypeNode** %nt
	%69 = getelementptr %type.TypeNode* %68, i32 0, i32 1
	store %type.TypeNode* %67, %type.TypeNode** %69
	%70 = load i16* %n
	%71 = zext i16 %70 to i64
	%72 = load %type.TypeNode** %nt
	%73 = getelementptr %type.TypeNode* %72, i32 0, i32 6
	store i64 %71, i64* %73
	%74 = load %type.TypeNode** %nt
	store %type.TypeNode* %74, %type.TypeNode** %t
	br label %L.20
L.20:
	store i16 0, i16* %i
	br label %L.22
L.22:
	%75 = load i16* %i
	%76 = load i16* %m
	%77 = icmp ult i16 %75, %76
	%78 = xor i1 %77, true
	br i1 %78, label %L.23, label %L.24
L.24:
	%79 = load %ast.AstNode** %tree
	%80 = getelementptr %ast.AstNode* %79, i32 0, i32 11
	%81 = load i16* %i
	%82 = zext i16 %81 to i32
	%83 = getelementptr [0 x %ast.AstNode*]* %80, i32 0, i32 %82
	%84 = load %ast.AstNode** %83
	%85 = icmp eq %ast.AstNode* %84, null
	br i1 %85, label %L.26, label %L.25
L.26:
	%86 = load %type.TypeNode** %t
	%87 = getelementptr %type.TypeNode* %86, i32 0, i32 0
	%88 = load %type.TypeNode** %87
	%89 = call %ast.AstNode* @ast_Const(%type.TypeNode* %88, i64 0)
	%90 = load %ast.AstNode** %tree
	%91 = getelementptr %ast.AstNode* %90, i32 0, i32 11
	%92 = load i16* %i
	%93 = zext i16 %92 to i32
	%94 = getelementptr [0 x %ast.AstNode*]* %91, i32 0, i32 %93
	store %ast.AstNode* %89, %ast.AstNode** %94
	br label %L.25
L.25:
	%95 = load i16* %i
	%96 = add i16 %95, 1
	store i16 %96, i16* %i
	br label %L.22
L.23:
	br label %L.27
L.27:
	%97 = load i16* %i
	%98 = load i16* %n
	%99 = icmp ult i16 %97, %98
	%100 = xor i1 %99, true
	br i1 %100, label %L.28, label %L.29
L.29:
	%101 = load %ast.AstNode** %tree
	%102 = load i16* %i
	%103 = load %type.TypeNode** %t
	%104 = getelementptr %type.TypeNode* %103, i32 0, i32 0
	%105 = load %type.TypeNode** %104
	%106 = call %ast.AstNode* @ast_Const(%type.TypeNode* %105, i64 0)
	%107 = call %ast.AstNode* @ast_ChildIndexed(%ast.AstNode* %101, i16 %102, %ast.AstNode* %106)
	store %ast.AstNode* %107, %ast.AstNode** %tree
	%108 = load i16* %i
	%109 = add i16 %108, 1
	store i16 %109, i16* %i
	br label %L.27
L.28:
	%110 = load %type.TypeNode** %t
	%111 = load %ast.AstNode** %tree
	%112 = getelementptr %ast.AstNode* %111, i32 0, i32 9
	store %type.TypeNode* %110, %type.TypeNode** %112
	%113 = load %type.TypeNode** %t
	%114 = getelementptr %type.TypeNode* %113, i32 0, i32 12
	%115 = load i8* %114
	%116 = icmp eq i8 %115, 2
	br i1 %116, label %L.31, label %L.30
L.31:
	%117 = load %type.TypeNode** %t
	%118 = load %ast.AstNode** %tree
	%119 = call %ast.AstNode* @expr_ArrayPack(%type.TypeNode* %117, %ast.AstNode* %118)
	store %ast.AstNode* %119, %ast.AstNode** %tree
	br label %L.30
L.30:
	br label %L.1
L.3:
	%120 = load i8* %tok
	%121 = icmp eq i8 %120, 39
	br i1 %121, label %L.33, label %L.34
L.33:
	%122 = call %ast.AstNode* @expr_String()
	store %ast.AstNode* %122, %ast.AstNode** %tree
	%123 = load %ast.AstNode** %tree
	%124 = getelementptr %ast.AstNode* %123, i32 0, i32 1
	store i8 4, i8* %124
	%125 = call i8 @lex_Next()
	store i8 %125, i8* %tok
	br label %L.32
L.34:
	call void @lex_ErrorT(i8 10, i8 36)
	br label %L.32
L.32:
	br label %L.1
L.1:
	%126 = load %ast.AstNode** %tree
	store %ast.AstNode* %126, %ast.AstNode** %rv.0
	br label %return
return:
	%127 = load %ast.AstNode** %rv.0
	ret %ast.AstNode* %127
}
define %ast.AstNode* @expr_RecordPack(%type.TypeNode* %t.arg, %ast.AstNode* %intree.arg) nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%t = alloca %type.TypeNode*
	%intree = alloca %ast.AstNode*
	store %type.TypeNode* %t.arg, %type.TypeNode** %t
	store %ast.AstNode* %intree.arg, %ast.AstNode** %intree
	%offs = alloca i32
	%tsize = alloca i32
	%fsize = alloca i32
	%f = alloca %symb.SymbNode*
	%i = alloca i16
	%tree = alloca %ast.AstNode*
	%vpart = alloca %ast.AstNode*
	%node = alloca %ast.AstNode*
	%cpart = alloca i64
	%ft = alloca %type.TypeNode*
	store %ast.AstNode* null, %ast.AstNode** %vpart
	store i64 0, i64* %cpart
	%0 = load %ast.AstNode** %intree
	%1 = getelementptr %ast.AstNode* %0, i32 0, i32 0
	%2 = load i8* %1
	%3 = icmp ne i8 %2, 14
	br i1 %3, label %L.2, label %L.1
L.2:
	call void @lex_Error(i8 63)
	%4 = load %ast.AstNode** %tree
	store %ast.AstNode* %4, %ast.AstNode** %rv.0
	br label %return
L.1:
	%5 = load %type.TypeNode** %t
	%6 = getelementptr %type.TypeNode* %5, i32 0, i32 8
	%7 = load i32* %6
	store i32 %7, i32* %tsize
	%8 = load %type.TypeNode** %t
	%9 = getelementptr %type.TypeNode* %8, i32 0, i32 3
	%10 = load %symb.SymbNode** %9
	store %symb.SymbNode* %10, %symb.SymbNode** %f
	%11 = load %type.TypeNode** %t
	%12 = getelementptr %type.TypeNode* %11, i32 0, i32 13
	%13 = load i8* %12
	%14 = icmp eq i8 %13, 1
	br i1 %14, label %L.4, label %L.5
L.4:
	%15 = load i32* %tsize
	store i32 %15, i32* %offs
	br label %L.3
L.5:
	store i32 0, i32* %offs
	br label %L.3
L.3:
	store i16 0, i16* %i
	br label %L.6
L.6:
	%16 = load %symb.SymbNode** %f
	%17 = icmp ne %symb.SymbNode* %16, null
	%18 = xor i1 %17, true
	br i1 %18, label %L.7, label %L.8
L.8:
	%19 = load %symb.SymbNode** %f
	%20 = getelementptr %symb.SymbNode* %19, i32 0, i32 1
	%21 = load %type.TypeNode** %20
	%22 = icmp ne %type.TypeNode* %21, null
	br i1 %22, label %L.10, label %L.9
L.10:
	%23 = load %symb.SymbNode** %f
	%24 = getelementptr %symb.SymbNode* %23, i32 0, i32 1
	%25 = load %type.TypeNode** %24
	store %type.TypeNode* %25, %type.TypeNode** %ft
	%26 = load %type.TypeNode** %ft
	%27 = getelementptr %type.TypeNode* %26, i32 0, i32 7
	%28 = load i32* %27
	store i32 %28, i32* %fsize
	%29 = load %type.TypeNode** %t
	%30 = getelementptr %type.TypeNode* %29, i32 0, i32 13
	%31 = load i8* %30
	%32 = icmp eq i8 %31, 1
	br i1 %32, label %L.12, label %L.11
L.12:
	%33 = load i32* %offs
	%34 = load i32* %fsize
	%35 = sub i32 %33, %34
	store i32 %35, i32* %offs
	br label %L.11
L.11:
	%36 = load i16* %i
	%37 = load %ast.AstNode** %intree
	%38 = getelementptr %ast.AstNode* %37, i32 0, i32 5
	%39 = load i16* %38
	%40 = icmp uge i16 %36, %39
	br i1 %40, label %L.14, label %L.13
L.14:
	call void @lex_Error(i8 62)
	%41 = load %ast.AstNode** %tree
	store %ast.AstNode* %41, %ast.AstNode** %rv.0
	br label %return
L.13:
	%42 = load %ast.AstNode** %intree
	%43 = getelementptr %ast.AstNode* %42, i32 0, i32 11
	%44 = load i16* %i
	%45 = zext i16 %44 to i32
	%46 = getelementptr [0 x %ast.AstNode*]* %43, i32 0, i32 %45
	%47 = load %ast.AstNode** %46
	store %ast.AstNode* %47, %ast.AstNode** %node
	%48 = load %ast.AstNode** %node
	%49 = getelementptr %ast.AstNode* %48, i32 0, i32 0
	%50 = load i8* %49
	%51 = icmp eq i8 %50, 7
	br i1 %51, label %L.16, label %L.17
L.16:
	%52 = load i64* %cpart
	%53 = load %ast.AstNode** %node
	%54 = getelementptr %ast.AstNode* %53, i32 0, i32 8
	%55 = load i64* %54
	%56 = load i32* %offs
	%57 = zext i32 %56 to i64
	%58 = shl i64 %55, %57
	%59 = or i64 %52, %58
	store i64 %59, i64* %cpart
	br label %L.15
L.17:
	%60 = load %ast.AstNode** %node
	%61 = load i32* %tsize
	%62 = call %ast.AstNode* @expr_Extend(%ast.AstNode* %60, i32 %61)
	store %ast.AstNode* %62, %ast.AstNode** %node
	%63 = load %type.TypeNode** %ft
	%64 = load %ast.AstNode** %node
	%65 = load %type.TypeNode** @type_wordtype
	%66 = load i32* %offs
	%67 = zext i32 %66 to i64
	%68 = call %ast.AstNode* @ast_Const(%type.TypeNode* %65, i64 %67)
	%69 = call %ast.AstNode* @ast_New2(i8 52, %type.TypeNode* %63, %ast.AstNode* %64, %ast.AstNode* %68)
	store %ast.AstNode* %69, %ast.AstNode** %node
	%70 = load %ast.AstNode** %vpart
	%71 = icmp eq %ast.AstNode* %70, null
	br i1 %71, label %L.19, label %L.20
L.19:
	%72 = load %ast.AstNode** %node
	store %ast.AstNode* %72, %ast.AstNode** %vpart
	br label %L.18
L.20:
	%73 = load %type.TypeNode** %ft
	%74 = load %ast.AstNode** %vpart
	%75 = load %ast.AstNode** %node
	%76 = call %ast.AstNode* @ast_New2(i8 57, %type.TypeNode* %73, %ast.AstNode* %74, %ast.AstNode* %75)
	store %ast.AstNode* %76, %ast.AstNode** %vpart
	br label %L.18
L.18:
	br label %L.15
L.15:
	%77 = load %type.TypeNode** %t
	%78 = getelementptr %type.TypeNode* %77, i32 0, i32 13
	%79 = load i8* %78
	%80 = icmp ne i8 %79, 1
	br i1 %80, label %L.22, label %L.21
L.22:
	%81 = load i32* %offs
	%82 = load i32* %fsize
	%83 = add i32 %81, %82
	store i32 %83, i32* %offs
	br label %L.21
L.21:
	br label %L.9
L.9:
	%84 = load %symb.SymbNode** %f
	%85 = getelementptr %symb.SymbNode* %84, i32 0, i32 0
	%86 = load %symb.SymbNode** %85
	store %symb.SymbNode* %86, %symb.SymbNode** %f
	%87 = load i16* %i
	%88 = add i16 %87, 1
	store i16 %88, i16* %i
	br label %L.6
L.7:
	%89 = load %type.TypeNode** @type_wordtype
	%90 = load i64* %cpart
	%91 = call %ast.AstNode* @ast_Const(%type.TypeNode* %89, i64 %90)
	%92 = load i32* %tsize
	%93 = call %ast.AstNode* @expr_Extend(%ast.AstNode* %91, i32 %92)
	store %ast.AstNode* %93, %ast.AstNode** %tree
	%94 = load %ast.AstNode** %vpart
	%95 = icmp ne %ast.AstNode* %94, null
	br i1 %95, label %L.24, label %L.23
L.24:
	%96 = load %type.TypeNode** @type_wordtype
	%97 = load %ast.AstNode** %tree
	%98 = load %ast.AstNode** %vpart
	%99 = call %ast.AstNode* @ast_New2(i8 57, %type.TypeNode* %96, %ast.AstNode* %97, %ast.AstNode* %98)
	store %ast.AstNode* %99, %ast.AstNode** %tree
	br label %L.23
L.23:
	%100 = load %type.TypeNode** %t
	%101 = load %ast.AstNode** %tree
	%102 = getelementptr %ast.AstNode* %101, i32 0, i32 9
	store %type.TypeNode* %100, %type.TypeNode** %102
	%103 = load %ast.AstNode** %tree
	%104 = getelementptr %ast.AstNode* %103, i32 0, i32 1
	store i8 6, i8* %104
	%105 = load %ast.AstNode** %tree
	store %ast.AstNode* %105, %ast.AstNode** %rv.0
	br label %return
return:
	%106 = load %ast.AstNode** %rv.0
	ret %ast.AstNode* %106
}
define %ast.AstNode* @expr_RecordConst(%type.TypeNode* %t.arg) nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%t = alloca %type.TypeNode*
	store %type.TypeNode* %t.arg, %type.TypeNode** %t
	%tree = alloca %ast.AstNode*
	%stree = alloca %ast.AstNode*
	%fs = alloca %symb.SymbNode*
	%ft = alloca %type.TypeNode*
	%max = alloca i16
	%tok = alloca i8
	%once = alloca i8
	store %ast.AstNode* null, %ast.AstNode** %tree
	%0 = load i8* @lex_Token
	store i8 %0, i8* %tok
	%1 = load i8* %tok
	%2 = icmp eq i8 %1, 36
	br i1 %2, label %L.2, label %L.3
L.2:
	%3 = load %type.TypeNode** %t
	%4 = call %ast.AstNode* @ast_New(i8 14, %type.TypeNode* %3)
	store %ast.AstNode* %4, %ast.AstNode** %tree
	%5 = load i64* @expr_strid
	%6 = add i64 %5, 1
	store i64 %6, i64* @expr_strid
	%7 = load i64* @expr_strid
	%8 = load %ast.AstNode** %tree
	%9 = getelementptr %ast.AstNode* %8, i32 0, i32 8
	store i64 %7, i64* %9
	store i8 0, i8* %once
	store i16 0, i16* %max
	%10 = load %type.TypeNode** %t
	%11 = getelementptr %type.TypeNode* %10, i32 0, i32 3
	%12 = load %symb.SymbNode** %11
	store %symb.SymbNode* %12, %symb.SymbNode** %fs
	br label %L.4
L.4:
	%13 = call i8 @lex_Next()
	store i8 %13, i8* %tok
	%14 = load i8* %tok
	%15 = icmp eq i8 %14, 2
	br i1 %15, label %L.7, label %L.6
L.7:
	%16 = call i8 @lex_Next()
	store i8 %16, i8* %tok
	%17 = load i8* %tok
	%18 = icmp eq i8 %17, 40
	br i1 %18, label %L.9, label %L.10
L.9:
	%19 = load %type.TypeNode** %t
	%20 = getelementptr %type.TypeNode* %19, i32 0, i32 3
	%21 = load %symb.SymbNode** %20
	%22 = getelementptr [64 x i8]* @lex_Ident
	%23 = bitcast [64 x i8]* %22 to [0 x i8]*
	%24 = call %symb.SymbNode* @symb_FindLocal(%symb.SymbNode* %21, [0 x i8]* %23)
	store %symb.SymbNode* %24, %symb.SymbNode** %fs
	%25 = load %symb.SymbNode** %fs
	%26 = icmp eq %symb.SymbNode* %25, null
	br i1 %26, label %L.12, label %L.11
L.12:
	%27 = getelementptr [64 x i8]* @lex_Ident
	%28 = bitcast [64 x i8]* %27 to [0 x i8]*
	call void @lex_ErrorI(i8 12, [0 x i8]* %28)
	br label %L.11
L.11:
	%29 = call i8 @lex_Next()
	store i8 %29, i8* %tok
	br label %L.8
L.10:
	call void @lex_Error(i8 11)
	br label %L.8
L.8:
	%30 = call i8 @lex_Expect(i8 9)
	store i8 %30, i8* %tok
	br label %L.6
L.6:
	store %type.TypeNode* null, %type.TypeNode** %ft
	%31 = load %symb.SymbNode** %fs
	%32 = icmp ne %symb.SymbNode* %31, null
	br i1 %32, label %L.14, label %L.13
L.14:
	%33 = load %symb.SymbNode** %fs
	%34 = getelementptr %symb.SymbNode* %33, i32 0, i32 1
	%35 = load %type.TypeNode** %34
	store %type.TypeNode* %35, %type.TypeNode** %ft
	br label %L.13
L.13:
	%36 = load %type.TypeNode** %ft
	%37 = call %ast.AstNode* @expr_Const(%type.TypeNode* %36)
	store %ast.AstNode* %37, %ast.AstNode** %stree
	%38 = load %symb.SymbNode** %fs
	%39 = icmp ne %symb.SymbNode* %38, null
	br i1 %39, label %L.16, label %L.17
L.16:
	%40 = load %ast.AstNode** %tree
	%41 = load %symb.SymbNode** %fs
	%42 = getelementptr %symb.SymbNode* %41, i32 0, i32 9
	%43 = load i16* %42
	%44 = load %ast.AstNode** %stree
	%45 = call %ast.AstNode* @ast_ChildIndexed(%ast.AstNode* %40, i16 %43, %ast.AstNode* %44)
	store %ast.AstNode* %45, %ast.AstNode** %tree
	%46 = load %symb.SymbNode** %fs
	%47 = getelementptr %symb.SymbNode* %46, i32 0, i32 9
	%48 = load i16* %47
	%49 = load i16* %max
	%50 = icmp ugt i16 %48, %49
	br i1 %50, label %L.19, label %L.18
L.19:
	%51 = load %symb.SymbNode** %fs
	%52 = getelementptr %symb.SymbNode* %51, i32 0, i32 9
	%53 = load i16* %52
	store i16 %53, i16* %max
	br label %L.18
L.18:
	%54 = load %symb.SymbNode** %fs
	%55 = getelementptr %symb.SymbNode* %54, i32 0, i32 0
	%56 = load %symb.SymbNode** %55
	store %symb.SymbNode* %56, %symb.SymbNode** %fs
	br label %L.15
L.17:
	%57 = load i8* %once
	%58 = icmp ne i8 %57, 0
	%59 = xor i1 %58, true
	br i1 %59, label %L.21, label %L.20
L.21:
	store i8 1, i8* %once
	call void @lex_Error(i8 58)
	br label %L.20
L.20:
	br label %L.15
L.15:
	%60 = load i8* @lex_Token
	store i8 %60, i8* %tok
	%61 = load i8* %tok
	%62 = icmp ne i8 %61, 5
	br i1 %62, label %L.5, label %L.22
L.22:
	br label %L.4
L.5:
	%63 = call i8 @lex_Expect(i8 37)
	store i8 %63, i8* %tok
	%64 = load %type.TypeNode** %t
	%65 = getelementptr %type.TypeNode* %64, i32 0, i32 3
	%66 = load %symb.SymbNode** %65
	store %symb.SymbNode* %66, %symb.SymbNode** %fs
	br label %L.23
L.23:
	%67 = load %symb.SymbNode** %fs
	%68 = icmp ne %symb.SymbNode* %67, null
	br i1 %68, label %L.26, label %L.27
L.26:
	%69 = load %symb.SymbNode** %fs
	%70 = getelementptr %symb.SymbNode* %69, i32 0, i32 9
	%71 = load i16* %70
	%72 = load i16* %max
	%73 = icmp ule i16 %71, %72
	br label %L.27
L.27:
	%74 = phi i1 [ false, %L.23 ], [ %73, %L.26 ]
	%75 = xor i1 %74, true
	br i1 %75, label %L.24, label %L.25
L.25:
	%76 = load %ast.AstNode** %tree
	%77 = getelementptr %ast.AstNode* %76, i32 0, i32 11
	%78 = load %symb.SymbNode** %fs
	%79 = getelementptr %symb.SymbNode* %78, i32 0, i32 9
	%80 = load i16* %79
	%81 = zext i16 %80 to i32
	%82 = getelementptr [0 x %ast.AstNode*]* %77, i32 0, i32 %81
	%83 = load %ast.AstNode** %82
	%84 = icmp eq %ast.AstNode* %83, null
	br i1 %84, label %L.29, label %L.28
L.29:
	%85 = load %symb.SymbNode** %fs
	%86 = getelementptr %symb.SymbNode* %85, i32 0, i32 1
	%87 = load %type.TypeNode** %86
	%88 = call %ast.AstNode* @ast_Const(%type.TypeNode* %87, i64 0)
	%89 = load %ast.AstNode** %tree
	%90 = getelementptr %ast.AstNode* %89, i32 0, i32 11
	%91 = load %symb.SymbNode** %fs
	%92 = getelementptr %symb.SymbNode* %91, i32 0, i32 9
	%93 = load i16* %92
	%94 = zext i16 %93 to i32
	%95 = getelementptr [0 x %ast.AstNode*]* %90, i32 0, i32 %94
	store %ast.AstNode* %88, %ast.AstNode** %95
	br label %L.28
L.28:
	%96 = load %symb.SymbNode** %fs
	%97 = getelementptr %symb.SymbNode* %96, i32 0, i32 0
	%98 = load %symb.SymbNode** %97
	store %symb.SymbNode* %98, %symb.SymbNode** %fs
	br label %L.23
L.24:
	br label %L.30
L.30:
	%99 = load %symb.SymbNode** %fs
	%100 = icmp ne %symb.SymbNode* %99, null
	%101 = xor i1 %100, true
	br i1 %101, label %L.31, label %L.32
L.32:
	%102 = load %ast.AstNode** %tree
	%103 = load %symb.SymbNode** %fs
	%104 = getelementptr %symb.SymbNode* %103, i32 0, i32 9
	%105 = load i16* %104
	%106 = load %symb.SymbNode** %fs
	%107 = getelementptr %symb.SymbNode* %106, i32 0, i32 1
	%108 = load %type.TypeNode** %107
	%109 = call %ast.AstNode* @ast_Const(%type.TypeNode* %108, i64 0)
	%110 = call %ast.AstNode* @ast_ChildIndexed(%ast.AstNode* %102, i16 %105, %ast.AstNode* %109)
	store %ast.AstNode* %110, %ast.AstNode** %tree
	%111 = load %symb.SymbNode** %fs
	%112 = getelementptr %symb.SymbNode* %111, i32 0, i32 0
	%113 = load %symb.SymbNode** %112
	store %symb.SymbNode* %113, %symb.SymbNode** %fs
	br label %L.30
L.31:
	%114 = load %type.TypeNode** %t
	%115 = getelementptr %type.TypeNode* %114, i32 0, i32 12
	%116 = load i8* %115
	%117 = icmp eq i8 %116, 2
	br i1 %117, label %L.34, label %L.33
L.34:
	%118 = load %type.TypeNode** %t
	%119 = load %ast.AstNode** %tree
	%120 = call %ast.AstNode* @expr_RecordPack(%type.TypeNode* %118, %ast.AstNode* %119)
	store %ast.AstNode* %120, %ast.AstNode** %tree
	br label %L.33
L.33:
	br label %L.1
L.3:
	call void @lex_ErrorT(i8 10, i8 36)
	br label %L.1
L.1:
	%121 = load %ast.AstNode** %tree
	store %ast.AstNode* %121, %ast.AstNode** %rv.0
	br label %return
return:
	%122 = load %ast.AstNode** %rv.0
	ret %ast.AstNode* %122
}
define %ast.AstNode* @expr_CompositeValue(%type.TypeNode* %t.arg) nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%t = alloca %type.TypeNode*
	store %type.TypeNode* %t.arg, %type.TypeNode** %t
	%tree = alloca %ast.AstNode*
	store %ast.AstNode* null, %ast.AstNode** %tree
	%0 = load %type.TypeNode** %t
	%1 = icmp ne %type.TypeNode* %0, null
	br i1 %1, label %L.2, label %L.3
L.2:
	%2 = load %type.TypeNode** %t
	%3 = getelementptr %type.TypeNode* %2, i32 0, i32 11
	%4 = load i8* %3
	%5 = zext i8 %4 to i32
	switch i32 %5, label %L.4 [
		i32 6, label %L.6
		i32 5, label %L.7
		i32 4, label %L.8
	]
L.6:
	%6 = load %type.TypeNode** %t
	%7 = call %ast.AstNode* @expr_RecordConst(%type.TypeNode* %6)
	store %ast.AstNode* %7, %ast.AstNode** %tree
	br label %L.5
L.7:
	%8 = load %type.TypeNode** %t
	%9 = call %ast.AstNode* @expr_ArrayConst(%type.TypeNode* %8)
	store %ast.AstNode* %9, %ast.AstNode** %tree
	br label %L.5
L.8:
	%10 = load %type.TypeNode** %t
	%11 = getelementptr %type.TypeNode* %10, i32 0, i32 0
	%12 = load %type.TypeNode** %11
	%13 = call %ast.AstNode* @expr_CompositeValue(%type.TypeNode* %12)
	store %ast.AstNode* %13, %ast.AstNode** %tree
	br label %L.5
L.4:
	call void @lex_Error(i8 42)
	br label %L.5
L.5:
	br label %L.1
L.3:
	call void @lex_Error(i8 41)
	br label %L.1
L.1:
	%14 = load %ast.AstNode** %tree
	store %ast.AstNode* %14, %ast.AstNode** %rv.0
	br label %return
return:
	%15 = load %ast.AstNode** %rv.0
	ret %ast.AstNode* %15
}
define %ast.AstNode* @expr_Slice(%ast.AstNode* %array.arg, %ast.AstNode* %inx.arg, %ast.AstNode* %len.arg) nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%array = alloca %ast.AstNode*
	%inx = alloca %ast.AstNode*
	%len = alloca %ast.AstNode*
	store %ast.AstNode* %array.arg, %ast.AstNode** %array
	store %ast.AstNode* %inx.arg, %ast.AstNode** %inx
	store %ast.AstNode* %len.arg, %ast.AstNode** %len
	%at = alloca %type.TypeNode*
	%st = alloca %type.TypeNode*
	%tree = alloca %ast.AstNode*
	%blen = alloca i32
	%slen = alloca i32
	%0 = load %ast.AstNode** %array
	%1 = getelementptr %ast.AstNode* %0, i32 0, i32 9
	%2 = load %type.TypeNode** %1
	store %type.TypeNode* %2, %type.TypeNode** %at
	%3 = call %type.TypeNode* @type_New(i8 5)
	store %type.TypeNode* %3, %type.TypeNode** %st
	%4 = load %type.TypeNode** %at
	%5 = getelementptr %type.TypeNode* %4, i32 0, i32 0
	%6 = load %type.TypeNode** %5
	%7 = load %type.TypeNode** %st
	%8 = getelementptr %type.TypeNode* %7, i32 0, i32 0
	store %type.TypeNode* %6, %type.TypeNode** %8
	%9 = load %type.TypeNode** %at
	%10 = getelementptr %type.TypeNode* %9, i32 0, i32 12
	%11 = load i8* %10
	%12 = load %type.TypeNode** %st
	%13 = getelementptr %type.TypeNode* %12, i32 0, i32 12
	store i8 %11, i8* %13
	%14 = load %type.TypeNode** %at
	%15 = getelementptr %type.TypeNode* %14, i32 0, i32 16
	%16 = load i8* %15
	%17 = icmp ne i8 %16, 0
	br i1 %17, label %L.2, label %L.3
L.2:
	store i32 0, i32* %blen
	br label %L.1
L.3:
	%18 = load %type.TypeNode** %at
	%19 = getelementptr %type.TypeNode* %18, i32 0, i32 6
	%20 = load i64* %19
	%21 = trunc i64 %20 to i32
	store i32 %21, i32* %blen
	br label %L.1
L.1:
	%22 = load %ast.AstNode** %len
	%23 = icmp ne %ast.AstNode* %22, null
	br i1 %23, label %L.4, label %L.5
L.4:
	%24 = load %ast.AstNode** %len
	%25 = getelementptr %ast.AstNode* %24, i32 0, i32 0
	%26 = load i8* %25
	%27 = icmp eq i8 %26, 7
	br label %L.5
L.5:
	%28 = phi i1 [ false, %L.1 ], [ %27, %L.4 ]
	br i1 %28, label %L.7, label %L.8
L.7:
	%29 = load %ast.AstNode** %len
	%30 = getelementptr %ast.AstNode* %29, i32 0, i32 8
	%31 = load i64* %30
	%32 = trunc i64 %31 to i32
	store i32 %32, i32* %slen
	br label %L.6
L.8:
	store i32 0, i32* %slen
	br label %L.6
L.6:
	%33 = load i32* %blen
	%34 = icmp eq i32 %33, 0
	br i1 %34, label %L.9, label %L.10
L.9:
	%35 = load i32* %slen
	%36 = icmp eq i32 %35, 0
	br label %L.10
L.10:
	%37 = phi i1 [ false, %L.6 ], [ %36, %L.9 ]
	br i1 %37, label %L.12, label %L.13
L.12:
	%38 = load %type.TypeNode** %st
	%39 = getelementptr %type.TypeNode* %38, i32 0, i32 16
	store i8 1, i8* %39
	br label %L.11
L.13:
	%40 = load i32* %slen
	%41 = icmp eq i32 %40, 0
	br i1 %41, label %L.15, label %L.16
L.15:
	%42 = load i32* %blen
	store i32 %42, i32* %slen
	%43 = load %ast.AstNode** %inx
	%44 = getelementptr %ast.AstNode* %43, i32 0, i32 0
	%45 = load i8* %44
	%46 = icmp eq i8 %45, 7
	br i1 %46, label %L.18, label %L.17
L.18:
	%47 = load i32* %blen
	%48 = load %ast.AstNode** %inx
	%49 = getelementptr %ast.AstNode* %48, i32 0, i32 8
	%50 = load i64* %49
	%51 = trunc i64 %50 to i32
	%52 = sub i32 %47, %51
	store i32 %52, i32* %slen
	br label %L.17
L.17:
	br label %L.14
L.16:
	br label %L.14
L.14:
	%53 = load i32* %slen
	%54 = zext i32 %53 to i64
	%55 = load %type.TypeNode** %st
	%56 = getelementptr %type.TypeNode* %55, i32 0, i32 6
	store i64 %54, i64* %56
	%57 = load %type.TypeNode** %at
	%58 = getelementptr %type.TypeNode* %57, i32 0, i32 0
	%59 = load %type.TypeNode** %58
	%60 = getelementptr %type.TypeNode* %59, i32 0, i32 7
	%61 = load i32* %60
	%62 = load i32* %slen
	%63 = mul i32 %61, %62
	%64 = load %type.TypeNode** %st
	%65 = getelementptr %type.TypeNode* %64, i32 0, i32 7
	store i32 %63, i32* %65
	%66 = load %type.TypeNode** %st
	%67 = getelementptr %type.TypeNode* %66, i32 0, i32 7
	%68 = load i32* %67
	%69 = load %type.TypeNode** %st
	%70 = getelementptr %type.TypeNode* %69, i32 0, i32 8
	store i32 %68, i32* %70
	br label %L.11
L.11:
	%71 = load %type.TypeNode** %st
	%72 = load %ast.AstNode** %array
	%73 = load %ast.AstNode** %inx
	%74 = call %ast.AstNode* @ast_New2(i8 18, %type.TypeNode* %71, %ast.AstNode* %72, %ast.AstNode* %73)
	store %ast.AstNode* %74, %ast.AstNode** %tree
	%75 = load %ast.AstNode** %tree
	%76 = load %ast.AstNode** %len
	%77 = call %ast.AstNode* @ast_Child(%ast.AstNode* %75, %ast.AstNode* %76)
	store %ast.AstNode* %77, %ast.AstNode** %tree
	%78 = load %ast.AstNode** %tree
	store %ast.AstNode* %78, %ast.AstNode** %rv.0
	br label %return
return:
	%79 = load %ast.AstNode** %rv.0
	ret %ast.AstNode* %79
}
define %ast.AstNode* @expr_Load(%ast.AstNode* %tree.arg) nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%tree = alloca %ast.AstNode*
	store %ast.AstNode* %tree.arg, %ast.AstNode** %tree
	%t = alloca %type.TypeNode*
	%0 = load %ast.AstNode** %tree
	%1 = icmp eq %ast.AstNode* %0, null
	br i1 %1, label %L.2, label %L.1
L.2:
	%2 = load %ast.AstNode** %tree
	store %ast.AstNode* %2, %ast.AstNode** %rv.0
	br label %return
L.1:
	%3 = load %ast.AstNode** %tree
	%4 = getelementptr %ast.AstNode* %3, i32 0, i32 0
	%5 = load i8* %4
	%6 = zext i8 %5 to i32
	switch i32 %6, label %L.3 [
		i32 2, label %L.5
		i32 9, label %L.6
		i32 17, label %L.6
		i32 16, label %L.6
		i32 18, label %L.6
		i32 25, label %L.6
	]
L.5:
	%7 = load %ast.AstNode** %tree
	%8 = getelementptr %ast.AstNode* %7, i32 0, i32 9
	%9 = load %type.TypeNode** %8
	%10 = getelementptr %type.TypeNode* %9, i32 0, i32 2
	%11 = load %symb.SymbNode** %10
	%12 = getelementptr %symb.SymbNode* %11, i32 0, i32 19
	%13 = getelementptr [0 x i8]* %12
	call void @lex_ErrorI(i8 22, [0 x i8]* %13)
	store %ast.AstNode* null, %ast.AstNode** %tree
	br label %L.4
L.6:
	%14 = load %ast.AstNode** %tree
	%15 = getelementptr %ast.AstNode* %14, i32 0, i32 9
	%16 = load %type.TypeNode** %15
	store %type.TypeNode* %16, %type.TypeNode** %t
	%17 = load %type.TypeNode** %t
	%18 = getelementptr %type.TypeNode* %17, i32 0, i32 11
	%19 = load i8* %18
	%20 = zext i8 %19 to i32
	switch i32 %20, label %L.7 [
		i32 4, label %L.9
	]
L.9:
	%21 = load %type.TypeNode** %t
	%22 = getelementptr %type.TypeNode* %21, i32 0, i32 0
	%23 = load %type.TypeNode** %22
	store %type.TypeNode* %23, %type.TypeNode** %t
	%24 = load %type.TypeNode** %t
	%25 = load %ast.AstNode** %tree
	%26 = call %ast.AstNode* @ast_New1(i8 25, %type.TypeNode* %24, %ast.AstNode* %25)
	store %ast.AstNode* %26, %ast.AstNode** %tree
	%27 = load %ast.AstNode** %tree
	%28 = getelementptr %ast.AstNode* %27, i32 0, i32 1
	store i8 4, i8* %28
	%29 = load %target.TargetT** @target_Target
	%30 = getelementptr %target.TargetT* %29, i32 0, i32 8
	%31 = getelementptr %target.SizeAlign* %30, i32 0, i32 0
	%32 = load i8* %31
	%33 = load %ast.AstNode** %tree
	%34 = getelementptr %ast.AstNode* %33, i32 0, i32 2
	store i8 %32, i8* %34
	br label %L.8
L.7:
	%35 = load %type.TypeNode** %t
	%36 = load %ast.AstNode** %tree
	%37 = call %ast.AstNode* @ast_New1(i8 25, %type.TypeNode* %35, %ast.AstNode* %36)
	store %ast.AstNode* %37, %ast.AstNode** %tree
	%38 = load %type.TypeNode** %t
	%39 = getelementptr %type.TypeNode* %38, i32 0, i32 11
	%40 = load i8* %39
	%41 = load %ast.AstNode** %tree
	%42 = getelementptr %ast.AstNode* %41, i32 0, i32 1
	store i8 %40, i8* %42
	%43 = load %type.TypeNode** %t
	%44 = getelementptr %type.TypeNode* %43, i32 0, i32 8
	%45 = load i32* %44
	%46 = trunc i32 %45 to i8
	%47 = load %ast.AstNode** %tree
	%48 = getelementptr %ast.AstNode* %47, i32 0, i32 2
	store i8 %46, i8* %48
	br label %L.8
L.8:
	br label %L.4
L.3:
	br label %L.4
L.4:
	%49 = load %ast.AstNode** %tree
	store %ast.AstNode* %49, %ast.AstNode** %rv.0
	br label %return
return:
	%50 = load %ast.AstNode** %rv.0
	ret %ast.AstNode* %50
}
define %ast.AstNode* @expr_RProc(%type.TypeNode* %t.arg) nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%t = alloca %type.TypeNode*
	store %type.TypeNode* %t.arg, %type.TypeNode** %t
	%tree = alloca %ast.AstNode*
	%tok = alloca i8
	%s = alloca %symb.SymbNode*
	%0 = load i8* @lex_Token
	store i8 %0, i8* %tok
	%1 = load i8* %tok
	%2 = icmp eq i8 %1, 40
	br i1 %2, label %L.2, label %L.3
L.2:
	%3 = getelementptr [64 x i8]* @lex_Ident
	%4 = bitcast [64 x i8]* %3 to [0 x i8]*
	%5 = call %symb.SymbNode* @symb_Find([0 x i8]* %4)
	store %symb.SymbNode* %5, %symb.SymbNode** %s
	%6 = load %symb.SymbNode** %s
	%7 = icmp ne %symb.SymbNode* %6, null
	br i1 %7, label %L.5, label %L.6
L.5:
	%8 = load %symb.SymbNode** %s
	%9 = getelementptr %symb.SymbNode* %8, i32 0, i32 12
	%10 = load i8* %9
	%11 = icmp eq i8 %10, 5
	br i1 %11, label %L.8, label %L.9
L.8:
	%12 = load %type.TypeNode** %t
	%13 = call %ast.AstNode* @ast_New(i8 9, %type.TypeNode* %12)
	store %ast.AstNode* %13, %ast.AstNode** %tree
	%14 = load %symb.SymbNode** %s
	%15 = load %ast.AstNode** %tree
	%16 = getelementptr %ast.AstNode* %15, i32 0, i32 10
	store %symb.SymbNode* %14, %symb.SymbNode** %16
	%17 = load %ast.AstNode** %tree
	%18 = getelementptr %ast.AstNode* %17, i32 0, i32 1
	store i8 7, i8* %18
	br label %L.7
L.9:
	%19 = load %symb.SymbNode** %s
	%20 = getelementptr %symb.SymbNode* %19, i32 0, i32 19
	%21 = getelementptr [0 x i8]* %20
	call void @lex_ErrorI(i8 15, [0 x i8]* %21)
	br label %L.7
L.7:
	br label %L.4
L.6:
	%22 = load %symb.SymbNode** %s
	%23 = getelementptr %symb.SymbNode* %22, i32 0, i32 19
	%24 = getelementptr [0 x i8]* %23
	call void @lex_ErrorI(i8 12, [0 x i8]* %24)
	br label %L.4
L.4:
	%25 = call i8 @lex_Next()
	store i8 %25, i8* %tok
	br label %L.1
L.3:
	call void @lex_Error(i8 11)
	br label %L.1
L.1:
	%26 = load %ast.AstNode** %tree
	store %ast.AstNode* %26, %ast.AstNode** %rv.0
	br label %return
return:
	%27 = load %ast.AstNode** %rv.0
	ret %ast.AstNode* %27
}
define %ast.AstNode* @expr_Actual(%ast.AstNode* %tree.arg, %type.TypeNode* %to.arg) nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%tree = alloca %ast.AstNode*
	%to = alloca %type.TypeNode*
	store %ast.AstNode* %tree.arg, %ast.AstNode** %tree
	store %type.TypeNode* %to.arg, %type.TypeNode** %to
	%fm = alloca %type.TypeNode*
	%ok = alloca i8
	%0 = load %type.TypeNode** %to
	%1 = getelementptr %type.TypeNode* %0, i32 0, i32 11
	%2 = load i8* %1
	%3 = icmp eq i8 %2, 7
	br i1 %3, label %L.2, label %L.1
L.2:
	%4 = load %type.TypeNode** %to
	%5 = call %ast.AstNode* @expr_RProc(%type.TypeNode* %4)
	store %ast.AstNode* %5, %ast.AstNode** %rv.0
	br label %return
L.1:
	%6 = load %ast.AstNode** %tree
	%7 = icmp eq %ast.AstNode* %6, null
	br i1 %7, label %L.4, label %L.3
L.4:
	%8 = load %type.TypeNode** %to
	%9 = call %ast.AstNode* @expr_Bool(%type.TypeNode* %8)
	store %ast.AstNode* %9, %ast.AstNode** %tree
	%10 = load %ast.AstNode** %tree
	%11 = icmp eq %ast.AstNode* %10, null
	br i1 %11, label %L.6, label %L.5
L.6:
	%12 = load %ast.AstNode** %tree
	store %ast.AstNode* %12, %ast.AstNode** %rv.0
	br label %return
L.5:
	br label %L.3
L.3:
	%13 = load %ast.AstNode** %tree
	%14 = getelementptr %ast.AstNode* %13, i32 0, i32 9
	%15 = load %type.TypeNode** %14
	store %type.TypeNode* %15, %type.TypeNode** %fm
	%16 = load %type.TypeNode** %fm
	%17 = icmp eq %type.TypeNode* %16, null
	br i1 %17, label %L.8, label %L.7
L.8:
	%18 = load %ast.AstNode** %tree
	store %ast.AstNode* %18, %ast.AstNode** %rv.0
	br label %return
L.7:
	store i8 1, i8* %ok
	%19 = load %type.TypeNode** %to
	%20 = getelementptr %type.TypeNode* %19, i32 0, i32 11
	%21 = load i8* %20
	%22 = zext i8 %21 to i32
	switch i32 %22, label %L.9 [
		i32 4, label %L.11
		i32 1, label %L.12
		i32 2, label %L.12
		i32 3, label %L.12
		i32 6, label %L.13
		i32 5, label %L.13
	]
L.11:
	%23 = load %type.TypeNode** %to
	%24 = getelementptr %type.TypeNode* %23, i32 0, i32 0
	%25 = load %type.TypeNode** %24
	%26 = icmp eq %type.TypeNode* %25, null
	br i1 %26, label %L.15, label %L.14
L.15:
	call void @lex_Error(i8 16)
	%27 = load %ast.AstNode** %tree
	store %ast.AstNode* %27, %ast.AstNode** %rv.0
	br label %return
L.14:
	%28 = load %ast.AstNode** %tree
	%29 = getelementptr %ast.AstNode* %28, i32 0, i32 1
	%30 = load i8* %29
	%31 = icmp ne i8 %30, 4
	br i1 %31, label %L.17, label %L.18
L.17:
	%32 = load %ast.AstNode** %tree
	%33 = getelementptr %ast.AstNode* %32, i32 0, i32 0
	%34 = load i8* %33
	%35 = icmp eq i8 %34, 25
	br i1 %35, label %L.20, label %L.19
L.20:
	%36 = load %ast.AstNode** %tree
	%37 = getelementptr %ast.AstNode* %36, i32 0, i32 11
	%38 = getelementptr [0 x %ast.AstNode*]* %37, i32 0, i32 0
	%39 = load %ast.AstNode** %38
	store %ast.AstNode* %39, %ast.AstNode** %tree
	br label %L.19
L.19:
	%40 = load %ast.AstNode** %tree
	%41 = getelementptr %ast.AstNode* %40, i32 0, i32 0
	%42 = load i8* %41
	%43 = icmp ne i8 %42, 14
	br i1 %43, label %L.22, label %L.21
L.22:
	%44 = load %ast.AstNode** %tree
	%45 = getelementptr %ast.AstNode* %44, i32 0, i32 9
	%46 = load %type.TypeNode** %45
	%47 = load %ast.AstNode** %tree
	%48 = call %ast.AstNode* @ast_New1(i8 19, %type.TypeNode* %46, %ast.AstNode* %47)
	store %ast.AstNode* %48, %ast.AstNode** %tree
	br label %L.21
L.21:
	%49 = load %ast.AstNode** %tree
	%50 = getelementptr %ast.AstNode* %49, i32 0, i32 1
	store i8 4, i8* %50
	%51 = load %type.TypeNode** %fm
	%52 = load %type.TypeNode** %to
	%53 = getelementptr %type.TypeNode* %52, i32 0, i32 0
	%54 = load %type.TypeNode** %53
	%55 = call i8 @type_Compat(%type.TypeNode* %51, %type.TypeNode* %54)
	store i8 %55, i8* %ok
	br label %L.16
L.18:
	%56 = load %type.TypeNode** %to
	%57 = getelementptr %type.TypeNode* %56, i32 0, i32 0
	%58 = load %type.TypeNode** %57
	%59 = load %type.TypeNode** %fm
	%60 = icmp ne %type.TypeNode* %58, %59
	br i1 %60, label %L.24, label %L.23
L.24:
	%61 = load %type.TypeNode** %to
	%62 = getelementptr %type.TypeNode* %61, i32 0, i32 0
	%63 = load %type.TypeNode** %62
	%64 = load %type.TypeNode** %fm
	%65 = call i8 @type_Compat(%type.TypeNode* %63, %type.TypeNode* %64)
	%66 = icmp ne i8 %65, 0
	br i1 %66, label %L.26, label %L.27
L.26:
	%67 = load %ast.AstNode** %tree
	%68 = load %type.TypeNode** %to
	%69 = call %ast.AstNode* @expr_Cast(%ast.AstNode* %67, %type.TypeNode* %68)
	store %ast.AstNode* %69, %ast.AstNode** %tree
	br label %L.25
L.27:
	call void @lex_Error(i8 34)
	br label %L.25
L.25:
	br label %L.23
L.23:
	br label %L.16
L.16:
	%70 = load %type.TypeNode** %to
	%71 = getelementptr %type.TypeNode* %70, i32 0, i32 0
	%72 = load %type.TypeNode** %71
	%73 = getelementptr %type.TypeNode* %72, i32 0, i32 16
	%74 = load i8* %73
	%75 = icmp ne i8 %74, 0
	br i1 %75, label %L.28, label %L.29
L.28:
	%76 = load %ast.AstNode** %tree
	%77 = getelementptr %ast.AstNode* %76, i32 0, i32 9
	%78 = load %type.TypeNode** %77
	%79 = getelementptr %type.TypeNode* %78, i32 0, i32 16
	%80 = load i8* %79
	%81 = icmp ne i8 %80, 0
	%82 = xor i1 %81, true
	br label %L.29
L.29:
	%83 = phi i1 [ false, %L.16 ], [ %82, %L.28 ]
	br i1 %83, label %L.31, label %L.30
L.31:
	%84 = load %type.TypeNode** %to
	%85 = getelementptr %type.TypeNode* %84, i32 0, i32 0
	%86 = load %type.TypeNode** %85
	%87 = load %ast.AstNode** %tree
	%88 = call %ast.AstNode* @ast_New1(i8 15, %type.TypeNode* %86, %ast.AstNode* %87)
	store %ast.AstNode* %88, %ast.AstNode** %tree
	br label %L.30
L.30:
	br label %L.10
L.12:
	%89 = load %type.TypeNode** %fm
	%90 = load %type.TypeNode** %to
	%91 = call i8 @type_Compat(%type.TypeNode* %89, %type.TypeNode* %90)
	store i8 %91, i8* %ok
	%92 = load %type.TypeNode** %to
	%93 = getelementptr %type.TypeNode* %92, i32 0, i32 8
	%94 = load i32* %93
	%95 = load %ast.AstNode** %tree
	%96 = getelementptr %ast.AstNode* %95, i32 0, i32 2
	%97 = load i8* %96
	%98 = zext i8 %97 to i32
	%99 = icmp ugt i32 %94, %98
	br i1 %99, label %L.33, label %L.32
L.33:
	%100 = load %ast.AstNode** %tree
	%101 = load %type.TypeNode** %to
	%102 = call %ast.AstNode* @expr_ExtendT(%ast.AstNode* %100, %type.TypeNode* %101)
	store %ast.AstNode* %102, %ast.AstNode** %tree
	br label %L.32
L.32:
	br label %L.10
L.13:
	%103 = load %type.TypeNode** %fm
	%104 = load %type.TypeNode** %to
	%105 = call i8 @type_Compat(%type.TypeNode* %103, %type.TypeNode* %104)
	store i8 %105, i8* %ok
	br label %L.10
L.9:
	br label %L.10
L.10:
	%106 = load i8* %ok
	%107 = icmp ne i8 %106, 0
	%108 = xor i1 %107, true
	br i1 %108, label %L.35, label %L.34
L.35:
	call void @lex_Error(i8 57)
	br label %L.34
L.34:
	%109 = load %ast.AstNode** %tree
	store %ast.AstNode* %109, %ast.AstNode** %rv.0
	br label %return
return:
	%110 = load %ast.AstNode** %rv.0
	ret %ast.AstNode* %110
}
define %ast.AstNode* @expr_UnOp(i8 zeroext %op.arg, %ast.AstNode* %rhs.arg) nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%op = alloca i8
	%rhs = alloca %ast.AstNode*
	store i8 %op.arg, i8* %op
	store %ast.AstNode* %rhs.arg, %ast.AstNode** %rhs
	%tree = alloca %ast.AstNode*
	%0 = load %ast.AstNode** %rhs
	%1 = getelementptr %ast.AstNode* %0, i32 0, i32 0
	%2 = load i8* %1
	%3 = icmp eq i8 %2, 7
	br i1 %3, label %L.2, label %L.3
L.2:
	%4 = load %ast.AstNode** %rhs
	store %ast.AstNode* %4, %ast.AstNode** %tree
	%5 = load i8* %op
	%6 = zext i8 %5 to i32
	switch i32 %6, label %L.4 [
		i32 31, label %L.6
		i32 32, label %L.7
		i32 61, label %L.8
	]
L.6:
	%7 = load %ast.AstNode** %tree
	%8 = getelementptr %ast.AstNode* %7, i32 0, i32 8
	%9 = load i64* %8
	%10 = sub i64 0, %9
	%11 = load %ast.AstNode** %tree
	%12 = getelementptr %ast.AstNode* %11, i32 0, i32 8
	store i64 %10, i64* %12
	br label %L.5
L.7:
	%13 = load %ast.AstNode** %tree
	%14 = getelementptr %ast.AstNode* %13, i32 0, i32 8
	%15 = load i64* %14
	%16 = xor i64 %15, -1
	%17 = load %ast.AstNode** %tree
	%18 = getelementptr %ast.AstNode* %17, i32 0, i32 8
	store i64 %16, i64* %18
	br label %L.5
L.8:
	%19 = load %ast.AstNode** %tree
	%20 = getelementptr %ast.AstNode* %19, i32 0, i32 8
	%21 = load i64* %20
	%22 = xor i64 %21, 1
	%23 = load %ast.AstNode** %tree
	%24 = getelementptr %ast.AstNode* %23, i32 0, i32 8
	store i64 %22, i64* %24
	br label %L.5
L.4:
	br label %L.5
L.5:
	br label %L.1
L.3:
	%25 = load i8* %op
	%26 = load %ast.AstNode** %rhs
	%27 = getelementptr %ast.AstNode* %26, i32 0, i32 9
	%28 = load %type.TypeNode** %27
	%29 = load %ast.AstNode** %rhs
	%30 = call %ast.AstNode* @ast_New1(i8 %25, %type.TypeNode* %28, %ast.AstNode* %29)
	store %ast.AstNode* %30, %ast.AstNode** %tree
	br label %L.1
L.1:
	%31 = load %ast.AstNode** %tree
	store %ast.AstNode* %31, %ast.AstNode** %rv.0
	br label %return
return:
	%32 = load %ast.AstNode** %rv.0
	ret %ast.AstNode* %32
}
define zeroext i8 @expr_IsSignedBinOp(%ast.AstNode* %lhs.arg, %ast.AstNode* %rhs.arg) nounwind {
L.0:
	%rv.0 = alloca i8
	%lhs = alloca %ast.AstNode*
	%rhs = alloca %ast.AstNode*
	store %ast.AstNode* %lhs.arg, %ast.AstNode** %lhs
	store %ast.AstNode* %rhs.arg, %ast.AstNode** %rhs
	%0 = load %ast.AstNode** %lhs
	%1 = getelementptr %ast.AstNode* %0, i32 0, i32 1
	%2 = load i8* %1
	%3 = icmp eq i8 %2, 3
	br i1 %3, label %L.2, label %L.1
L.1:
	%4 = load %ast.AstNode** %rhs
	%5 = getelementptr %ast.AstNode* %4, i32 0, i32 1
	%6 = load i8* %5
	%7 = icmp eq i8 %6, 3
	br label %L.2
L.2:
	%8 = phi i1 [ true, %L.0 ], [ %7, %L.1 ]
	br i1 %8, label %L.4, label %L.3
L.4:
	store i8 1, i8* %rv.0
	br label %return
L.3:
	store i8 0, i8* %rv.0
	br label %return
return:
	%9 = load i8* %rv.0
	ret i8 %9
}
define %ast.AstNode* @expr_BinOp(i8 zeroext %op.arg, %ast.AstNode* %lhs.arg, %ast.AstNode* %rhs.arg) nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%op = alloca i8
	%lhs = alloca %ast.AstNode*
	%rhs = alloca %ast.AstNode*
	store i8 %op.arg, i8* %op
	store %ast.AstNode* %lhs.arg, %ast.AstNode** %lhs
	store %ast.AstNode* %rhs.arg, %ast.AstNode** %rhs
	%tree = alloca %ast.AstNode*
	%sl = alloca i8
	%sr = alloca i8
	%fold = alloca i8
	%swap = alloca i8
	%0 = load %ast.AstNode** %lhs
	%1 = getelementptr %ast.AstNode* %0, i32 0, i32 0
	%2 = load i8* %1
	%3 = icmp eq i8 %2, 2
	br i1 %3, label %L.2, label %L.1
L.2:
	%4 = load %ast.AstNode** %lhs
	%5 = getelementptr %ast.AstNode* %4, i32 0, i32 9
	%6 = load %type.TypeNode** %5
	%7 = getelementptr %type.TypeNode* %6, i32 0, i32 2
	%8 = load %symb.SymbNode** %7
	%9 = getelementptr %symb.SymbNode* %8, i32 0, i32 19
	%10 = getelementptr [0 x i8]* %9
	call void @lex_ErrorI(i8 22, [0 x i8]* %10)
	store %ast.AstNode* null, %ast.AstNode** %rv.0
	br label %return
L.1:
	%11 = load %ast.AstNode** %rhs
	%12 = getelementptr %ast.AstNode* %11, i32 0, i32 0
	%13 = load i8* %12
	%14 = icmp eq i8 %13, 2
	br i1 %14, label %L.4, label %L.3
L.4:
	%15 = load %ast.AstNode** %rhs
	%16 = getelementptr %ast.AstNode* %15, i32 0, i32 9
	%17 = load %type.TypeNode** %16
	%18 = getelementptr %type.TypeNode* %17, i32 0, i32 2
	%19 = load %symb.SymbNode** %18
	%20 = getelementptr %symb.SymbNode* %19, i32 0, i32 19
	%21 = getelementptr [0 x i8]* %20
	call void @lex_ErrorI(i8 22, [0 x i8]* %21)
	store %ast.AstNode* null, %ast.AstNode** %rv.0
	br label %return
L.3:
	store i8 0, i8* %fold
	store i8 0, i8* %swap
	%22 = load %ast.AstNode** %lhs
	%23 = getelementptr %ast.AstNode* %22, i32 0, i32 0
	%24 = load i8* %23
	%25 = icmp eq i8 %24, 7
	br i1 %25, label %L.6, label %L.5
L.6:
	%26 = load %ast.AstNode** %rhs
	%27 = getelementptr %ast.AstNode* %26, i32 0, i32 0
	%28 = load i8* %27
	%29 = icmp eq i8 %28, 7
	br i1 %29, label %L.8, label %L.9
L.8:
	%30 = load i8* %op
	%31 = zext i8 %30 to i32
	switch i32 %31, label %L.10 [
		i32 33, label %L.12
		i32 34, label %L.13
		i32 57, label %L.14
		i32 58, label %L.15
		i32 56, label %L.16
		i32 48, label %L.17
		i32 49, label %L.18
		i32 50, label %L.19
		i32 51, label %L.20
		i32 38, label %L.21
		i32 39, label %L.22
		i32 40, label %L.23
		i32 41, label %L.24
		i32 42, label %L.25
		i32 43, label %L.26
		i32 44, label %L.27
		i32 45, label %L.28
		i32 46, label %L.29
		i32 47, label %L.30
	]
L.12:
	%32 = load %ast.AstNode** %lhs
	%33 = getelementptr %ast.AstNode* %32, i32 0, i32 8
	%34 = load i64* %33
	%35 = load %ast.AstNode** %rhs
	%36 = getelementptr %ast.AstNode* %35, i32 0, i32 8
	%37 = load i64* %36
	%38 = add i64 %34, %37
	store i64 %38, i64* %33
	%39 = load %ast.AstNode** %lhs
	store %ast.AstNode* %39, %ast.AstNode** %rv.0
	br label %return
L.13:
	%40 = load %ast.AstNode** %lhs
	%41 = getelementptr %ast.AstNode* %40, i32 0, i32 8
	%42 = load i64* %41
	%43 = load %ast.AstNode** %rhs
	%44 = getelementptr %ast.AstNode* %43, i32 0, i32 8
	%45 = load i64* %44
	%46 = sub i64 %42, %45
	store i64 %46, i64* %41
	%47 = load %ast.AstNode** %lhs
	store %ast.AstNode* %47, %ast.AstNode** %rv.0
	br label %return
L.14:
	%48 = load %ast.AstNode** %lhs
	%49 = getelementptr %ast.AstNode* %48, i32 0, i32 8
	%50 = load i64* %49
	%51 = load %ast.AstNode** %rhs
	%52 = getelementptr %ast.AstNode* %51, i32 0, i32 8
	%53 = load i64* %52
	%54 = or i64 %50, %53
	%55 = load %ast.AstNode** %lhs
	%56 = getelementptr %ast.AstNode* %55, i32 0, i32 8
	store i64 %54, i64* %56
	%57 = load %ast.AstNode** %lhs
	store %ast.AstNode* %57, %ast.AstNode** %rv.0
	br label %return
L.15:
	%58 = load %ast.AstNode** %lhs
	%59 = getelementptr %ast.AstNode* %58, i32 0, i32 8
	%60 = load i64* %59
	%61 = load %ast.AstNode** %rhs
	%62 = getelementptr %ast.AstNode* %61, i32 0, i32 8
	%63 = load i64* %62
	%64 = xor i64 %60, %63
	%65 = load %ast.AstNode** %lhs
	%66 = getelementptr %ast.AstNode* %65, i32 0, i32 8
	store i64 %64, i64* %66
	%67 = load %ast.AstNode** %lhs
	store %ast.AstNode* %67, %ast.AstNode** %rv.0
	br label %return
L.16:
	%68 = load %ast.AstNode** %lhs
	%69 = getelementptr %ast.AstNode* %68, i32 0, i32 8
	%70 = load i64* %69
	%71 = load %ast.AstNode** %rhs
	%72 = getelementptr %ast.AstNode* %71, i32 0, i32 8
	%73 = load i64* %72
	%74 = and i64 %70, %73
	%75 = load %ast.AstNode** %lhs
	%76 = getelementptr %ast.AstNode* %75, i32 0, i32 8
	store i64 %74, i64* %76
	%77 = load %ast.AstNode** %lhs
	store %ast.AstNode* %77, %ast.AstNode** %rv.0
	br label %return
L.17:
	%78 = load %ast.AstNode** %rhs
	%79 = getelementptr %ast.AstNode* %78, i32 0, i32 8
	%80 = load i64* %79
	%81 = load %ast.AstNode** %lhs
	%82 = getelementptr %ast.AstNode* %81, i32 0, i32 8
	%83 = load i64* %82
	%84 = icmp ult i64 %80, %83
	br i1 %84, label %L.32, label %L.31
L.32:
	%85 = load %ast.AstNode** %rhs
	%86 = getelementptr %ast.AstNode* %85, i32 0, i32 8
	%87 = load i64* %86
	%88 = load %ast.AstNode** %lhs
	%89 = getelementptr %ast.AstNode* %88, i32 0, i32 8
	store i64 %87, i64* %89
	br label %L.31
L.31:
	%90 = load %ast.AstNode** %lhs
	store %ast.AstNode* %90, %ast.AstNode** %rv.0
	br label %return
L.18:
	%91 = load %ast.AstNode** %rhs
	%92 = getelementptr %ast.AstNode* %91, i32 0, i32 8
	%93 = load i64* %92
	%94 = load %ast.AstNode** %lhs
	%95 = getelementptr %ast.AstNode* %94, i32 0, i32 8
	%96 = load i64* %95
	%97 = icmp ugt i64 %93, %96
	br i1 %97, label %L.34, label %L.33
L.34:
	%98 = load %ast.AstNode** %rhs
	%99 = getelementptr %ast.AstNode* %98, i32 0, i32 8
	%100 = load i64* %99
	%101 = load %ast.AstNode** %lhs
	%102 = getelementptr %ast.AstNode* %101, i32 0, i32 8
	store i64 %100, i64* %102
	br label %L.33
L.33:
	%103 = load %ast.AstNode** %lhs
	store %ast.AstNode* %103, %ast.AstNode** %rv.0
	br label %return
L.19:
	%104 = load %ast.AstNode** %rhs
	%105 = getelementptr %ast.AstNode* %104, i32 0, i32 8
	%106 = load i64* %105
	%107 = load %ast.AstNode** %lhs
	%108 = getelementptr %ast.AstNode* %107, i32 0, i32 8
	%109 = load i64* %108
	%110 = icmp slt i64 %106, %109
	br i1 %110, label %L.36, label %L.35
L.36:
	%111 = load %ast.AstNode** %rhs
	%112 = getelementptr %ast.AstNode* %111, i32 0, i32 8
	%113 = load i64* %112
	%114 = load %ast.AstNode** %lhs
	%115 = getelementptr %ast.AstNode* %114, i32 0, i32 8
	store i64 %113, i64* %115
	br label %L.35
L.35:
	%116 = load %ast.AstNode** %lhs
	store %ast.AstNode* %116, %ast.AstNode** %rv.0
	br label %return
L.20:
	%117 = load %ast.AstNode** %rhs
	%118 = getelementptr %ast.AstNode* %117, i32 0, i32 8
	%119 = load i64* %118
	%120 = load %ast.AstNode** %lhs
	%121 = getelementptr %ast.AstNode* %120, i32 0, i32 8
	%122 = load i64* %121
	%123 = icmp sgt i64 %119, %122
	br i1 %123, label %L.38, label %L.37
L.38:
	%124 = load %ast.AstNode** %rhs
	%125 = getelementptr %ast.AstNode* %124, i32 0, i32 8
	%126 = load i64* %125
	%127 = load %ast.AstNode** %lhs
	%128 = getelementptr %ast.AstNode* %127, i32 0, i32 8
	store i64 %126, i64* %128
	br label %L.37
L.37:
	%129 = load %ast.AstNode** %lhs
	store %ast.AstNode* %129, %ast.AstNode** %rv.0
	br label %return
L.21:
	%130 = load %ast.AstNode** %lhs
	%131 = getelementptr %ast.AstNode* %130, i32 0, i32 8
	%132 = load i64* %131
	%133 = load %ast.AstNode** %rhs
	%134 = getelementptr %ast.AstNode* %133, i32 0, i32 8
	%135 = load i64* %134
	%136 = icmp eq i64 %132, %135
	%137 = zext i1 %136 to i32
	%138 = zext i32 %137 to i64
	%139 = load %ast.AstNode** %lhs
	%140 = getelementptr %ast.AstNode* %139, i32 0, i32 8
	store i64 %138, i64* %140
	%141 = load %ast.AstNode** %lhs
	store %ast.AstNode* %141, %ast.AstNode** %rv.0
	br label %return
L.22:
	%142 = load %ast.AstNode** %lhs
	%143 = getelementptr %ast.AstNode* %142, i32 0, i32 8
	%144 = load i64* %143
	%145 = load %ast.AstNode** %rhs
	%146 = getelementptr %ast.AstNode* %145, i32 0, i32 8
	%147 = load i64* %146
	%148 = icmp ne i64 %144, %147
	%149 = zext i1 %148 to i32
	%150 = zext i32 %149 to i64
	%151 = load %ast.AstNode** %lhs
	%152 = getelementptr %ast.AstNode* %151, i32 0, i32 8
	store i64 %150, i64* %152
	%153 = load %ast.AstNode** %lhs
	store %ast.AstNode* %153, %ast.AstNode** %rv.0
	br label %return
L.23:
	%154 = load %ast.AstNode** %lhs
	%155 = getelementptr %ast.AstNode* %154, i32 0, i32 8
	%156 = load i64* %155
	%157 = load %ast.AstNode** %rhs
	%158 = getelementptr %ast.AstNode* %157, i32 0, i32 8
	%159 = load i64* %158
	%160 = icmp ult i64 %156, %159
	%161 = zext i1 %160 to i32
	%162 = zext i32 %161 to i64
	%163 = load %ast.AstNode** %lhs
	%164 = getelementptr %ast.AstNode* %163, i32 0, i32 8
	store i64 %162, i64* %164
	%165 = load %ast.AstNode** %lhs
	store %ast.AstNode* %165, %ast.AstNode** %rv.0
	br label %return
L.24:
	%166 = load %ast.AstNode** %lhs
	%167 = getelementptr %ast.AstNode* %166, i32 0, i32 8
	%168 = load i64* %167
	%169 = load %ast.AstNode** %rhs
	%170 = getelementptr %ast.AstNode* %169, i32 0, i32 8
	%171 = load i64* %170
	%172 = icmp ugt i64 %168, %171
	%173 = zext i1 %172 to i32
	%174 = zext i32 %173 to i64
	%175 = load %ast.AstNode** %lhs
	%176 = getelementptr %ast.AstNode* %175, i32 0, i32 8
	store i64 %174, i64* %176
	%177 = load %ast.AstNode** %lhs
	store %ast.AstNode* %177, %ast.AstNode** %rv.0
	br label %return
L.25:
	%178 = load %ast.AstNode** %lhs
	%179 = getelementptr %ast.AstNode* %178, i32 0, i32 8
	%180 = load i64* %179
	%181 = load %ast.AstNode** %rhs
	%182 = getelementptr %ast.AstNode* %181, i32 0, i32 8
	%183 = load i64* %182
	%184 = icmp ule i64 %180, %183
	%185 = zext i1 %184 to i32
	%186 = zext i32 %185 to i64
	%187 = load %ast.AstNode** %lhs
	%188 = getelementptr %ast.AstNode* %187, i32 0, i32 8
	store i64 %186, i64* %188
	%189 = load %ast.AstNode** %lhs
	store %ast.AstNode* %189, %ast.AstNode** %rv.0
	br label %return
L.26:
	%190 = load %ast.AstNode** %lhs
	%191 = getelementptr %ast.AstNode* %190, i32 0, i32 8
	%192 = load i64* %191
	%193 = load %ast.AstNode** %rhs
	%194 = getelementptr %ast.AstNode* %193, i32 0, i32 8
	%195 = load i64* %194
	%196 = icmp uge i64 %192, %195
	%197 = zext i1 %196 to i32
	%198 = zext i32 %197 to i64
	%199 = load %ast.AstNode** %lhs
	%200 = getelementptr %ast.AstNode* %199, i32 0, i32 8
	store i64 %198, i64* %200
	%201 = load %ast.AstNode** %lhs
	store %ast.AstNode* %201, %ast.AstNode** %rv.0
	br label %return
L.27:
	%202 = load %ast.AstNode** %lhs
	%203 = getelementptr %ast.AstNode* %202, i32 0, i32 8
	%204 = load i64* %203
	%205 = load %ast.AstNode** %rhs
	%206 = getelementptr %ast.AstNode* %205, i32 0, i32 8
	%207 = load i64* %206
	%208 = icmp slt i64 %204, %207
	%209 = zext i1 %208 to i32
	%210 = zext i32 %209 to i64
	%211 = load %ast.AstNode** %lhs
	%212 = getelementptr %ast.AstNode* %211, i32 0, i32 8
	store i64 %210, i64* %212
	%213 = load %ast.AstNode** %lhs
	store %ast.AstNode* %213, %ast.AstNode** %rv.0
	br label %return
L.28:
	%214 = load %ast.AstNode** %lhs
	%215 = getelementptr %ast.AstNode* %214, i32 0, i32 8
	%216 = load i64* %215
	%217 = load %ast.AstNode** %rhs
	%218 = getelementptr %ast.AstNode* %217, i32 0, i32 8
	%219 = load i64* %218
	%220 = icmp sgt i64 %216, %219
	%221 = zext i1 %220 to i32
	%222 = zext i32 %221 to i64
	%223 = load %ast.AstNode** %lhs
	%224 = getelementptr %ast.AstNode* %223, i32 0, i32 8
	store i64 %222, i64* %224
	%225 = load %ast.AstNode** %lhs
	store %ast.AstNode* %225, %ast.AstNode** %rv.0
	br label %return
L.29:
	%226 = load %ast.AstNode** %lhs
	%227 = getelementptr %ast.AstNode* %226, i32 0, i32 8
	%228 = load i64* %227
	%229 = load %ast.AstNode** %rhs
	%230 = getelementptr %ast.AstNode* %229, i32 0, i32 8
	%231 = load i64* %230
	%232 = icmp sle i64 %228, %231
	%233 = zext i1 %232 to i32
	%234 = zext i32 %233 to i64
	%235 = load %ast.AstNode** %lhs
	%236 = getelementptr %ast.AstNode* %235, i32 0, i32 8
	store i64 %234, i64* %236
	%237 = load %ast.AstNode** %lhs
	store %ast.AstNode* %237, %ast.AstNode** %rv.0
	br label %return
L.30:
	%238 = load %ast.AstNode** %lhs
	%239 = getelementptr %ast.AstNode* %238, i32 0, i32 8
	%240 = load i64* %239
	%241 = load %ast.AstNode** %rhs
	%242 = getelementptr %ast.AstNode* %241, i32 0, i32 8
	%243 = load i64* %242
	%244 = icmp sge i64 %240, %243
	%245 = zext i1 %244 to i32
	%246 = zext i32 %245 to i64
	%247 = load %ast.AstNode** %lhs
	%248 = getelementptr %ast.AstNode* %247, i32 0, i32 8
	store i64 %246, i64* %248
	%249 = load %ast.AstNode** %lhs
	store %ast.AstNode* %249, %ast.AstNode** %rv.0
	br label %return
L.10:
	br label %L.11
L.11:
	br label %L.7
L.9:
	store i8 1, i8* %swap
	br label %L.7
L.7:
	br label %L.5
L.5:
	%250 = load %ast.AstNode** %lhs
	%251 = getelementptr %ast.AstNode* %250, i32 0, i32 1
	%252 = load i8* %251
	%253 = icmp eq i8 %252, 4
	br i1 %253, label %L.40, label %L.39
L.40:
	%254 = load %ast.AstNode** %rhs
	%255 = getelementptr %ast.AstNode* %254, i32 0, i32 0
	%256 = load i8* %255
	%257 = icmp eq i8 %256, 7
	br i1 %257, label %L.42, label %L.41
L.42:
	%258 = load i8* %op
	%259 = icmp eq i8 %258, 38
	br i1 %259, label %L.44, label %L.43
L.43:
	%260 = load i8* %op
	%261 = icmp eq i8 %260, 39
	br label %L.44
L.44:
	%262 = phi i1 [ true, %L.42 ], [ %261, %L.43 ]
	br i1 %262, label %L.46, label %L.45
L.46:
	%263 = load %ast.AstNode** %rhs
	%264 = getelementptr %ast.AstNode* %263, i32 0, i32 1
	store i8 4, i8* %264
	%265 = load %target.TargetT** @target_Target
	%266 = getelementptr %target.TargetT* %265, i32 0, i32 8
	%267 = getelementptr %target.SizeAlign* %266, i32 0, i32 0
	%268 = load i8* %267
	%269 = load %ast.AstNode** %rhs
	%270 = getelementptr %ast.AstNode* %269, i32 0, i32 2
	store i8 %268, i8* %270
	br label %L.45
L.45:
	br label %L.41
L.41:
	br label %L.39
L.39:
	%271 = load %ast.AstNode** %lhs
	%272 = getelementptr %ast.AstNode* %271, i32 0, i32 2
	%273 = load i8* %272
	store i8 %273, i8* %sl
	%274 = load %ast.AstNode** %rhs
	%275 = getelementptr %ast.AstNode* %274, i32 0, i32 2
	%276 = load i8* %275
	store i8 %276, i8* %sr
	%277 = load i8* %sl
	%278 = load i8* %sr
	%279 = icmp ugt i8 %277, %278
	br i1 %279, label %L.48, label %L.49
L.48:
	%280 = load %ast.AstNode** %rhs
	%281 = load i8* %sl
	%282 = zext i8 %281 to i32
	%283 = call %ast.AstNode* @expr_Extend(%ast.AstNode* %280, i32 %282)
	store %ast.AstNode* %283, %ast.AstNode** %rhs
	br label %L.47
L.49:
	%284 = load i8* %sr
	%285 = load i8* %sl
	%286 = icmp ugt i8 %284, %285
	br i1 %286, label %L.51, label %L.50
L.51:
	%287 = load %ast.AstNode** %lhs
	%288 = load i8* %sr
	%289 = zext i8 %288 to i32
	%290 = call %ast.AstNode* @expr_Extend(%ast.AstNode* %287, i32 %289)
	store %ast.AstNode* %290, %ast.AstNode** %lhs
	br label %L.50
L.50:
	br label %L.47
L.47:
	%291 = load i8* %op
	%292 = load %ast.AstNode** %lhs
	%293 = getelementptr %ast.AstNode* %292, i32 0, i32 9
	%294 = load %type.TypeNode** %293
	%295 = load %ast.AstNode** %lhs
	%296 = load %ast.AstNode** %rhs
	%297 = call %ast.AstNode* @ast_New2(i8 %291, %type.TypeNode* %294, %ast.AstNode* %295, %ast.AstNode* %296)
	store %ast.AstNode* %297, %ast.AstNode** %tree
	%298 = load %ast.AstNode** %tree
	store %ast.AstNode* %298, %ast.AstNode** %rv.0
	br label %return
return:
	%299 = load %ast.AstNode** %rv.0
	ret %ast.AstNode* %299
}
define %ast.AstNode* @expr_Intrinsic(%symb.SymbNode* %ps.arg) nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%ps = alloca %symb.SymbNode*
	store %symb.SymbNode* %ps.arg, %symb.SymbNode** %ps
	%tree = alloca %ast.AstNode*
	%lhs = alloca %ast.AstNode*
	%rhs = alloca %ast.AstNode*
	%tok = alloca i8
	%which = alloca i8
	%op = alloca i8
	store %ast.AstNode* null, %ast.AstNode** %tree
	%0 = load i8* @lex_Token
	store i8 %0, i8* %tok
	%1 = load i8* %tok
	%2 = icmp eq i8 %1, 32
	br i1 %2, label %L.2, label %L.3
L.2:
	%3 = call i8 @lex_Next()
	store i8 %3, i8* %tok
	%4 = load %symb.SymbNode** %ps
	%5 = getelementptr %symb.SymbNode* %4, i32 0, i32 7
	%6 = load i64* %5
	%7 = trunc i64 %6 to i8
	store i8 %7, i8* %which
	%8 = load i8* %which
	%9 = zext i8 %8 to i32
	switch i32 %9, label %L.4 [
		i32 1, label %L.6
		i32 2, label %L.7
		i32 3, label %L.7
	]
L.6:
	%10 = call %ast.AstNode* @expr_Bool(%type.TypeNode* null)
	store %ast.AstNode* %10, %ast.AstNode** %rhs
	%11 = load %ast.AstNode** %rhs
	%12 = icmp ne %ast.AstNode* %11, null
	br i1 %12, label %L.9, label %L.8
L.9:
	%13 = load %ast.AstNode** %rhs
	%14 = getelementptr %ast.AstNode* %13, i32 0, i32 0
	%15 = load i8* %14
	%16 = icmp eq i8 %15, 7
	br i1 %16, label %L.11, label %L.12
L.11:
	%17 = load %ast.AstNode** %rhs
	%18 = getelementptr %ast.AstNode* %17, i32 0, i32 1
	%19 = load i8* %18
	%20 = icmp eq i8 %19, 3
	br i1 %20, label %L.13, label %L.14
L.13:
	%21 = load %ast.AstNode** %rhs
	%22 = getelementptr %ast.AstNode* %21, i32 0, i32 8
	%23 = load i64* %22
	%24 = icmp slt i64 %23, 0
	br label %L.14
L.14:
	%25 = phi i1 [ false, %L.11 ], [ %24, %L.13 ]
	br i1 %25, label %L.16, label %L.15
L.16:
	%26 = load %ast.AstNode** %rhs
	%27 = getelementptr %ast.AstNode* %26, i32 0, i32 8
	%28 = load i64* %27
	%29 = sub i64 0, %28
	%30 = load %ast.AstNode** %rhs
	%31 = getelementptr %ast.AstNode* %30, i32 0, i32 8
	store i64 %29, i64* %31
	br label %L.15
L.15:
	%32 = load %ast.AstNode** %rhs
	store %ast.AstNode* %32, %ast.AstNode** %tree
	br label %L.10
L.12:
	%33 = load %ast.AstNode** %rhs
	%34 = getelementptr %ast.AstNode* %33, i32 0, i32 9
	%35 = load %type.TypeNode** %34
	%36 = load %ast.AstNode** %rhs
	%37 = call %ast.AstNode* @ast_New1(i8 31, %type.TypeNode* %35, %ast.AstNode* %36)
	store %ast.AstNode* %37, %ast.AstNode** %lhs
	%38 = load %type.TypeNode** @type_booltype
	%39 = load %ast.AstNode** %rhs
	%40 = load %ast.AstNode** %rhs
	%41 = getelementptr %ast.AstNode* %40, i32 0, i32 9
	%42 = load %type.TypeNode** %41
	%43 = call %ast.AstNode* @ast_Const(%type.TypeNode* %42, i64 0)
	%44 = call %ast.AstNode* @ast_New2(i8 44, %type.TypeNode* %38, %ast.AstNode* %39, %ast.AstNode* %43)
	store %ast.AstNode* %44, %ast.AstNode** %tree
	%45 = load %ast.AstNode** %rhs
	%46 = getelementptr %ast.AstNode* %45, i32 0, i32 9
	%47 = load %type.TypeNode** %46
	%48 = load %ast.AstNode** %tree
	%49 = load %ast.AstNode** %lhs
	%50 = load %ast.AstNode** %rhs
	%51 = call %ast.AstNode* @ast_New3(i8 62, %type.TypeNode* %47, %ast.AstNode* %48, %ast.AstNode* %49, %ast.AstNode* %50)
	store %ast.AstNode* %51, %ast.AstNode** %tree
	br label %L.10
L.10:
	br label %L.8
L.8:
	%52 = load %ast.AstNode** %tree
	%53 = getelementptr %ast.AstNode* %52, i32 0, i32 1
	%54 = load i8* %53
	%55 = icmp eq i8 %54, 3
	br i1 %55, label %L.18, label %L.17
L.18:
	%i = alloca i32
	store i32 0, i32* %i
	br label %L.19
L.19:
	%56 = load i32* %i
	%57 = icmp ult i32 %56, 4
	br i1 %57, label %L.22, label %L.23
L.22:
	%58 = load %ast.AstNode** %tree
	%59 = getelementptr %ast.AstNode* %58, i32 0, i32 2
	%60 = load i8* %59
	%61 = zext i8 %60 to i32
	%62 = load i32* %i
	%63 = getelementptr [4 x %type.TypeNode*]* @type_inttypes, i32 0, i32 %62
	%64 = load %type.TypeNode** %63
	%65 = getelementptr %type.TypeNode* %64, i32 0, i32 7
	%66 = load i32* %65
	%67 = icmp ugt i32 %61, %66
	br label %L.23
L.23:
	%68 = phi i1 [ false, %L.19 ], [ %67, %L.22 ]
	%69 = xor i1 %68, true
	br i1 %69, label %L.20, label %L.21
L.21:
	%70 = load i32* %i
	%71 = add i32 %70, 1
	store i32 %71, i32* %i
	br label %L.19
L.20:
	%72 = load i32* %i
	%73 = getelementptr [4 x %type.TypeNode*]* @type_uinttypes, i32 0, i32 %72
	%74 = load %type.TypeNode** %73
	%75 = load %ast.AstNode** %tree
	%76 = getelementptr %ast.AstNode* %75, i32 0, i32 9
	store %type.TypeNode* %74, %type.TypeNode** %76
	%77 = load %ast.AstNode** %tree
	%78 = getelementptr %ast.AstNode* %77, i32 0, i32 1
	store i8 2, i8* %78
	br label %L.17
L.17:
	br label %L.5
L.7:
	%79 = call %ast.AstNode* @expr_Bool(%type.TypeNode* null)
	store %ast.AstNode* %79, %ast.AstNode** %lhs
	%80 = call i8 @lex_Expect(i8 5)
	%81 = call %ast.AstNode* @expr_Bool(%type.TypeNode* null)
	store %ast.AstNode* %81, %ast.AstNode** %rhs
	%82 = load %ast.AstNode** %lhs
	%83 = icmp ne %ast.AstNode* %82, null
	br i1 %83, label %L.24, label %L.25
L.24:
	%84 = load %ast.AstNode** %rhs
	%85 = icmp ne %ast.AstNode* %84, null
	br label %L.25
L.25:
	%86 = phi i1 [ false, %L.7 ], [ %85, %L.24 ]
	br i1 %86, label %L.27, label %L.26
L.27:
	%87 = load %ast.AstNode** %lhs
	%88 = load %ast.AstNode** %rhs
	%89 = call i8 @expr_IsSignedBinOp(%ast.AstNode* %87, %ast.AstNode* %88)
	%90 = icmp ne i8 %89, 0
	br i1 %90, label %L.29, label %L.30
L.29:
	%91 = load i8* %which
	%92 = icmp eq i8 %91, 2
	br i1 %92, label %L.32, label %L.33
L.32:
	store i8 50, i8* %op
	br label %L.31
L.33:
	store i8 51, i8* %op
	br label %L.31
L.31:
	br label %L.28
L.30:
	%93 = load i8* %which
	%94 = icmp eq i8 %93, 2
	br i1 %94, label %L.35, label %L.36
L.35:
	store i8 48, i8* %op
	br label %L.34
L.36:
	store i8 49, i8* %op
	br label %L.34
L.34:
	br label %L.28
L.28:
	%95 = load i8* %op
	%96 = load %ast.AstNode** %lhs
	%97 = load %ast.AstNode** %rhs
	%98 = call %ast.AstNode* @expr_BinOp(i8 %95, %ast.AstNode* %96, %ast.AstNode* %97)
	store %ast.AstNode* %98, %ast.AstNode** %tree
	%99 = load %ast.AstNode** %tree
	%100 = getelementptr %ast.AstNode* %99, i32 0, i32 0
	%101 = load i8* %100
	%102 = icmp ne i8 %101, 7
	br i1 %102, label %L.38, label %L.37
L.38:
	%103 = load %ast.AstNode** %tree
	%104 = getelementptr %ast.AstNode* %103, i32 0, i32 11
	%105 = getelementptr [0 x %ast.AstNode*]* %104, i32 0, i32 0
	%106 = load %ast.AstNode** %105
	store %ast.AstNode* %106, %ast.AstNode** %lhs
	%107 = load %ast.AstNode** %tree
	%108 = getelementptr %ast.AstNode* %107, i32 0, i32 11
	%109 = getelementptr [0 x %ast.AstNode*]* %108, i32 0, i32 1
	%110 = load %ast.AstNode** %109
	store %ast.AstNode* %110, %ast.AstNode** %rhs
	%111 = load i8* %op
	%112 = zext i8 %111 to i32
	switch i32 %112, label %L.39 [
		i32 50, label %L.41
		i32 51, label %L.42
		i32 48, label %L.43
		i32 49, label %L.44
	]
L.41:
	%113 = load %ast.AstNode** %tree
	%114 = getelementptr %ast.AstNode* %113, i32 0, i32 0
	store i8 44, i8* %114
	br label %L.40
L.42:
	%115 = load %ast.AstNode** %tree
	%116 = getelementptr %ast.AstNode* %115, i32 0, i32 0
	store i8 45, i8* %116
	br label %L.40
L.43:
	%117 = load %ast.AstNode** %tree
	%118 = getelementptr %ast.AstNode* %117, i32 0, i32 0
	store i8 40, i8* %118
	br label %L.40
L.44:
	%119 = load %ast.AstNode** %tree
	%120 = getelementptr %ast.AstNode* %119, i32 0, i32 0
	store i8 41, i8* %120
	br label %L.40
L.39:
	br label %L.40
L.40:
	%121 = load %ast.AstNode** %lhs
	%122 = getelementptr %ast.AstNode* %121, i32 0, i32 9
	%123 = load %type.TypeNode** %122
	%124 = load %ast.AstNode** %tree
	%125 = load %ast.AstNode** %lhs
	%126 = load %ast.AstNode** %rhs
	%127 = call %ast.AstNode* @ast_New3(i8 62, %type.TypeNode* %123, %ast.AstNode* %124, %ast.AstNode* %125, %ast.AstNode* %126)
	store %ast.AstNode* %127, %ast.AstNode** %tree
	br label %L.37
L.37:
	br label %L.26
L.26:
	br label %L.5
L.4:
	%128 = getelementptr [19 x i8]* @.str502
	%129 = bitcast [19 x i8]* %128 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %129)
	br label %L.5
L.5:
	%130 = call i8 @lex_Expect(i8 33)
	store i8 %130, i8* %tok
	br label %L.1
L.3:
	call void @lex_ErrorT(i8 10, i8 32)
	br label %L.1
L.1:
	%131 = load %ast.AstNode** %tree
	store %ast.AstNode* %131, %ast.AstNode** %rv.0
	br label %return
return:
	%132 = load %ast.AstNode** %rv.0
	ret %ast.AstNode* %132
}
define %ast.AstNode* @expr_Call(%symb.SymbNode* %ps.arg, %ast.AstNode* %tree.arg, %ast.AstNode* %arg.arg) nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%ps = alloca %symb.SymbNode*
	%tree = alloca %ast.AstNode*
	%arg = alloca %ast.AstNode*
	store %symb.SymbNode* %ps.arg, %symb.SymbNode** %ps
	store %ast.AstNode* %tree.arg, %ast.AstNode** %tree
	store %ast.AstNode* %arg.arg, %ast.AstNode** %arg
	%t = alloca %type.TypeNode*
	%s = alloca %symb.SymbNode*
	%tok = alloca i8
	%0 = load %symb.SymbNode** %ps
	%1 = getelementptr %symb.SymbNode* %0, i32 0, i32 1
	%2 = load %type.TypeNode** %1
	store %type.TypeNode* %2, %type.TypeNode** %t
	%3 = load %ast.AstNode** %tree
	%4 = icmp eq %ast.AstNode* %3, null
	br i1 %4, label %L.2, label %L.3
L.2:
	%5 = load %type.TypeNode** %t
	%6 = call %ast.AstNode* @ast_New(i8 10, %type.TypeNode* %5)
	store %ast.AstNode* %6, %ast.AstNode** %tree
	%7 = load %symb.SymbNode** %ps
	%8 = load %ast.AstNode** %tree
	%9 = getelementptr %ast.AstNode* %8, i32 0, i32 10
	store %symb.SymbNode* %7, %symb.SymbNode** %9
	br label %L.1
L.3:
	%10 = load %type.TypeNode** %t
	%11 = load %ast.AstNode** %tree
	%12 = call %ast.AstNode* @ast_New1(i8 11, %type.TypeNode* %10, %ast.AstNode* %11)
	store %ast.AstNode* %12, %ast.AstNode** %tree
	%13 = load %type.TypeNode** %t
	%14 = icmp ne %type.TypeNode* %13, null
	br i1 %14, label %L.5, label %L.6
L.5:
	%15 = load %type.TypeNode** %t
	%16 = getelementptr %type.TypeNode* %15, i32 0, i32 11
	%17 = load i8* %16
	%18 = load %ast.AstNode** %tree
	%19 = getelementptr %ast.AstNode* %18, i32 0, i32 1
	store i8 %17, i8* %19
	br label %L.4
L.6:
	%20 = load %ast.AstNode** %tree
	%21 = getelementptr %ast.AstNode* %20, i32 0, i32 1
	store i8 0, i8* %21
	br label %L.4
L.4:
	%22 = load %symb.SymbNode** %ps
	%23 = load %ast.AstNode** %tree
	%24 = getelementptr %ast.AstNode* %23, i32 0, i32 10
	store %symb.SymbNode* %22, %symb.SymbNode** %24
	br label %L.1
L.1:
	%25 = load %type.TypeNode** %t
	%26 = icmp ne %type.TypeNode* %25, null
	br i1 %26, label %L.8, label %L.7
L.8:
	%27 = load %type.TypeNode** %t
	%28 = getelementptr %type.TypeNode* %27, i32 0, i32 11
	%29 = load i8* %28
	%30 = load %ast.AstNode** %tree
	%31 = getelementptr %ast.AstNode* %30, i32 0, i32 1
	store i8 %29, i8* %31
	%32 = load %type.TypeNode** %t
	%33 = getelementptr %type.TypeNode* %32, i32 0, i32 8
	%34 = load i32* %33
	%35 = trunc i32 %34 to i8
	%36 = load %ast.AstNode** %tree
	%37 = getelementptr %ast.AstNode* %36, i32 0, i32 2
	store i8 %35, i8* %37
	%38 = load %type.TypeNode** %t
	%39 = getelementptr %type.TypeNode* %38, i32 0, i32 11
	%40 = load i8* %39
	%41 = icmp eq i8 %40, 4
	br i1 %41, label %L.10, label %L.9
L.10:
	%42 = load %type.TypeNode** %t
	%43 = getelementptr %type.TypeNode* %42, i32 0, i32 0
	%44 = load %type.TypeNode** %43
	%45 = load %ast.AstNode** %tree
	%46 = getelementptr %ast.AstNode* %45, i32 0, i32 9
	store %type.TypeNode* %44, %type.TypeNode** %46
	%47 = load %target.TargetT** @target_Target
	%48 = getelementptr %target.TargetT* %47, i32 0, i32 8
	%49 = getelementptr %target.SizeAlign* %48, i32 0, i32 0
	%50 = load i8* %49
	%51 = load %ast.AstNode** %tree
	%52 = getelementptr %ast.AstNode* %51, i32 0, i32 2
	store i8 %50, i8* %52
	br label %L.9
L.9:
	br label %L.7
L.7:
	%53 = load %symb.SymbNode** %ps
	%54 = getelementptr %symb.SymbNode* %53, i32 0, i32 3
	%55 = load %symb.SymbNode** %54
	store %symb.SymbNode* %55, %symb.SymbNode** %s
	%56 = load %ast.AstNode** %arg
	%57 = icmp ne %ast.AstNode* %56, null
	br i1 %57, label %L.12, label %L.11
L.12:
	%58 = load %ast.AstNode** %arg
	%59 = call %ast.AstNode* @expr_Load(%ast.AstNode* %58)
	store %ast.AstNode* %59, %ast.AstNode** %arg
	%60 = load %ast.AstNode** %arg
	%61 = load %symb.SymbNode** %s
	%62 = getelementptr %symb.SymbNode* %61, i32 0, i32 1
	%63 = load %type.TypeNode** %62
	%64 = call %ast.AstNode* @expr_Actual(%ast.AstNode* %60, %type.TypeNode* %63)
	store %ast.AstNode* %64, %ast.AstNode** %arg
	%65 = load %ast.AstNode** %tree
	%66 = load %ast.AstNode** %arg
	%67 = call %ast.AstNode* @ast_Child(%ast.AstNode* %65, %ast.AstNode* %66)
	store %ast.AstNode* %67, %ast.AstNode** %tree
	%68 = load %symb.SymbNode** %s
	%69 = getelementptr %symb.SymbNode* %68, i32 0, i32 0
	%70 = load %symb.SymbNode** %69
	store %symb.SymbNode* %70, %symb.SymbNode** %s
	br label %L.11
L.11:
	%71 = load i8* @lex_Token
	store i8 %71, i8* %tok
	%72 = load i8* %tok
	%73 = icmp eq i8 %72, 32
	br i1 %73, label %L.14, label %L.15
L.14:
	%74 = call i8 @lex_Next()
	store i8 %74, i8* %tok
	%75 = load i8* %tok
	%76 = icmp ne i8 %75, 33
	br i1 %76, label %L.17, label %L.16
L.17:
	br label %L.18
L.18:
	%77 = load %symb.SymbNode** %s
	%78 = icmp eq %symb.SymbNode* %77, null
	br i1 %78, label %L.21, label %L.20
L.21:
	call void @lex_Error(i8 56)
	%79 = getelementptr [4 x i8]* @expr_skiplist
	%80 = bitcast [4 x i8]* %79 to [0 x i8]*
	%81 = call i8 @lex_Skip([0 x i8]* %80)
	store i8 %81, i8* %tok
	br label %L.19
L.20:
	%82 = load %symb.SymbNode** %s
	%83 = getelementptr %symb.SymbNode* %82, i32 0, i32 1
	%84 = load %type.TypeNode** %83
	%85 = call %ast.AstNode* @expr_Actual(%ast.AstNode* null, %type.TypeNode* %84)
	store %ast.AstNode* %85, %ast.AstNode** %arg
	%86 = load %ast.AstNode** %tree
	%87 = load %ast.AstNode** %arg
	%88 = call %ast.AstNode* @ast_Child(%ast.AstNode* %86, %ast.AstNode* %87)
	store %ast.AstNode* %88, %ast.AstNode** %tree
	%89 = load %symb.SymbNode** %s
	%90 = getelementptr %symb.SymbNode* %89, i32 0, i32 0
	%91 = load %symb.SymbNode** %90
	store %symb.SymbNode* %91, %symb.SymbNode** %s
	%92 = load i8* @lex_Token
	store i8 %92, i8* %tok
	%93 = load i8* %tok
	%94 = icmp ne i8 %93, 5
	br i1 %94, label %L.19, label %L.22
L.22:
	%95 = call i8 @lex_Next()
	store i8 %95, i8* %tok
	br label %L.18
L.19:
	br label %L.16
L.16:
	%96 = call i8 @lex_Expect(i8 33)
	store i8 %96, i8* %tok
	br label %L.13
L.15:
	call void @lex_ErrorT(i8 10, i8 32)
	br label %L.13
L.13:
	%97 = load %symb.SymbNode** %s
	%98 = icmp ne %symb.SymbNode* %97, null
	br i1 %98, label %L.24, label %L.23
L.24:
	call void @lex_Error(i8 55)
	br label %L.23
L.23:
	%99 = load %ast.AstNode** %tree
	store %ast.AstNode* %99, %ast.AstNode** %rv.0
	br label %return
return:
	%100 = load %ast.AstNode** %rv.0
	ret %ast.AstNode* %100
}
define %ast.AstNode* @expr_Atom(%symb.SymbNode* %s.arg) nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%s = alloca %symb.SymbNode*
	store %symb.SymbNode* %s.arg, %symb.SymbNode** %s
	%tree = alloca %ast.AstNode*
	%t = alloca %type.TypeNode*
	store %ast.AstNode* null, %ast.AstNode** %tree
	%0 = load %symb.SymbNode** %s
	%1 = icmp ne %symb.SymbNode* %0, null
	br i1 %1, label %L.2, label %L.1
L.2:
	%2 = load %symb.SymbNode** %s
	%3 = getelementptr %symb.SymbNode* %2, i32 0, i32 1
	%4 = load %type.TypeNode** %3
	store %type.TypeNode* %4, %type.TypeNode** %t
	%5 = load %symb.SymbNode** %s
	%6 = getelementptr %symb.SymbNode* %5, i32 0, i32 12
	%7 = load i8* %6
	%8 = zext i8 %7 to i32
	switch i32 %8, label %L.3 [
		i32 3, label %L.5
		i32 1, label %L.6
		i32 5, label %L.7
		i32 2, label %L.8
	]
L.5:
	%9 = load %type.TypeNode** %t
	%10 = call %ast.AstNode* @ast_New(i8 9, %type.TypeNode* %9)
	store %ast.AstNode* %10, %ast.AstNode** %tree
	%11 = load %symb.SymbNode** %s
	%12 = load %ast.AstNode** %tree
	%13 = getelementptr %ast.AstNode* %12, i32 0, i32 10
	store %symb.SymbNode* %11, %symb.SymbNode** %13
	%14 = load %ast.AstNode** %tree
	%15 = getelementptr %ast.AstNode* %14, i32 0, i32 1
	store i8 4, i8* %15
	%16 = load %type.TypeNode** %t
	%17 = getelementptr %type.TypeNode* %16, i32 0, i32 8
	%18 = load i32* %17
	%19 = trunc i32 %18 to i8
	%20 = load %ast.AstNode** %tree
	%21 = getelementptr %ast.AstNode* %20, i32 0, i32 2
	store i8 %19, i8* %21
	br label %L.4
L.6:
	%22 = load %type.TypeNode** %t
	%23 = getelementptr %type.TypeNode* %22, i32 0, i32 11
	%24 = load i8* %23
	%25 = icmp ule i8 %24, 4
	br i1 %25, label %L.10, label %L.9
L.9:
	%26 = load %type.TypeNode** %t
	%27 = getelementptr %type.TypeNode* %26, i32 0, i32 12
	%28 = load i8* %27
	%29 = icmp eq i8 %28, 2
	br label %L.10
L.10:
	%30 = phi i1 [ true, %L.6 ], [ %29, %L.9 ]
	br i1 %30, label %L.12, label %L.13
L.12:
	%31 = load %type.TypeNode** %t
	%32 = load %symb.SymbNode** %s
	%33 = getelementptr %symb.SymbNode* %32, i32 0, i32 7
	%34 = load i64* %33
	%35 = call %ast.AstNode* @ast_Const(%type.TypeNode* %31, i64 %34)
	store %ast.AstNode* %35, %ast.AstNode** %tree
	br label %L.11
L.13:
	%36 = load %type.TypeNode** %t
	%37 = call %ast.AstNode* @ast_New(i8 9, %type.TypeNode* %36)
	store %ast.AstNode* %37, %ast.AstNode** %tree
	%38 = load %symb.SymbNode** %s
	%39 = load %ast.AstNode** %tree
	%40 = getelementptr %ast.AstNode* %39, i32 0, i32 10
	store %symb.SymbNode* %38, %symb.SymbNode** %40
	%41 = load %ast.AstNode** %tree
	%42 = getelementptr %ast.AstNode* %41, i32 0, i32 1
	store i8 4, i8* %42
	%43 = load %type.TypeNode** %t
	%44 = getelementptr %type.TypeNode* %43, i32 0, i32 8
	%45 = load i32* %44
	%46 = trunc i32 %45 to i8
	%47 = load %ast.AstNode** %tree
	%48 = getelementptr %ast.AstNode* %47, i32 0, i32 2
	store i8 %46, i8* %48
	br label %L.11
L.11:
	%49 = load %type.TypeNode** %t
	%50 = getelementptr %type.TypeNode* %49, i32 0, i32 11
	%51 = load i8* %50
	%52 = icmp eq i8 %51, 4
	br i1 %52, label %L.15, label %L.14
L.15:
	%53 = load %type.TypeNode** %t
	%54 = getelementptr %type.TypeNode* %53, i32 0, i32 0
	%55 = load %type.TypeNode** %54
	%56 = load %ast.AstNode** %tree
	%57 = getelementptr %ast.AstNode* %56, i32 0, i32 9
	store %type.TypeNode* %55, %type.TypeNode** %57
	br label %L.14
L.14:
	br label %L.4
L.7:
	%58 = load %symb.SymbNode** %s
	%59 = getelementptr %symb.SymbNode* %58, i32 0, i32 7
	%60 = load i64* %59
	%61 = icmp ne i64 %60, 0
	br i1 %61, label %L.17, label %L.18
L.17:
	%62 = load %symb.SymbNode** %s
	%63 = call %ast.AstNode* @expr_Intrinsic(%symb.SymbNode* %62)
	store %ast.AstNode* %63, %ast.AstNode** %tree
	br label %L.16
L.18:
	%64 = load %symb.SymbNode** %s
	%65 = call %ast.AstNode* @expr_Call(%symb.SymbNode* %64, %ast.AstNode* null, %ast.AstNode* null)
	store %ast.AstNode* %65, %ast.AstNode** %tree
	br label %L.16
L.16:
	br label %L.4
L.8:
	%66 = load %type.TypeNode** %t
	%67 = call %ast.AstNode* @ast_New(i8 2, %type.TypeNode* %66)
	store %ast.AstNode* %67, %ast.AstNode** %tree
	br label %L.4
L.3:
	%68 = load %symb.SymbNode** %s
	%69 = getelementptr %symb.SymbNode* %68, i32 0, i32 19
	%70 = getelementptr [0 x i8]* %69
	call void @lex_ErrorI(i8 15, [0 x i8]* %70)
	br label %L.4
L.4:
	br label %L.1
L.1:
	%71 = load %ast.AstNode** %tree
	store %ast.AstNode* %71, %ast.AstNode** %rv.0
	br label %return
return:
	%72 = load %ast.AstNode** %rv.0
	ret %ast.AstNode* %72
}
define %ast.AstNode* @expr_Primary(%symb.SymbNode* %s.arg) nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%s = alloca %symb.SymbNode*
	store %symb.SymbNode* %s.arg, %symb.SymbNode** %s
	%tree = alloca %ast.AstNode*
	%t = alloca %type.TypeNode*
	%bt = alloca %type.TypeNode*
	%tok = alloca i8
	%done = alloca i8
	%0 = load %symb.SymbNode** %s
	%1 = call %ast.AstNode* @expr_Atom(%symb.SymbNode* %0)
	store %ast.AstNode* %1, %ast.AstNode** %tree
	%2 = load i8* @lex_Token
	store i8 %2, i8* %tok
	store i8 0, i8* %done
	br label %L.1
L.1:
	%3 = load i8* %done
	%4 = icmp ne i8 %3, 0
	%5 = xor i1 %4, true
	br i1 %5, label %L.6, label %L.7
L.6:
	%6 = load %ast.AstNode** %tree
	%7 = icmp ne %ast.AstNode* %6, null
	br label %L.7
L.7:
	%8 = phi i1 [ false, %L.1 ], [ %7, %L.6 ]
	br i1 %8, label %L.4, label %L.5
L.4:
	%9 = load %ast.AstNode** %tree
	%10 = getelementptr %ast.AstNode* %9, i32 0, i32 9
	%11 = load %type.TypeNode** %10
	%12 = icmp ne %type.TypeNode* %11, null
	br label %L.5
L.5:
	%13 = phi i1 [ false, %L.7 ], [ %12, %L.4 ]
	%14 = xor i1 %13, true
	br i1 %14, label %L.2, label %L.3
L.3:
	%15 = load %ast.AstNode** %tree
	%16 = getelementptr %ast.AstNode* %15, i32 0, i32 9
	%17 = load %type.TypeNode** %16
	store %type.TypeNode* %17, %type.TypeNode** %t
	%18 = load i8* %tok
	%19 = zext i8 %18 to i32
	switch i32 %19, label %L.8 [
		i32 2, label %L.10
		i32 7, label %L.11
		i32 34, label %L.12
		i32 8, label %L.13
	]
L.10:
	%20 = call i8 @lex_Next()
	store i8 %20, i8* %tok
	%21 = load %ast.AstNode** %tree
	%22 = getelementptr %ast.AstNode* %21, i32 0, i32 0
	%23 = load i8* %22
	%24 = icmp eq i8 %23, 2
	br i1 %24, label %L.15, label %L.16
L.15:
	%25 = load %type.TypeNode** %t
	%26 = getelementptr %type.TypeNode* %25, i32 0, i32 11
	%27 = load i8* %26
	%28 = icmp eq i8 %27, 1
	br i1 %28, label %L.18, label %L.19
L.18:
	%29 = load %type.TypeNode** %t
	%30 = call %ast.AstNode* @expr_EnumConst(%type.TypeNode* %29)
	store %ast.AstNode* %30, %ast.AstNode** %tree
	%31 = call i8 @lex_Next()
	store i8 %31, i8* %tok
	br label %L.17
L.19:
	%32 = load %symb.SymbNode** %s
	%33 = getelementptr %symb.SymbNode* %32, i32 0, i32 19
	%34 = getelementptr [0 x i8]* %33
	call void @lex_ErrorI(i8 22, [0 x i8]* %34)
	br label %L.17
L.17:
	br label %L.14
L.16:
	%35 = load i8* %tok
	%36 = icmp eq i8 %35, 40
	br i1 %36, label %L.21, label %L.22
L.21:
	store %symb.SymbNode* null, %symb.SymbNode** %s
	%37 = load %type.TypeNode** %t
	store %type.TypeNode* %37, %type.TypeNode** %bt
	%38 = load %type.TypeNode** %t
	%39 = getelementptr %type.TypeNode* %38, i32 0, i32 11
	%40 = load i8* %39
	%41 = icmp eq i8 %40, 4
	br i1 %41, label %L.24, label %L.23
L.24:
	%42 = load %type.TypeNode** %t
	%43 = getelementptr %type.TypeNode* %42, i32 0, i32 0
	%44 = load %type.TypeNode** %43
	store %type.TypeNode* %44, %type.TypeNode** %bt
	br label %L.23
L.23:
	%45 = load %type.TypeNode** %bt
	%46 = icmp ne %type.TypeNode* %45, null
	br i1 %46, label %L.26, label %L.25
L.26:
	br label %L.27
L.27:
	%47 = load %type.TypeNode** %bt
	%48 = getelementptr %type.TypeNode* %47, i32 0, i32 4
	%49 = load %symb.SymbNode** %48
	%50 = getelementptr [64 x i8]* @lex_Ident
	%51 = bitcast [64 x i8]* %50 to [0 x i8]*
	%52 = call %symb.SymbNode* @symb_FindMethod(%symb.SymbNode* %49, [0 x i8]* %51)
	store %symb.SymbNode* %52, %symb.SymbNode** %s
	%53 = load %symb.SymbNode** %s
	%54 = icmp ne %symb.SymbNode* %53, null
	br i1 %54, label %L.31, label %L.30
L.30:
	%55 = load %type.TypeNode** %bt
	%56 = getelementptr %type.TypeNode* %55, i32 0, i32 0
	%57 = load %type.TypeNode** %56
	%58 = icmp eq %type.TypeNode* %57, null
	br label %L.31
L.31:
	%59 = phi i1 [ true, %L.27 ], [ %58, %L.30 ]
	br i1 %59, label %L.28, label %L.29
L.29:
	%60 = load %type.TypeNode** %bt
	%61 = getelementptr %type.TypeNode* %60, i32 0, i32 0
	%62 = load %type.TypeNode** %61
	store %type.TypeNode* %62, %type.TypeNode** %bt
	br label %L.27
L.28:
	br label %L.25
L.25:
	%63 = load %symb.SymbNode** %s
	%64 = icmp ne %symb.SymbNode* %63, null
	br i1 %64, label %L.33, label %L.34
L.33:
	%65 = call i8 @lex_Next()
	store i8 %65, i8* %tok
	%66 = load %symb.SymbNode** %s
	%67 = load %ast.AstNode** %tree
	%68 = call %ast.AstNode* @expr_Call(%symb.SymbNode* %66, %ast.AstNode* null, %ast.AstNode* %67)
	store %ast.AstNode* %68, %ast.AstNode** %tree
	br label %L.32
L.34:
	%69 = load %type.TypeNode** %t
	%70 = getelementptr %type.TypeNode* %69, i32 0, i32 11
	%71 = load i8* %70
	%72 = icmp eq i8 %71, 4
	br i1 %72, label %L.36, label %L.35
L.36:
	%73 = load %type.TypeNode** %t
	%74 = getelementptr %type.TypeNode* %73, i32 0, i32 0
	%75 = load %type.TypeNode** %74
	%76 = icmp ne %type.TypeNode* %75, null
	br i1 %76, label %L.38, label %L.39
L.38:
	%77 = load %type.TypeNode** %t
	%78 = getelementptr %type.TypeNode* %77, i32 0, i32 0
	%79 = load %type.TypeNode** %78
	store %type.TypeNode* %79, %type.TypeNode** %t
	%80 = load %type.TypeNode** %t
	%81 = load %ast.AstNode** %tree
	%82 = call %ast.AstNode* @ast_New1(i8 25, %type.TypeNode* %80, %ast.AstNode* %81)
	store %ast.AstNode* %82, %ast.AstNode** %tree
	%83 = load %ast.AstNode** %tree
	%84 = getelementptr %ast.AstNode* %83, i32 0, i32 1
	store i8 4, i8* %84
	%85 = load %target.TargetT** @target_Target
	%86 = getelementptr %target.TargetT* %85, i32 0, i32 8
	%87 = getelementptr %target.SizeAlign* %86, i32 0, i32 0
	%88 = load i8* %87
	%89 = load %ast.AstNode** %tree
	%90 = getelementptr %ast.AstNode* %89, i32 0, i32 2
	store i8 %88, i8* %90
	br label %L.37
L.39:
	call void @lex_Error(i8 16)
	store %ast.AstNode* null, %ast.AstNode** %tree
	br label %L.37
L.37:
	br label %L.35
L.35:
	%91 = load %type.TypeNode** %t
	%92 = getelementptr %type.TypeNode* %91, i32 0, i32 11
	%93 = load i8* %92
	%94 = icmp eq i8 %93, 6
	br i1 %94, label %L.41, label %L.40
L.41:
	%95 = load %type.TypeNode** %t
	%96 = getelementptr %type.TypeNode* %95, i32 0, i32 3
	%97 = load %symb.SymbNode** %96
	%98 = getelementptr [64 x i8]* @lex_Ident
	%99 = bitcast [64 x i8]* %98 to [0 x i8]*
	%100 = call %symb.SymbNode* @symb_FindLocal(%symb.SymbNode* %97, [0 x i8]* %99)
	store %symb.SymbNode* %100, %symb.SymbNode** %s
	%101 = load %symb.SymbNode** %s
	%102 = icmp ne %symb.SymbNode* %101, null
	br i1 %102, label %L.43, label %L.44
L.43:
	%103 = call i8 @lex_Next()
	store i8 %103, i8* %tok
	%104 = load %symb.SymbNode** %s
	%105 = getelementptr %symb.SymbNode* %104, i32 0, i32 1
	%106 = load %type.TypeNode** %105
	store %type.TypeNode* %106, %type.TypeNode** %t
	%107 = load %type.TypeNode** %t
	%108 = load %ast.AstNode** %tree
	%109 = call %ast.AstNode* @ast_New1(i8 16, %type.TypeNode* %107, %ast.AstNode* %108)
	store %ast.AstNode* %109, %ast.AstNode** %tree
	%110 = load %symb.SymbNode** %s
	%111 = getelementptr %symb.SymbNode* %110, i32 0, i32 9
	%112 = load i16* %111
	%113 = zext i16 %112 to i64
	%114 = load %ast.AstNode** %tree
	%115 = getelementptr %ast.AstNode* %114, i32 0, i32 8
	store i64 %113, i64* %115
	%116 = load %ast.AstNode** %tree
	%117 = getelementptr %ast.AstNode* %116, i32 0, i32 1
	store i8 4, i8* %117
	%118 = load %type.TypeNode** %t
	%119 = getelementptr %type.TypeNode* %118, i32 0, i32 8
	%120 = load i32* %119
	%121 = trunc i32 %120 to i8
	%122 = load %ast.AstNode** %tree
	%123 = getelementptr %ast.AstNode* %122, i32 0, i32 2
	store i8 %121, i8* %123
	br label %L.42
L.44:
	%124 = getelementptr [64 x i8]* @lex_Ident
	%125 = bitcast [64 x i8]* %124 to [0 x i8]*
	call void @lex_ErrorI(i8 14, [0 x i8]* %125)
	%126 = call i8 @lex_Next()
	store i8 %126, i8* %tok
	br label %L.42
L.42:
	br label %L.40
L.40:
	br label %L.32
L.32:
	br label %L.20
L.22:
	call void @lex_Error(i8 11)
	br label %L.20
L.20:
	br label %L.14
L.14:
	br label %L.9
L.11:
	%127 = call i8 @lex_Next()
	store i8 %127, i8* %tok
	%128 = load %type.TypeNode** %t
	%129 = getelementptr %type.TypeNode* %128, i32 0, i32 11
	%130 = load i8* %129
	%131 = icmp eq i8 %130, 4
	br i1 %131, label %L.46, label %L.47
L.46:
	%132 = load %type.TypeNode** %t
	%133 = getelementptr %type.TypeNode* %132, i32 0, i32 0
	%134 = load %type.TypeNode** %133
	%135 = icmp ne %type.TypeNode* %134, null
	br i1 %135, label %L.49, label %L.50
L.49:
	%136 = load %type.TypeNode** %t
	%137 = getelementptr %type.TypeNode* %136, i32 0, i32 0
	%138 = load %type.TypeNode** %137
	store %type.TypeNode* %138, %type.TypeNode** %t
	%139 = load %type.TypeNode** %t
	%140 = load %ast.AstNode** %tree
	%141 = call %ast.AstNode* @ast_New1(i8 25, %type.TypeNode* %139, %ast.AstNode* %140)
	store %ast.AstNode* %141, %ast.AstNode** %tree
	%142 = load %ast.AstNode** %tree
	%143 = getelementptr %ast.AstNode* %142, i32 0, i32 1
	store i8 4, i8* %143
	%144 = load %target.TargetT** @target_Target
	%145 = getelementptr %target.TargetT* %144, i32 0, i32 8
	%146 = getelementptr %target.SizeAlign* %145, i32 0, i32 0
	%147 = load i8* %146
	%148 = load %ast.AstNode** %tree
	%149 = getelementptr %ast.AstNode* %148, i32 0, i32 2
	store i8 %147, i8* %149
	br label %L.48
L.50:
	call void @lex_Error(i8 16)
	store %ast.AstNode* null, %ast.AstNode** %tree
	br label %L.48
L.48:
	br label %L.45
L.47:
	%150 = load %type.TypeNode** %t
	%151 = getelementptr %type.TypeNode* %150, i32 0, i32 11
	%152 = load i8* %151
	%153 = icmp eq i8 %152, 7
	br i1 %153, label %L.52, label %L.53
L.52:
	%154 = load %type.TypeNode** %t
	%155 = load %ast.AstNode** %tree
	%156 = call %ast.AstNode* @ast_New1(i8 25, %type.TypeNode* %154, %ast.AstNode* %155)
	store %ast.AstNode* %156, %ast.AstNode** %tree
	%157 = load %ast.AstNode** %tree
	%158 = getelementptr %ast.AstNode* %157, i32 0, i32 1
	store i8 7, i8* %158
	%159 = load %type.TypeNode** %t
	%160 = getelementptr %type.TypeNode* %159, i32 0, i32 3
	%161 = load %symb.SymbNode** %160
	%162 = load %ast.AstNode** %tree
	%163 = call %ast.AstNode* @expr_Call(%symb.SymbNode* %161, %ast.AstNode* %162, %ast.AstNode* null)
	store %ast.AstNode* %163, %ast.AstNode** %tree
	br label %L.51
L.53:
	call void @lex_Error(i8 49)
	br label %L.51
L.51:
	br label %L.45
L.45:
	br label %L.9
L.12:
	%164 = call i8 @lex_Next()
	store i8 %164, i8* %tok
	%165 = load %type.TypeNode** %t
	%166 = getelementptr %type.TypeNode* %165, i32 0, i32 11
	%167 = load i8* %166
	%168 = icmp eq i8 %167, 4
	br i1 %168, label %L.55, label %L.54
L.55:
	%169 = load %type.TypeNode** %t
	%170 = getelementptr %type.TypeNode* %169, i32 0, i32 0
	%171 = load %type.TypeNode** %170
	%172 = icmp ne %type.TypeNode* %171, null
	br i1 %172, label %L.57, label %L.58
L.57:
	%173 = load %type.TypeNode** %t
	%174 = getelementptr %type.TypeNode* %173, i32 0, i32 0
	%175 = load %type.TypeNode** %174
	store %type.TypeNode* %175, %type.TypeNode** %t
	%176 = load %type.TypeNode** %t
	%177 = load %ast.AstNode** %tree
	%178 = call %ast.AstNode* @ast_New1(i8 25, %type.TypeNode* %176, %ast.AstNode* %177)
	store %ast.AstNode* %178, %ast.AstNode** %tree
	%179 = load %ast.AstNode** %tree
	%180 = getelementptr %ast.AstNode* %179, i32 0, i32 1
	store i8 4, i8* %180
	%181 = load %target.TargetT** @target_Target
	%182 = getelementptr %target.TargetT* %181, i32 0, i32 8
	%183 = getelementptr %target.SizeAlign* %182, i32 0, i32 0
	%184 = load i8* %183
	%185 = load %ast.AstNode** %tree
	%186 = getelementptr %ast.AstNode* %185, i32 0, i32 2
	store i8 %184, i8* %186
	br label %L.56
L.58:
	call void @lex_Error(i8 16)
	store %ast.AstNode* null, %ast.AstNode** %tree
	br label %L.56
L.56:
	br label %L.54
L.54:
	%187 = load %type.TypeNode** %t
	%188 = getelementptr %type.TypeNode* %187, i32 0, i32 11
	%189 = load i8* %188
	%190 = icmp eq i8 %189, 5
	br i1 %190, label %L.60, label %L.61
L.60:
	%index = alloca %ast.AstNode*
	%191 = load %type.TypeNode** %t
	%192 = getelementptr %type.TypeNode* %191, i32 0, i32 1
	%193 = load %type.TypeNode** %192
	%194 = call %ast.AstNode* @expr_Bool(%type.TypeNode* %193)
	store %ast.AstNode* %194, %ast.AstNode** %index
	%195 = load i8* @lex_Token
	store i8 %195, i8* %tok
	%196 = load i8* %tok
	%197 = icmp eq i8 %196, 3
	br i1 %197, label %L.63, label %L.64
L.63:
	%len = alloca %ast.AstNode*
	%198 = call i8 @lex_Next()
	store i8 %198, i8* %tok
	%199 = load %type.TypeNode** %t
	%200 = getelementptr %type.TypeNode* %199, i32 0, i32 1
	%201 = load %type.TypeNode** %200
	%202 = call %ast.AstNode* @expr_Bool(%type.TypeNode* %201)
	store %ast.AstNode* %202, %ast.AstNode** %len
	%203 = load %ast.AstNode** %tree
	%204 = load %ast.AstNode** %index
	%205 = load %ast.AstNode** %len
	%206 = call %ast.AstNode* @expr_Slice(%ast.AstNode* %203, %ast.AstNode* %204, %ast.AstNode* %205)
	store %ast.AstNode* %206, %ast.AstNode** %tree
	store i8 1, i8* %done
	br label %L.62
L.64:
	%207 = load %type.TypeNode** %t
	%208 = getelementptr %type.TypeNode* %207, i32 0, i32 0
	%209 = load %type.TypeNode** %208
	store %type.TypeNode* %209, %type.TypeNode** %t
	%210 = load %type.TypeNode** %t
	%211 = load %ast.AstNode** %tree
	%212 = load %ast.AstNode** %index
	%213 = call %ast.AstNode* @ast_New2(i8 17, %type.TypeNode* %210, %ast.AstNode* %211, %ast.AstNode* %212)
	store %ast.AstNode* %213, %ast.AstNode** %tree
	%214 = load %ast.AstNode** %tree
	%215 = getelementptr %ast.AstNode* %214, i32 0, i32 1
	store i8 4, i8* %215
	%216 = load %type.TypeNode** %t
	%217 = getelementptr %type.TypeNode* %216, i32 0, i32 8
	%218 = load i32* %217
	%219 = trunc i32 %218 to i8
	%220 = load %ast.AstNode** %tree
	%221 = getelementptr %ast.AstNode* %220, i32 0, i32 2
	store i8 %219, i8* %221
	br label %L.62
L.62:
	br label %L.59
L.61:
	call void @lex_Error(i8 51)
	br label %L.59
L.59:
	%222 = call i8 @lex_Expect(i8 35)
	store i8 %222, i8* %tok
	br label %L.9
L.13:
	%223 = call i8 @lex_Next()
	store i8 %223, i8* %tok
	%224 = load %type.TypeNode** %t
	%225 = call %ast.AstNode* @expr_Property(%type.TypeNode* %224)
	store %ast.AstNode* %225, %ast.AstNode** %tree
	br label %L.9
L.8:
	store i8 1, i8* %done
	br label %L.9
L.9:
	br label %L.1
L.2:
	%226 = load %ast.AstNode** %tree
	store %ast.AstNode* %226, %ast.AstNode** %rv.0
	br label %return
return:
	%227 = load %ast.AstNode** %rv.0
	ret %ast.AstNode* %227
}
define %ast.AstNode* @expr_Term(%type.TypeNode* %et.arg) nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%et = alloca %type.TypeNode*
	store %type.TypeNode* %et.arg, %type.TypeNode** %et
	%tree = alloca %ast.AstNode*
	%tok = alloca i8
	%t = alloca %type.TypeNode*
	%s = alloca %symb.SymbNode*
	store %ast.AstNode* null, %ast.AstNode** %tree
	%0 = load i8* @lex_Token
	store i8 %0, i8* %tok
	%1 = load i8* %tok
	%2 = zext i8 %1 to i32
	switch i32 %2, label %L.1 [
		i32 40, label %L.3
		i32 38, label %L.4
		i32 39, label %L.5
		i32 32, label %L.6
		i32 36, label %L.7
	]
L.3:
	%3 = getelementptr [64 x i8]* @lex_Ident
	%4 = bitcast [64 x i8]* %3 to [0 x i8]*
	%5 = call %symb.SymbNode* @symb_Find([0 x i8]* %4)
	store %symb.SymbNode* %5, %symb.SymbNode** %s
	%6 = load %symb.SymbNode** %s
	%7 = icmp ne %symb.SymbNode* %6, null
	br i1 %7, label %L.9, label %L.10
L.9:
	%8 = call i8 @lex_Next()
	store i8 %8, i8* %tok
	%9 = load %symb.SymbNode** %s
	%10 = getelementptr %symb.SymbNode* %9, i32 0, i32 12
	%11 = load i8* %10
	%12 = icmp eq i8 %11, 5
	br i1 %12, label %L.13, label %L.14
L.13:
	%13 = load %type.TypeNode** %et
	%14 = icmp ne %type.TypeNode* %13, null
	br label %L.14
L.14:
	%15 = phi i1 [ false, %L.9 ], [ %14, %L.13 ]
	br i1 %15, label %L.11, label %L.12
L.11:
	%16 = load %type.TypeNode** %et
	%17 = getelementptr %type.TypeNode* %16, i32 0, i32 11
	%18 = load i8* %17
	%19 = icmp eq i8 %18, 7
	br label %L.12
L.12:
	%20 = phi i1 [ false, %L.14 ], [ %19, %L.11 ]
	br i1 %20, label %L.16, label %L.17
L.16:
	%21 = load %type.TypeNode** %et
	%22 = call %ast.AstNode* @ast_New(i8 9, %type.TypeNode* %21)
	store %ast.AstNode* %22, %ast.AstNode** %tree
	%23 = load %symb.SymbNode** %s
	%24 = load %ast.AstNode** %tree
	%25 = getelementptr %ast.AstNode* %24, i32 0, i32 10
	store %symb.SymbNode* %23, %symb.SymbNode** %25
	%26 = load %ast.AstNode** %tree
	%27 = getelementptr %ast.AstNode* %26, i32 0, i32 1
	store i8 7, i8* %27
	br label %L.15
L.17:
	%28 = load %symb.SymbNode** %s
	%29 = call %ast.AstNode* @expr_Primary(%symb.SymbNode* %28)
	store %ast.AstNode* %29, %ast.AstNode** %tree
	%30 = load %ast.AstNode** %tree
	%31 = icmp ne %ast.AstNode* %30, null
	br i1 %31, label %L.19, label %L.18
L.19:
	%32 = load %ast.AstNode** %tree
	%33 = getelementptr %ast.AstNode* %32, i32 0, i32 0
	%34 = load i8* %33
	%35 = icmp eq i8 %34, 2
	br i1 %35, label %L.21, label %L.22
L.21:
	%36 = load i8* %tok
	%37 = zext i8 %36 to i32
	switch i32 %37, label %L.23 [
		i32 32, label %L.25
		i32 36, label %L.26
	]
L.25:
	%38 = call i8 @lex_Next()
	store i8 %38, i8* %tok
	%39 = load %ast.AstNode** %tree
	%40 = getelementptr %ast.AstNode* %39, i32 0, i32 9
	%41 = load %type.TypeNode** %40
	store %type.TypeNode* %41, %type.TypeNode** %t
	%42 = call %ast.AstNode* @expr_Bool(%type.TypeNode* null)
	store %ast.AstNode* %42, %ast.AstNode** %tree
	%43 = load %ast.AstNode** %tree
	%44 = load %type.TypeNode** %t
	%45 = call %ast.AstNode* @expr_Cast(%ast.AstNode* %43, %type.TypeNode* %44)
	store %ast.AstNode* %45, %ast.AstNode** %tree
	%46 = call i8 @lex_Expect(i8 33)
	store i8 %46, i8* %tok
	br label %L.24
L.26:
	%47 = load %ast.AstNode** %tree
	%48 = getelementptr %ast.AstNode* %47, i32 0, i32 9
	%49 = load %type.TypeNode** %48
	%50 = call %ast.AstNode* @expr_CompositeValue(%type.TypeNode* %49)
	store %ast.AstNode* %50, %ast.AstNode** %tree
	br label %L.24
L.23:
	br label %L.24
L.24:
	br label %L.20
L.22:
	%51 = load %ast.AstNode** %tree
	%52 = call %ast.AstNode* @expr_Load(%ast.AstNode* %51)
	store %ast.AstNode* %52, %ast.AstNode** %tree
	%53 = load %ast.AstNode** %tree
	%54 = icmp ne %ast.AstNode* %53, null
	br i1 %54, label %L.29, label %L.30
L.29:
	%55 = load %ast.AstNode** %tree
	%56 = getelementptr %ast.AstNode* %55, i32 0, i32 0
	%57 = load i8* %56
	%58 = icmp ne i8 %57, 7
	br label %L.30
L.30:
	%59 = phi i1 [ false, %L.22 ], [ %58, %L.29 ]
	br i1 %59, label %L.27, label %L.28
L.27:
	%60 = load %ast.AstNode** %tree
	%61 = getelementptr %ast.AstNode* %60, i32 0, i32 9
	%62 = load %type.TypeNode** %61
	%63 = load %target.TargetT** @target_Target
	%64 = getelementptr %target.TargetT* %63, i32 0, i32 2
	%65 = load i8* %64
	%66 = call i8 @type_NeedSwap(%type.TypeNode* %62, i8 %65)
	%67 = icmp ne i8 %66, 0
	br label %L.28
L.28:
	%68 = phi i1 [ false, %L.30 ], [ %67, %L.27 ]
	br i1 %68, label %L.32, label %L.31
L.32:
	%69 = load %ast.AstNode** %tree
	%70 = getelementptr %ast.AstNode* %69, i32 0, i32 9
	%71 = load %type.TypeNode** %70
	%72 = load %ast.AstNode** %tree
	%73 = call %ast.AstNode* @ast_New1(i8 30, %type.TypeNode* %71, %ast.AstNode* %72)
	store %ast.AstNode* %73, %ast.AstNode** %tree
	%74 = load %ast.AstNode** %tree
	%75 = getelementptr %ast.AstNode* %74, i32 0, i32 9
	%76 = load %type.TypeNode** %75
	%77 = load %target.TargetT** @target_Target
	%78 = getelementptr %target.TargetT* %77, i32 0, i32 2
	%79 = load i8* %78
	%80 = call %type.TypeNode* @type_ChangeOrder(%type.TypeNode* %76, i8 %79)
	%81 = load %ast.AstNode** %tree
	%82 = getelementptr %ast.AstNode* %81, i32 0, i32 9
	store %type.TypeNode* %80, %type.TypeNode** %82
	br label %L.31
L.31:
	br label %L.20
L.20:
	br label %L.18
L.18:
	br label %L.15
L.15:
	br label %L.8
L.10:
	%83 = load %type.TypeNode** %et
	%84 = icmp ne %type.TypeNode* %83, null
	br i1 %84, label %L.33, label %L.34
L.33:
	%85 = load %type.TypeNode** %et
	%86 = getelementptr %type.TypeNode* %85, i32 0, i32 11
	%87 = load i8* %86
	%88 = icmp eq i8 %87, 1
	br label %L.34
L.34:
	%89 = phi i1 [ false, %L.10 ], [ %88, %L.33 ]
	br i1 %89, label %L.36, label %L.37
L.36:
	%90 = load %type.TypeNode** %et
	%91 = call %ast.AstNode* @expr_EnumConst(%type.TypeNode* %90)
	store %ast.AstNode* %91, %ast.AstNode** %tree
	br label %L.35
L.37:
	%92 = getelementptr [64 x i8]* @lex_Ident
	%93 = bitcast [64 x i8]* %92 to [0 x i8]*
	call void @lex_ErrorI(i8 12, [0 x i8]* %93)
	br label %L.35
L.35:
	%94 = call i8 @lex_Next()
	store i8 %94, i8* %tok
	br label %L.8
L.8:
	br label %L.2
L.4:
	%95 = load %type.TypeNode** %et
	%96 = call %ast.AstNode* @ast_New(i8 7, %type.TypeNode* %95)
	store %ast.AstNode* %96, %ast.AstNode** %tree
	%97 = load i64* @lex_Number
	%98 = load %ast.AstNode** %tree
	%99 = getelementptr %ast.AstNode* %98, i32 0, i32 8
	store i64 %97, i64* %99
	%100 = load %ast.AstNode** %tree
	%101 = getelementptr %ast.AstNode* %100, i32 0, i32 1
	store i8 2, i8* %101
	%102 = load %type.TypeNode** %et
	%103 = icmp eq %type.TypeNode* %102, null
	br i1 %103, label %L.39, label %L.40
L.39:
	%104 = load %type.TypeNode** @type_wordtype
	%105 = load %ast.AstNode** %tree
	%106 = getelementptr %ast.AstNode* %105, i32 0, i32 9
	store %type.TypeNode* %104, %type.TypeNode** %106
	%107 = load i64* @lex_Number
	%108 = call i8 @type_bitsize(i64 %107)
	%109 = load %ast.AstNode** %tree
	%110 = getelementptr %ast.AstNode* %109, i32 0, i32 2
	store i8 %108, i8* %110
	br label %L.38
L.40:
	%111 = load %type.TypeNode** %et
	%112 = getelementptr %type.TypeNode* %111, i32 0, i32 7
	%113 = load i32* %112
	%114 = trunc i32 %113 to i8
	%115 = load %ast.AstNode** %tree
	%116 = getelementptr %ast.AstNode* %115, i32 0, i32 2
	store i8 %114, i8* %116
	%117 = load %type.TypeNode** %et
	%118 = getelementptr %type.TypeNode* %117, i32 0, i32 11
	%119 = load i8* %118
	%120 = icmp eq i8 %119, 4
	br i1 %120, label %L.42, label %L.41
L.42:
	%121 = load %type.TypeNode** %et
	%122 = getelementptr %type.TypeNode* %121, i32 0, i32 0
	%123 = load %type.TypeNode** %122
	%124 = load %ast.AstNode** %tree
	%125 = getelementptr %ast.AstNode* %124, i32 0, i32 9
	store %type.TypeNode* %123, %type.TypeNode** %125
	%126 = load %ast.AstNode** %tree
	%127 = getelementptr %ast.AstNode* %126, i32 0, i32 1
	store i8 4, i8* %127
	%128 = load %target.TargetT** @target_Target
	%129 = getelementptr %target.TargetT* %128, i32 0, i32 8
	%130 = getelementptr %target.SizeAlign* %129, i32 0, i32 0
	%131 = load i8* %130
	%132 = load %ast.AstNode** %tree
	%133 = getelementptr %ast.AstNode* %132, i32 0, i32 2
	store i8 %131, i8* %133
	br label %L.41
L.41:
	br label %L.38
L.38:
	%134 = call i8 @lex_Next()
	store i8 %134, i8* %tok
	br label %L.2
L.5:
	%135 = call %ast.AstNode* @expr_String()
	store %ast.AstNode* %135, %ast.AstNode** %tree
	%136 = call i8 @lex_Next()
	store i8 %136, i8* %tok
	br label %L.2
L.6:
	%137 = call i8 @lex_Next()
	store i8 %137, i8* %tok
	%138 = load %type.TypeNode** %et
	%139 = call %ast.AstNode* @expr_Bool(%type.TypeNode* %138)
	store %ast.AstNode* %139, %ast.AstNode** %tree
	%140 = load i8* @lex_Token
	store i8 %140, i8* %tok
	%141 = call i8 @lex_Expect(i8 33)
	br label %L.2
L.7:
	%142 = load %type.TypeNode** %et
	%143 = call %ast.AstNode* @expr_CompositeValue(%type.TypeNode* %142)
	store %ast.AstNode* %143, %ast.AstNode** %tree
	br label %L.2
L.1:
	br label %L.2
L.2:
	%144 = load %ast.AstNode** %tree
	store %ast.AstNode* %144, %ast.AstNode** %rv.0
	br label %return
return:
	%145 = load %ast.AstNode** %rv.0
	ret %ast.AstNode* %145
}
define %ast.AstNode* @expr_Unary(%type.TypeNode* %t.arg) nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%t = alloca %type.TypeNode*
	store %type.TypeNode* %t.arg, %type.TypeNode** %t
	%tree = alloca %ast.AstNode*
	%tl = alloca %type.TypeNode*
	%tok = alloca i8
	%savetok = alloca i8
	%0 = load i8* @lex_Token
	store i8 %0, i8* %tok
	%1 = load i8* %tok
	store i8 %1, i8* %savetok
	%2 = load i8* %tok
	%3 = zext i8 %2 to i32
	switch i32 %3, label %L.1 [
		i32 15, label %L.3
		i32 14, label %L.3
		i32 13, label %L.3
		i32 12, label %L.3
	]
L.3:
	%4 = call i8 @lex_Next()
	store i8 %4, i8* %tok
	br label %L.2
L.1:
	br label %L.2
L.2:
	%5 = load %type.TypeNode** %t
	%6 = call %ast.AstNode* @expr_Term(%type.TypeNode* %5)
	store %ast.AstNode* %6, %ast.AstNode** %tree
	%7 = load %ast.AstNode** %tree
	%8 = icmp ne %ast.AstNode* %7, null
	br i1 %8, label %L.5, label %L.4
L.5:
	%9 = load %ast.AstNode** %tree
	%10 = getelementptr %ast.AstNode* %9, i32 0, i32 9
	%11 = load %type.TypeNode** %10
	store %type.TypeNode* %11, %type.TypeNode** %tl
	%12 = load i8* %savetok
	%13 = zext i8 %12 to i32
	switch i32 %13, label %L.6 [
		i32 15, label %L.8
		i32 13, label %L.9
		i32 12, label %L.10
	]
L.8:
	%14 = load %ast.AstNode** %tree
	%15 = call %ast.AstNode* @expr_UnOp(i8 31, %ast.AstNode* %14)
	store %ast.AstNode* %15, %ast.AstNode** %tree
	%16 = load %ast.AstNode** %tree
	%17 = getelementptr %ast.AstNode* %16, i32 0, i32 1
	%18 = load i8* %17
	%19 = icmp eq i8 %18, 2
	br i1 %19, label %L.12, label %L.11
L.12:
	%i = alloca i32
	store i32 0, i32* %i
	br label %L.13
L.13:
	%20 = load i32* %i
	%21 = icmp ult i32 %20, 4
	br i1 %21, label %L.16, label %L.17
L.16:
	%22 = load %ast.AstNode** %tree
	%23 = getelementptr %ast.AstNode* %22, i32 0, i32 2
	%24 = load i8* %23
	%25 = zext i8 %24 to i32
	%26 = load i32* %i
	%27 = getelementptr [4 x %type.TypeNode*]* @type_uinttypes, i32 0, i32 %26
	%28 = load %type.TypeNode** %27
	%29 = getelementptr %type.TypeNode* %28, i32 0, i32 7
	%30 = load i32* %29
	%31 = icmp ugt i32 %25, %30
	br label %L.17
L.17:
	%32 = phi i1 [ false, %L.13 ], [ %31, %L.16 ]
	%33 = xor i1 %32, true
	br i1 %33, label %L.14, label %L.15
L.15:
	%34 = load i32* %i
	%35 = add i32 %34, 1
	store i32 %35, i32* %i
	br label %L.13
L.14:
	%36 = load i32* %i
	%37 = getelementptr [4 x %type.TypeNode*]* @type_inttypes, i32 0, i32 %36
	%38 = load %type.TypeNode** %37
	%39 = load %ast.AstNode** %tree
	%40 = getelementptr %ast.AstNode* %39, i32 0, i32 9
	store %type.TypeNode* %38, %type.TypeNode** %40
	%41 = load %ast.AstNode** %tree
	%42 = getelementptr %ast.AstNode* %41, i32 0, i32 1
	store i8 3, i8* %42
	br label %L.11
L.11:
	br label %L.7
L.9:
	%43 = load %ast.AstNode** %tree
	%44 = call %ast.AstNode* @expr_UnOp(i8 32, %ast.AstNode* %43)
	store %ast.AstNode* %44, %ast.AstNode** %tree
	br label %L.7
L.10:
	%45 = load %ast.AstNode** %tree
	%46 = call %ast.AstNode* @expr_ForceBoolean(%ast.AstNode* %45)
	store %ast.AstNode* %46, %ast.AstNode** %tree
	%47 = load %ast.AstNode** %tree
	%48 = call %ast.AstNode* @expr_UnOp(i8 61, %ast.AstNode* %47)
	store %ast.AstNode* %48, %ast.AstNode** %tree
	br label %L.7
L.6:
	br label %L.7
L.7:
	br label %L.4
L.4:
	%49 = load %ast.AstNode** %tree
	store %ast.AstNode* %49, %ast.AstNode** %rv.0
	br label %return
return:
	%50 = load %ast.AstNode** %rv.0
	ret %ast.AstNode* %50
}
@expr_mulop = internal constant [6 x i8] [ i8 35, i8 36, i8 37, i8 52, i8 53, i8 56 ]
define %ast.AstNode* @expr_Mul(%type.TypeNode* %t.arg) nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%t = alloca %type.TypeNode*
	store %type.TypeNode* %t.arg, %type.TypeNode** %t
	%tree = alloca %ast.AstNode*
	%rhs = alloca %ast.AstNode*
	%op = alloca i8
	%tok = alloca i8
	%0 = load %type.TypeNode** %t
	%1 = call %ast.AstNode* @expr_Unary(%type.TypeNode* %0)
	store %ast.AstNode* %1, %ast.AstNode** %tree
	%2 = load %ast.AstNode** %tree
	%3 = icmp ne %ast.AstNode* %2, null
	br i1 %3, label %L.2, label %L.1
L.2:
	br label %L.3
L.3:
	%4 = load i8* @lex_Token
	store i8 %4, i8* %tok
	%5 = load i8* %tok
	%6 = icmp ult i8 %5, 18
	br i1 %6, label %L.7, label %L.6
L.6:
	%7 = load i8* %tok
	%8 = icmp ugt i8 %7, 23
	br label %L.7
L.7:
	%9 = phi i1 [ true, %L.3 ], [ %8, %L.6 ]
	br i1 %9, label %L.4, label %L.5
L.5:
	%10 = load i8* %tok
	%11 = sub i8 %10, 18
	%12 = zext i8 %11 to i32
	%13 = getelementptr [6 x i8]* @expr_mulop, i32 0, i32 %12
	%14 = load i8* %13
	store i8 %14, i8* %op
	%15 = call i8 @lex_Next()
	store i8 %15, i8* %tok
	%16 = load %ast.AstNode** %tree
	%17 = getelementptr %ast.AstNode* %16, i32 0, i32 9
	%18 = load %type.TypeNode** %17
	%19 = call %ast.AstNode* @expr_Unary(%type.TypeNode* %18)
	store %ast.AstNode* %19, %ast.AstNode** %rhs
	%20 = load %ast.AstNode** %rhs
	%21 = icmp eq %ast.AstNode* %20, null
	br i1 %21, label %L.4, label %L.8
L.8:
	%22 = load %ast.AstNode** %tree
	%23 = getelementptr %ast.AstNode* %22, i32 0, i32 1
	%24 = load i8* %23
	%25 = icmp eq i8 %24, 3
	br i1 %25, label %L.10, label %L.9
L.10:
	%26 = load i8* %op
	%27 = zext i8 %26 to i32
	switch i32 %27, label %L.11 [
		i32 52, label %L.13
		i32 53, label %L.14
	]
L.13:
	store i8 54, i8* %op
	br label %L.12
L.14:
	store i8 55, i8* %op
	br label %L.12
L.11:
	br label %L.12
L.12:
	br label %L.9
L.9:
	%28 = load i8* %op
	%29 = load %ast.AstNode** %tree
	%30 = load %ast.AstNode** %rhs
	%31 = call %ast.AstNode* @expr_BinOp(i8 %28, %ast.AstNode* %29, %ast.AstNode* %30)
	store %ast.AstNode* %31, %ast.AstNode** %tree
	br label %L.3
L.4:
	br label %L.1
L.1:
	%32 = load %ast.AstNode** %tree
	store %ast.AstNode* %32, %ast.AstNode** %rv.0
	br label %return
return:
	%33 = load %ast.AstNode** %rv.0
	ret %ast.AstNode* %33
}
@expr_addop = internal constant [4 x i8] [ i8 33, i8 34, i8 57, i8 58 ]
define %ast.AstNode* @expr_Add(%type.TypeNode* %t.arg) nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%t = alloca %type.TypeNode*
	store %type.TypeNode* %t.arg, %type.TypeNode** %t
	%tree = alloca %ast.AstNode*
	%rhs = alloca %ast.AstNode*
	%op = alloca i8
	%tok = alloca i8
	%0 = load %type.TypeNode** %t
	%1 = call %ast.AstNode* @expr_Mul(%type.TypeNode* %0)
	store %ast.AstNode* %1, %ast.AstNode** %tree
	%2 = load %ast.AstNode** %tree
	%3 = icmp ne %ast.AstNode* %2, null
	br i1 %3, label %L.2, label %L.1
L.2:
	br label %L.3
L.3:
	%4 = load i8* @lex_Token
	store i8 %4, i8* %tok
	%5 = load i8* %tok
	%6 = icmp ult i8 %5, 14
	br i1 %6, label %L.7, label %L.6
L.6:
	%7 = load i8* %tok
	%8 = icmp ugt i8 %7, 17
	br label %L.7
L.7:
	%9 = phi i1 [ true, %L.3 ], [ %8, %L.6 ]
	br i1 %9, label %L.4, label %L.5
L.5:
	%10 = load i8* %tok
	%11 = sub i8 %10, 14
	%12 = zext i8 %11 to i32
	%13 = getelementptr [4 x i8]* @expr_addop, i32 0, i32 %12
	%14 = load i8* %13
	store i8 %14, i8* %op
	%15 = call i8 @lex_Next()
	store i8 %15, i8* %tok
	%16 = load %ast.AstNode** %tree
	%17 = getelementptr %ast.AstNode* %16, i32 0, i32 9
	%18 = load %type.TypeNode** %17
	%19 = call %ast.AstNode* @expr_Mul(%type.TypeNode* %18)
	store %ast.AstNode* %19, %ast.AstNode** %rhs
	%20 = load %ast.AstNode** %rhs
	%21 = icmp eq %ast.AstNode* %20, null
	br i1 %21, label %L.4, label %L.8
L.8:
	%22 = load i8* %op
	%23 = load %ast.AstNode** %tree
	%24 = load %ast.AstNode** %rhs
	%25 = call %ast.AstNode* @expr_BinOp(i8 %22, %ast.AstNode* %23, %ast.AstNode* %24)
	store %ast.AstNode* %25, %ast.AstNode** %tree
	br label %L.3
L.4:
	br label %L.1
L.1:
	%26 = load %ast.AstNode** %tree
	store %ast.AstNode* %26, %ast.AstNode** %rv.0
	br label %return
return:
	%27 = load %ast.AstNode** %rv.0
	ret %ast.AstNode* %27
}
@expr_ucmpop = internal constant [6 x i8] [ i8 38, i8 39, i8 40, i8 41, i8 42, i8 43 ]
@expr_scmpop = internal constant [6 x i8] [ i8 38, i8 39, i8 44, i8 45, i8 46, i8 47 ]
define %ast.AstNode* @expr_ScalarCompare(i8 zeroext %tok.arg, %ast.AstNode* %lhs.arg, %ast.AstNode* %rhs.arg) nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%tok = alloca i8
	%lhs = alloca %ast.AstNode*
	%rhs = alloca %ast.AstNode*
	store i8 %tok.arg, i8* %tok
	store %ast.AstNode* %lhs.arg, %ast.AstNode** %lhs
	store %ast.AstNode* %rhs.arg, %ast.AstNode** %rhs
	%tree = alloca %ast.AstNode*
	%op = alloca i8
	%0 = load %ast.AstNode** %lhs
	%1 = load %ast.AstNode** %rhs
	%2 = call i8 @expr_IsSignedBinOp(%ast.AstNode* %0, %ast.AstNode* %1)
	%3 = icmp ne i8 %2, 0
	br i1 %3, label %L.2, label %L.3
L.2:
	%4 = load i8* %tok
	%5 = sub i8 %4, 24
	%6 = zext i8 %5 to i32
	%7 = getelementptr [6 x i8]* @expr_scmpop, i32 0, i32 %6
	%8 = load i8* %7
	store i8 %8, i8* %op
	br label %L.1
L.3:
	%9 = load i8* %tok
	%10 = sub i8 %9, 24
	%11 = zext i8 %10 to i32
	%12 = getelementptr [6 x i8]* @expr_ucmpop, i32 0, i32 %11
	%13 = load i8* %12
	store i8 %13, i8* %op
	br label %L.1
L.1:
	%14 = load i8* %op
	%15 = load %ast.AstNode** %lhs
	%16 = load %ast.AstNode** %rhs
	%17 = call %ast.AstNode* @expr_BinOp(i8 %14, %ast.AstNode* %15, %ast.AstNode* %16)
	store %ast.AstNode* %17, %ast.AstNode** %tree
	%18 = load %ast.AstNode** %tree
	%19 = icmp ne %ast.AstNode* %18, null
	br i1 %19, label %L.5, label %L.4
L.5:
	%20 = load %type.TypeNode** @type_booltype
	%21 = load %ast.AstNode** %tree
	%22 = getelementptr %ast.AstNode* %21, i32 0, i32 9
	store %type.TypeNode* %20, %type.TypeNode** %22
	%23 = load %ast.AstNode** %tree
	%24 = getelementptr %ast.AstNode* %23, i32 0, i32 1
	store i8 1, i8* %24
	%25 = load %ast.AstNode** %tree
	%26 = getelementptr %ast.AstNode* %25, i32 0, i32 2
	store i8 1, i8* %26
	br label %L.4
L.4:
	%27 = load %ast.AstNode** %tree
	store %ast.AstNode* %27, %ast.AstNode** %rv.0
	br label %return
return:
	%28 = load %ast.AstNode** %rv.0
	ret %ast.AstNode* %28
}
define i32 @expr_OffsetAlign(i32 %base.arg, i32 %disp.arg) nounwind {
L.0:
	%rv.0 = alloca i32
	%base = alloca i32
	%disp = alloca i32
	store i32 %base.arg, i32* %base
	store i32 %disp.arg, i32* %disp
	%new = alloca i32
	%tz = alloca i32
	%0 = load i32* %base
	%1 = load i32* %disp
	%2 = add i32 %0, %1
	store i32 %2, i32* %new
	store i32 0, i32* %tz
	br label %L.1
L.1:
	%3 = load i32* %new
	%4 = and i32 %3, 1
	%5 = icmp eq i32 %4, 0
	%6 = xor i1 %5, true
	br i1 %6, label %L.2, label %L.3
L.3:
	%7 = load i32* %new
	%8 = lshr i32 %7, 1
	store i32 %8, i32* %new
	%9 = load i32* %tz
	%10 = add i32 %9, 1
	store i32 %10, i32* %tz
	br label %L.1
L.2:
	%11 = load i32* %tz
	%12 = shl i32 1, %11
	store i32 %12, i32* %new
	%13 = load i32* %new
	%14 = load i32* %base
	%15 = icmp ugt i32 %13, %14
	br i1 %15, label %L.5, label %L.4
L.5:
	%16 = load i32* %base
	store i32 %16, i32* %new
	br label %L.4
L.4:
	%17 = load i32* %new
	store i32 %17, i32* %rv.0
	br label %return
return:
	%18 = load i32* %rv.0
	ret i32 %18
}
define i32 @expr_FieldAlign(i32 %base.arg, %type.TypeNode* %record.arg, i32 %fieldno.arg) nounwind {
L.0:
	%rv.0 = alloca i32
	%base = alloca i32
	%record = alloca %type.TypeNode*
	%fieldno = alloca i32
	store i32 %base.arg, i32* %base
	store %type.TypeNode* %record.arg, %type.TypeNode** %record
	store i32 %fieldno.arg, i32* %fieldno
	%offs = alloca i32
	%i = alloca i32
	%s = alloca %symb.SymbNode*
	%0 = load %type.TypeNode** %record
	%1 = getelementptr %type.TypeNode* %0, i32 0, i32 11
	%2 = load i8* %1
	%3 = icmp ne i8 %2, 6
	br i1 %3, label %L.2, label %L.1
L.2:
	store i32 0, i32* %rv.0
	br label %return
L.1:
	store i32 0, i32* %offs
	store i32 0, i32* %i
	%4 = load %type.TypeNode** %record
	%5 = getelementptr %type.TypeNode* %4, i32 0, i32 3
	%6 = load %symb.SymbNode** %5
	store %symb.SymbNode* %6, %symb.SymbNode** %s
	br label %L.3
L.3:
	%7 = load i32* %i
	%8 = load i32* %fieldno
	%9 = icmp ult i32 %7, %8
	br i1 %9, label %L.6, label %L.7
L.6:
	%10 = load %symb.SymbNode** %s
	%11 = icmp ne %symb.SymbNode* %10, null
	br label %L.7
L.7:
	%12 = phi i1 [ false, %L.3 ], [ %11, %L.6 ]
	%13 = xor i1 %12, true
	br i1 %13, label %L.4, label %L.5
L.5:
	%14 = load %type.TypeNode** %record
	%15 = getelementptr %type.TypeNode* %14, i32 0, i32 12
	%16 = load i8* %15
	%17 = icmp eq i8 %16, 2
	br i1 %17, label %L.9, label %L.10
L.9:
	%18 = load i32* %offs
	%19 = load %symb.SymbNode** %s
	%20 = getelementptr %symb.SymbNode* %19, i32 0, i32 1
	%21 = load %type.TypeNode** %20
	%22 = getelementptr %type.TypeNode* %21, i32 0, i32 7
	%23 = load i32* %22
	%24 = add i32 %18, %23
	store i32 %24, i32* %offs
	br label %L.8
L.10:
	%25 = load i32* %offs
	%26 = load %symb.SymbNode** %s
	%27 = getelementptr %symb.SymbNode* %26, i32 0, i32 1
	%28 = load %type.TypeNode** %27
	%29 = getelementptr %type.TypeNode* %28, i32 0, i32 8
	%30 = load i32* %29
	%31 = load %target.TargetT** @target_Target
	%32 = getelementptr %target.TargetT* %31, i32 0, i32 3
	%33 = load i8* %32
	%34 = zext i8 %33 to i32
	%35 = udiv i32 %30, %34
	%36 = add i32 %25, %35
	store i32 %36, i32* %offs
	br label %L.8
L.8:
	%37 = load i32* %i
	%38 = add i32 %37, 1
	store i32 %38, i32* %i
	%39 = load %symb.SymbNode** %s
	%40 = getelementptr %symb.SymbNode* %39, i32 0, i32 0
	%41 = load %symb.SymbNode** %40
	store %symb.SymbNode* %41, %symb.SymbNode** %s
	br label %L.3
L.4:
	%42 = load i32* %base
	%43 = load i32* %offs
	%44 = call i32 @expr_OffsetAlign(i32 %42, i32 %43)
	store i32 %44, i32* %rv.0
	br label %return
return:
	%45 = load i32* %rv.0
	ret i32 %45
}
define i32 @expr_GetAlignment(%ast.AstNode* %tree.arg) nounwind {
L.0:
	%rv.0 = alloca i32
	%tree = alloca %ast.AstNode*
	store %ast.AstNode* %tree.arg, %ast.AstNode** %tree
	%alignment = alloca i32
	%0 = load %ast.AstNode** %tree
	%1 = icmp eq %ast.AstNode* %0, null
	br i1 %1, label %L.2, label %L.1
L.2:
	store i32 0, i32* %rv.0
	br label %return
L.1:
	%2 = load %ast.AstNode** %tree
	%3 = getelementptr %ast.AstNode* %2, i32 0, i32 0
	%4 = load i8* %3
	%5 = zext i8 %4 to i32
	switch i32 %5, label %L.3 [
		i32 9, label %L.5
		i32 25, label %L.6
		i32 16, label %L.7
		i32 17, label %L.8
		i32 18, label %L.9
		i32 14, label %L.10
		i32 8, label %L.10
	]
L.5:
	%6 = load %ast.AstNode** %tree
	%7 = getelementptr %ast.AstNode* %6, i32 0, i32 9
	%8 = load %type.TypeNode** %7
	%9 = icmp ne %type.TypeNode* %8, null
	br i1 %9, label %L.12, label %L.13
L.12:
	%10 = load %ast.AstNode** %tree
	%11 = getelementptr %ast.AstNode* %10, i32 0, i32 9
	%12 = load %type.TypeNode** %11
	%13 = getelementptr %type.TypeNode* %12, i32 0, i32 9
	%14 = load i32* %13
	%15 = load %target.TargetT** @target_Target
	%16 = getelementptr %target.TargetT* %15, i32 0, i32 3
	%17 = load i8* %16
	%18 = zext i8 %17 to i32
	%19 = udiv i32 %14, %18
	store i32 %19, i32* %alignment
	br label %L.11
L.13:
	store i32 0, i32* %alignment
	br label %L.11
L.11:
	br label %L.4
L.6:
	%20 = load %ast.AstNode** %tree
	%21 = getelementptr %ast.AstNode* %20, i32 0, i32 1
	%22 = load i8* %21
	%23 = icmp eq i8 %22, 4
	br i1 %23, label %L.14, label %L.15
L.14:
	%24 = load %ast.AstNode** %tree
	%25 = getelementptr %ast.AstNode* %24, i32 0, i32 9
	%26 = load %type.TypeNode** %25
	%27 = icmp ne %type.TypeNode* %26, null
	br label %L.15
L.15:
	%28 = phi i1 [ false, %L.6 ], [ %27, %L.14 ]
	br i1 %28, label %L.17, label %L.18
L.17:
	%29 = load %ast.AstNode** %tree
	%30 = getelementptr %ast.AstNode* %29, i32 0, i32 9
	%31 = load %type.TypeNode** %30
	%32 = getelementptr %type.TypeNode* %31, i32 0, i32 9
	%33 = load i32* %32
	%34 = load %target.TargetT** @target_Target
	%35 = getelementptr %target.TargetT* %34, i32 0, i32 3
	%36 = load i8* %35
	%37 = zext i8 %36 to i32
	%38 = udiv i32 %33, %37
	store i32 %38, i32* %alignment
	br label %L.16
L.18:
	store i32 0, i32* %alignment
	br label %L.16
L.16:
	br label %L.4
L.7:
	%39 = load %ast.AstNode** %tree
	%40 = getelementptr %ast.AstNode* %39, i32 0, i32 11
	%41 = getelementptr [0 x %ast.AstNode*]* %40, i32 0, i32 0
	%42 = load %ast.AstNode** %41
	%43 = call i32 @expr_GetAlignment(%ast.AstNode* %42)
	store i32 %43, i32* %alignment
	%44 = load i32* %alignment
	%45 = icmp ne i32 %44, 0
	br i1 %45, label %L.20, label %L.19
L.20:
	%46 = load i32* %alignment
	%47 = load %ast.AstNode** %tree
	%48 = getelementptr %ast.AstNode* %47, i32 0, i32 11
	%49 = getelementptr [0 x %ast.AstNode*]* %48, i32 0, i32 0
	%50 = load %ast.AstNode** %49
	%51 = getelementptr %ast.AstNode* %50, i32 0, i32 9
	%52 = load %type.TypeNode** %51
	%53 = load %ast.AstNode** %tree
	%54 = getelementptr %ast.AstNode* %53, i32 0, i32 8
	%55 = load i64* %54
	%56 = trunc i64 %55 to i32
	%57 = call i32 @expr_FieldAlign(i32 %46, %type.TypeNode* %52, i32 %56)
	store i32 %57, i32* %alignment
	br label %L.19
L.19:
	br label %L.4
L.8:
	%58 = load %ast.AstNode** %tree
	%59 = getelementptr %ast.AstNode* %58, i32 0, i32 11
	%60 = getelementptr [0 x %ast.AstNode*]* %59, i32 0, i32 0
	%61 = load %ast.AstNode** %60
	%62 = call i32 @expr_GetAlignment(%ast.AstNode* %61)
	store i32 %62, i32* %alignment
	%63 = load i32* %alignment
	%64 = icmp ne i32 %63, 0
	br i1 %64, label %L.22, label %L.21
L.22:
	%65 = load %ast.AstNode** %tree
	%66 = getelementptr %ast.AstNode* %65, i32 0, i32 11
	%67 = getelementptr [0 x %ast.AstNode*]* %66, i32 0, i32 1
	%68 = load %ast.AstNode** %67
	%69 = getelementptr %ast.AstNode* %68, i32 0, i32 0
	%70 = load i8* %69
	%71 = icmp eq i8 %70, 7
	br i1 %71, label %L.24, label %L.25
L.24:
	%72 = load i32* %alignment
	%73 = load %ast.AstNode** %tree
	%74 = getelementptr %ast.AstNode* %73, i32 0, i32 11
	%75 = getelementptr [0 x %ast.AstNode*]* %74, i32 0, i32 1
	%76 = load %ast.AstNode** %75
	%77 = getelementptr %ast.AstNode* %76, i32 0, i32 8
	%78 = load i64* %77
	%79 = trunc i64 %78 to i32
	%80 = call i32 @expr_OffsetAlign(i32 %72, i32 %79)
	store i32 %80, i32* %alignment
	br label %L.23
L.25:
	store i32 0, i32* %alignment
	br label %L.23
L.23:
	br label %L.21
L.21:
	br label %L.4
L.9:
	%81 = load %ast.AstNode** %tree
	%82 = getelementptr %ast.AstNode* %81, i32 0, i32 11
	%83 = getelementptr [0 x %ast.AstNode*]* %82, i32 0, i32 0
	%84 = load %ast.AstNode** %83
	%85 = call i32 @expr_GetAlignment(%ast.AstNode* %84)
	store i32 %85, i32* %alignment
	%86 = load i32* %alignment
	%87 = icmp ne i32 %86, 0
	br i1 %87, label %L.27, label %L.26
L.27:
	%88 = load %ast.AstNode** %tree
	%89 = getelementptr %ast.AstNode* %88, i32 0, i32 11
	%90 = getelementptr [0 x %ast.AstNode*]* %89, i32 0, i32 1
	%91 = load %ast.AstNode** %90
	%92 = getelementptr %ast.AstNode* %91, i32 0, i32 0
	%93 = load i8* %92
	%94 = icmp eq i8 %93, 7
	br i1 %94, label %L.29, label %L.30
L.29:
	%95 = load i32* %alignment
	%96 = load %ast.AstNode** %tree
	%97 = getelementptr %ast.AstNode* %96, i32 0, i32 11
	%98 = getelementptr [0 x %ast.AstNode*]* %97, i32 0, i32 1
	%99 = load %ast.AstNode** %98
	%100 = getelementptr %ast.AstNode* %99, i32 0, i32 8
	%101 = load i64* %100
	%102 = trunc i64 %101 to i32
	%103 = call i32 @expr_OffsetAlign(i32 %95, i32 %102)
	store i32 %103, i32* %alignment
	br label %L.28
L.30:
	store i32 0, i32* %alignment
	br label %L.28
L.28:
	br label %L.26
L.26:
	br label %L.4
L.10:
	%104 = load %ast.AstNode** %tree
	%105 = getelementptr %ast.AstNode* %104, i32 0, i32 9
	%106 = load %type.TypeNode** %105
	%107 = getelementptr %type.TypeNode* %106, i32 0, i32 9
	%108 = load i32* %107
	store i32 %108, i32* %alignment
	br label %L.4
L.3:
	%109 = getelementptr [31 x i8]* @.str507
	%110 = bitcast [31 x i8]* %109 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %110)
	br label %L.4
L.4:
	%111 = load i32* %alignment
	store i32 %111, i32* %rv.0
	br label %return
return:
	%112 = load i32* %rv.0
	ret i32 %112
}
define %ast.AstNode* @expr_ArrayCompare(i8 zeroext %tok.arg, %ast.AstNode* %lhs.arg, %ast.AstNode* %rhs.arg) nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%tok = alloca i8
	%lhs = alloca %ast.AstNode*
	%rhs = alloca %ast.AstNode*
	store i8 %tok.arg, i8* %tok
	store %ast.AstNode* %lhs.arg, %ast.AstNode** %lhs
	store %ast.AstNode* %rhs.arg, %ast.AstNode** %rhs
	%tree = alloca %ast.AstNode*
	%op = alloca i8
	%lsize = alloca %ast.AstNode*
	%rsize = alloca %ast.AstNode*
	%align = alloca %ast.AstNode*
	%lalign = alloca i32
	%ralign = alloca i32
	%0 = load i8* %tok
	%1 = zext i8 %0 to i32
	switch i32 %1, label %L.1 [
		i32 24, label %L.3
		i32 25, label %L.4
	]
L.3:
	store i8 22, i8* %op
	br label %L.2
L.4:
	store i8 23, i8* %op
	br label %L.2
L.1:
	call void @lex_Error(i8 29)
	%2 = load %ast.AstNode** %lhs
	store %ast.AstNode* %2, %ast.AstNode** %rv.0
	br label %return
L.2:
	%3 = load %ast.AstNode** %lhs
	%4 = getelementptr %ast.AstNode* %3, i32 0, i32 9
	%5 = load %type.TypeNode** %4
	%6 = getelementptr %type.TypeNode* %5, i32 0, i32 12
	%7 = load i8* %6
	%8 = icmp eq i8 %7, 2
	br i1 %8, label %L.6, label %L.5
L.6:
	%9 = load %ast.AstNode** %rhs
	%10 = getelementptr %ast.AstNode* %9, i32 0, i32 9
	%11 = load %type.TypeNode** %10
	%12 = getelementptr %type.TypeNode* %11, i32 0, i32 12
	%13 = load i8* %12
	%14 = icmp ne i8 %13, 2
	br i1 %14, label %L.8, label %L.7
L.8:
	%15 = getelementptr [21 x i8]* @.str508
	%16 = bitcast [21 x i8]* %15 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %16)
	br label %L.7
L.7:
	%17 = load %ast.AstNode** %lhs
	%18 = getelementptr %ast.AstNode* %17, i32 0, i32 1
	store i8 2, i8* %18
	%19 = load %ast.AstNode** %rhs
	%20 = getelementptr %ast.AstNode* %19, i32 0, i32 1
	store i8 2, i8* %20
	%21 = load i8* %op
	%22 = icmp eq i8 %21, 22
	br i1 %22, label %L.10, label %L.11
L.10:
	store i8 38, i8* %op
	br label %L.9
L.11:
	store i8 39, i8* %op
	br label %L.9
L.9:
	%23 = load i8* %op
	%24 = load %type.TypeNode** @type_booltype
	%25 = load %ast.AstNode** %lhs
	%26 = load %ast.AstNode** %rhs
	%27 = call %ast.AstNode* @ast_New2(i8 %23, %type.TypeNode* %24, %ast.AstNode* %25, %ast.AstNode* %26)
	store %ast.AstNode* %27, %ast.AstNode** %tree
	%28 = load %ast.AstNode** %tree
	%29 = getelementptr %ast.AstNode* %28, i32 0, i32 1
	store i8 1, i8* %29
	%30 = load %ast.AstNode** %tree
	%31 = getelementptr %ast.AstNode* %30, i32 0, i32 2
	store i8 1, i8* %31
	%32 = load %ast.AstNode** %tree
	store %ast.AstNode* %32, %ast.AstNode** %rv.0
	br label %return
L.5:
	%33 = load %ast.AstNode** %lhs
	%34 = getelementptr %ast.AstNode* %33, i32 0, i32 0
	%35 = load i8* %34
	%36 = icmp eq i8 %35, 25
	br i1 %36, label %L.12, label %L.13
L.12:
	%37 = load %ast.AstNode** %lhs
	%38 = getelementptr %ast.AstNode* %37, i32 0, i32 1
	%39 = load i8* %38
	%40 = icmp eq i8 %39, 5
	br label %L.13
L.13:
	%41 = phi i1 [ false, %L.5 ], [ %40, %L.12 ]
	br i1 %41, label %L.15, label %L.14
L.15:
	%42 = load %ast.AstNode** %lhs
	%43 = getelementptr %ast.AstNode* %42, i32 0, i32 11
	%44 = getelementptr [0 x %ast.AstNode*]* %43, i32 0, i32 0
	%45 = load %ast.AstNode** %44
	store %ast.AstNode* %45, %ast.AstNode** %lhs
	br label %L.14
L.14:
	%46 = load %ast.AstNode** %rhs
	%47 = getelementptr %ast.AstNode* %46, i32 0, i32 0
	%48 = load i8* %47
	%49 = icmp eq i8 %48, 25
	br i1 %49, label %L.16, label %L.17
L.16:
	%50 = load %ast.AstNode** %rhs
	%51 = getelementptr %ast.AstNode* %50, i32 0, i32 1
	%52 = load i8* %51
	%53 = icmp eq i8 %52, 5
	br label %L.17
L.17:
	%54 = phi i1 [ false, %L.14 ], [ %53, %L.16 ]
	br i1 %54, label %L.19, label %L.18
L.19:
	%55 = load %ast.AstNode** %rhs
	%56 = getelementptr %ast.AstNode* %55, i32 0, i32 11
	%57 = getelementptr [0 x %ast.AstNode*]* %56, i32 0, i32 0
	%58 = load %ast.AstNode** %57
	store %ast.AstNode* %58, %ast.AstNode** %rhs
	br label %L.18
L.18:
	%59 = load %ast.AstNode** %lhs
	%60 = call i32 @expr_GetAlignment(%ast.AstNode* %59)
	store i32 %60, i32* %lalign
	%61 = load %ast.AstNode** %rhs
	%62 = call i32 @expr_GetAlignment(%ast.AstNode* %61)
	store i32 %62, i32* %ralign
	%63 = load i32* %ralign
	%64 = load i32* %lalign
	%65 = icmp ult i32 %63, %64
	br i1 %65, label %L.21, label %L.20
L.21:
	%66 = load i32* %ralign
	store i32 %66, i32* %lalign
	br label %L.20
L.20:
	%67 = load %ast.AstNode** %lhs
	%68 = getelementptr %ast.AstNode* %67, i32 0, i32 0
	%69 = load i8* %68
	%70 = icmp eq i8 %69, 18
	br i1 %70, label %L.23, label %L.24
L.23:
	%71 = load %ast.AstNode** %lhs
	%72 = getelementptr %ast.AstNode* %71, i32 0, i32 11
	%73 = getelementptr [0 x %ast.AstNode*]* %72, i32 0, i32 2
	%74 = load %ast.AstNode** %73
	store %ast.AstNode* %74, %ast.AstNode** %lsize
	br label %L.22
L.24:
	%75 = load %type.TypeNode** @type_wordtype
	%76 = load %ast.AstNode** %lhs
	%77 = getelementptr %ast.AstNode* %76, i32 0, i32 9
	%78 = load %type.TypeNode** %77
	%79 = getelementptr %type.TypeNode* %78, i32 0, i32 6
	%80 = load i64* %79
	%81 = call %ast.AstNode* @ast_Const(%type.TypeNode* %75, i64 %80)
	store %ast.AstNode* %81, %ast.AstNode** %lsize
	br label %L.22
L.22:
	%82 = load %ast.AstNode** %rhs
	%83 = getelementptr %ast.AstNode* %82, i32 0, i32 0
	%84 = load i8* %83
	%85 = icmp eq i8 %84, 18
	br i1 %85, label %L.26, label %L.27
L.26:
	%86 = load %ast.AstNode** %rhs
	%87 = getelementptr %ast.AstNode* %86, i32 0, i32 11
	%88 = getelementptr [0 x %ast.AstNode*]* %87, i32 0, i32 2
	%89 = load %ast.AstNode** %88
	store %ast.AstNode* %89, %ast.AstNode** %rsize
	br label %L.25
L.27:
	%90 = load %type.TypeNode** @type_wordtype
	%91 = load %ast.AstNode** %rhs
	%92 = getelementptr %ast.AstNode* %91, i32 0, i32 9
	%93 = load %type.TypeNode** %92
	%94 = getelementptr %type.TypeNode* %93, i32 0, i32 6
	%95 = load i64* %94
	%96 = call %ast.AstNode* @ast_Const(%type.TypeNode* %90, i64 %95)
	store %ast.AstNode* %96, %ast.AstNode** %rsize
	br label %L.25
L.25:
	%97 = load i8* %op
	%98 = load %type.TypeNode** @type_booltype
	%99 = load %ast.AstNode** %lhs
	%100 = load %ast.AstNode** %rhs
	%101 = call %ast.AstNode* @ast_New2(i8 %97, %type.TypeNode* %98, %ast.AstNode* %99, %ast.AstNode* %100)
	store %ast.AstNode* %101, %ast.AstNode** %tree
	%102 = load %ast.AstNode** %tree
	%103 = getelementptr %ast.AstNode* %102, i32 0, i32 1
	store i8 1, i8* %103
	%104 = load %ast.AstNode** %tree
	%105 = getelementptr %ast.AstNode* %104, i32 0, i32 2
	store i8 1, i8* %105
	%106 = load %ast.AstNode** %tree
	%107 = load %ast.AstNode** %lsize
	%108 = call %ast.AstNode* @ast_Child(%ast.AstNode* %106, %ast.AstNode* %107)
	store %ast.AstNode* %108, %ast.AstNode** %tree
	%109 = load %type.TypeNode** @type_wordtype
	%110 = load i32* %lalign
	%111 = zext i32 %110 to i64
	%112 = call %ast.AstNode* @ast_Const(%type.TypeNode* %109, i64 %111)
	store %ast.AstNode* %112, %ast.AstNode** %align
	%113 = load %ast.AstNode** %tree
	%114 = load %ast.AstNode** %align
	%115 = call %ast.AstNode* @ast_Child(%ast.AstNode* %113, %ast.AstNode* %114)
	store %ast.AstNode* %115, %ast.AstNode** %tree
	%116 = load %ast.AstNode** %tree
	store %ast.AstNode* %116, %ast.AstNode** %rv.0
	br label %return
return:
	%117 = load %ast.AstNode** %rv.0
	ret %ast.AstNode* %117
}
define zeroext i8 @expr_NodeKind(%ast.AstNode* %node.arg) nounwind {
L.0:
	%rv.0 = alloca i8
	%node = alloca %ast.AstNode*
	store %ast.AstNode* %node.arg, %ast.AstNode** %node
	%kind = alloca i8
	%0 = load %ast.AstNode** %node
	%1 = getelementptr %ast.AstNode* %0, i32 0, i32 0
	%2 = load i8* %1
	%3 = zext i8 %2 to i32
	switch i32 %3, label %L.1 [
		i32 9, label %L.3
		i32 18, label %L.3
	]
L.3:
	%4 = load %ast.AstNode** %node
	%5 = getelementptr %ast.AstNode* %4, i32 0, i32 9
	%6 = load %type.TypeNode** %5
	%7 = icmp ne %type.TypeNode* %6, null
	br i1 %7, label %L.5, label %L.6
L.5:
	%8 = load %ast.AstNode** %node
	%9 = getelementptr %ast.AstNode* %8, i32 0, i32 9
	%10 = load %type.TypeNode** %9
	%11 = getelementptr %type.TypeNode* %10, i32 0, i32 11
	%12 = load i8* %11
	store i8 %12, i8* %kind
	br label %L.4
L.6:
	store i8 0, i8* %kind
	br label %L.4
L.4:
	br label %L.2
L.1:
	%13 = load %ast.AstNode** %node
	%14 = getelementptr %ast.AstNode* %13, i32 0, i32 1
	%15 = load i8* %14
	store i8 %15, i8* %kind
	br label %L.2
L.2:
	%16 = load i8* %kind
	store i8 %16, i8* %rv.0
	br label %return
return:
	%17 = load i8* %rv.0
	ret i8 %17
}
define %ast.AstNode* @expr_Compare(%type.TypeNode* %t.arg) nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%t = alloca %type.TypeNode*
	store %type.TypeNode* %t.arg, %type.TypeNode** %t
	%tree = alloca %ast.AstNode*
	%rhs = alloca %ast.AstNode*
	%tok = alloca i8
	%savetok = alloca i8
	%0 = load %type.TypeNode** %t
	%1 = call %ast.AstNode* @expr_Add(%type.TypeNode* %0)
	store %ast.AstNode* %1, %ast.AstNode** %tree
	%2 = load i8* @lex_Token
	store i8 %2, i8* %tok
	%3 = load i8* %tok
	%4 = icmp uge i8 %3, 24
	br i1 %4, label %L.1, label %L.2
L.1:
	%5 = load i8* %tok
	%6 = icmp ule i8 %5, 29
	br label %L.2
L.2:
	%7 = phi i1 [ false, %L.0 ], [ %6, %L.1 ]
	br i1 %7, label %L.4, label %L.3
L.4:
	%8 = load i8* %tok
	store i8 %8, i8* %savetok
	%9 = call i8 @lex_Next()
	store i8 %9, i8* %tok
	%10 = load %ast.AstNode** %tree
	%11 = icmp ne %ast.AstNode* %10, null
	br i1 %11, label %L.6, label %L.5
L.6:
	%12 = load %ast.AstNode** %tree
	%13 = getelementptr %ast.AstNode* %12, i32 0, i32 9
	%14 = load %type.TypeNode** %13
	%15 = call %ast.AstNode* @expr_Add(%type.TypeNode* %14)
	store %ast.AstNode* %15, %ast.AstNode** %rhs
	%16 = load %ast.AstNode** %rhs
	%17 = icmp ne %ast.AstNode* %16, null
	br i1 %17, label %L.8, label %L.7
L.8:
	%18 = load %ast.AstNode** %tree
	%19 = call i8 @expr_NodeKind(%ast.AstNode* %18)
	%20 = zext i8 %19 to i32
	switch i32 %20, label %L.9 [
		i32 1, label %L.11
		i32 2, label %L.11
		i32 3, label %L.11
		i32 4, label %L.11
		i32 5, label %L.12
	]
L.11:
	%21 = load i8* %savetok
	%22 = load %ast.AstNode** %tree
	%23 = load %ast.AstNode** %rhs
	%24 = call %ast.AstNode* @expr_ScalarCompare(i8 %21, %ast.AstNode* %22, %ast.AstNode* %23)
	store %ast.AstNode* %24, %ast.AstNode** %tree
	br label %L.10
L.12:
	%25 = load i8* %savetok
	%26 = load %ast.AstNode** %tree
	%27 = load %ast.AstNode** %rhs
	%28 = call %ast.AstNode* @expr_ArrayCompare(i8 %25, %ast.AstNode* %26, %ast.AstNode* %27)
	store %ast.AstNode* %28, %ast.AstNode** %tree
	br label %L.10
L.9:
	call void @lex_Error(i8 29)
	br label %L.10
L.10:
	br label %L.7
L.7:
	br label %L.5
L.5:
	br label %L.3
L.3:
	%29 = load %ast.AstNode** %tree
	store %ast.AstNode* %29, %ast.AstNode** %rv.0
	br label %return
return:
	%30 = load %ast.AstNode** %rv.0
	ret %ast.AstNode* %30
}
define %ast.AstNode* @expr_BoolAnd(%type.TypeNode* %t.arg) nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%t = alloca %type.TypeNode*
	store %type.TypeNode* %t.arg, %type.TypeNode** %t
	%tree = alloca %ast.AstNode*
	%rhs = alloca %ast.AstNode*
	%tok = alloca i8
	%0 = load %type.TypeNode** %t
	%1 = call %ast.AstNode* @expr_Compare(%type.TypeNode* %0)
	store %ast.AstNode* %1, %ast.AstNode** %tree
	br label %L.1
L.1:
	%2 = load i8* @lex_Token
	store i8 %2, i8* %tok
	%3 = load i8* %tok
	%4 = icmp ne i8 %3, 30
	br i1 %4, label %L.2, label %L.3
L.3:
	%5 = call i8 @lex_Next()
	store i8 %5, i8* %tok
	%6 = load %ast.AstNode** %tree
	%7 = getelementptr %ast.AstNode* %6, i32 0, i32 9
	%8 = load %type.TypeNode** %7
	%9 = call %ast.AstNode* @expr_Compare(%type.TypeNode* %8)
	store %ast.AstNode* %9, %ast.AstNode** %rhs
	%10 = load %ast.AstNode** %tree
	%11 = icmp ne %ast.AstNode* %10, null
	br i1 %11, label %L.4, label %L.5
L.4:
	%12 = load %ast.AstNode** %rhs
	%13 = icmp ne %ast.AstNode* %12, null
	br label %L.5
L.5:
	%14 = phi i1 [ false, %L.3 ], [ %13, %L.4 ]
	br i1 %14, label %L.7, label %L.6
L.7:
	%15 = load %ast.AstNode** %tree
	%16 = call %ast.AstNode* @expr_ForceBoolean(%ast.AstNode* %15)
	store %ast.AstNode* %16, %ast.AstNode** %tree
	%17 = load %ast.AstNode** %rhs
	%18 = call %ast.AstNode* @expr_ForceBoolean(%ast.AstNode* %17)
	store %ast.AstNode* %18, %ast.AstNode** %rhs
	%19 = load %ast.AstNode** %tree
	%20 = getelementptr %ast.AstNode* %19, i32 0, i32 0
	%21 = load i8* %20
	%22 = icmp eq i8 %21, 7
	br i1 %22, label %L.8, label %L.9
L.8:
	%23 = load %ast.AstNode** %rhs
	%24 = getelementptr %ast.AstNode* %23, i32 0, i32 0
	%25 = load i8* %24
	%26 = icmp eq i8 %25, 7
	br label %L.9
L.9:
	%27 = phi i1 [ false, %L.7 ], [ %26, %L.8 ]
	br i1 %27, label %L.11, label %L.12
L.11:
	%28 = load %ast.AstNode** %tree
	%29 = getelementptr %ast.AstNode* %28, i32 0, i32 8
	%30 = load i64* %29
	%31 = load %ast.AstNode** %rhs
	%32 = getelementptr %ast.AstNode* %31, i32 0, i32 8
	%33 = load i64* %32
	%34 = and i64 %30, %33
	%35 = load %ast.AstNode** %tree
	%36 = getelementptr %ast.AstNode* %35, i32 0, i32 8
	store i64 %34, i64* %36
	br label %L.10
L.12:
	%37 = load %type.TypeNode** @type_booltype
	%38 = load %ast.AstNode** %tree
	%39 = load %ast.AstNode** %rhs
	%40 = call %ast.AstNode* @ast_New2(i8 59, %type.TypeNode* %37, %ast.AstNode* %38, %ast.AstNode* %39)
	store %ast.AstNode* %40, %ast.AstNode** %tree
	br label %L.10
L.10:
	br label %L.6
L.6:
	br label %L.1
L.2:
	%41 = load %ast.AstNode** %tree
	store %ast.AstNode* %41, %ast.AstNode** %rv.0
	br label %return
return:
	%42 = load %ast.AstNode** %rv.0
	ret %ast.AstNode* %42
}
define %ast.AstNode* @expr_Bool(%type.TypeNode* %t.arg) nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%t = alloca %type.TypeNode*
	store %type.TypeNode* %t.arg, %type.TypeNode** %t
	%tree = alloca %ast.AstNode*
	%rhs = alloca %ast.AstNode*
	%tok = alloca i8
	%0 = load %type.TypeNode** %t
	%1 = call %ast.AstNode* @expr_BoolAnd(%type.TypeNode* %0)
	store %ast.AstNode* %1, %ast.AstNode** %tree
	br label %L.1
L.1:
	%2 = load i8* @lex_Token
	store i8 %2, i8* %tok
	%3 = load i8* %tok
	%4 = icmp ne i8 %3, 31
	br i1 %4, label %L.2, label %L.3
L.3:
	%5 = call i8 @lex_Next()
	store i8 %5, i8* %tok
	%6 = load %ast.AstNode** %tree
	%7 = getelementptr %ast.AstNode* %6, i32 0, i32 9
	%8 = load %type.TypeNode** %7
	%9 = call %ast.AstNode* @expr_BoolAnd(%type.TypeNode* %8)
	store %ast.AstNode* %9, %ast.AstNode** %rhs
	%10 = load %ast.AstNode** %tree
	%11 = icmp ne %ast.AstNode* %10, null
	br i1 %11, label %L.4, label %L.5
L.4:
	%12 = load %ast.AstNode** %rhs
	%13 = icmp ne %ast.AstNode* %12, null
	br label %L.5
L.5:
	%14 = phi i1 [ false, %L.3 ], [ %13, %L.4 ]
	br i1 %14, label %L.7, label %L.6
L.7:
	%15 = load %ast.AstNode** %tree
	%16 = call %ast.AstNode* @expr_ForceBoolean(%ast.AstNode* %15)
	store %ast.AstNode* %16, %ast.AstNode** %tree
	%17 = load %ast.AstNode** %rhs
	%18 = call %ast.AstNode* @expr_ForceBoolean(%ast.AstNode* %17)
	store %ast.AstNode* %18, %ast.AstNode** %rhs
	%19 = load %ast.AstNode** %tree
	%20 = getelementptr %ast.AstNode* %19, i32 0, i32 0
	%21 = load i8* %20
	%22 = icmp eq i8 %21, 7
	br i1 %22, label %L.8, label %L.9
L.8:
	%23 = load %ast.AstNode** %rhs
	%24 = getelementptr %ast.AstNode* %23, i32 0, i32 0
	%25 = load i8* %24
	%26 = icmp eq i8 %25, 7
	br label %L.9
L.9:
	%27 = phi i1 [ false, %L.7 ], [ %26, %L.8 ]
	br i1 %27, label %L.11, label %L.12
L.11:
	%28 = load %ast.AstNode** %tree
	%29 = getelementptr %ast.AstNode* %28, i32 0, i32 8
	%30 = load i64* %29
	%31 = load %ast.AstNode** %rhs
	%32 = getelementptr %ast.AstNode* %31, i32 0, i32 8
	%33 = load i64* %32
	%34 = or i64 %30, %33
	%35 = load %ast.AstNode** %tree
	%36 = getelementptr %ast.AstNode* %35, i32 0, i32 8
	store i64 %34, i64* %36
	br label %L.10
L.12:
	%37 = load %type.TypeNode** @type_booltype
	%38 = load %ast.AstNode** %tree
	%39 = load %ast.AstNode** %rhs
	%40 = call %ast.AstNode* @ast_New2(i8 60, %type.TypeNode* %37, %ast.AstNode* %38, %ast.AstNode* %39)
	store %ast.AstNode* %40, %ast.AstNode** %tree
	br label %L.10
L.10:
	br label %L.6
L.6:
	br label %L.1
L.2:
	%41 = load %ast.AstNode** %tree
	store %ast.AstNode* %41, %ast.AstNode** %rv.0
	br label %return
return:
	%42 = load %ast.AstNode** %rv.0
	ret %ast.AstNode* %42
}
define %ast.AstNode* @expr_Const(%type.TypeNode* %t.arg) nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%t = alloca %type.TypeNode*
	store %type.TypeNode* %t.arg, %type.TypeNode** %t
	%tree = alloca %ast.AstNode*
	%0 = load %type.TypeNode** %t
	%1 = icmp ne %type.TypeNode* %0, null
	br i1 %1, label %L.2, label %L.3
L.2:
	%2 = load %type.TypeNode** %t
	%3 = getelementptr %type.TypeNode* %2, i32 0, i32 11
	%4 = load i8* %3
	%5 = zext i8 %4 to i32
	switch i32 %5, label %L.4 [
		i32 4, label %L.6
		i32 6, label %L.7
		i32 5, label %L.8
	]
L.6:
	%6 = load i8* @lex_Token
	%7 = zext i8 %6 to i32
	switch i32 %7, label %L.9 [
		i32 36, label %L.11
		i32 39, label %L.11
	]
L.11:
	%8 = load %type.TypeNode** %t
	%9 = getelementptr %type.TypeNode* %8, i32 0, i32 0
	%10 = load %type.TypeNode** %9
	%11 = call %ast.AstNode* @expr_Const(%type.TypeNode* %10)
	store %ast.AstNode* %11, %ast.AstNode** %tree
	%12 = load %type.TypeNode** %t
	%13 = getelementptr %type.TypeNode* %12, i32 0, i32 0
	%14 = load %type.TypeNode** %13
	%15 = load %ast.AstNode** %tree
	%16 = call %ast.AstNode* @ast_New1(i8 19, %type.TypeNode* %14, %ast.AstNode* %15)
	store %ast.AstNode* %16, %ast.AstNode** %tree
	br label %L.10
L.9:
	%17 = load %type.TypeNode** %t
	%18 = call %ast.AstNode* @expr_Bool(%type.TypeNode* %17)
	store %ast.AstNode* %18, %ast.AstNode** %tree
	%19 = load %type.TypeNode** %t
	%20 = load %ast.AstNode** %tree
	%21 = getelementptr %ast.AstNode* %20, i32 0, i32 9
	store %type.TypeNode* %19, %type.TypeNode** %21
	br label %L.10
L.10:
	br label %L.5
L.7:
	%22 = load %type.TypeNode** %t
	%23 = call %ast.AstNode* @expr_RecordConst(%type.TypeNode* %22)
	store %ast.AstNode* %23, %ast.AstNode** %tree
	br label %L.5
L.8:
	%24 = load %type.TypeNode** %t
	%25 = call %ast.AstNode* @expr_ArrayConst(%type.TypeNode* %24)
	store %ast.AstNode* %25, %ast.AstNode** %tree
	br label %L.5
L.4:
	%26 = load %type.TypeNode** %t
	%27 = call %ast.AstNode* @expr_Bool(%type.TypeNode* %26)
	store %ast.AstNode* %27, %ast.AstNode** %tree
	br label %L.5
L.5:
	br label %L.1
L.3:
	%28 = load %type.TypeNode** %t
	%29 = call %ast.AstNode* @expr_Bool(%type.TypeNode* %28)
	store %ast.AstNode* %29, %ast.AstNode** %tree
	br label %L.1
L.1:
	%30 = load %ast.AstNode** %tree
	store %ast.AstNode* %30, %ast.AstNode** %rv.0
	br label %return
return:
	%31 = load %ast.AstNode** %rv.0
	ret %ast.AstNode* %31
}
define i64 @expr_ConstScalar(%type.TypeNode* %t.arg) nounwind {
L.0:
	%rv.0 = alloca i64
	%t = alloca %type.TypeNode*
	store %type.TypeNode* %t.arg, %type.TypeNode** %t
	%tree = alloca %ast.AstNode*
	%rv = alloca i64
	store i64 0, i64* %rv
	%0 = load %type.TypeNode** %t
	%1 = call %ast.AstNode* @expr_Bool(%type.TypeNode* %0)
	store %ast.AstNode* %1, %ast.AstNode** %tree
	%2 = load %ast.AstNode** %tree
	%3 = icmp ne %ast.AstNode* %2, null
	br i1 %3, label %L.1, label %L.2
L.1:
	%4 = load %ast.AstNode** %tree
	%5 = getelementptr %ast.AstNode* %4, i32 0, i32 0
	%6 = load i8* %5
	%7 = icmp eq i8 %6, 7
	br label %L.2
L.2:
	%8 = phi i1 [ false, %L.0 ], [ %7, %L.1 ]
	br i1 %8, label %L.4, label %L.5
L.4:
	%9 = load %ast.AstNode** %tree
	%10 = getelementptr %ast.AstNode* %9, i32 0, i32 8
	%11 = load i64* %10
	store i64 %11, i64* %rv
	br label %L.3
L.5:
	call void @lex_Error(i8 60)
	br label %L.3
L.3:
	%12 = load i64* %rv
	store i64 %12, i64* %rv.0
	br label %return
return:
	%13 = load i64* %rv.0
	ret i64 %13
}
@stmt_isthenlist = internal constant [3 x i8] [ i8 50, i8 48, i8 0 ], align 1
@stmt_thenlist = internal constant [2 x i8] [ i8 48, i8 0 ], align 1
@stmt_elselist = internal constant [2 x i8] [ i8 49, i8 0 ], align 1
@stmt_aslist = internal constant [2 x i8] [ i8 59, i8 0 ], align 1
@stmt_dolist = internal constant [2 x i8] [ i8 53, i8 0 ], align 1
@stmt_withlist = internal constant [2 x i8] [ i8 56, i8 0 ], align 1
@stmt_skiplist = internal constant [3 x i8] [ i8 37, i8 4, i8 0 ], align 1
@stmt_LoopLevel = internal global i8 0, align 1
@stmt_CurFile = internal global %symb.SymbNode* zeroinitializer, align 4
@stmt_skipgroup = internal constant [2 x i8] [ i8 37, i8 0 ], align 1
@stmt_skipstmt = internal constant [2 x i8] [ i8 4, i8 0 ], align 1
define void @stmt_WhenSkip(i8 zeroext %tok.arg) nounwind {
L.0:
	%tok = alloca i8
	store i8 %tok.arg, i8* %tok
	%0 = load i8* %tok
	%1 = icmp eq i8 %0, 36
	br i1 %1, label %L.2, label %L.3
L.2:
	%2 = getelementptr [2 x i8]* @stmt_skipgroup
	%3 = bitcast [2 x i8]* %2 to [0 x i8]*
	%4 = call i8 @lex_Skip([0 x i8]* %3)
	%5 = call i8 @lex_Expect(i8 37)
	br label %L.1
L.3:
	%6 = getelementptr [2 x i8]* @stmt_skipstmt
	%7 = bitcast [2 x i8]* %6 to [0 x i8]*
	%8 = call i8 @lex_Skip([0 x i8]* %7)
	%9 = call i8 @lex_Expect(i8 4)
	br label %L.1
L.1:
	br label %return
return:
	ret void
}
define %ast.AstNode* @stmt_WhenDo(i8 zeroext %nest.arg) nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%nest = alloca i8
	store i8 %nest.arg, i8* %nest
	%tree = alloca %ast.AstNode*
	%stree = alloca %ast.AstNode*
	%tok = alloca i8
	store %ast.AstNode* null, %ast.AstNode** %tree
	%0 = load i8* @lex_Token
	%1 = icmp eq i8 %0, 36
	br i1 %1, label %L.2, label %L.3
L.2:
	%2 = call i8 @lex_Next()
	store i8 %2, i8* %tok
	%3 = call %ast.AstNode* @ast_New(i8 63, %type.TypeNode* null)
	store %ast.AstNode* %3, %ast.AstNode** %tree
	br label %L.4
L.4:
	%4 = load i8* %tok
	%5 = icmp ne i8 %4, 37
	br i1 %5, label %L.7, label %L.8
L.7:
	%6 = load i8* %tok
	%7 = icmp ne i8 %6, 1
	br label %L.8
L.8:
	%8 = phi i1 [ false, %L.4 ], [ %7, %L.7 ]
	%9 = xor i1 %8, true
	br i1 %9, label %L.5, label %L.6
L.6:
	%10 = load i8* %nest
	%11 = zext i8 %10 to i32
	switch i32 %11, label %L.9 [
		i32 0, label %L.11
		i32 1, label %L.12
		i32 2, label %L.13
	]
L.11:
	%12 = call %ast.AstNode* @stmt_ProgStmt()
	store %ast.AstNode* %12, %ast.AstNode** %stree
	br label %L.10
L.12:
	%13 = call %ast.AstNode* @stmt_PkgStmt()
	store %ast.AstNode* %13, %ast.AstNode** %stree
	br label %L.10
L.13:
	%14 = call %ast.AstNode* @stmt_Statement()
	store %ast.AstNode* %14, %ast.AstNode** %stree
	br label %L.10
L.9:
	br label %L.10
L.10:
	%15 = load %ast.AstNode** %stree
	%16 = icmp ne %ast.AstNode* %15, null
	br i1 %16, label %L.15, label %L.14
L.15:
	%17 = load %ast.AstNode** %tree
	%18 = load %ast.AstNode** %stree
	%19 = call %ast.AstNode* @ast_Child(%ast.AstNode* %17, %ast.AstNode* %18)
	store %ast.AstNode* %19, %ast.AstNode** %tree
	br label %L.14
L.14:
	%20 = load i8* @lex_Token
	store i8 %20, i8* %tok
	br label %L.4
L.5:
	%21 = call i8 @lex_Expect(i8 37)
	br label %L.1
L.3:
	%22 = load i8* %nest
	%23 = zext i8 %22 to i32
	switch i32 %23, label %L.16 [
		i32 0, label %L.18
		i32 1, label %L.19
		i32 2, label %L.20
	]
L.18:
	%24 = call %ast.AstNode* @stmt_ProgStmt()
	store %ast.AstNode* %24, %ast.AstNode** %tree
	br label %L.17
L.19:
	%25 = call %ast.AstNode* @stmt_PkgStmt()
	store %ast.AstNode* %25, %ast.AstNode** %tree
	br label %L.17
L.20:
	%26 = call %ast.AstNode* @stmt_Statement()
	store %ast.AstNode* %26, %ast.AstNode** %tree
	br label %L.17
L.16:
	br label %L.17
L.17:
	br label %L.1
L.1:
	%27 = load %ast.AstNode** %tree
	store %ast.AstNode* %27, %ast.AstNode** %rv.0
	br label %return
return:
	%28 = load %ast.AstNode** %rv.0
	ret %ast.AstNode* %28
}
define %ast.AstNode* @stmt_WhenStmt(i8 zeroext %nest.arg) nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%nest = alloca i8
	store i8 %nest.arg, i8* %nest
	%tree = alloca %ast.AstNode*
	%val = alloca i64
	%tok = alloca i8
	%ctree = alloca %ast.AstNode*
	store %ast.AstNode* null, %ast.AstNode** %tree
	%0 = call %ast.AstNode* @expr_Bool(%type.TypeNode* null)
	store %ast.AstNode* %0, %ast.AstNode** %ctree
	%1 = load %ast.AstNode** %ctree
	%2 = getelementptr %ast.AstNode* %1, i32 0, i32 0
	%3 = load i8* %2
	%4 = icmp ne i8 %3, 7
	br i1 %4, label %L.2, label %L.1
L.2:
	call void @lex_Error(i8 60)
	%5 = load %ast.AstNode** %tree
	store %ast.AstNode* %5, %ast.AstNode** %rv.0
	br label %return
L.1:
	%6 = load %ast.AstNode** %ctree
	%7 = getelementptr %ast.AstNode* %6, i32 0, i32 8
	%8 = load i64* %7
	store i64 %8, i64* %val
	%9 = getelementptr [2 x i8]* @stmt_thenlist
	%10 = bitcast [2 x i8]* %9 to [0 x i8]*
	%11 = call i8 @lex_Keyword([0 x i8]* %10)
	store i8 %11, i8* %tok
	%12 = load i8* %tok
	%13 = icmp eq i8 %12, 48
	br i1 %13, label %L.4, label %L.5
L.4:
	%14 = call i8 @lex_Next()
	store i8 %14, i8* %tok
	%15 = load i64* %val
	%16 = icmp eq i64 %15, 0
	br i1 %16, label %L.7, label %L.8
L.7:
	%17 = load i8* %tok
	call void @stmt_WhenSkip(i8 %17)
	br label %L.6
L.8:
	%18 = load i8* %nest
	%19 = call %ast.AstNode* @stmt_WhenDo(i8 %18)
	store %ast.AstNode* %19, %ast.AstNode** %tree
	br label %L.6
L.6:
	%20 = getelementptr [2 x i8]* @stmt_elselist
	%21 = bitcast [2 x i8]* %20 to [0 x i8]*
	%22 = call i8 @lex_Keyword([0 x i8]* %21)
	store i8 %22, i8* %tok
	%23 = load i8* %tok
	%24 = icmp eq i8 %23, 49
	br i1 %24, label %L.10, label %L.9
L.10:
	%25 = call i8 @lex_Next()
	store i8 %25, i8* %tok
	%26 = load i64* %val
	%27 = icmp eq i64 %26, 0
	br i1 %27, label %L.12, label %L.13
L.12:
	%28 = load i8* %nest
	%29 = call %ast.AstNode* @stmt_WhenDo(i8 %28)
	store %ast.AstNode* %29, %ast.AstNode** %tree
	br label %L.11
L.13:
	%30 = load i8* %tok
	call void @stmt_WhenSkip(i8 %30)
	br label %L.11
L.11:
	br label %L.9
L.9:
	br label %L.3
L.5:
	call void @lex_ErrorT(i8 10, i8 48)
	br label %L.3
L.3:
	%31 = load %ast.AstNode** %tree
	store %ast.AstNode* %31, %ast.AstNode** %rv.0
	br label %return
return:
	%32 = load %ast.AstNode** %rv.0
	ret %ast.AstNode* %32
}
define %ast.AstNode* @stmt_TypeDecl() nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%tree = alloca %ast.AstNode*
	%tok = alloca i8
	%s = alloca %symb.SymbNode*
	%bs = alloca %symb.SymbNode*
	%t = alloca %type.TypeNode*
	%bt = alloca %type.TypeNode*
	store %ast.AstNode* null, %ast.AstNode** %tree
	%0 = load i8* @lex_Token
	store i8 %0, i8* %tok
	%1 = load i8* %tok
	%2 = icmp eq i8 %1, 40
	br i1 %2, label %L.2, label %L.3
L.2:
	%3 = getelementptr [64 x i8]* @lex_Ident
	%4 = bitcast [64 x i8]* %3 to [0 x i8]*
	%5 = call %symb.SymbNode* @symb_New(i8 2, [0 x i8]* %4, i8 0)
	store %symb.SymbNode* %5, %symb.SymbNode** %s
	store %type.TypeNode* null, %type.TypeNode** %bt
	%6 = call i8 @lex_Next()
	store i8 %6, i8* %tok
	%7 = load i8* %tok
	%8 = icmp eq i8 %7, 32
	br i1 %8, label %L.5, label %L.4
L.5:
	%9 = call i8 @lex_Next()
	store i8 %9, i8* %tok
	%10 = load i8* %tok
	%11 = icmp eq i8 %10, 40
	br i1 %11, label %L.7, label %L.6
L.7:
	%12 = getelementptr [64 x i8]* @lex_Ident
	%13 = bitcast [64 x i8]* %12 to [0 x i8]*
	%14 = call %symb.SymbNode* @symb_Find([0 x i8]* %13)
	store %symb.SymbNode* %14, %symb.SymbNode** %bs
	%15 = load %symb.SymbNode** %bs
	%16 = icmp ne %symb.SymbNode* %15, null
	br i1 %16, label %L.9, label %L.10
L.9:
	%17 = load %symb.SymbNode** %bs
	%18 = getelementptr %symb.SymbNode* %17, i32 0, i32 12
	%19 = load i8* %18
	%20 = icmp eq i8 %19, 2
	br i1 %20, label %L.12, label %L.13
L.12:
	%21 = load %symb.SymbNode** %bs
	%22 = getelementptr %symb.SymbNode* %21, i32 0, i32 1
	%23 = load %type.TypeNode** %22
	store %type.TypeNode* %23, %type.TypeNode** %bt
	br label %L.11
L.13:
	call void @lex_Error(i8 19)
	br label %L.11
L.11:
	br label %L.8
L.10:
	%24 = getelementptr [64 x i8]* @lex_Ident
	%25 = bitcast [64 x i8]* %24 to [0 x i8]*
	call void @lex_ErrorI(i8 12, [0 x i8]* %25)
	br label %L.8
L.8:
	%26 = call i8 @lex_Next()
	store i8 %26, i8* %tok
	br label %L.6
L.6:
	%27 = call i8 @lex_Expect(i8 33)
	store i8 %27, i8* %tok
	br label %L.4
L.4:
	%28 = load i8* %tok
	%29 = icmp eq i8 %28, 3
	br i1 %29, label %L.15, label %L.14
L.15:
	%30 = call i8 @lex_Next()
	store i8 %30, i8* %tok
	%31 = load i8* %tok
	%32 = load %type.TypeNode** %bt
	%33 = call %type.TypeNode* @type_Def(i8 %31, %type.TypeNode* %32)
	store %type.TypeNode* %33, %type.TypeNode** %t
	%34 = load %type.TypeNode** %t
	%35 = icmp ne %type.TypeNode* %34, null
	br i1 %35, label %L.16, label %L.17
L.16:
	%36 = load %type.TypeNode** %t
	%37 = getelementptr %type.TypeNode* %36, i32 0, i32 2
	%38 = load %symb.SymbNode** %37
	%39 = icmp eq %symb.SymbNode* %38, null
	br label %L.17
L.17:
	%40 = phi i1 [ false, %L.15 ], [ %39, %L.16 ]
	br i1 %40, label %L.19, label %L.18
L.19:
	%41 = load %symb.SymbNode** %s
	%42 = load %type.TypeNode** %t
	%43 = getelementptr %type.TypeNode* %42, i32 0, i32 2
	store %symb.SymbNode* %41, %symb.SymbNode** %43
	br label %L.18
L.18:
	%44 = load i8* @lex_Token
	store i8 %44, i8* %tok
	%45 = load i8* %tok
	%46 = icmp eq i8 %45, 3
	br i1 %46, label %L.21, label %L.20
L.21:
	%47 = load %type.TypeNode** %t
	%48 = call %type.TypeNode* @type_TypeAttributes(%type.TypeNode* %47)
	store %type.TypeNode* %48, %type.TypeNode** %t
	br label %L.20
L.20:
	%49 = load %type.TypeNode** %t
	%50 = load %symb.SymbNode** %s
	%51 = getelementptr %symb.SymbNode* %50, i32 0, i32 1
	store %type.TypeNode* %49, %type.TypeNode** %51
	%52 = load %symb.SymbNode** %s
	%53 = getelementptr %symb.SymbNode* %52, i32 0, i32 14
	%54 = load i8* %53
	%55 = icmp ne i8 %54, 0
	br i1 %55, label %L.23, label %L.22
L.23:
	%56 = load %symb.SymbNode** %s
	%57 = load %type.TypeNode** %t
	call void @type_FwdFix(%symb.SymbNode* %56, %type.TypeNode* %57)
	br label %L.22
L.22:
	%58 = load %type.TypeNode** %t
	call void @type_Final(%type.TypeNode* %58)
	br label %L.14
L.14:
	%59 = call i8 @lex_Expect(i8 4)
	store i8 %59, i8* %tok
	br label %L.1
L.3:
	call void @lex_Error(i8 11)
	br label %L.1
L.1:
	%60 = load %ast.AstNode** %tree
	store %ast.AstNode* %60, %ast.AstNode** %rv.0
	br label %return
return:
	%61 = load %ast.AstNode** %rv.0
	ret %ast.AstNode* %61
}
define %ast.AstNode* @stmt_VarNew(%symb.SymbNode* %s.arg, %type.TypeNode* %t.arg, %ast.AstNode* %iv.arg) nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%s = alloca %symb.SymbNode*
	%t = alloca %type.TypeNode*
	%iv = alloca %ast.AstNode*
	store %symb.SymbNode* %s.arg, %symb.SymbNode** %s
	store %type.TypeNode* %t.arg, %type.TypeNode** %t
	store %ast.AstNode* %iv.arg, %ast.AstNode** %iv
	%node = alloca %ast.AstNode*
	%0 = load %type.TypeNode** %t
	%1 = load %symb.SymbNode** %s
	%2 = getelementptr %symb.SymbNode* %1, i32 0, i32 1
	store %type.TypeNode* %0, %type.TypeNode** %2
	%3 = load %type.TypeNode** %t
	%4 = call %ast.AstNode* @ast_New(i8 5, %type.TypeNode* %3)
	store %ast.AstNode* %4, %ast.AstNode** %node
	%5 = load %ast.AstNode** %iv
	%6 = icmp ne %ast.AstNode* %5, null
	br i1 %6, label %L.2, label %L.1
L.2:
	%7 = load %ast.AstNode** %node
	%8 = load %ast.AstNode** %iv
	%9 = call %ast.AstNode* @ast_Child(%ast.AstNode* %7, %ast.AstNode* %8)
	store %ast.AstNode* %9, %ast.AstNode** %node
	br label %L.1
L.1:
	%10 = load %ast.AstNode** %node
	%11 = getelementptr %ast.AstNode* %10, i32 0, i32 1
	store i8 4, i8* %11
	%12 = load %type.TypeNode** %t
	%13 = getelementptr %type.TypeNode* %12, i32 0, i32 8
	%14 = load i32* %13
	%15 = trunc i32 %14 to i8
	%16 = load %ast.AstNode** %node
	%17 = getelementptr %ast.AstNode* %16, i32 0, i32 2
	store i8 %15, i8* %17
	%18 = load %symb.SymbNode** %s
	%19 = load %ast.AstNode** %node
	%20 = getelementptr %ast.AstNode* %19, i32 0, i32 10
	store %symb.SymbNode* %18, %symb.SymbNode** %20
	%21 = load %ast.AstNode** %node
	store %ast.AstNode* %21, %ast.AstNode** %rv.0
	br label %return
return:
	%22 = load %ast.AstNode** %rv.0
	ret %ast.AstNode* %22
}
define %ast.AstNode* @stmt_VarDecl() nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%tree = alloca %ast.AstNode*
	%stree = alloca %ast.AstNode*
	%iv = alloca %ast.AstNode*
	%tok = alloca i8
	%t = alloca %type.TypeNode*
	%s = alloca %symb.SymbNode*
	%ss = alloca %symb.SymbNode*
	store %ast.AstNode* null, %ast.AstNode** %tree
	%0 = load i8* @lex_Token
	store i8 %0, i8* %tok
	%1 = load i8* %tok
	%2 = icmp eq i8 %1, 40
	br i1 %2, label %L.2, label %L.1
L.2:
	%3 = getelementptr [64 x i8]* @lex_Ident
	%4 = bitcast [64 x i8]* %3 to [0 x i8]*
	%5 = call %symb.SymbNode* @symb_New(i8 3, [0 x i8]* %4, i8 0)
	store %symb.SymbNode* %5, %symb.SymbNode** %s
	%6 = load %symb.SymbNode** %s
	store %symb.SymbNode* %6, %symb.SymbNode** %ss
	%7 = call i8 @lex_Next()
	store i8 %7, i8* %tok
	br label %L.3
L.3:
	%8 = load i8* %tok
	%9 = icmp eq i8 %8, 5
	%10 = xor i1 %9, true
	br i1 %10, label %L.4, label %L.5
L.5:
	%11 = call i8 @lex_Next()
	store i8 %11, i8* %tok
	%12 = load i8* %tok
	%13 = icmp eq i8 %12, 40
	br i1 %13, label %L.7, label %L.8
L.7:
	%14 = getelementptr [64 x i8]* @lex_Ident
	%15 = bitcast [64 x i8]* %14 to [0 x i8]*
	%16 = call %symb.SymbNode* @symb_New(i8 3, [0 x i8]* %15, i8 0)
	store %symb.SymbNode* %16, %symb.SymbNode** %s
	%17 = call i8 @lex_Next()
	store i8 %17, i8* %tok
	br label %L.6
L.8:
	call void @lex_Error(i8 11)
	br label %L.6
L.6:
	br label %L.3
L.4:
	%18 = load i8* %tok
	%19 = icmp eq i8 %18, 3
	br i1 %19, label %L.10, label %L.11
L.10:
	%20 = call i8 @lex_Next()
	store i8 %20, i8* %tok
	%21 = load i8* %tok
	%22 = call %type.TypeNode* @type_Def(i8 %21, %type.TypeNode* null)
	store %type.TypeNode* %22, %type.TypeNode** %t
	%23 = load i8* @lex_Token
	store i8 %23, i8* %tok
	%24 = load i8* %tok
	%25 = icmp eq i8 %24, 3
	br i1 %25, label %L.13, label %L.12
L.13:
	%26 = load %symb.SymbNode** %s
	%27 = load %type.TypeNode** %t
	%28 = call %type.TypeNode* @type_VarAttributes(%symb.SymbNode* %26, %type.TypeNode* %27)
	store %type.TypeNode* %28, %type.TypeNode** %t
	br label %L.12
L.12:
	%29 = load %type.TypeNode** %t
	call void @type_Final(%type.TypeNode* %29)
	store %ast.AstNode* null, %ast.AstNode** %iv
	%30 = load i8* @lex_Token
	store i8 %30, i8* %tok
	%31 = load i8* %tok
	%32 = icmp eq i8 %31, 9
	br i1 %32, label %L.15, label %L.14
L.15:
	%33 = call i8 @lex_Next()
	store i8 %33, i8* %tok
	%34 = load %type.TypeNode** %t
	%35 = call %ast.AstNode* @expr_Const(%type.TypeNode* %34)
	store %ast.AstNode* %35, %ast.AstNode** %iv
	%36 = load %symb.SymbNode** %s
	%37 = getelementptr %symb.SymbNode* %36, i32 0, i32 15
	store i8 1, i8* %37
	br label %L.14
L.14:
	br label %L.9
L.11:
	call void @lex_ErrorT(i8 10, i8 3)
	br label %L.9
L.9:
	%38 = load %symb.SymbNode** %ss
	%39 = getelementptr %symb.SymbNode* %38, i32 0, i32 0
	%40 = load %symb.SymbNode** %39
	%41 = icmp eq %symb.SymbNode* %40, null
	br i1 %41, label %L.17, label %L.18
L.17:
	%42 = load %symb.SymbNode** %ss
	%43 = load %type.TypeNode** %t
	%44 = load %ast.AstNode** %iv
	%45 = call %ast.AstNode* @stmt_VarNew(%symb.SymbNode* %42, %type.TypeNode* %43, %ast.AstNode* %44)
	store %ast.AstNode* %45, %ast.AstNode** %tree
	br label %L.16
L.18:
	%46 = call %ast.AstNode* @ast_New(i8 63, %type.TypeNode* null)
	store %ast.AstNode* %46, %ast.AstNode** %tree
	br label %L.19
L.19:
	%47 = load %symb.SymbNode** %ss
	%48 = load %type.TypeNode** %t
	%49 = load %ast.AstNode** %iv
	%50 = call %ast.AstNode* @stmt_VarNew(%symb.SymbNode* %47, %type.TypeNode* %48, %ast.AstNode* %49)
	store %ast.AstNode* %50, %ast.AstNode** %stree
	%51 = load %ast.AstNode** %tree
	%52 = load %ast.AstNode** %stree
	%53 = call %ast.AstNode* @ast_Child(%ast.AstNode* %51, %ast.AstNode* %52)
	store %ast.AstNode* %53, %ast.AstNode** %tree
	%54 = load %symb.SymbNode** %ss
	%55 = load %symb.SymbNode** %s
	%56 = icmp eq %symb.SymbNode* %54, %55
	br i1 %56, label %L.23, label %L.22
L.22:
	%57 = load %symb.SymbNode** %ss
	%58 = getelementptr %symb.SymbNode* %57, i32 0, i32 0
	%59 = load %symb.SymbNode** %58
	%60 = icmp eq %symb.SymbNode* %59, null
	br label %L.23
L.23:
	%61 = phi i1 [ true, %L.19 ], [ %60, %L.22 ]
	br i1 %61, label %L.20, label %L.21
L.21:
	%62 = load %symb.SymbNode** %ss
	%63 = getelementptr %symb.SymbNode* %62, i32 0, i32 0
	%64 = load %symb.SymbNode** %63
	store %symb.SymbNode* %64, %symb.SymbNode** %ss
	br label %L.19
L.20:
	br label %L.16
L.16:
	%65 = call i8 @lex_Expect(i8 4)
	store i8 %65, i8* %tok
	br label %L.1
L.1:
	%66 = load %ast.AstNode** %tree
	store %ast.AstNode* %66, %ast.AstNode** %rv.0
	br label %return
return:
	%67 = load %ast.AstNode** %rv.0
	ret %ast.AstNode* %67
}
define %ast.AstNode* @stmt_ConstDecl() nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%tree = alloca %ast.AstNode*
	%s = alloca %symb.SymbNode*
	%t = alloca %type.TypeNode*
	%tok = alloca i8
	store %ast.AstNode* null, %ast.AstNode** %tree
	%0 = load i8* @lex_Token
	store i8 %0, i8* %tok
	%1 = load i8* %tok
	%2 = icmp eq i8 %1, 40
	br i1 %2, label %L.2, label %L.3
L.2:
	%3 = getelementptr [64 x i8]* @lex_Ident
	%4 = bitcast [64 x i8]* %3 to [0 x i8]*
	%5 = call %symb.SymbNode* @symb_New(i8 1, [0 x i8]* %4, i8 0)
	store %symb.SymbNode* %5, %symb.SymbNode** %s
	%6 = call i8 @lex_Next()
	store i8 %6, i8* %tok
	store %type.TypeNode* null, %type.TypeNode** %t
	%7 = load i8* %tok
	%8 = icmp eq i8 %7, 3
	br i1 %8, label %L.5, label %L.4
L.5:
	%9 = call i8 @lex_Next()
	store i8 %9, i8* %tok
	%10 = load i8* %tok
	%11 = call %type.TypeNode* @type_Def(i8 %10, %type.TypeNode* null)
	store %type.TypeNode* %11, %type.TypeNode** %t
	%12 = load i8* @lex_Token
	store i8 %12, i8* %tok
	%13 = load i8* %tok
	%14 = icmp eq i8 %13, 3
	br i1 %14, label %L.7, label %L.6
L.7:
	%15 = load %type.TypeNode** %t
	%16 = call %type.TypeNode* @type_TypeAttributes(%type.TypeNode* %15)
	store %type.TypeNode* %16, %type.TypeNode** %t
	%17 = load i8* @lex_Token
	store i8 %17, i8* %tok
	br label %L.6
L.6:
	%18 = load %type.TypeNode** %t
	call void @type_Final(%type.TypeNode* %18)
	br label %L.4
L.4:
	%19 = load i8* %tok
	%20 = icmp eq i8 %19, 9
	br i1 %20, label %L.9, label %L.10
L.9:
	%21 = call i8 @lex_Next()
	store i8 %21, i8* %tok
	%22 = load %type.TypeNode** %t
	%23 = call %ast.AstNode* @expr_Const(%type.TypeNode* %22)
	store %ast.AstNode* %23, %ast.AstNode** %tree
	%24 = load %type.TypeNode** %t
	%25 = icmp eq %type.TypeNode* %24, null
	br i1 %25, label %L.12, label %L.11
L.12:
	%26 = load %ast.AstNode** %tree
	%27 = getelementptr %ast.AstNode* %26, i32 0, i32 9
	%28 = load %type.TypeNode** %27
	store %type.TypeNode* %28, %type.TypeNode** %t
	br label %L.11
L.11:
	%29 = load %type.TypeNode** %t
	%30 = getelementptr %type.TypeNode* %29, i32 0, i32 11
	%31 = load i8* %30
	%32 = icmp ule i8 %31, 4
	br i1 %32, label %L.14, label %L.13
L.13:
	%33 = load %type.TypeNode** %t
	%34 = getelementptr %type.TypeNode* %33, i32 0, i32 12
	%35 = load i8* %34
	%36 = icmp eq i8 %35, 2
	br label %L.14
L.14:
	%37 = phi i1 [ true, %L.11 ], [ %36, %L.13 ]
	br i1 %37, label %L.16, label %L.17
L.16:
	%38 = load %ast.AstNode** %tree
	%39 = getelementptr %ast.AstNode* %38, i32 0, i32 0
	%40 = load i8* %39
	%41 = icmp eq i8 %40, 7
	br i1 %41, label %L.19, label %L.20
L.19:
	%42 = load %ast.AstNode** %tree
	%43 = getelementptr %ast.AstNode* %42, i32 0, i32 8
	%44 = load i64* %43
	%45 = load %symb.SymbNode** %s
	%46 = getelementptr %symb.SymbNode* %45, i32 0, i32 7
	store i64 %44, i64* %46
	%47 = load %type.TypeNode** %t
	%48 = icmp eq %type.TypeNode* %47, null
	br i1 %48, label %L.22, label %L.21
L.22:
	%49 = load %ast.AstNode** %tree
	%50 = getelementptr %ast.AstNode* %49, i32 0, i32 9
	%51 = load %type.TypeNode** %50
	store %type.TypeNode* %51, %type.TypeNode** %t
	br label %L.21
L.21:
	store %ast.AstNode* null, %ast.AstNode** %tree
	br label %L.18
L.20:
	call void @lex_Error(i8 59)
	br label %L.18
L.18:
	br label %L.15
L.17:
	%52 = load %type.TypeNode** %t
	%53 = getelementptr %type.TypeNode* %52, i32 0, i32 11
	%54 = load i8* %53
	%55 = icmp eq i8 %54, 5
	br i1 %55, label %L.23, label %L.24
L.23:
	%56 = load %type.TypeNode** %t
	%57 = getelementptr %type.TypeNode* %56, i32 0, i32 16
	%58 = load i8* %57
	%59 = icmp ne i8 %58, 0
	br label %L.24
L.24:
	%60 = phi i1 [ false, %L.17 ], [ %59, %L.23 ]
	br i1 %60, label %L.26, label %L.25
L.26:
	%61 = load %ast.AstNode** %tree
	%62 = getelementptr %ast.AstNode* %61, i32 0, i32 9
	%63 = load %type.TypeNode** %62
	store %type.TypeNode* %63, %type.TypeNode** %t
	br label %L.25
L.25:
	%64 = load %type.TypeNode** %t
	%65 = load %ast.AstNode** %tree
	%66 = call %ast.AstNode* @ast_New1(i8 6, %type.TypeNode* %64, %ast.AstNode* %65)
	store %ast.AstNode* %66, %ast.AstNode** %tree
	%67 = load %symb.SymbNode** %s
	%68 = load %ast.AstNode** %tree
	%69 = getelementptr %ast.AstNode* %68, i32 0, i32 10
	store %symb.SymbNode* %67, %symb.SymbNode** %69
	br label %L.15
L.15:
	%70 = load %symb.SymbNode** %s
	%71 = getelementptr %symb.SymbNode* %70, i32 0, i32 15
	store i8 1, i8* %71
	br label %L.8
L.10:
	call void @lex_Error(i8 59)
	br label %L.8
L.8:
	%72 = load %type.TypeNode** %t
	%73 = load %symb.SymbNode** %s
	%74 = getelementptr %symb.SymbNode* %73, i32 0, i32 1
	store %type.TypeNode* %72, %type.TypeNode** %74
	br label %L.1
L.3:
	call void @lex_Error(i8 11)
	br label %L.1
L.1:
	%75 = call i8 @lex_Expect(i8 4)
	store i8 %75, i8* %tok
	%76 = load %ast.AstNode** %tree
	store %ast.AstNode* %76, %ast.AstNode** %rv.0
	br label %return
return:
	%77 = load %ast.AstNode** %rv.0
	ret %ast.AstNode* %77
}
define %ast.AstNode* @stmt_GetLHS() nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%s = alloca %symb.SymbNode*
	%tok = alloca i8
	%tree = alloca %ast.AstNode*
	store %ast.AstNode* null, %ast.AstNode** %tree
	%0 = load i8* @lex_Token
	store i8 %0, i8* %tok
	%1 = load i8* %tok
	%2 = icmp eq i8 %1, 40
	br i1 %2, label %L.2, label %L.3
L.2:
	%3 = getelementptr [64 x i8]* @lex_Ident
	%4 = bitcast [64 x i8]* %3 to [0 x i8]*
	%5 = call %symb.SymbNode* @symb_Find([0 x i8]* %4)
	store %symb.SymbNode* %5, %symb.SymbNode** %s
	%6 = call i8 @lex_Next()
	store i8 %6, i8* %tok
	%7 = load %symb.SymbNode** %s
	%8 = icmp ne %symb.SymbNode* %7, null
	br i1 %8, label %L.5, label %L.6
L.5:
	%9 = load %symb.SymbNode** %s
	%10 = call %ast.AstNode* @expr_Primary(%symb.SymbNode* %9)
	store %ast.AstNode* %10, %ast.AstNode** %tree
	br label %L.4
L.6:
	%11 = getelementptr [64 x i8]* @lex_Ident
	%12 = bitcast [64 x i8]* %11 to [0 x i8]*
	call void @lex_ErrorI(i8 12, [0 x i8]* %12)
	br label %L.4
L.4:
	br label %L.1
L.3:
	call void @lex_Error(i8 11)
	br label %L.1
L.1:
	%13 = load %ast.AstNode** %tree
	store %ast.AstNode* %13, %ast.AstNode** %rv.0
	br label %return
return:
	%14 = load %ast.AstNode** %rv.0
	ret %ast.AstNode* %14
}
define %ast.AstNode* @stmt_Asm() nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%tree = alloca %ast.AstNode*
	%node = alloca %ast.AstNode*
	%temp = alloca %ast.AstNode*
	%narg = alloca i16
	%nout = alloca i16
	%tok = alloca i8
	%what = alloca [0 x i8]*
	%i = alloca i8
	%na = alloca i8
	%no = alloca i8
	%constraints = alloca [10 x i8]
	%outputs = alloca [10 x %ast.AstNode*]
	%tlhead = alloca %type.TypeListEntry*
	%tltail = alloca %type.TypeListEntry*
	%tl = alloca %type.TypeListEntry*
	%0 = call %ast.AstNode* @ast_New(i8 12, %type.TypeNode* null)
	store %ast.AstNode* %0, %ast.AstNode** %tree
	%1 = load i8* @lex_Token
	store i8 %1, i8* %tok
	%2 = load i8* %tok
	%3 = icmp eq i8 %2, 39
	br i1 %3, label %L.2, label %L.3
L.2:
	%4 = load %ast.AstNode** %tree
	%5 = call %ast.AstNode* @expr_String()
	%6 = call %ast.AstNode* @ast_Child(%ast.AstNode* %4, %ast.AstNode* %5)
	store %ast.AstNode* %6, %ast.AstNode** %tree
	%7 = call i8 @lex_Next()
	store i8 %7, i8* %tok
	%8 = load i8* %tok
	%9 = icmp eq i8 %8, 5
	br i1 %9, label %L.5, label %L.4
L.5:
	%10 = call i8 @lex_Next()
	store i8 %10, i8* %tok
	store i16 0, i16* %narg
	store i16 0, i16* %nout
	%11 = load i8* %tok
	%12 = icmp eq i8 %11, 39
	br i1 %12, label %L.7, label %L.8
L.7:
	%13 = call %ast.AstNode* @expr_String()
	store %ast.AstNode* %13, %ast.AstNode** %node
	%14 = load %ast.AstNode** %node
	%15 = getelementptr %ast.AstNode* %14, i32 0, i32 10
	%16 = load %symb.SymbNode** %15
	%17 = bitcast %symb.SymbNode* %16 to [0 x i8]*
	store [0 x i8]* %17, [0 x i8]** %what
	%18 = load %ast.AstNode** %tree
	%19 = load %ast.AstNode** %node
	%20 = call %ast.AstNode* @ast_Child(%ast.AstNode* %18, %ast.AstNode* %19)
	store %ast.AstNode* %20, %ast.AstNode** %tree
	%21 = call i8 @lex_Next()
	store i8 %21, i8* %tok
	store i8 0, i8* %i
	br label %L.9
L.9:
	%22 = load [0 x i8]** %what
	%23 = load i8* %i
	%24 = zext i8 %23 to i32
	%25 = getelementptr [0 x i8]* %22, i32 0, i32 %24
	%26 = load i8* %25
	%27 = icmp ne i8 %26, 0
	br i1 %27, label %L.12, label %L.13
L.12:
	%28 = load i16* %narg
	%29 = zext i16 %28 to i32
	%30 = icmp ult i32 %29, 8
	br label %L.13
L.13:
	%31 = phi i1 [ false, %L.9 ], [ %30, %L.12 ]
	%32 = xor i1 %31, true
	br i1 %32, label %L.10, label %L.11
L.11:
	%33 = load [0 x i8]** %what
	%34 = load i8* %i
	%35 = zext i8 %34 to i32
	%36 = getelementptr [0 x i8]* %33, i32 0, i32 %35
	%37 = load i8* %36
	%38 = zext i8 %37 to i32
	switch i32 %38, label %L.14 [
		i32 61, label %L.16
		i32 48, label %L.17
		i32 49, label %L.17
		i32 50, label %L.17
		i32 51, label %L.17
		i32 52, label %L.17
		i32 53, label %L.17
		i32 54, label %L.17
		i32 55, label %L.17
		i32 56, label %L.17
		i32 57, label %L.17
		i32 126, label %L.18
	]
L.16:
	%39 = load i8* %i
	%40 = add i8 %39, 1
	store i8 %40, i8* %i
	%41 = load i16* %nout
	%42 = add i16 %41, 1
	store i16 %42, i16* %nout
	%43 = load i16* %narg
	%44 = zext i16 %43 to i32
	%45 = getelementptr [10 x i8]* %constraints, i32 0, i32 %44
	store i8 11, i8* %45
	%46 = load i16* %narg
	%47 = add i16 %46, 1
	store i16 %47, i16* %narg
	br label %L.15
L.17:
	%48 = load [0 x i8]** %what
	%49 = load i8* %i
	%50 = zext i8 %49 to i32
	%51 = getelementptr [0 x i8]* %48, i32 0, i32 %50
	%52 = load i8* %51
	%53 = sub i8 %52, 48
	%54 = load i16* %narg
	%55 = zext i16 %54 to i32
	%56 = getelementptr [10 x i8]* %constraints, i32 0, i32 %55
	store i8 %53, i8* %56
	%57 = load i16* %narg
	%58 = add i16 %57, 1
	store i16 %58, i16* %narg
	br label %L.15
L.18:
	br label %L.15
L.14:
	%59 = load i16* %narg
	%60 = zext i16 %59 to i32
	%61 = getelementptr [10 x i8]* %constraints, i32 0, i32 %60
	store i8 10, i8* %61
	%62 = load i16* %narg
	%63 = add i16 %62, 1
	store i16 %63, i16* %narg
	br label %L.15
L.15:
	%64 = load i8* %i
	%65 = add i8 %64, 1
	store i8 %65, i8* %i
	%66 = load [0 x i8]** %what
	%67 = load i8* %i
	%68 = zext i8 %67 to i32
	%69 = getelementptr [0 x i8]* %66, i32 0, i32 %68
	%70 = load i8* %69
	%71 = icmp ne i8 %70, 44
	br i1 %71, label %L.10, label %L.19
L.19:
	%72 = load i8* %i
	%73 = add i8 %72, 1
	store i8 %73, i8* %i
	br label %L.9
L.10:
	br label %L.6
L.8:
	call void @lex_ErrorT(i8 10, i8 39)
	br label %L.6
L.6:
	store i8 0, i8* %na
	store i8 0, i8* %no
	br label %L.20
L.20:
	%74 = load i8* %na
	%75 = zext i8 %74 to i16
	%76 = load i16* %narg
	%77 = icmp ult i16 %75, %76
	%78 = xor i1 %77, true
	br i1 %78, label %L.21, label %L.22
L.22:
	%79 = load i8* %na
	%80 = zext i8 %79 to i32
	%81 = getelementptr [10 x i8]* %constraints, i32 0, i32 %80
	%82 = load i8* %81
	%83 = icmp ult i8 %82, 10
	br i1 %83, label %L.24, label %L.25
L.24:
	%84 = load i8* %na
	%85 = zext i8 %84 to i32
	%86 = getelementptr [10 x i8]* %constraints, i32 0, i32 %85
	%87 = load i8* %86
	%88 = zext i8 %87 to i32
	%89 = getelementptr [10 x %ast.AstNode*]* %outputs, i32 0, i32 %88
	%90 = load %ast.AstNode** %89
	%91 = call %ast.AstNode* @expr_Load(%ast.AstNode* %90)
	store %ast.AstNode* %91, %ast.AstNode** %node
	%92 = load %ast.AstNode** %tree
	%93 = load %ast.AstNode** %node
	%94 = call %ast.AstNode* @ast_Child(%ast.AstNode* %92, %ast.AstNode* %93)
	store %ast.AstNode* %94, %ast.AstNode** %tree
	br label %L.23
L.25:
	%95 = load i8* %tok
	%96 = icmp eq i8 %95, 5
	br i1 %96, label %L.27, label %L.28
L.27:
	%97 = call i8 @lex_Next()
	store i8 %97, i8* %tok
	%98 = load i8* %na
	%99 = zext i8 %98 to i32
	%100 = getelementptr [10 x i8]* %constraints, i32 0, i32 %99
	%101 = load i8* %100
	%102 = icmp eq i8 %101, 11
	br i1 %102, label %L.30, label %L.31
L.30:
	%103 = call %ast.AstNode* @stmt_GetLHS()
	%104 = load i8* %no
	%105 = zext i8 %104 to i32
	%106 = getelementptr [10 x %ast.AstNode*]* %outputs, i32 0, i32 %105
	store %ast.AstNode* %103, %ast.AstNode** %106
	%107 = load i8* %no
	%108 = add i8 %107, 1
	store i8 %108, i8* %no
	br label %L.29
L.31:
	%109 = call %ast.AstNode* @expr_Bool(%type.TypeNode* null)
	store %ast.AstNode* %109, %ast.AstNode** %node
	%110 = load %ast.AstNode** %tree
	%111 = load %ast.AstNode** %node
	%112 = call %ast.AstNode* @ast_Child(%ast.AstNode* %110, %ast.AstNode* %111)
	store %ast.AstNode* %112, %ast.AstNode** %tree
	br label %L.29
L.29:
	%113 = load i8* @lex_Token
	store i8 %113, i8* %tok
	br label %L.26
L.28:
	call void @lex_ErrorT(i8 10, i8 5)
	br label %L.26
L.26:
	br label %L.23
L.23:
	%114 = load i8* %na
	%115 = add i8 %114, 1
	store i8 %115, i8* %na
	br label %L.20
L.21:
	store %type.TypeListEntry* null, %type.TypeListEntry** %tlhead
	store %type.TypeListEntry* null, %type.TypeListEntry** %tltail
	store i8 0, i8* %no
	br label %L.32
L.32:
	%116 = load i8* %no
	%117 = zext i8 %116 to i16
	%118 = load i16* %nout
	%119 = icmp ult i16 %117, %118
	%120 = xor i1 %119, true
	br i1 %120, label %L.33, label %L.34
L.34:
	%121 = call [0 x i8]* @sys_zalloc(i32 8)
	%122 = bitcast [0 x i8]* %121 to %type.TypeListEntry*
	store %type.TypeListEntry* %122, %type.TypeListEntry** %tl
	%123 = load i8* %no
	%124 = zext i8 %123 to i32
	%125 = getelementptr [10 x %ast.AstNode*]* %outputs, i32 0, i32 %124
	%126 = load %ast.AstNode** %125
	%127 = getelementptr %ast.AstNode* %126, i32 0, i32 9
	%128 = load %type.TypeNode** %127
	%129 = load %type.TypeListEntry** %tl
	%130 = getelementptr %type.TypeListEntry* %129, i32 0, i32 1
	store %type.TypeNode* %128, %type.TypeNode** %130
	%131 = load %type.TypeListEntry** %tltail
	%132 = icmp eq %type.TypeListEntry* %131, null
	br i1 %132, label %L.36, label %L.37
L.36:
	%133 = load %type.TypeListEntry** %tl
	store %type.TypeListEntry* %133, %type.TypeListEntry** %tlhead
	br label %L.35
L.37:
	%134 = load %type.TypeListEntry** %tl
	%135 = load %type.TypeListEntry** %tltail
	%136 = getelementptr %type.TypeListEntry* %135, i32 0, i32 0
	store %type.TypeListEntry* %134, %type.TypeListEntry** %136
	br label %L.35
L.35:
	%137 = load %type.TypeListEntry** %tl
	store %type.TypeListEntry* %137, %type.TypeListEntry** %tltail
	%138 = load i8* %no
	%139 = add i8 %138, 1
	store i8 %139, i8* %no
	br label %L.32
L.33:
	%140 = load %type.TypeListEntry** %tlhead
	%141 = bitcast %type.TypeListEntry* %140 to %type.TypeNode*
	%142 = load %ast.AstNode** %tree
	%143 = getelementptr %ast.AstNode* %142, i32 0, i32 9
	store %type.TypeNode* %141, %type.TypeNode** %143
	%144 = load i16* %nout
	%145 = icmp ugt i16 %144, 0
	br i1 %145, label %L.39, label %L.38
L.39:
	%146 = load %ast.AstNode** %tree
	store %ast.AstNode* %146, %ast.AstNode** %node
	%147 = call %ast.AstNode* @ast_New(i8 26, %type.TypeNode* null)
	store %ast.AstNode* %147, %ast.AstNode** %tree
	store i8 0, i8* %no
	br label %L.40
L.40:
	%148 = load i8* %no
	%149 = zext i8 %148 to i16
	%150 = load i16* %nout
	%151 = icmp ult i16 %149, %150
	%152 = xor i1 %151, true
	br i1 %152, label %L.41, label %L.42
L.42:
	%153 = load %ast.AstNode** %tree
	%154 = load i8* %no
	%155 = zext i8 %154 to i32
	%156 = getelementptr [10 x %ast.AstNode*]* %outputs, i32 0, i32 %155
	%157 = load %ast.AstNode** %156
	%158 = call %ast.AstNode* @ast_Child(%ast.AstNode* %153, %ast.AstNode* %157)
	store %ast.AstNode* %158, %ast.AstNode** %tree
	%159 = load i8* %no
	%160 = add i8 %159, 1
	store i8 %160, i8* %no
	br label %L.40
L.41:
	%161 = load i16* %nout
	%162 = icmp ugt i16 %161, 1
	br i1 %162, label %L.44, label %L.45
L.44:
	store i8 0, i8* %no
	br label %L.46
L.46:
	%163 = load i8* %no
	%164 = zext i8 %163 to i16
	%165 = load i16* %nout
	%166 = icmp ult i16 %164, %165
	%167 = xor i1 %166, true
	br i1 %167, label %L.47, label %L.48
L.48:
	%168 = load i8* %no
	%169 = zext i8 %168 to i32
	%170 = getelementptr [10 x %ast.AstNode*]* %outputs, i32 0, i32 %169
	%171 = load %ast.AstNode** %170
	%172 = getelementptr %ast.AstNode* %171, i32 0, i32 9
	%173 = load %type.TypeNode** %172
	%174 = load %ast.AstNode** %node
	%175 = call %ast.AstNode* @ast_New1(i8 24, %type.TypeNode* %173, %ast.AstNode* %174)
	store %ast.AstNode* %175, %ast.AstNode** %temp
	%176 = load %ast.AstNode** %temp
	%177 = getelementptr %ast.AstNode* %176, i32 0, i32 9
	%178 = load %type.TypeNode** %177
	%179 = getelementptr %type.TypeNode* %178, i32 0, i32 11
	%180 = load i8* %179
	%181 = load %ast.AstNode** %temp
	%182 = getelementptr %ast.AstNode* %181, i32 0, i32 1
	store i8 %180, i8* %182
	%183 = load %ast.AstNode** %temp
	%184 = getelementptr %ast.AstNode* %183, i32 0, i32 9
	%185 = load %type.TypeNode** %184
	%186 = getelementptr %type.TypeNode* %185, i32 0, i32 8
	%187 = load i32* %186
	%188 = trunc i32 %187 to i8
	%189 = load %ast.AstNode** %temp
	%190 = getelementptr %ast.AstNode* %189, i32 0, i32 2
	store i8 %188, i8* %190
	%191 = load i8* %no
	%192 = zext i8 %191 to i64
	%193 = load %ast.AstNode** %temp
	%194 = getelementptr %ast.AstNode* %193, i32 0, i32 8
	store i64 %192, i64* %194
	%195 = load %ast.AstNode** %tree
	%196 = load %ast.AstNode** %temp
	%197 = call %ast.AstNode* @ast_Child(%ast.AstNode* %195, %ast.AstNode* %196)
	store %ast.AstNode* %197, %ast.AstNode** %tree
	%198 = load i8* %no
	%199 = add i8 %198, 1
	store i8 %199, i8* %no
	br label %L.46
L.47:
	br label %L.43
L.45:
	%200 = getelementptr [10 x %ast.AstNode*]* %outputs, i32 0, i32 0
	%201 = load %ast.AstNode** %200
	%202 = getelementptr %ast.AstNode* %201, i32 0, i32 9
	%203 = load %type.TypeNode** %202
	%204 = load %ast.AstNode** %node
	%205 = call %ast.AstNode* @ast_New1(i8 1, %type.TypeNode* %203, %ast.AstNode* %204)
	store %ast.AstNode* %205, %ast.AstNode** %temp
	%206 = load %ast.AstNode** %temp
	%207 = getelementptr %ast.AstNode* %206, i32 0, i32 9
	%208 = load %type.TypeNode** %207
	%209 = getelementptr %type.TypeNode* %208, i32 0, i32 11
	%210 = load i8* %209
	%211 = load %ast.AstNode** %temp
	%212 = getelementptr %ast.AstNode* %211, i32 0, i32 1
	store i8 %210, i8* %212
	%213 = load %ast.AstNode** %temp
	%214 = getelementptr %ast.AstNode* %213, i32 0, i32 9
	%215 = load %type.TypeNode** %214
	%216 = getelementptr %type.TypeNode* %215, i32 0, i32 8
	%217 = load i32* %216
	%218 = trunc i32 %217 to i8
	%219 = load %ast.AstNode** %temp
	%220 = getelementptr %ast.AstNode* %219, i32 0, i32 2
	store i8 %218, i8* %220
	%221 = load %ast.AstNode** %tree
	%222 = load %ast.AstNode** %temp
	%223 = call %ast.AstNode* @ast_Child(%ast.AstNode* %221, %ast.AstNode* %222)
	store %ast.AstNode* %223, %ast.AstNode** %tree
	br label %L.43
L.43:
	br label %L.38
L.38:
	br label %L.4
L.4:
	br label %L.1
L.3:
	call void @lex_ErrorT(i8 10, i8 39)
	br label %L.1
L.1:
	%224 = load %ast.AstNode** %tree
	store %ast.AstNode* %224, %ast.AstNode** %rv.0
	br label %return
return:
	%225 = load %ast.AstNode** %rv.0
	ret %ast.AstNode* %225
}
define %ast.AstNode* @stmt_CheckSwap(%ast.AstNode* %lhs.arg, %ast.AstNode* %rhs.arg) nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%lhs = alloca %ast.AstNode*
	%rhs = alloca %ast.AstNode*
	store %ast.AstNode* %lhs.arg, %ast.AstNode** %lhs
	store %ast.AstNode* %rhs.arg, %ast.AstNode** %rhs
	%0 = load %ast.AstNode** %lhs
	%1 = getelementptr %ast.AstNode* %0, i32 0, i32 9
	%2 = load %type.TypeNode** %1
	%3 = load %target.TargetT** @target_Target
	%4 = getelementptr %target.TargetT* %3, i32 0, i32 2
	%5 = load i8* %4
	%6 = call i8 @type_NeedSwap(%type.TypeNode* %2, i8 %5)
	%7 = icmp ne i8 %6, 0
	br i1 %7, label %L.2, label %L.1
L.2:
	%8 = load %ast.AstNode** %rhs
	%9 = getelementptr %ast.AstNode* %8, i32 0, i32 9
	%10 = load %type.TypeNode** %9
	%11 = load %ast.AstNode** %rhs
	%12 = call %ast.AstNode* @ast_New1(i8 30, %type.TypeNode* %10, %ast.AstNode* %11)
	store %ast.AstNode* %12, %ast.AstNode** %rhs
	br label %L.1
L.1:
	%13 = load %ast.AstNode** %rhs
	store %ast.AstNode* %13, %ast.AstNode** %rv.0
	br label %return
return:
	%14 = load %ast.AstNode** %rv.0
	ret %ast.AstNode* %14
}
define %ast.AstNode* @stmt_AssignRecord(%ast.AstNode* %lhs.arg) nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%lhs = alloca %ast.AstNode*
	store %ast.AstNode* %lhs.arg, %ast.AstNode** %lhs
	%tree = alloca %ast.AstNode*
	%t = alloca %type.TypeNode*
	%0 = load %ast.AstNode** %lhs
	%1 = getelementptr %ast.AstNode* %0, i32 0, i32 9
	%2 = load %type.TypeNode** %1
	store %type.TypeNode* %2, %type.TypeNode** %t
	%3 = load %type.TypeNode** %t
	%4 = call %ast.AstNode* @expr_Term(%type.TypeNode* %3)
	store %ast.AstNode* %4, %ast.AstNode** %tree
	%5 = load %type.TypeNode** %t
	%6 = getelementptr %type.TypeNode* %5, i32 0, i32 12
	%7 = load i8* %6
	%8 = icmp eq i8 %7, 2
	br i1 %8, label %L.2, label %L.1
L.2:
	%9 = load %ast.AstNode** %tree
	%10 = getelementptr %ast.AstNode* %9, i32 0, i32 1
	store i8 2, i8* %10
	%11 = load %ast.AstNode** %lhs
	%12 = load %ast.AstNode** %tree
	%13 = call %ast.AstNode* @stmt_CheckSwap(%ast.AstNode* %11, %ast.AstNode* %12)
	store %ast.AstNode* %13, %ast.AstNode** %tree
	br label %L.1
L.1:
	%14 = load %ast.AstNode** %lhs
	%15 = load %ast.AstNode** %tree
	%16 = call %ast.AstNode* @ast_New2(i8 26, %type.TypeNode* null, %ast.AstNode* %14, %ast.AstNode* %15)
	store %ast.AstNode* %16, %ast.AstNode** %tree
	%17 = load %ast.AstNode** %tree
	store %ast.AstNode* %17, %ast.AstNode** %rv.0
	br label %return
return:
	%18 = load %ast.AstNode** %rv.0
	ret %ast.AstNode* %18
}
define %ast.AstNode* @stmt_ArrayFix(%ast.AstNode* %tree.arg) nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%tree = alloca %ast.AstNode*
	store %ast.AstNode* %tree.arg, %ast.AstNode** %tree
	%0 = load %ast.AstNode** %tree
	%1 = getelementptr %ast.AstNode* %0, i32 0, i32 0
	%2 = load i8* %1
	%3 = zext i8 %2 to i32
	switch i32 %3, label %L.1 [
		i32 9, label %L.3
		i32 14, label %L.4
	]
L.3:
	%4 = load %ast.AstNode** %tree
	%5 = getelementptr %ast.AstNode* %4, i32 0, i32 9
	%6 = load %type.TypeNode** %5
	%7 = load %ast.AstNode** %tree
	%8 = call %ast.AstNode* @ast_New1(i8 19, %type.TypeNode* %6, %ast.AstNode* %7)
	store %ast.AstNode* %8, %ast.AstNode** %tree
	br label %L.2
L.4:
	%9 = load %ast.AstNode** %tree
	%10 = getelementptr %ast.AstNode* %9, i32 0, i32 1
	store i8 4, i8* %10
	br label %L.2
L.1:
	br label %L.2
L.2:
	%11 = load %ast.AstNode** %tree
	%12 = getelementptr %ast.AstNode* %11, i32 0, i32 9
	%13 = load %type.TypeNode** %12
	%14 = getelementptr %type.TypeNode* %13, i32 0, i32 0
	%15 = load %type.TypeNode** %14
	%16 = load %type.TypeNode** @type_bytetype
	%17 = icmp ne %type.TypeNode* %15, %16
	br i1 %17, label %L.6, label %L.5
L.5:
	%18 = load %ast.AstNode** %tree
	%19 = getelementptr %ast.AstNode* %18, i32 0, i32 9
	%20 = load %type.TypeNode** %19
	%21 = getelementptr %type.TypeNode* %20, i32 0, i32 16
	%22 = load i8* %21
	%23 = icmp ne i8 %22, 0
	%24 = xor i1 %23, true
	br label %L.6
L.6:
	%25 = phi i1 [ true, %L.2 ], [ %24, %L.5 ]
	br i1 %25, label %L.8, label %L.7
L.8:
	%26 = load %type.TypeNode** @type_memtype
	%27 = load %ast.AstNode** %tree
	%28 = call %ast.AstNode* @ast_New1(i8 15, %type.TypeNode* %26, %ast.AstNode* %27)
	store %ast.AstNode* %28, %ast.AstNode** %tree
	br label %L.7
L.7:
	%29 = load %ast.AstNode** %tree
	store %ast.AstNode* %29, %ast.AstNode** %rv.0
	br label %return
return:
	%30 = load %ast.AstNode** %rv.0
	ret %ast.AstNode* %30
}
define %ast.AstNode* @stmt_AssignArray(%type.TypeNode* %t.arg, %ast.AstNode* %lhs.arg) nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%t = alloca %type.TypeNode*
	%lhs = alloca %ast.AstNode*
	store %type.TypeNode* %t.arg, %type.TypeNode** %t
	store %ast.AstNode* %lhs.arg, %ast.AstNode** %lhs
	%tree = alloca %ast.AstNode*
	%lsize = alloca %ast.AstNode*
	%rsize = alloca %ast.AstNode*
	%align = alloca %ast.AstNode*
	%lalign = alloca i32
	%ralign = alloca i32
	%0 = load %type.TypeNode** %t
	%1 = call %ast.AstNode* @expr_Term(%type.TypeNode* %0)
	store %ast.AstNode* %1, %ast.AstNode** %tree
	%2 = load %type.TypeNode** %t
	%3 = getelementptr %type.TypeNode* %2, i32 0, i32 12
	%4 = load i8* %3
	%5 = icmp eq i8 %4, 2
	br i1 %5, label %L.2, label %L.3
L.2:
	%6 = load %ast.AstNode** %tree
	%7 = getelementptr %ast.AstNode* %6, i32 0, i32 1
	store i8 2, i8* %7
	%8 = load %ast.AstNode** %lhs
	%9 = getelementptr %ast.AstNode* %8, i32 0, i32 0
	%10 = load i8* %9
	%11 = icmp eq i8 %10, 18
	br i1 %11, label %L.5, label %L.4
L.5:
	%12 = getelementptr [20 x i8]* @.str518
	%13 = bitcast [20 x i8]* %12 to [0 x i8]*
	call void @lex_ErrorS(i8 0, [0 x i8]* %13)
	br label %L.4
L.4:
	%14 = load %ast.AstNode** %lhs
	%15 = load %ast.AstNode** %tree
	%16 = call %ast.AstNode* @stmt_CheckSwap(%ast.AstNode* %14, %ast.AstNode* %15)
	store %ast.AstNode* %16, %ast.AstNode** %tree
	%17 = load %ast.AstNode** %lhs
	%18 = load %ast.AstNode** %tree
	%19 = call %ast.AstNode* @ast_New2(i8 26, %type.TypeNode* null, %ast.AstNode* %17, %ast.AstNode* %18)
	store %ast.AstNode* %19, %ast.AstNode** %tree
	br label %L.1
L.3:
	%20 = load %ast.AstNode** %lhs
	%21 = call i32 @expr_GetAlignment(%ast.AstNode* %20)
	store i32 %21, i32* %lalign
	%22 = load %ast.AstNode** %lhs
	%23 = getelementptr %ast.AstNode* %22, i32 0, i32 0
	%24 = load i8* %23
	%25 = icmp eq i8 %24, 18
	br i1 %25, label %L.7, label %L.8
L.7:
	%26 = load %ast.AstNode** %lhs
	%27 = getelementptr %ast.AstNode* %26, i32 0, i32 11
	%28 = getelementptr [0 x %ast.AstNode*]* %27, i32 0, i32 2
	%29 = load %ast.AstNode** %28
	store %ast.AstNode* %29, %ast.AstNode** %lsize
	br label %L.6
L.8:
	%30 = load %type.TypeNode** @type_wordtype
	%31 = load %ast.AstNode** %lhs
	%32 = getelementptr %ast.AstNode* %31, i32 0, i32 9
	%33 = load %type.TypeNode** %32
	%34 = getelementptr %type.TypeNode* %33, i32 0, i32 6
	%35 = load i64* %34
	%36 = call %ast.AstNode* @ast_Const(%type.TypeNode* %30, i64 %35)
	store %ast.AstNode* %36, %ast.AstNode** %lsize
	br label %L.6
L.6:
	%37 = load %ast.AstNode** %tree
	%38 = getelementptr %ast.AstNode* %37, i32 0, i32 0
	%39 = load i8* %38
	%40 = icmp eq i8 %39, 25
	br i1 %40, label %L.9, label %L.10
L.9:
	%41 = load %ast.AstNode** %tree
	%42 = getelementptr %ast.AstNode* %41, i32 0, i32 1
	%43 = load i8* %42
	%44 = icmp eq i8 %43, 5
	br label %L.10
L.10:
	%45 = phi i1 [ false, %L.6 ], [ %44, %L.9 ]
	br i1 %45, label %L.12, label %L.11
L.12:
	%46 = load %ast.AstNode** %tree
	%47 = getelementptr %ast.AstNode* %46, i32 0, i32 11
	%48 = getelementptr [0 x %ast.AstNode*]* %47, i32 0, i32 0
	%49 = load %ast.AstNode** %48
	store %ast.AstNode* %49, %ast.AstNode** %tree
	br label %L.11
L.11:
	%50 = load %ast.AstNode** %tree
	%51 = call i32 @expr_GetAlignment(%ast.AstNode* %50)
	store i32 %51, i32* %ralign
	%52 = load i32* %ralign
	%53 = load i32* %lalign
	%54 = icmp ult i32 %52, %53
	br i1 %54, label %L.14, label %L.13
L.14:
	%55 = load i32* %ralign
	store i32 %55, i32* %lalign
	br label %L.13
L.13:
	%56 = load %ast.AstNode** %tree
	%57 = getelementptr %ast.AstNode* %56, i32 0, i32 0
	%58 = load i8* %57
	%59 = icmp eq i8 %58, 18
	br i1 %59, label %L.16, label %L.17
L.16:
	%60 = load %ast.AstNode** %tree
	%61 = getelementptr %ast.AstNode* %60, i32 0, i32 11
	%62 = getelementptr [0 x %ast.AstNode*]* %61, i32 0, i32 2
	%63 = load %ast.AstNode** %62
	store %ast.AstNode* %63, %ast.AstNode** %rsize
	br label %L.15
L.17:
	%64 = load %type.TypeNode** @type_wordtype
	%65 = load %ast.AstNode** %tree
	%66 = getelementptr %ast.AstNode* %65, i32 0, i32 9
	%67 = load %type.TypeNode** %66
	%68 = getelementptr %type.TypeNode* %67, i32 0, i32 6
	%69 = load i64* %68
	%70 = call %ast.AstNode* @ast_Const(%type.TypeNode* %64, i64 %69)
	store %ast.AstNode* %70, %ast.AstNode** %rsize
	br label %L.15
L.15:
	%71 = load %ast.AstNode** %lhs
	%72 = call %ast.AstNode* @stmt_ArrayFix(%ast.AstNode* %71)
	store %ast.AstNode* %72, %ast.AstNode** %lhs
	%73 = load %ast.AstNode** %tree
	%74 = call %ast.AstNode* @stmt_ArrayFix(%ast.AstNode* %73)
	store %ast.AstNode* %74, %ast.AstNode** %tree
	%75 = load %ast.AstNode** %lhs
	%76 = getelementptr %ast.AstNode* %75, i32 0, i32 9
	%77 = load %type.TypeNode** %76
	%78 = load %ast.AstNode** %lhs
	%79 = load %ast.AstNode** %tree
	%80 = call %ast.AstNode* @ast_New2(i8 20, %type.TypeNode* %77, %ast.AstNode* %78, %ast.AstNode* %79)
	store %ast.AstNode* %80, %ast.AstNode** %tree
	%81 = load %ast.AstNode** %tree
	%82 = load %ast.AstNode** %lsize
	%83 = call %ast.AstNode* @ast_Child(%ast.AstNode* %81, %ast.AstNode* %82)
	store %ast.AstNode* %83, %ast.AstNode** %tree
	%84 = load %type.TypeNode** @type_wordtype
	%85 = load i32* %lalign
	%86 = zext i32 %85 to i64
	%87 = call %ast.AstNode* @ast_Const(%type.TypeNode* %84, i64 %86)
	store %ast.AstNode* %87, %ast.AstNode** %align
	%88 = load %ast.AstNode** %tree
	%89 = load %ast.AstNode** %align
	%90 = call %ast.AstNode* @ast_Child(%ast.AstNode* %88, %ast.AstNode* %89)
	store %ast.AstNode* %90, %ast.AstNode** %tree
	br label %L.1
L.1:
	%91 = load %ast.AstNode** %tree
	store %ast.AstNode* %91, %ast.AstNode** %rv.0
	br label %return
return:
	%92 = load %ast.AstNode** %rv.0
	ret %ast.AstNode* %92
}
define %ast.AstNode* @stmt_AdjustRHS(%ast.AstNode* %lhs.arg, %ast.AstNode* %rhs.arg) nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%lhs = alloca %ast.AstNode*
	%rhs = alloca %ast.AstNode*
	store %ast.AstNode* %lhs.arg, %ast.AstNode** %lhs
	store %ast.AstNode* %rhs.arg, %ast.AstNode** %rhs
	%tl = alloca %type.TypeNode*
	%tr = alloca %type.TypeNode*
	%0 = load %ast.AstNode** %lhs
	%1 = getelementptr %ast.AstNode* %0, i32 0, i32 9
	%2 = load %type.TypeNode** %1
	store %type.TypeNode* %2, %type.TypeNode** %tl
	%3 = load %ast.AstNode** %rhs
	%4 = getelementptr %ast.AstNode* %3, i32 0, i32 9
	%5 = load %type.TypeNode** %4
	store %type.TypeNode* %5, %type.TypeNode** %tr
	%6 = load %type.TypeNode** %tl
	%7 = getelementptr %type.TypeNode* %6, i32 0, i32 11
	%8 = load i8* %7
	%9 = icmp eq i8 %8, 4
	br i1 %9, label %L.2, label %L.3
L.2:
	%10 = load %ast.AstNode** %rhs
	%11 = getelementptr %ast.AstNode* %10, i32 0, i32 1
	%12 = load i8* %11
	%13 = icmp eq i8 %12, 5
	br i1 %13, label %L.7, label %L.6
L.6:
	%14 = load %ast.AstNode** %rhs
	%15 = getelementptr %ast.AstNode* %14, i32 0, i32 1
	%16 = load i8* %15
	%17 = icmp eq i8 %16, 6
	br label %L.7
L.7:
	%18 = phi i1 [ true, %L.2 ], [ %17, %L.6 ]
	br i1 %18, label %L.4, label %L.5
L.4:
	%19 = load %ast.AstNode** %rhs
	%20 = getelementptr %ast.AstNode* %19, i32 0, i32 0
	%21 = load i8* %20
	%22 = icmp eq i8 %21, 25
	br label %L.5
L.5:
	%23 = phi i1 [ false, %L.7 ], [ %22, %L.4 ]
	br i1 %23, label %L.9, label %L.8
L.9:
	%24 = load %ast.AstNode** %rhs
	%25 = getelementptr %ast.AstNode* %24, i32 0, i32 11
	%26 = getelementptr [0 x %ast.AstNode*]* %25, i32 0, i32 0
	%27 = load %ast.AstNode** %26
	store %ast.AstNode* %27, %ast.AstNode** %rhs
	br label %L.8
L.8:
	%28 = load %type.TypeNode** %tl
	%29 = getelementptr %type.TypeNode* %28, i32 0, i32 0
	%30 = load %type.TypeNode** %29
	%31 = load %type.TypeNode** %tr
	%32 = icmp ne %type.TypeNode* %30, %31
	br i1 %32, label %L.11, label %L.10
L.11:
	%33 = load %type.TypeNode** %tl
	%34 = getelementptr %type.TypeNode* %33, i32 0, i32 0
	%35 = load %type.TypeNode** %34
	%36 = load %type.TypeNode** %tr
	%37 = call i8 @type_Compat(%type.TypeNode* %35, %type.TypeNode* %36)
	%38 = icmp ne i8 %37, 0
	br i1 %38, label %L.13, label %L.14
L.13:
	%39 = load %ast.AstNode** %rhs
	%40 = load %type.TypeNode** %tl
	%41 = call %ast.AstNode* @expr_Cast(%ast.AstNode* %39, %type.TypeNode* %40)
	store %ast.AstNode* %41, %ast.AstNode** %rhs
	br label %L.12
L.14:
	call void @lex_Error(i8 34)
	br label %L.12
L.12:
	br label %L.10
L.10:
	br label %L.1
L.3:
	%42 = load %ast.AstNode** %lhs
	%43 = getelementptr %ast.AstNode* %42, i32 0, i32 2
	%44 = load i8* %43
	%45 = load %ast.AstNode** %rhs
	%46 = getelementptr %ast.AstNode* %45, i32 0, i32 2
	%47 = load i8* %46
	%48 = icmp ne i8 %44, %47
	br i1 %48, label %L.16, label %L.15
L.16:
	%49 = load %ast.AstNode** %rhs
	%50 = load %type.TypeNode** %tl
	%51 = call %ast.AstNode* @expr_ExtendT(%ast.AstNode* %49, %type.TypeNode* %50)
	store %ast.AstNode* %51, %ast.AstNode** %rhs
	br label %L.15
L.15:
	br label %L.1
L.1:
	%52 = load %ast.AstNode** %lhs
	%53 = load %ast.AstNode** %rhs
	%54 = call %ast.AstNode* @stmt_CheckSwap(%ast.AstNode* %52, %ast.AstNode* %53)
	store %ast.AstNode* %54, %ast.AstNode** %rhs
	%55 = load %ast.AstNode** %rhs
	store %ast.AstNode* %55, %ast.AstNode** %rv.0
	br label %return
return:
	%56 = load %ast.AstNode** %rv.0
	ret %ast.AstNode* %56
}
define %ast.AstNode* @stmt_Assign(%ast.AstNode* %lhs.arg) nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%lhs = alloca %ast.AstNode*
	store %ast.AstNode* %lhs.arg, %ast.AstNode** %lhs
	%tree = alloca %ast.AstNode*
	%rhs = alloca %ast.AstNode*
	%lrhs = alloca %ast.AstNode*
	%t = alloca %type.TypeNode*
	%op = alloca i8
	%tok = alloca i8
	%optok = alloca i8
	%nl = alloca i16
	%nr = alloca i16
	%i = alloca i16
	%tl = alloca %type.TypeListEntry*
	%0 = load %ast.AstNode** %lhs
	%1 = call %ast.AstNode* @ast_New1(i8 26, %type.TypeNode* null, %ast.AstNode* %0)
	store %ast.AstNode* %1, %ast.AstNode** %tree
	store i16 1, i16* %nl
	%2 = load i8* @lex_Token
	store i8 %2, i8* %tok
	br label %L.1
L.1:
	%3 = load i8* %tok
	%4 = icmp ne i8 %3, 5
	br i1 %4, label %L.2, label %L.3
L.3:
	%5 = call i8 @lex_Next()
	store i8 %5, i8* %tok
	%6 = call %ast.AstNode* @stmt_GetLHS()
	store %ast.AstNode* %6, %ast.AstNode** %lhs
	%7 = load %ast.AstNode** %tree
	%8 = load %ast.AstNode** %lhs
	%9 = call %ast.AstNode* @ast_Child(%ast.AstNode* %7, %ast.AstNode* %8)
	store %ast.AstNode* %9, %ast.AstNode** %tree
	%10 = load i16* %nl
	%11 = add i16 %10, 1
	store i16 %11, i16* %nl
	%12 = load i8* @lex_Token
	store i8 %12, i8* %tok
	br label %L.1
L.2:
	%13 = load i8* %tok
	%14 = icmp uge i8 %13, 9
	br i1 %14, label %L.4, label %L.5
L.4:
	%15 = load i8* %tok
	%16 = icmp ule i8 %15, 11
	br label %L.5
L.5:
	%17 = phi i1 [ false, %L.2 ], [ %16, %L.4 ]
	br i1 %17, label %L.7, label %L.8
L.7:
	%18 = load i8* %tok
	store i8 %18, i8* %optok
	%19 = call i8 @lex_Next()
	store i8 %19, i8* %tok
	store i16 0, i16* %nr
	br label %L.9
L.9:
	%20 = load %ast.AstNode** %tree
	%21 = getelementptr %ast.AstNode* %20, i32 0, i32 11
	%22 = load i16* %nr
	%23 = zext i16 %22 to i32
	%24 = getelementptr [0 x %ast.AstNode*]* %21, i32 0, i32 %23
	%25 = load %ast.AstNode** %24
	store %ast.AstNode* %25, %ast.AstNode** %lhs
	%26 = load %ast.AstNode** %lhs
	%27 = icmp ne %ast.AstNode* %26, null
	br i1 %27, label %L.12, label %L.13
L.12:
	%28 = load %ast.AstNode** %lhs
	%29 = getelementptr %ast.AstNode* %28, i32 0, i32 9
	%30 = load %type.TypeNode** %29
	store %type.TypeNode* %30, %type.TypeNode** %t
	br label %L.11
L.13:
	store %type.TypeNode* null, %type.TypeNode** %t
	br label %L.11
L.11:
	%31 = load %type.TypeNode** %t
	%32 = icmp ne %type.TypeNode* %31, null
	br i1 %32, label %L.14, label %L.15
L.14:
	%33 = load %type.TypeNode** %t
	%34 = getelementptr %type.TypeNode* %33, i32 0, i32 11
	%35 = load i8* %34
	%36 = icmp eq i8 %35, 6
	br label %L.15
L.15:
	%37 = phi i1 [ false, %L.11 ], [ %36, %L.14 ]
	br i1 %37, label %L.17, label %L.18
L.17:
	%38 = load i8* %optok
	%39 = icmp eq i8 %38, 9
	br i1 %39, label %L.19, label %L.20
L.19:
	%40 = load i16* %nl
	%41 = icmp eq i16 %40, 1
	br label %L.20
L.20:
	%42 = phi i1 [ false, %L.17 ], [ %41, %L.19 ]
	br i1 %42, label %L.22, label %L.23
L.22:
	%43 = load %ast.AstNode** %lhs
	%44 = call %ast.AstNode* @stmt_AssignRecord(%ast.AstNode* %43)
	store %ast.AstNode* %44, %ast.AstNode** %tree
	br label %L.21
L.23:
	call void @lex_Error(i8 31)
	br label %L.21
L.21:
	%45 = load i16* %nr
	%46 = add i16 %45, 1
	store i16 %46, i16* %nr
	br label %L.16
L.18:
	%47 = load %type.TypeNode** %t
	%48 = icmp ne %type.TypeNode* %47, null
	br i1 %48, label %L.24, label %L.25
L.24:
	%49 = load %type.TypeNode** %t
	%50 = getelementptr %type.TypeNode* %49, i32 0, i32 11
	%51 = load i8* %50
	%52 = icmp eq i8 %51, 5
	br label %L.25
L.25:
	%53 = phi i1 [ false, %L.18 ], [ %52, %L.24 ]
	br i1 %53, label %L.27, label %L.28
L.27:
	%54 = load i8* %optok
	%55 = icmp eq i8 %54, 9
	br i1 %55, label %L.29, label %L.30
L.29:
	%56 = load i16* %nl
	%57 = icmp eq i16 %56, 1
	br label %L.30
L.30:
	%58 = phi i1 [ false, %L.27 ], [ %57, %L.29 ]
	br i1 %58, label %L.32, label %L.33
L.32:
	%59 = load %type.TypeNode** %t
	%60 = load %ast.AstNode** %lhs
	%61 = call %ast.AstNode* @stmt_AssignArray(%type.TypeNode* %59, %ast.AstNode* %60)
	store %ast.AstNode* %61, %ast.AstNode** %tree
	br label %L.31
L.33:
	call void @lex_Error(i8 31)
	br label %L.31
L.31:
	%62 = load i16* %nr
	%63 = add i16 %62, 1
	store i16 %63, i16* %nr
	br label %L.26
L.28:
	%64 = load %type.TypeNode** %t
	%65 = call %ast.AstNode* @expr_Bool(%type.TypeNode* %64)
	store %ast.AstNode* %65, %ast.AstNode** %rhs
	%66 = load %ast.AstNode** %rhs
	%67 = icmp ne %ast.AstNode* %66, null
	br i1 %67, label %L.35, label %L.34
L.35:
	%68 = load %ast.AstNode** %rhs
	%69 = getelementptr %ast.AstNode* %68, i32 0, i32 0
	%70 = load i8* %69
	%71 = icmp eq i8 %70, 10
	br i1 %71, label %L.37, label %L.36
L.36:
	%72 = load %ast.AstNode** %rhs
	%73 = getelementptr %ast.AstNode* %72, i32 0, i32 0
	%74 = load i8* %73
	%75 = icmp eq i8 %74, 11
	br label %L.37
L.37:
	%76 = phi i1 [ true, %L.35 ], [ %75, %L.36 ]
	br i1 %76, label %L.39, label %L.40
L.39:
	%77 = load %ast.AstNode** %rhs
	%78 = getelementptr %ast.AstNode* %77, i32 0, i32 10
	%79 = load %symb.SymbNode** %78
	%80 = getelementptr %symb.SymbNode* %79, i32 0, i32 4
	%81 = load %type.TypeListEntry** %80
	store %type.TypeListEntry* %81, %type.TypeListEntry** %tl
	%82 = load %type.TypeListEntry** %tl
	%83 = icmp ne %type.TypeListEntry* %82, null
	br i1 %83, label %L.42, label %L.43
L.42:
	%84 = load %type.TypeListEntry** %tl
	%85 = getelementptr %type.TypeListEntry* %84, i32 0, i32 0
	%86 = load %type.TypeListEntry** %85
	%87 = icmp ne %type.TypeListEntry* %86, null
	br i1 %87, label %L.45, label %L.46
L.45:
	store i16 0, i16* %i
	br label %L.47
L.47:
	%88 = load %type.TypeListEntry** %tl
	%89 = getelementptr %type.TypeListEntry* %88, i32 0, i32 1
	%90 = load %type.TypeNode** %89
	%91 = load %ast.AstNode** %rhs
	%92 = call %ast.AstNode* @ast_New1(i8 24, %type.TypeNode* %90, %ast.AstNode* %91)
	store %ast.AstNode* %92, %ast.AstNode** %lrhs
	%93 = load %type.TypeListEntry** %tl
	%94 = getelementptr %type.TypeListEntry* %93, i32 0, i32 1
	%95 = load %type.TypeNode** %94
	%96 = getelementptr %type.TypeNode* %95, i32 0, i32 11
	%97 = load i8* %96
	%98 = load %ast.AstNode** %lrhs
	%99 = getelementptr %ast.AstNode* %98, i32 0, i32 1
	store i8 %97, i8* %99
	%100 = load %ast.AstNode** %lrhs
	%101 = getelementptr %ast.AstNode* %100, i32 0, i32 1
	%102 = load i8* %101
	%103 = icmp eq i8 %102, 4
	br i1 %103, label %L.50, label %L.51
L.50:
	%104 = load %type.TypeListEntry** %tl
	%105 = getelementptr %type.TypeListEntry* %104, i32 0, i32 1
	%106 = load %type.TypeNode** %105
	%107 = getelementptr %type.TypeNode* %106, i32 0, i32 0
	%108 = load %type.TypeNode** %107
	%109 = load %ast.AstNode** %lrhs
	%110 = getelementptr %ast.AstNode* %109, i32 0, i32 9
	store %type.TypeNode* %108, %type.TypeNode** %110
	%111 = load %target.TargetT** @target_Target
	%112 = getelementptr %target.TargetT* %111, i32 0, i32 8
	%113 = getelementptr %target.SizeAlign* %112, i32 0, i32 0
	%114 = load i8* %113
	%115 = load %ast.AstNode** %lrhs
	%116 = getelementptr %ast.AstNode* %115, i32 0, i32 2
	store i8 %114, i8* %116
	br label %L.49
L.51:
	%117 = load %type.TypeListEntry** %tl
	%118 = getelementptr %type.TypeListEntry* %117, i32 0, i32 1
	%119 = load %type.TypeNode** %118
	%120 = getelementptr %type.TypeNode* %119, i32 0, i32 8
	%121 = load i32* %120
	%122 = trunc i32 %121 to i8
	%123 = load %ast.AstNode** %lrhs
	%124 = getelementptr %ast.AstNode* %123, i32 0, i32 2
	store i8 %122, i8* %124
	br label %L.49
L.49:
	%125 = load i16* %i
	%126 = zext i16 %125 to i64
	%127 = load %ast.AstNode** %lrhs
	%128 = getelementptr %ast.AstNode* %127, i32 0, i32 8
	store i64 %126, i64* %128
	%129 = load %ast.AstNode** %tree
	%130 = load %ast.AstNode** %lrhs
	%131 = call %ast.AstNode* @ast_Child(%ast.AstNode* %129, %ast.AstNode* %130)
	store %ast.AstNode* %131, %ast.AstNode** %tree
	%132 = load i16* %i
	%133 = add i16 %132, 1
	store i16 %133, i16* %i
	%134 = load %type.TypeListEntry** %tl
	%135 = getelementptr %type.TypeListEntry* %134, i32 0, i32 0
	%136 = load %type.TypeListEntry** %135
	store %type.TypeListEntry* %136, %type.TypeListEntry** %tl
	%137 = load %type.TypeListEntry** %tl
	%138 = icmp eq %type.TypeListEntry* %137, null
	br i1 %138, label %L.48, label %L.52
L.52:
	br label %L.47
L.48:
	%139 = load i16* %nr
	%140 = load i16* %i
	%141 = add i16 %139, %140
	store i16 %141, i16* %nr
	br label %L.44
L.46:
	%142 = load %ast.AstNode** %lhs
	%143 = load %ast.AstNode** %rhs
	%144 = call %ast.AstNode* @stmt_AdjustRHS(%ast.AstNode* %142, %ast.AstNode* %143)
	store %ast.AstNode* %144, %ast.AstNode** %rhs
	%145 = load %ast.AstNode** %tree
	%146 = load %ast.AstNode** %rhs
	%147 = call %ast.AstNode* @ast_Child(%ast.AstNode* %145, %ast.AstNode* %146)
	store %ast.AstNode* %147, %ast.AstNode** %tree
	%148 = load i16* %nr
	%149 = add i16 %148, 1
	store i16 %149, i16* %nr
	br label %L.44
L.44:
	br label %L.41
L.43:
	call void @lex_Error(i8 33)
	br label %L.41
L.41:
	br label %L.38
L.40:
	%150 = load %ast.AstNode** %rhs
	%151 = getelementptr %ast.AstNode* %150, i32 0, i32 9
	%152 = load %type.TypeNode** %151
	%153 = icmp ne %type.TypeNode* %152, null
	br i1 %153, label %L.54, label %L.55
L.54:
	%154 = load i8* %optok
	%155 = icmp ne i8 %154, 9
	br i1 %155, label %L.57, label %L.56
L.57:
	%156 = load %ast.AstNode** %lhs
	%157 = call %ast.AstNode* @expr_Load(%ast.AstNode* %156)
	store %ast.AstNode* %157, %ast.AstNode** %lrhs
	%158 = load i8* %optok
	%159 = icmp eq i8 %158, 10
	br i1 %159, label %L.59, label %L.60
L.59:
	store i8 33, i8* %op
	br label %L.58
L.60:
	store i8 34, i8* %op
	br label %L.58
L.58:
	%160 = load i8* %op
	%161 = load %ast.AstNode** %lrhs
	%162 = load %ast.AstNode** %rhs
	%163 = call %ast.AstNode* @expr_BinOp(i8 %160, %ast.AstNode* %161, %ast.AstNode* %162)
	store %ast.AstNode* %163, %ast.AstNode** %rhs
	br label %L.56
L.56:
	%164 = load %ast.AstNode** %lhs
	%165 = load %ast.AstNode** %rhs
	%166 = call %ast.AstNode* @stmt_AdjustRHS(%ast.AstNode* %164, %ast.AstNode* %165)
	store %ast.AstNode* %166, %ast.AstNode** %rhs
	br label %L.53
L.55:
	call void @lex_Error(i8 33)
	br label %L.53
L.53:
	%167 = load %ast.AstNode** %tree
	%168 = load %ast.AstNode** %rhs
	%169 = call %ast.AstNode* @ast_Child(%ast.AstNode* %167, %ast.AstNode* %168)
	store %ast.AstNode* %169, %ast.AstNode** %tree
	%170 = load i16* %nr
	%171 = add i16 %170, 1
	store i16 %171, i16* %nr
	br label %L.38
L.38:
	br label %L.34
L.34:
	br label %L.26
L.26:
	br label %L.16
L.16:
	%172 = load i8* @lex_Token
	store i8 %172, i8* %tok
	%173 = load i8* %tok
	%174 = icmp ne i8 %173, 5
	br i1 %174, label %L.10, label %L.61
L.61:
	%175 = call i8 @lex_Next()
	store i8 %175, i8* %tok
	br label %L.9
L.10:
	%176 = load i16* %nl
	%177 = load i16* %nr
	%178 = icmp ne i16 %176, %177
	br i1 %178, label %L.63, label %L.62
L.63:
	%179 = load i16* %nl
	%180 = load i16* %nr
	%181 = icmp ult i16 %179, %180
	br i1 %181, label %L.65, label %L.66
L.65:
	call void @lex_Error(i8 35)
	br label %L.64
L.66:
	call void @lex_Error(i8 36)
	br label %L.64
L.64:
	br label %L.62
L.62:
	br label %L.6
L.8:
	call void @lex_Error(i8 30)
	br label %L.6
L.6:
	%182 = load %ast.AstNode** %tree
	store %ast.AstNode* %182, %ast.AstNode** %rv.0
	br label %return
return:
	%183 = load %ast.AstNode** %rv.0
	ret %ast.AstNode* %183
}
define %ast.AstNode* @stmt_AssignOrCall(%symb.SymbNode* %s.arg) nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%s = alloca %symb.SymbNode*
	store %symb.SymbNode* %s.arg, %symb.SymbNode** %s
	%tree = alloca %ast.AstNode*
	%tok = alloca i8
	store %ast.AstNode* null, %ast.AstNode** %tree
	%0 = load %symb.SymbNode** %s
	%1 = getelementptr %symb.SymbNode* %0, i32 0, i32 12
	%2 = load i8* %1
	%3 = icmp eq i8 %2, 6
	br i1 %3, label %L.2, label %L.1
L.2:
	%4 = load %symb.SymbNode** %s
	%5 = call %symb.SymbNode* @symb_FindPackage(%symb.SymbNode* %4)
	store %symb.SymbNode* %5, %symb.SymbNode** %s
	%6 = call i8 @lex_Next()
	store i8 %6, i8* %tok
	br label %L.1
L.1:
	%7 = load %symb.SymbNode** %s
	%8 = icmp ne %symb.SymbNode* %7, null
	br i1 %8, label %L.4, label %L.5
L.4:
	%9 = load %symb.SymbNode** %s
	%10 = call %ast.AstNode* @expr_Primary(%symb.SymbNode* %9)
	store %ast.AstNode* %10, %ast.AstNode** %tree
	%11 = load %ast.AstNode** %tree
	%12 = icmp ne %ast.AstNode* %11, null
	br i1 %12, label %L.10, label %L.11
L.10:
	%13 = load %ast.AstNode** %tree
	%14 = getelementptr %ast.AstNode* %13, i32 0, i32 0
	%15 = load i8* %14
	%16 = icmp ne i8 %15, 10
	br label %L.11
L.11:
	%17 = phi i1 [ false, %L.4 ], [ %16, %L.10 ]
	br i1 %17, label %L.8, label %L.9
L.8:
	%18 = load %ast.AstNode** %tree
	%19 = getelementptr %ast.AstNode* %18, i32 0, i32 0
	%20 = load i8* %19
	%21 = icmp ne i8 %20, 11
	br label %L.9
L.9:
	%22 = phi i1 [ false, %L.11 ], [ %21, %L.8 ]
	br i1 %22, label %L.6, label %L.7
L.6:
	%23 = load %ast.AstNode** %tree
	%24 = getelementptr %ast.AstNode* %23, i32 0, i32 0
	%25 = load i8* %24
	%26 = icmp ne i8 %25, 12
	br label %L.7
L.7:
	%27 = phi i1 [ false, %L.9 ], [ %26, %L.6 ]
	br i1 %27, label %L.13, label %L.12
L.13:
	%28 = load %ast.AstNode** %tree
	%29 = call %ast.AstNode* @stmt_Assign(%ast.AstNode* %28)
	store %ast.AstNode* %29, %ast.AstNode** %tree
	br label %L.12
L.12:
	br label %L.3
L.5:
	%30 = getelementptr [64 x i8]* @lex_Ident
	%31 = bitcast [64 x i8]* %30 to [0 x i8]*
	call void @lex_ErrorI(i8 12, [0 x i8]* %31)
	%32 = getelementptr [3 x i8]* @stmt_skiplist
	%33 = bitcast [3 x i8]* %32 to [0 x i8]*
	%34 = call i8 @lex_Skip([0 x i8]* %33)
	store i8 %34, i8* %tok
	br label %L.3
L.3:
	%35 = call i8 @lex_Expect(i8 4)
	store i8 %35, i8* %tok
	%36 = load %ast.AstNode** %tree
	store %ast.AstNode* %36, %ast.AstNode** %rv.0
	br label %return
return:
	%37 = load %ast.AstNode** %rv.0
	ret %ast.AstNode* %37
}
define %ast.AstNode* @stmt_Return() nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%tree = alloca %ast.AstNode*
	%rval = alloca %ast.AstNode*
	%t = alloca %type.TypeNode*
	%tl = alloca %type.TypeListEntry*
	%tok = alloca i8
	store %ast.AstNode* null, %ast.AstNode** %tree
	store %type.TypeListEntry* null, %type.TypeListEntry** %tl
	%0 = load %symb.SymbNode** @symb_curproc
	%1 = icmp ne %symb.SymbNode* %0, null
	br i1 %1, label %L.2, label %L.3
L.2:
	%2 = load %symb.SymbNode** @symb_curproc
	%3 = getelementptr %symb.SymbNode* %2, i32 0, i32 4
	%4 = load %type.TypeListEntry** %3
	store %type.TypeListEntry* %4, %type.TypeListEntry** %tl
	br label %L.1
L.3:
	call void @lex_Error(i8 46)
	br label %L.1
L.1:
	%5 = call %ast.AstNode* @ast_New(i8 69, %type.TypeNode* null)
	store %ast.AstNode* %5, %ast.AstNode** %tree
	%6 = load i8* @lex_Token
	store i8 %6, i8* %tok
	br label %L.4
L.4:
	%7 = load i8* %tok
	%8 = icmp eq i8 %7, 4
	br i1 %8, label %L.5, label %L.6
L.6:
	%9 = load %type.TypeListEntry** %tl
	%10 = icmp ne %type.TypeListEntry* %9, null
	br i1 %10, label %L.8, label %L.9
L.8:
	%11 = load %type.TypeListEntry** %tl
	%12 = getelementptr %type.TypeListEntry* %11, i32 0, i32 1
	%13 = load %type.TypeNode** %12
	store %type.TypeNode* %13, %type.TypeNode** %t
	br label %L.7
L.9:
	call void @lex_Error(i8 37)
	store %type.TypeNode* null, %type.TypeNode** %t
	br label %L.7
L.7:
	%14 = load %type.TypeNode** %t
	%15 = call %ast.AstNode* @expr_Bool(%type.TypeNode* %14)
	store %ast.AstNode* %15, %ast.AstNode** %rval
	%16 = load %ast.AstNode** %rval
	%17 = icmp ne %ast.AstNode* %16, null
	br i1 %17, label %L.11, label %L.10
L.11:
	%18 = load %type.TypeNode** %t
	%19 = icmp ne %type.TypeNode* %18, null
	br i1 %19, label %L.13, label %L.14
L.13:
	%20 = load %ast.AstNode** %rval
	%21 = load %type.TypeNode** %t
	%22 = call %ast.AstNode* @expr_Actual(%ast.AstNode* %20, %type.TypeNode* %21)
	store %ast.AstNode* %22, %ast.AstNode** %rval
	%23 = load %ast.AstNode** %tree
	%24 = load %ast.AstNode** %rval
	%25 = call %ast.AstNode* @ast_Child(%ast.AstNode* %23, %ast.AstNode* %24)
	store %ast.AstNode* %25, %ast.AstNode** %tree
	%26 = load %type.TypeNode** %t
	%27 = getelementptr %type.TypeNode* %26, i32 0, i32 11
	%28 = load i8* %27
	%29 = icmp eq i8 %28, 4
	br i1 %29, label %L.16, label %L.17
L.16:
	%30 = load %type.TypeNode** %t
	%31 = getelementptr %type.TypeNode* %30, i32 0, i32 0
	%32 = load %type.TypeNode** %31
	%33 = load %ast.AstNode** %tree
	%34 = getelementptr %ast.AstNode* %33, i32 0, i32 9
	store %type.TypeNode* %32, %type.TypeNode** %34
	%35 = load %target.TargetT** @target_Target
	%36 = getelementptr %target.TargetT* %35, i32 0, i32 8
	%37 = getelementptr %target.SizeAlign* %36, i32 0, i32 0
	%38 = load i8* %37
	%39 = load %ast.AstNode** %tree
	%40 = getelementptr %ast.AstNode* %39, i32 0, i32 2
	store i8 %38, i8* %40
	br label %L.15
L.17:
	%41 = load %type.TypeNode** %t
	%42 = getelementptr %type.TypeNode* %41, i32 0, i32 8
	%43 = load i32* %42
	%44 = trunc i32 %43 to i8
	%45 = load %ast.AstNode** %tree
	%46 = getelementptr %ast.AstNode* %45, i32 0, i32 2
	store i8 %44, i8* %46
	br label %L.15
L.15:
	br label %L.12
L.14:
	call void @lex_Error(i8 37)
	br label %L.12
L.12:
	br label %L.10
L.10:
	%47 = load %type.TypeListEntry** %tl
	%48 = icmp ne %type.TypeListEntry* %47, null
	br i1 %48, label %L.19, label %L.18
L.19:
	%49 = load %type.TypeListEntry** %tl
	%50 = getelementptr %type.TypeListEntry* %49, i32 0, i32 0
	%51 = load %type.TypeListEntry** %50
	store %type.TypeListEntry* %51, %type.TypeListEntry** %tl
	br label %L.18
L.18:
	%52 = load i8* @lex_Token
	store i8 %52, i8* %tok
	%53 = load i8* %tok
	%54 = icmp ne i8 %53, 5
	br i1 %54, label %L.5, label %L.20
L.20:
	%55 = call i8 @lex_Next()
	store i8 %55, i8* %tok
	br label %L.4
L.5:
	%56 = load %ast.AstNode** %tree
	%57 = getelementptr %ast.AstNode* %56, i32 0, i32 5
	%58 = load i16* %57
	%59 = icmp ne i16 %58, 0
	br i1 %59, label %L.22, label %L.21
L.22:
	%60 = load %ast.AstNode** %tree
	%61 = getelementptr %ast.AstNode* %60, i32 0, i32 11
	%62 = getelementptr [0 x %ast.AstNode*]* %61, i32 0, i32 0
	%63 = load %ast.AstNode** %62
	%64 = getelementptr %ast.AstNode* %63, i32 0, i32 9
	%65 = load %type.TypeNode** %64
	%66 = load %ast.AstNode** %tree
	%67 = getelementptr %ast.AstNode* %66, i32 0, i32 9
	store %type.TypeNode* %65, %type.TypeNode** %67
	%68 = load %ast.AstNode** %tree
	%69 = getelementptr %ast.AstNode* %68, i32 0, i32 11
	%70 = getelementptr [0 x %ast.AstNode*]* %69, i32 0, i32 0
	%71 = load %ast.AstNode** %70
	%72 = getelementptr %ast.AstNode* %71, i32 0, i32 1
	%73 = load i8* %72
	%74 = load %ast.AstNode** %tree
	%75 = getelementptr %ast.AstNode* %74, i32 0, i32 1
	store i8 %73, i8* %75
	%76 = load %ast.AstNode** %tree
	%77 = getelementptr %ast.AstNode* %76, i32 0, i32 11
	%78 = getelementptr [0 x %ast.AstNode*]* %77, i32 0, i32 0
	%79 = load %ast.AstNode** %78
	%80 = getelementptr %ast.AstNode* %79, i32 0, i32 2
	%81 = load i8* %80
	%82 = load %ast.AstNode** %tree
	%83 = getelementptr %ast.AstNode* %82, i32 0, i32 2
	store i8 %81, i8* %83
	br label %L.21
L.21:
	%84 = call i8 @lex_Expect(i8 4)
	%85 = load %ast.AstNode** %tree
	store %ast.AstNode* %85, %ast.AstNode** %rv.0
	br label %return
return:
	%86 = load %ast.AstNode** %rv.0
	ret %ast.AstNode* %86
}
define %ast.AstNode* @stmt_If() nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%tree = alloca %ast.AstNode*
	%ctree = alloca %ast.AstNode*
	%stree = alloca %ast.AstNode*
	%vlo = alloca %ast.AstNode*
	%vhi = alloca %ast.AstNode*
	%t = alloca %type.TypeNode*
	%s = alloca %symb.SymbNode*
	%tok = alloca i8
	%tok2 = alloca i8
	%op = alloca i8
	store %ast.AstNode* null, %ast.AstNode** %tree
	%0 = load i8* @lex_Token
	store i8 %0, i8* %tok
	store i8 66, i8* %op
	%1 = call %ast.AstNode* @expr_Bool(%type.TypeNode* null)
	store %ast.AstNode* %1, %ast.AstNode** %ctree
	%2 = load %ast.AstNode** %ctree
	%3 = icmp ne %ast.AstNode* %2, null
	br i1 %3, label %L.2, label %L.1
L.2:
	%4 = load %ast.AstNode** %ctree
	%5 = getelementptr %ast.AstNode* %4, i32 0, i32 9
	%6 = load %type.TypeNode** %5
	store %type.TypeNode* %6, %type.TypeNode** %t
	%7 = load %type.TypeNode** %t
	%8 = load %type.TypeNode** @type_booltype
	%9 = call i8 @type_Same(%type.TypeNode* %7, %type.TypeNode* %8)
	%10 = icmp ne i8 %9, 0
	br i1 %10, label %L.4, label %L.5
L.4:
	%11 = load %ast.AstNode** %ctree
	%12 = call %ast.AstNode* @expr_ForceBoolean(%ast.AstNode* %11)
	store %ast.AstNode* %12, %ast.AstNode** %ctree
	br label %L.3
L.5:
	store i8 67, i8* %op
	br label %L.3
L.3:
	%13 = load i8* %op
	%14 = call %ast.AstNode* @ast_New(i8 %13, %type.TypeNode* null)
	store %ast.AstNode* %14, %ast.AstNode** %tree
	%15 = load %ast.AstNode** %tree
	%16 = load %ast.AstNode** %ctree
	%17 = call %ast.AstNode* @ast_Child(%ast.AstNode* %15, %ast.AstNode* %16)
	store %ast.AstNode* %17, %ast.AstNode** %tree
	br label %L.1
L.1:
	%18 = getelementptr [3 x i8]* @stmt_isthenlist
	%19 = bitcast [3 x i8]* %18 to [0 x i8]*
	%20 = call i8 @lex_Keyword([0 x i8]* %19)
	store i8 %20, i8* %tok
	%21 = load i8* %tok
	%22 = zext i8 %21 to i32
	switch i32 %22, label %L.6 [
		i32 50, label %L.8
		i32 48, label %L.9
	]
L.8:
	br label %L.10
L.10:
	%23 = call %ast.AstNode* @ast_New(i8 68, %type.TypeNode* null)
	store %ast.AstNode* %23, %ast.AstNode** %ctree
	br label %L.12
L.12:
	%24 = call i8 @lex_Next()
	store i8 %24, i8* %tok
	%25 = load %type.TypeNode** %t
	%26 = call %ast.AstNode* @expr_Bool(%type.TypeNode* %25)
	store %ast.AstNode* %26, %ast.AstNode** %vlo
	%27 = load %ast.AstNode** %vlo
	%28 = getelementptr %ast.AstNode* %27, i32 0, i32 0
	%29 = load i8* %28
	%30 = icmp ne i8 %29, 7
	br i1 %30, label %L.15, label %L.14
L.15:
	call void @lex_Error(i8 60)
	br label %L.14
L.14:
	%31 = load i8* @lex_Token
	store i8 %31, i8* %tok
	%32 = load i8* %tok
	%33 = icmp eq i8 %32, 6
	br i1 %33, label %L.17, label %L.16
L.17:
	%34 = call i8 @lex_Next()
	store i8 %34, i8* %tok
	%35 = load %type.TypeNode** %t
	%36 = call %ast.AstNode* @expr_Bool(%type.TypeNode* %35)
	store %ast.AstNode* %36, %ast.AstNode** %vhi
	%37 = load %ast.AstNode** %vlo
	%38 = getelementptr %ast.AstNode* %37, i32 0, i32 0
	%39 = load i8* %38
	%40 = icmp ne i8 %39, 7
	br i1 %40, label %L.19, label %L.18
L.19:
	call void @lex_Error(i8 60)
	br label %L.18
L.18:
	%41 = load %ast.AstNode** %vlo
	%42 = getelementptr %ast.AstNode* %41, i32 0, i32 9
	%43 = load %type.TypeNode** %42
	%44 = load %ast.AstNode** %vlo
	%45 = load %ast.AstNode** %vhi
	%46 = call %ast.AstNode* @ast_New2(i8 13, %type.TypeNode* %43, %ast.AstNode* %44, %ast.AstNode* %45)
	store %ast.AstNode* %46, %ast.AstNode** %vlo
	br label %L.16
L.16:
	%47 = load %ast.AstNode** %ctree
	%48 = load %ast.AstNode** %vlo
	%49 = call %ast.AstNode* @ast_Child(%ast.AstNode* %47, %ast.AstNode* %48)
	store %ast.AstNode* %49, %ast.AstNode** %ctree
	%50 = load i8* @lex_Token
	store i8 %50, i8* %tok
	%51 = load i8* %tok
	%52 = icmp ne i8 %51, 5
	br i1 %52, label %L.13, label %L.20
L.20:
	br label %L.12
L.13:
	%53 = load i8* %tok
	%54 = icmp eq i8 %53, 3
	br i1 %54, label %L.22, label %L.23
L.22:
	%55 = call i8 @lex_Next()
	store i8 %55, i8* %tok
	call void @lex_Error(i8 1)
	br label %L.21
L.23:
	%56 = getelementptr [2 x i8]* @stmt_thenlist
	%57 = bitcast [2 x i8]* %56 to [0 x i8]*
	%58 = call i8 @lex_Keyword([0 x i8]* %57)
	%59 = icmp eq i8 %58, 48
	br i1 %59, label %L.25, label %L.26
L.25:
	%60 = call i8 @lex_Next()
	store i8 %60, i8* %tok
	br label %L.24
L.26:
	call void @lex_ErrorT(i8 10, i8 48)
	br label %L.24
L.24:
	br label %L.21
L.21:
	%61 = call %ast.AstNode* @stmt_Statement()
	store %ast.AstNode* %61, %ast.AstNode** %stree
	%62 = load %ast.AstNode** %ctree
	%63 = load %ast.AstNode** %stree
	%64 = call %ast.AstNode* @ast_Child(%ast.AstNode* %62, %ast.AstNode* %63)
	store %ast.AstNode* %64, %ast.AstNode** %ctree
	%65 = load %ast.AstNode** %tree
	%66 = load %ast.AstNode** %ctree
	%67 = call %ast.AstNode* @ast_Child(%ast.AstNode* %65, %ast.AstNode* %66)
	store %ast.AstNode* %67, %ast.AstNode** %tree
	%68 = load i8* @lex_Token
	store i8 %68, i8* %tok
	%69 = load i8* %tok
	%70 = icmp eq i8 %69, 40
	br i1 %70, label %L.28, label %L.27
L.28:
	%71 = getelementptr [3 x i8]* @stmt_isthenlist
	%72 = bitcast [3 x i8]* %71 to [0 x i8]*
	%73 = call i8 @lex_Keyword([0 x i8]* %72)
	store i8 %73, i8* %tok
	br label %L.27
L.27:
	%74 = load i8* %tok
	%75 = icmp ne i8 %74, 50
	br i1 %75, label %L.11, label %L.29
L.29:
	br label %L.10
L.11:
	br label %L.7
L.9:
	%76 = load i8* %op
	%77 = icmp eq i8 %76, 67
	br i1 %77, label %L.31, label %L.30
L.31:
	call void @lex_Error(i8 38)
	br label %L.30
L.30:
	%78 = call i8 @lex_Next()
	store i8 %78, i8* %tok
	%79 = call %ast.AstNode* @stmt_Statement()
	store %ast.AstNode* %79, %ast.AstNode** %stree
	%80 = load %ast.AstNode** %tree
	%81 = load %ast.AstNode** %stree
	%82 = call %ast.AstNode* @ast_Child(%ast.AstNode* %80, %ast.AstNode* %81)
	store %ast.AstNode* %82, %ast.AstNode** %tree
	br label %L.7
L.6:
	call void @lex_Error(i8 44)
	br label %L.7
L.7:
	%83 = getelementptr [2 x i8]* @stmt_elselist
	%84 = bitcast [2 x i8]* %83 to [0 x i8]*
	%85 = call i8 @lex_Keyword([0 x i8]* %84)
	store i8 %85, i8* %tok
	%86 = load i8* %tok
	%87 = icmp eq i8 %86, 49
	br i1 %87, label %L.33, label %L.34
L.33:
	%88 = getelementptr [64 x i8]* @lex_Ident
	%89 = bitcast [64 x i8]* %88 to [0 x i8]*
	%90 = call %symb.SymbNode* @symb_FindTop([0 x i8]* %89)
	store %symb.SymbNode* %90, %symb.SymbNode** %s
	%91 = call i8 @lex_Next()
	store i8 %91, i8* %tok2
	%92 = load %symb.SymbNode** %s
	%93 = icmp ne %symb.SymbNode* %92, null
	br i1 %93, label %L.36, label %L.35
L.36:
	%94 = load i8* %tok2
	%95 = zext i8 %94 to i32
	switch i32 %95, label %L.37 [
		i32 9, label %L.39
		i32 10, label %L.39
		i32 11, label %L.39
		i32 34, label %L.39
		i32 2, label %L.39
		i32 7, label %L.39
		i32 32, label %L.39
	]
L.39:
	store i8 40, i8* %tok
	br label %L.38
L.37:
	br label %L.38
L.38:
	br label %L.35
L.35:
	%96 = load i8* %tok
	%97 = icmp eq i8 %96, 40
	br i1 %97, label %L.41, label %L.42
L.41:
	%98 = load %symb.SymbNode** %s
	%99 = call %ast.AstNode* @stmt_AssignOrCall(%symb.SymbNode* %98)
	store %ast.AstNode* %99, %ast.AstNode** %stree
	%100 = load %ast.AstNode** %tree
	%101 = call %ast.AstNode* @ast_Child(%ast.AstNode* %100, %ast.AstNode* null)
	store %ast.AstNode* %101, %ast.AstNode** %tree
	%102 = load %ast.AstNode** %stree
	%103 = icmp ne %ast.AstNode* %102, null
	br i1 %103, label %L.44, label %L.43
L.44:
	%104 = load %ast.AstNode** %tree
	%105 = load %ast.AstNode** %stree
	%106 = call %ast.AstNode* @ast_New2(i8 63, %type.TypeNode* null, %ast.AstNode* %104, %ast.AstNode* %105)
	store %ast.AstNode* %106, %ast.AstNode** %tree
	br label %L.43
L.43:
	br label %L.40
L.42:
	%107 = call %ast.AstNode* @stmt_Statement()
	store %ast.AstNode* %107, %ast.AstNode** %stree
	%108 = load %ast.AstNode** %tree
	%109 = load %ast.AstNode** %stree
	%110 = call %ast.AstNode* @ast_Child(%ast.AstNode* %108, %ast.AstNode* %109)
	store %ast.AstNode* %110, %ast.AstNode** %tree
	br label %L.40
L.40:
	br label %L.32
L.34:
	%111 = load %ast.AstNode** %tree
	%112 = call %ast.AstNode* @ast_Child(%ast.AstNode* %111, %ast.AstNode* null)
	store %ast.AstNode* %112, %ast.AstNode** %tree
	br label %L.32
L.32:
	%113 = load %ast.AstNode** %tree
	store %ast.AstNode* %113, %ast.AstNode** %rv.0
	br label %return
return:
	%114 = load %ast.AstNode** %rv.0
	ret %ast.AstNode* %114
}
define %ast.AstNode* @stmt_For() nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%tree = alloca %ast.AstNode*
	%tok = alloca i8
	store %ast.AstNode* null, %ast.AstNode** %tree
	%0 = load i8* @lex_Token
	store i8 %0, i8* %tok
	%1 = load %ast.AstNode** %tree
	store %ast.AstNode* %1, %ast.AstNode** %rv.0
	br label %return
return:
	%2 = load %ast.AstNode** %rv.0
	ret %ast.AstNode* %2
}
define %ast.AstNode* @stmt_While() nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%tree = alloca %ast.AstNode*
	%ctree = alloca %ast.AstNode*
	%tok = alloca i8
	%0 = load i8* @lex_Token
	store i8 %0, i8* %tok
	%1 = load %type.TypeNode** @type_booltype
	%2 = call %ast.AstNode* @expr_Bool(%type.TypeNode* %1)
	store %ast.AstNode* %2, %ast.AstNode** %ctree
	%3 = load %ast.AstNode** %ctree
	%4 = getelementptr %ast.AstNode* %3, i32 0, i32 9
	%5 = load %type.TypeNode** %4
	%6 = load %type.TypeNode** @type_booltype
	%7 = call i8 @type_Same(%type.TypeNode* %5, %type.TypeNode* %6)
	%8 = icmp ne i8 %7, 0
	br i1 %8, label %L.2, label %L.3
L.2:
	%9 = load %ast.AstNode** %ctree
	%10 = call %ast.AstNode* @expr_ForceBoolean(%ast.AstNode* %9)
	store %ast.AstNode* %10, %ast.AstNode** %ctree
	br label %L.1
L.3:
	call void @lex_Error(i8 38)
	br label %L.1
L.1:
	%11 = load %ast.AstNode** %ctree
	%12 = call %ast.AstNode* @ast_New1(i8 61, %type.TypeNode* null, %ast.AstNode* %11)
	store %ast.AstNode* %12, %ast.AstNode** %ctree
	%13 = load %ast.AstNode** %ctree
	%14 = call %ast.AstNode* @ast_New1(i8 65, %type.TypeNode* null, %ast.AstNode* %13)
	store %ast.AstNode* %14, %ast.AstNode** %ctree
	%15 = load i8* @stmt_LoopLevel
	%16 = add i8 %15, 1
	store i8 %16, i8* @stmt_LoopLevel
	%17 = getelementptr [2 x i8]* @stmt_dolist
	%18 = bitcast [2 x i8]* %17 to [0 x i8]*
	%19 = call i8 @lex_Keyword([0 x i8]* %18)
	store i8 %19, i8* %tok
	%20 = load i8* %tok
	%21 = icmp eq i8 %20, 53
	br i1 %21, label %L.5, label %L.6
L.5:
	%22 = call i8 @lex_Next()
	store i8 %22, i8* %tok
	br label %L.4
L.6:
	call void @lex_ErrorT(i8 10, i8 53)
	br label %L.4
L.4:
	%23 = call %ast.AstNode* @stmt_Statement()
	store %ast.AstNode* %23, %ast.AstNode** %tree
	%24 = load %ast.AstNode** %ctree
	%25 = load %ast.AstNode** %tree
	%26 = call %ast.AstNode* @ast_New2(i8 63, %type.TypeNode* null, %ast.AstNode* %24, %ast.AstNode* %25)
	store %ast.AstNode* %26, %ast.AstNode** %tree
	%27 = load %ast.AstNode** %tree
	%28 = call %ast.AstNode* @ast_New1(i8 64, %type.TypeNode* null, %ast.AstNode* %27)
	store %ast.AstNode* %28, %ast.AstNode** %tree
	%29 = load i8* @stmt_LoopLevel
	%30 = icmp ugt i8 %29, 0
	br i1 %30, label %L.8, label %L.7
L.8:
	%31 = load i8* @stmt_LoopLevel
	%32 = sub i8 %31, 1
	store i8 %32, i8* @stmt_LoopLevel
	br label %L.7
L.7:
	%33 = load %ast.AstNode** %tree
	store %ast.AstNode* %33, %ast.AstNode** %rv.0
	br label %return
return:
	%34 = load %ast.AstNode** %rv.0
	ret %ast.AstNode* %34
}
define %ast.AstNode* @stmt_Loop() nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%tree = alloca %ast.AstNode*
	%stree = alloca %ast.AstNode*
	%tok = alloca i8
	store %ast.AstNode* null, %ast.AstNode** %tree
	%0 = load i8* @lex_Token
	store i8 %0, i8* %tok
	%1 = load i8* @stmt_LoopLevel
	%2 = add i8 %1, 1
	store i8 %2, i8* @stmt_LoopLevel
	%3 = call %ast.AstNode* @ast_New(i8 64, %type.TypeNode* null)
	store %ast.AstNode* %3, %ast.AstNode** %tree
	%4 = call %ast.AstNode* @stmt_Statement()
	store %ast.AstNode* %4, %ast.AstNode** %stree
	%5 = load %ast.AstNode** %tree
	%6 = load %ast.AstNode** %stree
	%7 = call %ast.AstNode* @ast_Child(%ast.AstNode* %5, %ast.AstNode* %6)
	store %ast.AstNode* %7, %ast.AstNode** %tree
	%8 = load i8* @stmt_LoopLevel
	%9 = icmp ugt i8 %8, 0
	br i1 %9, label %L.2, label %L.1
L.2:
	%10 = load i8* @stmt_LoopLevel
	%11 = sub i8 %10, 1
	store i8 %11, i8* @stmt_LoopLevel
	br label %L.1
L.1:
	%12 = load %ast.AstNode** %tree
	store %ast.AstNode* %12, %ast.AstNode** %rv.0
	br label %return
return:
	%13 = load %ast.AstNode** %rv.0
	ret %ast.AstNode* %13
}
define %ast.AstNode* @stmt_Exit() nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%tree = alloca %ast.AstNode*
	%wtree = alloca %ast.AstNode*
	%ctree = alloca %ast.AstNode*
	%tok = alloca i8
	store %ast.AstNode* null, %ast.AstNode** %tree
	%0 = load i8* @lex_Token
	store i8 %0, i8* %tok
	%1 = load i8* @stmt_LoopLevel
	%2 = icmp eq i8 %1, 0
	br i1 %2, label %L.2, label %L.1
L.2:
	call void @lex_Error(i8 47)
	br label %L.1
L.1:
	%3 = call %ast.AstNode* @ast_New(i8 65, %type.TypeNode* null)
	store %ast.AstNode* %3, %ast.AstNode** %tree
	%4 = load %type.TypeNode** @type_booltype
	%5 = call %ast.AstNode* @expr_Bool(%type.TypeNode* %4)
	store %ast.AstNode* %5, %ast.AstNode** %ctree
	%6 = load %ast.AstNode** %ctree
	%7 = getelementptr %ast.AstNode* %6, i32 0, i32 9
	%8 = load %type.TypeNode** %7
	%9 = load %type.TypeNode** @type_booltype
	%10 = call i8 @type_Same(%type.TypeNode* %8, %type.TypeNode* %9)
	%11 = icmp ne i8 %10, 0
	br i1 %11, label %L.4, label %L.5
L.4:
	%12 = load %ast.AstNode** %ctree
	%13 = call %ast.AstNode* @expr_ForceBoolean(%ast.AstNode* %12)
	store %ast.AstNode* %13, %ast.AstNode** %ctree
	br label %L.3
L.5:
	call void @lex_Error(i8 38)
	br label %L.3
L.3:
	%14 = load %ast.AstNode** %tree
	%15 = load %ast.AstNode** %ctree
	%16 = call %ast.AstNode* @ast_Child(%ast.AstNode* %14, %ast.AstNode* %15)
	store %ast.AstNode* %16, %ast.AstNode** %tree
	%17 = getelementptr [2 x i8]* @stmt_withlist
	%18 = bitcast [2 x i8]* %17 to [0 x i8]*
	%19 = call i8 @lex_Keyword([0 x i8]* %18)
	store i8 %19, i8* %tok
	%20 = load i8* %tok
	%21 = icmp eq i8 %20, 56
	br i1 %21, label %L.7, label %L.8
L.7:
	%22 = call i8 @lex_Next()
	store i8 %22, i8* %tok
	%23 = call %ast.AstNode* @stmt_Statement()
	store %ast.AstNode* %23, %ast.AstNode** %wtree
	%24 = load %ast.AstNode** %tree
	%25 = load %ast.AstNode** %wtree
	%26 = call %ast.AstNode* @ast_Child(%ast.AstNode* %24, %ast.AstNode* %25)
	br label %L.6
L.8:
	%27 = call i8 @lex_Expect(i8 4)
	br label %L.6
L.6:
	%28 = load %ast.AstNode** %tree
	store %ast.AstNode* %28, %ast.AstNode** %rv.0
	br label %return
return:
	%29 = load %ast.AstNode** %rv.0
	ret %ast.AstNode* %29
}
define %ast.AstNode* @stmt_Alias() nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%s = alloca %symb.SymbNode*
	%ns = alloca %symb.SymbNode*
	%tok = alloca i8
	%0 = load i8* @lex_Token
	store i8 %0, i8* %tok
	br label %L.1
L.1:
	%1 = load i8* %tok
	%2 = icmp eq i8 %1, 40
	br i1 %2, label %L.4, label %L.5
L.4:
	%3 = getelementptr [64 x i8]* @lex_Ident
	%4 = bitcast [64 x i8]* %3 to [0 x i8]*
	%5 = call %symb.SymbNode* @symb_Find([0 x i8]* %4)
	store %symb.SymbNode* %5, %symb.SymbNode** %s
	%6 = load %symb.SymbNode** %s
	%7 = icmp eq %symb.SymbNode* %6, null
	br i1 %7, label %L.7, label %L.6
L.7:
	%8 = getelementptr [64 x i8]* @lex_Ident
	%9 = bitcast [64 x i8]* %8 to [0 x i8]*
	call void @lex_ErrorI(i8 12, [0 x i8]* %9)
	br label %L.6
L.6:
	%10 = call i8 @lex_Next()
	store i8 %10, i8* %tok
	%11 = getelementptr [2 x i8]* @stmt_aslist
	%12 = bitcast [2 x i8]* %11 to [0 x i8]*
	%13 = call i8 @lex_Keyword([0 x i8]* %12)
	store i8 %13, i8* %tok
	%14 = load i8* %tok
	%15 = icmp eq i8 %14, 59
	br i1 %15, label %L.9, label %L.10
L.9:
	%16 = call i8 @lex_Next()
	store i8 %16, i8* %tok
	%17 = load i8* %tok
	%18 = icmp eq i8 %17, 40
	br i1 %18, label %L.12, label %L.13
L.12:
	%19 = getelementptr [64 x i8]* @lex_Ident
	%20 = bitcast [64 x i8]* %19 to [0 x i8]*
	%21 = call %symb.SymbNode* @symb_FindTop([0 x i8]* %20)
	store %symb.SymbNode* %21, %symb.SymbNode** %ns
	%22 = load %symb.SymbNode** %ns
	%23 = icmp eq %symb.SymbNode* %22, null
	br i1 %23, label %L.15, label %L.16
L.15:
	%24 = load %symb.SymbNode** %s
	%25 = getelementptr [64 x i8]* @lex_Ident
	%26 = bitcast [64 x i8]* %25 to [0 x i8]*
	%27 = call %symb.SymbNode* @symb_Clone(%symb.SymbNode* %24, [0 x i8]* %26)
	store %symb.SymbNode* %27, %symb.SymbNode** %s
	%28 = call i8 @lex_Next()
	store i8 %28, i8* %tok
	br label %L.14
L.16:
	%29 = call i8 @lex_Next()
	store i8 %29, i8* %tok
	%30 = load %symb.SymbNode** %ns
	%31 = getelementptr %symb.SymbNode* %30, i32 0, i32 12
	%32 = load i8* %31
	%33 = icmp eq i8 %32, 6
	br i1 %33, label %L.18, label %L.19
L.18:
	%34 = load i8* %tok
	%35 = icmp eq i8 %34, 2
	br i1 %35, label %L.21, label %L.22
L.21:
	%36 = call i8 @lex_Next()
	store i8 %36, i8* %tok
	%37 = load i8* %tok
	%38 = icmp eq i8 %37, 40
	br i1 %38, label %L.24, label %L.25
L.24:
	%39 = load %symb.SymbNode** %ns
	%40 = getelementptr %symb.SymbNode* %39, i32 0, i32 5
	%41 = load %symb.SymbNode** %40
	%42 = getelementptr [64 x i8]* @lex_Ident
	%43 = bitcast [64 x i8]* %42 to [0 x i8]*
	%44 = call %symb.SymbNode* @symb_FindLocal(%symb.SymbNode* %41, [0 x i8]* %43)
	store %symb.SymbNode* %44, %symb.SymbNode** %ns
	%45 = load %symb.SymbNode** %ns
	%46 = icmp ne %symb.SymbNode* %45, null
	br i1 %46, label %L.27, label %L.28
L.27:
	%47 = load %symb.SymbNode** %s
	%48 = getelementptr %symb.SymbNode* %47, i32 0, i32 12
	%49 = load i8* %48
	%50 = icmp eq i8 %49, 2
	br i1 %50, label %L.29, label %L.30
L.29:
	%51 = load %symb.SymbNode** %ns
	%52 = getelementptr %symb.SymbNode* %51, i32 0, i32 12
	%53 = load i8* %52
	%54 = icmp eq i8 %53, 2
	br label %L.30
L.30:
	%55 = phi i1 [ false, %L.27 ], [ %54, %L.29 ]
	br i1 %55, label %L.32, label %L.33
L.32:
	%56 = load %symb.SymbNode** %ns
	%57 = load %symb.SymbNode** %s
	%58 = getelementptr %symb.SymbNode* %57, i32 0, i32 1
	%59 = load %type.TypeNode** %58
	call void @type_FwdFix(%symb.SymbNode* %56, %type.TypeNode* %59)
	br label %L.31
L.33:
	call void @lex_Error(i8 19)
	br label %L.31
L.31:
	br label %L.26
L.28:
	%60 = getelementptr [64 x i8]* @lex_Ident
	%61 = bitcast [64 x i8]* %60 to [0 x i8]*
	call void @lex_ErrorI(i8 12, [0 x i8]* %61)
	br label %L.26
L.26:
	%62 = call i8 @lex_Next()
	store i8 %62, i8* %tok
	br label %L.23
L.25:
	call void @lex_Error(i8 11)
	br label %L.23
L.23:
	br label %L.20
L.22:
	%63 = getelementptr [64 x i8]* @lex_Ident
	%64 = bitcast [64 x i8]* %63 to [0 x i8]*
	call void @lex_ErrorI(i8 13, [0 x i8]* %64)
	br label %L.20
L.20:
	br label %L.17
L.19:
	%65 = getelementptr [64 x i8]* @lex_Ident
	%66 = bitcast [64 x i8]* %65 to [0 x i8]*
	call void @lex_ErrorI(i8 13, [0 x i8]* %66)
	br label %L.17
L.17:
	br label %L.14
L.14:
	br label %L.11
L.13:
	call void @lex_Error(i8 11)
	br label %L.11
L.11:
	br label %L.8
L.10:
	call void @lex_ErrorT(i8 10, i8 59)
	br label %L.8
L.8:
	br label %L.3
L.5:
	call void @lex_Error(i8 11)
	br label %L.3
L.3:
	%67 = load i8* %tok
	%68 = icmp ne i8 %67, 5
	br i1 %68, label %L.2, label %L.34
L.34:
	%69 = call i8 @lex_Next()
	store i8 %69, i8* %tok
	br label %L.1
L.2:
	%70 = call i8 @lex_Expect(i8 4)
	store i8 %70, i8* %tok
	store %ast.AstNode* null, %ast.AstNode** %rv.0
	br label %return
return:
	%71 = load %ast.AstNode** %rv.0
	ret %ast.AstNode* %71
}
@stmt_stmtlist = internal constant [13 x i8] [ i8 41, i8 42, i8 43, i8 47, i8 51, i8 52, i8 54, i8 55, i8 46, i8 60, i8 61, i8 58, i8 0 ], align 1
define %ast.AstNode* @stmt_Statement() nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%tree = alloca %ast.AstNode*
	%stree = alloca %ast.AstNode*
	%tok = alloca i8
	%tok2 = alloca i8
	%s = alloca %symb.SymbNode*
	store %ast.AstNode* null, %ast.AstNode** %tree
	%0 = load i8* @lex_Token
	store i8 %0, i8* %tok
	%1 = load i8* %tok
	%2 = icmp eq i8 %1, 36
	br i1 %2, label %L.2, label %L.3
L.2:
	%3 = call i8 @lex_Next()
	store i8 %3, i8* %tok
	%4 = call %ast.AstNode* @ast_New(i8 63, %type.TypeNode* null)
	store %ast.AstNode* %4, %ast.AstNode** %tree
	br label %L.4
L.4:
	%5 = load i8* %tok
	%6 = icmp ne i8 %5, 37
	br i1 %6, label %L.7, label %L.8
L.7:
	%7 = load i8* %tok
	%8 = icmp ne i8 %7, 1
	br label %L.8
L.8:
	%9 = phi i1 [ false, %L.4 ], [ %8, %L.7 ]
	%10 = xor i1 %9, true
	br i1 %10, label %L.5, label %L.6
L.6:
	%11 = call %ast.AstNode* @stmt_Statement()
	store %ast.AstNode* %11, %ast.AstNode** %stree
	%12 = load %ast.AstNode** %stree
	%13 = icmp ne %ast.AstNode* %12, null
	br i1 %13, label %L.10, label %L.9
L.10:
	%14 = load %ast.AstNode** %tree
	%15 = load %ast.AstNode** %stree
	%16 = call %ast.AstNode* @ast_Child(%ast.AstNode* %14, %ast.AstNode* %15)
	store %ast.AstNode* %16, %ast.AstNode** %tree
	br label %L.9
L.9:
	%17 = load i8* @lex_Token
	store i8 %17, i8* %tok
	br label %L.4
L.5:
	%18 = call i8 @lex_Expect(i8 37)
	store i8 %18, i8* %tok
	br label %L.1
L.3:
	%19 = getelementptr [13 x i8]* @stmt_stmtlist
	%20 = bitcast [13 x i8]* %19 to [0 x i8]*
	%21 = call i8 @lex_Keyword([0 x i8]* %20)
	store i8 %21, i8* %tok
	%22 = getelementptr [64 x i8]* @lex_Ident
	%23 = bitcast [64 x i8]* %22 to [0 x i8]*
	%24 = call %symb.SymbNode* @symb_FindTop([0 x i8]* %23)
	store %symb.SymbNode* %24, %symb.SymbNode** %s
	%25 = call i8 @lex_Next()
	store i8 %25, i8* %tok2
	%26 = load i8* %tok
	%27 = icmp ugt i8 %26, 40
	br i1 %27, label %L.11, label %L.12
L.11:
	%28 = load %symb.SymbNode** %s
	%29 = icmp ne %symb.SymbNode* %28, null
	br label %L.12
L.12:
	%30 = phi i1 [ false, %L.3 ], [ %29, %L.11 ]
	br i1 %30, label %L.14, label %L.13
L.14:
	%31 = load i8* %tok2
	%32 = zext i8 %31 to i32
	switch i32 %32, label %L.15 [
		i32 9, label %L.17
		i32 10, label %L.17
		i32 11, label %L.17
		i32 34, label %L.17
		i32 2, label %L.17
		i32 7, label %L.17
		i32 32, label %L.17
		i32 5, label %L.17
	]
L.17:
	store i8 40, i8* %tok
	br label %L.16
L.15:
	br label %L.16
L.16:
	br label %L.13
L.13:
	%33 = load i8* %tok
	%34 = zext i8 %33 to i32
	switch i32 %34, label %L.18 [
		i32 40, label %L.20
		i32 41, label %L.21
		i32 42, label %L.22
		i32 43, label %L.23
		i32 47, label %L.24
		i32 51, label %L.25
		i32 52, label %L.26
		i32 54, label %L.27
		i32 55, label %L.28
		i32 46, label %L.29
		i32 61, label %L.30
		i32 60, label %L.31
		i32 58, label %L.32
		i32 4, label %L.33
	]
L.20:
	%35 = load %symb.SymbNode** %s
	%36 = icmp ne %symb.SymbNode* %35, null
	br i1 %36, label %L.35, label %L.36
L.35:
	%37 = load %symb.SymbNode** %s
	%38 = call %ast.AstNode* @stmt_AssignOrCall(%symb.SymbNode* %37)
	store %ast.AstNode* %38, %ast.AstNode** %tree
	br label %L.34
L.36:
	%39 = getelementptr [64 x i8]* @lex_Ident
	%40 = bitcast [64 x i8]* %39 to [0 x i8]*
	call void @lex_ErrorI(i8 27, [0 x i8]* %40)
	%41 = getelementptr [13 x i8]* @stmt_stmtlist
	%42 = bitcast [13 x i8]* %41 to [0 x i8]*
	%43 = call i8 @lex_Skip([0 x i8]* %42)
	store i8 %43, i8* %tok
	br label %L.34
L.34:
	br label %L.19
L.21:
	%44 = call %ast.AstNode* @stmt_TypeDecl()
	store %ast.AstNode* %44, %ast.AstNode** %tree
	br label %L.19
L.22:
	%45 = call %ast.AstNode* @stmt_VarDecl()
	store %ast.AstNode* %45, %ast.AstNode** %tree
	br label %L.19
L.23:
	%46 = call %ast.AstNode* @stmt_ConstDecl()
	store %ast.AstNode* %46, %ast.AstNode** %tree
	br label %L.19
L.24:
	%47 = call %ast.AstNode* @stmt_If()
	store %ast.AstNode* %47, %ast.AstNode** %tree
	br label %L.19
L.25:
	%48 = call %ast.AstNode* @stmt_For()
	store %ast.AstNode* %48, %ast.AstNode** %tree
	br label %L.19
L.26:
	%49 = call %ast.AstNode* @stmt_While()
	store %ast.AstNode* %49, %ast.AstNode** %tree
	br label %L.19
L.27:
	%50 = call %ast.AstNode* @stmt_Loop()
	store %ast.AstNode* %50, %ast.AstNode** %tree
	br label %L.19
L.28:
	%51 = call %ast.AstNode* @stmt_Exit()
	store %ast.AstNode* %51, %ast.AstNode** %tree
	br label %L.19
L.29:
	%52 = call %ast.AstNode* @stmt_Return()
	store %ast.AstNode* %52, %ast.AstNode** %tree
	br label %L.19
L.30:
	%53 = call %ast.AstNode* @stmt_Asm()
	store %ast.AstNode* %53, %ast.AstNode** %tree
	br label %L.19
L.31:
	%54 = call %ast.AstNode* @stmt_WhenStmt(i8 2)
	store %ast.AstNode* %54, %ast.AstNode** %tree
	br label %L.19
L.32:
	%55 = call %ast.AstNode* @stmt_Alias()
	store %ast.AstNode* %55, %ast.AstNode** %tree
	br label %L.19
L.33:
	br label %L.19
L.18:
	%56 = load i8* %tok
	call void @lex_ErrorT(i8 28, i8 %56)
	br label %L.19
L.19:
	br label %L.1
L.1:
	%57 = load %ast.AstNode** %tree
	store %ast.AstNode* %57, %ast.AstNode** %rv.0
	br label %return
return:
	%58 = load %ast.AstNode** %rv.0
	ret %ast.AstNode* %58
}
define %ast.AstNode* @stmt_Procedure() nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%tree = alloca %ast.AstNode*
	%stree = alloca %ast.AstNode*
	%tok = alloca i8
	%t = alloca %type.TypeNode*
	%mt = alloca %type.TypeNode*
	%s = alloca %symb.SymbNode*
	%ms = alloca %symb.SymbNode*
	store %ast.AstNode* null, %ast.AstNode** %tree
	store %type.TypeNode* null, %type.TypeNode** %mt
	store %symb.SymbNode* null, %symb.SymbNode** %ms
	%0 = load i8* @lex_Token
	store i8 %0, i8* %tok
	%1 = load i8* %tok
	%2 = icmp eq i8 %1, 32
	br i1 %2, label %L.2, label %L.1
L.2:
	%3 = call i8 @lex_Next()
	store i8 %3, i8* %tok
	%4 = load i8* %tok
	%5 = icmp eq i8 %4, 40
	br i1 %5, label %L.4, label %L.5
L.4:
	%6 = getelementptr [64 x i8]* @lex_Ident
	%7 = bitcast [64 x i8]* %6 to [0 x i8]*
	%8 = call %symb.SymbNode* @symb_New(i8 3, [0 x i8]* %7, i8 1)
	store %symb.SymbNode* %8, %symb.SymbNode** %ms
	%9 = load %symb.SymbNode** %ms
	%10 = getelementptr %symb.SymbNode* %9, i32 0, i32 16
	store i8 1, i8* %10
	%11 = load %symb.SymbNode** %ms
	%12 = getelementptr %symb.SymbNode* %11, i32 0, i32 13
	store i8 0, i8* %12
	store %type.TypeNode* null, %type.TypeNode** %t
	%13 = call i8 @lex_Next()
	store i8 %13, i8* %tok
	%14 = load i8* %tok
	%15 = icmp eq i8 %14, 3
	br i1 %15, label %L.7, label %L.8
L.7:
	%16 = call i8 @lex_Next()
	store i8 %16, i8* %tok
	%17 = load i8* %tok
	%18 = zext i8 %17 to i32
	switch i32 %18, label %L.9 [
		i32 7, label %L.11
		i32 40, label %L.12
	]
L.11:
	%19 = call %type.TypeNode* @type_Ref()
	store %type.TypeNode* %19, %type.TypeNode** %t
	%20 = load %type.TypeNode** %t
	%21 = getelementptr %type.TypeNode* %20, i32 0, i32 0
	%22 = load %type.TypeNode** %21
	store %type.TypeNode* %22, %type.TypeNode** %mt
	br label %L.10
L.12:
	%23 = call %symb.SymbNode* @type_Name()
	store %symb.SymbNode* %23, %symb.SymbNode** %s
	%24 = call i8 @lex_Next()
	store i8 %24, i8* %tok
	%25 = load %symb.SymbNode** %s
	%26 = icmp ne %symb.SymbNode* %25, null
	br i1 %26, label %L.14, label %L.15
L.14:
	%27 = load %symb.SymbNode** %s
	%28 = getelementptr %symb.SymbNode* %27, i32 0, i32 1
	%29 = load %type.TypeNode** %28
	store %type.TypeNode* %29, %type.TypeNode** %t
	%30 = load %type.TypeNode** %t
	store %type.TypeNode* %30, %type.TypeNode** %mt
	%31 = load %type.TypeNode** %t
	%32 = icmp ne %type.TypeNode* %31, null
	br i1 %32, label %L.16, label %L.17
L.16:
	%33 = load %type.TypeNode** %t
	%34 = getelementptr %type.TypeNode* %33, i32 0, i32 11
	%35 = load i8* %34
	%36 = icmp eq i8 %35, 4
	br label %L.17
L.17:
	%37 = phi i1 [ false, %L.14 ], [ %36, %L.16 ]
	br i1 %37, label %L.19, label %L.18
L.19:
	%38 = load %type.TypeNode** %t
	%39 = getelementptr %type.TypeNode* %38, i32 0, i32 0
	%40 = load %type.TypeNode** %39
	store %type.TypeNode* %40, %type.TypeNode** %mt
	br label %L.18
L.18:
	br label %L.13
L.15:
	call void @lex_Error(i8 19)
	br label %L.13
L.13:
	br label %L.10
L.9:
	call void @lex_ErrorT(i8 10, i8 40)
	br label %L.10
L.10:
	br label %L.6
L.8:
	call void @lex_ErrorT(i8 10, i8 3)
	br label %L.6
L.6:
	%41 = load %type.TypeNode** %t
	%42 = load %symb.SymbNode** %ms
	%43 = getelementptr %symb.SymbNode* %42, i32 0, i32 1
	store %type.TypeNode* %41, %type.TypeNode** %43
	br label %L.3
L.5:
	call void @lex_ErrorT(i8 10, i8 40)
	br label %L.3
L.3:
	%44 = call i8 @lex_Expect(i8 33)
	store i8 %44, i8* %tok
	br label %L.1
L.1:
	%45 = load i8* %tok
	%46 = icmp eq i8 %45, 40
	br i1 %46, label %L.21, label %L.22
L.21:
	%47 = getelementptr [64 x i8]* @lex_Ident
	%48 = bitcast [64 x i8]* %47 to [0 x i8]*
	%49 = call %symb.SymbNode* @symb_New(i8 5, [0 x i8]* %48, i8 1)
	store %symb.SymbNode* %49, %symb.SymbNode** %s
	%50 = load %type.TypeNode** %mt
	%51 = icmp ne %type.TypeNode* %50, null
	br i1 %51, label %L.24, label %L.25
L.24:
	%52 = load %type.TypeNode** %mt
	%53 = getelementptr %type.TypeNode* %52, i32 0, i32 4
	%54 = load %symb.SymbNode** %53
	%55 = getelementptr [64 x i8]* @lex_Ident
	%56 = bitcast [64 x i8]* %55 to [0 x i8]*
	%57 = call i8 @symb_IsUniqueMethod(%symb.SymbNode* %54, [0 x i8]* %56)
	%58 = icmp ne i8 %57, 0
	%59 = xor i1 %58, true
	br i1 %59, label %L.27, label %L.26
L.26:
	%60 = load %type.TypeNode** %mt
	%61 = getelementptr %type.TypeNode* %60, i32 0, i32 3
	%62 = load %symb.SymbNode** %61
	%63 = getelementptr [64 x i8]* @lex_Ident
	%64 = bitcast [64 x i8]* %63 to [0 x i8]*
	%65 = call i8 @symb_IsUniqueLocal(%symb.SymbNode* %62, [0 x i8]* %64)
	%66 = icmp ne i8 %65, 0
	%67 = xor i1 %66, true
	br label %L.27
L.27:
	%68 = phi i1 [ true, %L.24 ], [ %67, %L.26 ]
	br i1 %68, label %L.29, label %L.28
L.29:
	%69 = getelementptr [64 x i8]* @lex_Ident
	%70 = bitcast [64 x i8]* %69 to [0 x i8]*
	call void @lex_ErrorI(i8 13, [0 x i8]* %70)
	br label %L.28
L.28:
	%71 = load %type.TypeNode** %mt
	%72 = getelementptr %type.TypeNode* %71, i32 0, i32 4
	%73 = load %symb.SymbNode** %72
	%74 = load %symb.SymbNode** %s
	%75 = getelementptr %symb.SymbNode* %74, i32 0, i32 6
	store %symb.SymbNode* %73, %symb.SymbNode** %75
	%76 = load %symb.SymbNode** %s
	%77 = load %type.TypeNode** %mt
	%78 = getelementptr %type.TypeNode* %77, i32 0, i32 4
	store %symb.SymbNode* %76, %symb.SymbNode** %78
	br label %L.23
L.25:
	%79 = load %symb.SymbNode** %s
	call void @symb_MakeVisable(%symb.SymbNode* %79)
	br label %L.23
L.23:
	%80 = call i8 @lex_Next()
	store i8 %80, i8* %tok
	%81 = load %symb.SymbNode** %s
	%82 = load %symb.SymbNode** %ms
	call void @type_DefProc(%symb.SymbNode* %81, %symb.SymbNode* %82)
	%83 = load i8* @lex_Token
	store i8 %83, i8* %tok
	%84 = load i8* %tok
	%85 = icmp eq i8 %84, 3
	br i1 %85, label %L.31, label %L.30
L.31:
	%86 = load %symb.SymbNode** %s
	call void @type_ProcAttributes(%symb.SymbNode* %86)
	%87 = load i8* @lex_Token
	store i8 %87, i8* %tok
	br label %L.30
L.30:
	%88 = load i8* %tok
	%89 = icmp ne i8 %88, 4
	br i1 %89, label %L.33, label %L.34
L.33:
	%90 = load %symb.SymbNode** %s
	%91 = getelementptr %symb.SymbNode* %90, i32 0, i32 1
	%92 = load %type.TypeNode** %91
	store %type.TypeNode* %92, %type.TypeNode** %t
	%93 = load %symb.SymbNode** %s
	store %symb.SymbNode* %93, %symb.SymbNode** @symb_curproc
	%94 = load %symb.SymbNode** %s
	%95 = getelementptr %symb.SymbNode* %94, i32 0, i32 3
	%96 = load %symb.SymbNode** %95
	call void @symb_Push(%symb.SymbNode* %96)
	call void @symb_Push(%symb.SymbNode* null)
	store i8 0, i8* @stmt_LoopLevel
	%97 = load %type.TypeNode** %t
	%98 = call %ast.AstNode* @ast_New(i8 70, %type.TypeNode* %97)
	store %ast.AstNode* %98, %ast.AstNode** %tree
	%99 = load %symb.SymbNode** %s
	%100 = load %ast.AstNode** %tree
	%101 = getelementptr %ast.AstNode* %100, i32 0, i32 10
	store %symb.SymbNode* %99, %symb.SymbNode** %101
	%102 = load %type.TypeNode** %t
	%103 = icmp ne %type.TypeNode* %102, null
	br i1 %103, label %L.35, label %L.36
L.35:
	%104 = load %type.TypeNode** %t
	%105 = getelementptr %type.TypeNode* %104, i32 0, i32 11
	%106 = load i8* %105
	%107 = icmp eq i8 %106, 4
	br label %L.36
L.36:
	%108 = phi i1 [ false, %L.33 ], [ %107, %L.35 ]
	br i1 %108, label %L.38, label %L.37
L.38:
	%109 = load %type.TypeNode** %t
	%110 = getelementptr %type.TypeNode* %109, i32 0, i32 0
	%111 = load %type.TypeNode** %110
	%112 = load %ast.AstNode** %tree
	%113 = getelementptr %ast.AstNode* %112, i32 0, i32 9
	store %type.TypeNode* %111, %type.TypeNode** %113
	%114 = load %target.TargetT** @target_Target
	%115 = getelementptr %target.TargetT* %114, i32 0, i32 8
	%116 = getelementptr %target.SizeAlign* %115, i32 0, i32 0
	%117 = load i8* %116
	%118 = load %ast.AstNode** %tree
	%119 = getelementptr %ast.AstNode* %118, i32 0, i32 2
	store i8 %117, i8* %119
	br label %L.37
L.37:
	%120 = call %ast.AstNode* @stmt_Statement()
	store %ast.AstNode* %120, %ast.AstNode** %stree
	%121 = getelementptr %A.148602984* @debug, i32 0, i32 0
	%122 = getelementptr %A.148603128* %121, i32 0, i32 3
	%123 = load i8* %122
	%124 = icmp ne i8 %123, 0
	br i1 %124, label %L.40, label %L.39
L.40:
	call void @symb_Dump(i8 2)
	br label %L.39
L.39:
	call void @symb_Pop()
	call void @symb_Pop()
	store %symb.SymbNode* null, %symb.SymbNode** @symb_curproc
	%125 = load %ast.AstNode** %tree
	%126 = load %ast.AstNode** %stree
	%127 = call %ast.AstNode* @ast_Child(%ast.AstNode* %125, %ast.AstNode* %126)
	store %ast.AstNode* %127, %ast.AstNode** %tree
	br label %L.32
L.34:
	%128 = call i8 @lex_Next()
	store i8 %128, i8* %tok
	%129 = load %symb.SymbNode** %s
	%130 = getelementptr %symb.SymbNode* %129, i32 0, i32 14
	store i8 1, i8* %130
	br label %L.32
L.32:
	br label %L.20
L.22:
	call void @lex_ErrorT(i8 10, i8 40)
	br label %L.20
L.20:
	%131 = load %ast.AstNode** %tree
	store %ast.AstNode* %131, %ast.AstNode** %rv.0
	br label %return
return:
	%132 = load %ast.AstNode** %rv.0
	ret %ast.AstNode* %132
}
define %ast.AstNode* @stmt_Import() nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%tree = alloca %ast.AstNode*
	%tok = alloca i8
	%0 = load i8* @lex_Token
	store i8 %0, i8* %tok
	store %ast.AstNode* null, %ast.AstNode** %tree
	%1 = load i8* %tok
	%2 = icmp eq i8 %1, 40
	br i1 %2, label %L.2, label %L.1
L.2:
	%3 = getelementptr [64 x i8]* @lex_Ident
	%4 = bitcast [64 x i8]* %3 to [0 x i8]*
	%5 = call i8 @lex_FileCheck([0 x i8]* %4)
	%6 = icmp ne i8 %5, 0
	br i1 %6, label %L.4, label %L.3
L.4:
	%7 = getelementptr [64 x i8]* @lex_Ident
	%8 = bitcast [64 x i8]* %7 to [0 x i8]*
	%9 = call i8 @lex_FileOpen([0 x i8]* %8)
	%10 = icmp ne i8 %9, 0
	br i1 %10, label %L.6, label %L.7
L.6:
	%11 = getelementptr [64 x i8]* @lex_Ident
	%12 = bitcast [64 x i8]* %11 to [0 x i8]*
	%13 = call %ast.AstNode* @stmt_Program([0 x i8]* %12)
	store %ast.AstNode* %13, %ast.AstNode** %tree
	call void @lex_FileClose()
	br label %L.5
L.7:
	%14 = getelementptr [64 x i8]* @lex_Ident
	%15 = bitcast [64 x i8]* %14 to [0 x i8]*
	call void @lex_ErrorI(i8 61, [0 x i8]* %15)
	br label %L.5
L.5:
	br label %L.3
L.3:
	%16 = call i8 @lex_Next()
	store i8 %16, i8* %tok
	%17 = call i8 @lex_Expect(i8 4)
	store i8 %17, i8* %tok
	br label %L.1
L.1:
	%18 = load %ast.AstNode** %tree
	store %ast.AstNode* %18, %ast.AstNode** %rv.0
	br label %return
return:
	%19 = load %ast.AstNode** %rv.0
	ret %ast.AstNode* %19
}
@stmt_packlist = internal constant [9 x i8] [ i8 41, i8 42, i8 43, i8 44, i8 58, i8 45, i8 57, i8 60, i8 0 ], align 1
define %ast.AstNode* @stmt_PkgStmt() nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%tree = alloca %ast.AstNode*
	%tok = alloca i8
	store %ast.AstNode* null, %ast.AstNode** %tree
	%0 = getelementptr [9 x i8]* @stmt_packlist
	%1 = bitcast [9 x i8]* %0 to [0 x i8]*
	%2 = call i8 @lex_Keyword([0 x i8]* %1)
	store i8 %2, i8* %tok
	%3 = load i8* %tok
	%4 = zext i8 %3 to i32
	switch i32 %4, label %L.1 [
		i32 58, label %L.3
		i32 41, label %L.4
		i32 42, label %L.5
		i32 43, label %L.6
		i32 44, label %L.7
		i32 45, label %L.8
		i32 57, label %L.9
		i32 60, label %L.10
	]
L.3:
	%5 = call i8 @lex_Next()
	store i8 %5, i8* %tok
	%6 = call %ast.AstNode* @stmt_Alias()
	store %ast.AstNode* %6, %ast.AstNode** %tree
	br label %L.2
L.4:
	%7 = call i8 @lex_Next()
	store i8 %7, i8* %tok
	%8 = call %ast.AstNode* @stmt_TypeDecl()
	store %ast.AstNode* %8, %ast.AstNode** %tree
	br label %L.2
L.5:
	%9 = call i8 @lex_Next()
	store i8 %9, i8* %tok
	%10 = call %ast.AstNode* @stmt_VarDecl()
	store %ast.AstNode* %10, %ast.AstNode** %tree
	br label %L.2
L.6:
	%11 = call i8 @lex_Next()
	store i8 %11, i8* %tok
	%12 = call %ast.AstNode* @stmt_ConstDecl()
	store %ast.AstNode* %12, %ast.AstNode** %tree
	br label %L.2
L.7:
	%13 = call i8 @lex_Next()
	store i8 %13, i8* %tok
	%14 = call %ast.AstNode* @stmt_Procedure()
	store %ast.AstNode* %14, %ast.AstNode** %tree
	br label %L.2
L.8:
	%15 = call i8 @lex_Next()
	store i8 %15, i8* %tok
	%16 = call %ast.AstNode* @stmt_Package()
	store %ast.AstNode* %16, %ast.AstNode** %tree
	br label %L.2
L.9:
	%17 = call i8 @lex_Next()
	store i8 %17, i8* %tok
	%18 = call %ast.AstNode* @stmt_Import()
	store %ast.AstNode* %18, %ast.AstNode** %tree
	br label %L.2
L.10:
	%19 = call i8 @lex_Next()
	store i8 %19, i8* %tok
	%20 = call %ast.AstNode* @stmt_WhenStmt(i8 1)
	store %ast.AstNode* %20, %ast.AstNode** %tree
	br label %L.2
L.1:
	%21 = load i8* %tok
	%22 = icmp eq i8 %21, 40
	br i1 %22, label %L.12, label %L.13
L.12:
	call void @lex_Error(i8 48)
	%23 = getelementptr [3 x i8]* @stmt_skiplist
	%24 = bitcast [3 x i8]* %23 to [0 x i8]*
	%25 = call i8 @lex_Skip([0 x i8]* %24)
	store i8 %25, i8* %tok
	br label %L.11
L.13:
	%26 = load i8* %tok
	%27 = icmp ne i8 %26, 4
	br i1 %27, label %L.15, label %L.14
L.15:
	%28 = load i8* %tok
	call void @lex_ErrorT(i8 28, i8 %28)
	br label %L.14
L.14:
	%29 = call i8 @lex_Next()
	store i8 %29, i8* %tok
	br label %L.11
L.11:
	br label %L.2
L.2:
	%30 = load %ast.AstNode** %tree
	store %ast.AstNode* %30, %ast.AstNode** %rv.0
	br label %return
return:
	%31 = load %ast.AstNode** %rv.0
	ret %ast.AstNode* %31
}
define %ast.AstNode* @stmt_Package() nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%tree = alloca %ast.AstNode*
	%stree = alloca %ast.AstNode*
	%tok = alloca i8
	%s = alloca %symb.SymbNode*
	%pkgsave = alloca %symb.SymbNode*
	store %ast.AstNode* null, %ast.AstNode** %tree
	%0 = load i8* @lex_Token
	store i8 %0, i8* %tok
	%1 = load i8* %tok
	%2 = icmp eq i8 %1, 40
	br i1 %2, label %L.2, label %L.1
L.2:
	%3 = getelementptr [64 x i8]* @lex_Ident
	%4 = bitcast [64 x i8]* %3 to [0 x i8]*
	%5 = call %symb.SymbNode* @symb_FindTop([0 x i8]* %4)
	store %symb.SymbNode* %5, %symb.SymbNode** %s
	%6 = load %symb.SymbNode** %s
	%7 = icmp eq %symb.SymbNode* %6, null
	br i1 %7, label %L.4, label %L.5
L.4:
	%8 = getelementptr [64 x i8]* @lex_Ident
	%9 = bitcast [64 x i8]* %8 to [0 x i8]*
	%10 = call %symb.SymbNode* @symb_New(i8 6, [0 x i8]* %9, i8 0)
	store %symb.SymbNode* %10, %symb.SymbNode** %s
	br label %L.3
L.5:
	%11 = load %symb.SymbNode** %s
	%12 = getelementptr %symb.SymbNode* %11, i32 0, i32 12
	%13 = load i8* %12
	%14 = icmp ne i8 %13, 6
	br i1 %14, label %L.7, label %L.6
L.7:
	%15 = getelementptr [64 x i8]* @lex_Ident
	%16 = bitcast [64 x i8]* %15 to [0 x i8]*
	call void @lex_ErrorI(i8 13, [0 x i8]* %16)
	br label %L.6
L.6:
	br label %L.3
L.3:
	%17 = load %symb.SymbNode** %s
	%18 = getelementptr %symb.SymbNode* %17, i32 0, i32 14
	store i8 1, i8* %18
	%19 = call i8 @lex_Next()
	store i8 %19, i8* %tok
	%20 = load i8* %tok
	%21 = icmp eq i8 %20, 36
	br i1 %21, label %L.9, label %L.8
L.9:
	%22 = call i8 @lex_Next()
	store i8 %22, i8* %tok
	%23 = load %symb.SymbNode** @symb_curpack
	store %symb.SymbNode* %23, %symb.SymbNode** %pkgsave
	%24 = load %symb.SymbNode** %s
	store %symb.SymbNode* %24, %symb.SymbNode** @symb_curpack
	%25 = call %ast.AstNode* @ast_New(i8 63, %type.TypeNode* null)
	store %ast.AstNode* %25, %ast.AstNode** %tree
	%26 = load %symb.SymbNode** %s
	%27 = getelementptr %symb.SymbNode* %26, i32 0, i32 5
	%28 = load %symb.SymbNode** %27
	call void @symb_Push(%symb.SymbNode* %28)
	br label %L.10
L.10:
	%29 = load i8* %tok
	%30 = icmp ne i8 %29, 37
	br i1 %30, label %L.13, label %L.14
L.13:
	%31 = load i8* %tok
	%32 = icmp ne i8 %31, 1
	br label %L.14
L.14:
	%33 = phi i1 [ false, %L.10 ], [ %32, %L.13 ]
	%34 = xor i1 %33, true
	br i1 %34, label %L.11, label %L.12
L.12:
	%35 = call %ast.AstNode* @stmt_PkgStmt()
	store %ast.AstNode* %35, %ast.AstNode** %stree
	%36 = load %ast.AstNode** %stree
	%37 = icmp ne %ast.AstNode* %36, null
	br i1 %37, label %L.16, label %L.15
L.16:
	%38 = load %ast.AstNode** %tree
	%39 = load %ast.AstNode** %stree
	%40 = call %ast.AstNode* @ast_Child(%ast.AstNode* %38, %ast.AstNode* %39)
	store %ast.AstNode* %40, %ast.AstNode** %tree
	br label %L.15
L.15:
	%41 = load i8* @lex_Token
	store i8 %41, i8* %tok
	br label %L.10
L.11:
	%42 = load %ast.AstNode** %tree
	%43 = call %ast.AstNode* @ast_New1(i8 4, %type.TypeNode* null, %ast.AstNode* %42)
	store %ast.AstNode* %43, %ast.AstNode** %tree
	%44 = load %symb.SymbNode** %s
	%45 = load %ast.AstNode** %tree
	%46 = getelementptr %ast.AstNode* %45, i32 0, i32 10
	store %symb.SymbNode* %44, %symb.SymbNode** %46
	br label %L.8
L.8:
	%47 = call i8 @lex_Expect(i8 37)
	store i8 %47, i8* %tok
	%48 = call %symb.SymbNode* @symb_Save()
	%49 = load %symb.SymbNode** %s
	%50 = getelementptr %symb.SymbNode* %49, i32 0, i32 5
	store %symb.SymbNode* %48, %symb.SymbNode** %50
	%51 = getelementptr %A.148602984* @debug, i32 0, i32 0
	%52 = getelementptr %A.148603128* %51, i32 0, i32 2
	%53 = load i8* %52
	%54 = icmp ne i8 %53, 0
	br i1 %54, label %L.18, label %L.17
L.18:
	call void @symb_Dump(i8 1)
	br label %L.17
L.17:
	call void @symb_Pop()
	%55 = load %symb.SymbNode** %pkgsave
	store %symb.SymbNode* %55, %symb.SymbNode** @symb_curpack
	br label %L.1
L.1:
	%56 = load %ast.AstNode** %tree
	store %ast.AstNode* %56, %ast.AstNode** %rv.0
	br label %return
return:
	%57 = load %ast.AstNode** %rv.0
	ret %ast.AstNode* %57
}
@stmt_proglist = internal constant [9 x i8] [ i8 57, i8 58, i8 45, i8 41, i8 42, i8 43, i8 44, i8 60, i8 0 ], align 1
define %ast.AstNode* @stmt_ProgStmt() nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%tree = alloca %ast.AstNode*
	%tok = alloca i8
	store %ast.AstNode* null, %ast.AstNode** %tree
	%0 = getelementptr [9 x i8]* @stmt_proglist
	%1 = bitcast [9 x i8]* %0 to [0 x i8]*
	%2 = call i8 @lex_Keyword([0 x i8]* %1)
	store i8 %2, i8* %tok
	%3 = load i8* %tok
	%4 = zext i8 %3 to i32
	switch i32 %4, label %L.1 [
		i32 57, label %L.3
		i32 58, label %L.4
		i32 45, label %L.5
		i32 41, label %L.6
		i32 42, label %L.7
		i32 43, label %L.8
		i32 44, label %L.9
		i32 60, label %L.10
	]
L.3:
	%5 = call i8 @lex_Next()
	store i8 %5, i8* %tok
	%6 = call %ast.AstNode* @stmt_Import()
	store %ast.AstNode* %6, %ast.AstNode** %tree
	br label %L.2
L.4:
	%7 = call i8 @lex_Next()
	store i8 %7, i8* %tok
	%8 = call %ast.AstNode* @stmt_Alias()
	store %ast.AstNode* %8, %ast.AstNode** %tree
	br label %L.2
L.5:
	%9 = call i8 @lex_Next()
	store i8 %9, i8* %tok
	%10 = call %ast.AstNode* @stmt_Package()
	store %ast.AstNode* %10, %ast.AstNode** %tree
	br label %L.2
L.6:
	%11 = call i8 @lex_Next()
	store i8 %11, i8* %tok
	%12 = call %ast.AstNode* @stmt_TypeDecl()
	store %ast.AstNode* %12, %ast.AstNode** %tree
	br label %L.2
L.7:
	%13 = call i8 @lex_Next()
	store i8 %13, i8* %tok
	%14 = call %ast.AstNode* @stmt_VarDecl()
	store %ast.AstNode* %14, %ast.AstNode** %tree
	br label %L.2
L.8:
	%15 = call i8 @lex_Next()
	store i8 %15, i8* %tok
	%16 = call %ast.AstNode* @stmt_ConstDecl()
	store %ast.AstNode* %16, %ast.AstNode** %tree
	br label %L.2
L.9:
	%17 = call i8 @lex_Next()
	store i8 %17, i8* %tok
	%18 = call %ast.AstNode* @stmt_Procedure()
	store %ast.AstNode* %18, %ast.AstNode** %tree
	br label %L.2
L.10:
	%19 = call i8 @lex_Next()
	store i8 %19, i8* %tok
	%20 = call %ast.AstNode* @stmt_WhenStmt(i8 0)
	store %ast.AstNode* %20, %ast.AstNode** %tree
	br label %L.2
L.1:
	%21 = load i8* %tok
	%22 = icmp eq i8 %21, 4
	br i1 %22, label %L.12, label %L.13
L.12:
	%23 = call i8 @lex_Next()
	store i8 %23, i8* %tok
	br label %L.11
L.13:
	%24 = load i8* %tok
	%25 = icmp eq i8 %24, 40
	br i1 %25, label %L.15, label %L.16
L.15:
	%26 = getelementptr [64 x i8]* @lex_Ident
	%27 = bitcast [64 x i8]* %26 to [0 x i8]*
	call void @lex_ErrorI(i8 27, [0 x i8]* %27)
	br label %L.14
L.16:
	%28 = load i8* %tok
	call void @lex_ErrorT(i8 28, i8 %28)
	br label %L.14
L.14:
	%29 = getelementptr [3 x i8]* @stmt_skiplist
	%30 = bitcast [3 x i8]* %29 to [0 x i8]*
	%31 = call i8 @lex_Skip([0 x i8]* %30)
	store i8 %31, i8* %tok
	br label %L.11
L.11:
	br label %L.2
L.2:
	%32 = load %ast.AstNode** %tree
	store %ast.AstNode* %32, %ast.AstNode** %rv.0
	br label %return
return:
	%33 = load %ast.AstNode** %rv.0
	ret %ast.AstNode* %33
}
define %ast.AstNode* @stmt_Program([0 x i8]* %file.arg) nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%file = alloca [0 x i8]*
	store [0 x i8]* %file.arg, [0 x i8]** %file
	%tree = alloca %ast.AstNode*
	%stree = alloca %ast.AstNode*
	%tok = alloca i8
	%s = alloca %symb.SymbNode*
	%0 = load %lex.FileContext** @lex_f
	%1 = getelementptr %lex.FileContext* %0, i32 0, i32 7
	%2 = load %lex.SearchPathEntry** %1
	%3 = getelementptr %lex.SearchPathEntry* %2, i32 0, i32 1
	%4 = getelementptr [1024 x i8]* %3
	%5 = bitcast [1024 x i8]* %4 to [0 x i8]*
	%6 = load %lex.FileContext** @lex_f
	%7 = getelementptr %lex.FileContext* %6, i32 0, i32 8
	%8 = getelementptr [256 x i8]* %7
	%9 = bitcast [256 x i8]* %8 to [0 x i8]*
	%10 = call %symb.SymbNode* @symb_NewFile([0 x i8]* %5, [0 x i8]* %9)
	store %symb.SymbNode* %10, %symb.SymbNode** %s
	%11 = load %symb.SymbNode** @stmt_CurFile
	%12 = load %symb.SymbNode** %s
	%13 = getelementptr %symb.SymbNode* %12, i32 0, i32 2
	store %symb.SymbNode* %11, %symb.SymbNode** %13
	%14 = load %symb.SymbNode** %s
	store %symb.SymbNode* %14, %symb.SymbNode** @stmt_CurFile
	store %symb.SymbNode* null, %symb.SymbNode** @symb_curpack
	%15 = call %ast.AstNode* @ast_New(i8 63, %type.TypeNode* null)
	store %ast.AstNode* %15, %ast.AstNode** %tree
	%16 = call i8 @lex_Next()
	store i8 %16, i8* %tok
	br label %L.1
L.1:
	%17 = load i8* %tok
	%18 = icmp ne i8 %17, 1
	%19 = xor i1 %18, true
	br i1 %19, label %L.2, label %L.3
L.3:
	%20 = call %ast.AstNode* @stmt_ProgStmt()
	store %ast.AstNode* %20, %ast.AstNode** %stree
	%21 = load %ast.AstNode** %stree
	%22 = icmp ne %ast.AstNode* %21, null
	br i1 %22, label %L.5, label %L.4
L.5:
	%23 = load %ast.AstNode** %tree
	%24 = load %ast.AstNode** %stree
	%25 = call %ast.AstNode* @ast_Child(%ast.AstNode* %23, %ast.AstNode* %24)
	store %ast.AstNode* %25, %ast.AstNode** %tree
	br label %L.4
L.4:
	%26 = load i8* @lex_Token
	store i8 %26, i8* %tok
	br label %L.1
L.2:
	%27 = load %ast.AstNode** %tree
	%28 = call %ast.AstNode* @ast_New1(i8 3, %type.TypeNode* null, %ast.AstNode* %27)
	store %ast.AstNode* %28, %ast.AstNode** %tree
	%29 = load %symb.SymbNode** %s
	%30 = load %ast.AstNode** %tree
	%31 = getelementptr %ast.AstNode* %30, i32 0, i32 10
	store %symb.SymbNode* %29, %symb.SymbNode** %31
	%32 = load %ast.AstNode** %tree
	store %ast.AstNode* %32, %ast.AstNode** %rv.0
	br label %return
return:
	%33 = load %ast.AstNode** %rv.0
	ret %ast.AstNode* %33
}
@llvm_f = internal global i32 0, align 4
@llvmdb_seqno = internal global i16 0, align 2
@llvmdb_unit = internal global i16 0, align 2
@llvmdb_file = internal global i16 0, align 2
@llvmdb_pakg = internal global i16 0, align 2
@llvmdb_subr = internal global i16 0, align 2
@llvmdb_blok = internal global i16 0, align 2
@llvmdb_gvhead = internal global %symb.SymbNode* zeroinitializer, align 4
@llvmdb_gvtail = internal global %symb.SymbNode* zeroinitializer, align 4
@llvmdb_lvhead = internal global %symb.SymbNode* zeroinitializer, align 4
@llvmdb_lvtail = internal global %symb.SymbNode* zeroinitializer, align 4
@llvmdb_sphead = internal global %symb.SymbNode* zeroinitializer, align 4
@llvmdb_sptail = internal global %symb.SymbNode* zeroinitializer, align 4
%llvmdb.LineT = type {%llvmdb.LineT*, i16, i16, i16}
@llvmdb_lnhead = internal global %llvmdb.LineT* zeroinitializer, align 4
@llvmdb_lntail = internal global %llvmdb.LineT* zeroinitializer, align 4
define zeroext i16 @llvmdb_GetContext() nounwind {
L.0:
	%rv.0 = alloca i16
	%0 = load i16* @llvmdb_blok
	%1 = icmp ne i16 %0, 0
	br i1 %1, label %L.2, label %L.1
L.2:
	%2 = load i16* @llvmdb_blok
	store i16 %2, i16* %rv.0
	br label %return
L.1:
	%3 = load i16* @llvmdb_subr
	%4 = icmp ne i16 %3, 0
	br i1 %4, label %L.4, label %L.3
L.4:
	%5 = load i16* @llvmdb_subr
	store i16 %5, i16* %rv.0
	br label %return
L.3:
	%6 = load i16* @llvmdb_pakg
	%7 = icmp ne i16 %6, 0
	br i1 %7, label %L.6, label %L.5
L.6:
	%8 = load i16* @llvmdb_pakg
	store i16 %8, i16* %rv.0
	br label %return
L.5:
	%9 = load i16* @llvmdb_file
	store i16 %9, i16* %rv.0
	br label %return
return:
	%10 = load i16* %rv.0
	ret i16 %10
}
define void @llvmdb_PSeq(i16 zeroext %n.arg) nounwind {
L.0:
	%n = alloca i16
	store i16 %n.arg, i16* %n
	%0 = load i32* @llvm_f
	call void @out_chr(i32 %0, i8 33)
	%1 = load i32* @llvm_f
	%2 = load i16* %n
	%3 = zext i16 %2 to i32
	call void @out_uint(i32 %1, i32 %3)
	br label %return
return:
	ret void
}
define void @llvmdb_PMetaSeq(i16 zeroext %n.arg) nounwind {
L.0:
	%n = alloca i16
	store i16 %n.arg, i16* %n
	%0 = load i16* %n
	call void @llvmdb_PSeq(i16 %0)
	%1 = load i32* @llvm_f
	%2 = getelementptr [16 x i8]* @.str522
	%3 = bitcast [16 x i8]* %2 to [0 x i8]*
	call void @out_str(i32 %1, [0 x i8]* %3)
	br label %return
return:
	ret void
}
define void @llvmdb_PTerminator(i8 zeroext %term.arg) nounwind {
L.0:
	%term = alloca i8
	store i8 %term.arg, i8* %term
	%0 = load i8* %term
	%1 = zext i8 %0 to i32
	switch i32 %1, label %L.1 [
		i32 1, label %L.3
		i32 0, label %L.4
		i32 2, label %L.5
	]
L.3:
	%2 = load i32* @llvm_f
	%3 = getelementptr [4 x i8]* @.str523
	%4 = bitcast [4 x i8]* %3 to [0 x i8]*
	call void @out_str(i32 %2, [0 x i8]* %4)
	br label %L.2
L.4:
	%5 = load i32* @llvm_f
	%6 = getelementptr [3 x i8]* @.str524
	%7 = bitcast [3 x i8]* %6 to [0 x i8]*
	call void @out_str(i32 %5, [0 x i8]* %7)
	br label %L.2
L.5:
	%8 = load i32* @llvm_f
	%9 = getelementptr [3 x i8]* @.str525
	%10 = bitcast [3 x i8]* %9 to [0 x i8]*
	call void @out_str(i32 %8, [0 x i8]* %10)
	br label %L.2
L.1:
	br label %L.2
L.2:
	br label %return
return:
	ret void
}
define void @llvmdb_PNull(i8 zeroext %term.arg) nounwind {
L.0:
	%term = alloca i8
	store i8 %term.arg, i8* %term
	%0 = load i32* @llvm_f
	%1 = getelementptr [5 x i8]* @.str526
	%2 = bitcast [5 x i8]* %1 to [0 x i8]*
	call void @out_str(i32 %0, [0 x i8]* %2)
	%3 = load i8* %term
	call void @llvmdb_PTerminator(i8 %3)
	br label %return
return:
	ret void
}
define void @llvmdb_PMetaRef(i16 zeroext %n.arg, i8 zeroext %term.arg) nounwind {
L.0:
	%n = alloca i16
	%term = alloca i8
	store i16 %n.arg, i16* %n
	store i8 %term.arg, i8* %term
	%0 = load i32* @llvm_f
	%1 = getelementptr [11 x i8]* @.str527
	%2 = bitcast [11 x i8]* %1 to [0 x i8]*
	call void @out_str(i32 %0, [0 x i8]* %2)
	%3 = load i32* @llvm_f
	%4 = load i16* %n
	%5 = zext i16 %4 to i32
	call void @out_uint(i32 %3, i32 %5)
	%6 = load i8* %term
	call void @llvmdb_PTerminator(i8 %6)
	br label %return
return:
	ret void
}
define void @llvmdb_PBoolean(i8 zeroext %b.arg, i8 zeroext %term.arg) nounwind {
L.0:
	%b = alloca i8
	%term = alloca i8
	store i8 %b.arg, i8* %b
	store i8 %term.arg, i8* %term
	%0 = load i32* @llvm_f
	%1 = getelementptr [4 x i8]* @.str528
	%2 = bitcast [4 x i8]* %1 to [0 x i8]*
	call void @out_str(i32 %0, [0 x i8]* %2)
	%3 = load i8* %b
	%4 = icmp ne i8 %3, 0
	br i1 %4, label %L.2, label %L.3
L.2:
	%5 = load i32* @llvm_f
	%6 = getelementptr [5 x i8]* @.str529
	%7 = bitcast [5 x i8]* %6 to [0 x i8]*
	call void @out_str(i32 %5, [0 x i8]* %7)
	br label %L.1
L.3:
	%8 = load i32* @llvm_f
	%9 = getelementptr [6 x i8]* @.str530
	%10 = bitcast [6 x i8]* %9 to [0 x i8]*
	call void @out_str(i32 %8, [0 x i8]* %10)
	br label %L.1
L.1:
	%11 = load i8* %term
	call void @llvmdb_PTerminator(i8 %11)
	br label %return
return:
	ret void
}
define void @llvmdb_P32(i32 %v.arg, i8 zeroext %term.arg) nounwind {
L.0:
	%v = alloca i32
	%term = alloca i8
	store i32 %v.arg, i32* %v
	store i8 %term.arg, i8* %term
	%0 = load i32* @llvm_f
	%1 = getelementptr [5 x i8]* @.str531
	%2 = bitcast [5 x i8]* %1 to [0 x i8]*
	call void @out_str(i32 %0, [0 x i8]* %2)
	%3 = load i32* @llvm_f
	%4 = load i32* %v
	call void @out_uint32(i32 %3, i32 %4)
	%5 = load i8* %term
	call void @llvmdb_PTerminator(i8 %5)
	br label %return
return:
	ret void
}
define void @llvmdb_P64(i64 %v.arg, i8 zeroext %term.arg) nounwind {
L.0:
	%v = alloca i64
	%term = alloca i8
	store i64 %v.arg, i64* %v
	store i8 %term.arg, i8* %term
	%0 = load i32* @llvm_f
	%1 = getelementptr [5 x i8]* @.str532
	%2 = bitcast [5 x i8]* %1 to [0 x i8]*
	call void @out_str(i32 %0, [0 x i8]* %2)
	%3 = load i32* @llvm_f
	%4 = load i64* %v
	call void @out_uint64(i32 %3, i64 %4)
	%5 = load i8* %term
	call void @llvmdb_PTerminator(i8 %5)
	br label %return
return:
	ret void
}
define void @llvmdb_PHeader(i16 zeroext %tag.arg, i16 zeroext %dwat.arg) nounwind {
L.0:
	%tag = alloca i16
	%dwat = alloca i16
	store i16 %tag.arg, i16* %tag
	store i16 %dwat.arg, i16* %dwat
	%0 = load i16* %tag
	call void @llvmdb_PMetaSeq(i16 %0)
	%1 = load i16* %dwat
	%2 = zext i16 %1 to i32
	%3 = add i32 %2, 589824
	call void @llvmdb_P32(i32 %3, i8 0)
	br label %return
return:
	ret void
}
define void @llvmdb_PString([0 x i8]* %s.arg, i8 zeroext %term.arg) nounwind {
L.0:
	%s = alloca [0 x i8]*
	%term = alloca i8
	store [0 x i8]* %s.arg, [0 x i8]** %s
	store i8 %term.arg, i8* %term
	%0 = load i32* @llvm_f
	%1 = getelementptr [12 x i8]* @.str533
	%2 = bitcast [12 x i8]* %1 to [0 x i8]*
	call void @out_str(i32 %0, [0 x i8]* %2)
	%3 = load [0 x i8]** %s
	%4 = icmp ne [0 x i8]* %3, null
	br i1 %4, label %L.2, label %L.1
L.2:
	%5 = load i32* @llvm_f
	%6 = load [0 x i8]** %s
	%7 = bitcast [0 x i8]* %6 to [0 x i8]*
	call void @out_str(i32 %5, [0 x i8]* %7)
	br label %L.1
L.1:
	%8 = load i32* @llvm_f
	call void @out_chr(i32 %8, i8 34)
	%9 = load i8* %term
	call void @llvmdb_PTerminator(i8 %9)
	br label %return
return:
	ret void
}
define void @llvmdb_PString2([0 x i8]* %s1.arg, [0 x i8]* %s2.arg, i8 zeroext %delim.arg, i8 zeroext %term.arg) nounwind {
L.0:
	%s1 = alloca [0 x i8]*
	%s2 = alloca [0 x i8]*
	%delim = alloca i8
	%term = alloca i8
	store [0 x i8]* %s1.arg, [0 x i8]** %s1
	store [0 x i8]* %s2.arg, [0 x i8]** %s2
	store i8 %delim.arg, i8* %delim
	store i8 %term.arg, i8* %term
	%0 = load i32* @llvm_f
	%1 = getelementptr [12 x i8]* @.str534
	%2 = bitcast [12 x i8]* %1 to [0 x i8]*
	call void @out_str(i32 %0, [0 x i8]* %2)
	%3 = load [0 x i8]** %s1
	%4 = icmp ne [0 x i8]* %3, null
	br i1 %4, label %L.2, label %L.1
L.2:
	%5 = load i32* @llvm_f
	%6 = load [0 x i8]** %s1
	%7 = bitcast [0 x i8]* %6 to [0 x i8]*
	call void @out_str(i32 %5, [0 x i8]* %7)
	%8 = load i32* @llvm_f
	%9 = load i8* %delim
	call void @out_chr(i32 %8, i8 %9)
	br label %L.1
L.1:
	%10 = load [0 x i8]** %s2
	%11 = icmp ne [0 x i8]* %10, null
	br i1 %11, label %L.4, label %L.3
L.4:
	%12 = load i32* @llvm_f
	%13 = load [0 x i8]** %s2
	%14 = bitcast [0 x i8]* %13 to [0 x i8]*
	call void @out_str(i32 %12, [0 x i8]* %14)
	br label %L.3
L.3:
	%15 = load i32* @llvm_f
	call void @out_chr(i32 %15, i8 34)
	%16 = load i8* %term
	call void @llvmdb_PTerminator(i8 %16)
	br label %return
return:
	ret void
}
define void @llvmdb_PSymbName(%symb.SymbNode* %s.arg, i8 zeroext %term.arg) nounwind {
L.0:
	%s = alloca %symb.SymbNode*
	%term = alloca i8
	store %symb.SymbNode* %s.arg, %symb.SymbNode** %s
	store i8 %term.arg, i8* %term
	%0 = load %symb.SymbNode** %s
	%1 = icmp ne %symb.SymbNode* %0, null
	br i1 %1, label %L.1, label %L.2
L.1:
	%2 = load %symb.SymbNode** %s
	%3 = getelementptr %symb.SymbNode* %2, i32 0, i32 19
	%4 = getelementptr [0 x i8]* %3
	%5 = call i8 @symb_IsAnon([0 x i8]* %4)
	%6 = icmp ne i8 %5, 0
	%7 = xor i1 %6, true
	br label %L.2
L.2:
	%8 = phi i1 [ false, %L.0 ], [ %7, %L.1 ]
	br i1 %8, label %L.4, label %L.5
L.4:
	%9 = load %symb.SymbNode** %s
	%10 = getelementptr %symb.SymbNode* %9, i32 0, i32 19
	%11 = getelementptr [0 x i8]* %10
	%12 = load i8* %term
	call void @llvmdb_PString([0 x i8]* %11, i8 %12)
	br label %L.3
L.5:
	%13 = load i8* %term
	call void @llvmdb_PString([0 x i8]* null, i8 %13)
	br label %L.3
L.3:
	br label %return
return:
	ret void
}
define void @llvmdb_PDispName(%symb.SymbNode* %s.arg, i8 zeroext %term.arg) nounwind {
L.0:
	%s = alloca %symb.SymbNode*
	%term = alloca i8
	store %symb.SymbNode* %s.arg, %symb.SymbNode** %s
	store i8 %term.arg, i8* %term
	%0 = load %symb.SymbNode** %s
	%1 = icmp ne %symb.SymbNode* %0, null
	br i1 %1, label %L.1, label %L.2
L.1:
	%2 = load %symb.SymbNode** %s
	%3 = getelementptr %symb.SymbNode* %2, i32 0, i32 19
	%4 = getelementptr [0 x i8]* %3
	%5 = call i8 @symb_IsAnon([0 x i8]* %4)
	%6 = icmp ne i8 %5, 0
	%7 = xor i1 %6, true
	br label %L.2
L.2:
	%8 = phi i1 [ false, %L.0 ], [ %7, %L.1 ]
	br i1 %8, label %L.4, label %L.5
L.4:
	%9 = load %symb.SymbNode** %s
	%10 = getelementptr %symb.SymbNode* %9, i32 0, i32 2
	%11 = load %symb.SymbNode** %10
	%12 = icmp ne %symb.SymbNode* %11, null
	br i1 %12, label %L.7, label %L.8
L.7:
	%13 = load %symb.SymbNode** %s
	%14 = getelementptr %symb.SymbNode* %13, i32 0, i32 2
	%15 = load %symb.SymbNode** %14
	%16 = getelementptr %symb.SymbNode* %15, i32 0, i32 19
	%17 = getelementptr [0 x i8]* %16
	%18 = load %symb.SymbNode** %s
	%19 = getelementptr %symb.SymbNode* %18, i32 0, i32 19
	%20 = getelementptr [0 x i8]* %19
	%21 = load i8* %term
	call void @llvmdb_PString2([0 x i8]* %17, [0 x i8]* %20, i8 46, i8 %21)
	br label %L.6
L.8:
	%22 = load %symb.SymbNode** %s
	%23 = getelementptr %symb.SymbNode* %22, i32 0, i32 19
	%24 = getelementptr [0 x i8]* %23
	%25 = load i8* %term
	call void @llvmdb_PString([0 x i8]* %24, i8 %25)
	br label %L.6
L.6:
	br label %L.3
L.5:
	%26 = load i8* %term
	call void @llvmdb_PString([0 x i8]* null, i8 %26)
	br label %L.3
L.3:
	br label %return
return:
	ret void
}
define void @llvmdb_PLinkName(%symb.SymbNode* %s.arg, i8 zeroext %term.arg) nounwind {
L.0:
	%s = alloca %symb.SymbNode*
	%term = alloca i8
	store %symb.SymbNode* %s.arg, %symb.SymbNode** %s
	store i8 %term.arg, i8* %term
	%0 = load %symb.SymbNode** %s
	%1 = icmp ne %symb.SymbNode* %0, null
	br i1 %1, label %L.1, label %L.2
L.1:
	%2 = load %symb.SymbNode** %s
	%3 = getelementptr %symb.SymbNode* %2, i32 0, i32 19
	%4 = getelementptr [0 x i8]* %3
	%5 = call i8 @symb_IsAnon([0 x i8]* %4)
	%6 = icmp ne i8 %5, 0
	%7 = xor i1 %6, true
	br label %L.2
L.2:
	%8 = phi i1 [ false, %L.0 ], [ %7, %L.1 ]
	br i1 %8, label %L.4, label %L.5
L.4:
	%9 = load %symb.SymbNode** %s
	%10 = getelementptr %symb.SymbNode* %9, i32 0, i32 2
	%11 = load %symb.SymbNode** %10
	%12 = icmp ne %symb.SymbNode* %11, null
	br i1 %12, label %L.7, label %L.8
L.7:
	%13 = load %symb.SymbNode** %s
	%14 = getelementptr %symb.SymbNode* %13, i32 0, i32 2
	%15 = load %symb.SymbNode** %14
	%16 = getelementptr %symb.SymbNode* %15, i32 0, i32 19
	%17 = getelementptr [0 x i8]* %16
	%18 = load %symb.SymbNode** %s
	%19 = getelementptr %symb.SymbNode* %18, i32 0, i32 19
	%20 = getelementptr [0 x i8]* %19
	%21 = load i8* %term
	call void @llvmdb_PString2([0 x i8]* %17, [0 x i8]* %20, i8 95, i8 %21)
	br label %L.6
L.8:
	%22 = load %symb.SymbNode** %s
	%23 = getelementptr %symb.SymbNode* %22, i32 0, i32 19
	%24 = getelementptr [0 x i8]* %23
	%25 = load i8* %term
	call void @llvmdb_PString([0 x i8]* %24, i8 %25)
	br label %L.6
L.6:
	br label %L.3
L.5:
	%26 = load i8* %term
	call void @llvmdb_PString([0 x i8]* null, i8 %26)
	br label %L.3
L.3:
	br label %return
return:
	ret void
}
define void @llvmdb_PContext(i8 zeroext %term.arg) nounwind {
L.0:
	%term = alloca i8
	store i8 %term.arg, i8* %term
	%tag = alloca i16
	%0 = load i16* @llvmdb_file
	store i16 %0, i16* %tag
	%1 = load i16* @llvmdb_pakg
	%2 = icmp ne i16 %1, 0
	br i1 %2, label %L.2, label %L.1
L.2:
	%3 = load i16* @llvmdb_pakg
	store i16 %3, i16* %tag
	br label %L.1
L.1:
	%4 = load i16* %tag
	%5 = load i8* %term
	call void @llvmdb_PMetaRef(i16 %4, i8 %5)
	br label %return
return:
	ret void
}
define void @llvmdb_CompileUnit([0 x i8]* %name.arg, i8 zeroext %opt.arg) nounwind {
L.0:
	%name = alloca [0 x i8]*
	%opt = alloca i8
	store [0 x i8]* %name.arg, [0 x i8]** %name
	store i8 %opt.arg, i8* %opt
	store i16 1, i16* @llvmdb_seqno
	%0 = load i16* @llvmdb_seqno
	store i16 %0, i16* @llvmdb_unit
	%1 = load i16* @llvmdb_unit
	call void @llvmdb_PHeader(i16 %1, i16 17)
	call void @llvmdb_P32(i32 0, i8 0)
	call void @llvmdb_P32(i32 4, i8 0)
	%2 = load [0 x i8]** %name
	%3 = bitcast [0 x i8]* %2 to [0 x i8]*
	call void @llvmdb_PString([0 x i8]* %3, i8 0)
	call void @llvmdb_PString([0 x i8]* null, i8 0)
	%4 = getelementptr [4 x i8]* @.str535
	%5 = bitcast [4 x i8]* %4 to [0 x i8]*
	call void @llvmdb_PString([0 x i8]* %5, i8 0)
	call void @llvmdb_PBoolean(i8 1, i8 0)
	%6 = load i8* %opt
	call void @llvmdb_PBoolean(i8 %6, i8 0)
	call void @llvmdb_PString([0 x i8]* null, i8 0)
	call void @llvmdb_P32(i32 0, i8 1)
	br label %return
return:
	ret void
}
define void @llvmdb_FileStart(%symb.SymbNode* %fs.arg) nounwind {
L.0:
	%fs = alloca %symb.SymbNode*
	store %symb.SymbNode* %fs.arg, %symb.SymbNode** %fs
	%i = alloca i16
	%name = alloca [0 x i8]*
	%0 = load %symb.SymbNode** %fs
	%1 = getelementptr %symb.SymbNode* %0, i32 0, i32 19
	%2 = bitcast [0 x i8]* %1 to [0 x i8]*
	store [0 x i8]* %2, [0 x i8]** %name
	%3 = load i16* @llvmdb_unit
	%4 = icmp eq i16 %3, 0
	br i1 %4, label %L.2, label %L.1
L.2:
	%5 = load [0 x i8]** %name
	%6 = bitcast [0 x i8]* %5 to [0 x i8]*
	call void @llvmdb_CompileUnit([0 x i8]* %6, i8 0)
	br label %L.1
L.1:
	%7 = load i16* @llvmdb_seqno
	%8 = add i16 %7, 1
	store i16 %8, i16* @llvmdb_seqno
	%9 = load i16* @llvmdb_seqno
	store i16 %9, i16* @llvmdb_file
	%10 = load i16* @llvmdb_file
	%11 = load %symb.SymbNode** %fs
	%12 = getelementptr %symb.SymbNode* %11, i32 0, i32 11
	store i16 %10, i16* %12
	%13 = load i16* @llvmdb_file
	call void @llvmdb_PHeader(i16 %13, i16 41)
	%14 = load [0 x i8]** %name
	%15 = bitcast [0 x i8]* %14 to [0 x i8]*
	%16 = call i32 @zstr_rfind([0 x i8]* %15, i8 47, i32 1024)
	%17 = trunc i32 %16 to i16
	store i16 %17, i16* %i
	%18 = load i16* %i
	%19 = zext i16 %18 to i32
	%20 = icmp eq i32 %19, 1024
	br i1 %20, label %L.4, label %L.5
L.4:
	%21 = load [0 x i8]** %name
	%22 = bitcast [0 x i8]* %21 to [0 x i8]*
	call void @llvmdb_PString([0 x i8]* %22, i8 0)
	%23 = getelementptr [1 x i8]* @.str536
	%24 = bitcast [1 x i8]* %23 to [0 x i8]*
	call void @llvmdb_PString([0 x i8]* %24, i8 0)
	br label %L.3
L.5:
	%25 = load [0 x i8]** %name
	%26 = load i16* %i
	%27 = zext i16 %26 to i32
	%28 = getelementptr [0 x i8]* %25, i32 0, i32 %27
	store i8 0, i8* %28
	%29 = load [0 x i8]** %name
	%30 = load i16* %i
	%31 = add i16 %30, 1
	%32 = zext i16 %31 to i32
	%33 = getelementptr [0 x i8]* %29, i32 0, i32 %32
	%34 = bitcast i8* %33 to [0 x i8]*
	%35 = getelementptr [0 x i8]* %34
	call void @llvmdb_PString([0 x i8]* %35, i8 0)
	%36 = load [0 x i8]** %name
	%37 = bitcast [0 x i8]* %36 to [0 x i8]*
	call void @llvmdb_PString([0 x i8]* %37, i8 0)
	br label %L.3
L.3:
	%38 = load i16* @llvmdb_unit
	call void @llvmdb_PMetaRef(i16 %38, i8 1)
	br label %return
return:
	ret void
}
define void @llvmdb_FileFinish(%symb.SymbNode* %fs.arg) nounwind {
L.0:
	%fs = alloca %symb.SymbNode*
	store %symb.SymbNode* %fs.arg, %symb.SymbNode** %fs
	%ps = alloca %symb.SymbNode*
	%0 = load %symb.SymbNode** %fs
	%1 = getelementptr %symb.SymbNode* %0, i32 0, i32 2
	%2 = load %symb.SymbNode** %1
	store %symb.SymbNode* %2, %symb.SymbNode** %ps
	%3 = load %symb.SymbNode** %ps
	%4 = icmp ne %symb.SymbNode* %3, null
	br i1 %4, label %L.2, label %L.3
L.2:
	%5 = load %symb.SymbNode** %ps
	%6 = getelementptr %symb.SymbNode* %5, i32 0, i32 11
	%7 = load i16* %6
	store i16 %7, i16* @llvmdb_file
	br label %L.1
L.3:
	store i16 0, i16* @llvmdb_file
	br label %L.1
L.1:
	br label %return
return:
	ret void
}
define void @llvmdb_PackageStart([0 x i8]* %name.arg) nounwind {
L.0:
	%name = alloca [0 x i8]*
	store [0 x i8]* %name.arg, [0 x i8]** %name
	%0 = load i16* @llvmdb_seqno
	%1 = add i16 %0, 1
	store i16 %1, i16* @llvmdb_seqno
	%2 = load i16* @llvmdb_seqno
	store i16 %2, i16* @llvmdb_pakg
	%3 = load i16* @llvmdb_pakg
	call void @llvmdb_PHeader(i16 %3, i16 57)
	%4 = load i16* @llvmdb_file
	call void @llvmdb_PMetaRef(i16 %4, i8 0)
	%5 = load [0 x i8]** %name
	%6 = bitcast [0 x i8]* %5 to [0 x i8]*
	call void @llvmdb_PString([0 x i8]* %6, i8 0)
	%7 = load i16* @llvmdb_file
	call void @llvmdb_PMetaRef(i16 %7, i8 1)
	br label %return
return:
	ret void
}
define void @llvmdb_PackageEnd() nounwind {
L.0:
	store i16 0, i16* @llvmdb_pakg
	br label %return
return:
	ret void
}
define i32 @llvmdb_DefFormals(%symb.SymbNode* %ps.arg) nounwind {
L.0:
	%rv.0 = alloca i32
	%ps = alloca %symb.SymbNode*
	store %symb.SymbNode* %ps.arg, %symb.SymbNode** %ps
	%fs = alloca %symb.SymbNode*
	%term = alloca i8
	%n = alloca i32
	store i32 0, i32* %n
	%0 = load %symb.SymbNode** %ps
	%1 = getelementptr %symb.SymbNode* %0, i32 0, i32 3
	%2 = load %symb.SymbNode** %1
	store %symb.SymbNode* %2, %symb.SymbNode** %fs
	br label %L.1
L.1:
	%3 = load %symb.SymbNode** %fs
	%4 = icmp ne %symb.SymbNode* %3, null
	%5 = xor i1 %4, true
	br i1 %5, label %L.2, label %L.3
L.3:
	%6 = load i32* %n
	%7 = add i32 %6, 1
	store i32 %7, i32* %n
	%8 = load %symb.SymbNode** %fs
	%9 = getelementptr %symb.SymbNode* %8, i32 0, i32 1
	%10 = load %type.TypeNode** %9
	%11 = call i16 @llvmdb_DefType(%type.TypeNode* %10)
	%12 = load %symb.SymbNode** %fs
	%13 = getelementptr %symb.SymbNode* %12, i32 0, i32 0
	%14 = load %symb.SymbNode** %13
	store %symb.SymbNode* %14, %symb.SymbNode** %fs
	br label %L.1
L.2:
	%15 = load i32* %n
	store i32 %15, i32* %rv.0
	br label %return
return:
	%16 = load i32* %rv.0
	ret i32 %16
}
define zeroext i16 @llvmdb_DefRetvs(%symb.SymbNode* %ps.arg) nounwind {
L.0:
	%rv.0 = alloca i16
	%ps = alloca %symb.SymbNode*
	store %symb.SymbNode* %ps.arg, %symb.SymbNode** %ps
	%retvs = alloca i16
	%tag = alloca i16
	%tl = alloca %type.TypeListEntry*
	%term = alloca i8
	%0 = load %symb.SymbNode** %ps
	%1 = getelementptr %symb.SymbNode* %0, i32 0, i32 4
	%2 = load %type.TypeListEntry** %1
	store %type.TypeListEntry* %2, %type.TypeListEntry** %tl
	%3 = load %type.TypeListEntry** %tl
	%4 = icmp eq %type.TypeListEntry* %3, null
	br i1 %4, label %L.2, label %L.1
L.2:
	store i16 0, i16* %rv.0
	br label %return
L.1:
	br label %L.3
L.3:
	%5 = load %type.TypeListEntry** %tl
	%6 = icmp ne %type.TypeListEntry* %5, null
	%7 = xor i1 %6, true
	br i1 %7, label %L.4, label %L.5
L.5:
	%8 = load %type.TypeListEntry** %tl
	%9 = getelementptr %type.TypeListEntry* %8, i32 0, i32 1
	%10 = load %type.TypeNode** %9
	%11 = call i16 @llvmdb_DefType(%type.TypeNode* %10)
	%12 = load %type.TypeListEntry** %tl
	%13 = getelementptr %type.TypeListEntry* %12, i32 0, i32 0
	%14 = load %type.TypeListEntry** %13
	store %type.TypeListEntry* %14, %type.TypeListEntry** %tl
	br label %L.3
L.4:
	%15 = load %symb.SymbNode** %ps
	%16 = getelementptr %symb.SymbNode* %15, i32 0, i32 4
	%17 = load %type.TypeListEntry** %16
	store %type.TypeListEntry* %17, %type.TypeListEntry** %tl
	%18 = load %type.TypeListEntry** %tl
	%19 = getelementptr %type.TypeListEntry* %18, i32 0, i32 0
	%20 = load %type.TypeListEntry** %19
	%21 = icmp eq %type.TypeListEntry* %20, null
	br i1 %21, label %L.7, label %L.8
L.7:
	%22 = load %type.TypeListEntry** %tl
	%23 = getelementptr %type.TypeListEntry* %22, i32 0, i32 1
	%24 = load %type.TypeNode** %23
	%25 = getelementptr %type.TypeNode* %24, i32 0, i32 10
	%26 = load i16* %25
	store i16 %26, i16* %retvs
	br label %L.6
L.8:
	%27 = load i16* @llvmdb_seqno
	%28 = add i16 %27, 1
	store i16 %28, i16* @llvmdb_seqno
	%29 = load i16* @llvmdb_seqno
	store i16 %29, i16* %retvs
	%30 = load i16* %retvs
	call void @llvmdb_PMetaSeq(i16 %30)
	store i8 0, i8* %term
	br label %L.9
L.9:
	%31 = load %type.TypeListEntry** %tl
	%32 = icmp ne %type.TypeListEntry* %31, null
	%33 = xor i1 %32, true
	br i1 %33, label %L.10, label %L.11
L.11:
	%34 = load %type.TypeListEntry** %tl
	%35 = getelementptr %type.TypeListEntry* %34, i32 0, i32 1
	%36 = load %type.TypeNode** %35
	%37 = getelementptr %type.TypeNode* %36, i32 0, i32 10
	%38 = load i16* %37
	store i16 %38, i16* %tag
	%39 = load %type.TypeListEntry** %tl
	%40 = getelementptr %type.TypeListEntry* %39, i32 0, i32 0
	%41 = load %type.TypeListEntry** %40
	store %type.TypeListEntry* %41, %type.TypeListEntry** %tl
	%42 = load %type.TypeListEntry** %tl
	%43 = icmp eq %type.TypeListEntry* %42, null
	br i1 %43, label %L.13, label %L.12
L.13:
	store i8 1, i8* %term
	br label %L.12
L.12:
	%44 = load i16* %tag
	%45 = load i8* %term
	call void @llvmdb_PMetaRef(i16 %44, i8 %45)
	br label %L.9
L.10:
	br label %L.6
L.6:
	%46 = load i16* %retvs
	store i16 %46, i16* %rv.0
	br label %return
return:
	%47 = load i16* %rv.0
	ret i16 %47
}
define zeroext i16 @llvmdb_DefSubroutine(%symb.SymbNode* %ps.arg, i8 zeroext %formals.arg) nounwind {
L.0:
	%rv.0 = alloca i16
	%ps = alloca %symb.SymbNode*
	%formals = alloca i8
	store %symb.SymbNode* %ps.arg, %symb.SymbNode** %ps
	store i8 %formals.arg, i8* %formals
	%tag = alloca i16
	%list = alloca i16
	%s = alloca %symb.SymbNode*
	%tl = alloca %type.TypeListEntry*
	%term = alloca i8
	%0 = load %symb.SymbNode** %ps
	%1 = getelementptr %symb.SymbNode* %0, i32 0, i32 4
	%2 = load %type.TypeListEntry** %1
	store %type.TypeListEntry* %2, %type.TypeListEntry** %tl
	br label %L.1
L.1:
	%3 = load %type.TypeListEntry** %tl
	%4 = icmp ne %type.TypeListEntry* %3, null
	%5 = xor i1 %4, true
	br i1 %5, label %L.2, label %L.3
L.3:
	%6 = load %type.TypeListEntry** %tl
	%7 = getelementptr %type.TypeListEntry* %6, i32 0, i32 1
	%8 = load %type.TypeNode** %7
	%9 = call i16 @llvmdb_DefType(%type.TypeNode* %8)
	%10 = load %type.TypeListEntry** %tl
	%11 = getelementptr %type.TypeListEntry* %10, i32 0, i32 0
	%12 = load %type.TypeListEntry** %11
	store %type.TypeListEntry* %12, %type.TypeListEntry** %tl
	br label %L.1
L.2:
	%13 = load i8* %formals
	%14 = icmp ne i8 %13, 0
	br i1 %14, label %L.5, label %L.4
L.5:
	%15 = load %symb.SymbNode** %ps
	%16 = getelementptr %symb.SymbNode* %15, i32 0, i32 3
	%17 = load %symb.SymbNode** %16
	store %symb.SymbNode* %17, %symb.SymbNode** %s
	br label %L.6
L.6:
	%18 = load %symb.SymbNode** %s
	%19 = icmp ne %symb.SymbNode* %18, null
	%20 = xor i1 %19, true
	br i1 %20, label %L.7, label %L.8
L.8:
	%21 = load %symb.SymbNode** %s
	%22 = getelementptr %symb.SymbNode* %21, i32 0, i32 1
	%23 = load %type.TypeNode** %22
	%24 = call i16 @llvmdb_DefType(%type.TypeNode* %23)
	%25 = load %symb.SymbNode** %s
	%26 = getelementptr %symb.SymbNode* %25, i32 0, i32 0
	%27 = load %symb.SymbNode** %26
	store %symb.SymbNode* %27, %symb.SymbNode** %s
	br label %L.6
L.7:
	br label %L.4
L.4:
	%28 = load i16* @llvmdb_seqno
	%29 = add i16 %28, 1
	store i16 %29, i16* @llvmdb_seqno
	%30 = load i16* @llvmdb_seqno
	store i16 %30, i16* %list
	%31 = load i16* %list
	call void @llvmdb_PMetaSeq(i16 %31)
	%32 = load %symb.SymbNode** %ps
	%33 = getelementptr %symb.SymbNode* %32, i32 0, i32 4
	%34 = load %type.TypeListEntry** %33
	store %type.TypeListEntry* %34, %type.TypeListEntry** %tl
	%35 = load i8* %formals
	%36 = icmp ne i8 %35, 0
	br i1 %36, label %L.10, label %L.11
L.10:
	%37 = load %symb.SymbNode** %ps
	%38 = getelementptr %symb.SymbNode* %37, i32 0, i32 3
	%39 = load %symb.SymbNode** %38
	store %symb.SymbNode* %39, %symb.SymbNode** %s
	br label %L.9
L.11:
	store %symb.SymbNode* null, %symb.SymbNode** %s
	br label %L.9
L.9:
	%40 = load %symb.SymbNode** %s
	%41 = icmp eq %symb.SymbNode* %40, null
	br i1 %41, label %L.13, label %L.14
L.13:
	store i8 1, i8* %term
	br label %L.12
L.14:
	store i8 0, i8* %term
	br label %L.12
L.12:
	%42 = load %type.TypeListEntry** %tl
	%43 = icmp eq %type.TypeListEntry* %42, null
	br i1 %43, label %L.16, label %L.17
L.16:
	%44 = load i8* %term
	call void @llvmdb_PNull(i8 %44)
	br label %L.15
L.17:
	br label %L.18
L.18:
	%45 = load %type.TypeListEntry** %tl
	%46 = icmp ne %type.TypeListEntry* %45, null
	%47 = xor i1 %46, true
	br i1 %47, label %L.19, label %L.20
L.20:
	%48 = load %type.TypeListEntry** %tl
	%49 = getelementptr %type.TypeListEntry* %48, i32 0, i32 1
	%50 = load %type.TypeNode** %49
	%51 = getelementptr %type.TypeNode* %50, i32 0, i32 10
	%52 = load i16* %51
	store i16 %52, i16* %tag
	%53 = load %type.TypeListEntry** %tl
	%54 = getelementptr %type.TypeListEntry* %53, i32 0, i32 0
	%55 = load %type.TypeListEntry** %54
	store %type.TypeListEntry* %55, %type.TypeListEntry** %tl
	%56 = load %type.TypeListEntry** %tl
	%57 = icmp eq %type.TypeListEntry* %56, null
	br i1 %57, label %L.21, label %L.22
L.21:
	%58 = load %symb.SymbNode** %s
	%59 = icmp eq %symb.SymbNode* %58, null
	br label %L.22
L.22:
	%60 = phi i1 [ false, %L.20 ], [ %59, %L.21 ]
	br i1 %60, label %L.24, label %L.23
L.24:
	store i8 1, i8* %term
	br label %L.23
L.23:
	%61 = load i16* %tag
	%62 = load i8* %term
	call void @llvmdb_PMetaRef(i16 %61, i8 %62)
	br label %L.18
L.19:
	br label %L.15
L.15:
	store i8 0, i8* %term
	br label %L.25
L.25:
	%63 = load %symb.SymbNode** %s
	%64 = icmp ne %symb.SymbNode* %63, null
	%65 = xor i1 %64, true
	br i1 %65, label %L.26, label %L.27
L.27:
	%66 = load %symb.SymbNode** %s
	%67 = getelementptr %symb.SymbNode* %66, i32 0, i32 1
	%68 = load %type.TypeNode** %67
	%69 = getelementptr %type.TypeNode* %68, i32 0, i32 10
	%70 = load i16* %69
	store i16 %70, i16* %tag
	%71 = load %symb.SymbNode** %s
	%72 = getelementptr %symb.SymbNode* %71, i32 0, i32 0
	%73 = load %symb.SymbNode** %72
	store %symb.SymbNode* %73, %symb.SymbNode** %s
	%74 = load %symb.SymbNode** %s
	%75 = icmp eq %symb.SymbNode* %74, null
	br i1 %75, label %L.29, label %L.28
L.29:
	store i8 1, i8* %term
	br label %L.28
L.28:
	%76 = load i16* %tag
	%77 = load i8* %term
	call void @llvmdb_PMetaRef(i16 %76, i8 %77)
	br label %L.25
L.26:
	%78 = load i16* @llvmdb_seqno
	%79 = add i16 %78, 1
	store i16 %79, i16* @llvmdb_seqno
	%80 = load i16* @llvmdb_seqno
	call void @llvmdb_PHeader(i16 %80, i16 21)
	%81 = load i16* @llvmdb_file
	call void @llvmdb_PMetaRef(i16 %81, i8 0)
	call void @llvmdb_PString([0 x i8]* null, i8 0)
	%82 = load i16* @llvmdb_file
	call void @llvmdb_PMetaRef(i16 %82, i8 0)
	call void @llvmdb_P32(i32 0, i8 0)
	call void @llvmdb_P64(i64 0, i8 0)
	call void @llvmdb_P64(i64 0, i8 0)
	call void @llvmdb_P64(i64 0, i8 0)
	call void @llvmdb_P32(i32 0, i8 0)
	call void @llvmdb_PNull(i8 0)
	%83 = load i16* %list
	call void @llvmdb_PMetaRef(i16 %83, i8 0)
	call void @llvmdb_P32(i32 0, i8 0)
	call void @llvmdb_PNull(i8 1)
	%84 = load i16* @llvmdb_seqno
	store i16 %84, i16* %rv.0
	br label %return
return:
	%85 = load i16* %rv.0
	ret i16 %85
}
define zeroext i16 @llvmdb_DefBasicType(i8 zeroext %dwtype.arg, %type.TypeNode* %t.arg) nounwind {
L.0:
	%rv.0 = alloca i16
	%dwtype = alloca i8
	%t = alloca %type.TypeNode*
	store i8 %dwtype.arg, i8* %dwtype
	store %type.TypeNode* %t.arg, %type.TypeNode** %t
	%0 = load i16* @llvmdb_seqno
	%1 = add i16 %0, 1
	store i16 %1, i16* @llvmdb_seqno
	%2 = load i16* @llvmdb_seqno
	call void @llvmdb_PHeader(i16 %2, i16 36)
	%3 = load i16* @llvmdb_unit
	call void @llvmdb_PMetaRef(i16 %3, i8 0)
	%4 = load %type.TypeNode** %t
	%5 = getelementptr %type.TypeNode* %4, i32 0, i32 2
	%6 = load %symb.SymbNode** %5
	call void @llvmdb_PSymbName(%symb.SymbNode* %6, i8 0)
	%7 = load i16* @llvmdb_file
	call void @llvmdb_PMetaRef(i16 %7, i8 0)
	call void @llvmdb_P32(i32 0, i8 0)
	%8 = load %type.TypeNode** %t
	%9 = getelementptr %type.TypeNode* %8, i32 0, i32 8
	%10 = load i32* %9
	%11 = zext i32 %10 to i64
	call void @llvmdb_P64(i64 %11, i8 0)
	%12 = load %type.TypeNode** %t
	%13 = getelementptr %type.TypeNode* %12, i32 0, i32 9
	%14 = load i32* %13
	%15 = zext i32 %14 to i64
	call void @llvmdb_P64(i64 %15, i8 0)
	call void @llvmdb_P64(i64 0, i8 0)
	call void @llvmdb_P32(i32 0, i8 0)
	%16 = load i8* %dwtype
	%17 = zext i8 %16 to i32
	call void @llvmdb_P32(i32 %17, i8 1)
	%18 = load i16* @llvmdb_seqno
	store i16 %18, i16* %rv.0
	br label %return
return:
	%19 = load i16* %rv.0
	ret i16 %19
}
define void @llvmdb_PTypeHeader(i16 zeroext %tag.arg, i16 zeroext %dwat.arg, %type.TypeNode* %t.arg) nounwind {
L.0:
	%tag = alloca i16
	%dwat = alloca i16
	%t = alloca %type.TypeNode*
	store i16 %tag.arg, i16* %tag
	store i16 %dwat.arg, i16* %dwat
	store %type.TypeNode* %t.arg, %type.TypeNode** %t
	%0 = load i16* %tag
	%1 = load i16* %dwat
	call void @llvmdb_PHeader(i16 %0, i16 %1)
	%2 = load i16* @llvmdb_file
	call void @llvmdb_PMetaRef(i16 %2, i8 0)
	%3 = load %type.TypeNode** %t
	%4 = getelementptr %type.TypeNode* %3, i32 0, i32 2
	%5 = load %symb.SymbNode** %4
	call void @llvmdb_PSymbName(%symb.SymbNode* %5, i8 0)
	%6 = load i16* @llvmdb_file
	call void @llvmdb_PMetaRef(i16 %6, i8 0)
	%7 = load %type.TypeNode** %t
	%8 = getelementptr %type.TypeNode* %7, i32 0, i32 2
	%9 = load %symb.SymbNode** %8
	%10 = icmp ne %symb.SymbNode* %9, null
	br i1 %10, label %L.2, label %L.3
L.2:
	%11 = load %type.TypeNode** %t
	%12 = getelementptr %type.TypeNode* %11, i32 0, i32 2
	%13 = load %symb.SymbNode** %12
	%14 = getelementptr %symb.SymbNode* %13, i32 0, i32 10
	%15 = load i16* %14
	%16 = zext i16 %15 to i32
	call void @llvmdb_P32(i32 %16, i8 0)
	br label %L.1
L.3:
	call void @llvmdb_P32(i32 0, i8 0)
	br label %L.1
L.1:
	%17 = load %type.TypeNode** %t
	%18 = getelementptr %type.TypeNode* %17, i32 0, i32 8
	%19 = load i32* %18
	%20 = zext i32 %19 to i64
	call void @llvmdb_P64(i64 %20, i8 0)
	%21 = load %type.TypeNode** %t
	%22 = getelementptr %type.TypeNode* %21, i32 0, i32 9
	%23 = load i32* %22
	%24 = zext i32 %23 to i64
	call void @llvmdb_P64(i64 %24, i8 0)
	call void @llvmdb_P64(i64 0, i8 0)
	call void @llvmdb_P32(i32 0, i8 0)
	br label %return
return:
	ret void
}
define zeroext i16 @llvmdb_DefRefType(%type.TypeNode* %t.arg) nounwind {
L.0:
	%rv.0 = alloca i16
	%t = alloca %type.TypeNode*
	store %type.TypeNode* %t.arg, %type.TypeNode** %t
	%tag = alloca i16
	%0 = load %type.TypeNode** %t
	%1 = getelementptr %type.TypeNode* %0, i32 0, i32 11
	%2 = load i8* %1
	%3 = icmp eq i8 %2, 7
	br i1 %3, label %L.2, label %L.3
L.2:
	%4 = load %type.TypeNode** %t
	%5 = getelementptr %type.TypeNode* %4, i32 0, i32 3
	%6 = load %symb.SymbNode** %5
	%7 = call i16 @llvmdb_DefSubroutine(%symb.SymbNode* %6, i8 1)
	store i16 %7, i16* %tag
	br label %L.1
L.3:
	%8 = load %type.TypeNode** %t
	%9 = getelementptr %type.TypeNode* %8, i32 0, i32 0
	%10 = load %type.TypeNode** %9
	%11 = call i16 @llvmdb_DefType(%type.TypeNode* %10)
	store i16 %11, i16* %tag
	br label %L.1
L.1:
	%12 = load i16* @llvmdb_seqno
	%13 = add i16 %12, 1
	store i16 %13, i16* @llvmdb_seqno
	%14 = load i16* @llvmdb_seqno
	%15 = load %type.TypeNode** %t
	call void @llvmdb_PTypeHeader(i16 %14, i16 15, %type.TypeNode* %15)
	%16 = load i16* %tag
	call void @llvmdb_PMetaRef(i16 %16, i8 1)
	%17 = load i16* @llvmdb_seqno
	store i16 %17, i16* %rv.0
	br label %return
return:
	%18 = load i16* %rv.0
	ret i16 %18
}
define zeroext i16 @llvmdb_DefRange(i64 %lo.arg, i64 %hi.arg) nounwind {
L.0:
	%rv.0 = alloca i16
	%lo = alloca i64
	%hi = alloca i64
	store i64 %lo.arg, i64* %lo
	store i64 %hi.arg, i64* %hi
	%0 = load i16* @llvmdb_seqno
	%1 = add i16 %0, 1
	store i16 %1, i16* @llvmdb_seqno
	%2 = load i16* @llvmdb_seqno
	call void @llvmdb_PHeader(i16 %2, i16 33)
	%3 = load i64* %lo
	call void @llvmdb_P64(i64 %3, i8 0)
	%4 = load i64* %hi
	call void @llvmdb_P64(i64 %4, i8 1)
	%5 = load i16* @llvmdb_seqno
	store i16 %5, i16* %rv.0
	br label %return
return:
	%6 = load i16* %rv.0
	ret i16 %6
}
define zeroext i16 @llvmdb_DefEnumConst(%symb.SymbNode* %s.arg) nounwind {
L.0:
	%rv.0 = alloca i16
	%s = alloca %symb.SymbNode*
	store %symb.SymbNode* %s.arg, %symb.SymbNode** %s
	%0 = load i16* @llvmdb_seqno
	%1 = add i16 %0, 1
	store i16 %1, i16* @llvmdb_seqno
	%2 = load i16* @llvmdb_seqno
	call void @llvmdb_PHeader(i16 %2, i16 40)
	%3 = load %symb.SymbNode** %s
	call void @llvmdb_PSymbName(%symb.SymbNode* %3, i8 0)
	%4 = load %symb.SymbNode** %s
	%5 = getelementptr %symb.SymbNode* %4, i32 0, i32 7
	%6 = load i64* %5
	call void @llvmdb_P64(i64 %6, i8 1)
	%7 = load i16* @llvmdb_seqno
	store i16 %7, i16* %rv.0
	br label %return
return:
	%8 = load i16* %rv.0
	ret i16 %8
}
define zeroext i16 @llvmdb_DefEnumerationType(%type.TypeNode* %t.arg) nounwind {
L.0:
	%rv.0 = alloca i16
	%t = alloca %type.TypeNode*
	store %type.TypeNode* %t.arg, %type.TypeNode** %t
	%tag = alloca i16
	%list = alloca i16
	%s = alloca %symb.SymbNode*
	%term = alloca i8
	%0 = load %type.TypeNode** %t
	%1 = getelementptr %type.TypeNode* %0, i32 0, i32 3
	%2 = load %symb.SymbNode** %1
	store %symb.SymbNode* %2, %symb.SymbNode** %s
	br label %L.1
L.1:
	%3 = load %symb.SymbNode** %s
	%4 = icmp ne %symb.SymbNode* %3, null
	%5 = xor i1 %4, true
	br i1 %5, label %L.2, label %L.3
L.3:
	%6 = load %symb.SymbNode** %s
	%7 = getelementptr %symb.SymbNode* %6, i32 0, i32 11
	%8 = load i16* %7
	%9 = icmp eq i16 %8, 0
	br i1 %9, label %L.5, label %L.4
L.5:
	%10 = load %symb.SymbNode** %s
	%11 = call i16 @llvmdb_DefEnumConst(%symb.SymbNode* %10)
	%12 = load %symb.SymbNode** %s
	%13 = getelementptr %symb.SymbNode* %12, i32 0, i32 11
	store i16 %11, i16* %13
	br label %L.4
L.4:
	%14 = load %symb.SymbNode** %s
	%15 = getelementptr %symb.SymbNode* %14, i32 0, i32 0
	%16 = load %symb.SymbNode** %15
	store %symb.SymbNode* %16, %symb.SymbNode** %s
	br label %L.1
L.2:
	%17 = load i16* @llvmdb_seqno
	%18 = add i16 %17, 1
	store i16 %18, i16* @llvmdb_seqno
	%19 = load i16* @llvmdb_seqno
	store i16 %19, i16* %list
	%20 = load i16* %list
	call void @llvmdb_PMetaSeq(i16 %20)
	store i8 0, i8* %term
	%21 = load %type.TypeNode** %t
	%22 = getelementptr %type.TypeNode* %21, i32 0, i32 3
	%23 = load %symb.SymbNode** %22
	store %symb.SymbNode* %23, %symb.SymbNode** %s
	br label %L.6
L.6:
	%24 = load %symb.SymbNode** %s
	%25 = icmp ne %symb.SymbNode* %24, null
	%26 = xor i1 %25, true
	br i1 %26, label %L.7, label %L.8
L.8:
	%27 = load %symb.SymbNode** %s
	%28 = getelementptr %symb.SymbNode* %27, i32 0, i32 11
	%29 = load i16* %28
	store i16 %29, i16* %tag
	%30 = load %symb.SymbNode** %s
	%31 = getelementptr %symb.SymbNode* %30, i32 0, i32 0
	%32 = load %symb.SymbNode** %31
	store %symb.SymbNode* %32, %symb.SymbNode** %s
	%33 = load %symb.SymbNode** %s
	%34 = icmp eq %symb.SymbNode* %33, null
	br i1 %34, label %L.10, label %L.9
L.10:
	store i8 1, i8* %term
	br label %L.9
L.9:
	%35 = load i16* %tag
	%36 = load i8* %term
	call void @llvmdb_PMetaRef(i16 %35, i8 %36)
	br label %L.6
L.7:
	%37 = load i16* @llvmdb_seqno
	%38 = add i16 %37, 1
	store i16 %38, i16* @llvmdb_seqno
	%39 = load i16* @llvmdb_seqno
	%40 = load %type.TypeNode** %t
	call void @llvmdb_PTypeHeader(i16 %39, i16 4, %type.TypeNode* %40)
	call void @llvmdb_PNull(i8 0)
	%41 = load i16* %list
	call void @llvmdb_PMetaRef(i16 %41, i8 0)
	call void @llvmdb_P32(i32 0, i8 0)
	call void @llvmdb_PNull(i8 1)
	%42 = load i16* @llvmdb_seqno
	store i16 %42, i16* %rv.0
	br label %return
return:
	%43 = load i16* %rv.0
	ret i16 %43
}
define zeroext i16 @llvmdb_DefArrayType(%type.TypeNode* %t.arg) nounwind {
L.0:
	%rv.0 = alloca i16
	%t = alloca %type.TypeNode*
	store %type.TypeNode* %t.arg, %type.TypeNode** %t
	%tagb = alloca i16
	%tagi = alloca i16
	%0 = load %type.TypeNode** %t
	%1 = getelementptr %type.TypeNode* %0, i32 0, i32 0
	%2 = load %type.TypeNode** %1
	%3 = call i16 @llvmdb_DefType(%type.TypeNode* %2)
	store i16 %3, i16* %tagb
	%4 = load %type.TypeNode** %t
	%5 = getelementptr %type.TypeNode* %4, i32 0, i32 16
	%6 = load i8* %5
	%7 = icmp ne i8 %6, 0
	br i1 %7, label %L.2, label %L.3
L.2:
	%8 = call i16 @llvmdb_DefRange(i64 0, i64 0)
	store i16 %8, i16* %tagi
	br label %L.1
L.3:
	%9 = load %type.TypeNode** %t
	%10 = getelementptr %type.TypeNode* %9, i32 0, i32 1
	%11 = load %type.TypeNode** %10
	%12 = icmp ne %type.TypeNode* %11, null
	br i1 %12, label %L.4, label %L.5
L.4:
	%13 = load %type.TypeNode** %t
	%14 = getelementptr %type.TypeNode* %13, i32 0, i32 1
	%15 = load %type.TypeNode** %14
	%16 = getelementptr %type.TypeNode* %15, i32 0, i32 11
	%17 = load i8* %16
	%18 = icmp eq i8 %17, 1
	br label %L.5
L.5:
	%19 = phi i1 [ false, %L.3 ], [ %18, %L.4 ]
	br i1 %19, label %L.7, label %L.8
L.7:
	%20 = load %type.TypeNode** %t
	%21 = getelementptr %type.TypeNode* %20, i32 0, i32 1
	%22 = load %type.TypeNode** %21
	%23 = call i16 @llvmdb_DefEnumerationType(%type.TypeNode* %22)
	store i16 %23, i16* %tagi
	br label %L.6
L.8:
	%24 = load %type.TypeNode** %t
	%25 = getelementptr %type.TypeNode* %24, i32 0, i32 5
	%26 = load i64* %25
	%27 = load %type.TypeNode** %t
	%28 = getelementptr %type.TypeNode* %27, i32 0, i32 6
	%29 = load i64* %28
	%30 = sub i64 %29, 1
	%31 = call i16 @llvmdb_DefRange(i64 %26, i64 %30)
	store i16 %31, i16* %tagi
	br label %L.6
L.6:
	br label %L.1
L.1:
	%32 = load i16* @llvmdb_seqno
	%33 = add i16 %32, 1
	store i16 %33, i16* @llvmdb_seqno
	%34 = load i16* @llvmdb_seqno
	%35 = load %type.TypeNode** %t
	call void @llvmdb_PTypeHeader(i16 %34, i16 1, %type.TypeNode* %35)
	%36 = load i16* %tagb
	call void @llvmdb_PMetaRef(i16 %36, i8 0)
	%37 = load i16* %tagi
	call void @llvmdb_PMetaRef(i16 %37, i8 0)
	call void @llvmdb_P32(i32 0, i8 0)
	call void @llvmdb_PNull(i8 1)
	%38 = load i16* @llvmdb_seqno
	store i16 %38, i16* %rv.0
	br label %return
return:
	%39 = load i16* %rv.0
	ret i16 %39
}
define zeroext i16 @llvmdb_DefField(%symb.SymbNode* %s.arg) nounwind {
L.0:
	%rv.0 = alloca i16
	%s = alloca %symb.SymbNode*
	store %symb.SymbNode* %s.arg, %symb.SymbNode** %s
	%tag = alloca i16
	%t = alloca %type.TypeNode*
	%0 = load %symb.SymbNode** %s
	%1 = getelementptr %symb.SymbNode* %0, i32 0, i32 1
	%2 = load %type.TypeNode** %1
	store %type.TypeNode* %2, %type.TypeNode** %t
	%3 = load %symb.SymbNode** %s
	%4 = getelementptr %symb.SymbNode* %3, i32 0, i32 1
	%5 = load %type.TypeNode** %4
	%6 = call i16 @llvmdb_DefType(%type.TypeNode* %5)
	store i16 %6, i16* %tag
	%7 = load i16* @llvmdb_seqno
	%8 = add i16 %7, 1
	store i16 %8, i16* @llvmdb_seqno
	%9 = load i16* @llvmdb_seqno
	call void @llvmdb_PHeader(i16 %9, i16 13)
	%10 = load i16* @llvmdb_file
	call void @llvmdb_PMetaRef(i16 %10, i8 0)
	%11 = load %symb.SymbNode** %s
	call void @llvmdb_PSymbName(%symb.SymbNode* %11, i8 0)
	%12 = load i16* @llvmdb_file
	call void @llvmdb_PMetaRef(i16 %12, i8 0)
	call void @llvmdb_P32(i32 0, i8 0)
	%13 = load %type.TypeNode** %t
	%14 = getelementptr %type.TypeNode* %13, i32 0, i32 8
	%15 = load i32* %14
	%16 = zext i32 %15 to i64
	call void @llvmdb_P64(i64 %16, i8 0)
	%17 = load %type.TypeNode** %t
	%18 = getelementptr %type.TypeNode* %17, i32 0, i32 9
	%19 = load i32* %18
	%20 = zext i32 %19 to i64
	call void @llvmdb_P64(i64 %20, i8 0)
	%21 = load %symb.SymbNode** %s
	%22 = getelementptr %symb.SymbNode* %21, i32 0, i32 9
	%23 = load i16* %22
	%24 = zext i16 %23 to i64
	call void @llvmdb_P64(i64 %24, i8 0)
	call void @llvmdb_P32(i32 0, i8 0)
	%25 = load i16* %tag
	call void @llvmdb_PMetaRef(i16 %25, i8 1)
	%26 = load i16* @llvmdb_seqno
	store i16 %26, i16* %rv.0
	br label %return
return:
	%27 = load i16* %rv.0
	ret i16 %27
}
define zeroext i16 @llvmdb_DefRecordType(%type.TypeNode* %t.arg) nounwind {
L.0:
	%rv.0 = alloca i16
	%t = alloca %type.TypeNode*
	store %type.TypeNode* %t.arg, %type.TypeNode** %t
	%tag = alloca i16
	%list = alloca i16
	%rec = alloca i16
	%s = alloca %symb.SymbNode*
	%term = alloca i8
	%0 = load i16* @llvmdb_seqno
	%1 = add i16 %0, 1
	store i16 %1, i16* @llvmdb_seqno
	%2 = load i16* @llvmdb_seqno
	store i16 %2, i16* %rec
	%3 = load i16* %rec
	%4 = load %type.TypeNode** %t
	%5 = getelementptr %type.TypeNode* %4, i32 0, i32 10
	store i16 %3, i16* %5
	%6 = load i16* @llvmdb_seqno
	%7 = add i16 %6, 1
	store i16 %7, i16* @llvmdb_seqno
	%8 = load i16* @llvmdb_seqno
	store i16 %8, i16* %list
	%9 = load i16* %rec
	%10 = load %type.TypeNode** %t
	call void @llvmdb_PTypeHeader(i16 %9, i16 19, %type.TypeNode* %10)
	call void @llvmdb_PNull(i8 0)
	%11 = load i16* %list
	call void @llvmdb_PMetaRef(i16 %11, i8 0)
	call void @llvmdb_P32(i32 0, i8 0)
	call void @llvmdb_PNull(i8 1)
	%12 = load %type.TypeNode** %t
	%13 = getelementptr %type.TypeNode* %12, i32 0, i32 3
	%14 = load %symb.SymbNode** %13
	store %symb.SymbNode* %14, %symb.SymbNode** %s
	br label %L.1
L.1:
	%15 = load %symb.SymbNode** %s
	%16 = icmp ne %symb.SymbNode* %15, null
	%17 = xor i1 %16, true
	br i1 %17, label %L.2, label %L.3
L.3:
	%18 = load %symb.SymbNode** %s
	%19 = getelementptr %symb.SymbNode* %18, i32 0, i32 11
	%20 = load i16* %19
	%21 = icmp eq i16 %20, 0
	br i1 %21, label %L.5, label %L.4
L.5:
	%22 = load %symb.SymbNode** %s
	%23 = call i16 @llvmdb_DefField(%symb.SymbNode* %22)
	%24 = load %symb.SymbNode** %s
	%25 = getelementptr %symb.SymbNode* %24, i32 0, i32 11
	store i16 %23, i16* %25
	br label %L.4
L.4:
	%26 = load %symb.SymbNode** %s
	%27 = getelementptr %symb.SymbNode* %26, i32 0, i32 0
	%28 = load %symb.SymbNode** %27
	store %symb.SymbNode* %28, %symb.SymbNode** %s
	br label %L.1
L.2:
	%29 = load i16* %list
	call void @llvmdb_PMetaSeq(i16 %29)
	store i8 0, i8* %term
	%30 = load %type.TypeNode** %t
	%31 = getelementptr %type.TypeNode* %30, i32 0, i32 3
	%32 = load %symb.SymbNode** %31
	store %symb.SymbNode* %32, %symb.SymbNode** %s
	br label %L.6
L.6:
	%33 = load %symb.SymbNode** %s
	%34 = icmp ne %symb.SymbNode* %33, null
	%35 = xor i1 %34, true
	br i1 %35, label %L.7, label %L.8
L.8:
	%36 = load %symb.SymbNode** %s
	%37 = getelementptr %symb.SymbNode* %36, i32 0, i32 11
	%38 = load i16* %37
	store i16 %38, i16* %tag
	%39 = load %symb.SymbNode** %s
	%40 = getelementptr %symb.SymbNode* %39, i32 0, i32 0
	%41 = load %symb.SymbNode** %40
	store %symb.SymbNode* %41, %symb.SymbNode** %s
	%42 = load %symb.SymbNode** %s
	%43 = icmp eq %symb.SymbNode* %42, null
	br i1 %43, label %L.10, label %L.9
L.10:
	store i8 1, i8* %term
	br label %L.9
L.9:
	%44 = load i16* %tag
	%45 = load i8* %term
	call void @llvmdb_PMetaRef(i16 %44, i8 %45)
	br label %L.6
L.7:
	%46 = load i16* %rec
	store i16 %46, i16* %rv.0
	br label %return
return:
	%47 = load i16* %rv.0
	ret i16 %47
}
define zeroext i16 @llvmdb_DefType(%type.TypeNode* %t.arg) nounwind {
L.0:
	%rv.0 = alloca i16
	%t = alloca %type.TypeNode*
	store %type.TypeNode* %t.arg, %type.TypeNode** %t
	%tag = alloca i16
	%0 = load %type.TypeNode** %t
	%1 = icmp eq %type.TypeNode* %0, null
	br i1 %1, label %L.2, label %L.1
L.2:
	store i16 0, i16* %rv.0
	br label %return
L.1:
	%2 = load %type.TypeNode** %t
	%3 = getelementptr %type.TypeNode* %2, i32 0, i32 10
	%4 = load i16* %3
	store i16 %4, i16* %tag
	%5 = load i16* %tag
	%6 = icmp eq i16 %5, 0
	br i1 %6, label %L.4, label %L.3
L.4:
	%7 = load %type.TypeNode** %t
	%8 = getelementptr %type.TypeNode* %7, i32 0, i32 11
	%9 = load i8* %8
	%10 = zext i8 %9 to i32
	switch i32 %10, label %L.5 [
		i32 1, label %L.7
		i32 2, label %L.8
		i32 3, label %L.9
		i32 4, label %L.10
		i32 7, label %L.10
		i32 5, label %L.11
		i32 6, label %L.12
	]
L.7:
	%11 = load %type.TypeNode** %t
	%12 = load %type.TypeNode** @type_booltype
	%13 = icmp eq %type.TypeNode* %11, %12
	br i1 %13, label %L.14, label %L.15
L.14:
	%14 = load %type.TypeNode** %t
	%15 = call i16 @llvmdb_DefBasicType(i8 2, %type.TypeNode* %14)
	store i16 %15, i16* %tag
	br label %L.13
L.15:
	%16 = load %type.TypeNode** %t
	%17 = call i16 @llvmdb_DefEnumerationType(%type.TypeNode* %16)
	store i16 %17, i16* %tag
	br label %L.13
L.13:
	br label %L.6
L.8:
	%18 = load %type.TypeNode** %t
	%19 = load %type.TypeNode** @type_bytetype
	%20 = icmp eq %type.TypeNode* %18, %19
	br i1 %20, label %L.17, label %L.18
L.17:
	%21 = load %type.TypeNode** %t
	%22 = call i16 @llvmdb_DefBasicType(i8 8, %type.TypeNode* %21)
	store i16 %22, i16* %tag
	br label %L.16
L.18:
	%23 = load %type.TypeNode** %t
	%24 = load %type.TypeNode** @type_wordtype
	%25 = icmp eq %type.TypeNode* %23, %24
	br i1 %25, label %L.26, label %L.25
L.25:
	%26 = load %type.TypeNode** %t
	%27 = getelementptr [4 x %type.TypeNode*]* @type_uinttypes, i32 0, i32 0
	%28 = load %type.TypeNode** %27
	%29 = icmp eq %type.TypeNode* %26, %28
	br label %L.26
L.26:
	%30 = phi i1 [ true, %L.18 ], [ %29, %L.25 ]
	br i1 %30, label %L.24, label %L.23
L.23:
	%31 = load %type.TypeNode** %t
	%32 = getelementptr [4 x %type.TypeNode*]* @type_uinttypes, i32 0, i32 1
	%33 = load %type.TypeNode** %32
	%34 = icmp eq %type.TypeNode* %31, %33
	br label %L.24
L.24:
	%35 = phi i1 [ true, %L.26 ], [ %34, %L.23 ]
	br i1 %35, label %L.22, label %L.21
L.21:
	%36 = load %type.TypeNode** %t
	%37 = getelementptr [4 x %type.TypeNode*]* @type_uinttypes, i32 0, i32 2
	%38 = load %type.TypeNode** %37
	%39 = icmp eq %type.TypeNode* %36, %38
	br label %L.22
L.22:
	%40 = phi i1 [ true, %L.24 ], [ %39, %L.21 ]
	br i1 %40, label %L.20, label %L.19
L.19:
	%41 = load %type.TypeNode** %t
	%42 = getelementptr [4 x %type.TypeNode*]* @type_uinttypes, i32 0, i32 3
	%43 = load %type.TypeNode** %42
	%44 = icmp eq %type.TypeNode* %41, %43
	br label %L.20
L.20:
	%45 = phi i1 [ true, %L.22 ], [ %44, %L.19 ]
	br i1 %45, label %L.28, label %L.29
L.28:
	%46 = load %type.TypeNode** %t
	%47 = call i16 @llvmdb_DefBasicType(i8 7, %type.TypeNode* %46)
	store i16 %47, i16* %tag
	br label %L.27
L.29:
	%48 = load %type.TypeNode** %t
	%49 = getelementptr %type.TypeNode* %48, i32 0, i32 5
	%50 = load i64* %49
	%51 = load %type.TypeNode** %t
	%52 = getelementptr %type.TypeNode* %51, i32 0, i32 6
	%53 = load i64* %52
	%54 = call i16 @llvmdb_DefRange(i64 %50, i64 %53)
	store i16 %54, i16* %tag
	br label %L.27
L.27:
	br label %L.16
L.16:
	br label %L.6
L.9:
	%55 = load %type.TypeNode** %t
	%56 = load %type.TypeNode** @type_swordtype
	%57 = icmp eq %type.TypeNode* %55, %56
	br i1 %57, label %L.37, label %L.36
L.36:
	%58 = load %type.TypeNode** %t
	%59 = getelementptr [4 x %type.TypeNode*]* @type_inttypes, i32 0, i32 0
	%60 = load %type.TypeNode** %59
	%61 = icmp eq %type.TypeNode* %58, %60
	br label %L.37
L.37:
	%62 = phi i1 [ true, %L.9 ], [ %61, %L.36 ]
	br i1 %62, label %L.35, label %L.34
L.34:
	%63 = load %type.TypeNode** %t
	%64 = getelementptr [4 x %type.TypeNode*]* @type_inttypes, i32 0, i32 1
	%65 = load %type.TypeNode** %64
	%66 = icmp eq %type.TypeNode* %63, %65
	br label %L.35
L.35:
	%67 = phi i1 [ true, %L.37 ], [ %66, %L.34 ]
	br i1 %67, label %L.33, label %L.32
L.32:
	%68 = load %type.TypeNode** %t
	%69 = getelementptr [4 x %type.TypeNode*]* @type_inttypes, i32 0, i32 2
	%70 = load %type.TypeNode** %69
	%71 = icmp eq %type.TypeNode* %68, %70
	br label %L.33
L.33:
	%72 = phi i1 [ true, %L.35 ], [ %71, %L.32 ]
	br i1 %72, label %L.31, label %L.30
L.30:
	%73 = load %type.TypeNode** %t
	%74 = getelementptr [4 x %type.TypeNode*]* @type_inttypes, i32 0, i32 3
	%75 = load %type.TypeNode** %74
	%76 = icmp eq %type.TypeNode* %73, %75
	br label %L.31
L.31:
	%77 = phi i1 [ true, %L.33 ], [ %76, %L.30 ]
	br i1 %77, label %L.39, label %L.40
L.39:
	%78 = load %type.TypeNode** %t
	%79 = call i16 @llvmdb_DefBasicType(i8 5, %type.TypeNode* %78)
	store i16 %79, i16* %tag
	br label %L.38
L.40:
	%80 = load %type.TypeNode** %t
	%81 = getelementptr %type.TypeNode* %80, i32 0, i32 5
	%82 = load i64* %81
	%83 = load %type.TypeNode** %t
	%84 = getelementptr %type.TypeNode* %83, i32 0, i32 6
	%85 = load i64* %84
	%86 = call i16 @llvmdb_DefRange(i64 %82, i64 %85)
	store i16 %86, i16* %tag
	br label %L.38
L.38:
	br label %L.6
L.10:
	%87 = load %type.TypeNode** %t
	%88 = call i16 @llvmdb_DefRefType(%type.TypeNode* %87)
	store i16 %88, i16* %tag
	br label %L.6
L.11:
	%89 = load %type.TypeNode** %t
	%90 = call i16 @llvmdb_DefArrayType(%type.TypeNode* %89)
	store i16 %90, i16* %tag
	br label %L.6
L.12:
	%91 = load %type.TypeNode** %t
	%92 = call i16 @llvmdb_DefRecordType(%type.TypeNode* %91)
	store i16 %92, i16* %tag
	br label %L.6
L.5:
	br label %L.6
L.6:
	%93 = load i16* %tag
	%94 = load %type.TypeNode** %t
	%95 = getelementptr %type.TypeNode* %94, i32 0, i32 10
	store i16 %93, i16* %95
	br label %L.3
L.3:
	%96 = load i16* %tag
	store i16 %96, i16* %rv.0
	br label %return
return:
	%97 = load i16* %rv.0
	ret i16 %97
}
define void @llvmdb_DefLines() nounwind {
L.0:
	%ln = alloca %llvmdb.LineT*
	%0 = load %llvmdb.LineT** @llvmdb_lnhead
	store %llvmdb.LineT* %0, %llvmdb.LineT** %ln
	br label %L.1
L.1:
	%1 = load %llvmdb.LineT** %ln
	%2 = icmp ne %llvmdb.LineT* %1, null
	%3 = xor i1 %2, true
	br i1 %3, label %L.2, label %L.3
L.3:
	%4 = load %llvmdb.LineT** %ln
	%5 = getelementptr %llvmdb.LineT* %4, i32 0, i32 1
	%6 = load i16* %5
	call void @llvmdb_PMetaSeq(i16 %6)
	%7 = load %llvmdb.LineT** %ln
	%8 = getelementptr %llvmdb.LineT* %7, i32 0, i32 2
	%9 = load i16* %8
	%10 = zext i16 %9 to i32
	call void @llvmdb_P32(i32 %10, i8 0)
	call void @llvmdb_P32(i32 0, i8 0)
	%11 = load %llvmdb.LineT** %ln
	%12 = getelementptr %llvmdb.LineT* %11, i32 0, i32 3
	%13 = load i16* %12
	call void @llvmdb_PMetaRef(i16 %13, i8 0)
	call void @llvmdb_PNull(i8 1)
	%14 = load %llvmdb.LineT** %ln
	%15 = getelementptr %llvmdb.LineT* %14, i32 0, i32 0
	%16 = load %llvmdb.LineT** %15
	store %llvmdb.LineT* %16, %llvmdb.LineT** %ln
	br label %L.1
L.2:
	store %llvmdb.LineT* null, %llvmdb.LineT** @llvmdb_lnhead
	store %llvmdb.LineT* null, %llvmdb.LineT** @llvmdb_lntail
	br label %return
return:
	ret void
}
define void @llvmdb_PLine(i16 zeroext %lineno.arg) nounwind {
L.0:
	%lineno = alloca i16
	store i16 %lineno.arg, i16* %lineno
	%tag = alloca i16
	%ln = alloca %llvmdb.LineT*
	%0 = load %llvmdb.LineT** @llvmdb_lntail
	%1 = icmp ne %llvmdb.LineT* %0, null
	br i1 %1, label %L.1, label %L.2
L.1:
	%2 = load %llvmdb.LineT** @llvmdb_lntail
	%3 = getelementptr %llvmdb.LineT* %2, i32 0, i32 2
	%4 = load i16* %3
	%5 = load i16* %lineno
	%6 = icmp eq i16 %4, %5
	br label %L.2
L.2:
	%7 = phi i1 [ false, %L.0 ], [ %6, %L.1 ]
	br i1 %7, label %L.4, label %L.5
L.4:
	%8 = load %llvmdb.LineT** @llvmdb_lntail
	%9 = getelementptr %llvmdb.LineT* %8, i32 0, i32 1
	%10 = load i16* %9
	store i16 %10, i16* %tag
	br label %L.3
L.5:
	%11 = load i16* @llvmdb_seqno
	%12 = add i16 %11, 1
	store i16 %12, i16* @llvmdb_seqno
	%13 = load i16* @llvmdb_seqno
	store i16 %13, i16* %tag
	%14 = call [0 x i8]* @sys_zalloc(i32 12)
	%15 = bitcast [0 x i8]* %14 to %llvmdb.LineT*
	store %llvmdb.LineT* %15, %llvmdb.LineT** %ln
	%16 = load i16* %tag
	%17 = load %llvmdb.LineT** %ln
	%18 = getelementptr %llvmdb.LineT* %17, i32 0, i32 1
	store i16 %16, i16* %18
	%19 = load i16* %lineno
	%20 = load %llvmdb.LineT** %ln
	%21 = getelementptr %llvmdb.LineT* %20, i32 0, i32 2
	store i16 %19, i16* %21
	%22 = call i16 @llvmdb_GetContext()
	%23 = load %llvmdb.LineT** %ln
	%24 = getelementptr %llvmdb.LineT* %23, i32 0, i32 3
	store i16 %22, i16* %24
	%25 = load %llvmdb.LineT** @llvmdb_lntail
	%26 = icmp eq %llvmdb.LineT* %25, null
	br i1 %26, label %L.7, label %L.8
L.7:
	%27 = load %llvmdb.LineT** %ln
	store %llvmdb.LineT* %27, %llvmdb.LineT** @llvmdb_lnhead
	br label %L.6
L.8:
	%28 = load %llvmdb.LineT** %ln
	%29 = load %llvmdb.LineT** @llvmdb_lntail
	%30 = getelementptr %llvmdb.LineT* %29, i32 0, i32 0
	store %llvmdb.LineT* %28, %llvmdb.LineT** %30
	br label %L.6
L.6:
	%31 = load %llvmdb.LineT** %ln
	store %llvmdb.LineT* %31, %llvmdb.LineT** @llvmdb_lntail
	br label %L.3
L.3:
	%32 = load i32* @llvm_f
	%33 = getelementptr [8 x i8]* @.str537
	%34 = bitcast [8 x i8]* %33 to [0 x i8]*
	call void @out_str(i32 %32, [0 x i8]* %34)
	%35 = load i16* %tag
	call void @llvmdb_PSeq(i16 %35)
	br label %return
return:
	ret void
}
define zeroext i16 @llvmdb_DefVar(%symb.SymbNode* %s.arg) nounwind {
L.0:
	%rv.0 = alloca i16
	%s = alloca %symb.SymbNode*
	store %symb.SymbNode* %s.arg, %symb.SymbNode** %s
	%tag = alloca i16
	%0 = load i16* @llvmdb_seqno
	%1 = add i16 %0, 1
	store i16 %1, i16* @llvmdb_seqno
	%2 = load i16* @llvmdb_seqno
	%3 = load %symb.SymbNode** %s
	%4 = getelementptr %symb.SymbNode* %3, i32 0, i32 11
	store i16 %2, i16* %4
	%5 = load %symb.SymbNode** %s
	%6 = getelementptr %symb.SymbNode* %5, i32 0, i32 13
	%7 = load i8* %6
	%8 = icmp eq i8 %7, 0
	br i1 %8, label %L.2, label %L.3
L.2:
	%9 = load i32* @llvm_f
	%10 = getelementptr [41 x i8]* @.str538
	%11 = bitcast [41 x i8]* %10 to [0 x i8]*
	call void @out_str(i32 %9, [0 x i8]* %11)
	%12 = load %symb.SymbNode** %s
	%13 = getelementptr %symb.SymbNode* %12, i32 0, i32 1
	%14 = load %type.TypeNode** %13
	call void @llvm_PType(%type.TypeNode* %14, i8 0)
	%15 = load i32* @llvm_f
	%16 = getelementptr [3 x i8]* @.str539
	%17 = bitcast [3 x i8]* %16 to [0 x i8]*
	call void @out_str(i32 %15, [0 x i8]* %17)
	%18 = load %symb.SymbNode** %s
	call void @llvm_PName(%symb.SymbNode* %18)
	%19 = load i32* @llvm_f
	%20 = getelementptr [4 x i8]* @.str540
	%21 = bitcast [4 x i8]* %20 to [0 x i8]*
	call void @out_str(i32 %19, [0 x i8]* %21)
	%22 = load i32* @llvm_f
	%23 = getelementptr [11 x i8]* @.str541
	%24 = bitcast [11 x i8]* %23 to [0 x i8]*
	call void @out_str(i32 %22, [0 x i8]* %24)
	%25 = load i32* @llvm_f
	%26 = load i16* @llvmdb_seqno
	%27 = zext i16 %26 to i32
	call void @out_uint(i32 %25, i32 %27)
	%28 = load i32* @llvm_f
	call void @out_chr(i32 %28, i8 41)
	%29 = load i32* @llvm_f
	call void @out_nl(i32 %29)
	%30 = load %symb.SymbNode** %s
	%31 = getelementptr %symb.SymbNode* %30, i32 0, i32 16
	%32 = load i8* %31
	%33 = icmp ne i8 %32, 0
	%34 = xor i1 %33, true
	br i1 %34, label %L.5, label %L.4
L.5:
	%35 = load %symb.SymbNode** %s
	%36 = getelementptr %symb.SymbNode* %35, i32 0, i32 0
	store %symb.SymbNode* null, %symb.SymbNode** %36
	%37 = load %symb.SymbNode** @llvmdb_lvtail
	%38 = icmp eq %symb.SymbNode* %37, null
	br i1 %38, label %L.7, label %L.8
L.7:
	%39 = load %symb.SymbNode** %s
	store %symb.SymbNode* %39, %symb.SymbNode** @llvmdb_lvhead
	br label %L.6
L.8:
	%40 = load %symb.SymbNode** %s
	%41 = load %symb.SymbNode** @llvmdb_lvtail
	%42 = getelementptr %symb.SymbNode* %41, i32 0, i32 0
	store %symb.SymbNode* %40, %symb.SymbNode** %42
	br label %L.6
L.6:
	%43 = load %symb.SymbNode** %s
	store %symb.SymbNode* %43, %symb.SymbNode** @llvmdb_lvtail
	br label %L.4
L.4:
	br label %L.1
L.3:
	%44 = load %symb.SymbNode** %s
	%45 = getelementptr %symb.SymbNode* %44, i32 0, i32 1
	%46 = load %type.TypeNode** %45
	%47 = call i16 @llvmdb_DefType(%type.TypeNode* %46)
	store i16 %47, i16* %tag
	%48 = load %symb.SymbNode** %s
	%49 = getelementptr %symb.SymbNode* %48, i32 0, i32 11
	%50 = load i16* %49
	call void @llvmdb_PHeader(i16 %50, i16 52)
	call void @llvmdb_P32(i32 0, i8 0)
	call void @llvmdb_PContext(i8 0)
	%51 = load %symb.SymbNode** %s
	call void @llvmdb_PSymbName(%symb.SymbNode* %51, i8 0)
	%52 = load %symb.SymbNode** %s
	call void @llvmdb_PDispName(%symb.SymbNode* %52, i8 0)
	%53 = load %symb.SymbNode** %s
	call void @llvmdb_PLinkName(%symb.SymbNode* %53, i8 0)
	%54 = load i16* @llvmdb_file
	call void @llvmdb_PMetaRef(i16 %54, i8 0)
	%55 = load %symb.SymbNode** %s
	%56 = getelementptr %symb.SymbNode* %55, i32 0, i32 10
	%57 = load i16* %56
	%58 = zext i16 %57 to i32
	call void @llvmdb_P32(i32 %58, i8 0)
	%59 = load i16* %tag
	call void @llvmdb_PMetaRef(i16 %59, i8 0)
	%60 = load %symb.SymbNode** %s
	%61 = getelementptr %symb.SymbNode* %60, i32 0, i32 13
	%62 = load i8* %61
	%63 = icmp eq i8 %62, 0
	%64 = zext i1 %63 to i8
	call void @llvmdb_PBoolean(i8 %64, i8 0)
	%65 = load %symb.SymbNode** %s
	%66 = getelementptr %symb.SymbNode* %65, i32 0, i32 13
	%67 = load i8* %66
	%68 = icmp ne i8 %67, 3
	%69 = zext i1 %68 to i8
	call void @llvmdb_PBoolean(i8 %69, i8 0)
	%70 = load %symb.SymbNode** %s
	%71 = getelementptr %symb.SymbNode* %70, i32 0, i32 1
	%72 = load %type.TypeNode** %71
	call void @llvm_PType(%type.TypeNode* %72, i8 0)
	%73 = load i32* @llvm_f
	%74 = getelementptr [3 x i8]* @.str542
	%75 = bitcast [3 x i8]* %74 to [0 x i8]*
	call void @out_str(i32 %73, [0 x i8]* %75)
	%76 = load %symb.SymbNode** %s
	call void @llvm_PName(%symb.SymbNode* %76)
	call void @llvmdb_PTerminator(i8 1)
	%77 = load %symb.SymbNode** %s
	%78 = getelementptr %symb.SymbNode* %77, i32 0, i32 0
	store %symb.SymbNode* null, %symb.SymbNode** %78
	%79 = load %symb.SymbNode** @llvmdb_gvtail
	%80 = icmp eq %symb.SymbNode* %79, null
	br i1 %80, label %L.10, label %L.11
L.10:
	%81 = load %symb.SymbNode** %s
	store %symb.SymbNode* %81, %symb.SymbNode** @llvmdb_gvhead
	%82 = load %symb.SymbNode** %s
	store %symb.SymbNode* %82, %symb.SymbNode** @llvmdb_gvtail
	br label %L.9
L.11:
	%83 = load %symb.SymbNode** %s
	%84 = load %symb.SymbNode** @llvmdb_gvtail
	%85 = getelementptr %symb.SymbNode* %84, i32 0, i32 0
	store %symb.SymbNode* %83, %symb.SymbNode** %85
	%86 = load %symb.SymbNode** %s
	store %symb.SymbNode* %86, %symb.SymbNode** @llvmdb_gvtail
	br label %L.9
L.9:
	br label %L.1
L.1:
	%87 = load i16* @llvmdb_seqno
	store i16 %87, i16* %rv.0
	br label %return
return:
	%88 = load i16* %rv.0
	ret i16 %88
}
define void @llvmdb_ProcStart(%symb.SymbNode* %ps.arg) nounwind {
L.0:
	%ps = alloca %symb.SymbNode*
	store %symb.SymbNode* %ps.arg, %symb.SymbNode** %ps
	%0 = load i16* @llvmdb_seqno
	%1 = add i16 %0, 1
	store i16 %1, i16* @llvmdb_seqno
	%2 = load i16* @llvmdb_seqno
	store i16 %2, i16* @llvmdb_subr
	%3 = load i16* @llvmdb_seqno
	%4 = add i16 %3, 1
	store i16 %4, i16* @llvmdb_seqno
	%5 = load i16* @llvmdb_seqno
	store i16 %5, i16* @llvmdb_blok
	br label %return
return:
	ret void
}
define void @llvmdb_ProcFinish(%symb.SymbNode* %ps.arg) nounwind {
L.0:
	%ps = alloca %symb.SymbNode*
	store %symb.SymbNode* %ps.arg, %symb.SymbNode** %ps
	%s = alloca %symb.SymbNode*
	%formals = alloca i16
	%retvs = alloca i16
	%stag = alloca i16
	%ttag = alloca i16
	call void @llvmdb_DefLines()
	%0 = load %symb.SymbNode** %ps
	%1 = call i32 @llvmdb_DefFormals(%symb.SymbNode* %0)
	%2 = trunc i32 %1 to i16
	store i16 %2, i16* %formals
	%3 = load %symb.SymbNode** %ps
	%4 = call i16 @llvmdb_DefRetvs(%symb.SymbNode* %3)
	store i16 %4, i16* %retvs
	%5 = load i16* @llvmdb_subr
	call void @llvmdb_PHeader(i16 %5, i16 46)
	call void @llvmdb_P32(i32 0, i8 0)
	call void @llvmdb_PContext(i8 0)
	%6 = load %symb.SymbNode** %ps
	call void @llvmdb_PSymbName(%symb.SymbNode* %6, i8 0)
	%7 = load %symb.SymbNode** %ps
	call void @llvmdb_PDispName(%symb.SymbNode* %7, i8 0)
	%8 = load %symb.SymbNode** %ps
	call void @llvmdb_PLinkName(%symb.SymbNode* %8, i8 0)
	%9 = load i16* @llvmdb_file
	call void @llvmdb_PMetaRef(i16 %9, i8 0)
	%10 = load %symb.SymbNode** %ps
	%11 = getelementptr %symb.SymbNode* %10, i32 0, i32 10
	%12 = load i16* %11
	%13 = zext i16 %12 to i32
	call void @llvmdb_P32(i32 %13, i8 0)
	%14 = load i16* %retvs
	%15 = icmp eq i16 %14, 0
	br i1 %15, label %L.2, label %L.3
L.2:
	call void @llvmdb_PNull(i8 0)
	br label %L.1
L.3:
	%16 = load i16* %retvs
	call void @llvmdb_PMetaRef(i16 %16, i8 0)
	br label %L.1
L.1:
	call void @llvmdb_PBoolean(i8 0, i8 0)
	%17 = load %symb.SymbNode** %ps
	%18 = getelementptr %symb.SymbNode* %17, i32 0, i32 13
	%19 = load i8* %18
	%20 = icmp ne i8 %19, 3
	%21 = zext i1 %20 to i8
	call void @llvmdb_PBoolean(i8 %21, i8 0)
	call void @llvmdb_P32(i32 0, i8 0)
	call void @llvmdb_P32(i32 0, i8 0)
	call void @llvmdb_PNull(i8 0)
	call void @llvmdb_P32(i32 256, i8 0)
	call void @llvmdb_PBoolean(i8 0, i8 0)
	%22 = load %symb.SymbNode** %ps
	%23 = getelementptr %symb.SymbNode* %22, i32 0, i32 4
	%24 = load %type.TypeListEntry** %23
	call void @llvm_PRetvType(%type.TypeListEntry* %24, i8 0)
	%25 = load i32* @llvm_f
	%26 = getelementptr [3 x i8]* @.str543
	%27 = bitcast [3 x i8]* %26 to [0 x i8]*
	call void @out_str(i32 %25, [0 x i8]* %27)
	%28 = load %symb.SymbNode** %ps
	%29 = getelementptr %symb.SymbNode* %28, i32 0, i32 3
	%30 = load %symb.SymbNode** %29
	store %symb.SymbNode* %30, %symb.SymbNode** %s
	br label %L.4
L.4:
	%31 = load %symb.SymbNode** %s
	%32 = icmp ne %symb.SymbNode* %31, null
	%33 = xor i1 %32, true
	br i1 %33, label %L.5, label %L.6
L.6:
	%34 = load %symb.SymbNode** %s
	%35 = getelementptr %symb.SymbNode* %34, i32 0, i32 1
	%36 = load %type.TypeNode** %35
	call void @llvm_PType(%type.TypeNode* %36, i8 0)
	%37 = load %symb.SymbNode** %s
	%38 = getelementptr %symb.SymbNode* %37, i32 0, i32 0
	%39 = load %symb.SymbNode** %38
	store %symb.SymbNode* %39, %symb.SymbNode** %s
	%40 = load %symb.SymbNode** %s
	%41 = icmp ne %symb.SymbNode* %40, null
	br i1 %41, label %L.8, label %L.7
L.8:
	%42 = load i32* @llvm_f
	%43 = getelementptr [3 x i8]* @.str544
	%44 = bitcast [3 x i8]* %43 to [0 x i8]*
	call void @out_str(i32 %42, [0 x i8]* %44)
	br label %L.7
L.7:
	br label %L.4
L.5:
	%45 = load i32* @llvm_f
	%46 = getelementptr [4 x i8]* @.str545
	%47 = bitcast [4 x i8]* %46 to [0 x i8]*
	call void @out_str(i32 %45, [0 x i8]* %47)
	%48 = load %symb.SymbNode** %ps
	call void @llvm_PName(%symb.SymbNode* %48)
	call void @llvmdb_PTerminator(i8 1)
	%49 = load i16* @llvmdb_subr
	%50 = load %symb.SymbNode** %ps
	%51 = getelementptr %symb.SymbNode* %50, i32 0, i32 11
	store i16 %49, i16* %51
	%52 = load %symb.SymbNode** %ps
	%53 = getelementptr %symb.SymbNode* %52, i32 0, i32 0
	store %symb.SymbNode* null, %symb.SymbNode** %53
	%54 = load %symb.SymbNode** @llvmdb_sptail
	%55 = icmp eq %symb.SymbNode* %54, null
	br i1 %55, label %L.10, label %L.11
L.10:
	%56 = load %symb.SymbNode** %ps
	store %symb.SymbNode* %56, %symb.SymbNode** @llvmdb_sphead
	br label %L.9
L.11:
	%57 = load %symb.SymbNode** %ps
	%58 = load %symb.SymbNode** @llvmdb_sptail
	%59 = getelementptr %symb.SymbNode* %58, i32 0, i32 0
	store %symb.SymbNode* %57, %symb.SymbNode** %59
	br label %L.9
L.9:
	%60 = load %symb.SymbNode** %ps
	store %symb.SymbNode* %60, %symb.SymbNode** @llvmdb_sptail
	%61 = load %symb.SymbNode** %ps
	%62 = getelementptr %symb.SymbNode* %61, i32 0, i32 3
	%63 = load %symb.SymbNode** %62
	store %symb.SymbNode* %63, %symb.SymbNode** %s
	br label %L.12
L.12:
	%64 = load %symb.SymbNode** %s
	%65 = icmp ne %symb.SymbNode* %64, null
	%66 = xor i1 %65, true
	br i1 %66, label %L.13, label %L.14
L.14:
	%67 = load %symb.SymbNode** %s
	%68 = getelementptr %symb.SymbNode* %67, i32 0, i32 1
	%69 = load %type.TypeNode** %68
	%70 = call i16 @llvmdb_DefType(%type.TypeNode* %69)
	store i16 %70, i16* %ttag
	%71 = load %symb.SymbNode** %s
	%72 = getelementptr %symb.SymbNode* %71, i32 0, i32 11
	%73 = load i16* %72
	store i16 %73, i16* %stag
	%74 = load i16* %stag
	%75 = icmp eq i16 %74, 0
	br i1 %75, label %L.16, label %L.15
L.16:
	%76 = load i16* @llvmdb_seqno
	%77 = add i16 %76, 1
	store i16 %77, i16* @llvmdb_seqno
	%78 = load i16* @llvmdb_seqno
	store i16 %78, i16* %stag
	br label %L.15
L.15:
	%79 = load i16* %stag
	call void @llvmdb_PHeader(i16 %79, i16 257)
	%80 = load i16* @llvmdb_subr
	call void @llvmdb_PMetaRef(i16 %80, i8 0)
	%81 = load %symb.SymbNode** %s
	call void @llvmdb_PSymbName(%symb.SymbNode* %81, i8 0)
	%82 = load i16* @llvmdb_file
	call void @llvmdb_PMetaRef(i16 %82, i8 0)
	%83 = load %symb.SymbNode** %s
	%84 = getelementptr %symb.SymbNode* %83, i32 0, i32 10
	%85 = load i16* %84
	%86 = zext i16 %85 to i32
	call void @llvmdb_P32(i32 %86, i8 0)
	%87 = load i16* %ttag
	call void @llvmdb_PMetaRef(i16 %87, i8 0)
	call void @llvmdb_P32(i32 0, i8 1)
	%88 = load %symb.SymbNode** %s
	%89 = getelementptr %symb.SymbNode* %88, i32 0, i32 0
	%90 = load %symb.SymbNode** %89
	store %symb.SymbNode* %90, %symb.SymbNode** %s
	br label %L.12
L.13:
	%91 = load i16* @llvmdb_blok
	call void @llvmdb_PHeader(i16 %91, i16 11)
	%92 = load i16* @llvmdb_subr
	call void @llvmdb_PMetaRef(i16 %92, i8 0)
	%93 = load %symb.SymbNode** %ps
	%94 = getelementptr %symb.SymbNode* %93, i32 0, i32 10
	%95 = load i16* %94
	%96 = zext i16 %95 to i32
	call void @llvmdb_P32(i32 %96, i8 0)
	call void @llvmdb_P32(i32 0, i8 0)
	%97 = load i16* @llvmdb_file
	call void @llvmdb_PMetaRef(i16 %97, i8 0)
	call void @llvmdb_P32(i32 0, i8 1)
	%98 = load %symb.SymbNode** @llvmdb_lvhead
	store %symb.SymbNode* %98, %symb.SymbNode** %s
	br label %L.17
L.17:
	%99 = load %symb.SymbNode** %s
	%100 = icmp ne %symb.SymbNode* %99, null
	%101 = xor i1 %100, true
	br i1 %101, label %L.18, label %L.19
L.19:
	%102 = load %symb.SymbNode** %s
	%103 = getelementptr %symb.SymbNode* %102, i32 0, i32 1
	%104 = load %type.TypeNode** %103
	%105 = call i16 @llvmdb_DefType(%type.TypeNode* %104)
	store i16 %105, i16* %ttag
	%106 = load %symb.SymbNode** %s
	%107 = getelementptr %symb.SymbNode* %106, i32 0, i32 11
	%108 = load i16* %107
	store i16 %108, i16* %stag
	%109 = load i16* %stag
	call void @llvmdb_PHeader(i16 %109, i16 256)
	%110 = load i16* @llvmdb_blok
	call void @llvmdb_PMetaRef(i16 %110, i8 0)
	%111 = load %symb.SymbNode** %s
	call void @llvmdb_PSymbName(%symb.SymbNode* %111, i8 0)
	%112 = load i16* @llvmdb_file
	call void @llvmdb_PMetaRef(i16 %112, i8 0)
	%113 = load %symb.SymbNode** %s
	%114 = getelementptr %symb.SymbNode* %113, i32 0, i32 10
	%115 = load i16* %114
	%116 = zext i16 %115 to i32
	call void @llvmdb_P32(i32 %116, i8 0)
	%117 = load i16* %ttag
	call void @llvmdb_PMetaRef(i16 %117, i8 1)
	%118 = load %symb.SymbNode** %s
	%119 = getelementptr %symb.SymbNode* %118, i32 0, i32 0
	%120 = load %symb.SymbNode** %119
	store %symb.SymbNode* %120, %symb.SymbNode** %s
	br label %L.17
L.18:
	store %symb.SymbNode* null, %symb.SymbNode** @llvmdb_lvhead
	store %symb.SymbNode* null, %symb.SymbNode** @llvmdb_lvtail
	store i16 0, i16* @llvmdb_subr
	store i16 0, i16* @llvmdb_blok
	br label %return
return:
	ret void
}
define void @llvmdb_ProgFinish() nounwind {
L.0:
	%s = alloca %symb.SymbNode*
	%tag = alloca i16
	%0 = load %symb.SymbNode** @llvmdb_gvhead
	store %symb.SymbNode* %0, %symb.SymbNode** %s
	%1 = load %symb.SymbNode** %s
	%2 = icmp ne %symb.SymbNode* %1, null
	br i1 %2, label %L.2, label %L.1
L.2:
	%3 = load i32* @llvm_f
	%4 = getelementptr [19 x i8]* @.str546
	%5 = bitcast [19 x i8]* %4 to [0 x i8]*
	call void @out_str(i32 %3, [0 x i8]* %5)
	br label %L.3
L.3:
	%6 = load %symb.SymbNode** %s
	%7 = icmp ne %symb.SymbNode* %6, null
	%8 = xor i1 %7, true
	br i1 %8, label %L.4, label %L.5
L.5:
	%9 = load %symb.SymbNode** %s
	%10 = getelementptr %symb.SymbNode* %9, i32 0, i32 11
	%11 = load i16* %10
	store i16 %11, i16* %tag
	%12 = load %symb.SymbNode** %s
	%13 = getelementptr %symb.SymbNode* %12, i32 0, i32 0
	%14 = load %symb.SymbNode** %13
	store %symb.SymbNode* %14, %symb.SymbNode** %s
	%15 = load i16* %tag
	call void @llvmdb_PSeq(i16 %15)
	%16 = load %symb.SymbNode** %s
	%17 = icmp eq %symb.SymbNode* %16, null
	br i1 %17, label %L.7, label %L.8
L.7:
	%18 = load i32* @llvm_f
	%19 = getelementptr [4 x i8]* @.str547
	%20 = bitcast [4 x i8]* %19 to [0 x i8]*
	call void @out_str(i32 %18, [0 x i8]* %20)
	br label %L.6
L.8:
	%21 = load i32* @llvm_f
	%22 = getelementptr [3 x i8]* @.str548
	%23 = bitcast [3 x i8]* %22 to [0 x i8]*
	call void @out_str(i32 %21, [0 x i8]* %23)
	br label %L.6
L.6:
	br label %L.3
L.4:
	br label %L.1
L.1:
	%24 = load %symb.SymbNode** @llvmdb_sphead
	store %symb.SymbNode* %24, %symb.SymbNode** %s
	%25 = load %symb.SymbNode** %s
	%26 = icmp ne %symb.SymbNode* %25, null
	br i1 %26, label %L.10, label %L.9
L.10:
	%27 = load i32* @llvm_f
	%28 = getelementptr [19 x i8]* @.str549
	%29 = bitcast [19 x i8]* %28 to [0 x i8]*
	call void @out_str(i32 %27, [0 x i8]* %29)
	br label %L.11
L.11:
	%30 = load %symb.SymbNode** %s
	%31 = icmp ne %symb.SymbNode* %30, null
	%32 = xor i1 %31, true
	br i1 %32, label %L.12, label %L.13
L.13:
	%33 = load %symb.SymbNode** %s
	%34 = getelementptr %symb.SymbNode* %33, i32 0, i32 11
	%35 = load i16* %34
	store i16 %35, i16* %tag
	%36 = load %symb.SymbNode** %s
	%37 = getelementptr %symb.SymbNode* %36, i32 0, i32 0
	%38 = load %symb.SymbNode** %37
	store %symb.SymbNode* %38, %symb.SymbNode** %s
	%39 = load i16* %tag
	call void @llvmdb_PSeq(i16 %39)
	%40 = load %symb.SymbNode** %s
	%41 = icmp eq %symb.SymbNode* %40, null
	br i1 %41, label %L.15, label %L.16
L.15:
	%42 = load i32* @llvm_f
	%43 = getelementptr [4 x i8]* @.str550
	%44 = bitcast [4 x i8]* %43 to [0 x i8]*
	call void @out_str(i32 %42, [0 x i8]* %44)
	br label %L.14
L.16:
	%45 = load i32* @llvm_f
	%46 = getelementptr [3 x i8]* @.str551
	%47 = bitcast [3 x i8]* %46 to [0 x i8]*
	call void @out_str(i32 %45, [0 x i8]* %47)
	br label %L.14
L.14:
	br label %L.11
L.12:
	br label %L.9
L.9:
	%48 = load i32* @llvm_f
	%49 = getelementptr [70 x i8]* @.str552
	%50 = bitcast [70 x i8]* %49 to [0 x i8]*
	call void @out_str(i32 %48, [0 x i8]* %50)
	br label %return
return:
	ret void
}
@llvm_pbytetype = internal global %type.TypeNode* zeroinitializer, align 4
@llvm_puinttype = internal global [4 x %type.TypeNode*] zeroinitializer, align 4
@llvm_Tseqno = internal global i16 0, align 2
@llvm_Pseqno = internal global i16 0, align 2
@llvm_Lseqno = internal global i16 0, align 2
@llvm_labthis = internal global i16 0, align 2
@llvm_loopexit = internal global i16 0, align 2
@llvm_UseIntrinsic = internal global [10 x i8] zeroinitializer, align 1
%llvm.dclnode = type {%llvm.dclnode*, %symb.SymbNode*, %ast.AstNode*}
@llvm_dclhead = internal global %llvm.dclnode* zeroinitializer, align 4
@llvm_dcltail = internal global %llvm.dclnode* zeroinitializer, align 4
define void @llvm_NeedDeclare(%ast.AstNode* %node.arg) nounwind {
L.0:
	%node = alloca %ast.AstNode*
	store %ast.AstNode* %node.arg, %ast.AstNode** %node
	%d = alloca %llvm.dclnode*
	%0 = call [0 x i8]* @sys_zalloc(i32 12)
	%1 = bitcast [0 x i8]* %0 to %llvm.dclnode*
	store %llvm.dclnode* %1, %llvm.dclnode** %d
	%2 = load %ast.AstNode** %node
	%3 = getelementptr %ast.AstNode* %2, i32 0, i32 10
	%4 = load %symb.SymbNode** %3
	%5 = load %llvm.dclnode** %d
	%6 = getelementptr %llvm.dclnode* %5, i32 0, i32 1
	store %symb.SymbNode* %4, %symb.SymbNode** %6
	%7 = load %ast.AstNode** %node
	%8 = load %llvm.dclnode** %d
	%9 = getelementptr %llvm.dclnode* %8, i32 0, i32 2
	store %ast.AstNode* %7, %ast.AstNode** %9
	%10 = load %llvm.dclnode** %d
	%11 = getelementptr %llvm.dclnode* %10, i32 0, i32 0
	store %llvm.dclnode* null, %llvm.dclnode** %11
	%12 = load %llvm.dclnode** @llvm_dclhead
	%13 = icmp eq %llvm.dclnode* %12, null
	br i1 %13, label %L.2, label %L.3
L.2:
	%14 = load %llvm.dclnode** %d
	store %llvm.dclnode* %14, %llvm.dclnode** @llvm_dclhead
	br label %L.1
L.3:
	%15 = load %llvm.dclnode** %d
	%16 = load %llvm.dclnode** @llvm_dcltail
	%17 = getelementptr %llvm.dclnode* %16, i32 0, i32 0
	store %llvm.dclnode* %15, %llvm.dclnode** %17
	br label %L.1
L.1:
	%18 = load %llvm.dclnode** %d
	store %llvm.dclnode* %18, %llvm.dclnode** @llvm_dcltail
	br label %return
return:
	ret void
}
define void @llvm_PEndLine(%ast.AstNode* %node.arg) nounwind {
L.0:
	%node = alloca %ast.AstNode*
	store %ast.AstNode* %node.arg, %ast.AstNode** %node
	%0 = getelementptr %A.148603888* @feature, i32 0, i32 3
	%1 = load i8* %0
	%2 = icmp ne i8 %1, 0
	br i1 %2, label %L.2, label %L.1
L.2:
	%3 = load %ast.AstNode** %node
	%4 = getelementptr %ast.AstNode* %3, i32 0, i32 4
	%5 = load i16* %4
	call void @llvmdb_PLine(i16 %5)
	br label %L.1
L.1:
	%6 = load i32* @llvm_f
	call void @out_nl(i32 %6)
	br label %return
return:
	ret void
}
define void @llvm_PTypeName(%type.TypeNode* %t.arg) nounwind {
L.0:
	%t = alloca %type.TypeNode*
	store %type.TypeNode* %t.arg, %type.TypeNode** %t
	%s = alloca %symb.SymbNode*
	%0 = load i32* @llvm_f
	%1 = getelementptr [2 x i8]* @.str553
	%2 = bitcast [2 x i8]* %1 to [0 x i8]*
	call void @out_str(i32 %0, [0 x i8]* %2)
	%3 = load %type.TypeNode** %t
	%4 = getelementptr %type.TypeNode* %3, i32 0, i32 2
	%5 = load %symb.SymbNode** %4
	store %symb.SymbNode* %5, %symb.SymbNode** %s
	%6 = load %symb.SymbNode** %s
	%7 = icmp ne %symb.SymbNode* %6, null
	br i1 %7, label %L.2, label %L.3
L.2:
	%8 = load %symb.SymbNode** %s
	%9 = getelementptr %symb.SymbNode* %8, i32 0, i32 2
	%10 = load %symb.SymbNode** %9
	%11 = icmp ne %symb.SymbNode* %10, null
	br i1 %11, label %L.5, label %L.4
L.5:
	%12 = load i32* @llvm_f
	%13 = load %symb.SymbNode** %s
	%14 = getelementptr %symb.SymbNode* %13, i32 0, i32 2
	%15 = load %symb.SymbNode** %14
	%16 = getelementptr %symb.SymbNode* %15, i32 0, i32 19
	%17 = getelementptr [0 x i8]* %16
	call void @out_str(i32 %12, [0 x i8]* %17)
	%18 = load i32* @llvm_f
	%19 = getelementptr [2 x i8]* @.str554
	%20 = bitcast [2 x i8]* %19 to [0 x i8]*
	call void @out_str(i32 %18, [0 x i8]* %20)
	br label %L.4
L.4:
	%21 = load i32* @llvm_f
	%22 = load %symb.SymbNode** %s
	%23 = getelementptr %symb.SymbNode* %22, i32 0, i32 19
	%24 = getelementptr [0 x i8]* %23
	call void @out_str(i32 %21, [0 x i8]* %24)
	br label %L.1
L.3:
	%25 = load i32* @llvm_f
	%26 = getelementptr [3 x i8]* @.str555
	%27 = bitcast [3 x i8]* %26 to [0 x i8]*
	call void @out_str(i32 %25, [0 x i8]* %27)
	%28 = load i32* @llvm_f
	%29 = load %type.TypeNode** %t
	%30 = ptrtoint %type.TypeNode* %29 to i32
	call void @out_uint(i32 %28, i32 %30)
	br label %L.1
L.1:
	br label %return
return:
	ret void
}
define void @llvm_PType(%type.TypeNode* %t.arg, i8 zeroext %opt.arg) nounwind {
L.0:
	%t = alloca %type.TypeNode*
	%opt = alloca i8
	store %type.TypeNode* %t.arg, %type.TypeNode** %t
	store i8 %opt.arg, i8* %opt
	%size = alloca i32
	%0 = load %type.TypeNode** %t
	%1 = icmp ne %type.TypeNode* %0, null
	br i1 %1, label %L.2, label %L.1
L.2:
	%2 = load %type.TypeNode** %t
	%3 = getelementptr %type.TypeNode* %2, i32 0, i32 11
	%4 = load i8* %3
	%5 = zext i8 %4 to i32
	switch i32 %5, label %L.3 [
		i32 1, label %L.5
		i32 2, label %L.5
		i32 3, label %L.5
		i32 4, label %L.6
		i32 6, label %L.7
		i32 5, label %L.8
		i32 7, label %L.9
	]
L.5:
	%6 = load i8* %opt
	%7 = icmp eq i8 %6, 1
	br i1 %7, label %L.11, label %L.12
L.11:
	%8 = load %type.TypeNode** %t
	%9 = getelementptr %type.TypeNode* %8, i32 0, i32 7
	%10 = load i32* %9
	store i32 %10, i32* %size
	br label %L.10
L.12:
	%11 = load %type.TypeNode** %t
	%12 = getelementptr %type.TypeNode* %11, i32 0, i32 7
	%13 = load i32* %12
	%14 = call i32 @target_isize(i32 %13)
	store i32 %14, i32* %size
	br label %L.10
L.10:
	%15 = load i32* @llvm_f
	%16 = getelementptr [2 x i8]* @.str556
	%17 = bitcast [2 x i8]* %16 to [0 x i8]*
	call void @out_str(i32 %15, [0 x i8]* %17)
	%18 = load i32* @llvm_f
	%19 = load i32* %size
	call void @out_uint(i32 %18, i32 %19)
	br label %L.4
L.6:
	%20 = load %type.TypeNode** %t
	%21 = getelementptr %type.TypeNode* %20, i32 0, i32 0
	%22 = load %type.TypeNode** %21
	call void @llvm_PType(%type.TypeNode* %22, i8 0)
	%23 = load i32* @llvm_f
	%24 = getelementptr [2 x i8]* @.str557
	%25 = bitcast [2 x i8]* %24 to [0 x i8]*
	call void @out_str(i32 %23, [0 x i8]* %25)
	br label %L.4
L.7:
	%26 = load %type.TypeNode** %t
	%27 = getelementptr %type.TypeNode* %26, i32 0, i32 12
	%28 = load i8* %27
	%29 = icmp eq i8 %28, 2
	br i1 %29, label %L.14, label %L.15
L.14:
	%30 = load %type.TypeNode** %t
	%31 = getelementptr %type.TypeNode* %30, i32 0, i32 7
	%32 = load i32* %31
	%33 = call i32 @target_isize(i32 %32)
	store i32 %33, i32* %size
	%34 = load i32* @llvm_f
	%35 = getelementptr [2 x i8]* @.str558
	%36 = bitcast [2 x i8]* %35 to [0 x i8]*
	call void @out_str(i32 %34, [0 x i8]* %36)
	%37 = load i32* @llvm_f
	%38 = load i32* %size
	call void @out_uint(i32 %37, i32 %38)
	br label %L.13
L.15:
	%39 = load %type.TypeNode** %t
	%40 = getelementptr %type.TypeNode* %39, i32 0, i32 19
	%41 = load i8* %40
	%42 = icmp ne i8 %41, 0
	br i1 %42, label %L.17, label %L.16
L.17:
	%43 = load %type.TypeNode** %t
	call void @llvm_PTypeName(%type.TypeNode* %43)
	br label %L.16
L.16:
	br label %L.13
L.13:
	br label %L.4
L.8:
	%44 = load %type.TypeNode** %t
	%45 = getelementptr %type.TypeNode* %44, i32 0, i32 12
	%46 = load i8* %45
	%47 = icmp eq i8 %46, 2
	br i1 %47, label %L.19, label %L.20
L.19:
	%48 = load %type.TypeNode** %t
	%49 = getelementptr %type.TypeNode* %48, i32 0, i32 7
	%50 = load i32* %49
	%51 = call i32 @target_isize(i32 %50)
	store i32 %51, i32* %size
	%52 = load i32* @llvm_f
	%53 = getelementptr [2 x i8]* @.str559
	%54 = bitcast [2 x i8]* %53 to [0 x i8]*
	call void @out_str(i32 %52, [0 x i8]* %54)
	%55 = load i32* @llvm_f
	%56 = load i32* %size
	call void @out_uint(i32 %55, i32 %56)
	br label %L.18
L.20:
	%57 = load i32* @llvm_f
	call void @out_chr(i32 %57, i8 91)
	%58 = load i32* @llvm_f
	%59 = load %type.TypeNode** %t
	%60 = getelementptr %type.TypeNode* %59, i32 0, i32 6
	%61 = load i64* %60
	%62 = trunc i64 %61 to i32
	call void @out_uint32(i32 %58, i32 %62)
	%63 = load i32* @llvm_f
	%64 = getelementptr [4 x i8]* @.str560
	%65 = bitcast [4 x i8]* %64 to [0 x i8]*
	call void @out_str(i32 %63, [0 x i8]* %65)
	%66 = load %type.TypeNode** %t
	%67 = getelementptr %type.TypeNode* %66, i32 0, i32 0
	%68 = load %type.TypeNode** %67
	call void @llvm_PType(%type.TypeNode* %68, i8 0)
	%69 = load i32* @llvm_f
	call void @out_chr(i32 %69, i8 93)
	br label %L.18
L.18:
	br label %L.4
L.9:
	%70 = load %type.TypeNode** %t
	%71 = getelementptr %type.TypeNode* %70, i32 0, i32 3
	%72 = load %symb.SymbNode** %71
	%73 = getelementptr %symb.SymbNode* %72, i32 0, i32 4
	%74 = load %type.TypeListEntry** %73
	call void @llvm_PRetvType(%type.TypeListEntry* %74, i8 0)
	%75 = load i32* @llvm_f
	call void @out_chr(i32 %75, i8 32)
	%76 = load %type.TypeNode** %t
	%77 = getelementptr %type.TypeNode* %76, i32 0, i32 3
	%78 = load %symb.SymbNode** %77
	%79 = getelementptr %symb.SymbNode* %78, i32 0, i32 3
	%80 = load %symb.SymbNode** %79
	call void @llvm_PParmTypes(%symb.SymbNode* %80)
	%81 = load i32* @llvm_f
	call void @out_chr(i32 %81, i8 42)
	br label %L.4
L.3:
	br label %L.4
L.4:
	br label %L.1
L.1:
	br label %return
return:
	ret void
}
define void @llvm_PExtend(%type.TypeNode* %t.arg) nounwind {
L.0:
	%t = alloca %type.TypeNode*
	store %type.TypeNode* %t.arg, %type.TypeNode** %t
	%0 = load %type.TypeNode** %t
	%1 = icmp ne %type.TypeNode* %0, null
	br i1 %1, label %L.2, label %L.1
L.2:
	%2 = load %type.TypeNode** %t
	%3 = getelementptr %type.TypeNode* %2, i32 0, i32 11
	%4 = load i8* %3
	%5 = zext i8 %4 to i32
	switch i32 %5, label %L.3 [
		i32 1, label %L.5
		i32 2, label %L.5
		i32 3, label %L.5
	]
L.5:
	%size = alloca i32
	%6 = load %type.TypeNode** %t
	%7 = getelementptr %type.TypeNode* %6, i32 0, i32 7
	%8 = load i32* %7
	%9 = call i32 @target_isize(i32 %8)
	store i32 %9, i32* %size
	%10 = load i32* %size
	%11 = load %type.TypeNode** @type_wordtype
	%12 = getelementptr %type.TypeNode* %11, i32 0, i32 7
	%13 = load i32* %12
	%14 = icmp ult i32 %10, %13
	br i1 %14, label %L.7, label %L.6
L.7:
	%15 = load %type.TypeNode** %t
	%16 = getelementptr %type.TypeNode* %15, i32 0, i32 11
	%17 = load i8* %16
	%18 = icmp eq i8 %17, 3
	br i1 %18, label %L.9, label %L.10
L.9:
	%19 = load i32* @llvm_f
	%20 = getelementptr [9 x i8]* @.str561
	%21 = bitcast [9 x i8]* %20 to [0 x i8]*
	call void @out_str(i32 %19, [0 x i8]* %21)
	br label %L.8
L.10:
	%22 = load i32* @llvm_f
	%23 = getelementptr [9 x i8]* @.str562
	%24 = bitcast [9 x i8]* %23 to [0 x i8]*
	call void @out_str(i32 %22, [0 x i8]* %24)
	br label %L.8
L.8:
	br label %L.6
L.6:
	br label %L.4
L.3:
	br label %L.4
L.4:
	br label %L.1
L.1:
	br label %return
return:
	ret void
}
define void @llvm_PRetvType(%type.TypeListEntry* %tl.arg, i8 zeroext %extend.arg) nounwind {
L.0:
	%tl = alloca %type.TypeListEntry*
	%extend = alloca i8
	store %type.TypeListEntry* %tl.arg, %type.TypeListEntry** %tl
	store i8 %extend.arg, i8* %extend
	%t = alloca %type.TypeNode*
	%0 = load %type.TypeListEntry** %tl
	%1 = icmp ne %type.TypeListEntry* %0, null
	br i1 %1, label %L.2, label %L.3
L.2:
	%2 = load %type.TypeListEntry** %tl
	%3 = getelementptr %type.TypeListEntry* %2, i32 0, i32 0
	%4 = load %type.TypeListEntry** %3
	%5 = icmp ne %type.TypeListEntry* %4, null
	br i1 %5, label %L.5, label %L.6
L.5:
	%6 = load i32* @llvm_f
	%7 = getelementptr [4 x i8]* @.str563
	%8 = bitcast [4 x i8]* %7 to [0 x i8]*
	call void @out_str(i32 %6, [0 x i8]* %8)
	br label %L.7
L.7:
	%9 = load %type.TypeListEntry** %tl
	%10 = getelementptr %type.TypeListEntry* %9, i32 0, i32 1
	%11 = load %type.TypeNode** %10
	call void @llvm_PType(%type.TypeNode* %11, i8 0)
	%12 = load %type.TypeListEntry** %tl
	%13 = getelementptr %type.TypeListEntry* %12, i32 0, i32 0
	%14 = load %type.TypeListEntry** %13
	store %type.TypeListEntry* %14, %type.TypeListEntry** %tl
	%15 = load %type.TypeListEntry** %tl
	%16 = icmp eq %type.TypeListEntry* %15, null
	br i1 %16, label %L.8, label %L.9
L.9:
	%17 = load i32* @llvm_f
	%18 = getelementptr [3 x i8]* @.str564
	%19 = bitcast [3 x i8]* %18 to [0 x i8]*
	call void @out_str(i32 %17, [0 x i8]* %19)
	br label %L.7
L.8:
	%20 = load i32* @llvm_f
	%21 = getelementptr [3 x i8]* @.str565
	%22 = bitcast [3 x i8]* %21 to [0 x i8]*
	call void @out_str(i32 %20, [0 x i8]* %22)
	br label %L.4
L.6:
	%23 = load %type.TypeListEntry** %tl
	%24 = getelementptr %type.TypeListEntry* %23, i32 0, i32 1
	%25 = load %type.TypeNode** %24
	store %type.TypeNode* %25, %type.TypeNode** %t
	%26 = load i8* %extend
	%27 = icmp ne i8 %26, 0
	br i1 %27, label %L.11, label %L.10
L.11:
	%28 = load %type.TypeNode** %t
	call void @llvm_PExtend(%type.TypeNode* %28)
	br label %L.10
L.10:
	%29 = load i32* @llvm_f
	call void @out_chr(i32 %29, i8 32)
	%30 = load %type.TypeNode** %t
	call void @llvm_PType(%type.TypeNode* %30, i8 0)
	br label %L.4
L.4:
	br label %L.1
L.3:
	%31 = load i32* @llvm_f
	%32 = getelementptr [6 x i8]* @.str566
	%33 = bitcast [6 x i8]* %32 to [0 x i8]*
	call void @out_str(i32 %31, [0 x i8]* %33)
	br label %L.1
L.1:
	br label %return
return:
	ret void
}
define void @llvm_PParmTypes(%symb.SymbNode* %s.arg) nounwind {
L.0:
	%s = alloca %symb.SymbNode*
	store %symb.SymbNode* %s.arg, %symb.SymbNode** %s
	%0 = load i32* @llvm_f
	call void @out_chr(i32 %0, i8 40)
	br label %L.1
L.1:
	%1 = load %symb.SymbNode** %s
	%2 = icmp ne %symb.SymbNode* %1, null
	%3 = xor i1 %2, true
	br i1 %3, label %L.2, label %L.3
L.3:
	%4 = load %symb.SymbNode** %s
	%5 = getelementptr %symb.SymbNode* %4, i32 0, i32 1
	%6 = load %type.TypeNode** %5
	call void @llvm_PType(%type.TypeNode* %6, i8 0)
	%7 = load %symb.SymbNode** %s
	%8 = getelementptr %symb.SymbNode* %7, i32 0, i32 0
	%9 = load %symb.SymbNode** %8
	store %symb.SymbNode* %9, %symb.SymbNode** %s
	%10 = load %symb.SymbNode** %s
	%11 = icmp eq %symb.SymbNode* %10, null
	br i1 %11, label %L.2, label %L.4
L.4:
	%12 = load i32* @llvm_f
	%13 = getelementptr [3 x i8]* @.str567
	%14 = bitcast [3 x i8]* %13 to [0 x i8]*
	call void @out_str(i32 %12, [0 x i8]* %14)
	br label %L.1
L.2:
	%15 = load i32* @llvm_f
	call void @out_chr(i32 %15, i8 41)
	br label %return
return:
	ret void
}
define void @llvm_ConstantRef(%type.TypeNode* %t.arg, %ast.AstNode* %node.arg) nounwind {
L.0:
	%t = alloca %type.TypeNode*
	%node = alloca %ast.AstNode*
	store %type.TypeNode* %t.arg, %type.TypeNode** %t
	store %ast.AstNode* %node.arg, %ast.AstNode** %node
	%v = alloca i64
	%0 = load %ast.AstNode** %node
	%1 = getelementptr %ast.AstNode* %0, i32 0, i32 8
	%2 = load i64* %1
	store i64 %2, i64* %v
	%3 = load i64* %v
	%4 = icmp eq i64 %3, 0
	br i1 %4, label %L.2, label %L.3
L.2:
	%5 = load i32* @llvm_f
	%6 = getelementptr [5 x i8]* @.str568
	%7 = bitcast [5 x i8]* %6 to [0 x i8]*
	call void @out_str(i32 %5, [0 x i8]* %7)
	br label %L.1
L.3:
	%8 = load i32* @llvm_f
	%9 = getelementptr [10 x i8]* @.str569
	%10 = bitcast [10 x i8]* %9 to [0 x i8]*
	call void @out_str(i32 %8, [0 x i8]* %10)
	%11 = load %type.TypeNode** @type_wordtype
	call void @llvm_PType(%type.TypeNode* %11, i8 0)
	%12 = load i32* @llvm_f
	call void @out_chr(i32 %12, i8 32)
	%13 = load i32* @llvm_f
	%14 = load i64* %v
	call void @out_uint64(i32 %13, i64 %14)
	%15 = load i32* @llvm_f
	%16 = getelementptr [5 x i8]* @.str570
	%17 = bitcast [5 x i8]* %16 to [0 x i8]*
	call void @out_str(i32 %15, [0 x i8]* %17)
	%18 = load %type.TypeNode** %t
	%19 = icmp eq %type.TypeNode* %18, null
	br i1 %19, label %L.5, label %L.6
L.5:
	%20 = load %ast.AstNode** %node
	%21 = getelementptr %ast.AstNode* %20, i32 0, i32 9
	%22 = load %type.TypeNode** %21
	call void @llvm_PType(%type.TypeNode* %22, i8 0)
	%23 = load i32* @llvm_f
	call void @out_chr(i32 %23, i8 42)
	br label %L.4
L.6:
	%24 = load %type.TypeNode** %t
	call void @llvm_PType(%type.TypeNode* %24, i8 0)
	br label %L.4
L.4:
	%25 = load i32* @llvm_f
	call void @out_chr(i32 %25, i8 41)
	br label %L.1
L.1:
	br label %return
return:
	ret void
}
define void @llvm_NodeType(%ast.AstNode* %node.arg) nounwind {
L.0:
	%node = alloca %ast.AstNode*
	store %ast.AstNode* %node.arg, %ast.AstNode** %node
	%0 = load %ast.AstNode** %node
	%1 = getelementptr %ast.AstNode* %0, i32 0, i32 1
	%2 = load i8* %1
	%3 = zext i8 %2 to i32
	switch i32 %3, label %L.1 [
		i32 0, label %L.3
		i32 4, label %L.4
		i32 5, label %L.5
		i32 6, label %L.5
		i32 7, label %L.6
	]
L.3:
	%4 = load i32* @llvm_f
	%5 = getelementptr [5 x i8]* @.str571
	%6 = bitcast [5 x i8]* %5 to [0 x i8]*
	call void @out_str(i32 %4, [0 x i8]* %6)
	br label %L.2
L.4:
	%7 = load %ast.AstNode** %node
	%8 = getelementptr %ast.AstNode* %7, i32 0, i32 9
	%9 = load %type.TypeNode** %8
	call void @llvm_PType(%type.TypeNode* %9, i8 0)
	%10 = load i32* @llvm_f
	%11 = getelementptr [2 x i8]* @.str572
	%12 = bitcast [2 x i8]* %11 to [0 x i8]*
	call void @out_str(i32 %10, [0 x i8]* %12)
	br label %L.2
L.5:
	%13 = load %ast.AstNode** %node
	%14 = getelementptr %ast.AstNode* %13, i32 0, i32 9
	%15 = load %type.TypeNode** %14
	call void @llvm_PType(%type.TypeNode* %15, i8 0)
	br label %L.2
L.6:
	%16 = load %ast.AstNode** %node
	%17 = getelementptr %ast.AstNode* %16, i32 0, i32 9
	%18 = load %type.TypeNode** %17
	call void @llvm_PType(%type.TypeNode* %18, i8 0)
	br label %L.2
L.1:
	%19 = load i32* @llvm_f
	%20 = getelementptr [2 x i8]* @.str573
	%21 = bitcast [2 x i8]* %20 to [0 x i8]*
	call void @out_str(i32 %19, [0 x i8]* %21)
	%22 = load i32* @llvm_f
	%23 = load %ast.AstNode** %node
	%24 = getelementptr %ast.AstNode* %23, i32 0, i32 2
	%25 = load i8* %24
	%26 = zext i8 %25 to i32
	call void @out_uint(i32 %22, i32 %26)
	br label %L.2
L.2:
	br label %return
return:
	ret void
}
define void @llvm_PPkgPfx(%symb.SymbNode* %s.arg) nounwind {
L.0:
	%s = alloca %symb.SymbNode*
	store %symb.SymbNode* %s.arg, %symb.SymbNode** %s
	%0 = load %symb.SymbNode** %s
	%1 = getelementptr %symb.SymbNode* %0, i32 0, i32 2
	%2 = load %symb.SymbNode** %1
	%3 = icmp ne %symb.SymbNode* %2, null
	br i1 %3, label %L.2, label %L.1
L.2:
	%4 = load %symb.SymbNode** %s
	%5 = getelementptr %symb.SymbNode* %4, i32 0, i32 2
	%6 = load %symb.SymbNode** %5
	call void @llvm_PPkgPfx(%symb.SymbNode* %6)
	br label %L.1
L.1:
	%7 = load i32* @llvm_f
	%8 = load %symb.SymbNode** %s
	%9 = getelementptr %symb.SymbNode* %8, i32 0, i32 19
	%10 = getelementptr [0 x i8]* %9
	call void @out_str(i32 %7, [0 x i8]* %10)
	%11 = load i32* @llvm_f
	call void @out_chr(i32 %11, i8 95)
	br label %return
return:
	ret void
}
define void @llvm_PName(%symb.SymbNode* %s.arg) nounwind {
L.0:
	%s = alloca %symb.SymbNode*
	store %symb.SymbNode* %s.arg, %symb.SymbNode** %s
	%0 = load %symb.SymbNode** %s
	%1 = getelementptr %symb.SymbNode* %0, i32 0, i32 13
	%2 = load i8* %1
	%3 = zext i8 %2 to i32
	switch i32 %3, label %L.1 [
		i32 0, label %L.3
		i32 1, label %L.4
		i32 5, label %L.4
		i32 2, label %L.5
		i32 3, label %L.5
		i32 4, label %L.6
	]
L.3:
	%4 = load i32* @llvm_f
	call void @out_chr(i32 %4, i8 37)
	%5 = load i32* @llvm_f
	%6 = load %symb.SymbNode** %s
	%7 = getelementptr %symb.SymbNode* %6, i32 0, i32 19
	%8 = getelementptr [0 x i8]* %7
	call void @out_str(i32 %5, [0 x i8]* %8)
	br label %L.2
L.4:
	%9 = load i32* @llvm_f
	call void @out_chr(i32 %9, i8 64)
	%10 = load %symb.SymbNode** %s
	%11 = getelementptr %symb.SymbNode* %10, i32 0, i32 2
	%12 = load %symb.SymbNode** %11
	%13 = icmp ne %symb.SymbNode* %12, null
	br i1 %13, label %L.8, label %L.7
L.8:
	%14 = load %symb.SymbNode** %s
	%15 = getelementptr %symb.SymbNode* %14, i32 0, i32 2
	%16 = load %symb.SymbNode** %15
	call void @llvm_PPkgPfx(%symb.SymbNode* %16)
	br label %L.7
L.7:
	%17 = load i32* @llvm_f
	%18 = load %symb.SymbNode** %s
	%19 = getelementptr %symb.SymbNode* %18, i32 0, i32 19
	%20 = getelementptr [0 x i8]* %19
	call void @out_str(i32 %17, [0 x i8]* %20)
	br label %L.2
L.5:
	%21 = load i32* @llvm_f
	call void @out_chr(i32 %21, i8 64)
	%22 = load i32* @llvm_f
	%23 = load %symb.SymbNode** %s
	%24 = getelementptr %symb.SymbNode* %23, i32 0, i32 19
	%25 = getelementptr [0 x i8]* %24
	call void @out_str(i32 %22, [0 x i8]* %25)
	br label %L.2
L.6:
	%26 = load i32* @llvm_f
	%27 = getelementptr [10 x i8]* @.str574
	%28 = bitcast [10 x i8]* %27 to [0 x i8]*
	call void @out_str(i32 %26, [0 x i8]* %28)
	%29 = load %type.TypeNode** @type_wordtype
	call void @llvm_PType(%type.TypeNode* %29, i8 0)
	%30 = load i32* @llvm_f
	call void @out_chr(i32 %30, i8 32)
	%31 = load i32* @llvm_f
	%32 = load %symb.SymbNode** %s
	%33 = getelementptr %symb.SymbNode* %32, i32 0, i32 8
	%34 = load i64* %33
	call void @out_uint64(i32 %31, i64 %34)
	%35 = load i32* @llvm_f
	%36 = getelementptr [5 x i8]* @.str575
	%37 = bitcast [5 x i8]* %36 to [0 x i8]*
	call void @out_str(i32 %35, [0 x i8]* %37)
	%38 = load %symb.SymbNode** %s
	%39 = getelementptr %symb.SymbNode* %38, i32 0, i32 12
	%40 = load i8* %39
	%41 = icmp eq i8 %40, 5
	br i1 %41, label %L.10, label %L.11
L.10:
	%42 = load %symb.SymbNode** %s
	%43 = getelementptr %symb.SymbNode* %42, i32 0, i32 4
	%44 = load %type.TypeListEntry** %43
	call void @llvm_PRetvType(%type.TypeListEntry* %44, i8 1)
	%45 = load %symb.SymbNode** %s
	%46 = getelementptr %symb.SymbNode* %45, i32 0, i32 3
	%47 = load %symb.SymbNode** %46
	call void @llvm_PParmTypes(%symb.SymbNode* %47)
	br label %L.9
L.11:
	%48 = load %symb.SymbNode** %s
	%49 = getelementptr %symb.SymbNode* %48, i32 0, i32 1
	%50 = load %type.TypeNode** %49
	call void @llvm_PType(%type.TypeNode* %50, i8 0)
	br label %L.9
L.9:
	%51 = load i32* @llvm_f
	%52 = getelementptr [3 x i8]* @.str576
	%53 = bitcast [3 x i8]* %52 to [0 x i8]*
	call void @out_str(i32 %51, [0 x i8]* %53)
	br label %L.2
L.1:
	br label %L.2
L.2:
	br label %return
return:
	ret void
}
define void @llvm_PTempName(i16 zeroext %n.arg) nounwind {
L.0:
	%n = alloca i16
	store i16 %n.arg, i16* %n
	%0 = load i32* @llvm_f
	call void @out_chr(i32 %0, i8 37)
	%1 = load i32* @llvm_f
	%2 = load i16* %n
	%3 = sub i16 %2, 1
	%4 = zext i16 %3 to i32
	call void @out_uint(i32 %1, i32 %4)
	br label %return
return:
	ret void
}
define void @llvm_NodeName(%ast.AstNode* %node.arg) nounwind {
L.0:
	%node = alloca %ast.AstNode*
	store %ast.AstNode* %node.arg, %ast.AstNode** %node
	%s = alloca %symb.SymbNode*
	%0 = load %ast.AstNode** %node
	%1 = getelementptr %ast.AstNode* %0, i32 0, i32 10
	%2 = load %symb.SymbNode** %1
	store %symb.SymbNode* %2, %symb.SymbNode** %s
	%3 = load %symb.SymbNode** %s
	%4 = icmp ne %symb.SymbNode* %3, null
	br i1 %4, label %L.2, label %L.3
L.2:
	%5 = load %symb.SymbNode** %s
	call void @llvm_PName(%symb.SymbNode* %5)
	br label %L.1
L.3:
	%6 = load i32* @llvm_f
	%7 = getelementptr [11 x i8]* @.str577
	%8 = bitcast [11 x i8]* %7 to [0 x i8]*
	call void @out_str(i32 %6, [0 x i8]* %8)
	br label %L.1
L.1:
	br label %return
return:
	ret void
}
define void @llvm_NodeDst(%ast.AstNode* %node.arg) nounwind {
L.0:
	%node = alloca %ast.AstNode*
	store %ast.AstNode* %node.arg, %ast.AstNode** %node
	%0 = load %ast.AstNode** %node
	%1 = getelementptr %ast.AstNode* %0, i32 0, i32 0
	%2 = load i8* %1
	%3 = zext i8 %2 to i32
	switch i32 %3, label %L.1 [
		i32 7, label %L.3
		i32 9, label %L.4
		i32 5, label %L.4
	]
L.3:
	call void @lex_Error(i8 64)
	br label %L.2
L.4:
	%4 = load %ast.AstNode** %node
	call void @llvm_NodeName(%ast.AstNode* %4)
	br label %L.2
L.1:
	%5 = load %ast.AstNode** %node
	%6 = getelementptr %ast.AstNode* %5, i32 0, i32 7
	%7 = load i16* %6
	call void @llvm_PTempName(i16 %7)
	br label %L.2
L.2:
	br label %return
return:
	ret void
}
define void @llvm_NodeSrc(%ast.AstNode* %node.arg) nounwind {
L.0:
	%node = alloca %ast.AstNode*
	store %ast.AstNode* %node.arg, %ast.AstNode** %node
	%0 = load %ast.AstNode** %node
	%1 = getelementptr %ast.AstNode* %0, i32 0, i32 0
	%2 = load i8* %1
	%3 = zext i8 %2 to i32
	switch i32 %3, label %L.1 [
		i32 7, label %L.3
		i32 9, label %L.4
	]
L.3:
	%4 = load %ast.AstNode** %node
	%5 = getelementptr %ast.AstNode* %4, i32 0, i32 1
	%6 = load i8* %5
	%7 = zext i8 %6 to i32
	switch i32 %7, label %L.5 [
		i32 1, label %L.7
		i32 2, label %L.7
		i32 3, label %L.8
		i32 4, label %L.9
		i32 5, label %L.10
		i32 6, label %L.10
	]
L.7:
	%8 = load i32* @llvm_f
	%9 = load %ast.AstNode** %node
	%10 = getelementptr %ast.AstNode* %9, i32 0, i32 8
	%11 = load i64* %10
	call void @out_uint64(i32 %8, i64 %11)
	br label %L.6
L.8:
	%12 = load i32* @llvm_f
	%13 = load %ast.AstNode** %node
	%14 = getelementptr %ast.AstNode* %13, i32 0, i32 8
	%15 = load i64* %14
	call void @out_int64(i32 %12, i64 %15)
	br label %L.6
L.9:
	%16 = load %ast.AstNode** %node
	call void @llvm_ConstantRef(%type.TypeNode* null, %ast.AstNode* %16)
	br label %L.6
L.10:
	%17 = load i32* @llvm_f
	%18 = load %ast.AstNode** %node
	%19 = getelementptr %ast.AstNode* %18, i32 0, i32 8
	%20 = load i64* %19
	call void @out_uint64(i32 %17, i64 %20)
	br label %L.6
L.5:
	br label %L.6
L.6:
	br label %L.2
L.4:
	%21 = load %ast.AstNode** %node
	call void @llvm_NodeName(%ast.AstNode* %21)
	br label %L.2
L.1:
	%22 = load %ast.AstNode** %node
	%23 = getelementptr %ast.AstNode* %22, i32 0, i32 7
	%24 = load i16* %23
	call void @llvm_PTempName(i16 %24)
	br label %L.2
L.2:
	br label %return
return:
	ret void
}
define void @llvm_Print([0 x i8]* %fmt.arg, %ast.AstNode* %anode.arg) nounwind {
L.0:
	%fmt = alloca [0 x i8]*
	%anode = alloca %ast.AstNode*
	store [0 x i8]* %fmt.arg, [0 x i8]** %fmt
	store %ast.AstNode* %anode.arg, %ast.AstNode** %anode
	%i = alloca i32
	%c = alloca i8
	%n = alloca i16
	%node = alloca %ast.AstNode*
	store i32 0, i32* %i
	br label %L.1
L.1:
	%0 = load [0 x i8]** %fmt
	%1 = load i32* %i
	%2 = getelementptr [0 x i8]* %0, i32 0, i32 %1
	%3 = load i8* %2
	store i8 %3, i8* %c
	%4 = load i8* %c
	%5 = icmp eq i8 %4, 0
	br i1 %5, label %L.2, label %L.3
L.3:
	%6 = load i8* %c
	%7 = icmp eq i8 %6, 37
	br i1 %7, label %L.5, label %L.6
L.5:
	%8 = load i32* %i
	%9 = add i32 %8, 1
	store i32 %9, i32* %i
	%10 = load [0 x i8]** %fmt
	%11 = load i32* %i
	%12 = getelementptr [0 x i8]* %10, i32 0, i32 %11
	%13 = load i8* %12
	store i8 %13, i8* %c
	%14 = load %ast.AstNode** %anode
	store %ast.AstNode* %14, %ast.AstNode** %node
	%15 = load i8* %c
	%16 = zext i8 %15 to i32
	switch i32 %16, label %L.7 [
		i32 48, label %L.9
		i32 49, label %L.9
		i32 50, label %L.9
		i32 51, label %L.9
		i32 52, label %L.9
		i32 53, label %L.9
		i32 54, label %L.9
		i32 55, label %L.9
		i32 56, label %L.9
		i32 57, label %L.9
	]
L.9:
	store i16 0, i16* %n
	br label %L.10
L.10:
	%17 = load i16* %n
	%18 = mul i16 %17, 10
	%19 = load i8* %c
	%20 = sub i8 %19, 48
	%21 = zext i8 %20 to i16
	%22 = add i16 %18, %21
	store i16 %22, i16* %n
	%23 = load i32* %i
	%24 = add i32 %23, 1
	store i32 %24, i32* %i
	%25 = load [0 x i8]** %fmt
	%26 = load i32* %i
	%27 = getelementptr [0 x i8]* %25, i32 0, i32 %26
	%28 = load i8* %27
	store i8 %28, i8* %c
	%29 = load i8* %c
	%30 = icmp ult i8 %29, 48
	br i1 %30, label %L.14, label %L.13
L.13:
	%31 = load i8* %c
	%32 = icmp ugt i8 %31, 57
	br label %L.14
L.14:
	%33 = phi i1 [ true, %L.10 ], [ %32, %L.13 ]
	br i1 %33, label %L.11, label %L.12
L.12:
	br label %L.10
L.11:
	%34 = load %ast.AstNode** %anode
	%35 = getelementptr %ast.AstNode* %34, i32 0, i32 11
	%36 = load i16* %n
	%37 = zext i16 %36 to i32
	%38 = getelementptr [0 x %ast.AstNode*]* %35, i32 0, i32 %37
	%39 = load %ast.AstNode** %38
	store %ast.AstNode* %39, %ast.AstNode** %node
	br label %L.8
L.7:
	br label %L.8
L.8:
	%40 = load i8* %c
	%41 = zext i8 %40 to i32
	switch i32 %41, label %L.15 [
		i32 66, label %L.17
		i32 65, label %L.18
		i32 84, label %L.19
		i32 73, label %L.20
		i32 78, label %L.21
		i32 68, label %L.22
		i32 87, label %L.23
		i32 83, label %L.24
		i32 37, label %L.25
	]
L.17:
	%42 = load %ast.AstNode** %node
	%43 = getelementptr %ast.AstNode* %42, i32 0, i32 9
	%44 = load %type.TypeNode** %43
	call void @llvm_PType(%type.TypeNode* %44, i8 0)
	br label %L.16
L.18:
	%45 = load %ast.AstNode** %node
	%46 = getelementptr %ast.AstNode* %45, i32 0, i32 9
	%47 = load %type.TypeNode** %46
	%48 = getelementptr %type.TypeNode* %47, i32 0, i32 0
	%49 = load %type.TypeNode** %48
	call void @llvm_PType(%type.TypeNode* %49, i8 0)
	br label %L.16
L.19:
	%50 = load %ast.AstNode** %node
	call void @llvm_NodeType(%ast.AstNode* %50)
	br label %L.16
L.20:
	%51 = load %ast.AstNode** %node
	call void @llvm_NodeName(%ast.AstNode* %51)
	br label %L.16
L.21:
	%52 = load %ast.AstNode** %node
	call void @llvm_NodeSrc(%ast.AstNode* %52)
	br label %L.16
L.22:
	%53 = load %ast.AstNode** %node
	call void @llvm_NodeDst(%ast.AstNode* %53)
	br label %L.16
L.23:
	%54 = load %type.TypeNode** @type_wordtype
	call void @llvm_PType(%type.TypeNode* %54, i8 0)
	br label %L.16
L.24:
	%55 = load i32* @llvm_f
	%56 = getelementptr [6 x i8]* @.str578
	%57 = bitcast [6 x i8]* %56 to [0 x i8]*
	call void @out_str(i32 %55, [0 x i8]* %57)
	%58 = load i32* @llvm_f
	%59 = load %ast.AstNode** %node
	%60 = getelementptr %ast.AstNode* %59, i32 0, i32 8
	%61 = load i64* %60
	%62 = trunc i64 %61 to i32
	call void @out_uint32(i32 %58, i32 %62)
	br label %L.16
L.25:
	%63 = load i32* @llvm_f
	%64 = load i8* %c
	call void @out_chr(i32 %63, i8 %64)
	br label %L.16
L.15:
	br label %L.16
L.16:
	br label %L.4
L.6:
	%65 = load i32* @llvm_f
	%66 = load i8* %c
	call void @out_chr(i32 %65, i8 %66)
	br label %L.4
L.4:
	%67 = load i32* %i
	%68 = add i32 %67, 1
	store i32 %68, i32* %i
	br label %L.1
L.2:
	br label %return
return:
	ret void
}
define void @llvm_PRetValName(i16 zeroext %n.arg) nounwind {
L.0:
	%n = alloca i16
	store i16 %n.arg, i16* %n
	%0 = load i32* @llvm_f
	%1 = getelementptr [5 x i8]* @.str579
	%2 = bitcast [5 x i8]* %1 to [0 x i8]*
	call void @out_str(i32 %0, [0 x i8]* %2)
	%3 = load i32* @llvm_f
	%4 = load i16* %n
	%5 = zext i16 %4 to i32
	call void @out_uint(i32 %3, i32 %5)
	br label %return
return:
	ret void
}
define void @llvm_DclType(%type.TypeNode* %t.arg) nounwind {
L.0:
	%t = alloca %type.TypeNode*
	store %type.TypeNode* %t.arg, %type.TypeNode** %t
	%s = alloca %symb.SymbNode*
	%opt = alloca i8
	%size = alloca i32
	store i8 0, i8* %opt
	%0 = load %type.TypeNode** %t
	%1 = icmp ne %type.TypeNode* %0, null
	br i1 %1, label %L.1, label %L.2
L.1:
	%2 = load %type.TypeNode** %t
	%3 = getelementptr %type.TypeNode* %2, i32 0, i32 19
	%4 = load i8* %3
	%5 = icmp ne i8 %4, 0
	%6 = xor i1 %5, true
	br label %L.2
L.2:
	%7 = phi i1 [ false, %L.0 ], [ %6, %L.1 ]
	br i1 %7, label %L.4, label %L.3
L.4:
	%8 = load %type.TypeNode** %t
	%9 = getelementptr %type.TypeNode* %8, i32 0, i32 11
	%10 = load i8* %9
	%11 = zext i8 %10 to i32
	switch i32 %11, label %L.5 [
		i32 4, label %L.7
		i32 5, label %L.7
		i32 7, label %L.8
		i32 6, label %L.9
	]
L.7:
	%12 = load %type.TypeNode** %t
	%13 = getelementptr %type.TypeNode* %12, i32 0, i32 0
	%14 = load %type.TypeNode** %13
	call void @llvm_DclType(%type.TypeNode* %14)
	br label %L.6
L.8:
	%15 = load %type.TypeNode** %t
	%16 = getelementptr %type.TypeNode* %15, i32 0, i32 3
	%17 = load %symb.SymbNode** %16
	%18 = getelementptr %symb.SymbNode* %17, i32 0, i32 3
	%19 = load %symb.SymbNode** %18
	store %symb.SymbNode* %19, %symb.SymbNode** %s
	br label %L.10
L.10:
	%20 = load %symb.SymbNode** %s
	%21 = icmp ne %symb.SymbNode* %20, null
	%22 = xor i1 %21, true
	br i1 %22, label %L.11, label %L.12
L.12:
	%23 = load %symb.SymbNode** %s
	%24 = getelementptr %symb.SymbNode* %23, i32 0, i32 1
	%25 = load %type.TypeNode** %24
	call void @llvm_DclType(%type.TypeNode* %25)
	%26 = load %symb.SymbNode** %s
	%27 = getelementptr %symb.SymbNode* %26, i32 0, i32 0
	%28 = load %symb.SymbNode** %27
	store %symb.SymbNode* %28, %symb.SymbNode** %s
	br label %L.10
L.11:
	br label %L.6
L.9:
	%29 = load %type.TypeNode** %t
	%30 = getelementptr %type.TypeNode* %29, i32 0, i32 19
	store i8 1, i8* %30
	%31 = load %type.TypeNode** %t
	%32 = getelementptr %type.TypeNode* %31, i32 0, i32 3
	%33 = load %symb.SymbNode** %32
	store %symb.SymbNode* %33, %symb.SymbNode** %s
	br label %L.13
L.13:
	%34 = load %symb.SymbNode** %s
	%35 = icmp ne %symb.SymbNode* %34, null
	%36 = xor i1 %35, true
	br i1 %36, label %L.14, label %L.15
L.15:
	%37 = load %symb.SymbNode** %s
	%38 = getelementptr %symb.SymbNode* %37, i32 0, i32 1
	%39 = load %type.TypeNode** %38
	call void @llvm_DclType(%type.TypeNode* %39)
	%40 = load %symb.SymbNode** %s
	%41 = getelementptr %symb.SymbNode* %40, i32 0, i32 0
	%42 = load %symb.SymbNode** %41
	store %symb.SymbNode* %42, %symb.SymbNode** %s
	br label %L.13
L.14:
	%43 = load %type.TypeNode** %t
	call void @llvm_PTypeName(%type.TypeNode* %43)
	%44 = load i32* @llvm_f
	%45 = getelementptr [9 x i8]* @.str580
	%46 = bitcast [9 x i8]* %45 to [0 x i8]*
	call void @out_str(i32 %44, [0 x i8]* %46)
	%47 = load %type.TypeNode** %t
	%48 = getelementptr %type.TypeNode* %47, i32 0, i32 12
	%49 = load i8* %48
	%50 = icmp eq i8 %49, 2
	br i1 %50, label %L.17, label %L.18
L.17:
	%51 = load %type.TypeNode** %t
	%52 = getelementptr %type.TypeNode* %51, i32 0, i32 7
	%53 = load i32* %52
	%54 = call i32 @target_isize(i32 %53)
	store i32 %54, i32* %size
	%55 = load i32* @llvm_f
	%56 = getelementptr [2 x i8]* @.str581
	%57 = bitcast [2 x i8]* %56 to [0 x i8]*
	call void @out_str(i32 %55, [0 x i8]* %57)
	%58 = load i32* @llvm_f
	%59 = load i32* %size
	call void @out_uint(i32 %58, i32 %59)
	br label %L.16
L.18:
	%60 = load %type.TypeNode** %t
	%61 = getelementptr %type.TypeNode* %60, i32 0, i32 12
	%62 = load i8* %61
	%63 = icmp eq i8 %62, 1
	br i1 %63, label %L.20, label %L.19
L.20:
	%64 = load i32* @llvm_f
	%65 = getelementptr [2 x i8]* @.str582
	%66 = bitcast [2 x i8]* %65 to [0 x i8]*
	call void @out_str(i32 %64, [0 x i8]* %66)
	store i8 1, i8* %opt
	br label %L.19
L.19:
	%67 = load i32* @llvm_f
	%68 = getelementptr [2 x i8]* @.str583
	%69 = bitcast [2 x i8]* %68 to [0 x i8]*
	call void @out_str(i32 %67, [0 x i8]* %69)
	%70 = load %type.TypeNode** %t
	%71 = getelementptr %type.TypeNode* %70, i32 0, i32 3
	%72 = load %symb.SymbNode** %71
	store %symb.SymbNode* %72, %symb.SymbNode** %s
	br label %L.21
L.21:
	%73 = load %symb.SymbNode** %s
	%74 = icmp ne %symb.SymbNode* %73, null
	%75 = xor i1 %74, true
	br i1 %75, label %L.22, label %L.23
L.23:
	%76 = load %symb.SymbNode** %s
	%77 = getelementptr %symb.SymbNode* %76, i32 0, i32 1
	%78 = load %type.TypeNode** %77
	%79 = load i8* %opt
	call void @llvm_PType(%type.TypeNode* %78, i8 %79)
	%80 = load %symb.SymbNode** %s
	%81 = getelementptr %symb.SymbNode* %80, i32 0, i32 0
	%82 = load %symb.SymbNode** %81
	store %symb.SymbNode* %82, %symb.SymbNode** %s
	%83 = load %symb.SymbNode** %s
	%84 = icmp eq %symb.SymbNode* %83, null
	br i1 %84, label %L.22, label %L.24
L.24:
	%85 = load i32* @llvm_f
	%86 = getelementptr [3 x i8]* @.str584
	%87 = bitcast [3 x i8]* %86 to [0 x i8]*
	call void @out_str(i32 %85, [0 x i8]* %87)
	br label %L.21
L.22:
	%88 = load i32* @llvm_f
	%89 = getelementptr [2 x i8]* @.str585
	%90 = bitcast [2 x i8]* %89 to [0 x i8]*
	call void @out_str(i32 %88, [0 x i8]* %90)
	%91 = load %type.TypeNode** %t
	%92 = getelementptr %type.TypeNode* %91, i32 0, i32 12
	%93 = load i8* %92
	%94 = icmp eq i8 %93, 2
	br i1 %94, label %L.26, label %L.25
L.26:
	%95 = load i32* @llvm_f
	%96 = getelementptr [2 x i8]* @.str586
	%97 = bitcast [2 x i8]* %96 to [0 x i8]*
	call void @out_str(i32 %95, [0 x i8]* %97)
	br label %L.25
L.25:
	br label %L.16
L.16:
	%98 = load i32* @llvm_f
	call void @out_nl(i32 %98)
	br label %L.6
L.5:
	br label %L.6
L.6:
	br label %L.3
L.3:
	br label %return
return:
	ret void
}
define void @llvm_DclProc(%ast.AstNode* %node.arg, i8 zeroext %isdefine.arg) nounwind {
L.0:
	%node = alloca %ast.AstNode*
	%isdefine = alloca i8
	store %ast.AstNode* %node.arg, %ast.AstNode** %node
	store i8 %isdefine.arg, i8* %isdefine
	%s = alloca %symb.SymbNode*
	%ps = alloca %symb.SymbNode*
	%0 = load %ast.AstNode** %node
	%1 = getelementptr %ast.AstNode* %0, i32 0, i32 10
	%2 = load %symb.SymbNode** %1
	store %symb.SymbNode* %2, %symb.SymbNode** %ps
	%3 = load i8* %isdefine
	%4 = icmp ne i8 %3, 0
	br i1 %4, label %L.2, label %L.3
L.2:
	%5 = load i32* @llvm_f
	%6 = getelementptr [7 x i8]* @.str587
	%7 = bitcast [7 x i8]* %6 to [0 x i8]*
	call void @out_str(i32 %5, [0 x i8]* %7)
	br label %L.1
L.3:
	%8 = load i32* @llvm_f
	%9 = getelementptr [8 x i8]* @.str588
	%10 = bitcast [8 x i8]* %9 to [0 x i8]*
	call void @out_str(i32 %8, [0 x i8]* %10)
	br label %L.1
L.1:
	%11 = load %symb.SymbNode** %ps
	%12 = getelementptr %symb.SymbNode* %11, i32 0, i32 4
	%13 = load %type.TypeListEntry** %12
	call void @llvm_PRetvType(%type.TypeListEntry* %13, i8 1)
	%14 = getelementptr [5 x i8]* @.str589
	%15 = bitcast [5 x i8]* %14 to [0 x i8]*
	%16 = load %ast.AstNode** %node
	call void @llvm_Print([0 x i8]* %15, %ast.AstNode* %16)
	%17 = load %symb.SymbNode** %ps
	%18 = getelementptr %symb.SymbNode* %17, i32 0, i32 3
	%19 = load %symb.SymbNode** %18
	store %symb.SymbNode* %19, %symb.SymbNode** %s
	br label %L.4
L.4:
	%20 = load %symb.SymbNode** %s
	%21 = icmp ne %symb.SymbNode* %20, null
	%22 = xor i1 %21, true
	br i1 %22, label %L.5, label %L.6
L.6:
	%23 = load %symb.SymbNode** %s
	%24 = getelementptr %symb.SymbNode* %23, i32 0, i32 1
	%25 = load %type.TypeNode** %24
	call void @llvm_PType(%type.TypeNode* %25, i8 0)
	%26 = load %symb.SymbNode** %s
	%27 = getelementptr %symb.SymbNode* %26, i32 0, i32 1
	%28 = load %type.TypeNode** %27
	call void @llvm_PExtend(%type.TypeNode* %28)
	%29 = load i8* %isdefine
	%30 = icmp ne i8 %29, 0
	br i1 %30, label %L.8, label %L.7
L.8:
	%31 = load i32* @llvm_f
	%32 = getelementptr [3 x i8]* @.str590
	%33 = bitcast [3 x i8]* %32 to [0 x i8]*
	call void @out_str(i32 %31, [0 x i8]* %33)
	%34 = load i32* @llvm_f
	%35 = load %symb.SymbNode** %s
	%36 = getelementptr %symb.SymbNode* %35, i32 0, i32 19
	%37 = getelementptr [0 x i8]* %36
	call void @out_str(i32 %34, [0 x i8]* %37)
	%38 = load i32* @llvm_f
	%39 = getelementptr [5 x i8]* @.str591
	%40 = bitcast [5 x i8]* %39 to [0 x i8]*
	call void @out_str(i32 %38, [0 x i8]* %40)
	br label %L.7
L.7:
	%41 = load %symb.SymbNode** %s
	%42 = getelementptr %symb.SymbNode* %41, i32 0, i32 0
	%43 = load %symb.SymbNode** %42
	store %symb.SymbNode* %43, %symb.SymbNode** %s
	%44 = load %symb.SymbNode** %s
	%45 = icmp eq %symb.SymbNode* %44, null
	br i1 %45, label %L.5, label %L.9
L.9:
	%46 = load i32* @llvm_f
	%47 = getelementptr [3 x i8]* @.str592
	%48 = bitcast [3 x i8]* %47 to [0 x i8]*
	call void @out_str(i32 %46, [0 x i8]* %48)
	br label %L.4
L.5:
	%49 = load i32* @llvm_f
	%50 = getelementptr [2 x i8]* @.str593
	%51 = bitcast [2 x i8]* %50 to [0 x i8]*
	call void @out_str(i32 %49, [0 x i8]* %51)
	br label %return
return:
	ret void
}
define void @llvm_PString([0 x i8]* %s.arg, i8 zeroext %n.arg, i8 zeroext %prefix.arg) nounwind {
L.0:
	%s = alloca [0 x i8]*
	%n = alloca i8
	%prefix = alloca i8
	store [0 x i8]* %s.arg, [0 x i8]** %s
	store i8 %n.arg, i8* %n
	store i8 %prefix.arg, i8* %prefix
	%i = alloca i8
	%c = alloca i8
	%0 = load i8* %prefix
	%1 = icmp ne i8 %0, 0
	br i1 %1, label %L.2, label %L.1
L.2:
	%2 = load i32* @llvm_f
	call void @out_chr(i32 %2, i8 99)
	br label %L.1
L.1:
	%3 = load i32* @llvm_f
	call void @out_chr(i32 %3, i8 34)
	store i8 0, i8* %i
	br label %L.3
L.3:
	%4 = load i8* %i
	%5 = load i8* %n
	%6 = icmp ult i8 %4, %5
	%7 = xor i1 %6, true
	br i1 %7, label %L.4, label %L.5
L.5:
	%8 = load [0 x i8]** %s
	%9 = load i8* %i
	%10 = zext i8 %9 to i32
	%11 = getelementptr [0 x i8]* %8, i32 0, i32 %10
	%12 = load i8* %11
	store i8 %12, i8* %c
	%13 = load i8* %c
	%14 = icmp ult i8 %13, 32
	br i1 %14, label %L.11, label %L.10
L.10:
	%15 = load i8* %c
	%16 = icmp uge i8 %15, 127
	br label %L.11
L.11:
	%17 = phi i1 [ true, %L.5 ], [ %16, %L.10 ]
	br i1 %17, label %L.9, label %L.8
L.8:
	%18 = load i8* %c
	%19 = icmp eq i8 %18, 34
	br label %L.9
L.9:
	%20 = phi i1 [ true, %L.11 ], [ %19, %L.8 ]
	br i1 %20, label %L.7, label %L.6
L.6:
	%21 = load i8* %c
	%22 = icmp eq i8 %21, 92
	br label %L.7
L.7:
	%23 = phi i1 [ true, %L.9 ], [ %22, %L.6 ]
	br i1 %23, label %L.13, label %L.14
L.13:
	%24 = load i32* @llvm_f
	call void @out_chr(i32 %24, i8 92)
	%25 = load i32* @llvm_f
	%26 = load i8* %c
	call void @out_hex8(i32 %25, i8 %26)
	br label %L.12
L.14:
	%27 = load i32* @llvm_f
	%28 = load i8* %c
	call void @out_chr(i32 %27, i8 %28)
	br label %L.12
L.12:
	%29 = load i8* %i
	%30 = add i8 %29, 1
	store i8 %30, i8* %i
	br label %L.3
L.4:
	%31 = load i32* @llvm_f
	call void @out_chr(i32 %31, i8 34)
	br label %return
return:
	ret void
}
define void @llvm_Constant(%ast.AstNode* %node.arg, %type.TypeNode* %t.arg) nounwind {
L.0:
	%node = alloca %ast.AstNode*
	%t = alloca %type.TypeNode*
	store %ast.AstNode* %node.arg, %ast.AstNode** %node
	store %type.TypeNode* %t.arg, %type.TypeNode** %t
	%i = alloca i16
	%0 = load %type.TypeNode** %t
	%1 = icmp ne %type.TypeNode* %0, null
	br i1 %1, label %L.2, label %L.1
L.2:
	%2 = load %type.TypeNode** %t
	%3 = getelementptr %type.TypeNode* %2, i32 0, i32 11
	%4 = load i8* %3
	%5 = zext i8 %4 to i32
	switch i32 %5, label %L.3 [
		i32 1, label %L.5
		i32 2, label %L.5
		i32 3, label %L.6
		i32 4, label %L.7
		i32 6, label %L.8
		i32 5, label %L.9
		i32 7, label %L.10
	]
L.5:
	%6 = load %ast.AstNode** %node
	%7 = icmp ne %ast.AstNode* %6, null
	br i1 %7, label %L.12, label %L.13
L.12:
	%8 = load i32* @llvm_f
	%9 = load %ast.AstNode** %node
	%10 = getelementptr %ast.AstNode* %9, i32 0, i32 8
	%11 = load i64* %10
	call void @out_uint64(i32 %8, i64 %11)
	br label %L.11
L.13:
	%12 = load i32* @llvm_f
	call void @out_uint(i32 %12, i32 0)
	br label %L.11
L.11:
	br label %L.4
L.6:
	%13 = load %ast.AstNode** %node
	%14 = icmp ne %ast.AstNode* %13, null
	br i1 %14, label %L.15, label %L.16
L.15:
	%15 = load i32* @llvm_f
	%16 = load %ast.AstNode** %node
	%17 = getelementptr %ast.AstNode* %16, i32 0, i32 8
	%18 = load i64* %17
	call void @out_int64(i32 %15, i64 %18)
	br label %L.14
L.16:
	%19 = load i32* @llvm_f
	call void @out_uint(i32 %19, i32 0)
	br label %L.14
L.14:
	br label %L.4
L.7:
	%20 = load %ast.AstNode** %node
	%21 = icmp eq %ast.AstNode* %20, null
	br i1 %21, label %L.18, label %L.17
L.17:
	%22 = load %ast.AstNode** %node
	%23 = getelementptr %ast.AstNode* %22, i32 0, i32 8
	%24 = load i64* %23
	%25 = icmp eq i64 %24, 0
	br label %L.18
L.18:
	%26 = phi i1 [ true, %L.7 ], [ %25, %L.17 ]
	br i1 %26, label %L.20, label %L.21
L.20:
	%27 = load i32* @llvm_f
	%28 = getelementptr [16 x i8]* @.str594
	%29 = bitcast [16 x i8]* %28 to [0 x i8]*
	call void @out_str(i32 %27, [0 x i8]* %29)
	br label %L.19
L.21:
	%30 = load %type.TypeNode** %t
	%31 = load %ast.AstNode** %node
	call void @llvm_ConstantRef(%type.TypeNode* %30, %ast.AstNode* %31)
	br label %L.19
L.19:
	br label %L.4
L.8:
	%32 = load %ast.AstNode** %node
	%33 = icmp ne %ast.AstNode* %32, null
	br i1 %33, label %L.23, label %L.24
L.23:
	%34 = load %type.TypeNode** %t
	%35 = getelementptr %type.TypeNode* %34, i32 0, i32 12
	%36 = load i8* %35
	%37 = icmp eq i8 %36, 2
	br i1 %37, label %L.26, label %L.27
L.26:
	%38 = load i32* @llvm_f
	%39 = load %ast.AstNode** %node
	%40 = getelementptr %ast.AstNode* %39, i32 0, i32 8
	%41 = load i64* %40
	call void @out_uint64(i32 %38, i64 %41)
	br label %L.25
L.27:
	%42 = load i32* @llvm_f
	%43 = getelementptr [3 x i8]* @.str595
	%44 = bitcast [3 x i8]* %43 to [0 x i8]*
	call void @out_str(i32 %42, [0 x i8]* %44)
	store i16 0, i16* %i
	br label %L.28
L.28:
	%45 = load %ast.AstNode** %node
	%46 = getelementptr %ast.AstNode* %45, i32 0, i32 11
	%47 = load i16* %i
	%48 = zext i16 %47 to i32
	%49 = getelementptr [0 x %ast.AstNode*]* %46, i32 0, i32 %48
	%50 = load %ast.AstNode** %49
	%51 = getelementptr %ast.AstNode* %50, i32 0, i32 9
	%52 = load %type.TypeNode** %51
	call void @llvm_PType(%type.TypeNode* %52, i8 0)
	%53 = load i32* @llvm_f
	%54 = getelementptr [2 x i8]* @.str596
	%55 = bitcast [2 x i8]* %54 to [0 x i8]*
	call void @out_str(i32 %53, [0 x i8]* %55)
	%56 = load %ast.AstNode** %node
	%57 = getelementptr %ast.AstNode* %56, i32 0, i32 11
	%58 = load i16* %i
	%59 = zext i16 %58 to i32
	%60 = getelementptr [0 x %ast.AstNode*]* %57, i32 0, i32 %59
	%61 = load %ast.AstNode** %60
	%62 = load %ast.AstNode** %node
	%63 = getelementptr %ast.AstNode* %62, i32 0, i32 11
	%64 = load i16* %i
	%65 = zext i16 %64 to i32
	%66 = getelementptr [0 x %ast.AstNode*]* %63, i32 0, i32 %65
	%67 = load %ast.AstNode** %66
	%68 = getelementptr %ast.AstNode* %67, i32 0, i32 9
	%69 = load %type.TypeNode** %68
	call void @llvm_Constant(%ast.AstNode* %61, %type.TypeNode* %69)
	%70 = load i16* %i
	%71 = add i16 %70, 1
	store i16 %71, i16* %i
	%72 = load i16* %i
	%73 = load %ast.AstNode** %node
	%74 = getelementptr %ast.AstNode* %73, i32 0, i32 5
	%75 = load i16* %74
	%76 = icmp uge i16 %72, %75
	br i1 %76, label %L.29, label %L.30
L.30:
	%77 = load i32* @llvm_f
	%78 = getelementptr [3 x i8]* @.str597
	%79 = bitcast [3 x i8]* %78 to [0 x i8]*
	call void @out_str(i32 %77, [0 x i8]* %79)
	br label %L.28
L.29:
	%80 = load i32* @llvm_f
	%81 = getelementptr [3 x i8]* @.str598
	%82 = bitcast [3 x i8]* %81 to [0 x i8]*
	call void @out_str(i32 %80, [0 x i8]* %82)
	br label %L.25
L.25:
	br label %L.22
L.24:
	%83 = load i32* @llvm_f
	%84 = getelementptr [16 x i8]* @.str599
	%85 = bitcast [16 x i8]* %84 to [0 x i8]*
	call void @out_str(i32 %83, [0 x i8]* %85)
	br label %L.22
L.22:
	br label %L.4
L.9:
	%86 = load %ast.AstNode** %node
	%87 = icmp ne %ast.AstNode* %86, null
	br i1 %87, label %L.32, label %L.33
L.32:
	%88 = load %type.TypeNode** %t
	%89 = getelementptr %type.TypeNode* %88, i32 0, i32 12
	%90 = load i8* %89
	%91 = icmp eq i8 %90, 2
	br i1 %91, label %L.35, label %L.36
L.35:
	%92 = load i32* @llvm_f
	%93 = load %ast.AstNode** %node
	%94 = getelementptr %ast.AstNode* %93, i32 0, i32 8
	%95 = load i64* %94
	call void @out_uint64(i32 %92, i64 %95)
	br label %L.34
L.36:
	%96 = load %ast.AstNode** %node
	%97 = getelementptr %ast.AstNode* %96, i32 0, i32 0
	%98 = load i8* %97
	%99 = zext i8 %98 to i32
	switch i32 %99, label %L.37 [
		i32 14, label %L.39
		i32 19, label %L.40
		i32 8, label %L.41
	]
L.39:
	%100 = load i32* @llvm_f
	%101 = getelementptr [3 x i8]* @.str600
	%102 = bitcast [3 x i8]* %101 to [0 x i8]*
	call void @out_str(i32 %100, [0 x i8]* %102)
	store i16 0, i16* %i
	br label %L.42
L.42:
	%103 = load %ast.AstNode** %node
	%104 = getelementptr %ast.AstNode* %103, i32 0, i32 11
	%105 = load i16* %i
	%106 = zext i16 %105 to i32
	%107 = getelementptr [0 x %ast.AstNode*]* %104, i32 0, i32 %106
	%108 = load %ast.AstNode** %107
	%109 = getelementptr %ast.AstNode* %108, i32 0, i32 9
	%110 = load %type.TypeNode** %109
	call void @llvm_PType(%type.TypeNode* %110, i8 0)
	%111 = load i32* @llvm_f
	%112 = getelementptr [2 x i8]* @.str601
	%113 = bitcast [2 x i8]* %112 to [0 x i8]*
	call void @out_str(i32 %111, [0 x i8]* %113)
	%114 = load %ast.AstNode** %node
	%115 = getelementptr %ast.AstNode* %114, i32 0, i32 11
	%116 = load i16* %i
	%117 = zext i16 %116 to i32
	%118 = getelementptr [0 x %ast.AstNode*]* %115, i32 0, i32 %117
	%119 = load %ast.AstNode** %118
	%120 = load %ast.AstNode** %node
	%121 = getelementptr %ast.AstNode* %120, i32 0, i32 11
	%122 = load i16* %i
	%123 = zext i16 %122 to i32
	%124 = getelementptr [0 x %ast.AstNode*]* %121, i32 0, i32 %123
	%125 = load %ast.AstNode** %124
	%126 = getelementptr %ast.AstNode* %125, i32 0, i32 9
	%127 = load %type.TypeNode** %126
	call void @llvm_Constant(%ast.AstNode* %119, %type.TypeNode* %127)
	%128 = load i16* %i
	%129 = add i16 %128, 1
	store i16 %129, i16* %i
	%130 = load i16* %i
	%131 = load %ast.AstNode** %node
	%132 = getelementptr %ast.AstNode* %131, i32 0, i32 5
	%133 = load i16* %132
	%134 = icmp uge i16 %130, %133
	br i1 %134, label %L.43, label %L.44
L.44:
	%135 = load i32* @llvm_f
	%136 = getelementptr [3 x i8]* @.str602
	%137 = bitcast [3 x i8]* %136 to [0 x i8]*
	call void @out_str(i32 %135, [0 x i8]* %137)
	br label %L.42
L.43:
	%138 = load i32* @llvm_f
	%139 = getelementptr [3 x i8]* @.str603
	%140 = bitcast [3 x i8]* %139 to [0 x i8]*
	call void @out_str(i32 %138, [0 x i8]* %140)
	br label %L.38
L.40:
	%141 = load %ast.AstNode** %node
	%142 = getelementptr %ast.AstNode* %141, i32 0, i32 11
	%143 = getelementptr [0 x %ast.AstNode*]* %142, i32 0, i32 0
	%144 = load %ast.AstNode** %143
	%145 = getelementptr %ast.AstNode* %144, i32 0, i32 0
	%146 = load i8* %145
	%147 = icmp eq i8 %146, 8
	br i1 %147, label %L.46, label %L.45
L.46:
	%148 = load i32* @llvm_f
	%149 = getelementptr [3 x i8]* @.str604
	%150 = bitcast [3 x i8]* %149 to [0 x i8]*
	call void @out_str(i32 %148, [0 x i8]* %150)
	%151 = load %type.TypeNode** %t
	%152 = getelementptr %type.TypeNode* %151, i32 0, i32 16
	%153 = load i8* %152
	%154 = icmp ne i8 %153, 0
	br i1 %154, label %L.48, label %L.47
L.48:
	%155 = getelementptr [13 x i8]* @.str605
	%156 = bitcast [13 x i8]* %155 to [0 x i8]*
	%157 = load %ast.AstNode** %node
	%158 = getelementptr %ast.AstNode* %157, i32 0, i32 11
	%159 = getelementptr [0 x %ast.AstNode*]* %158, i32 0, i32 0
	%160 = load %ast.AstNode** %159
	call void @llvm_Print([0 x i8]* %156, %ast.AstNode* %160)
	br label %L.47
L.47:
	%161 = getelementptr [24 x i8]* @.str606
	%162 = bitcast [24 x i8]* %161 to [0 x i8]*
	%163 = load %ast.AstNode** %node
	%164 = getelementptr %ast.AstNode* %163, i32 0, i32 11
	%165 = getelementptr [0 x %ast.AstNode*]* %164, i32 0, i32 0
	%166 = load %ast.AstNode** %165
	call void @llvm_Print([0 x i8]* %162, %ast.AstNode* %166)
	%167 = load %type.TypeNode** %t
	%168 = getelementptr %type.TypeNode* %167, i32 0, i32 16
	%169 = load i8* %168
	%170 = icmp ne i8 %169, 0
	br i1 %170, label %L.50, label %L.49
L.50:
	%171 = getelementptr [9 x i8]* @.str607
	%172 = bitcast [9 x i8]* %171 to [0 x i8]*
	%173 = load %ast.AstNode** %node
	call void @llvm_Print([0 x i8]* %172, %ast.AstNode* %173)
	br label %L.49
L.49:
	%174 = load %ast.AstNode** %node
	%175 = getelementptr %ast.AstNode* %174, i32 0, i32 11
	%176 = getelementptr [0 x %ast.AstNode*]* %175, i32 0, i32 0
	%177 = load %ast.AstNode** %176
	call void @llvm_NeedDeclare(%ast.AstNode* %177)
	br label %L.45
L.45:
	br label %L.38
L.41:
	%n = alloca i8
	%178 = load %type.TypeNode** %t
	%179 = getelementptr %type.TypeNode* %178, i32 0, i32 16
	%180 = load i8* %179
	%181 = icmp ne i8 %180, 0
	br i1 %181, label %L.52, label %L.53
L.52:
	%182 = load %ast.AstNode** %node
	%183 = getelementptr %ast.AstNode* %182, i32 0, i32 9
	%184 = load %type.TypeNode** %183
	%185 = getelementptr %type.TypeNode* %184, i32 0, i32 6
	%186 = load i64* %185
	%187 = trunc i64 %186 to i8
	store i8 %187, i8* %n
	br label %L.51
L.53:
	%188 = load %type.TypeNode** %t
	%189 = getelementptr %type.TypeNode* %188, i32 0, i32 6
	%190 = load i64* %189
	%191 = trunc i64 %190 to i8
	store i8 %191, i8* %n
	br label %L.51
L.51:
	%192 = load %ast.AstNode** %node
	%193 = getelementptr %ast.AstNode* %192, i32 0, i32 10
	%194 = load %symb.SymbNode** %193
	%195 = bitcast %symb.SymbNode* %194 to [0 x i8]*
	%196 = bitcast [0 x i8]* %195 to [0 x i8]*
	%197 = load i8* %n
	call void @llvm_PString([0 x i8]* %196, i8 %197, i8 1)
	br label %L.38
L.37:
	br label %L.38
L.38:
	br label %L.34
L.34:
	br label %L.31
L.33:
	%198 = load i32* @llvm_f
	%199 = getelementptr [16 x i8]* @.str608
	%200 = bitcast [16 x i8]* %199 to [0 x i8]*
	call void @out_str(i32 %198, [0 x i8]* %200)
	br label %L.31
L.31:
	br label %L.4
L.10:
	%201 = load i32* @llvm_f
	%202 = getelementptr [5 x i8]* @.str609
	%203 = bitcast [5 x i8]* %202 to [0 x i8]*
	call void @out_str(i32 %201, [0 x i8]* %203)
	br label %L.4
L.3:
	br label %L.4
L.4:
	br label %L.1
L.1:
	br label %return
return:
	ret void
}
define void @llvm_Alignment(%type.TypeNode* %t.arg) nounwind {
L.0:
	%t = alloca %type.TypeNode*
	store %type.TypeNode* %t.arg, %type.TypeNode** %t
	%n = alloca i32
	%0 = load %type.TypeNode** %t
	%1 = getelementptr %type.TypeNode* %0, i32 0, i32 9
	%2 = load i32* %1
	store i32 %2, i32* %n
	%3 = load i32* %n
	%4 = load %target.TargetT** @target_Target
	%5 = getelementptr %target.TargetT* %4, i32 0, i32 3
	%6 = load i8* %5
	%7 = zext i8 %6 to i32
	%8 = icmp uge i32 %3, %7
	br i1 %8, label %L.2, label %L.1
L.2:
	%9 = load i32* @llvm_f
	%10 = getelementptr [9 x i8]* @.str610
	%11 = bitcast [9 x i8]* %10 to [0 x i8]*
	call void @out_str(i32 %9, [0 x i8]* %11)
	%12 = load i32* @llvm_f
	%13 = load i32* %n
	%14 = load %target.TargetT** @target_Target
	%15 = getelementptr %target.TargetT* %14, i32 0, i32 3
	%16 = load i8* %15
	%17 = zext i8 %16 to i32
	%18 = udiv i32 %13, %17
	call void @out_uint(i32 %12, i32 %18)
	br label %L.1
L.1:
	br label %return
return:
	ret void
}
define void @llvm_DclVar(%ast.AstNode* %node.arg) nounwind {
L.0:
	%node = alloca %ast.AstNode*
	store %ast.AstNode* %node.arg, %ast.AstNode** %node
	%s = alloca %symb.SymbNode*
	%0 = load %ast.AstNode** %node
	%1 = getelementptr %ast.AstNode* %0, i32 0, i32 10
	%2 = load %symb.SymbNode** %1
	store %symb.SymbNode* %2, %symb.SymbNode** %s
	%3 = load %symb.SymbNode** %s
	%4 = icmp ne %symb.SymbNode* %3, null
	br i1 %4, label %L.2, label %L.1
L.2:
	%5 = load %symb.SymbNode** %s
	%6 = getelementptr %symb.SymbNode* %5, i32 0, i32 1
	%7 = load %type.TypeNode** %6
	call void @llvm_DclType(%type.TypeNode* %7)
	%8 = load %symb.SymbNode** %s
	%9 = getelementptr %symb.SymbNode* %8, i32 0, i32 13
	%10 = load i8* %9
	%11 = zext i8 %10 to i32
	switch i32 %11, label %L.3 [
		i32 0, label %L.5
		i32 1, label %L.6
		i32 2, label %L.7
		i32 3, label %L.8
	]
L.5:
	%12 = getelementptr [16 x i8]* @.str611
	%13 = bitcast [16 x i8]* %12 to [0 x i8]*
	%14 = load %ast.AstNode** %node
	call void @llvm_Print([0 x i8]* %13, %ast.AstNode* %14)
	%15 = load %ast.AstNode** %node
	%16 = getelementptr %ast.AstNode* %15, i32 0, i32 11
	%17 = getelementptr [0 x %ast.AstNode*]* %16, i32 0, i32 0
	%18 = load %ast.AstNode** %17
	%19 = icmp ne %ast.AstNode* %18, null
	br i1 %19, label %L.10, label %L.9
L.10:
	%20 = load %ast.AstNode** %node
	%21 = getelementptr %ast.AstNode* %20, i32 0, i32 9
	%22 = load %type.TypeNode** %21
	%23 = getelementptr %type.TypeNode* %22, i32 0, i32 11
	%24 = load i8* %23
	%25 = icmp ule i8 %24, 4
	br i1 %25, label %L.12, label %L.13
L.12:
	%26 = load i32* @llvm_f
	call void @out_nl(i32 %26)
	%27 = load i32* @llvm_f
	call void @out_chr(i32 %27, i8 9)
	%28 = load i32* @llvm_f
	%29 = getelementptr [7 x i8]* @.str612
	%30 = bitcast [7 x i8]* %29 to [0 x i8]*
	call void @out_str(i32 %28, [0 x i8]* %30)
	%31 = load %ast.AstNode** %node
	%32 = getelementptr %ast.AstNode* %31, i32 0, i32 11
	%33 = getelementptr [0 x %ast.AstNode*]* %32, i32 0, i32 0
	%34 = load %ast.AstNode** %33
	call void @llvm_NodeType(%ast.AstNode* %34)
	%35 = load i32* @llvm_f
	call void @out_chr(i32 %35, i8 32)
	%36 = load %ast.AstNode** %node
	%37 = getelementptr %ast.AstNode* %36, i32 0, i32 11
	%38 = getelementptr [0 x %ast.AstNode*]* %37, i32 0, i32 0
	%39 = load %ast.AstNode** %38
	call void @llvm_NodeSrc(%ast.AstNode* %39)
	%40 = load i32* @llvm_f
	%41 = getelementptr [3 x i8]* @.str613
	%42 = bitcast [3 x i8]* %41 to [0 x i8]*
	call void @out_str(i32 %40, [0 x i8]* %42)
	%43 = load %ast.AstNode** %node
	call void @llvm_NodeType(%ast.AstNode* %43)
	%44 = load i32* @llvm_f
	call void @out_chr(i32 %44, i8 32)
	%45 = load %ast.AstNode** %node
	call void @llvm_NodeDst(%ast.AstNode* %45)
	br label %L.11
L.13:
	%46 = getelementptr [29 x i8]* @.str614
	%47 = bitcast [29 x i8]* %46 to [0 x i8]*
	call void @lex_ErrorS(i8 0, [0 x i8]* %47)
	br label %L.11
L.11:
	br label %L.9
L.9:
	br label %L.4
L.6:
	%48 = getelementptr [25 x i8]* @.str615
	%49 = bitcast [25 x i8]* %48 to [0 x i8]*
	%50 = load %ast.AstNode** %node
	call void @llvm_Print([0 x i8]* %49, %ast.AstNode* %50)
	%51 = load %ast.AstNode** %node
	%52 = getelementptr %ast.AstNode* %51, i32 0, i32 11
	%53 = getelementptr [0 x %ast.AstNode*]* %52, i32 0, i32 0
	%54 = load %ast.AstNode** %53
	%55 = load %ast.AstNode** %node
	%56 = getelementptr %ast.AstNode* %55, i32 0, i32 9
	%57 = load %type.TypeNode** %56
	call void @llvm_Constant(%ast.AstNode* %54, %type.TypeNode* %57)
	%58 = load %symb.SymbNode** %s
	%59 = getelementptr %symb.SymbNode* %58, i32 0, i32 1
	%60 = load %type.TypeNode** %59
	call void @llvm_Alignment(%type.TypeNode* %60)
	br label %L.4
L.7:
	%61 = getelementptr [16 x i8]* @.str616
	%62 = bitcast [16 x i8]* %61 to [0 x i8]*
	%63 = load %ast.AstNode** %node
	call void @llvm_Print([0 x i8]* %62, %ast.AstNode* %63)
	%64 = load %ast.AstNode** %node
	%65 = getelementptr %ast.AstNode* %64, i32 0, i32 11
	%66 = getelementptr [0 x %ast.AstNode*]* %65, i32 0, i32 0
	%67 = load %ast.AstNode** %66
	%68 = load %ast.AstNode** %node
	%69 = getelementptr %ast.AstNode* %68, i32 0, i32 9
	%70 = load %type.TypeNode** %69
	call void @llvm_Constant(%ast.AstNode* %67, %type.TypeNode* %70)
	%71 = load %symb.SymbNode** %s
	%72 = getelementptr %symb.SymbNode* %71, i32 0, i32 1
	%73 = load %type.TypeNode** %72
	call void @llvm_Alignment(%type.TypeNode* %73)
	br label %L.4
L.8:
	%74 = getelementptr [24 x i8]* @.str617
	%75 = bitcast [24 x i8]* %74 to [0 x i8]*
	%76 = load %ast.AstNode** %node
	call void @llvm_Print([0 x i8]* %75, %ast.AstNode* %76)
	br label %L.4
L.3:
	br label %L.4
L.4:
	%77 = load i32* @llvm_f
	call void @out_nl(i32 %77)
	%78 = getelementptr %A.148603888* @feature, i32 0, i32 3
	%79 = load i8* %78
	%80 = icmp ne i8 %79, 0
	br i1 %80, label %L.15, label %L.14
L.15:
	%81 = load %symb.SymbNode** %s
	%82 = call i16 @llvmdb_DefVar(%symb.SymbNode* %81)
	br label %L.14
L.14:
	br label %L.1
L.1:
	br label %return
return:
	ret void
}
define void @llvm_DclCon(%ast.AstNode* %node.arg) nounwind {
L.0:
	%node = alloca %ast.AstNode*
	store %ast.AstNode* %node.arg, %ast.AstNode** %node
	%s = alloca %symb.SymbNode*
	%0 = load %ast.AstNode** %node
	%1 = getelementptr %ast.AstNode* %0, i32 0, i32 10
	%2 = load %symb.SymbNode** %1
	store %symb.SymbNode* %2, %symb.SymbNode** %s
	%3 = load %symb.SymbNode** %s
	%4 = icmp ne %symb.SymbNode* %3, null
	br i1 %4, label %L.2, label %L.1
L.2:
	%5 = load %symb.SymbNode** %s
	%6 = getelementptr %symb.SymbNode* %5, i32 0, i32 1
	%7 = load %type.TypeNode** %6
	call void @llvm_DclType(%type.TypeNode* %7)
	%8 = load %symb.SymbNode** %s
	%9 = getelementptr %symb.SymbNode* %8, i32 0, i32 13
	%10 = load i8* %9
	%11 = zext i8 %10 to i32
	switch i32 %11, label %L.3 [
		i32 1, label %L.5
		i32 2, label %L.6
	]
L.5:
	%12 = getelementptr [27 x i8]* @.str618
	%13 = bitcast [27 x i8]* %12 to [0 x i8]*
	%14 = load %ast.AstNode** %node
	call void @llvm_Print([0 x i8]* %13, %ast.AstNode* %14)
	br label %L.4
L.6:
	%15 = getelementptr [18 x i8]* @.str619
	%16 = bitcast [18 x i8]* %15 to [0 x i8]*
	%17 = load %ast.AstNode** %node
	call void @llvm_Print([0 x i8]* %16, %ast.AstNode* %17)
	br label %L.4
L.3:
	br label %L.4
L.4:
	%18 = load %ast.AstNode** %node
	%19 = getelementptr %ast.AstNode* %18, i32 0, i32 11
	%20 = getelementptr [0 x %ast.AstNode*]* %19, i32 0, i32 0
	%21 = load %ast.AstNode** %20
	%22 = load %ast.AstNode** %node
	%23 = getelementptr %ast.AstNode* %22, i32 0, i32 9
	%24 = load %type.TypeNode** %23
	call void @llvm_Constant(%ast.AstNode* %21, %type.TypeNode* %24)
	%25 = load %symb.SymbNode** %s
	%26 = getelementptr %symb.SymbNode* %25, i32 0, i32 1
	%27 = load %type.TypeNode** %26
	call void @llvm_Alignment(%type.TypeNode* %27)
	br label %L.1
L.1:
	%28 = load i32* @llvm_f
	call void @out_nl(i32 %28)
	br label %return
return:
	ret void
}
define void @llvm_DclString(%ast.AstNode* %node.arg) nounwind {
L.0:
	%node = alloca %ast.AstNode*
	store %ast.AstNode* %node.arg, %ast.AstNode** %node
	%n = alloca i8
	%0 = getelementptr [27 x i8]* @.str620
	%1 = bitcast [27 x i8]* %0 to [0 x i8]*
	%2 = load %ast.AstNode** %node
	call void @llvm_Print([0 x i8]* %1, %ast.AstNode* %2)
	%3 = load %ast.AstNode** %node
	%4 = getelementptr %ast.AstNode* %3, i32 0, i32 9
	%5 = load %type.TypeNode** %4
	%6 = getelementptr %type.TypeNode* %5, i32 0, i32 6
	%7 = load i64* %6
	%8 = trunc i64 %7 to i8
	store i8 %8, i8* %n
	%9 = load %ast.AstNode** %node
	%10 = getelementptr %ast.AstNode* %9, i32 0, i32 10
	%11 = load %symb.SymbNode** %10
	%12 = bitcast %symb.SymbNode* %11 to [0 x i8]*
	%13 = bitcast [0 x i8]* %12 to [0 x i8]*
	%14 = load i8* %n
	call void @llvm_PString([0 x i8]* %13, i8 %14, i8 1)
	br label %return
return:
	ret void
}
define void @llvm_DclAggregate(%ast.AstNode* %node.arg) nounwind {
L.0:
	%node = alloca %ast.AstNode*
	store %ast.AstNode* %node.arg, %ast.AstNode** %node
	%0 = getelementptr [27 x i8]* @.str621
	%1 = bitcast [27 x i8]* %0 to [0 x i8]*
	%2 = load %ast.AstNode** %node
	call void @llvm_Print([0 x i8]* %1, %ast.AstNode* %2)
	%3 = load %ast.AstNode** %node
	%4 = load %ast.AstNode** %node
	%5 = getelementptr %ast.AstNode* %4, i32 0, i32 9
	%6 = load %type.TypeNode** %5
	call void @llvm_Constant(%ast.AstNode* %3, %type.TypeNode* %6)
	br label %return
return:
	ret void
}
define void @llvm_Declare() nounwind {
L.0:
	%d = alloca %llvm.dclnode*
	%i = alloca i8
	%0 = load %llvm.dclnode** @llvm_dclhead
	store %llvm.dclnode* %0, %llvm.dclnode** %d
	br label %L.1
L.1:
	%1 = load %llvm.dclnode** %d
	%2 = icmp ne %llvm.dclnode* %1, null
	%3 = xor i1 %2, true
	br i1 %3, label %L.2, label %L.3
L.3:
	%4 = load %llvm.dclnode** %d
	%5 = getelementptr %llvm.dclnode* %4, i32 0, i32 2
	%6 = load %ast.AstNode** %5
	%7 = getelementptr %ast.AstNode* %6, i32 0, i32 0
	%8 = load i8* %7
	%9 = zext i8 %8 to i32
	switch i32 %9, label %L.4 [
		i32 10, label %L.6
		i32 8, label %L.7
		i32 14, label %L.8
	]
L.6:
	%10 = load %llvm.dclnode** %d
	%11 = getelementptr %llvm.dclnode* %10, i32 0, i32 2
	%12 = load %ast.AstNode** %11
	call void @llvm_DclProc(%ast.AstNode* %12, i8 0)
	br label %L.5
L.7:
	%13 = load %llvm.dclnode** %d
	%14 = getelementptr %llvm.dclnode* %13, i32 0, i32 2
	%15 = load %ast.AstNode** %14
	call void @llvm_DclString(%ast.AstNode* %15)
	br label %L.5
L.8:
	%16 = load %llvm.dclnode** %d
	%17 = getelementptr %llvm.dclnode* %16, i32 0, i32 2
	%18 = load %ast.AstNode** %17
	call void @llvm_DclAggregate(%ast.AstNode* %18)
	br label %L.5
L.4:
	br label %L.5
L.5:
	%19 = load i32* @llvm_f
	call void @out_nl(i32 %19)
	%20 = load %llvm.dclnode** %d
	%21 = getelementptr %llvm.dclnode* %20, i32 0, i32 0
	%22 = load %llvm.dclnode** %21
	store %llvm.dclnode* %22, %llvm.dclnode** %d
	br label %L.1
L.2:
	store i8 0, i8* %i
	br label %L.9
L.9:
	%23 = load i8* %i
	%24 = icmp ult i8 %23, 9
	%25 = xor i1 %24, true
	br i1 %25, label %L.10, label %L.11
L.11:
	%26 = load i8* %i
	%27 = zext i8 %26 to i32
	%28 = getelementptr [10 x i8]* @llvm_UseIntrinsic, i32 0, i32 %27
	%29 = load i8* %28
	%30 = icmp ne i8 %29, 0
	br i1 %30, label %L.13, label %L.12
L.13:
	%31 = load i8* %i
	%32 = zext i8 %31 to i32
	switch i32 %32, label %L.14 [
		i32 0, label %L.16
		i32 2, label %L.17
		i32 3, label %L.18
		i32 4, label %L.19
		i32 5, label %L.20
		i32 6, label %L.21
		i32 7, label %L.22
		i32 8, label %L.23
	]
L.16:
	%33 = icmp ne i8 1, 0
	br i1 %33, label %L.25, label %L.26
L.25:
	%34 = getelementptr [58 x i8]* @.str622
	%35 = bitcast [58 x i8]* %34 to [0 x i8]*
	call void @llvm_Print([0 x i8]* %35, %ast.AstNode* null)
	br label %L.24
L.26:
	%36 = getelementptr [70 x i8]* @.str623
	%37 = bitcast [70 x i8]* %36 to [0 x i8]*
	call void @llvm_Print([0 x i8]* %37, %ast.AstNode* null)
	br label %L.24
L.24:
	br label %L.15
L.17:
	%38 = getelementptr [34 x i8]* @.str624
	%39 = bitcast [34 x i8]* %38 to [0 x i8]*
	call void @llvm_Print([0 x i8]* %39, %ast.AstNode* null)
	br label %L.15
L.18:
	%40 = getelementptr [34 x i8]* @.str625
	%41 = bitcast [34 x i8]* %40 to [0 x i8]*
	call void @llvm_Print([0 x i8]* %41, %ast.AstNode* null)
	br label %L.15
L.19:
	%42 = getelementptr [34 x i8]* @.str626
	%43 = bitcast [34 x i8]* %42 to [0 x i8]*
	call void @llvm_Print([0 x i8]* %43, %ast.AstNode* null)
	br label %L.15
L.20:
	%44 = getelementptr [46 x i8]* @.str627
	%45 = bitcast [46 x i8]* %44 to [0 x i8]*
	call void @llvm_Print([0 x i8]* %45, %ast.AstNode* null)
	br label %L.15
L.21:
	%46 = getelementptr [49 x i8]* @.str628
	%47 = bitcast [49 x i8]* %46 to [0 x i8]*
	call void @llvm_Print([0 x i8]* %47, %ast.AstNode* null)
	br label %L.15
L.22:
	%48 = getelementptr [49 x i8]* @.str629
	%49 = bitcast [49 x i8]* %48 to [0 x i8]*
	call void @llvm_Print([0 x i8]* %49, %ast.AstNode* null)
	br label %L.15
L.23:
	%50 = getelementptr [49 x i8]* @.str630
	%51 = bitcast [49 x i8]* %50 to [0 x i8]*
	call void @llvm_Print([0 x i8]* %51, %ast.AstNode* null)
	br label %L.15
L.14:
	br label %L.15
L.15:
	br label %L.12
L.12:
	%52 = load i8* %i
	%53 = add i8 %52, 1
	store i8 %53, i8* %i
	br label %L.9
L.10:
	br label %return
return:
	ret void
}
define void @llvm_PLabel(i16 zeroext %n.arg) nounwind {
L.0:
	%n = alloca i16
	store i16 %n.arg, i16* %n
	%0 = load i32* @llvm_f
	%1 = getelementptr [3 x i8]* @.str631
	%2 = bitcast [3 x i8]* %1 to [0 x i8]*
	call void @out_str(i32 %0, [0 x i8]* %2)
	%3 = load i32* @llvm_f
	%4 = load i16* %n
	%5 = zext i16 %4 to i32
	call void @out_uint(i32 %3, i32 %5)
	br label %return
return:
	ret void
}
define void @llvm_Label(i16 zeroext %n.arg) nounwind {
L.0:
	%n = alloca i16
	store i16 %n.arg, i16* %n
	%0 = load i16* %n
	call void @llvm_PLabel(i16 %0)
	%1 = load i32* @llvm_f
	%2 = getelementptr [3 x i8]* @.str632
	%3 = bitcast [3 x i8]* %2 to [0 x i8]*
	call void @out_str(i32 %1, [0 x i8]* %3)
	%4 = load i16* %n
	store i16 %4, i16* @llvm_labthis
	br label %return
return:
	ret void
}
define void @llvm_RefLabel(i16 zeroext %n.arg) nounwind {
L.0:
	%n = alloca i16
	store i16 %n.arg, i16* %n
	%0 = load i32* @llvm_f
	%1 = getelementptr [8 x i8]* @.str633
	%2 = bitcast [8 x i8]* %1 to [0 x i8]*
	call void @out_str(i32 %0, [0 x i8]* %2)
	%3 = load i16* %n
	call void @llvm_PLabel(i16 %3)
	br label %return
return:
	ret void
}
define void @llvm_Branch(i16 zeroext %n.arg) nounwind {
L.0:
	%n = alloca i16
	store i16 %n.arg, i16* %n
	%0 = load i32* @llvm_f
	%1 = getelementptr [5 x i8]* @.str634
	%2 = bitcast [5 x i8]* %1 to [0 x i8]*
	call void @out_str(i32 %0, [0 x i8]* %2)
	%3 = load i16* %n
	call void @llvm_RefLabel(i16 %3)
	%4 = load i32* @llvm_f
	call void @out_nl(i32 %4)
	br label %return
return:
	ret void
}
define void @llvm_BranchConditional(%ast.AstNode* %node.arg, i16 zeroext %ntrue.arg, i16 zeroext %nfalse.arg) nounwind {
L.0:
	%node = alloca %ast.AstNode*
	%ntrue = alloca i16
	%nfalse = alloca i16
	store %ast.AstNode* %node.arg, %ast.AstNode** %node
	store i16 %ntrue.arg, i16* %ntrue
	store i16 %nfalse.arg, i16* %nfalse
	%0 = load i32* @llvm_f
	%1 = getelementptr [8 x i8]* @.str635
	%2 = bitcast [8 x i8]* %1 to [0 x i8]*
	call void @out_str(i32 %0, [0 x i8]* %2)
	%3 = load %ast.AstNode** %node
	call void @llvm_NodeSrc(%ast.AstNode* %3)
	%4 = load i32* @llvm_f
	%5 = getelementptr [3 x i8]* @.str636
	%6 = bitcast [3 x i8]* %5 to [0 x i8]*
	call void @out_str(i32 %4, [0 x i8]* %6)
	%7 = load i16* %ntrue
	call void @llvm_RefLabel(i16 %7)
	%8 = load i32* @llvm_f
	%9 = getelementptr [3 x i8]* @.str637
	%10 = bitcast [3 x i8]* %9 to [0 x i8]*
	call void @out_str(i32 %8, [0 x i8]* %10)
	%11 = load i16* %nfalse
	call void @llvm_RefLabel(i16 %11)
	%12 = load i32* @llvm_f
	call void @out_nl(i32 %12)
	br label %return
return:
	ret void
}
define zeroext i8 @llvm_If(%ast.AstNode* %node.arg) nounwind {
L.0:
	%rv.0 = alloca i8
	%node = alloca %ast.AstNode*
	store %ast.AstNode* %node.arg, %ast.AstNode** %node
	%labend = alloca i16
	%labtrue = alloca i16
	%labfalse = alloca i16
	%term = alloca i8
	%0 = load %ast.AstNode** %node
	%1 = getelementptr %ast.AstNode* %0, i32 0, i32 11
	%2 = getelementptr [0 x %ast.AstNode*]* %1, i32 0, i32 0
	%3 = load %ast.AstNode** %2
	%4 = call i8 @llvm_GenSub(%ast.AstNode* %3)
	%5 = load i16* @llvm_Lseqno
	store i16 %5, i16* %labend
	%6 = load i16* @llvm_Lseqno
	%7 = add i16 %6, 1
	store i16 %7, i16* @llvm_Lseqno
	%8 = load i16* @llvm_Lseqno
	store i16 %8, i16* %labtrue
	%9 = load i16* @llvm_Lseqno
	%10 = add i16 %9, 1
	store i16 %10, i16* @llvm_Lseqno
	%11 = load %ast.AstNode** %node
	%12 = getelementptr %ast.AstNode* %11, i32 0, i32 11
	%13 = getelementptr [0 x %ast.AstNode*]* %12, i32 0, i32 2
	%14 = load %ast.AstNode** %13
	%15 = icmp ne %ast.AstNode* %14, null
	br i1 %15, label %L.2, label %L.3
L.2:
	%16 = load i16* @llvm_Lseqno
	store i16 %16, i16* %labfalse
	%17 = load i16* @llvm_Lseqno
	%18 = add i16 %17, 1
	store i16 %18, i16* @llvm_Lseqno
	br label %L.1
L.3:
	%19 = load i16* %labend
	store i16 %19, i16* %labfalse
	br label %L.1
L.1:
	%20 = load %ast.AstNode** %node
	%21 = getelementptr %ast.AstNode* %20, i32 0, i32 11
	%22 = getelementptr [0 x %ast.AstNode*]* %21, i32 0, i32 0
	%23 = load %ast.AstNode** %22
	%24 = load i16* %labtrue
	%25 = load i16* %labfalse
	call void @llvm_BranchConditional(%ast.AstNode* %23, i16 %24, i16 %25)
	%26 = load i16* %labtrue
	call void @llvm_Label(i16 %26)
	%27 = load %ast.AstNode** %node
	%28 = getelementptr %ast.AstNode* %27, i32 0, i32 11
	%29 = getelementptr [0 x %ast.AstNode*]* %28, i32 0, i32 1
	%30 = load %ast.AstNode** %29
	%31 = call i8 @llvm_GenSub(%ast.AstNode* %30)
	store i8 %31, i8* %term
	%32 = load i8* %term
	%33 = icmp ne i8 %32, 0
	%34 = xor i1 %33, true
	br i1 %34, label %L.5, label %L.4
L.5:
	%35 = load i16* %labend
	call void @llvm_Branch(i16 %35)
	br label %L.4
L.4:
	%36 = load %ast.AstNode** %node
	%37 = getelementptr %ast.AstNode* %36, i32 0, i32 11
	%38 = getelementptr [0 x %ast.AstNode*]* %37, i32 0, i32 2
	%39 = load %ast.AstNode** %38
	%40 = icmp ne %ast.AstNode* %39, null
	br i1 %40, label %L.7, label %L.6
L.7:
	%41 = load i16* %labfalse
	call void @llvm_Label(i16 %41)
	%42 = load %ast.AstNode** %node
	%43 = getelementptr %ast.AstNode* %42, i32 0, i32 11
	%44 = getelementptr [0 x %ast.AstNode*]* %43, i32 0, i32 2
	%45 = load %ast.AstNode** %44
	%46 = call i8 @llvm_GenSub(%ast.AstNode* %45)
	store i8 %46, i8* %term
	%47 = load i8* %term
	%48 = icmp ne i8 %47, 0
	%49 = xor i1 %48, true
	br i1 %49, label %L.9, label %L.8
L.9:
	%50 = load i16* %labend
	call void @llvm_Branch(i16 %50)
	br label %L.8
L.8:
	br label %L.6
L.6:
	%51 = load i16* %labend
	call void @llvm_Label(i16 %51)
	store i8 0, i8* %rv.0
	br label %return
return:
	%52 = load i8* %rv.0
	ret i8 %52
}
define zeroext i8 @llvm_Select(%ast.AstNode* %node.arg) nounwind {
L.0:
	%rv.0 = alloca i8
	%node = alloca %ast.AstNode*
	store %ast.AstNode* %node.arg, %ast.AstNode** %node
	%i = alloca i16
	%j = alloca i16
	%isnode = alloca %ast.AstNode*
	%selnode = alloca %ast.AstNode*
	%labend = alloca i16
	%labelse = alloca i16
	%lo = alloca i64
	%hi = alloca i64
	%0 = load %ast.AstNode** %node
	%1 = getelementptr %ast.AstNode* %0, i32 0, i32 11
	%2 = getelementptr [0 x %ast.AstNode*]* %1, i32 0, i32 0
	%3 = load %ast.AstNode** %2
	%4 = load %type.TypeNode** @type_wordtype
	%5 = getelementptr %type.TypeNode* %4, i32 0, i32 7
	%6 = load i32* %5
	%7 = call %ast.AstNode* @expr_Extend(%ast.AstNode* %3, i32 %6)
	%8 = load %ast.AstNode** %node
	%9 = getelementptr %ast.AstNode* %8, i32 0, i32 11
	%10 = getelementptr [0 x %ast.AstNode*]* %9, i32 0, i32 0
	store %ast.AstNode* %7, %ast.AstNode** %10
	%11 = load %ast.AstNode** %node
	%12 = getelementptr %ast.AstNode* %11, i32 0, i32 11
	%13 = getelementptr [0 x %ast.AstNode*]* %12, i32 0, i32 0
	%14 = load %ast.AstNode** %13
	%15 = call i8 @llvm_GenSub(%ast.AstNode* %14)
	%16 = load i16* @llvm_Lseqno
	store i16 %16, i16* %labelse
	%17 = load i16* @llvm_Lseqno
	%18 = add i16 %17, 1
	store i16 %18, i16* @llvm_Lseqno
	%19 = load i16* @llvm_Lseqno
	store i16 %19, i16* %labend
	%20 = load i16* @llvm_Lseqno
	%21 = add i16 %20, 1
	store i16 %21, i16* @llvm_Lseqno
	%22 = getelementptr [16 x i8]* @.str638
	%23 = bitcast [16 x i8]* %22 to [0 x i8]*
	%24 = load %ast.AstNode** %node
	%25 = getelementptr %ast.AstNode* %24, i32 0, i32 11
	%26 = getelementptr [0 x %ast.AstNode*]* %25, i32 0, i32 0
	%27 = load %ast.AstNode** %26
	call void @llvm_Print([0 x i8]* %23, %ast.AstNode* %27)
	%28 = load i16* %labelse
	call void @llvm_RefLabel(i16 %28)
	%29 = load i32* @llvm_f
	%30 = getelementptr [4 x i8]* @.str639
	%31 = bitcast [4 x i8]* %30 to [0 x i8]*
	call void @out_str(i32 %29, [0 x i8]* %31)
	store i16 1, i16* %i
	br label %L.1
L.1:
	%32 = load i16* %i
	%33 = load %ast.AstNode** %node
	%34 = getelementptr %ast.AstNode* %33, i32 0, i32 5
	%35 = load i16* %34
	%36 = sub i16 %35, 1
	%37 = icmp ult i16 %32, %36
	%38 = xor i1 %37, true
	br i1 %38, label %L.2, label %L.3
L.3:
	%39 = load %ast.AstNode** %node
	%40 = getelementptr %ast.AstNode* %39, i32 0, i32 11
	%41 = load i16* %i
	%42 = zext i16 %41 to i32
	%43 = getelementptr [0 x %ast.AstNode*]* %40, i32 0, i32 %42
	%44 = load %ast.AstNode** %43
	store %ast.AstNode* %44, %ast.AstNode** %isnode
	%45 = load %ast.AstNode** %isnode
	%46 = getelementptr %ast.AstNode* %45, i32 0, i32 0
	%47 = load i8* %46
	%48 = icmp eq i8 %47, 68
	br i1 %48, label %L.5, label %L.4
L.5:
	%49 = load i16* @llvm_Lseqno
	%50 = load %ast.AstNode** %isnode
	%51 = getelementptr %ast.AstNode* %50, i32 0, i32 7
	store i16 %49, i16* %51
	%52 = load i16* @llvm_Lseqno
	%53 = add i16 %52, 1
	store i16 %53, i16* @llvm_Lseqno
	store i16 0, i16* %j
	br label %L.6
L.6:
	%54 = load i16* %j
	%55 = load %ast.AstNode** %isnode
	%56 = getelementptr %ast.AstNode* %55, i32 0, i32 5
	%57 = load i16* %56
	%58 = sub i16 %57, 1
	%59 = icmp ult i16 %54, %58
	%60 = xor i1 %59, true
	br i1 %60, label %L.7, label %L.8
L.8:
	%61 = load %ast.AstNode** %isnode
	%62 = getelementptr %ast.AstNode* %61, i32 0, i32 11
	%63 = load i16* %j
	%64 = zext i16 %63 to i32
	%65 = getelementptr [0 x %ast.AstNode*]* %62, i32 0, i32 %64
	%66 = load %ast.AstNode** %65
	store %ast.AstNode* %66, %ast.AstNode** %selnode
	store i64 0, i64* %lo
	store i64 0, i64* %hi
	%67 = load %ast.AstNode** %selnode
	%68 = getelementptr %ast.AstNode* %67, i32 0, i32 0
	%69 = load i8* %68
	%70 = zext i8 %69 to i32
	switch i32 %70, label %L.9 [
		i32 7, label %L.11
		i32 13, label %L.12
	]
L.11:
	%71 = load %ast.AstNode** %selnode
	%72 = getelementptr %ast.AstNode* %71, i32 0, i32 8
	%73 = load i64* %72
	store i64 %73, i64* %lo
	%74 = load i64* %lo
	store i64 %74, i64* %hi
	br label %L.10
L.12:
	%75 = load %ast.AstNode** %selnode
	%76 = getelementptr %ast.AstNode* %75, i32 0, i32 11
	%77 = getelementptr [0 x %ast.AstNode*]* %76, i32 0, i32 0
	%78 = load %ast.AstNode** %77
	%79 = getelementptr %ast.AstNode* %78, i32 0, i32 0
	%80 = load i8* %79
	%81 = icmp eq i8 %80, 7
	br i1 %81, label %L.13, label %L.14
L.13:
	%82 = load %ast.AstNode** %selnode
	%83 = getelementptr %ast.AstNode* %82, i32 0, i32 11
	%84 = getelementptr [0 x %ast.AstNode*]* %83, i32 0, i32 1
	%85 = load %ast.AstNode** %84
	%86 = getelementptr %ast.AstNode* %85, i32 0, i32 0
	%87 = load i8* %86
	%88 = icmp eq i8 %87, 7
	br label %L.14
L.14:
	%89 = phi i1 [ false, %L.12 ], [ %88, %L.13 ]
	br i1 %89, label %L.16, label %L.15
L.16:
	%90 = load %ast.AstNode** %selnode
	%91 = getelementptr %ast.AstNode* %90, i32 0, i32 11
	%92 = getelementptr [0 x %ast.AstNode*]* %91, i32 0, i32 0
	%93 = load %ast.AstNode** %92
	%94 = getelementptr %ast.AstNode* %93, i32 0, i32 8
	%95 = load i64* %94
	store i64 %95, i64* %lo
	%96 = load %ast.AstNode** %selnode
	%97 = getelementptr %ast.AstNode* %96, i32 0, i32 11
	%98 = getelementptr [0 x %ast.AstNode*]* %97, i32 0, i32 1
	%99 = load %ast.AstNode** %98
	%100 = getelementptr %ast.AstNode* %99, i32 0, i32 8
	%101 = load i64* %100
	store i64 %101, i64* %hi
	br label %L.15
L.15:
	br label %L.10
L.9:
	br label %L.10
L.10:
	br label %L.17
L.17:
	%102 = load i64* %lo
	%103 = load i64* %hi
	%104 = icmp ule i64 %102, %103
	%105 = xor i1 %104, true
	br i1 %105, label %L.18, label %L.19
L.19:
	%106 = getelementptr [7 x i8]* @.str640
	%107 = bitcast [7 x i8]* %106 to [0 x i8]*
	%108 = load %ast.AstNode** %node
	call void @llvm_Print([0 x i8]* %107, %ast.AstNode* %108)
	%109 = load i32* @llvm_f
	%110 = load i64* %lo
	%111 = trunc i64 %110 to i32
	call void @out_uint32(i32 %109, i32 %111)
	%112 = load i32* @llvm_f
	%113 = getelementptr [3 x i8]* @.str641
	%114 = bitcast [3 x i8]* %113 to [0 x i8]*
	call void @out_str(i32 %112, [0 x i8]* %114)
	%115 = load %ast.AstNode** %isnode
	%116 = getelementptr %ast.AstNode* %115, i32 0, i32 7
	%117 = load i16* %116
	call void @llvm_RefLabel(i16 %117)
	%118 = load i32* @llvm_f
	call void @out_nl(i32 %118)
	%119 = load i64* %lo
	%120 = add i64 %119, 1
	store i64 %120, i64* %lo
	br label %L.17
L.18:
	%121 = load i16* %j
	%122 = add i16 %121, 1
	store i16 %122, i16* %j
	br label %L.6
L.7:
	br label %L.4
L.4:
	%123 = load i16* %i
	%124 = add i16 %123, 1
	store i16 %124, i16* %i
	br label %L.1
L.2:
	%125 = load i32* @llvm_f
	%126 = getelementptr [4 x i8]* @.str642
	%127 = bitcast [4 x i8]* %126 to [0 x i8]*
	call void @out_str(i32 %125, [0 x i8]* %127)
	store i16 1, i16* %i
	br label %L.20
L.20:
	%128 = load i16* %i
	%129 = load %ast.AstNode** %node
	%130 = getelementptr %ast.AstNode* %129, i32 0, i32 5
	%131 = load i16* %130
	%132 = sub i16 %131, 1
	%133 = icmp ult i16 %128, %132
	%134 = xor i1 %133, true
	br i1 %134, label %L.21, label %L.22
L.22:
	%135 = load %ast.AstNode** %node
	%136 = getelementptr %ast.AstNode* %135, i32 0, i32 11
	%137 = load i16* %i
	%138 = zext i16 %137 to i32
	%139 = getelementptr [0 x %ast.AstNode*]* %136, i32 0, i32 %138
	%140 = load %ast.AstNode** %139
	store %ast.AstNode* %140, %ast.AstNode** %isnode
	%141 = load %ast.AstNode** %isnode
	%142 = getelementptr %ast.AstNode* %141, i32 0, i32 7
	%143 = load i16* %142
	call void @llvm_Label(i16 %143)
	%144 = load %ast.AstNode** %isnode
	%145 = getelementptr %ast.AstNode* %144, i32 0, i32 11
	%146 = load %ast.AstNode** %isnode
	%147 = getelementptr %ast.AstNode* %146, i32 0, i32 5
	%148 = load i16* %147
	%149 = sub i16 %148, 1
	%150 = zext i16 %149 to i32
	%151 = getelementptr [0 x %ast.AstNode*]* %145, i32 0, i32 %150
	%152 = load %ast.AstNode** %151
	%153 = call i8 @llvm_GenSub(%ast.AstNode* %152)
	%154 = icmp ne i8 %153, 0
	%155 = xor i1 %154, true
	br i1 %155, label %L.24, label %L.23
L.24:
	%156 = load i16* %labend
	call void @llvm_Branch(i16 %156)
	br label %L.23
L.23:
	%157 = load i16* %i
	%158 = add i16 %157, 1
	store i16 %158, i16* %i
	br label %L.20
L.21:
	%159 = load i16* %labelse
	call void @llvm_Label(i16 %159)
	%160 = load %ast.AstNode** %node
	%161 = getelementptr %ast.AstNode* %160, i32 0, i32 11
	%162 = load %ast.AstNode** %node
	%163 = getelementptr %ast.AstNode* %162, i32 0, i32 5
	%164 = load i16* %163
	%165 = sub i16 %164, 1
	%166 = zext i16 %165 to i32
	%167 = getelementptr [0 x %ast.AstNode*]* %161, i32 0, i32 %166
	%168 = load %ast.AstNode** %167
	%169 = call i8 @llvm_GenSub(%ast.AstNode* %168)
	%170 = icmp ne i8 %169, 0
	%171 = xor i1 %170, true
	br i1 %171, label %L.26, label %L.25
L.26:
	%172 = load i16* %labend
	call void @llvm_Branch(i16 %172)
	br label %L.25
L.25:
	%173 = load i16* %labend
	call void @llvm_Label(i16 %173)
	store i8 0, i8* %rv.0
	br label %return
return:
	%174 = load i8* %rv.0
	ret i8 %174
}
define zeroext i8 @llvm_Loop(%ast.AstNode* %node.arg) nounwind {
L.0:
	%rv.0 = alloca i8
	%node = alloca %ast.AstNode*
	store %ast.AstNode* %node.arg, %ast.AstNode** %node
	%loopcont = alloca i16
	%saveexit = alloca i16
	%0 = load i16* @llvm_loopexit
	store i16 %0, i16* %saveexit
	%1 = load i16* @llvm_Lseqno
	store i16 %1, i16* %loopcont
	%2 = load i16* @llvm_Lseqno
	%3 = add i16 %2, 1
	store i16 %3, i16* @llvm_Lseqno
	%4 = load i16* @llvm_Lseqno
	store i16 %4, i16* @llvm_loopexit
	%5 = load i16* @llvm_Lseqno
	%6 = add i16 %5, 1
	store i16 %6, i16* @llvm_Lseqno
	%7 = load i16* %loopcont
	call void @llvm_Branch(i16 %7)
	%8 = load i16* %loopcont
	call void @llvm_Label(i16 %8)
	%9 = load %ast.AstNode** %node
	%10 = getelementptr %ast.AstNode* %9, i32 0, i32 11
	%11 = getelementptr [0 x %ast.AstNode*]* %10, i32 0, i32 0
	%12 = load %ast.AstNode** %11
	%13 = call i8 @llvm_GenSub(%ast.AstNode* %12)
	%14 = load i16* %loopcont
	call void @llvm_Branch(i16 %14)
	%15 = load i16* @llvm_loopexit
	call void @llvm_Label(i16 %15)
	%16 = load i16* %saveexit
	store i16 %16, i16* @llvm_loopexit
	store i8 0, i8* %rv.0
	br label %return
return:
	%17 = load i8* %rv.0
	ret i8 %17
}
define zeroext i8 @llvm_Exit(%ast.AstNode* %node.arg) nounwind {
L.0:
	%rv.0 = alloca i8
	%node = alloca %ast.AstNode*
	store %ast.AstNode* %node.arg, %ast.AstNode** %node
	%labtrue = alloca i16
	%labfalse = alloca i16
	%term = alloca i8
	%0 = load i16* @llvm_Lseqno
	store i16 %0, i16* %labfalse
	%1 = load i16* @llvm_Lseqno
	%2 = add i16 %1, 1
	store i16 %2, i16* @llvm_Lseqno
	%3 = load %ast.AstNode** %node
	%4 = getelementptr %ast.AstNode* %3, i32 0, i32 11
	%5 = getelementptr [0 x %ast.AstNode*]* %4, i32 0, i32 0
	%6 = load %ast.AstNode** %5
	%7 = call i8 @llvm_GenSub(%ast.AstNode* %6)
	%8 = load %ast.AstNode** %node
	%9 = getelementptr %ast.AstNode* %8, i32 0, i32 11
	%10 = getelementptr [0 x %ast.AstNode*]* %9, i32 0, i32 1
	%11 = load %ast.AstNode** %10
	%12 = icmp ne %ast.AstNode* %11, null
	br i1 %12, label %L.2, label %L.3
L.2:
	%13 = load i16* @llvm_Lseqno
	store i16 %13, i16* %labtrue
	%14 = load i16* @llvm_Lseqno
	%15 = add i16 %14, 1
	store i16 %15, i16* @llvm_Lseqno
	%16 = load %ast.AstNode** %node
	%17 = getelementptr %ast.AstNode* %16, i32 0, i32 11
	%18 = getelementptr [0 x %ast.AstNode*]* %17, i32 0, i32 0
	%19 = load %ast.AstNode** %18
	%20 = load i16* %labtrue
	%21 = load i16* %labfalse
	call void @llvm_BranchConditional(%ast.AstNode* %19, i16 %20, i16 %21)
	%22 = load i16* %labtrue
	call void @llvm_Label(i16 %22)
	%23 = load %ast.AstNode** %node
	%24 = getelementptr %ast.AstNode* %23, i32 0, i32 11
	%25 = getelementptr [0 x %ast.AstNode*]* %24, i32 0, i32 1
	%26 = load %ast.AstNode** %25
	%27 = call i8 @llvm_GenSub(%ast.AstNode* %26)
	store i8 %27, i8* %term
	%28 = load i8* %term
	%29 = icmp ne i8 %28, 0
	%30 = xor i1 %29, true
	br i1 %30, label %L.5, label %L.4
L.5:
	%31 = load i16* @llvm_loopexit
	call void @llvm_Branch(i16 %31)
	br label %L.4
L.4:
	br label %L.1
L.3:
	%32 = load %ast.AstNode** %node
	%33 = getelementptr %ast.AstNode* %32, i32 0, i32 11
	%34 = getelementptr [0 x %ast.AstNode*]* %33, i32 0, i32 0
	%35 = load %ast.AstNode** %34
	%36 = load i16* @llvm_loopexit
	%37 = load i16* %labfalse
	call void @llvm_BranchConditional(%ast.AstNode* %35, i16 %36, i16 %37)
	br label %L.1
L.1:
	%38 = load i16* %labfalse
	call void @llvm_Label(i16 %38)
	store i8 0, i8* %rv.0
	br label %return
return:
	%39 = load i8* %rv.0
	ret i8 %39
}
define zeroext i8 @llvm_Conditional(%ast.AstNode* %node.arg, i8 zeroext %isand.arg) nounwind {
L.0:
	%rv.0 = alloca i8
	%node = alloca %ast.AstNode*
	%isand = alloca i8
	store %ast.AstNode* %node.arg, %ast.AstNode** %node
	store i8 %isand.arg, i8* %isand
	%lablhs = alloca i16
	%labrhs = alloca i16
	%labend = alloca i16
	%0 = load i16* @llvm_Lseqno
	store i16 %0, i16* %labrhs
	%1 = load i16* @llvm_Lseqno
	%2 = add i16 %1, 1
	store i16 %2, i16* @llvm_Lseqno
	%3 = load i16* @llvm_Lseqno
	store i16 %3, i16* %labend
	%4 = load i16* @llvm_Lseqno
	%5 = add i16 %4, 1
	store i16 %5, i16* @llvm_Lseqno
	%6 = load %ast.AstNode** %node
	%7 = getelementptr %ast.AstNode* %6, i32 0, i32 11
	%8 = getelementptr [0 x %ast.AstNode*]* %7, i32 0, i32 0
	%9 = load %ast.AstNode** %8
	%10 = call i8 @llvm_GenSub(%ast.AstNode* %9)
	%11 = load i8* %isand
	%12 = icmp ne i8 %11, 0
	br i1 %12, label %L.2, label %L.3
L.2:
	%13 = load %ast.AstNode** %node
	%14 = getelementptr %ast.AstNode* %13, i32 0, i32 11
	%15 = getelementptr [0 x %ast.AstNode*]* %14, i32 0, i32 0
	%16 = load %ast.AstNode** %15
	%17 = load i16* %labrhs
	%18 = load i16* %labend
	call void @llvm_BranchConditional(%ast.AstNode* %16, i16 %17, i16 %18)
	br label %L.1
L.3:
	%19 = load %ast.AstNode** %node
	%20 = getelementptr %ast.AstNode* %19, i32 0, i32 11
	%21 = getelementptr [0 x %ast.AstNode*]* %20, i32 0, i32 0
	%22 = load %ast.AstNode** %21
	%23 = load i16* %labend
	%24 = load i16* %labrhs
	call void @llvm_BranchConditional(%ast.AstNode* %22, i16 %23, i16 %24)
	br label %L.1
L.1:
	%25 = load i16* @llvm_labthis
	store i16 %25, i16* %lablhs
	%26 = load i16* %labrhs
	call void @llvm_Label(i16 %26)
	%27 = load %ast.AstNode** %node
	%28 = getelementptr %ast.AstNode* %27, i32 0, i32 11
	%29 = getelementptr [0 x %ast.AstNode*]* %28, i32 0, i32 1
	%30 = load %ast.AstNode** %29
	%31 = call i8 @llvm_GenSub(%ast.AstNode* %30)
	%32 = load i16* @llvm_labthis
	store i16 %32, i16* %labrhs
	%33 = load i16* %labend
	call void @llvm_Branch(i16 %33)
	%34 = load i16* %labend
	call void @llvm_Label(i16 %34)
	%35 = load i16* @llvm_Tseqno
	%36 = load %ast.AstNode** %node
	%37 = getelementptr %ast.AstNode* %36, i32 0, i32 7
	store i16 %35, i16* %37
	%38 = load i16* @llvm_Tseqno
	%39 = add i16 %38, 1
	store i16 %39, i16* @llvm_Tseqno
	%40 = getelementptr [16 x i8]* @.str643
	%41 = bitcast [16 x i8]* %40 to [0 x i8]*
	%42 = load %ast.AstNode** %node
	call void @llvm_Print([0 x i8]* %41, %ast.AstNode* %42)
	%43 = load i8* %isand
	%44 = icmp ne i8 %43, 0
	br i1 %44, label %L.5, label %L.6
L.5:
	%45 = load i32* @llvm_f
	%46 = getelementptr [6 x i8]* @.str644
	%47 = bitcast [6 x i8]* %46 to [0 x i8]*
	call void @out_str(i32 %45, [0 x i8]* %47)
	br label %L.4
L.6:
	%48 = load i32* @llvm_f
	%49 = getelementptr [5 x i8]* @.str645
	%50 = bitcast [5 x i8]* %49 to [0 x i8]*
	call void @out_str(i32 %48, [0 x i8]* %50)
	br label %L.4
L.4:
	%51 = load i32* @llvm_f
	%52 = getelementptr [4 x i8]* @.str646
	%53 = bitcast [4 x i8]* %52 to [0 x i8]*
	call void @out_str(i32 %51, [0 x i8]* %53)
	%54 = load i16* %lablhs
	call void @llvm_PLabel(i16 %54)
	%55 = load i32* @llvm_f
	%56 = getelementptr [7 x i8]* @.str647
	%57 = bitcast [7 x i8]* %56 to [0 x i8]*
	call void @out_str(i32 %55, [0 x i8]* %57)
	%58 = load %ast.AstNode** %node
	%59 = getelementptr %ast.AstNode* %58, i32 0, i32 11
	%60 = getelementptr [0 x %ast.AstNode*]* %59, i32 0, i32 1
	%61 = load %ast.AstNode** %60
	%62 = getelementptr %ast.AstNode* %61, i32 0, i32 7
	%63 = load i16* %62
	call void @llvm_PTempName(i16 %63)
	%64 = load i32* @llvm_f
	%65 = getelementptr [4 x i8]* @.str648
	%66 = bitcast [4 x i8]* %65 to [0 x i8]*
	call void @out_str(i32 %64, [0 x i8]* %66)
	%67 = load i16* %labrhs
	call void @llvm_PLabel(i16 %67)
	%68 = load i32* @llvm_f
	%69 = getelementptr [4 x i8]* @.str649
	%70 = bitcast [4 x i8]* %69 to [0 x i8]*
	call void @out_str(i32 %68, [0 x i8]* %70)
	store i8 0, i8* %rv.0
	br label %return
return:
	%71 = load i8* %rv.0
	ret i8 %71
}
define void @llvm_Copy(%ast.AstNode* %node.arg) nounwind {
L.0:
	%node = alloca %ast.AstNode*
	store %ast.AstNode* %node.arg, %ast.AstNode** %node
	%0 = icmp ne i8 1, 0
	br i1 %0, label %L.2, label %L.1
L.2:
	%1 = load %ast.AstNode** %node
	%2 = getelementptr %ast.AstNode* %1, i32 0, i32 11
	%3 = getelementptr [0 x %ast.AstNode*]* %2, i32 0, i32 0
	%4 = load %ast.AstNode** %3
	%5 = load %type.TypeNode** @llvm_pbytetype
	%6 = call %ast.AstNode* @expr_Cast(%ast.AstNode* %4, %type.TypeNode* %5)
	%7 = load %ast.AstNode** %node
	%8 = getelementptr %ast.AstNode* %7, i32 0, i32 11
	%9 = getelementptr [0 x %ast.AstNode*]* %8, i32 0, i32 0
	store %ast.AstNode* %6, %ast.AstNode** %9
	%10 = load %ast.AstNode** %node
	%11 = getelementptr %ast.AstNode* %10, i32 0, i32 11
	%12 = getelementptr [0 x %ast.AstNode*]* %11, i32 0, i32 1
	%13 = load %ast.AstNode** %12
	%14 = load %type.TypeNode** @llvm_pbytetype
	%15 = call %ast.AstNode* @expr_Cast(%ast.AstNode* %13, %type.TypeNode* %14)
	%16 = load %ast.AstNode** %node
	%17 = getelementptr %ast.AstNode* %16, i32 0, i32 11
	%18 = getelementptr [0 x %ast.AstNode*]* %17, i32 0, i32 1
	store %ast.AstNode* %15, %ast.AstNode** %18
	br label %L.1
L.1:
	%19 = load %ast.AstNode** %node
	%20 = getelementptr %ast.AstNode* %19, i32 0, i32 11
	%21 = getelementptr [0 x %ast.AstNode*]* %20, i32 0, i32 0
	%22 = load %ast.AstNode** %21
	%23 = call i8 @llvm_GenSub(%ast.AstNode* %22)
	%24 = load %ast.AstNode** %node
	%25 = getelementptr %ast.AstNode* %24, i32 0, i32 11
	%26 = getelementptr [0 x %ast.AstNode*]* %25, i32 0, i32 1
	%27 = load %ast.AstNode** %26
	%28 = call i8 @llvm_GenSub(%ast.AstNode* %27)
	%29 = load %ast.AstNode** %node
	%30 = getelementptr %ast.AstNode* %29, i32 0, i32 11
	%31 = getelementptr [0 x %ast.AstNode*]* %30, i32 0, i32 2
	%32 = load %ast.AstNode** %31
	%33 = load %type.TypeNode** @type_wordtype
	%34 = getelementptr %type.TypeNode* %33, i32 0, i32 7
	%35 = load i32* %34
	%36 = call %ast.AstNode* @expr_Extend(%ast.AstNode* %32, i32 %35)
	%37 = load %ast.AstNode** %node
	%38 = getelementptr %ast.AstNode* %37, i32 0, i32 11
	%39 = getelementptr [0 x %ast.AstNode*]* %38, i32 0, i32 2
	store %ast.AstNode* %36, %ast.AstNode** %39
	%40 = load %ast.AstNode** %node
	%41 = getelementptr %ast.AstNode* %40, i32 0, i32 11
	%42 = getelementptr [0 x %ast.AstNode*]* %41, i32 0, i32 2
	%43 = load %ast.AstNode** %42
	%44 = call i8 @llvm_GenSub(%ast.AstNode* %43)
	%45 = icmp ne i8 1, 0
	br i1 %45, label %L.4, label %L.5
L.4:
	%46 = getelementptr [65 x i8]* @.str650
	%47 = bitcast [65 x i8]* %46 to [0 x i8]*
	%48 = load %ast.AstNode** %node
	call void @llvm_Print([0 x i8]* %47, %ast.AstNode* %48)
	br label %L.3
L.5:
	%49 = getelementptr [63 x i8]* @.str651
	%50 = bitcast [63 x i8]* %49 to [0 x i8]*
	%51 = load %ast.AstNode** %node
	call void @llvm_Print([0 x i8]* %50, %ast.AstNode* %51)
	br label %L.3
L.3:
	%52 = getelementptr [10 x i8]* @llvm_UseIntrinsic, i32 0, i32 0
	store i8 1, i8* %52
	br label %return
return:
	ret void
}
define zeroext i8 @llvm_GetChunkSize(i32 %size.arg, i32 %align.arg) nounwind {
L.0:
	%rv.0 = alloca i8
	%size = alloca i32
	%align = alloca i32
	store i32 %size.arg, i32* %size
	store i32 %align.arg, i32* %align
	%is = alloca i8
	%ia = alloca i8
	store i8 0, i8* %ia
	%0 = load i32* %align
	%1 = icmp ugt i32 %0, 0
	br i1 %1, label %L.2, label %L.1
L.2:
	br label %L.3
L.3:
	%2 = load i8* %ia
	%3 = load %target.TargetT** @target_Target
	%4 = getelementptr %target.TargetT* %3, i32 0, i32 7
	%5 = load i8* %4
	%6 = sub i8 %5, 1
	%7 = icmp ult i8 %2, %6
	br i1 %7, label %L.6, label %L.7
L.6:
	%8 = load i32* %align
	%9 = load %target.TargetT** @target_Target
	%10 = getelementptr %target.TargetT* %9, i32 0, i32 9
	%11 = load i8* %ia
	%12 = zext i8 %11 to i32
	%13 = getelementptr [8 x %target.SizeAlign]* %10, i32 0, i32 %12
	%14 = getelementptr %target.SizeAlign* %13, i32 0, i32 1
	%15 = load i8* %14
	%16 = load %target.TargetT** @target_Target
	%17 = getelementptr %target.TargetT* %16, i32 0, i32 3
	%18 = load i8* %17
	%19 = udiv i8 %15, %18
	%20 = zext i8 %19 to i32
	%21 = icmp ugt i32 %8, %20
	br label %L.7
L.7:
	%22 = phi i1 [ false, %L.3 ], [ %21, %L.6 ]
	%23 = xor i1 %22, true
	br i1 %23, label %L.4, label %L.5
L.5:
	%24 = load i8* %ia
	%25 = add i8 %24, 1
	store i8 %25, i8* %ia
	br label %L.3
L.4:
	br label %L.1
L.1:
	%26 = load i8* %ia
	store i8 %26, i8* %is
	%27 = load i32* %size
	%28 = icmp ugt i32 %27, 0
	br i1 %28, label %L.9, label %L.8
L.9:
	store i8 0, i8* %is
	br label %L.10
L.10:
	%29 = load i8* %is
	%30 = load %target.TargetT** @target_Target
	%31 = getelementptr %target.TargetT* %30, i32 0, i32 7
	%32 = load i8* %31
	%33 = sub i8 %32, 1
	%34 = icmp ult i8 %29, %33
	br i1 %34, label %L.13, label %L.14
L.13:
	%35 = load i32* %size
	%36 = load %target.TargetT** @target_Target
	%37 = getelementptr %target.TargetT* %36, i32 0, i32 9
	%38 = load i8* %is
	%39 = zext i8 %38 to i32
	%40 = getelementptr [8 x %target.SizeAlign]* %37, i32 0, i32 %39
	%41 = getelementptr %target.SizeAlign* %40, i32 0, i32 0
	%42 = load i8* %41
	%43 = load %target.TargetT** @target_Target
	%44 = getelementptr %target.TargetT* %43, i32 0, i32 3
	%45 = load i8* %44
	%46 = udiv i8 %42, %45
	%47 = zext i8 %46 to i32
	%48 = icmp ugt i32 %35, %47
	br label %L.14
L.14:
	%49 = phi i1 [ false, %L.10 ], [ %48, %L.13 ]
	%50 = xor i1 %49, true
	br i1 %50, label %L.11, label %L.12
L.12:
	%51 = load i8* %is
	%52 = add i8 %51, 1
	store i8 %52, i8* %is
	br label %L.10
L.11:
	br label %L.8
L.8:
	%53 = load i8* %ia
	%54 = load i8* %is
	%55 = icmp ult i8 %53, %54
	br i1 %55, label %L.16, label %L.15
L.16:
	%56 = load i8* %ia
	store i8 %56, i8* %is
	br label %L.15
L.15:
	%57 = load i8* %is
	store i8 %57, i8* %rv.0
	br label %return
return:
	%58 = load i8* %rv.0
	ret i8 %58
}
define zeroext i8 @llvm_ArrayCompare(%ast.AstNode* %node.arg) nounwind {
L.0:
	%rv.0 = alloca i8
	%node = alloca %ast.AstNode*
	store %ast.AstNode* %node.arg, %ast.AstNode** %node
	%length = alloca i32
	%align = alloca i32
	%size = alloca i32
	%i = alloca i8
	store i32 0, i32* %length
	%0 = load %ast.AstNode** %node
	%1 = getelementptr %ast.AstNode* %0, i32 0, i32 11
	%2 = getelementptr [0 x %ast.AstNode*]* %1, i32 0, i32 2
	%3 = load %ast.AstNode** %2
	%4 = getelementptr %ast.AstNode* %3, i32 0, i32 0
	%5 = load i8* %4
	%6 = icmp eq i8 %5, 7
	br i1 %6, label %L.2, label %L.1
L.2:
	%7 = load %ast.AstNode** %node
	%8 = getelementptr %ast.AstNode* %7, i32 0, i32 11
	%9 = getelementptr [0 x %ast.AstNode*]* %8, i32 0, i32 2
	%10 = load %ast.AstNode** %9
	%11 = getelementptr %ast.AstNode* %10, i32 0, i32 8
	%12 = load i64* %11
	%13 = trunc i64 %12 to i32
	store i32 %13, i32* %length
	br label %L.1
L.1:
	%14 = load %ast.AstNode** %node
	%15 = getelementptr %ast.AstNode* %14, i32 0, i32 11
	%16 = getelementptr [0 x %ast.AstNode*]* %15, i32 0, i32 3
	%17 = load %ast.AstNode** %16
	%18 = getelementptr %ast.AstNode* %17, i32 0, i32 8
	%19 = load i64* %18
	%20 = trunc i64 %19 to i32
	store i32 %20, i32* %align
	%21 = getelementptr [36 x i8]* @.str652
	%22 = bitcast [36 x i8]* %21 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %22)
	%23 = load i32* %length
	%24 = icmp eq i32 %23, 0
	br i1 %24, label %L.4, label %L.5
L.4:
	%25 = getelementptr [9 x i8]* @.str653
	%26 = bitcast [9 x i8]* %25 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %26)
	br label %L.3
L.5:
	%27 = load i32* %length
	call void @out_uint(i32 2, i32 %27)
	br label %L.3
L.3:
	%28 = load i32* %length
	%29 = load i32* %align
	%30 = call i8 @llvm_GetChunkSize(i32 %28, i32 %29)
	store i8 %30, i8* %i
	%31 = load %target.TargetT** @target_Target
	%32 = getelementptr %target.TargetT* %31, i32 0, i32 9
	%33 = load i8* %i
	%34 = zext i8 %33 to i32
	%35 = getelementptr [8 x %target.SizeAlign]* %32, i32 0, i32 %34
	%36 = getelementptr %target.SizeAlign* %35, i32 0, i32 0
	%37 = load i8* %36
	%38 = load %target.TargetT** @target_Target
	%39 = getelementptr %target.TargetT* %38, i32 0, i32 3
	%40 = load i8* %39
	%41 = udiv i8 %37, %40
	%42 = zext i8 %41 to i32
	store i32 %42, i32* %size
	%43 = load %target.TargetT** @target_Target
	%44 = getelementptr %target.TargetT* %43, i32 0, i32 9
	%45 = load i8* %i
	%46 = zext i8 %45 to i32
	%47 = getelementptr [8 x %target.SizeAlign]* %44, i32 0, i32 %46
	%48 = getelementptr %target.SizeAlign* %47, i32 0, i32 1
	%49 = load i8* %48
	%50 = load %target.TargetT** @target_Target
	%51 = getelementptr %target.TargetT* %50, i32 0, i32 3
	%52 = load i8* %51
	%53 = udiv i8 %49, %52
	%54 = zext i8 %53 to i32
	store i32 %54, i32* %align
	%55 = getelementptr [7 x i8]* @.str654
	%56 = bitcast [7 x i8]* %55 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %56)
	%57 = load i32* %size
	call void @out_uint(i32 2, i32 %57)
	%58 = getelementptr [8 x i8]* @.str655
	%59 = bitcast [8 x i8]* %58 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %59)
	%60 = load i32* %align
	call void @out_uint(i32 2, i32 %60)
	%61 = load i32* %length
	%62 = icmp ne i32 %61, 0
	br i1 %62, label %L.6, label %L.7
L.6:
	%63 = load i32* %length
	%64 = load i32* %size
	%65 = icmp ule i32 %63, %64
	br label %L.7
L.7:
	%66 = phi i1 [ false, %L.3 ], [ %65, %L.6 ]
	br i1 %66, label %L.9, label %L.10
L.9:
	%67 = load %ast.AstNode** %node
	%68 = getelementptr %ast.AstNode* %67, i32 0, i32 11
	%69 = getelementptr [0 x %ast.AstNode*]* %68, i32 0, i32 0
	%70 = load %ast.AstNode** %69
	%71 = load i8* %i
	%72 = zext i8 %71 to i32
	%73 = getelementptr [4 x %type.TypeNode*]* @llvm_puinttype, i32 0, i32 %72
	%74 = load %type.TypeNode** %73
	%75 = call %ast.AstNode* @expr_Cast(%ast.AstNode* %70, %type.TypeNode* %74)
	%76 = load %ast.AstNode** %node
	%77 = getelementptr %ast.AstNode* %76, i32 0, i32 11
	%78 = getelementptr [0 x %ast.AstNode*]* %77, i32 0, i32 0
	store %ast.AstNode* %75, %ast.AstNode** %78
	%79 = load i8* %i
	%80 = zext i8 %79 to i32
	%81 = getelementptr [4 x %type.TypeNode*]* @llvm_puinttype, i32 0, i32 %80
	%82 = load %type.TypeNode** %81
	%83 = getelementptr %type.TypeNode* %82, i32 0, i32 0
	%84 = load %type.TypeNode** %83
	%85 = getelementptr %type.TypeNode* %84, i32 0, i32 8
	%86 = load i32* %85
	%87 = trunc i32 %86 to i8
	%88 = load %ast.AstNode** %node
	%89 = getelementptr %ast.AstNode* %88, i32 0, i32 11
	%90 = getelementptr [0 x %ast.AstNode*]* %89, i32 0, i32 0
	%91 = load %ast.AstNode** %90
	%92 = getelementptr %ast.AstNode* %91, i32 0, i32 2
	store i8 %87, i8* %92
	%93 = load i8* %i
	%94 = zext i8 %93 to i32
	%95 = getelementptr [4 x %type.TypeNode*]* @llvm_puinttype, i32 0, i32 %94
	%96 = load %type.TypeNode** %95
	%97 = getelementptr %type.TypeNode* %96, i32 0, i32 0
	%98 = load %type.TypeNode** %97
	%99 = load %ast.AstNode** %node
	%100 = getelementptr %ast.AstNode* %99, i32 0, i32 11
	%101 = getelementptr [0 x %ast.AstNode*]* %100, i32 0, i32 0
	%102 = load %ast.AstNode** %101
	%103 = call %ast.AstNode* @ast_New1(i8 25, %type.TypeNode* %98, %ast.AstNode* %102)
	%104 = load %ast.AstNode** %node
	%105 = getelementptr %ast.AstNode* %104, i32 0, i32 11
	%106 = getelementptr [0 x %ast.AstNode*]* %105, i32 0, i32 0
	store %ast.AstNode* %103, %ast.AstNode** %106
	%107 = load i8* %i
	%108 = zext i8 %107 to i32
	%109 = getelementptr [4 x %type.TypeNode*]* @llvm_puinttype, i32 0, i32 %108
	%110 = load %type.TypeNode** %109
	%111 = getelementptr %type.TypeNode* %110, i32 0, i32 0
	%112 = load %type.TypeNode** %111
	%113 = getelementptr %type.TypeNode* %112, i32 0, i32 11
	%114 = load i8* %113
	%115 = load %ast.AstNode** %node
	%116 = getelementptr %ast.AstNode* %115, i32 0, i32 11
	%117 = getelementptr [0 x %ast.AstNode*]* %116, i32 0, i32 0
	%118 = load %ast.AstNode** %117
	%119 = getelementptr %ast.AstNode* %118, i32 0, i32 1
	store i8 %114, i8* %119
	%120 = load %ast.AstNode** %node
	%121 = getelementptr %ast.AstNode* %120, i32 0, i32 11
	%122 = getelementptr [0 x %ast.AstNode*]* %121, i32 0, i32 1
	%123 = load %ast.AstNode** %122
	%124 = load i8* %i
	%125 = zext i8 %124 to i32
	%126 = getelementptr [4 x %type.TypeNode*]* @llvm_puinttype, i32 0, i32 %125
	%127 = load %type.TypeNode** %126
	%128 = call %ast.AstNode* @expr_Cast(%ast.AstNode* %123, %type.TypeNode* %127)
	%129 = load %ast.AstNode** %node
	%130 = getelementptr %ast.AstNode* %129, i32 0, i32 11
	%131 = getelementptr [0 x %ast.AstNode*]* %130, i32 0, i32 1
	store %ast.AstNode* %128, %ast.AstNode** %131
	%132 = load i8* %i
	%133 = zext i8 %132 to i32
	%134 = getelementptr [4 x %type.TypeNode*]* @llvm_puinttype, i32 0, i32 %133
	%135 = load %type.TypeNode** %134
	%136 = getelementptr %type.TypeNode* %135, i32 0, i32 0
	%137 = load %type.TypeNode** %136
	%138 = getelementptr %type.TypeNode* %137, i32 0, i32 8
	%139 = load i32* %138
	%140 = trunc i32 %139 to i8
	%141 = load %ast.AstNode** %node
	%142 = getelementptr %ast.AstNode* %141, i32 0, i32 11
	%143 = getelementptr [0 x %ast.AstNode*]* %142, i32 0, i32 1
	%144 = load %ast.AstNode** %143
	%145 = getelementptr %ast.AstNode* %144, i32 0, i32 2
	store i8 %140, i8* %145
	%146 = load i8* %i
	%147 = zext i8 %146 to i32
	%148 = getelementptr [4 x %type.TypeNode*]* @llvm_puinttype, i32 0, i32 %147
	%149 = load %type.TypeNode** %148
	%150 = getelementptr %type.TypeNode* %149, i32 0, i32 0
	%151 = load %type.TypeNode** %150
	%152 = load %ast.AstNode** %node
	%153 = getelementptr %ast.AstNode* %152, i32 0, i32 11
	%154 = getelementptr [0 x %ast.AstNode*]* %153, i32 0, i32 1
	%155 = load %ast.AstNode** %154
	%156 = call %ast.AstNode* @ast_New1(i8 25, %type.TypeNode* %151, %ast.AstNode* %155)
	%157 = load %ast.AstNode** %node
	%158 = getelementptr %ast.AstNode* %157, i32 0, i32 11
	%159 = getelementptr [0 x %ast.AstNode*]* %158, i32 0, i32 1
	store %ast.AstNode* %156, %ast.AstNode** %159
	%160 = load i8* %i
	%161 = zext i8 %160 to i32
	%162 = getelementptr [4 x %type.TypeNode*]* @llvm_puinttype, i32 0, i32 %161
	%163 = load %type.TypeNode** %162
	%164 = getelementptr %type.TypeNode* %163, i32 0, i32 0
	%165 = load %type.TypeNode** %164
	%166 = getelementptr %type.TypeNode* %165, i32 0, i32 11
	%167 = load i8* %166
	%168 = load %ast.AstNode** %node
	%169 = getelementptr %ast.AstNode* %168, i32 0, i32 11
	%170 = getelementptr [0 x %ast.AstNode*]* %169, i32 0, i32 1
	%171 = load %ast.AstNode** %170
	%172 = getelementptr %ast.AstNode* %171, i32 0, i32 1
	store i8 %167, i8* %172
	%173 = load i32* %length
	%174 = load i32* %size
	%175 = icmp ult i32 %173, %174
	br i1 %175, label %L.12, label %L.11
L.12:
	%mask = alloca i64
	%176 = load %target.TargetT** @target_Target
	%177 = getelementptr %target.TargetT* %176, i32 0, i32 2
	%178 = load i8* %177
	%179 = icmp eq i8 %178, 1
	br i1 %179, label %L.14, label %L.15
L.14:
	%180 = load i32* %size
	%181 = load i32* %length
	%182 = sub i32 %180, %181
	%183 = mul i32 %182, 8
	%184 = zext i32 %183 to i64
	%185 = shl i64 1, %184
	%186 = sub i64 %185, 1
	%187 = xor i64 %186, -1
	store i64 %187, i64* %mask
	br label %L.13
L.15:
	%188 = load i32* %length
	%189 = mul i32 %188, 8
	%190 = zext i32 %189 to i64
	%191 = shl i64 1, %190
	%192 = sub i64 %191, 1
	store i64 %192, i64* %mask
	br label %L.13
L.13:
	%193 = getelementptr [9 x i8]* @.str656
	%194 = bitcast [9 x i8]* %193 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %194)
	%195 = load i64* %mask
	call void @out_hex64(i32 2, i64 %195)
	%196 = load i8* %i
	%197 = zext i8 %196 to i32
	%198 = getelementptr [4 x %type.TypeNode*]* @llvm_puinttype, i32 0, i32 %197
	%199 = load %type.TypeNode** %198
	%200 = getelementptr %type.TypeNode* %199, i32 0, i32 0
	%201 = load %type.TypeNode** %200
	%202 = load %ast.AstNode** %node
	%203 = getelementptr %ast.AstNode* %202, i32 0, i32 11
	%204 = getelementptr [0 x %ast.AstNode*]* %203, i32 0, i32 0
	%205 = load %ast.AstNode** %204
	%206 = load %ast.AstNode** %node
	%207 = getelementptr %ast.AstNode* %206, i32 0, i32 11
	%208 = getelementptr [0 x %ast.AstNode*]* %207, i32 0, i32 1
	%209 = load %ast.AstNode** %208
	%210 = call %ast.AstNode* @ast_New2(i8 58, %type.TypeNode* %201, %ast.AstNode* %205, %ast.AstNode* %209)
	%211 = load %ast.AstNode** %node
	%212 = getelementptr %ast.AstNode* %211, i32 0, i32 11
	%213 = getelementptr [0 x %ast.AstNode*]* %212, i32 0, i32 0
	store %ast.AstNode* %210, %ast.AstNode** %213
	%214 = load i8* %i
	%215 = zext i8 %214 to i32
	%216 = getelementptr [4 x %type.TypeNode*]* @llvm_puinttype, i32 0, i32 %215
	%217 = load %type.TypeNode** %216
	%218 = getelementptr %type.TypeNode* %217, i32 0, i32 0
	%219 = load %type.TypeNode** %218
	%220 = load %ast.AstNode** %node
	%221 = getelementptr %ast.AstNode* %220, i32 0, i32 11
	%222 = getelementptr [0 x %ast.AstNode*]* %221, i32 0, i32 0
	%223 = load %ast.AstNode** %222
	%224 = load i8* %i
	%225 = zext i8 %224 to i32
	%226 = getelementptr [4 x %type.TypeNode*]* @llvm_puinttype, i32 0, i32 %225
	%227 = load %type.TypeNode** %226
	%228 = getelementptr %type.TypeNode* %227, i32 0, i32 0
	%229 = load %type.TypeNode** %228
	%230 = load i64* %mask
	%231 = call %ast.AstNode* @ast_Const(%type.TypeNode* %229, i64 %230)
	%232 = call %ast.AstNode* @ast_New2(i8 56, %type.TypeNode* %219, %ast.AstNode* %223, %ast.AstNode* %231)
	%233 = load %ast.AstNode** %node
	%234 = getelementptr %ast.AstNode* %233, i32 0, i32 11
	%235 = getelementptr [0 x %ast.AstNode*]* %234, i32 0, i32 0
	store %ast.AstNode* %232, %ast.AstNode** %235
	%236 = load i8* %i
	%237 = zext i8 %236 to i32
	%238 = getelementptr [4 x %type.TypeNode*]* @llvm_puinttype, i32 0, i32 %237
	%239 = load %type.TypeNode** %238
	%240 = getelementptr %type.TypeNode* %239, i32 0, i32 0
	%241 = load %type.TypeNode** %240
	%242 = call %ast.AstNode* @ast_Const(%type.TypeNode* %241, i64 0)
	%243 = load %ast.AstNode** %node
	%244 = getelementptr %ast.AstNode* %243, i32 0, i32 11
	%245 = getelementptr [0 x %ast.AstNode*]* %244, i32 0, i32 1
	store %ast.AstNode* %242, %ast.AstNode** %245
	br label %L.11
L.11:
	%246 = load %ast.AstNode** %node
	%247 = getelementptr %ast.AstNode* %246, i32 0, i32 11
	%248 = getelementptr [0 x %ast.AstNode*]* %247, i32 0, i32 0
	%249 = load %ast.AstNode** %248
	%250 = call i8 @llvm_GenSub(%ast.AstNode* %249)
	%251 = load %ast.AstNode** %node
	%252 = getelementptr %ast.AstNode* %251, i32 0, i32 11
	%253 = getelementptr [0 x %ast.AstNode*]* %252, i32 0, i32 1
	%254 = load %ast.AstNode** %253
	%255 = call i8 @llvm_GenSub(%ast.AstNode* %254)
	%256 = load i16* @llvm_Tseqno
	%257 = load %ast.AstNode** %node
	%258 = getelementptr %ast.AstNode* %257, i32 0, i32 7
	store i16 %256, i16* %258
	%259 = load i16* @llvm_Tseqno
	%260 = add i16 %259, 1
	store i16 %260, i16* @llvm_Tseqno
	%261 = load %ast.AstNode** %node
	%262 = getelementptr %ast.AstNode* %261, i32 0, i32 1
	store i8 1, i8* %262
	%263 = load %ast.AstNode** %node
	%264 = getelementptr %ast.AstNode* %263, i32 0, i32 2
	store i8 1, i8* %264
	%265 = load %ast.AstNode** %node
	%266 = getelementptr %ast.AstNode* %265, i32 0, i32 0
	%267 = load i8* %266
	%268 = icmp eq i8 %267, 22
	br i1 %268, label %L.17, label %L.18
L.17:
	%269 = getelementptr [28 x i8]* @.str657
	%270 = bitcast [28 x i8]* %269 to [0 x i8]*
	%271 = load %ast.AstNode** %node
	call void @llvm_Print([0 x i8]* %270, %ast.AstNode* %271)
	br label %L.16
L.18:
	%272 = getelementptr [28 x i8]* @.str658
	%273 = bitcast [28 x i8]* %272 to [0 x i8]*
	%274 = load %ast.AstNode** %node
	call void @llvm_Print([0 x i8]* %273, %ast.AstNode* %274)
	br label %L.16
L.16:
	call void @out_nl(i32 2)
	store i8 1, i8* %rv.0
	br label %return
L.10:
	%275 = load %ast.AstNode** %node
	%276 = getelementptr %ast.AstNode* %275, i32 0, i32 11
	%277 = getelementptr [0 x %ast.AstNode*]* %276, i32 0, i32 0
	%278 = load %ast.AstNode** %277
	%279 = load i8* %i
	%280 = zext i8 %279 to i32
	%281 = getelementptr [4 x %type.TypeNode*]* @llvm_puinttype, i32 0, i32 %280
	%282 = load %type.TypeNode** %281
	%283 = call %ast.AstNode* @expr_Cast(%ast.AstNode* %278, %type.TypeNode* %282)
	%284 = load %ast.AstNode** %node
	%285 = getelementptr %ast.AstNode* %284, i32 0, i32 11
	%286 = getelementptr [0 x %ast.AstNode*]* %285, i32 0, i32 0
	store %ast.AstNode* %283, %ast.AstNode** %286
	%287 = load i8* %i
	%288 = zext i8 %287 to i32
	%289 = getelementptr [4 x %type.TypeNode*]* @llvm_puinttype, i32 0, i32 %288
	%290 = load %type.TypeNode** %289
	%291 = getelementptr %type.TypeNode* %290, i32 0, i32 0
	%292 = load %type.TypeNode** %291
	%293 = getelementptr %type.TypeNode* %292, i32 0, i32 8
	%294 = load i32* %293
	%295 = trunc i32 %294 to i8
	%296 = load %ast.AstNode** %node
	%297 = getelementptr %ast.AstNode* %296, i32 0, i32 11
	%298 = getelementptr [0 x %ast.AstNode*]* %297, i32 0, i32 0
	%299 = load %ast.AstNode** %298
	%300 = getelementptr %ast.AstNode* %299, i32 0, i32 2
	store i8 %295, i8* %300
	%301 = load %ast.AstNode** %node
	%302 = getelementptr %ast.AstNode* %301, i32 0, i32 11
	%303 = getelementptr [0 x %ast.AstNode*]* %302, i32 0, i32 1
	%304 = load %ast.AstNode** %303
	%305 = load i8* %i
	%306 = zext i8 %305 to i32
	%307 = getelementptr [4 x %type.TypeNode*]* @llvm_puinttype, i32 0, i32 %306
	%308 = load %type.TypeNode** %307
	%309 = call %ast.AstNode* @expr_Cast(%ast.AstNode* %304, %type.TypeNode* %308)
	%310 = load %ast.AstNode** %node
	%311 = getelementptr %ast.AstNode* %310, i32 0, i32 11
	%312 = getelementptr [0 x %ast.AstNode*]* %311, i32 0, i32 1
	store %ast.AstNode* %309, %ast.AstNode** %312
	%313 = load i8* %i
	%314 = zext i8 %313 to i32
	%315 = getelementptr [4 x %type.TypeNode*]* @llvm_puinttype, i32 0, i32 %314
	%316 = load %type.TypeNode** %315
	%317 = getelementptr %type.TypeNode* %316, i32 0, i32 0
	%318 = load %type.TypeNode** %317
	%319 = getelementptr %type.TypeNode* %318, i32 0, i32 8
	%320 = load i32* %319
	%321 = trunc i32 %320 to i8
	%322 = load %ast.AstNode** %node
	%323 = getelementptr %ast.AstNode* %322, i32 0, i32 11
	%324 = getelementptr [0 x %ast.AstNode*]* %323, i32 0, i32 1
	%325 = load %ast.AstNode** %324
	%326 = getelementptr %ast.AstNode* %325, i32 0, i32 2
	store i8 %321, i8* %326
	%327 = load %ast.AstNode** %node
	%328 = getelementptr %ast.AstNode* %327, i32 0, i32 11
	%329 = getelementptr [0 x %ast.AstNode*]* %328, i32 0, i32 0
	%330 = load %ast.AstNode** %329
	%331 = call i8 @llvm_GenSub(%ast.AstNode* %330)
	%332 = load %ast.AstNode** %node
	%333 = getelementptr %ast.AstNode* %332, i32 0, i32 11
	%334 = getelementptr [0 x %ast.AstNode*]* %333, i32 0, i32 1
	%335 = load %ast.AstNode** %334
	%336 = call i8 @llvm_GenSub(%ast.AstNode* %335)
	%337 = load i32* %size
	%338 = icmp ugt i32 %337, 1
	br i1 %338, label %L.20, label %L.19
L.20:
	%339 = load %type.TypeNode** @type_wordtype
	%340 = load %ast.AstNode** %node
	%341 = getelementptr %ast.AstNode* %340, i32 0, i32 11
	%342 = getelementptr [0 x %ast.AstNode*]* %341, i32 0, i32 2
	%343 = load %ast.AstNode** %342
	%344 = load %type.TypeNode** @type_wordtype
	%345 = load i32* %size
	%346 = zext i32 %345 to i64
	%347 = call %ast.AstNode* @ast_Const(%type.TypeNode* %344, i64 %346)
	%348 = call %ast.AstNode* @ast_New2(i8 36, %type.TypeNode* %339, %ast.AstNode* %343, %ast.AstNode* %347)
	%349 = load %ast.AstNode** %node
	%350 = getelementptr %ast.AstNode* %349, i32 0, i32 11
	%351 = getelementptr [0 x %ast.AstNode*]* %350, i32 0, i32 2
	store %ast.AstNode* %348, %ast.AstNode** %351
	br label %L.19
L.19:
	%352 = load %ast.AstNode** %node
	%353 = getelementptr %ast.AstNode* %352, i32 0, i32 11
	%354 = getelementptr [0 x %ast.AstNode*]* %353, i32 0, i32 2
	%355 = load %ast.AstNode** %354
	%356 = load %type.TypeNode** @type_wordtype
	%357 = getelementptr %type.TypeNode* %356, i32 0, i32 7
	%358 = load i32* %357
	%359 = call %ast.AstNode* @expr_Extend(%ast.AstNode* %355, i32 %358)
	%360 = load %ast.AstNode** %node
	%361 = getelementptr %ast.AstNode* %360, i32 0, i32 11
	%362 = getelementptr [0 x %ast.AstNode*]* %361, i32 0, i32 2
	store %ast.AstNode* %359, %ast.AstNode** %362
	%363 = load %ast.AstNode** %node
	%364 = getelementptr %ast.AstNode* %363, i32 0, i32 11
	%365 = getelementptr [0 x %ast.AstNode*]* %364, i32 0, i32 2
	%366 = load %ast.AstNode** %365
	%367 = call i8 @llvm_GenSub(%ast.AstNode* %366)
	%368 = load i16* @llvm_Tseqno
	%369 = load %ast.AstNode** %node
	%370 = getelementptr %ast.AstNode* %369, i32 0, i32 7
	store i16 %368, i16* %370
	%371 = load i16* @llvm_Tseqno
	%372 = add i16 %371, 1
	store i16 %372, i16* @llvm_Tseqno
	%373 = load %ast.AstNode** %node
	%374 = getelementptr %ast.AstNode* %373, i32 0, i32 1
	store i8 1, i8* %374
	%375 = load %ast.AstNode** %node
	%376 = getelementptr %ast.AstNode* %375, i32 0, i32 2
	store i8 1, i8* %376
	%377 = getelementptr [32 x i8]* @.str659
	%378 = bitcast [32 x i8]* %377 to [0 x i8]*
	%379 = load %ast.AstNode** %node
	call void @llvm_Print([0 x i8]* %378, %ast.AstNode* %379)
	%380 = load i8* %i
	%381 = zext i8 %380 to i32
	%382 = getelementptr [4 x %type.TypeNode*]* @llvm_puinttype, i32 0, i32 %381
	%383 = load %type.TypeNode** %382
	%384 = getelementptr %type.TypeNode* %383, i32 0, i32 0
	%385 = load %type.TypeNode** %384
	call void @llvm_PType(%type.TypeNode* %385, i8 0)
	%386 = getelementptr [29 x i8]* @.str660
	%387 = bitcast [29 x i8]* %386 to [0 x i8]*
	%388 = load %ast.AstNode** %node
	call void @llvm_Print([0 x i8]* %387, %ast.AstNode* %388)
	%389 = load i8* %i
	%390 = add i8 5, %389
	%391 = zext i8 %390 to i32
	%392 = getelementptr [10 x i8]* @llvm_UseIntrinsic, i32 0, i32 %391
	store i8 1, i8* %392
	br label %L.8
L.8:
	call void @out_nl(i32 2)
	store i8 0, i8* %rv.0
	br label %return
return:
	%393 = load i8* %rv.0
	ret i8 %393
}
define void @llvm_Swap(%ast.AstNode* %node.arg) nounwind {
L.0:
	%node = alloca %ast.AstNode*
	store %ast.AstNode* %node.arg, %ast.AstNode** %node
	%0 = load %ast.AstNode** %node
	%1 = getelementptr %ast.AstNode* %0, i32 0, i32 11
	%2 = getelementptr [0 x %ast.AstNode*]* %1, i32 0, i32 0
	%3 = load %ast.AstNode** %2
	%4 = call i8 @llvm_GenSub(%ast.AstNode* %3)
	%5 = load %ast.AstNode** %node
	%6 = getelementptr %ast.AstNode* %5, i32 0, i32 2
	%7 = load i8* %6
	%8 = zext i8 %7 to i32
	switch i32 %8, label %L.1 [
		i32 16, label %L.3
		i32 32, label %L.4
		i32 64, label %L.5
	]
L.3:
	%9 = getelementptr [10 x i8]* @llvm_UseIntrinsic, i32 0, i32 2
	store i8 1, i8* %9
	br label %L.2
L.4:
	%10 = getelementptr [10 x i8]* @llvm_UseIntrinsic, i32 0, i32 3
	store i8 1, i8* %10
	br label %L.2
L.5:
	%11 = getelementptr [10 x i8]* @llvm_UseIntrinsic, i32 0, i32 4
	store i8 1, i8* %11
	br label %L.2
L.1:
	%12 = load %ast.AstNode** %node
	%13 = getelementptr %ast.AstNode* %12, i32 0, i32 11
	%14 = getelementptr [0 x %ast.AstNode*]* %13, i32 0, i32 0
	%15 = load %ast.AstNode** %14
	%16 = getelementptr %ast.AstNode* %15, i32 0, i32 7
	%17 = load i16* %16
	%18 = load %ast.AstNode** %node
	%19 = getelementptr %ast.AstNode* %18, i32 0, i32 7
	store i16 %17, i16* %19
	br label %return
L.2:
	%20 = load i16* @llvm_Tseqno
	%21 = load %ast.AstNode** %node
	%22 = getelementptr %ast.AstNode* %21, i32 0, i32 7
	store i16 %20, i16* %22
	%23 = load i16* @llvm_Tseqno
	%24 = add i16 %23, 1
	store i16 %24, i16* @llvm_Tseqno
	%25 = getelementptr [38 x i8]* @.str661
	%26 = bitcast [38 x i8]* %25 to [0 x i8]*
	%27 = load %ast.AstNode** %node
	call void @llvm_Print([0 x i8]* %26, %ast.AstNode* %27)
	br label %return
return:
	ret void
}
define void @llvm_PStringCon(%ast.AstNode* %node.arg) nounwind {
L.0:
	%node = alloca %ast.AstNode*
	store %ast.AstNode* %node.arg, %ast.AstNode** %node
	%p = alloca [0 x i8]*
	%n = alloca i8
	%0 = load %ast.AstNode** %node
	%1 = icmp eq %ast.AstNode* %0, null
	br i1 %1, label %L.2, label %L.3
L.2:
	%2 = load i32* @llvm_f
	%3 = getelementptr [3 x i8]* @.str662
	%4 = bitcast [3 x i8]* %3 to [0 x i8]*
	call void @out_str(i32 %2, [0 x i8]* %4)
	br label %L.1
L.3:
	%5 = load %ast.AstNode** %node
	%6 = getelementptr %ast.AstNode* %5, i32 0, i32 10
	%7 = load %symb.SymbNode** %6
	%8 = bitcast %symb.SymbNode* %7 to [0 x i8]*
	store [0 x i8]* %8, [0 x i8]** %p
	%9 = load [0 x i8]** %p
	%10 = bitcast [0 x i8]* %9 to [0 x i8]*
	%11 = call i32 @zstr_len([0 x i8]* %10, i32 127)
	%12 = trunc i32 %11 to i8
	store i8 %12, i8* %n
	%13 = load [0 x i8]** %p
	%14 = bitcast [0 x i8]* %13 to [0 x i8]*
	%15 = load i8* %n
	call void @llvm_PString([0 x i8]* %14, i8 %15, i8 0)
	br label %L.1
L.1:
	br label %return
return:
	ret void
}
define void @llvm_GetRV(%ast.AstNode* %node.arg) nounwind {
L.0:
	%node = alloca %ast.AstNode*
	store %ast.AstNode* %node.arg, %ast.AstNode** %node
	%tl = alloca %type.TypeListEntry*
	%ps = alloca %symb.SymbNode*
	%0 = load %ast.AstNode** %node
	%1 = getelementptr %ast.AstNode* %0, i32 0, i32 8
	%2 = load i64* %1
	%3 = icmp eq i64 %2, 0
	br i1 %3, label %L.2, label %L.1
L.2:
	%4 = load %ast.AstNode** %node
	%5 = getelementptr %ast.AstNode* %4, i32 0, i32 11
	%6 = getelementptr [0 x %ast.AstNode*]* %5, i32 0, i32 0
	%7 = load %ast.AstNode** %6
	%8 = call i8 @llvm_GenSub(%ast.AstNode* %7)
	br label %L.1
L.1:
	%9 = load i16* @llvm_Tseqno
	%10 = load %ast.AstNode** %node
	%11 = getelementptr %ast.AstNode* %10, i32 0, i32 7
	store i16 %9, i16* %11
	%12 = load i16* @llvm_Tseqno
	%13 = add i16 %12, 1
	store i16 %13, i16* @llvm_Tseqno
	%14 = getelementptr [20 x i8]* @.str663
	%15 = bitcast [20 x i8]* %14 to [0 x i8]*
	%16 = load %ast.AstNode** %node
	call void @llvm_Print([0 x i8]* %15, %ast.AstNode* %16)
	%17 = load %ast.AstNode** %node
	%18 = getelementptr %ast.AstNode* %17, i32 0, i32 11
	%19 = getelementptr [0 x %ast.AstNode*]* %18, i32 0, i32 0
	%20 = load %ast.AstNode** %19
	%21 = getelementptr %ast.AstNode* %20, i32 0, i32 10
	%22 = load %symb.SymbNode** %21
	store %symb.SymbNode* %22, %symb.SymbNode** %ps
	%23 = load %symb.SymbNode** %ps
	%24 = icmp ne %symb.SymbNode* %23, null
	br i1 %24, label %L.4, label %L.5
L.4:
	%25 = load %symb.SymbNode** %ps
	%26 = getelementptr %symb.SymbNode* %25, i32 0, i32 4
	%27 = load %type.TypeListEntry** %26
	store %type.TypeListEntry* %27, %type.TypeListEntry** %tl
	br label %L.3
L.5:
	%28 = load %ast.AstNode** %node
	%29 = getelementptr %ast.AstNode* %28, i32 0, i32 11
	%30 = getelementptr [0 x %ast.AstNode*]* %29, i32 0, i32 0
	%31 = load %ast.AstNode** %30
	%32 = getelementptr %ast.AstNode* %31, i32 0, i32 9
	%33 = load %type.TypeNode** %32
	%34 = bitcast %type.TypeNode* %33 to %type.TypeListEntry*
	store %type.TypeListEntry* %34, %type.TypeListEntry** %tl
	br label %L.3
L.3:
	%35 = load %type.TypeListEntry** %tl
	call void @llvm_PRetvType(%type.TypeListEntry* %35, i8 0)
	%36 = getelementptr [7 x i8]* @.str664
	%37 = bitcast [7 x i8]* %36 to [0 x i8]*
	%38 = load %ast.AstNode** %node
	call void @llvm_Print([0 x i8]* %37, %ast.AstNode* %38)
	%39 = load i32* @llvm_f
	%40 = load %ast.AstNode** %node
	%41 = getelementptr %ast.AstNode* %40, i32 0, i32 8
	%42 = load i64* %41
	%43 = trunc i64 %42 to i32
	call void @out_uint32(i32 %39, i32 %43)
	%44 = load i32* @llvm_f
	call void @out_nl(i32 %44)
	br label %return
return:
	ret void
}
define void @llvm_Asm(%ast.AstNode* %node.arg) nounwind {
L.0:
	%node = alloca %ast.AstNode*
	store %ast.AstNode* %node.arg, %ast.AstNode** %node
	%i = alloca i16
	store i16 2, i16* %i
	br label %L.1
L.1:
	%0 = load i16* %i
	%1 = load %ast.AstNode** %node
	%2 = getelementptr %ast.AstNode* %1, i32 0, i32 5
	%3 = load i16* %2
	%4 = icmp ult i16 %0, %3
	%5 = xor i1 %4, true
	br i1 %5, label %L.2, label %L.3
L.3:
	%6 = load %ast.AstNode** %node
	%7 = getelementptr %ast.AstNode* %6, i32 0, i32 11
	%8 = load i16* %i
	%9 = zext i16 %8 to i32
	%10 = getelementptr [0 x %ast.AstNode*]* %7, i32 0, i32 %9
	%11 = load %ast.AstNode** %10
	%12 = call i8 @llvm_GenSub(%ast.AstNode* %11)
	%13 = load i16* %i
	%14 = add i16 %13, 1
	store i16 %14, i16* %i
	br label %L.1
L.2:
	%15 = load i32* @llvm_f
	call void @out_chr(i32 %15, i8 9)
	%16 = load %ast.AstNode** %node
	%17 = getelementptr %ast.AstNode* %16, i32 0, i32 9
	%18 = load %type.TypeNode** %17
	%19 = icmp ne %type.TypeNode* %18, null
	br i1 %19, label %L.5, label %L.4
L.5:
	%20 = load i16* @llvm_Tseqno
	%21 = load %ast.AstNode** %node
	%22 = getelementptr %ast.AstNode* %21, i32 0, i32 7
	store i16 %20, i16* %22
	%23 = load i16* @llvm_Tseqno
	%24 = add i16 %23, 1
	store i16 %24, i16* @llvm_Tseqno
	%25 = getelementptr [6 x i8]* @.str665
	%26 = bitcast [6 x i8]* %25 to [0 x i8]*
	%27 = load %ast.AstNode** %node
	call void @llvm_Print([0 x i8]* %26, %ast.AstNode* %27)
	br label %L.4
L.4:
	%28 = load i32* @llvm_f
	%29 = getelementptr [5 x i8]* @.str666
	%30 = bitcast [5 x i8]* %29 to [0 x i8]*
	call void @out_str(i32 %28, [0 x i8]* %30)
	%31 = load %ast.AstNode** %node
	%32 = getelementptr %ast.AstNode* %31, i32 0, i32 9
	%33 = load %type.TypeNode** %32
	%34 = bitcast %type.TypeNode* %33 to %type.TypeListEntry*
	call void @llvm_PRetvType(%type.TypeListEntry* %34, i8 0)
	%35 = load i32* @llvm_f
	%36 = getelementptr [17 x i8]* @.str667
	%37 = bitcast [17 x i8]* %36 to [0 x i8]*
	call void @out_str(i32 %35, [0 x i8]* %37)
	%38 = load %ast.AstNode** %node
	%39 = getelementptr %ast.AstNode* %38, i32 0, i32 11
	%40 = getelementptr [0 x %ast.AstNode*]* %39, i32 0, i32 0
	%41 = load %ast.AstNode** %40
	call void @llvm_PStringCon(%ast.AstNode* %41)
	%42 = load i32* @llvm_f
	%43 = getelementptr [3 x i8]* @.str668
	%44 = bitcast [3 x i8]* %43 to [0 x i8]*
	call void @out_str(i32 %42, [0 x i8]* %44)
	%45 = load %ast.AstNode** %node
	%46 = getelementptr %ast.AstNode* %45, i32 0, i32 11
	%47 = getelementptr [0 x %ast.AstNode*]* %46, i32 0, i32 1
	%48 = load %ast.AstNode** %47
	call void @llvm_PStringCon(%ast.AstNode* %48)
	%49 = load i32* @llvm_f
	%50 = getelementptr [3 x i8]* @.str669
	%51 = bitcast [3 x i8]* %50 to [0 x i8]*
	call void @out_str(i32 %49, [0 x i8]* %51)
	store i16 2, i16* %i
	%52 = load %ast.AstNode** %node
	%53 = getelementptr %ast.AstNode* %52, i32 0, i32 5
	%54 = load i16* %53
	%55 = load i16* %i
	%56 = icmp ugt i16 %54, %55
	br i1 %56, label %L.7, label %L.6
L.7:
	br label %L.8
L.8:
	%57 = getelementptr [6 x i8]* @.str670
	%58 = bitcast [6 x i8]* %57 to [0 x i8]*
	%59 = load %ast.AstNode** %node
	%60 = getelementptr %ast.AstNode* %59, i32 0, i32 11
	%61 = load i16* %i
	%62 = zext i16 %61 to i32
	%63 = getelementptr [0 x %ast.AstNode*]* %60, i32 0, i32 %62
	%64 = load %ast.AstNode** %63
	call void @llvm_Print([0 x i8]* %58, %ast.AstNode* %64)
	%65 = load i16* %i
	%66 = add i16 %65, 1
	store i16 %66, i16* %i
	%67 = load i16* %i
	%68 = load %ast.AstNode** %node
	%69 = getelementptr %ast.AstNode* %68, i32 0, i32 5
	%70 = load i16* %69
	%71 = icmp uge i16 %67, %70
	br i1 %71, label %L.9, label %L.10
L.10:
	%72 = load i32* @llvm_f
	%73 = getelementptr [3 x i8]* @.str671
	%74 = bitcast [3 x i8]* %73 to [0 x i8]*
	call void @out_str(i32 %72, [0 x i8]* %74)
	br label %L.8
L.9:
	br label %L.6
L.6:
	%75 = load i32* @llvm_f
	%76 = getelementptr [3 x i8]* @.str672
	%77 = bitcast [3 x i8]* %76 to [0 x i8]*
	call void @out_str(i32 %75, [0 x i8]* %77)
	br label %return
return:
	ret void
}
define void @llvm_Call(%ast.AstNode* %node.arg, i8 zeroext %indirect.arg) nounwind {
L.0:
	%node = alloca %ast.AstNode*
	%indirect = alloca i8
	store %ast.AstNode* %node.arg, %ast.AstNode** %node
	store i8 %indirect.arg, i8* %indirect
	%i = alloca i16
	store i16 0, i16* %i
	br label %L.1
L.1:
	%0 = load i16* %i
	%1 = load %ast.AstNode** %node
	%2 = getelementptr %ast.AstNode* %1, i32 0, i32 5
	%3 = load i16* %2
	%4 = icmp ult i16 %0, %3
	%5 = xor i1 %4, true
	br i1 %5, label %L.2, label %L.3
L.3:
	%6 = load %ast.AstNode** %node
	%7 = getelementptr %ast.AstNode* %6, i32 0, i32 11
	%8 = load i16* %i
	%9 = zext i16 %8 to i32
	%10 = getelementptr [0 x %ast.AstNode*]* %7, i32 0, i32 %9
	%11 = load %ast.AstNode** %10
	%12 = call i8 @llvm_GenSub(%ast.AstNode* %11)
	%13 = load i16* %i
	%14 = add i16 %13, 1
	store i16 %14, i16* %i
	br label %L.1
L.2:
	%15 = load i32* @llvm_f
	call void @out_chr(i32 %15, i8 9)
	%16 = load %ast.AstNode** %node
	%17 = getelementptr %ast.AstNode* %16, i32 0, i32 9
	%18 = load %type.TypeNode** %17
	%19 = icmp ne %type.TypeNode* %18, null
	br i1 %19, label %L.5, label %L.4
L.5:
	%20 = load i16* @llvm_Tseqno
	%21 = load %ast.AstNode** %node
	%22 = getelementptr %ast.AstNode* %21, i32 0, i32 7
	store i16 %20, i16* %22
	%23 = load i16* @llvm_Tseqno
	%24 = add i16 %23, 1
	store i16 %24, i16* @llvm_Tseqno
	%25 = getelementptr [6 x i8]* @.str673
	%26 = bitcast [6 x i8]* %25 to [0 x i8]*
	%27 = load %ast.AstNode** %node
	call void @llvm_Print([0 x i8]* %26, %ast.AstNode* %27)
	br label %L.4
L.4:
	%28 = getelementptr %A.148603888* @feature, i32 0, i32 4
	%29 = load i8* %28
	%30 = icmp ne i8 %29, 0
	br i1 %30, label %L.7, label %L.6
L.7:
	%31 = load i32* @llvm_f
	%32 = getelementptr [6 x i8]* @.str674
	%33 = bitcast [6 x i8]* %32 to [0 x i8]*
	call void @out_str(i32 %31, [0 x i8]* %33)
	br label %L.6
L.6:
	%34 = load i32* @llvm_f
	%35 = getelementptr [5 x i8]* @.str675
	%36 = bitcast [5 x i8]* %35 to [0 x i8]*
	call void @out_str(i32 %34, [0 x i8]* %36)
	%37 = load %ast.AstNode** %node
	%38 = getelementptr %ast.AstNode* %37, i32 0, i32 10
	%39 = load %symb.SymbNode** %38
	%40 = getelementptr %symb.SymbNode* %39, i32 0, i32 4
	%41 = load %type.TypeListEntry** %40
	call void @llvm_PRetvType(%type.TypeListEntry* %41, i8 0)
	%42 = load i8* %indirect
	%43 = icmp ne i8 %42, 0
	br i1 %43, label %L.9, label %L.10
L.9:
	%44 = getelementptr [6 x i8]* @.str676
	%45 = bitcast [6 x i8]* %44 to [0 x i8]*
	%46 = load %ast.AstNode** %node
	call void @llvm_Print([0 x i8]* %45, %ast.AstNode* %46)
	store i16 1, i16* %i
	br label %L.8
L.10:
	%47 = getelementptr [5 x i8]* @.str677
	%48 = bitcast [5 x i8]* %47 to [0 x i8]*
	%49 = load %ast.AstNode** %node
	call void @llvm_Print([0 x i8]* %48, %ast.AstNode* %49)
	store i16 0, i16* %i
	br label %L.8
L.8:
	%50 = load %ast.AstNode** %node
	%51 = getelementptr %ast.AstNode* %50, i32 0, i32 5
	%52 = load i16* %51
	%53 = load i16* %i
	%54 = icmp ugt i16 %52, %53
	br i1 %54, label %L.12, label %L.11
L.12:
	br label %L.13
L.13:
	%55 = getelementptr [6 x i8]* @.str678
	%56 = bitcast [6 x i8]* %55 to [0 x i8]*
	%57 = load %ast.AstNode** %node
	%58 = getelementptr %ast.AstNode* %57, i32 0, i32 11
	%59 = load i16* %i
	%60 = zext i16 %59 to i32
	%61 = getelementptr [0 x %ast.AstNode*]* %58, i32 0, i32 %60
	%62 = load %ast.AstNode** %61
	call void @llvm_Print([0 x i8]* %56, %ast.AstNode* %62)
	%63 = load i16* %i
	%64 = add i16 %63, 1
	store i16 %64, i16* %i
	%65 = load i16* %i
	%66 = load %ast.AstNode** %node
	%67 = getelementptr %ast.AstNode* %66, i32 0, i32 5
	%68 = load i16* %67
	%69 = icmp uge i16 %65, %68
	br i1 %69, label %L.14, label %L.15
L.15:
	%70 = load i32* @llvm_f
	%71 = getelementptr [3 x i8]* @.str679
	%72 = bitcast [3 x i8]* %71 to [0 x i8]*
	call void @out_str(i32 %70, [0 x i8]* %72)
	br label %L.13
L.14:
	br label %L.11
L.11:
	%73 = load i32* @llvm_f
	%74 = getelementptr [3 x i8]* @.str680
	%75 = bitcast [3 x i8]* %74 to [0 x i8]*
	call void @out_str(i32 %73, [0 x i8]* %75)
	%76 = load %ast.AstNode** %node
	%77 = getelementptr %ast.AstNode* %76, i32 0, i32 10
	%78 = load %symb.SymbNode** %77
	%79 = getelementptr %symb.SymbNode* %78, i32 0, i32 13
	%80 = load i8* %79
	%81 = icmp eq i8 %80, 3
	br i1 %81, label %L.16, label %L.17
L.16:
	%82 = load %ast.AstNode** %node
	%83 = getelementptr %ast.AstNode* %82, i32 0, i32 10
	%84 = load %symb.SymbNode** %83
	%85 = getelementptr %symb.SymbNode* %84, i32 0, i32 18
	%86 = load i8* %85
	%87 = icmp ne i8 %86, 0
	%88 = xor i1 %87, true
	br label %L.17
L.17:
	%89 = phi i1 [ false, %L.11 ], [ %88, %L.16 ]
	br i1 %89, label %L.19, label %L.18
L.19:
	%90 = load %ast.AstNode** %node
	call void @llvm_NeedDeclare(%ast.AstNode* %90)
	%91 = load %ast.AstNode** %node
	%92 = getelementptr %ast.AstNode* %91, i32 0, i32 10
	%93 = load %symb.SymbNode** %92
	%94 = getelementptr %symb.SymbNode* %93, i32 0, i32 18
	store i8 1, i8* %94
	br label %L.18
L.18:
	br label %return
return:
	ret void
}
define void @llvm_DclProcSearch(%ast.AstNode* %node.arg) nounwind {
L.0:
	%node = alloca %ast.AstNode*
	store %ast.AstNode* %node.arg, %ast.AstNode** %node
	%i = alloca i16
	%0 = load %ast.AstNode** %node
	%1 = icmp ne %ast.AstNode* %0, null
	br i1 %1, label %L.2, label %L.1
L.2:
	%2 = load %ast.AstNode** %node
	%3 = getelementptr %ast.AstNode* %2, i32 0, i32 0
	%4 = load i8* %3
	%5 = zext i8 %4 to i32
	switch i32 %5, label %L.3 [
		i32 64, label %L.5
		i32 63, label %L.5
		i32 66, label %L.6
		i32 67, label %L.6
		i32 68, label %L.7
		i32 65, label %L.8
		i32 5, label %L.9
		i32 6, label %L.10
	]
L.5:
	store i16 0, i16* %i
	br label %L.11
L.11:
	%6 = load i16* %i
	%7 = load %ast.AstNode** %node
	%8 = getelementptr %ast.AstNode* %7, i32 0, i32 5
	%9 = load i16* %8
	%10 = icmp ult i16 %6, %9
	%11 = xor i1 %10, true
	br i1 %11, label %L.12, label %L.13
L.13:
	%12 = load %ast.AstNode** %node
	%13 = getelementptr %ast.AstNode* %12, i32 0, i32 11
	%14 = load i16* %i
	%15 = zext i16 %14 to i32
	%16 = getelementptr [0 x %ast.AstNode*]* %13, i32 0, i32 %15
	%17 = load %ast.AstNode** %16
	call void @llvm_DclProcSearch(%ast.AstNode* %17)
	%18 = load i16* %i
	%19 = add i16 %18, 1
	store i16 %19, i16* %i
	br label %L.11
L.12:
	br label %L.4
L.6:
	store i16 1, i16* %i
	br label %L.14
L.14:
	%20 = load i16* %i
	%21 = load %ast.AstNode** %node
	%22 = getelementptr %ast.AstNode* %21, i32 0, i32 5
	%23 = load i16* %22
	%24 = icmp ult i16 %20, %23
	%25 = xor i1 %24, true
	br i1 %25, label %L.15, label %L.16
L.16:
	%26 = load %ast.AstNode** %node
	%27 = getelementptr %ast.AstNode* %26, i32 0, i32 11
	%28 = load i16* %i
	%29 = zext i16 %28 to i32
	%30 = getelementptr [0 x %ast.AstNode*]* %27, i32 0, i32 %29
	%31 = load %ast.AstNode** %30
	call void @llvm_DclProcSearch(%ast.AstNode* %31)
	%32 = load i16* %i
	%33 = add i16 %32, 1
	store i16 %33, i16* %i
	br label %L.14
L.15:
	br label %L.4
L.7:
	%34 = load %ast.AstNode** %node
	%35 = getelementptr %ast.AstNode* %34, i32 0, i32 11
	%36 = load %ast.AstNode** %node
	%37 = getelementptr %ast.AstNode* %36, i32 0, i32 5
	%38 = load i16* %37
	%39 = sub i16 %38, 1
	%40 = zext i16 %39 to i32
	%41 = getelementptr [0 x %ast.AstNode*]* %35, i32 0, i32 %40
	%42 = load %ast.AstNode** %41
	call void @llvm_DclProcSearch(%ast.AstNode* %42)
	br label %L.4
L.8:
	%43 = load %ast.AstNode** %node
	%44 = getelementptr %ast.AstNode* %43, i32 0, i32 5
	%45 = load i16* %44
	%46 = icmp ugt i16 %45, 1
	br i1 %46, label %L.18, label %L.17
L.18:
	%47 = load %ast.AstNode** %node
	%48 = getelementptr %ast.AstNode* %47, i32 0, i32 11
	%49 = getelementptr [0 x %ast.AstNode*]* %48, i32 0, i32 1
	%50 = load %ast.AstNode** %49
	call void @llvm_DclProcSearch(%ast.AstNode* %50)
	br label %L.17
L.17:
	br label %L.4
L.9:
	%51 = load %ast.AstNode** %node
	%52 = getelementptr %ast.AstNode* %51, i32 0, i32 9
	%53 = load %type.TypeNode** %52
	call void @llvm_DclType(%type.TypeNode* %53)
	br label %L.4
L.10:
	%s = alloca %symb.SymbNode*
	%54 = getelementptr [16 x i8]* @.str681
	%55 = bitcast [16 x i8]* %54 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %55)
	%56 = load %ast.AstNode** %node
	%57 = getelementptr %ast.AstNode* %56, i32 0, i32 10
	%58 = load %symb.SymbNode** %57
	store %symb.SymbNode* %58, %symb.SymbNode** %s
	%59 = load %symb.SymbNode** %s
	%60 = icmp ne %symb.SymbNode* %59, null
	br i1 %60, label %L.20, label %L.19
L.20:
	%61 = load %symb.SymbNode** %s
	%62 = getelementptr %symb.SymbNode* %61, i32 0, i32 13
	store i8 1, i8* %62
	%63 = load %ast.AstNode** %node
	call void @llvm_DclCon(%ast.AstNode* %63)
	br label %L.19
L.19:
	%64 = load %ast.AstNode** %node
	%65 = getelementptr %ast.AstNode* %64, i32 0, i32 0
	store i8 1, i8* %65
	br label %L.4
L.3:
	br label %L.4
L.4:
	br label %L.1
L.1:
	br label %return
return:
	ret void
}
define void @llvm_Procedure(%ast.AstNode* %node.arg) nounwind {
L.0:
	%node = alloca %ast.AstNode*
	store %ast.AstNode* %node.arg, %ast.AstNode** %node
	%s = alloca %symb.SymbNode*
	%ps = alloca %symb.SymbNode*
	%tl = alloca %type.TypeListEntry*
	%i = alloca i16
	%0 = load %ast.AstNode** %node
	%1 = getelementptr %ast.AstNode* %0, i32 0, i32 10
	%2 = load %symb.SymbNode** %1
	store %symb.SymbNode* %2, %symb.SymbNode** %ps
	%3 = load %symb.SymbNode** %ps
	%4 = icmp ne %symb.SymbNode* %3, null
	br i1 %4, label %L.2, label %L.1
L.2:
	%5 = load %symb.SymbNode** %ps
	%6 = getelementptr %symb.SymbNode* %5, i32 0, i32 3
	%7 = load %symb.SymbNode** %6
	store %symb.SymbNode* %7, %symb.SymbNode** %s
	br label %L.3
L.3:
	%8 = load %symb.SymbNode** %s
	%9 = icmp ne %symb.SymbNode* %8, null
	%10 = xor i1 %9, true
	br i1 %10, label %L.4, label %L.5
L.5:
	%11 = load %symb.SymbNode** %s
	%12 = getelementptr %symb.SymbNode* %11, i32 0, i32 1
	%13 = load %type.TypeNode** %12
	call void @llvm_DclType(%type.TypeNode* %13)
	%14 = load %symb.SymbNode** %s
	%15 = getelementptr %symb.SymbNode* %14, i32 0, i32 0
	%16 = load %symb.SymbNode** %15
	store %symb.SymbNode* %16, %symb.SymbNode** %s
	br label %L.3
L.4:
	%17 = load %symb.SymbNode** %ps
	%18 = getelementptr %symb.SymbNode* %17, i32 0, i32 4
	%19 = load %type.TypeListEntry** %18
	store %type.TypeListEntry* %19, %type.TypeListEntry** %tl
	br label %L.6
L.6:
	%20 = load %type.TypeListEntry** %tl
	%21 = icmp ne %type.TypeListEntry* %20, null
	%22 = xor i1 %21, true
	br i1 %22, label %L.7, label %L.8
L.8:
	%23 = load %type.TypeListEntry** %tl
	%24 = getelementptr %type.TypeListEntry* %23, i32 0, i32 1
	%25 = load %type.TypeNode** %24
	call void @llvm_DclType(%type.TypeNode* %25)
	%26 = load %type.TypeListEntry** %tl
	%27 = getelementptr %type.TypeListEntry* %26, i32 0, i32 0
	%28 = load %type.TypeListEntry** %27
	store %type.TypeListEntry* %28, %type.TypeListEntry** %tl
	br label %L.6
L.7:
	%29 = load %ast.AstNode** %node
	%30 = getelementptr %ast.AstNode* %29, i32 0, i32 11
	%31 = getelementptr [0 x %ast.AstNode*]* %30, i32 0, i32 0
	%32 = load %ast.AstNode** %31
	call void @llvm_DclProcSearch(%ast.AstNode* %32)
	%33 = load %ast.AstNode** %node
	call void @llvm_DclProc(%ast.AstNode* %33, i8 1)
	%34 = load %symb.SymbNode** %ps
	%35 = getelementptr %symb.SymbNode* %34, i32 0, i32 13
	%36 = load i8* %35
	%37 = icmp eq i8 %36, 5
	br i1 %37, label %L.10, label %L.9
L.10:
	%38 = load i32* @llvm_f
	%39 = getelementptr [14 x i8]* @.str682
	%40 = bitcast [14 x i8]* %39 to [0 x i8]*
	call void @out_str(i32 %38, [0 x i8]* %40)
	br label %L.9
L.9:
	%41 = getelementptr %A.148603888* @feature, i32 0, i32 0
	%42 = load i8* %41
	%43 = icmp ne i8 %42, 0
	br i1 %43, label %L.12, label %L.11
L.12:
	%44 = load i32* @llvm_f
	%45 = getelementptr [9 x i8]* @.str683
	%46 = bitcast [9 x i8]* %45 to [0 x i8]*
	call void @out_str(i32 %44, [0 x i8]* %46)
	br label %L.11
L.11:
	%47 = load i32* @llvm_f
	%48 = getelementptr [13 x i8]* @.str684
	%49 = bitcast [13 x i8]* %48 to [0 x i8]*
	call void @out_str(i32 %47, [0 x i8]* %49)
	%50 = load i16* @llvm_Pseqno
	%51 = add i16 %50, 1
	store i16 %51, i16* @llvm_Pseqno
	store i16 1, i16* @llvm_Tseqno
	store i16 0, i16* @llvm_Lseqno
	%52 = load i16* @llvm_Lseqno
	call void @llvm_Label(i16 %52)
	%53 = load i16* @llvm_Lseqno
	%54 = add i16 %53, 1
	store i16 %54, i16* @llvm_Lseqno
	%55 = load %symb.SymbNode** %ps
	%56 = getelementptr %symb.SymbNode* %55, i32 0, i32 4
	%57 = load %type.TypeListEntry** %56
	store %type.TypeListEntry* %57, %type.TypeListEntry** %tl
	store i16 0, i16* %i
	br label %L.13
L.13:
	%58 = load %type.TypeListEntry** %tl
	%59 = icmp ne %type.TypeListEntry* %58, null
	%60 = xor i1 %59, true
	br i1 %60, label %L.14, label %L.15
L.15:
	%61 = load i32* @llvm_f
	call void @out_chr(i32 %61, i8 9)
	%62 = load i16* %i
	call void @llvm_PRetValName(i16 %62)
	%63 = load i32* @llvm_f
	%64 = getelementptr [11 x i8]* @.str685
	%65 = bitcast [11 x i8]* %64 to [0 x i8]*
	call void @out_str(i32 %63, [0 x i8]* %65)
	%66 = load %type.TypeListEntry** %tl
	%67 = getelementptr %type.TypeListEntry* %66, i32 0, i32 1
	%68 = load %type.TypeNode** %67
	call void @llvm_PType(%type.TypeNode* %68, i8 0)
	%69 = load i32* @llvm_f
	call void @out_nl(i32 %69)
	%70 = load i16* %i
	%71 = add i16 %70, 1
	store i16 %71, i16* %i
	%72 = load %type.TypeListEntry** %tl
	%73 = getelementptr %type.TypeListEntry* %72, i32 0, i32 0
	%74 = load %type.TypeListEntry** %73
	store %type.TypeListEntry* %74, %type.TypeListEntry** %tl
	br label %L.13
L.14:
	%75 = load %symb.SymbNode** %ps
	%76 = getelementptr %symb.SymbNode* %75, i32 0, i32 3
	%77 = load %symb.SymbNode** %76
	store %symb.SymbNode* %77, %symb.SymbNode** %s
	br label %L.16
L.16:
	%78 = load %symb.SymbNode** %s
	%79 = icmp ne %symb.SymbNode* %78, null
	%80 = xor i1 %79, true
	br i1 %80, label %L.17, label %L.18
L.18:
	%81 = load i32* @llvm_f
	%82 = getelementptr [3 x i8]* @.str686
	%83 = bitcast [3 x i8]* %82 to [0 x i8]*
	call void @out_str(i32 %81, [0 x i8]* %83)
	%84 = load i32* @llvm_f
	%85 = load %symb.SymbNode** %s
	%86 = getelementptr %symb.SymbNode* %85, i32 0, i32 19
	%87 = getelementptr [0 x i8]* %86
	call void @out_str(i32 %84, [0 x i8]* %87)
	%88 = load i32* @llvm_f
	%89 = getelementptr [11 x i8]* @.str687
	%90 = bitcast [11 x i8]* %89 to [0 x i8]*
	call void @out_str(i32 %88, [0 x i8]* %90)
	%91 = load %symb.SymbNode** %s
	%92 = getelementptr %symb.SymbNode* %91, i32 0, i32 1
	%93 = load %type.TypeNode** %92
	call void @llvm_PType(%type.TypeNode* %93, i8 0)
	%94 = load i32* @llvm_f
	call void @out_nl(i32 %94)
	%95 = load %symb.SymbNode** %s
	%96 = getelementptr %symb.SymbNode* %95, i32 0, i32 0
	%97 = load %symb.SymbNode** %96
	store %symb.SymbNode* %97, %symb.SymbNode** %s
	br label %L.16
L.17:
	%98 = load %symb.SymbNode** %ps
	%99 = getelementptr %symb.SymbNode* %98, i32 0, i32 3
	%100 = load %symb.SymbNode** %99
	store %symb.SymbNode* %100, %symb.SymbNode** %s
	br label %L.19
L.19:
	%101 = load %symb.SymbNode** %s
	%102 = icmp ne %symb.SymbNode* %101, null
	%103 = xor i1 %102, true
	br i1 %103, label %L.20, label %L.21
L.21:
	%104 = load i32* @llvm_f
	%105 = getelementptr [8 x i8]* @.str688
	%106 = bitcast [8 x i8]* %105 to [0 x i8]*
	call void @out_str(i32 %104, [0 x i8]* %106)
	%107 = load %symb.SymbNode** %s
	%108 = getelementptr %symb.SymbNode* %107, i32 0, i32 1
	%109 = load %type.TypeNode** %108
	call void @llvm_PType(%type.TypeNode* %109, i8 0)
	%110 = load i32* @llvm_f
	%111 = getelementptr [3 x i8]* @.str689
	%112 = bitcast [3 x i8]* %111 to [0 x i8]*
	call void @out_str(i32 %110, [0 x i8]* %112)
	%113 = load i32* @llvm_f
	%114 = load %symb.SymbNode** %s
	%115 = getelementptr %symb.SymbNode* %114, i32 0, i32 19
	%116 = getelementptr [0 x i8]* %115
	call void @out_str(i32 %113, [0 x i8]* %116)
	%117 = load i32* @llvm_f
	%118 = getelementptr [7 x i8]* @.str690
	%119 = bitcast [7 x i8]* %118 to [0 x i8]*
	call void @out_str(i32 %117, [0 x i8]* %119)
	%120 = load %symb.SymbNode** %s
	%121 = getelementptr %symb.SymbNode* %120, i32 0, i32 1
	%122 = load %type.TypeNode** %121
	call void @llvm_PType(%type.TypeNode* %122, i8 0)
	%123 = load i32* @llvm_f
	%124 = getelementptr [4 x i8]* @.str691
	%125 = bitcast [4 x i8]* %124 to [0 x i8]*
	call void @out_str(i32 %123, [0 x i8]* %125)
	%126 = load i32* @llvm_f
	%127 = load %symb.SymbNode** %s
	%128 = getelementptr %symb.SymbNode* %127, i32 0, i32 19
	%129 = getelementptr [0 x i8]* %128
	call void @out_str(i32 %126, [0 x i8]* %129)
	%130 = load i32* @llvm_f
	call void @out_nl(i32 %130)
	%131 = getelementptr %A.148603888* @feature, i32 0, i32 3
	%132 = load i8* %131
	%133 = icmp ne i8 %132, 0
	br i1 %133, label %L.23, label %L.22
L.23:
	%134 = load %symb.SymbNode** %s
	%135 = call i16 @llvmdb_DefVar(%symb.SymbNode* %134)
	br label %L.22
L.22:
	%136 = load %symb.SymbNode** %s
	%137 = getelementptr %symb.SymbNode* %136, i32 0, i32 0
	%138 = load %symb.SymbNode** %137
	store %symb.SymbNode* %138, %symb.SymbNode** %s
	br label %L.19
L.20:
	%139 = load %ast.AstNode** %node
	%140 = getelementptr %ast.AstNode* %139, i32 0, i32 11
	%141 = getelementptr [0 x %ast.AstNode*]* %140, i32 0, i32 0
	%142 = load %ast.AstNode** %141
	%143 = call i8 @llvm_GenSub(%ast.AstNode* %142)
	%144 = icmp ne i8 %143, 0
	%145 = xor i1 %144, true
	br i1 %145, label %L.25, label %L.24
L.25:
	%146 = load i32* @llvm_f
	%147 = getelementptr [18 x i8]* @.str692
	%148 = bitcast [18 x i8]* %147 to [0 x i8]*
	call void @out_str(i32 %146, [0 x i8]* %148)
	%149 = load %ast.AstNode** %node
	call void @llvm_PEndLine(%ast.AstNode* %149)
	br label %L.24
L.24:
	%150 = load i32* @llvm_f
	%151 = getelementptr [9 x i8]* @.str693
	%152 = bitcast [9 x i8]* %151 to [0 x i8]*
	call void @out_str(i32 %150, [0 x i8]* %152)
	%153 = load %symb.SymbNode** %ps
	%154 = getelementptr %symb.SymbNode* %153, i32 0, i32 4
	%155 = load %type.TypeListEntry** %154
	store %type.TypeListEntry* %155, %type.TypeListEntry** %tl
	%156 = load %type.TypeListEntry** %tl
	%157 = icmp ne %type.TypeListEntry* %156, null
	br i1 %157, label %L.27, label %L.28
L.27:
	store i16 0, i16* %i
	br label %L.29
L.29:
	%158 = load %type.TypeListEntry** %tl
	%159 = icmp ne %type.TypeListEntry* %158, null
	%160 = xor i1 %159, true
	br i1 %160, label %L.30, label %L.31
L.31:
	%161 = load i32* @llvm_f
	call void @out_chr(i32 %161, i8 9)
	%162 = load i16* @llvm_Tseqno
	%163 = load i16* %i
	%164 = add i16 %162, %163
	call void @llvm_PTempName(i16 %164)
	%165 = load i32* @llvm_f
	%166 = getelementptr [9 x i8]* @.str694
	%167 = bitcast [9 x i8]* %166 to [0 x i8]*
	call void @out_str(i32 %165, [0 x i8]* %167)
	%168 = load %type.TypeListEntry** %tl
	%169 = getelementptr %type.TypeListEntry* %168, i32 0, i32 1
	%170 = load %type.TypeNode** %169
	call void @llvm_PType(%type.TypeNode* %170, i8 0)
	%171 = load i32* @llvm_f
	%172 = getelementptr [3 x i8]* @.str695
	%173 = bitcast [3 x i8]* %172 to [0 x i8]*
	call void @out_str(i32 %171, [0 x i8]* %173)
	%174 = load i16* %i
	call void @llvm_PRetValName(i16 %174)
	%175 = load i32* @llvm_f
	call void @out_nl(i32 %175)
	%176 = load i16* %i
	%177 = add i16 %176, 1
	store i16 %177, i16* %i
	%178 = load %type.TypeListEntry** %tl
	%179 = getelementptr %type.TypeListEntry* %178, i32 0, i32 0
	%180 = load %type.TypeListEntry** %179
	store %type.TypeListEntry* %180, %type.TypeListEntry** %tl
	br label %L.29
L.30:
	%181 = load %symb.SymbNode** %ps
	%182 = getelementptr %symb.SymbNode* %181, i32 0, i32 4
	%183 = load %type.TypeListEntry** %182
	store %type.TypeListEntry* %183, %type.TypeListEntry** %tl
	store i16 0, i16* %i
	%184 = load i32* @llvm_f
	%185 = getelementptr [6 x i8]* @.str696
	%186 = bitcast [6 x i8]* %185 to [0 x i8]*
	call void @out_str(i32 %184, [0 x i8]* %186)
	br label %L.32
L.32:
	%187 = load %type.TypeListEntry** %tl
	%188 = getelementptr %type.TypeListEntry* %187, i32 0, i32 1
	%189 = load %type.TypeNode** %188
	call void @llvm_PType(%type.TypeNode* %189, i8 0)
	%190 = load i32* @llvm_f
	call void @out_chr(i32 %190, i8 32)
	%191 = load i16* @llvm_Tseqno
	%192 = load i16* %i
	%193 = add i16 %191, %192
	call void @llvm_PTempName(i16 %193)
	%194 = load i16* %i
	%195 = add i16 %194, 1
	store i16 %195, i16* %i
	%196 = load %type.TypeListEntry** %tl
	%197 = getelementptr %type.TypeListEntry* %196, i32 0, i32 0
	%198 = load %type.TypeListEntry** %197
	store %type.TypeListEntry* %198, %type.TypeListEntry** %tl
	%199 = load %type.TypeListEntry** %tl
	%200 = icmp eq %type.TypeListEntry* %199, null
	br i1 %200, label %L.33, label %L.34
L.34:
	%201 = load i32* @llvm_f
	%202 = getelementptr [3 x i8]* @.str697
	%203 = bitcast [3 x i8]* %202 to [0 x i8]*
	call void @out_str(i32 %201, [0 x i8]* %203)
	br label %L.32
L.33:
	br label %L.26
L.28:
	%204 = load i32* @llvm_f
	%205 = getelementptr [10 x i8]* @.str698
	%206 = bitcast [10 x i8]* %205 to [0 x i8]*
	call void @out_str(i32 %204, [0 x i8]* %206)
	br label %L.26
L.26:
	%207 = load i32* @llvm_f
	%208 = getelementptr [4 x i8]* @.str699
	%209 = bitcast [4 x i8]* %208 to [0 x i8]*
	call void @out_str(i32 %207, [0 x i8]* %209)
	br label %L.1
L.1:
	br label %return
return:
	ret void
}
define zeroext i8 @llvm_BinaryOp(%ast.AstNode* %node.arg, [0 x i8]* %op.arg) nounwind {
L.0:
	%rv.0 = alloca i8
	%node = alloca %ast.AstNode*
	%op = alloca [0 x i8]*
	store %ast.AstNode* %node.arg, %ast.AstNode** %node
	store [0 x i8]* %op.arg, [0 x i8]** %op
	%0 = load %ast.AstNode** %node
	%1 = getelementptr %ast.AstNode* %0, i32 0, i32 11
	%2 = getelementptr [0 x %ast.AstNode*]* %1, i32 0, i32 0
	%3 = load %ast.AstNode** %2
	%4 = call i8 @llvm_GenSub(%ast.AstNode* %3)
	%5 = load %ast.AstNode** %node
	%6 = getelementptr %ast.AstNode* %5, i32 0, i32 11
	%7 = getelementptr [0 x %ast.AstNode*]* %6, i32 0, i32 1
	%8 = load %ast.AstNode** %7
	%9 = call i8 @llvm_GenSub(%ast.AstNode* %8)
	%10 = load i16* @llvm_Tseqno
	%11 = load %ast.AstNode** %node
	%12 = getelementptr %ast.AstNode* %11, i32 0, i32 7
	store i16 %10, i16* %12
	%13 = load i16* @llvm_Tseqno
	%14 = add i16 %13, 1
	store i16 %14, i16* @llvm_Tseqno
	%15 = getelementptr [7 x i8]* @.str700
	%16 = bitcast [7 x i8]* %15 to [0 x i8]*
	%17 = load %ast.AstNode** %node
	call void @llvm_Print([0 x i8]* %16, %ast.AstNode* %17)
	%18 = load i32* @llvm_f
	%19 = load [0 x i8]** %op
	%20 = bitcast [0 x i8]* %19 to [0 x i8]*
	call void @out_str(i32 %18, [0 x i8]* %20)
	%21 = getelementptr [13 x i8]* @.str701
	%22 = bitcast [13 x i8]* %21 to [0 x i8]*
	%23 = load %ast.AstNode** %node
	call void @llvm_Print([0 x i8]* %22, %ast.AstNode* %23)
	%24 = load %ast.AstNode** %node
	call void @llvm_PEndLine(%ast.AstNode* %24)
	store i8 0, i8* %rv.0
	br label %return
return:
	%25 = load i8* %rv.0
	ret i8 %25
}
define zeroext i8 @llvm_CompareOp(%ast.AstNode* %node.arg, [0 x i8]* %op.arg) nounwind {
L.0:
	%rv.0 = alloca i8
	%node = alloca %ast.AstNode*
	%op = alloca [0 x i8]*
	store %ast.AstNode* %node.arg, %ast.AstNode** %node
	store [0 x i8]* %op.arg, [0 x i8]** %op
	%0 = load %ast.AstNode** %node
	%1 = getelementptr %ast.AstNode* %0, i32 0, i32 11
	%2 = getelementptr [0 x %ast.AstNode*]* %1, i32 0, i32 0
	%3 = load %ast.AstNode** %2
	%4 = call i8 @llvm_GenSub(%ast.AstNode* %3)
	%5 = load %ast.AstNode** %node
	%6 = getelementptr %ast.AstNode* %5, i32 0, i32 11
	%7 = getelementptr [0 x %ast.AstNode*]* %6, i32 0, i32 1
	%8 = load %ast.AstNode** %7
	%9 = call i8 @llvm_GenSub(%ast.AstNode* %8)
	%10 = load i16* @llvm_Tseqno
	%11 = load %ast.AstNode** %node
	%12 = getelementptr %ast.AstNode* %11, i32 0, i32 7
	store i16 %10, i16* %12
	%13 = load i16* @llvm_Tseqno
	%14 = add i16 %13, 1
	store i16 %14, i16* @llvm_Tseqno
	%15 = getelementptr [7 x i8]* @.str702
	%16 = bitcast [7 x i8]* %15 to [0 x i8]*
	%17 = load %ast.AstNode** %node
	call void @llvm_Print([0 x i8]* %16, %ast.AstNode* %17)
	%18 = load i32* @llvm_f
	%19 = load [0 x i8]** %op
	%20 = bitcast [0 x i8]* %19 to [0 x i8]*
	call void @out_str(i32 %18, [0 x i8]* %20)
	%21 = getelementptr [14 x i8]* @.str703
	%22 = bitcast [14 x i8]* %21 to [0 x i8]*
	%23 = load %ast.AstNode** %node
	call void @llvm_Print([0 x i8]* %22, %ast.AstNode* %23)
	%24 = load %ast.AstNode** %node
	call void @llvm_PEndLine(%ast.AstNode* %24)
	store i8 1, i8* %rv.0
	br label %return
return:
	%25 = load i8* %rv.0
	ret i8 %25
}
define void @llvm_ChangeSize(%ast.AstNode* %node.arg, [0 x i8]* %op.arg) nounwind {
L.0:
	%node = alloca %ast.AstNode*
	%op = alloca [0 x i8]*
	store %ast.AstNode* %node.arg, %ast.AstNode** %node
	store [0 x i8]* %op.arg, [0 x i8]** %op
	%0 = load %ast.AstNode** %node
	%1 = getelementptr %ast.AstNode* %0, i32 0, i32 11
	%2 = getelementptr [0 x %ast.AstNode*]* %1, i32 0, i32 0
	%3 = load %ast.AstNode** %2
	%4 = call i8 @llvm_GenSub(%ast.AstNode* %3)
	%5 = load i16* @llvm_Tseqno
	%6 = load %ast.AstNode** %node
	%7 = getelementptr %ast.AstNode* %6, i32 0, i32 7
	store i16 %5, i16* %7
	%8 = load i16* @llvm_Tseqno
	%9 = add i16 %8, 1
	store i16 %9, i16* @llvm_Tseqno
	%10 = getelementptr [7 x i8]* @.str704
	%11 = bitcast [7 x i8]* %10 to [0 x i8]*
	%12 = load %ast.AstNode** %node
	call void @llvm_Print([0 x i8]* %11, %ast.AstNode* %12)
	%13 = load i32* @llvm_f
	%14 = load [0 x i8]** %op
	%15 = bitcast [0 x i8]* %14 to [0 x i8]*
	call void @out_str(i32 %13, [0 x i8]* %15)
	%16 = getelementptr [15 x i8]* @.str705
	%17 = bitcast [15 x i8]* %16 to [0 x i8]*
	%18 = load %ast.AstNode** %node
	call void @llvm_Print([0 x i8]* %17, %ast.AstNode* %18)
	%19 = load %ast.AstNode** %node
	call void @llvm_PEndLine(%ast.AstNode* %19)
	br label %return
return:
	ret void
}
define i32 @llvm_BitfieldOffset(%type.TypeNode* %trec.arg, i64 %fno.arg) nounwind {
L.0:
	%rv.0 = alloca i32
	%trec = alloca %type.TypeNode*
	%fno = alloca i64
	store %type.TypeNode* %trec.arg, %type.TypeNode** %trec
	store i64 %fno.arg, i64* %fno
	%foffs = alloca i32
	%rsize = alloca i32
	%fsize = alloca i32
	%s = alloca %symb.SymbNode*
	%i = alloca i16
	%0 = load %type.TypeNode** %trec
	%1 = getelementptr %type.TypeNode* %0, i32 0, i32 8
	%2 = load i32* %1
	store i32 %2, i32* %rsize
	%3 = load %type.TypeNode** %trec
	%4 = getelementptr %type.TypeNode* %3, i32 0, i32 13
	%5 = load i8* %4
	%6 = icmp eq i8 %5, 1
	br i1 %6, label %L.2, label %L.3
L.2:
	%7 = load i32* %rsize
	store i32 %7, i32* %foffs
	br label %L.1
L.3:
	store i32 0, i32* %foffs
	br label %L.1
L.1:
	%8 = load %type.TypeNode** %trec
	%9 = getelementptr %type.TypeNode* %8, i32 0, i32 3
	%10 = load %symb.SymbNode** %9
	store %symb.SymbNode* %10, %symb.SymbNode** %s
	store i16 0, i16* %i
	br label %L.4
L.4:
	%11 = load %symb.SymbNode** %s
	%12 = icmp ne %symb.SymbNode* %11, null
	%13 = xor i1 %12, true
	br i1 %13, label %L.5, label %L.6
L.6:
	%14 = load %symb.SymbNode** %s
	%15 = getelementptr %symb.SymbNode* %14, i32 0, i32 1
	%16 = load %type.TypeNode** %15
	%17 = getelementptr %type.TypeNode* %16, i32 0, i32 7
	%18 = load i32* %17
	store i32 %18, i32* %fsize
	%19 = load %type.TypeNode** %trec
	%20 = getelementptr %type.TypeNode* %19, i32 0, i32 13
	%21 = load i8* %20
	%22 = icmp eq i8 %21, 1
	br i1 %22, label %L.8, label %L.7
L.8:
	%23 = load i32* %foffs
	%24 = load i32* %fsize
	%25 = sub i32 %23, %24
	store i32 %25, i32* %foffs
	br label %L.7
L.7:
	%26 = load i16* %i
	%27 = zext i16 %26 to i64
	%28 = load i64* %fno
	%29 = icmp eq i64 %27, %28
	br i1 %29, label %L.5, label %L.9
L.9:
	%30 = load %type.TypeNode** %trec
	%31 = getelementptr %type.TypeNode* %30, i32 0, i32 13
	%32 = load i8* %31
	%33 = icmp ne i8 %32, 1
	br i1 %33, label %L.11, label %L.10
L.11:
	%34 = load i32* %foffs
	%35 = load i32* %fsize
	%36 = add i32 %34, %35
	store i32 %36, i32* %foffs
	br label %L.10
L.10:
	%37 = load %symb.SymbNode** %s
	%38 = getelementptr %symb.SymbNode* %37, i32 0, i32 0
	%39 = load %symb.SymbNode** %38
	store %symb.SymbNode* %39, %symb.SymbNode** %s
	%40 = load i16* %i
	%41 = add i16 %40, 1
	store i16 %41, i16* %i
	br label %L.4
L.5:
	%42 = load i32* %foffs
	store i32 %42, i32* %rv.0
	br label %return
return:
	%43 = load i32* %rv.0
	ret i32 %43
}
define %ast.AstNode* @llvm_BitfieldIndex(%ast.AstNode* %node.arg, i32 %size.arg, %ast.AstNode* %tree.arg) nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%node = alloca %ast.AstNode*
	%size = alloca i32
	%tree = alloca %ast.AstNode*
	store %ast.AstNode* %node.arg, %ast.AstNode** %node
	store i32 %size.arg, i32* %size
	store %ast.AstNode* %tree.arg, %ast.AstNode** %tree
	%indx = alloca %ast.AstNode*
	%0 = load %ast.AstNode** %node
	%1 = getelementptr %ast.AstNode* %0, i32 0, i32 11
	%2 = getelementptr [0 x %ast.AstNode*]* %1, i32 0, i32 1
	%3 = load %ast.AstNode** %2
	%4 = load %type.TypeNode** @type_wordtype
	%5 = getelementptr %type.TypeNode* %4, i32 0, i32 7
	%6 = load i32* %5
	%7 = call %ast.AstNode* @expr_Extend(%ast.AstNode* %3, i32 %6)
	store %ast.AstNode* %7, %ast.AstNode** %indx
	%8 = load %type.TypeNode** @type_wordtype
	%9 = load %ast.AstNode** %indx
	%10 = load %type.TypeNode** @type_wordtype
	%11 = load i32* %size
	%12 = zext i32 %11 to i64
	%13 = call %ast.AstNode* @ast_Const(%type.TypeNode* %10, i64 %12)
	%14 = call %ast.AstNode* @ast_New2(i8 35, %type.TypeNode* %8, %ast.AstNode* %9, %ast.AstNode* %13)
	store %ast.AstNode* %14, %ast.AstNode** %indx
	%15 = load %ast.AstNode** %tree
	%16 = icmp ne %ast.AstNode* %15, null
	br i1 %16, label %L.2, label %L.3
L.2:
	%17 = load %type.TypeNode** @type_wordtype
	%18 = load %ast.AstNode** %tree
	%19 = load %ast.AstNode** %indx
	%20 = call %ast.AstNode* @ast_New2(i8 33, %type.TypeNode* %17, %ast.AstNode* %18, %ast.AstNode* %19)
	store %ast.AstNode* %20, %ast.AstNode** %tree
	br label %L.1
L.3:
	%21 = load %ast.AstNode** %indx
	store %ast.AstNode* %21, %ast.AstNode** %tree
	br label %L.1
L.1:
	%22 = load %ast.AstNode** %tree
	store %ast.AstNode* %22, %ast.AstNode** %rv.0
	br label %return
return:
	%23 = load %ast.AstNode** %rv.0
	ret %ast.AstNode* %23
}
define { %ast.AstNode*, %ast.AstNode*, %ast.AstNode* } @llvm_BitfieldRewrite(%ast.AstNode* %offs.arg) nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%rv.1 = alloca %ast.AstNode*
	%rv.2 = alloca %ast.AstNode*
	%offs = alloca %ast.AstNode*
	store %ast.AstNode* %offs.arg, %ast.AstNode** %offs
	%varb = alloca %ast.AstNode*
	%tree = alloca %ast.AstNode*
	%shft = alloca i32
	store i32 0, i32* %shft
	store %ast.AstNode* null, %ast.AstNode** %varb
	br label %L.1
L.1:
	%0 = load %ast.AstNode** %offs
	%1 = getelementptr %ast.AstNode* %0, i32 0, i32 0
	%2 = load i8* %1
	%3 = zext i8 %2 to i32
	switch i32 %3, label %L.3 [
		i32 16, label %L.5
		i32 17, label %L.6
		i32 18, label %L.7
	]
L.5:
	%4 = load %ast.AstNode** %offs
	%5 = getelementptr %ast.AstNode* %4, i32 0, i32 11
	%6 = getelementptr [0 x %ast.AstNode*]* %5, i32 0, i32 0
	%7 = load %ast.AstNode** %6
	%8 = getelementptr %ast.AstNode* %7, i32 0, i32 9
	%9 = load %type.TypeNode** %8
	%10 = load %ast.AstNode** %offs
	%11 = getelementptr %ast.AstNode* %10, i32 0, i32 8
	%12 = load i64* %11
	%13 = call i32 @llvm_BitfieldOffset(%type.TypeNode* %9, i64 %12)
	store i32 %13, i32* %shft
	br label %L.4
L.6:
	%14 = load %ast.AstNode** %offs
	%15 = load %ast.AstNode** %offs
	%16 = getelementptr %ast.AstNode* %15, i32 0, i32 9
	%17 = load %type.TypeNode** %16
	%18 = getelementptr %type.TypeNode* %17, i32 0, i32 7
	%19 = load i32* %18
	%20 = load %ast.AstNode** %varb
	%21 = call %ast.AstNode* @llvm_BitfieldIndex(%ast.AstNode* %14, i32 %19, %ast.AstNode* %20)
	store %ast.AstNode* %21, %ast.AstNode** %varb
	br label %L.4
L.7:
	%22 = load %ast.AstNode** %offs
	%23 = load %ast.AstNode** %offs
	%24 = getelementptr %ast.AstNode* %23, i32 0, i32 9
	%25 = load %type.TypeNode** %24
	%26 = getelementptr %type.TypeNode* %25, i32 0, i32 0
	%27 = load %type.TypeNode** %26
	%28 = getelementptr %type.TypeNode* %27, i32 0, i32 7
	%29 = load i32* %28
	%30 = load %ast.AstNode** %varb
	%31 = call %ast.AstNode* @llvm_BitfieldIndex(%ast.AstNode* %22, i32 %29, %ast.AstNode* %30)
	store %ast.AstNode* %31, %ast.AstNode** %varb
	br label %L.4
L.3:
	br label %L.4
L.4:
	%32 = load %ast.AstNode** %offs
	%33 = getelementptr %ast.AstNode* %32, i32 0, i32 11
	%34 = getelementptr [0 x %ast.AstNode*]* %33, i32 0, i32 0
	%35 = load %ast.AstNode** %34
	store %ast.AstNode* %35, %ast.AstNode** %offs
	%36 = load %ast.AstNode** %offs
	%37 = getelementptr %ast.AstNode* %36, i32 0, i32 0
	%38 = load i8* %37
	%39 = icmp ult i8 %38, 16
	br i1 %39, label %L.12, label %L.11
L.11:
	%40 = load %ast.AstNode** %offs
	%41 = getelementptr %ast.AstNode* %40, i32 0, i32 0
	%42 = load i8* %41
	%43 = icmp ugt i8 %42, 18
	br label %L.12
L.12:
	%44 = phi i1 [ true, %L.4 ], [ %43, %L.11 ]
	br i1 %44, label %L.10, label %L.9
L.9:
	%45 = load %ast.AstNode** %offs
	%46 = getelementptr %ast.AstNode* %45, i32 0, i32 11
	%47 = getelementptr [0 x %ast.AstNode*]* %46, i32 0, i32 0
	%48 = load %ast.AstNode** %47
	%49 = getelementptr %ast.AstNode* %48, i32 0, i32 9
	%50 = load %type.TypeNode** %49
	%51 = getelementptr %type.TypeNode* %50, i32 0, i32 12
	%52 = load i8* %51
	%53 = icmp ne i8 %52, 2
	br label %L.10
L.10:
	%54 = phi i1 [ true, %L.12 ], [ %53, %L.9 ]
	br i1 %54, label %L.2, label %L.8
L.8:
	br label %L.1
L.2:
	%55 = load i32* %shft
	%56 = icmp ne i32 %55, 0
	br i1 %56, label %L.14, label %L.13
L.14:
	%57 = load %type.TypeNode** @type_wordtype
	%58 = load i32* %shft
	%59 = zext i32 %58 to i64
	%60 = call %ast.AstNode* @ast_Const(%type.TypeNode* %57, i64 %59)
	store %ast.AstNode* %60, %ast.AstNode** %tree
	%61 = load %ast.AstNode** %varb
	%62 = icmp ne %ast.AstNode* %61, null
	br i1 %62, label %L.16, label %L.17
L.16:
	%63 = load %type.TypeNode** @type_wordtype
	%64 = load %ast.AstNode** %varb
	%65 = load %ast.AstNode** %tree
	%66 = call %ast.AstNode* @ast_New2(i8 33, %type.TypeNode* %63, %ast.AstNode* %64, %ast.AstNode* %65)
	store %ast.AstNode* %66, %ast.AstNode** %varb
	br label %L.15
L.17:
	%67 = load %ast.AstNode** %tree
	store %ast.AstNode* %67, %ast.AstNode** %varb
	br label %L.15
L.15:
	br label %L.13
L.13:
	%68 = load %ast.AstNode** %offs
	%69 = getelementptr %ast.AstNode* %68, i32 0, i32 9
	%70 = load %type.TypeNode** %69
	%71 = load %ast.AstNode** %offs
	%72 = call %ast.AstNode* @ast_New1(i8 25, %type.TypeNode* %70, %ast.AstNode* %71)
	store %ast.AstNode* %72, %ast.AstNode** %tree
	%73 = load %ast.AstNode** %tree
	%74 = getelementptr %ast.AstNode* %73, i32 0, i32 1
	store i8 2, i8* %74
	%75 = load %ast.AstNode** %offs
	%76 = getelementptr %ast.AstNode* %75, i32 0, i32 9
	%77 = load %type.TypeNode** %76
	%78 = getelementptr %type.TypeNode* %77, i32 0, i32 8
	%79 = load i32* %78
	%80 = trunc i32 %79 to i8
	%81 = load %ast.AstNode** %tree
	%82 = getelementptr %ast.AstNode* %81, i32 0, i32 2
	store i8 %80, i8* %82
	%83 = load %ast.AstNode** %tree
	%84 = getelementptr %ast.AstNode* %83, i32 0, i32 2
	%85 = load i8* %84
	%86 = load %target.TargetT** @target_Target
	%87 = getelementptr %target.TargetT* %86, i32 0, i32 3
	%88 = load i8* %87
	%89 = icmp ugt i8 %85, %88
	br i1 %89, label %L.18, label %L.19
L.18:
	%90 = load %ast.AstNode** %tree
	%91 = getelementptr %ast.AstNode* %90, i32 0, i32 9
	%92 = load %type.TypeNode** %91
	%93 = getelementptr %type.TypeNode* %92, i32 0, i32 14
	%94 = load i8* %93
	%95 = load %target.TargetT** @target_Target
	%96 = getelementptr %target.TargetT* %95, i32 0, i32 2
	%97 = load i8* %96
	%98 = icmp ne i8 %94, %97
	br label %L.19
L.19:
	%99 = phi i1 [ false, %L.13 ], [ %98, %L.18 ]
	br i1 %99, label %L.21, label %L.20
L.21:
	%100 = load %ast.AstNode** %tree
	%101 = getelementptr %ast.AstNode* %100, i32 0, i32 9
	%102 = load %type.TypeNode** %101
	%103 = load %ast.AstNode** %tree
	%104 = call %ast.AstNode* @ast_New1(i8 30, %type.TypeNode* %102, %ast.AstNode* %103)
	store %ast.AstNode* %104, %ast.AstNode** %tree
	br label %L.20
L.20:
	%105 = load %ast.AstNode** %tree
	%106 = load %type.TypeNode** @type_wordtype
	%107 = getelementptr %type.TypeNode* %106, i32 0, i32 7
	%108 = load i32* %107
	%109 = call %ast.AstNode* @expr_Extend(%ast.AstNode* %105, i32 %108)
	store %ast.AstNode* %109, %ast.AstNode** %tree
	%110 = load %ast.AstNode** %tree
	store %ast.AstNode* %110, %ast.AstNode** %rv.0
	%111 = load %ast.AstNode** %varb
	store %ast.AstNode* %111, %ast.AstNode** %rv.1
	%112 = load %ast.AstNode** %offs
	store %ast.AstNode* %112, %ast.AstNode** %rv.2
	br label %return
return:
	%113 = load %ast.AstNode** %rv.0
	%114 = load %ast.AstNode** %rv.1
	%115 = load %ast.AstNode** %rv.2
	ret %ast.AstNode* %113, %ast.AstNode* %114, %ast.AstNode* %115
}
define %ast.AstNode* @llvm_BitfieldMask(%ast.AstNode* %node.arg) nounwind {
L.0:
	%rv.0 = alloca %ast.AstNode*
	%node = alloca %ast.AstNode*
	store %ast.AstNode* %node.arg, %ast.AstNode** %node
	%mask = alloca %ast.AstNode*
	%bits = alloca i64
	%size = alloca i32
	%0 = load %ast.AstNode** %node
	%1 = getelementptr %ast.AstNode* %0, i32 0, i32 0
	%2 = load i8* %1
	%3 = icmp eq i8 %2, 18
	br i1 %3, label %L.2, label %L.3
L.2:
	%4 = load %ast.AstNode** %node
	%5 = getelementptr %ast.AstNode* %4, i32 0, i32 11
	%6 = getelementptr [0 x %ast.AstNode*]* %5, i32 0, i32 2
	%7 = load %ast.AstNode** %6
	%8 = getelementptr %ast.AstNode* %7, i32 0, i32 0
	%9 = load i8* %8
	%10 = icmp ne i8 %9, 7
	br i1 %10, label %L.5, label %L.6
L.5:
	%11 = getelementptr [32 x i8]* @.str706
	%12 = bitcast [32 x i8]* %11 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %12)
	br label %L.4
L.6:
	%13 = load %ast.AstNode** %node
	%14 = getelementptr %ast.AstNode* %13, i32 0, i32 9
	%15 = load %type.TypeNode** %14
	%16 = getelementptr %type.TypeNode* %15, i32 0, i32 0
	%17 = load %type.TypeNode** %16
	%18 = getelementptr %type.TypeNode* %17, i32 0, i32 7
	%19 = load i32* %18
	store i32 %19, i32* %size
	%20 = load i32* %size
	%21 = load %ast.AstNode** %node
	%22 = getelementptr %ast.AstNode* %21, i32 0, i32 11
	%23 = getelementptr [0 x %ast.AstNode*]* %22, i32 0, i32 2
	%24 = load %ast.AstNode** %23
	%25 = getelementptr %ast.AstNode* %24, i32 0, i32 8
	%26 = load i64* %25
	%27 = trunc i64 %26 to i32
	%28 = mul i32 %20, %27
	store i32 %28, i32* %size
	br label %L.4
L.4:
	br label %L.1
L.3:
	%29 = load %ast.AstNode** %node
	%30 = getelementptr %ast.AstNode* %29, i32 0, i32 9
	%31 = load %type.TypeNode** %30
	%32 = getelementptr %type.TypeNode* %31, i32 0, i32 7
	%33 = load i32* %32
	store i32 %33, i32* %size
	br label %L.1
L.1:
	%34 = load i32* %size
	%35 = zext i32 %34 to i64
	%36 = shl i64 1, %35
	%37 = sub i64 %36, 1
	store i64 %37, i64* %bits
	%38 = load %type.TypeNode** @type_wordtype
	%39 = load i64* %bits
	%40 = call %ast.AstNode* @ast_Const(%type.TypeNode* %38, i64 %39)
	store %ast.AstNode* %40, %ast.AstNode** %mask
	%41 = load %ast.AstNode** %mask
	store %ast.AstNode* %41, %ast.AstNode** %rv.0
	br label %return
return:
	%42 = load %ast.AstNode** %rv.0
	ret %ast.AstNode* %42
}
define void @llvm_Load(%ast.AstNode* %load.arg) nounwind {
L.0:
	%load = alloca %ast.AstNode*
	store %ast.AstNode* %load.arg, %ast.AstNode** %load
	%offs = alloca %ast.AstNode*
	%tree = alloca %ast.AstNode*
	%varb = alloca %ast.AstNode*
	%mask = alloca %ast.AstNode*
	%size = alloca i32
	%t = alloca %type.TypeNode*
	%0 = load %ast.AstNode** %load
	%1 = getelementptr %ast.AstNode* %0, i32 0, i32 11
	%2 = getelementptr [0 x %ast.AstNode*]* %1, i32 0, i32 0
	%3 = load %ast.AstNode** %2
	store %ast.AstNode* %3, %ast.AstNode** %offs
	%4 = load %ast.AstNode** %offs
	%5 = getelementptr %ast.AstNode* %4, i32 0, i32 0
	%6 = load i8* %5
	%7 = icmp uge i8 %6, 16
	br i1 %7, label %L.3, label %L.4
L.3:
	%8 = load %ast.AstNode** %offs
	%9 = getelementptr %ast.AstNode* %8, i32 0, i32 0
	%10 = load i8* %9
	%11 = icmp ule i8 %10, 18
	br label %L.4
L.4:
	%12 = phi i1 [ false, %L.0 ], [ %11, %L.3 ]
	br i1 %12, label %L.1, label %L.2
L.1:
	%13 = load %ast.AstNode** %offs
	%14 = getelementptr %ast.AstNode* %13, i32 0, i32 11
	%15 = getelementptr [0 x %ast.AstNode*]* %14, i32 0, i32 0
	%16 = load %ast.AstNode** %15
	%17 = getelementptr %ast.AstNode* %16, i32 0, i32 9
	%18 = load %type.TypeNode** %17
	%19 = getelementptr %type.TypeNode* %18, i32 0, i32 12
	%20 = load i8* %19
	%21 = icmp eq i8 %20, 2
	br label %L.2
L.2:
	%22 = phi i1 [ false, %L.4 ], [ %21, %L.1 ]
	br i1 %22, label %L.6, label %L.7
L.6:
	%23 = load %ast.AstNode** %offs
	%24 = getelementptr %ast.AstNode* %23, i32 0, i32 9
	%25 = load %type.TypeNode** %24
	store %type.TypeNode* %25, %type.TypeNode** %t
	%26 = load %type.TypeNode** %t
	%27 = getelementptr %type.TypeNode* %26, i32 0, i32 7
	%28 = load i32* %27
	store i32 %28, i32* %size
	%29 = load %ast.AstNode** %offs
	%30 = call %ast.AstNode* @llvm_BitfieldMask(%ast.AstNode* %29)
	store %ast.AstNode* %30, %ast.AstNode** %mask
	%31 = load %ast.AstNode** %offs
	%32 = call { %ast.AstNode*, %ast.AstNode*, %ast.AstNode* } @llvm_BitfieldRewrite(%ast.AstNode* %31)
	%33 = extractvalue  { %ast.AstNode*, %ast.AstNode*, %ast.AstNode* } %32, 0
	%34 = extractvalue  { %ast.AstNode*, %ast.AstNode*, %ast.AstNode* } %32, 1
	%35 = extractvalue  { %ast.AstNode*, %ast.AstNode*, %ast.AstNode* } %32, 2
	store %ast.AstNode* %33, %ast.AstNode** %tree
	store %ast.AstNode* %34, %ast.AstNode** %varb
	store %ast.AstNode* %35, %ast.AstNode** %offs
	%36 = load %ast.AstNode** %varb
	%37 = icmp ne %ast.AstNode* %36, null
	br i1 %37, label %L.9, label %L.8
L.9:
	%38 = load %type.TypeNode** %t
	%39 = load %ast.AstNode** %tree
	%40 = load %ast.AstNode** %varb
	%41 = call %ast.AstNode* @ast_New2(i8 53, %type.TypeNode* %38, %ast.AstNode* %39, %ast.AstNode* %40)
	store %ast.AstNode* %41, %ast.AstNode** %tree
	br label %L.8
L.8:
	%42 = load %type.TypeNode** %t
	%43 = load %ast.AstNode** %tree
	%44 = load %ast.AstNode** %mask
	%45 = call %ast.AstNode* @ast_New2(i8 56, %type.TypeNode* %42, %ast.AstNode* %43, %ast.AstNode* %44)
	store %ast.AstNode* %45, %ast.AstNode** %tree
	%46 = load %ast.AstNode** %tree
	%47 = load %ast.AstNode** %load
	%48 = getelementptr %ast.AstNode* %47, i32 0, i32 2
	%49 = load i8* %48
	%50 = zext i8 %49 to i32
	%51 = call %ast.AstNode* @expr_Extend(%ast.AstNode* %46, i32 %50)
	store %ast.AstNode* %51, %ast.AstNode** %tree
	%52 = load %ast.AstNode** %tree
	%53 = call i8 @llvm_GenSub(%ast.AstNode* %52)
	%54 = load %ast.AstNode** %tree
	%55 = load %ast.AstNode** %load
	%56 = getelementptr %ast.AstNode* %55, i32 0, i32 11
	%57 = getelementptr [0 x %ast.AstNode*]* %56, i32 0, i32 0
	store %ast.AstNode* %54, %ast.AstNode** %57
	%58 = load %ast.AstNode** %tree
	%59 = getelementptr %ast.AstNode* %58, i32 0, i32 7
	%60 = load i16* %59
	%61 = load %ast.AstNode** %load
	%62 = getelementptr %ast.AstNode* %61, i32 0, i32 7
	store i16 %60, i16* %62
	br label %L.5
L.7:
	%63 = load %ast.AstNode** %offs
	%64 = call i8 @llvm_GenSub(%ast.AstNode* %63)
	%65 = load i16* @llvm_Tseqno
	%66 = load %ast.AstNode** %load
	%67 = getelementptr %ast.AstNode* %66, i32 0, i32 7
	store i16 %65, i16* %67
	%68 = load i16* @llvm_Tseqno
	%69 = add i16 %68, 1
	store i16 %69, i16* @llvm_Tseqno
	%70 = getelementptr [7 x i8]* @.str707
	%71 = bitcast [7 x i8]* %70 to [0 x i8]*
	%72 = load %ast.AstNode** %load
	call void @llvm_Print([0 x i8]* %71, %ast.AstNode* %72)
	%73 = load %ast.AstNode** %offs
	%74 = getelementptr %ast.AstNode* %73, i32 0, i32 9
	%75 = load %type.TypeNode** %74
	%76 = getelementptr %type.TypeNode* %75, i32 0, i32 17
	%77 = load i8* %76
	%78 = icmp ne i8 %77, 0
	br i1 %78, label %L.11, label %L.10
L.11:
	%79 = load i32* @llvm_f
	%80 = getelementptr [10 x i8]* @.str708
	%81 = bitcast [10 x i8]* %80 to [0 x i8]*
	call void @out_str(i32 %79, [0 x i8]* %81)
	br label %L.10
L.10:
	%82 = getelementptr [13 x i8]* @.str709
	%83 = bitcast [13 x i8]* %82 to [0 x i8]*
	%84 = load %ast.AstNode** %load
	call void @llvm_Print([0 x i8]* %83, %ast.AstNode* %84)
	%85 = load %ast.AstNode** %load
	call void @llvm_PEndLine(%ast.AstNode* %85)
	br label %L.5
L.5:
	br label %return
return:
	ret void
}
define void @llvm_Store(%ast.AstNode* %store.arg) nounwind {
L.0:
	%store = alloca %ast.AstNode*
	store %ast.AstNode* %store.arg, %ast.AstNode** %store
	%rhs = alloca %ast.AstNode*
	%lhs = alloca %ast.AstNode*
	%varb = alloca %ast.AstNode*
	%tree = alloca %ast.AstNode*
	%mask = alloca %ast.AstNode*
	%size = alloca i32
	%t = alloca %type.TypeNode*
	%i = alloca i16
	%n = alloca i16
	store i16 0, i16* %i
	%0 = load %ast.AstNode** %store
	%1 = getelementptr %ast.AstNode* %0, i32 0, i32 5
	%2 = load i16* %1
	%3 = udiv i16 %2, 2
	store i16 %3, i16* %n
	br label %L.1
L.1:
	%4 = load i16* %i
	%5 = load i16* %n
	%6 = icmp ult i16 %4, %5
	%7 = xor i1 %6, true
	br i1 %7, label %L.2, label %L.3
L.3:
	%8 = load %ast.AstNode** %store
	%9 = getelementptr %ast.AstNode* %8, i32 0, i32 11
	%10 = load i16* %i
	%11 = zext i16 %10 to i32
	%12 = getelementptr [0 x %ast.AstNode*]* %9, i32 0, i32 %11
	%13 = load %ast.AstNode** %12
	store %ast.AstNode* %13, %ast.AstNode** %lhs
	%14 = load %ast.AstNode** %store
	%15 = getelementptr %ast.AstNode* %14, i32 0, i32 11
	%16 = load i16* %n
	%17 = load i16* %i
	%18 = add i16 %16, %17
	%19 = zext i16 %18 to i32
	%20 = getelementptr [0 x %ast.AstNode*]* %15, i32 0, i32 %19
	%21 = load %ast.AstNode** %20
	store %ast.AstNode* %21, %ast.AstNode** %rhs
	%22 = load %ast.AstNode** %lhs
	%23 = getelementptr %ast.AstNode* %22, i32 0, i32 0
	%24 = load i8* %23
	%25 = icmp uge i8 %24, 16
	br i1 %25, label %L.6, label %L.7
L.6:
	%26 = load %ast.AstNode** %lhs
	%27 = getelementptr %ast.AstNode* %26, i32 0, i32 0
	%28 = load i8* %27
	%29 = icmp ule i8 %28, 18
	br label %L.7
L.7:
	%30 = phi i1 [ false, %L.3 ], [ %29, %L.6 ]
	br i1 %30, label %L.4, label %L.5
L.4:
	%31 = load %ast.AstNode** %lhs
	%32 = getelementptr %ast.AstNode* %31, i32 0, i32 11
	%33 = getelementptr [0 x %ast.AstNode*]* %32, i32 0, i32 0
	%34 = load %ast.AstNode** %33
	%35 = getelementptr %ast.AstNode* %34, i32 0, i32 9
	%36 = load %type.TypeNode** %35
	%37 = getelementptr %type.TypeNode* %36, i32 0, i32 12
	%38 = load i8* %37
	%39 = icmp eq i8 %38, 2
	br label %L.5
L.5:
	%40 = phi i1 [ false, %L.7 ], [ %39, %L.4 ]
	br i1 %40, label %L.9, label %L.8
L.9:
	%41 = load %ast.AstNode** %lhs
	%42 = getelementptr %ast.AstNode* %41, i32 0, i32 9
	%43 = load %type.TypeNode** %42
	store %type.TypeNode* %43, %type.TypeNode** %t
	%44 = load %type.TypeNode** %t
	%45 = getelementptr %type.TypeNode* %44, i32 0, i32 7
	%46 = load i32* %45
	store i32 %46, i32* %size
	%47 = load %ast.AstNode** %lhs
	%48 = call %ast.AstNode* @llvm_BitfieldMask(%ast.AstNode* %47)
	store %ast.AstNode* %48, %ast.AstNode** %mask
	%49 = load %ast.AstNode** %lhs
	%50 = call { %ast.AstNode*, %ast.AstNode*, %ast.AstNode* } @llvm_BitfieldRewrite(%ast.AstNode* %49)
	%51 = extractvalue  { %ast.AstNode*, %ast.AstNode*, %ast.AstNode* } %50, 0
	%52 = extractvalue  { %ast.AstNode*, %ast.AstNode*, %ast.AstNode* } %50, 1
	%53 = extractvalue  { %ast.AstNode*, %ast.AstNode*, %ast.AstNode* } %50, 2
	store %ast.AstNode* %51, %ast.AstNode** %tree
	store %ast.AstNode* %52, %ast.AstNode** %varb
	store %ast.AstNode* %53, %ast.AstNode** %lhs
	%54 = load %ast.AstNode** %varb
	%55 = icmp ne %ast.AstNode* %54, null
	br i1 %55, label %L.11, label %L.10
L.11:
	%56 = load %type.TypeNode** @type_wordtype
	%57 = load %ast.AstNode** %mask
	%58 = load %ast.AstNode** %varb
	%59 = call %ast.AstNode* @ast_New2(i8 52, %type.TypeNode* %56, %ast.AstNode* %57, %ast.AstNode* %58)
	store %ast.AstNode* %59, %ast.AstNode** %mask
	br label %L.10
L.10:
	%60 = load %type.TypeNode** @type_wordtype
	%61 = load %ast.AstNode** %mask
	%62 = call %ast.AstNode* @ast_New1(i8 32, %type.TypeNode* %60, %ast.AstNode* %61)
	store %ast.AstNode* %62, %ast.AstNode** %mask
	%63 = load %type.TypeNode** @type_wordtype
	%64 = load %ast.AstNode** %tree
	%65 = load %ast.AstNode** %mask
	%66 = call %ast.AstNode* @ast_New2(i8 56, %type.TypeNode* %63, %ast.AstNode* %64, %ast.AstNode* %65)
	store %ast.AstNode* %66, %ast.AstNode** %tree
	%67 = load %ast.AstNode** %rhs
	%68 = load %type.TypeNode** @type_wordtype
	%69 = getelementptr %type.TypeNode* %68, i32 0, i32 7
	%70 = load i32* %69
	%71 = call %ast.AstNode* @expr_Extend(%ast.AstNode* %67, i32 %70)
	store %ast.AstNode* %71, %ast.AstNode** %rhs
	%72 = load %ast.AstNode** %varb
	%73 = icmp ne %ast.AstNode* %72, null
	br i1 %73, label %L.13, label %L.12
L.13:
	%74 = load %type.TypeNode** @type_wordtype
	%75 = load %ast.AstNode** %rhs
	%76 = load %ast.AstNode** %varb
	%77 = call %ast.AstNode* @ast_New2(i8 52, %type.TypeNode* %74, %ast.AstNode* %75, %ast.AstNode* %76)
	store %ast.AstNode* %77, %ast.AstNode** %rhs
	br label %L.12
L.12:
	%78 = load %type.TypeNode** @type_wordtype
	%79 = load %ast.AstNode** %tree
	%80 = load %ast.AstNode** %rhs
	%81 = call %ast.AstNode* @ast_New2(i8 57, %type.TypeNode* %78, %ast.AstNode* %79, %ast.AstNode* %80)
	store %ast.AstNode* %81, %ast.AstNode** %rhs
	%82 = load %ast.AstNode** %rhs
	%83 = load %ast.AstNode** %lhs
	%84 = getelementptr %ast.AstNode* %83, i32 0, i32 2
	%85 = load i8* %84
	%86 = zext i8 %85 to i32
	%87 = call %ast.AstNode* @expr_Extend(%ast.AstNode* %82, i32 %86)
	store %ast.AstNode* %87, %ast.AstNode** %rhs
	%88 = load %ast.AstNode** %lhs
	%89 = getelementptr %ast.AstNode* %88, i32 0, i32 2
	%90 = load i8* %89
	%91 = load %target.TargetT** @target_Target
	%92 = getelementptr %target.TargetT* %91, i32 0, i32 3
	%93 = load i8* %92
	%94 = icmp ugt i8 %90, %93
	br i1 %94, label %L.14, label %L.15
L.14:
	%95 = load %ast.AstNode** %lhs
	%96 = getelementptr %ast.AstNode* %95, i32 0, i32 9
	%97 = load %type.TypeNode** %96
	%98 = getelementptr %type.TypeNode* %97, i32 0, i32 14
	%99 = load i8* %98
	%100 = load %target.TargetT** @target_Target
	%101 = getelementptr %target.TargetT* %100, i32 0, i32 2
	%102 = load i8* %101
	%103 = icmp ne i8 %99, %102
	br label %L.15
L.15:
	%104 = phi i1 [ false, %L.12 ], [ %103, %L.14 ]
	br i1 %104, label %L.17, label %L.16
L.17:
	%105 = load %ast.AstNode** %rhs
	%106 = getelementptr %ast.AstNode* %105, i32 0, i32 9
	%107 = load %type.TypeNode** %106
	%108 = load %ast.AstNode** %rhs
	%109 = call %ast.AstNode* @ast_New1(i8 30, %type.TypeNode* %107, %ast.AstNode* %108)
	store %ast.AstNode* %109, %ast.AstNode** %rhs
	br label %L.16
L.16:
	%110 = load %ast.AstNode** %lhs
	%111 = load %ast.AstNode** %store
	%112 = getelementptr %ast.AstNode* %111, i32 0, i32 11
	%113 = load i16* %i
	%114 = zext i16 %113 to i32
	%115 = getelementptr [0 x %ast.AstNode*]* %112, i32 0, i32 %114
	store %ast.AstNode* %110, %ast.AstNode** %115
	%116 = load %ast.AstNode** %rhs
	%117 = load %ast.AstNode** %store
	%118 = getelementptr %ast.AstNode* %117, i32 0, i32 11
	%119 = load i16* %n
	%120 = load i16* %i
	%121 = add i16 %119, %120
	%122 = zext i16 %121 to i32
	%123 = getelementptr [0 x %ast.AstNode*]* %118, i32 0, i32 %122
	store %ast.AstNode* %116, %ast.AstNode** %123
	br label %L.8
L.8:
	%124 = load %ast.AstNode** %rhs
	%125 = call i8 @llvm_GenSub(%ast.AstNode* %124)
	%126 = load i16* %i
	%127 = add i16 %126, 1
	store i16 %127, i16* %i
	br label %L.1
L.2:
	store i16 0, i16* %i
	br label %L.18
L.18:
	%128 = load i16* %i
	%129 = load i16* %n
	%130 = icmp ult i16 %128, %129
	%131 = xor i1 %130, true
	br i1 %131, label %L.19, label %L.20
L.20:
	%132 = load %ast.AstNode** %store
	%133 = getelementptr %ast.AstNode* %132, i32 0, i32 11
	%134 = load i16* %i
	%135 = zext i16 %134 to i32
	%136 = getelementptr [0 x %ast.AstNode*]* %133, i32 0, i32 %135
	%137 = load %ast.AstNode** %136
	store %ast.AstNode* %137, %ast.AstNode** %lhs
	%138 = load %ast.AstNode** %store
	%139 = getelementptr %ast.AstNode* %138, i32 0, i32 11
	%140 = load i16* %n
	%141 = load i16* %i
	%142 = add i16 %140, %141
	%143 = zext i16 %142 to i32
	%144 = getelementptr [0 x %ast.AstNode*]* %139, i32 0, i32 %143
	%145 = load %ast.AstNode** %144
	store %ast.AstNode* %145, %ast.AstNode** %rhs
	%146 = load %ast.AstNode** %lhs
	%147 = icmp ne %ast.AstNode* %146, null
	br i1 %147, label %L.22, label %L.21
L.22:
	%148 = load %ast.AstNode** %lhs
	%149 = call i8 @llvm_GenSub(%ast.AstNode* %148)
	%150 = load i32* @llvm_f
	call void @out_chr(i32 %150, i8 9)
	%151 = load %ast.AstNode** %store
	%152 = getelementptr %ast.AstNode* %151, i32 0, i32 11
	%153 = load i16* %i
	%154 = zext i16 %153 to i32
	%155 = getelementptr [0 x %ast.AstNode*]* %152, i32 0, i32 %154
	%156 = load %ast.AstNode** %155
	%157 = getelementptr %ast.AstNode* %156, i32 0, i32 9
	%158 = load %type.TypeNode** %157
	%159 = getelementptr %type.TypeNode* %158, i32 0, i32 18
	%160 = load i8* %159
	%161 = icmp ne i8 %160, 0
	br i1 %161, label %L.24, label %L.23
L.24:
	%162 = load i32* @llvm_f
	%163 = getelementptr [10 x i8]* @.str710
	%164 = bitcast [10 x i8]* %163 to [0 x i8]*
	call void @out_str(i32 %162, [0 x i8]* %164)
	br label %L.23
L.23:
	%165 = load i32* @llvm_f
	%166 = getelementptr [7 x i8]* @.str711
	%167 = bitcast [7 x i8]* %166 to [0 x i8]*
	call void @out_str(i32 %165, [0 x i8]* %167)
	%168 = load %ast.AstNode** %rhs
	call void @llvm_NodeType(%ast.AstNode* %168)
	%169 = load i32* @llvm_f
	call void @out_chr(i32 %169, i8 32)
	%170 = load %ast.AstNode** %rhs
	call void @llvm_NodeSrc(%ast.AstNode* %170)
	%171 = load i32* @llvm_f
	%172 = getelementptr [3 x i8]* @.str712
	%173 = bitcast [3 x i8]* %172 to [0 x i8]*
	call void @out_str(i32 %171, [0 x i8]* %173)
	%174 = load %ast.AstNode** %lhs
	call void @llvm_NodeType(%ast.AstNode* %174)
	%175 = load i32* @llvm_f
	call void @out_chr(i32 %175, i8 32)
	%176 = load %ast.AstNode** %lhs
	call void @llvm_NodeDst(%ast.AstNode* %176)
	%177 = load %ast.AstNode** %store
	call void @llvm_PEndLine(%ast.AstNode* %177)
	br label %L.21
L.21:
	%178 = load i16* %i
	%179 = add i16 %178, 1
	store i16 %179, i16* %i
	br label %L.18
L.19:
	br label %return
return:
	ret void
}
define zeroext i8 @llvm_Return(%ast.AstNode* %node.arg) nounwind {
L.0:
	%rv.0 = alloca i8
	%node = alloca %ast.AstNode*
	store %ast.AstNode* %node.arg, %ast.AstNode** %node
	%i = alloca i16
	%rnode = alloca %ast.AstNode*
	%0 = load %ast.AstNode** %node
	%1 = getelementptr %ast.AstNode* %0, i32 0, i32 5
	%2 = load i16* %1
	%3 = icmp ugt i16 %2, 0
	br i1 %3, label %L.2, label %L.1
L.2:
	store i16 0, i16* %i
	br label %L.3
L.3:
	%4 = load i16* %i
	%5 = load %ast.AstNode** %node
	%6 = getelementptr %ast.AstNode* %5, i32 0, i32 5
	%7 = load i16* %6
	%8 = icmp ult i16 %4, %7
	%9 = xor i1 %8, true
	br i1 %9, label %L.4, label %L.5
L.5:
	%10 = load %ast.AstNode** %node
	%11 = getelementptr %ast.AstNode* %10, i32 0, i32 11
	%12 = load i16* %i
	%13 = zext i16 %12 to i32
	%14 = getelementptr [0 x %ast.AstNode*]* %11, i32 0, i32 %13
	%15 = load %ast.AstNode** %14
	store %ast.AstNode* %15, %ast.AstNode** %rnode
	%16 = load %ast.AstNode** %rnode
	%17 = call i8 @llvm_GenSub(%ast.AstNode* %16)
	%18 = getelementptr [19 x i8]* @.str713
	%19 = bitcast [19 x i8]* %18 to [0 x i8]*
	%20 = load %ast.AstNode** %rnode
	call void @llvm_Print([0 x i8]* %19, %ast.AstNode* %20)
	%21 = load i16* %i
	call void @llvm_PRetValName(i16 %21)
	%22 = load %ast.AstNode** %node
	call void @llvm_PEndLine(%ast.AstNode* %22)
	%23 = load i16* %i
	%24 = add i16 %23, 1
	store i16 %24, i16* %i
	br label %L.3
L.4:
	%25 = load %ast.AstNode** %node
	%26 = getelementptr %ast.AstNode* %25, i32 0, i32 11
	%27 = getelementptr [0 x %ast.AstNode*]* %26, i32 0, i32 0
	%28 = load %ast.AstNode** %27
	%29 = getelementptr %ast.AstNode* %28, i32 0, i32 7
	%30 = load i16* %29
	%31 = load %ast.AstNode** %node
	%32 = getelementptr %ast.AstNode* %31, i32 0, i32 7
	store i16 %30, i16* %32
	br label %L.1
L.1:
	%33 = load i32* @llvm_f
	%34 = getelementptr [18 x i8]* @.str714
	%35 = bitcast [18 x i8]* %34 to [0 x i8]*
	call void @out_str(i32 %33, [0 x i8]* %35)
	%36 = load %ast.AstNode** %node
	call void @llvm_PEndLine(%ast.AstNode* %36)
	store i8 1, i8* %rv.0
	br label %return
return:
	%37 = load i8* %rv.0
	ret i8 %37
}
define void @llvm_IfExpr(%ast.AstNode* %node.arg) nounwind {
L.0:
	%node = alloca %ast.AstNode*
	store %ast.AstNode* %node.arg, %ast.AstNode** %node
	%0 = load %ast.AstNode** %node
	%1 = getelementptr %ast.AstNode* %0, i32 0, i32 11
	%2 = getelementptr [0 x %ast.AstNode*]* %1, i32 0, i32 1
	%3 = load %ast.AstNode** %2
	%4 = call i8 @llvm_GenSub(%ast.AstNode* %3)
	%5 = load %ast.AstNode** %node
	%6 = getelementptr %ast.AstNode* %5, i32 0, i32 11
	%7 = getelementptr [0 x %ast.AstNode*]* %6, i32 0, i32 2
	%8 = load %ast.AstNode** %7
	%9 = call i8 @llvm_GenSub(%ast.AstNode* %8)
	%10 = load %ast.AstNode** %node
	%11 = getelementptr %ast.AstNode* %10, i32 0, i32 11
	%12 = getelementptr [0 x %ast.AstNode*]* %11, i32 0, i32 0
	%13 = load %ast.AstNode** %12
	%14 = call i8 @llvm_GenSub(%ast.AstNode* %13)
	%15 = load i16* @llvm_Tseqno
	%16 = load %ast.AstNode** %node
	%17 = getelementptr %ast.AstNode* %16, i32 0, i32 7
	store i16 %15, i16* %17
	%18 = load i16* @llvm_Tseqno
	%19 = add i16 %18, 1
	store i16 %19, i16* @llvm_Tseqno
	%20 = getelementptr [38 x i8]* @.str715
	%21 = bitcast [38 x i8]* %20 to [0 x i8]*
	%22 = load %ast.AstNode** %node
	call void @llvm_Print([0 x i8]* %21, %ast.AstNode* %22)
	%23 = load %ast.AstNode** %node
	call void @llvm_PEndLine(%ast.AstNode* %23)
	br label %return
return:
	ret void
}
define zeroext i8 @llvm_GenSub(%ast.AstNode* %node.arg) nounwind {
L.0:
	%rv.0 = alloca i8
	%node = alloca %ast.AstNode*
	store %ast.AstNode* %node.arg, %ast.AstNode** %node
	%term = alloca i8
	store i8 0, i8* %term
	%0 = load %ast.AstNode** %node
	%1 = icmp eq %ast.AstNode* %0, null
	br i1 %1, label %L.2, label %L.1
L.2:
	%2 = load i8* %term
	store i8 %2, i8* %rv.0
	br label %return
L.1:
	%3 = load %ast.AstNode** %node
	%4 = getelementptr %ast.AstNode* %3, i32 0, i32 7
	%5 = load i16* %4
	%6 = icmp ne i16 %5, 0
	br i1 %6, label %L.4, label %L.3
L.4:
	%7 = load i8* %term
	store i8 %7, i8* %rv.0
	br label %return
L.3:
	%8 = load %ast.AstNode** %node
	%9 = getelementptr %ast.AstNode* %8, i32 0, i32 0
	%10 = load i8* %9
	%11 = zext i8 %10 to i32
	switch i32 %11, label %L.5 [
		i32 1, label %L.7
		i32 3, label %L.8
		i32 4, label %L.9
		i32 70, label %L.10
		i32 5, label %L.11
		i32 6, label %L.12
		i32 9, label %L.13
		i32 7, label %L.13
		i32 8, label %L.14
		i32 14, label %L.14
		i32 21, label %L.15
		i32 22, label %L.16
		i32 23, label %L.16
		i32 20, label %L.17
		i32 69, label %L.18
		i32 24, label %L.19
		i32 26, label %L.20
		i32 25, label %L.21
		i32 19, label %L.22
		i32 16, label %L.23
		i32 17, label %L.24
		i32 18, label %L.25
		i32 15, label %L.26
		i32 27, label %L.27
		i32 28, label %L.28
		i32 29, label %L.29
		i32 30, label %L.30
		i32 32, label %L.31
		i32 31, label %L.32
		i32 33, label %L.33
		i32 34, label %L.34
		i32 35, label %L.35
		i32 36, label %L.36
		i32 37, label %L.37
		i32 52, label %L.38
		i32 54, label %L.38
		i32 53, label %L.39
		i32 55, label %L.40
		i32 38, label %L.41
		i32 39, label %L.42
		i32 41, label %L.43
		i32 40, label %L.44
		i32 43, label %L.45
		i32 42, label %L.46
		i32 45, label %L.47
		i32 44, label %L.48
		i32 47, label %L.49
		i32 46, label %L.50
		i32 56, label %L.51
		i32 57, label %L.52
		i32 58, label %L.53
		i32 61, label %L.54
		i32 60, label %L.55
		i32 59, label %L.56
		i32 62, label %L.57
		i32 10, label %L.58
		i32 11, label %L.59
		i32 12, label %L.60
		i32 66, label %L.61
		i32 67, label %L.62
		i32 64, label %L.63
		i32 65, label %L.64
		i32 63, label %L.65
	]
L.7:
	%12 = load %ast.AstNode** %node
	%13 = getelementptr %ast.AstNode* %12, i32 0, i32 11
	%14 = getelementptr [0 x %ast.AstNode*]* %13, i32 0, i32 0
	%15 = load %ast.AstNode** %14
	%16 = call i8 @llvm_GenSub(%ast.AstNode* %15)
	%17 = load %ast.AstNode** %node
	%18 = getelementptr %ast.AstNode* %17, i32 0, i32 11
	%19 = getelementptr [0 x %ast.AstNode*]* %18, i32 0, i32 0
	%20 = load %ast.AstNode** %19
	%21 = getelementptr %ast.AstNode* %20, i32 0, i32 7
	%22 = load i16* %21
	%23 = load %ast.AstNode** %node
	%24 = getelementptr %ast.AstNode* %23, i32 0, i32 7
	store i16 %22, i16* %24
	br label %L.6
L.8:
	%25 = getelementptr %A.148603888* @feature, i32 0, i32 3
	%26 = load i8* %25
	%27 = icmp ne i8 %26, 0
	br i1 %27, label %L.67, label %L.66
L.67:
	%28 = load %ast.AstNode** %node
	%29 = getelementptr %ast.AstNode* %28, i32 0, i32 10
	%30 = load %symb.SymbNode** %29
	%31 = getelementptr %symb.SymbNode* %30
	call void @llvmdb_FileStart(%symb.SymbNode* %31)
	br label %L.66
L.66:
	%32 = load %ast.AstNode** %node
	%33 = getelementptr %ast.AstNode* %32, i32 0, i32 11
	%34 = getelementptr [0 x %ast.AstNode*]* %33, i32 0, i32 0
	%35 = load %ast.AstNode** %34
	%36 = call i8 @llvm_GenSub(%ast.AstNode* %35)
	%37 = getelementptr %A.148603888* @feature, i32 0, i32 3
	%38 = load i8* %37
	%39 = icmp ne i8 %38, 0
	br i1 %39, label %L.69, label %L.68
L.69:
	%40 = load %ast.AstNode** %node
	%41 = getelementptr %ast.AstNode* %40, i32 0, i32 10
	%42 = load %symb.SymbNode** %41
	%43 = getelementptr %symb.SymbNode* %42
	call void @llvmdb_FileFinish(%symb.SymbNode* %43)
	br label %L.68
L.68:
	br label %L.6
L.9:
	%44 = getelementptr %A.148603888* @feature, i32 0, i32 3
	%45 = load i8* %44
	%46 = icmp ne i8 %45, 0
	br i1 %46, label %L.71, label %L.70
L.71:
	%47 = load %ast.AstNode** %node
	%48 = getelementptr %ast.AstNode* %47, i32 0, i32 10
	%49 = load %symb.SymbNode** %48
	%50 = getelementptr %symb.SymbNode* %49, i32 0, i32 19
	%51 = getelementptr [0 x i8]* %50
	call void @llvmdb_PackageStart([0 x i8]* %51)
	br label %L.70
L.70:
	%52 = load %ast.AstNode** %node
	%53 = getelementptr %ast.AstNode* %52, i32 0, i32 11
	%54 = getelementptr [0 x %ast.AstNode*]* %53, i32 0, i32 0
	%55 = load %ast.AstNode** %54
	%56 = call i8 @llvm_GenSub(%ast.AstNode* %55)
	%57 = getelementptr %A.148603888* @feature, i32 0, i32 3
	%58 = load i8* %57
	%59 = icmp ne i8 %58, 0
	br i1 %59, label %L.73, label %L.72
L.73:
	call void @llvmdb_PackageEnd()
	br label %L.72
L.72:
	br label %L.6
L.10:
	%60 = getelementptr %A.148603888* @feature, i32 0, i32 3
	%61 = load i8* %60
	%62 = icmp ne i8 %61, 0
	br i1 %62, label %L.75, label %L.74
L.75:
	%63 = load %ast.AstNode** %node
	%64 = getelementptr %ast.AstNode* %63, i32 0, i32 10
	%65 = load %symb.SymbNode** %64
	%66 = getelementptr %symb.SymbNode* %65
	call void @llvmdb_ProcStart(%symb.SymbNode* %66)
	br label %L.74
L.74:
	%67 = load %ast.AstNode** %node
	call void @llvm_Procedure(%ast.AstNode* %67)
	%68 = getelementptr %A.148603888* @feature, i32 0, i32 3
	%69 = load i8* %68
	%70 = icmp ne i8 %69, 0
	br i1 %70, label %L.77, label %L.76
L.77:
	%71 = load %ast.AstNode** %node
	%72 = getelementptr %ast.AstNode* %71, i32 0, i32 10
	%73 = load %symb.SymbNode** %72
	%74 = getelementptr %symb.SymbNode* %73
	call void @llvmdb_ProcFinish(%symb.SymbNode* %74)
	br label %L.76
L.76:
	br label %L.6
L.11:
	%75 = load %ast.AstNode** %node
	call void @llvm_DclVar(%ast.AstNode* %75)
	br label %L.6
L.12:
	%76 = load %ast.AstNode** %node
	call void @llvm_DclCon(%ast.AstNode* %76)
	br label %L.6
L.13:
	br label %L.6
L.14:
	%77 = load i16* @llvm_Tseqno
	%78 = load %ast.AstNode** %node
	%79 = getelementptr %ast.AstNode* %78, i32 0, i32 7
	store i16 %77, i16* %79
	%80 = load i16* @llvm_Tseqno
	%81 = add i16 %80, 1
	store i16 %81, i16* @llvm_Tseqno
	%82 = getelementptr [27 x i8]* @.str716
	%83 = bitcast [27 x i8]* %82 to [0 x i8]*
	%84 = load %ast.AstNode** %node
	call void @llvm_Print([0 x i8]* %83, %ast.AstNode* %84)
	%85 = load %ast.AstNode** %node
	call void @llvm_NeedDeclare(%ast.AstNode* %85)
	br label %L.6
L.15:
	%86 = load %ast.AstNode** %node
	call void @llvm_Copy(%ast.AstNode* %86)
	br label %L.6
L.16:
	%87 = load %ast.AstNode** %node
	%88 = call i8 @llvm_ArrayCompare(%ast.AstNode* %87)
	store i8 %88, i8* %term
	br label %L.6
L.17:
	%89 = load %ast.AstNode** %node
	call void @llvm_Copy(%ast.AstNode* %89)
	br label %L.6
L.18:
	%90 = load %ast.AstNode** %node
	%91 = call i8 @llvm_Return(%ast.AstNode* %90)
	store i8 %91, i8* %term
	br label %L.6
L.19:
	%92 = load %ast.AstNode** %node
	call void @llvm_GetRV(%ast.AstNode* %92)
	br label %L.6
L.20:
	%93 = load %ast.AstNode** %node
	call void @llvm_Store(%ast.AstNode* %93)
	br label %L.6
L.21:
	%94 = load %ast.AstNode** %node
	call void @llvm_Load(%ast.AstNode* %94)
	br label %L.6
L.22:
	%95 = load %ast.AstNode** %node
	%96 = getelementptr %ast.AstNode* %95, i32 0, i32 11
	%97 = getelementptr [0 x %ast.AstNode*]* %96, i32 0, i32 0
	%98 = load %ast.AstNode** %97
	%99 = call i8 @llvm_GenSub(%ast.AstNode* %98)
	%100 = load i16* @llvm_Tseqno
	%101 = load %ast.AstNode** %node
	%102 = getelementptr %ast.AstNode* %101, i32 0, i32 7
	store i16 %100, i16* %102
	%103 = load i16* @llvm_Tseqno
	%104 = add i16 %103, 1
	store i16 %104, i16* @llvm_Tseqno
	%105 = getelementptr [28 x i8]* @.str717
	%106 = bitcast [28 x i8]* %105 to [0 x i8]*
	%107 = load %ast.AstNode** %node
	call void @llvm_Print([0 x i8]* %106, %ast.AstNode* %107)
	br label %L.6
L.23:
	%108 = load %ast.AstNode** %node
	%109 = getelementptr %ast.AstNode* %108, i32 0, i32 11
	%110 = getelementptr [0 x %ast.AstNode*]* %109, i32 0, i32 0
	%111 = load %ast.AstNode** %110
	%112 = call i8 @llvm_GenSub(%ast.AstNode* %111)
	%113 = load i16* @llvm_Tseqno
	%114 = load %ast.AstNode** %node
	%115 = getelementptr %ast.AstNode* %114, i32 0, i32 7
	store i16 %113, i16* %115
	%116 = load i16* @llvm_Tseqno
	%117 = add i16 %116, 1
	store i16 %117, i16* @llvm_Tseqno
	%118 = getelementptr [40 x i8]* @.str718
	%119 = bitcast [40 x i8]* %118 to [0 x i8]*
	%120 = load %ast.AstNode** %node
	call void @llvm_Print([0 x i8]* %119, %ast.AstNode* %120)
	%121 = load i32* @llvm_f
	%122 = load %ast.AstNode** %node
	%123 = getelementptr %ast.AstNode* %122, i32 0, i32 8
	%124 = load i64* %123
	%125 = trunc i64 %124 to i32
	call void @out_uint32(i32 %121, i32 %125)
	%126 = load i32* @llvm_f
	call void @out_nl(i32 %126)
	br label %L.6
L.24:
	%127 = load %ast.AstNode** %node
	%128 = getelementptr %ast.AstNode* %127, i32 0, i32 11
	%129 = getelementptr [0 x %ast.AstNode*]* %128, i32 0, i32 0
	%130 = load %ast.AstNode** %129
	%131 = call i8 @llvm_GenSub(%ast.AstNode* %130)
	%132 = load %ast.AstNode** %node
	%133 = getelementptr %ast.AstNode* %132, i32 0, i32 11
	%134 = getelementptr [0 x %ast.AstNode*]* %133, i32 0, i32 1
	%135 = load %ast.AstNode** %134
	%136 = load %type.TypeNode** @type_wordtype
	%137 = getelementptr %type.TypeNode* %136, i32 0, i32 7
	%138 = load i32* %137
	%139 = call %ast.AstNode* @expr_Extend(%ast.AstNode* %135, i32 %138)
	%140 = load %ast.AstNode** %node
	%141 = getelementptr %ast.AstNode* %140, i32 0, i32 11
	%142 = getelementptr [0 x %ast.AstNode*]* %141, i32 0, i32 1
	store %ast.AstNode* %139, %ast.AstNode** %142
	%143 = load %ast.AstNode** %node
	%144 = getelementptr %ast.AstNode* %143, i32 0, i32 11
	%145 = getelementptr [0 x %ast.AstNode*]* %144, i32 0, i32 1
	%146 = load %ast.AstNode** %145
	%147 = call i8 @llvm_GenSub(%ast.AstNode* %146)
	%148 = load i16* @llvm_Tseqno
	%149 = load %ast.AstNode** %node
	%150 = getelementptr %ast.AstNode* %149, i32 0, i32 7
	store i16 %148, i16* %150
	%151 = load i16* @llvm_Tseqno
	%152 = add i16 %151, 1
	store i16 %152, i16* @llvm_Tseqno
	%153 = getelementptr [44 x i8]* @.str719
	%154 = bitcast [44 x i8]* %153 to [0 x i8]*
	%155 = load %ast.AstNode** %node
	call void @llvm_Print([0 x i8]* %154, %ast.AstNode* %155)
	br label %L.6
L.25:
	%nextseqno = alloca i16
	%156 = load %ast.AstNode** %node
	%157 = getelementptr %ast.AstNode* %156, i32 0, i32 11
	%158 = getelementptr [0 x %ast.AstNode*]* %157, i32 0, i32 0
	%159 = load %ast.AstNode** %158
	%160 = call i8 @llvm_GenSub(%ast.AstNode* %159)
	%161 = load %ast.AstNode** %node
	%162 = getelementptr %ast.AstNode* %161, i32 0, i32 11
	%163 = getelementptr [0 x %ast.AstNode*]* %162, i32 0, i32 1
	%164 = load %ast.AstNode** %163
	%165 = load %type.TypeNode** @type_wordtype
	%166 = getelementptr %type.TypeNode* %165, i32 0, i32 7
	%167 = load i32* %166
	%168 = call %ast.AstNode* @expr_Extend(%ast.AstNode* %164, i32 %167)
	%169 = load %ast.AstNode** %node
	%170 = getelementptr %ast.AstNode* %169, i32 0, i32 11
	%171 = getelementptr [0 x %ast.AstNode*]* %170, i32 0, i32 1
	store %ast.AstNode* %168, %ast.AstNode** %171
	%172 = load %ast.AstNode** %node
	%173 = getelementptr %ast.AstNode* %172, i32 0, i32 11
	%174 = getelementptr [0 x %ast.AstNode*]* %173, i32 0, i32 1
	%175 = load %ast.AstNode** %174
	%176 = call i8 @llvm_GenSub(%ast.AstNode* %175)
	%177 = load i16* @llvm_Tseqno
	%178 = load %ast.AstNode** %node
	%179 = getelementptr %ast.AstNode* %178, i32 0, i32 7
	store i16 %177, i16* %179
	%180 = load i16* @llvm_Tseqno
	%181 = add i16 %180, 1
	store i16 %181, i16* @llvm_Tseqno
	%182 = load i16* @llvm_Tseqno
	store i16 %182, i16* %nextseqno
	%183 = load i16* @llvm_Tseqno
	%184 = add i16 %183, 1
	store i16 %184, i16* @llvm_Tseqno
	%185 = getelementptr [44 x i8]* @.str720
	%186 = bitcast [44 x i8]* %185 to [0 x i8]*
	%187 = load %ast.AstNode** %node
	call void @llvm_Print([0 x i8]* %186, %ast.AstNode* %187)
	%188 = load i32* @llvm_f
	call void @out_chr(i32 %188, i8 9)
	%189 = load i16* %nextseqno
	call void @llvm_PTempName(i16 %189)
	%190 = getelementptr [25 x i8]* @.str721
	%191 = bitcast [25 x i8]* %190 to [0 x i8]*
	%192 = load %ast.AstNode** %node
	call void @llvm_Print([0 x i8]* %191, %ast.AstNode* %192)
	%193 = load i16* %nextseqno
	%194 = load %ast.AstNode** %node
	%195 = getelementptr %ast.AstNode* %194, i32 0, i32 7
	store i16 %193, i16* %195
	br label %L.6
L.26:
	%196 = load %ast.AstNode** %node
	%197 = getelementptr %ast.AstNode* %196, i32 0, i32 11
	%198 = getelementptr [0 x %ast.AstNode*]* %197, i32 0, i32 0
	%199 = load %ast.AstNode** %198
	%200 = call i8 @llvm_GenSub(%ast.AstNode* %199)
	%201 = load i16* @llvm_Tseqno
	%202 = load %ast.AstNode** %node
	%203 = getelementptr %ast.AstNode* %202, i32 0, i32 7
	store i16 %201, i16* %203
	%204 = load i16* @llvm_Tseqno
	%205 = add i16 %204, 1
	store i16 %205, i16* @llvm_Tseqno
	%206 = load %ast.AstNode** %node
	%207 = getelementptr %ast.AstNode* %206, i32 0, i32 1
	%208 = load i8* %207
	%209 = icmp eq i8 %208, 4
	br i1 %209, label %L.79, label %L.80
L.79:
	%210 = load %ast.AstNode** %node
	%211 = getelementptr %ast.AstNode* %210, i32 0, i32 11
	%212 = getelementptr [0 x %ast.AstNode*]* %211, i32 0, i32 0
	%213 = load %ast.AstNode** %212
	%214 = getelementptr %ast.AstNode* %213, i32 0, i32 1
	%215 = load i8* %214
	%216 = icmp eq i8 %215, 4
	br i1 %216, label %L.82, label %L.83
L.82:
	%217 = getelementptr [29 x i8]* @.str722
	%218 = bitcast [29 x i8]* %217 to [0 x i8]*
	%219 = load %ast.AstNode** %node
	call void @llvm_Print([0 x i8]* %218, %ast.AstNode* %219)
	br label %L.81
L.83:
	%220 = getelementptr [30 x i8]* @.str723
	%221 = bitcast [30 x i8]* %220 to [0 x i8]*
	%222 = load %ast.AstNode** %node
	call void @llvm_Print([0 x i8]* %221, %ast.AstNode* %222)
	br label %L.81
L.81:
	br label %L.78
L.80:
	%223 = load %ast.AstNode** %node
	%224 = getelementptr %ast.AstNode* %223, i32 0, i32 11
	%225 = getelementptr [0 x %ast.AstNode*]* %224, i32 0, i32 0
	%226 = load %ast.AstNode** %225
	%227 = getelementptr %ast.AstNode* %226, i32 0, i32 1
	%228 = load i8* %227
	%229 = icmp eq i8 %228, 4
	br i1 %229, label %L.85, label %L.86
L.85:
	%230 = getelementptr [30 x i8]* @.str724
	%231 = bitcast [30 x i8]* %230 to [0 x i8]*
	%232 = load %ast.AstNode** %node
	call void @llvm_Print([0 x i8]* %231, %ast.AstNode* %232)
	br label %L.84
L.86:
	%233 = getelementptr [29 x i8]* @.str725
	%234 = bitcast [29 x i8]* %233 to [0 x i8]*
	%235 = load %ast.AstNode** %node
	call void @llvm_Print([0 x i8]* %234, %ast.AstNode* %235)
	br label %L.84
L.84:
	br label %L.78
L.78:
	br label %L.6
L.27:
	%236 = load %ast.AstNode** %node
	%237 = getelementptr [5 x i8]* @.str726
	%238 = bitcast [5 x i8]* %237 to [0 x i8]*
	call void @llvm_ChangeSize(%ast.AstNode* %236, [0 x i8]* %238)
	br label %L.6
L.28:
	%239 = load %ast.AstNode** %node
	%240 = getelementptr [5 x i8]* @.str727
	%241 = bitcast [5 x i8]* %240 to [0 x i8]*
	call void @llvm_ChangeSize(%ast.AstNode* %239, [0 x i8]* %241)
	br label %L.6
L.29:
	%242 = load %ast.AstNode** %node
	%243 = getelementptr [6 x i8]* @.str728
	%244 = bitcast [6 x i8]* %243 to [0 x i8]*
	call void @llvm_ChangeSize(%ast.AstNode* %242, [0 x i8]* %244)
	br label %L.6
L.30:
	%245 = load %ast.AstNode** %node
	call void @llvm_Swap(%ast.AstNode* %245)
	br label %L.6
L.31:
	%246 = load %ast.AstNode** %node
	%247 = getelementptr %ast.AstNode* %246, i32 0, i32 11
	%248 = getelementptr [0 x %ast.AstNode*]* %247, i32 0, i32 0
	%249 = load %ast.AstNode** %248
	%250 = call i8 @llvm_GenSub(%ast.AstNode* %249)
	%251 = load i16* @llvm_Tseqno
	%252 = load %ast.AstNode** %node
	%253 = getelementptr %ast.AstNode* %252, i32 0, i32 7
	store i16 %251, i16* %253
	%254 = load i16* @llvm_Tseqno
	%255 = add i16 %254, 1
	store i16 %255, i16* @llvm_Tseqno
	%256 = getelementptr [23 x i8]* @.str729
	%257 = bitcast [23 x i8]* %256 to [0 x i8]*
	%258 = load %ast.AstNode** %node
	call void @llvm_Print([0 x i8]* %257, %ast.AstNode* %258)
	br label %L.6
L.32:
	%259 = load %ast.AstNode** %node
	%260 = getelementptr %ast.AstNode* %259, i32 0, i32 11
	%261 = getelementptr [0 x %ast.AstNode*]* %260, i32 0, i32 0
	%262 = load %ast.AstNode** %261
	%263 = call i8 @llvm_GenSub(%ast.AstNode* %262)
	%264 = load i16* @llvm_Tseqno
	%265 = load %ast.AstNode** %node
	%266 = getelementptr %ast.AstNode* %265, i32 0, i32 7
	store i16 %264, i16* %266
	%267 = load i16* @llvm_Tseqno
	%268 = add i16 %267, 1
	store i16 %268, i16* @llvm_Tseqno
	%269 = getelementptr [22 x i8]* @.str730
	%270 = bitcast [22 x i8]* %269 to [0 x i8]*
	%271 = load %ast.AstNode** %node
	call void @llvm_Print([0 x i8]* %270, %ast.AstNode* %271)
	br label %L.6
L.33:
	%272 = load %ast.AstNode** %node
	%273 = getelementptr [4 x i8]* @.str731
	%274 = bitcast [4 x i8]* %273 to [0 x i8]*
	%275 = call i8 @llvm_BinaryOp(%ast.AstNode* %272, [0 x i8]* %274)
	br label %L.6
L.34:
	%276 = load %ast.AstNode** %node
	%277 = getelementptr [4 x i8]* @.str732
	%278 = bitcast [4 x i8]* %277 to [0 x i8]*
	%279 = call i8 @llvm_BinaryOp(%ast.AstNode* %276, [0 x i8]* %278)
	br label %L.6
L.35:
	%280 = load %ast.AstNode** %node
	%281 = getelementptr [4 x i8]* @.str733
	%282 = bitcast [4 x i8]* %281 to [0 x i8]*
	%283 = call i8 @llvm_BinaryOp(%ast.AstNode* %280, [0 x i8]* %282)
	br label %L.6
L.36:
	%284 = load %ast.AstNode** %node
	%285 = getelementptr [5 x i8]* @.str734
	%286 = bitcast [5 x i8]* %285 to [0 x i8]*
	%287 = call i8 @llvm_BinaryOp(%ast.AstNode* %284, [0 x i8]* %286)
	br label %L.6
L.37:
	%288 = load %ast.AstNode** %node
	%289 = getelementptr [5 x i8]* @.str735
	%290 = bitcast [5 x i8]* %289 to [0 x i8]*
	%291 = call i8 @llvm_BinaryOp(%ast.AstNode* %288, [0 x i8]* %290)
	br label %L.6
L.38:
	%292 = load %ast.AstNode** %node
	%293 = getelementptr [4 x i8]* @.str736
	%294 = bitcast [4 x i8]* %293 to [0 x i8]*
	%295 = call i8 @llvm_BinaryOp(%ast.AstNode* %292, [0 x i8]* %294)
	br label %L.6
L.39:
	%296 = load %ast.AstNode** %node
	%297 = getelementptr [5 x i8]* @.str737
	%298 = bitcast [5 x i8]* %297 to [0 x i8]*
	%299 = call i8 @llvm_BinaryOp(%ast.AstNode* %296, [0 x i8]* %298)
	br label %L.6
L.40:
	%300 = load %ast.AstNode** %node
	%301 = getelementptr [5 x i8]* @.str738
	%302 = bitcast [5 x i8]* %301 to [0 x i8]*
	%303 = call i8 @llvm_BinaryOp(%ast.AstNode* %300, [0 x i8]* %302)
	br label %L.6
L.41:
	%304 = load %ast.AstNode** %node
	%305 = getelementptr [8 x i8]* @.str739
	%306 = bitcast [8 x i8]* %305 to [0 x i8]*
	%307 = call i8 @llvm_CompareOp(%ast.AstNode* %304, [0 x i8]* %306)
	store i8 %307, i8* %term
	br label %L.6
L.42:
	%308 = load %ast.AstNode** %node
	%309 = getelementptr [8 x i8]* @.str740
	%310 = bitcast [8 x i8]* %309 to [0 x i8]*
	%311 = call i8 @llvm_CompareOp(%ast.AstNode* %308, [0 x i8]* %310)
	store i8 %311, i8* %term
	br label %L.6
L.43:
	%312 = load %ast.AstNode** %node
	%313 = getelementptr [9 x i8]* @.str741
	%314 = bitcast [9 x i8]* %313 to [0 x i8]*
	%315 = call i8 @llvm_CompareOp(%ast.AstNode* %312, [0 x i8]* %314)
	store i8 %315, i8* %term
	br label %L.6
L.44:
	%316 = load %ast.AstNode** %node
	%317 = getelementptr [9 x i8]* @.str742
	%318 = bitcast [9 x i8]* %317 to [0 x i8]*
	%319 = call i8 @llvm_CompareOp(%ast.AstNode* %316, [0 x i8]* %318)
	store i8 %319, i8* %term
	br label %L.6
L.45:
	%320 = load %ast.AstNode** %node
	%321 = getelementptr [9 x i8]* @.str743
	%322 = bitcast [9 x i8]* %321 to [0 x i8]*
	%323 = call i8 @llvm_CompareOp(%ast.AstNode* %320, [0 x i8]* %322)
	store i8 %323, i8* %term
	br label %L.6
L.46:
	%324 = load %ast.AstNode** %node
	%325 = getelementptr [9 x i8]* @.str744
	%326 = bitcast [9 x i8]* %325 to [0 x i8]*
	%327 = call i8 @llvm_CompareOp(%ast.AstNode* %324, [0 x i8]* %326)
	store i8 %327, i8* %term
	br label %L.6
L.47:
	%328 = load %ast.AstNode** %node
	%329 = getelementptr [9 x i8]* @.str745
	%330 = bitcast [9 x i8]* %329 to [0 x i8]*
	%331 = call i8 @llvm_CompareOp(%ast.AstNode* %328, [0 x i8]* %330)
	store i8 %331, i8* %term
	br label %L.6
L.48:
	%332 = load %ast.AstNode** %node
	%333 = getelementptr [9 x i8]* @.str746
	%334 = bitcast [9 x i8]* %333 to [0 x i8]*
	%335 = call i8 @llvm_CompareOp(%ast.AstNode* %332, [0 x i8]* %334)
	store i8 %335, i8* %term
	br label %L.6
L.49:
	%336 = load %ast.AstNode** %node
	%337 = getelementptr [9 x i8]* @.str747
	%338 = bitcast [9 x i8]* %337 to [0 x i8]*
	%339 = call i8 @llvm_CompareOp(%ast.AstNode* %336, [0 x i8]* %338)
	store i8 %339, i8* %term
	br label %L.6
L.50:
	%340 = load %ast.AstNode** %node
	%341 = getelementptr [9 x i8]* @.str748
	%342 = bitcast [9 x i8]* %341 to [0 x i8]*
	%343 = call i8 @llvm_CompareOp(%ast.AstNode* %340, [0 x i8]* %342)
	store i8 %343, i8* %term
	br label %L.6
L.51:
	%344 = load %ast.AstNode** %node
	%345 = getelementptr [4 x i8]* @.str749
	%346 = bitcast [4 x i8]* %345 to [0 x i8]*
	%347 = call i8 @llvm_BinaryOp(%ast.AstNode* %344, [0 x i8]* %346)
	br label %L.6
L.52:
	%348 = load %ast.AstNode** %node
	%349 = getelementptr [3 x i8]* @.str750
	%350 = bitcast [3 x i8]* %349 to [0 x i8]*
	%351 = call i8 @llvm_BinaryOp(%ast.AstNode* %348, [0 x i8]* %350)
	br label %L.6
L.53:
	%352 = load %ast.AstNode** %node
	%353 = getelementptr [4 x i8]* @.str751
	%354 = bitcast [4 x i8]* %353 to [0 x i8]*
	%355 = call i8 @llvm_BinaryOp(%ast.AstNode* %352, [0 x i8]* %354)
	br label %L.6
L.54:
	%356 = load %ast.AstNode** %node
	%357 = getelementptr %ast.AstNode* %356, i32 0, i32 11
	%358 = getelementptr [0 x %ast.AstNode*]* %357, i32 0, i32 0
	%359 = load %ast.AstNode** %358
	%360 = call i8 @llvm_GenSub(%ast.AstNode* %359)
	%361 = load i16* @llvm_Tseqno
	%362 = load %ast.AstNode** %node
	%363 = getelementptr %ast.AstNode* %362, i32 0, i32 7
	store i16 %361, i16* %363
	%364 = load i16* @llvm_Tseqno
	%365 = add i16 %364, 1
	store i16 %365, i16* @llvm_Tseqno
	%366 = getelementptr [24 x i8]* @.str752
	%367 = bitcast [24 x i8]* %366 to [0 x i8]*
	%368 = load %ast.AstNode** %node
	call void @llvm_Print([0 x i8]* %367, %ast.AstNode* %368)
	br label %L.6
L.55:
	%369 = load %ast.AstNode** %node
	%370 = call i8 @llvm_Conditional(%ast.AstNode* %369, i8 0)
	store i8 %370, i8* %term
	br label %L.6
L.56:
	%371 = load %ast.AstNode** %node
	%372 = call i8 @llvm_Conditional(%ast.AstNode* %371, i8 1)
	store i8 %372, i8* %term
	br label %L.6
L.57:
	%373 = load %ast.AstNode** %node
	call void @llvm_IfExpr(%ast.AstNode* %373)
	br label %L.6
L.58:
	%374 = load %ast.AstNode** %node
	call void @llvm_Call(%ast.AstNode* %374, i8 0)
	br label %L.6
L.59:
	%375 = load %ast.AstNode** %node
	call void @llvm_Call(%ast.AstNode* %375, i8 1)
	br label %L.6
L.60:
	%376 = load %ast.AstNode** %node
	call void @llvm_Asm(%ast.AstNode* %376)
	br label %L.6
L.61:
	%377 = load %ast.AstNode** %node
	%378 = call i8 @llvm_If(%ast.AstNode* %377)
	store i8 %378, i8* %term
	br label %L.6
L.62:
	%379 = load %ast.AstNode** %node
	%380 = call i8 @llvm_Select(%ast.AstNode* %379)
	store i8 %380, i8* %term
	br label %L.6
L.63:
	%381 = load %ast.AstNode** %node
	%382 = call i8 @llvm_Loop(%ast.AstNode* %381)
	store i8 %382, i8* %term
	br label %L.6
L.64:
	%383 = load %ast.AstNode** %node
	%384 = call i8 @llvm_Exit(%ast.AstNode* %383)
	store i8 %384, i8* %term
	br label %L.6
L.65:
	%i = alloca i16
	store i16 0, i16* %i
	br label %L.87
L.87:
	%385 = load i16* %i
	%386 = load %ast.AstNode** %node
	%387 = getelementptr %ast.AstNode* %386, i32 0, i32 5
	%388 = load i16* %387
	%389 = icmp ult i16 %385, %388
	%390 = xor i1 %389, true
	br i1 %390, label %L.88, label %L.89
L.89:
	%391 = load i8* %term
	%392 = icmp ne i8 %391, 0
	br i1 %392, label %L.91, label %L.90
L.91:
	%393 = load i16* @llvm_Lseqno
	call void @llvm_Label(i16 %393)
	%394 = load i16* @llvm_Lseqno
	%395 = add i16 %394, 1
	store i16 %395, i16* @llvm_Lseqno
	store i8 0, i8* %term
	br label %L.90
L.90:
	%396 = load %ast.AstNode** %node
	%397 = getelementptr %ast.AstNode* %396, i32 0, i32 11
	%398 = load i16* %i
	%399 = zext i16 %398 to i32
	%400 = getelementptr [0 x %ast.AstNode*]* %397, i32 0, i32 %399
	%401 = load %ast.AstNode** %400
	%402 = call i8 @llvm_GenSub(%ast.AstNode* %401)
	store i8 %402, i8* %term
	%403 = load i16* %i
	%404 = add i16 %403, 1
	store i16 %404, i16* %i
	br label %L.87
L.88:
	br label %L.6
L.5:
	br label %L.6
L.6:
	%405 = load i8* %term
	store i8 %405, i8* %rv.0
	br label %return
return:
	%406 = load i8* %rv.0
	ret i8 %406
}
define void @llvm_Gen(i32 %fd.arg, %ast.AstNode* %tree.arg) nounwind {
L.0:
	%fd = alloca i32
	%tree = alloca %ast.AstNode*
	store i32 %fd.arg, i32* %fd
	store %ast.AstNode* %tree.arg, %ast.AstNode** %tree
	%i = alloca i8
	%0 = load i32* %fd
	store i32 %0, i32* @llvm_f
	%1 = call %type.TypeNode* @type_New(i8 4)
	store %type.TypeNode* %1, %type.TypeNode** @llvm_pbytetype
	%2 = load %type.TypeNode** @type_bytetype
	%3 = load %type.TypeNode** @llvm_pbytetype
	%4 = getelementptr %type.TypeNode* %3, i32 0, i32 0
	store %type.TypeNode* %2, %type.TypeNode** %4
	%5 = call %type.TypeNode* @type_New(i8 4)
	%6 = getelementptr [4 x %type.TypeNode*]* @llvm_puinttype, i32 0, i32 0
	store %type.TypeNode* %5, %type.TypeNode** %6
	%7 = getelementptr [4 x %type.TypeNode*]* @type_uinttypes, i32 0, i32 0
	%8 = load %type.TypeNode** %7
	%9 = getelementptr [4 x %type.TypeNode*]* @llvm_puinttype, i32 0, i32 0
	%10 = load %type.TypeNode** %9
	%11 = getelementptr %type.TypeNode* %10, i32 0, i32 0
	store %type.TypeNode* %8, %type.TypeNode** %11
	%12 = call %type.TypeNode* @type_New(i8 4)
	%13 = getelementptr [4 x %type.TypeNode*]* @llvm_puinttype, i32 0, i32 1
	store %type.TypeNode* %12, %type.TypeNode** %13
	%14 = getelementptr [4 x %type.TypeNode*]* @type_uinttypes, i32 0, i32 1
	%15 = load %type.TypeNode** %14
	%16 = getelementptr [4 x %type.TypeNode*]* @llvm_puinttype, i32 0, i32 1
	%17 = load %type.TypeNode** %16
	%18 = getelementptr %type.TypeNode* %17, i32 0, i32 0
	store %type.TypeNode* %15, %type.TypeNode** %18
	%19 = call %type.TypeNode* @type_New(i8 4)
	%20 = getelementptr [4 x %type.TypeNode*]* @llvm_puinttype, i32 0, i32 2
	store %type.TypeNode* %19, %type.TypeNode** %20
	%21 = getelementptr [4 x %type.TypeNode*]* @type_uinttypes, i32 0, i32 2
	%22 = load %type.TypeNode** %21
	%23 = getelementptr [4 x %type.TypeNode*]* @llvm_puinttype, i32 0, i32 2
	%24 = load %type.TypeNode** %23
	%25 = getelementptr %type.TypeNode* %24, i32 0, i32 0
	store %type.TypeNode* %22, %type.TypeNode** %25
	%26 = call %type.TypeNode* @type_New(i8 4)
	%27 = getelementptr [4 x %type.TypeNode*]* @llvm_puinttype, i32 0, i32 3
	store %type.TypeNode* %26, %type.TypeNode** %27
	%28 = getelementptr [4 x %type.TypeNode*]* @type_uinttypes, i32 0, i32 3
	%29 = load %type.TypeNode** %28
	%30 = getelementptr [4 x %type.TypeNode*]* @llvm_puinttype, i32 0, i32 3
	%31 = load %type.TypeNode** %30
	%32 = getelementptr %type.TypeNode* %31, i32 0, i32 0
	store %type.TypeNode* %29, %type.TypeNode** %32
	%33 = load i32* @llvm_f
	%34 = getelementptr [22 x i8]* @.str753
	%35 = bitcast [22 x i8]* %34 to [0 x i8]*
	call void @out_str(i32 %33, [0 x i8]* %35)
	%36 = load %target.TargetT** @target_Target
	%37 = getelementptr %target.TargetT* %36, i32 0, i32 2
	%38 = load i8* %37
	%39 = icmp eq i8 %38, 1
	br i1 %39, label %L.2, label %L.3
L.2:
	%40 = load i32* @llvm_f
	%41 = getelementptr [2 x i8]* @.str754
	%42 = bitcast [2 x i8]* %41 to [0 x i8]*
	call void @out_str(i32 %40, [0 x i8]* %42)
	br label %L.1
L.3:
	%43 = load i32* @llvm_f
	%44 = getelementptr [2 x i8]* @.str755
	%45 = bitcast [2 x i8]* %44 to [0 x i8]*
	call void @out_str(i32 %43, [0 x i8]* %45)
	br label %L.1
L.1:
	%46 = load i32* @llvm_f
	%47 = getelementptr [4 x i8]* @.str756
	%48 = bitcast [4 x i8]* %47 to [0 x i8]*
	call void @out_str(i32 %46, [0 x i8]* %48)
	%49 = load i32* @llvm_f
	%50 = load %target.TargetT** @target_Target
	%51 = getelementptr %target.TargetT* %50, i32 0, i32 8
	%52 = getelementptr %target.SizeAlign* %51, i32 0, i32 0
	%53 = load i8* %52
	%54 = zext i8 %53 to i32
	call void @out_uint(i32 %49, i32 %54)
	%55 = load i32* @llvm_f
	%56 = getelementptr [2 x i8]* @.str757
	%57 = bitcast [2 x i8]* %56 to [0 x i8]*
	call void @out_str(i32 %55, [0 x i8]* %57)
	%58 = load i32* @llvm_f
	%59 = load %target.TargetT** @target_Target
	%60 = getelementptr %target.TargetT* %59, i32 0, i32 8
	%61 = getelementptr %target.SizeAlign* %60, i32 0, i32 1
	%62 = load i8* %61
	%63 = zext i8 %62 to i32
	call void @out_uint(i32 %58, i32 %63)
	%64 = load i32* @llvm_f
	%65 = getelementptr [2 x i8]* @.str758
	%66 = bitcast [2 x i8]* %65 to [0 x i8]*
	call void @out_str(i32 %64, [0 x i8]* %66)
	%67 = load i32* @llvm_f
	%68 = load %target.TargetT** @target_Target
	%69 = getelementptr %target.TargetT* %68, i32 0, i32 8
	%70 = getelementptr %target.SizeAlign* %69, i32 0, i32 1
	%71 = load i8* %70
	%72 = zext i8 %71 to i32
	call void @out_uint(i32 %67, i32 %72)
	%73 = load i32* @llvm_f
	%74 = getelementptr [5 x i8]* @.str759
	%75 = bitcast [5 x i8]* %74 to [0 x i8]*
	call void @out_str(i32 %73, [0 x i8]* %75)
	%76 = load i32* @llvm_f
	%77 = load %target.TargetT** @target_Target
	%78 = getelementptr %target.TargetT* %77, i32 0, i32 9
	%79 = getelementptr [8 x %target.SizeAlign]* %78, i32 0, i32 0
	%80 = getelementptr %target.SizeAlign* %79, i32 0, i32 1
	%81 = load i8* %80
	%82 = zext i8 %81 to i32
	call void @out_uint(i32 %76, i32 %82)
	%83 = load i32* @llvm_f
	%84 = getelementptr [2 x i8]* @.str760
	%85 = bitcast [2 x i8]* %84 to [0 x i8]*
	call void @out_str(i32 %83, [0 x i8]* %85)
	%86 = load i32* @llvm_f
	%87 = load %target.TargetT** @target_Target
	%88 = getelementptr %target.TargetT* %87, i32 0, i32 9
	%89 = getelementptr [8 x %target.SizeAlign]* %88, i32 0, i32 0
	%90 = getelementptr %target.SizeAlign* %89, i32 0, i32 1
	%91 = load i8* %90
	%92 = zext i8 %91 to i32
	call void @out_uint(i32 %86, i32 %92)
	store i8 0, i8* %i
	br label %L.4
L.4:
	%93 = load i8* %i
	%94 = load %target.TargetT** @target_Target
	%95 = getelementptr %target.TargetT* %94, i32 0, i32 7
	%96 = load i8* %95
	%97 = icmp ult i8 %93, %96
	%98 = xor i1 %97, true
	br i1 %98, label %L.5, label %L.6
L.6:
	%99 = load i32* @llvm_f
	%100 = getelementptr [3 x i8]* @.str761
	%101 = bitcast [3 x i8]* %100 to [0 x i8]*
	call void @out_str(i32 %99, [0 x i8]* %101)
	%102 = load i32* @llvm_f
	%103 = load %target.TargetT** @target_Target
	%104 = getelementptr %target.TargetT* %103, i32 0, i32 9
	%105 = load i8* %i
	%106 = zext i8 %105 to i32
	%107 = getelementptr [8 x %target.SizeAlign]* %104, i32 0, i32 %106
	%108 = getelementptr %target.SizeAlign* %107, i32 0, i32 0
	%109 = load i8* %108
	%110 = zext i8 %109 to i32
	call void @out_uint(i32 %102, i32 %110)
	%111 = load i32* @llvm_f
	%112 = getelementptr [2 x i8]* @.str762
	%113 = bitcast [2 x i8]* %112 to [0 x i8]*
	call void @out_str(i32 %111, [0 x i8]* %113)
	%114 = load i32* @llvm_f
	%115 = load %target.TargetT** @target_Target
	%116 = getelementptr %target.TargetT* %115, i32 0, i32 9
	%117 = load i8* %i
	%118 = zext i8 %117 to i32
	%119 = getelementptr [8 x %target.SizeAlign]* %116, i32 0, i32 %118
	%120 = getelementptr %target.SizeAlign* %119, i32 0, i32 1
	%121 = load i8* %120
	%122 = zext i8 %121 to i32
	call void @out_uint(i32 %114, i32 %122)
	%123 = load i32* @llvm_f
	%124 = getelementptr [2 x i8]* @.str763
	%125 = bitcast [2 x i8]* %124 to [0 x i8]*
	call void @out_str(i32 %123, [0 x i8]* %125)
	%126 = load i32* @llvm_f
	%127 = load %target.TargetT** @target_Target
	%128 = getelementptr %target.TargetT* %127, i32 0, i32 9
	%129 = load i8* %i
	%130 = zext i8 %129 to i32
	%131 = getelementptr [8 x %target.SizeAlign]* %128, i32 0, i32 %130
	%132 = getelementptr %target.SizeAlign* %131, i32 0, i32 1
	%133 = load i8* %132
	%134 = zext i8 %133 to i32
	call void @out_uint(i32 %126, i32 %134)
	%135 = load i8* %i
	%136 = add i8 %135, 1
	store i8 %136, i8* %i
	br label %L.4
L.5:
	%137 = load i32* @llvm_f
	%138 = getelementptr [20 x i8]* @.str764
	%139 = bitcast [20 x i8]* %138 to [0 x i8]*
	call void @out_str(i32 %137, [0 x i8]* %139)
	%140 = load i32* @llvm_f
	%141 = load %target.TargetT** @target_Target
	%142 = getelementptr %target.TargetT* %141, i32 0, i32 1
	%143 = load [0 x i8]** %142
	%144 = bitcast [0 x i8]* %143 to [0 x i8]*
	call void @out_str(i32 %140, [0 x i8]* %144)
	%145 = load i32* @llvm_f
	%146 = getelementptr [3 x i8]* @.str765
	%147 = bitcast [3 x i8]* %146 to [0 x i8]*
	call void @out_str(i32 %145, [0 x i8]* %147)
	%148 = load %ast.AstNode** %tree
	%149 = call i8 @llvm_GenSub(%ast.AstNode* %148)
	call void @llvm_Declare()
	%150 = getelementptr %A.148603888* @feature, i32 0, i32 3
	%151 = load i8* %150
	%152 = icmp ne i8 %151, 0
	br i1 %152, label %L.8, label %L.7
L.8:
	call void @llvmdb_ProgFinish()
	br label %L.7
L.7:
	br label %return
return:
	ret void
}
define i32 @main(i32 %argc.arg, [0 x [0 x i8]*]* %argv.arg) nounwind {
L.0:
	%rv.0 = alloca i32
	%argc = alloca i32
	%argv = alloca [0 x [0 x i8]*]*
	store i32 %argc.arg, i32* %argc
	store [0 x [0 x i8]*]* %argv.arg, [0 x [0 x i8]*]** %argv
	%tree = alloca %ast.AstNode*
	%i = alloca i32
	%outfd = alloca i32
	%outfile = alloca [0 x i8]*
	%targetarch = alloca [0 x i8]*
	store [0 x i8]* null, [0 x i8]** %outfile
	store [0 x i8]* null, [0 x i8]** %targetarch
	store i32 1, i32* %outfd
	store i32 1, i32* %i
	br label %L.1
L.1:
	%0 = load i32* %i
	%1 = load i32* %argc
	%2 = icmp ult i32 %0, %1
	br i1 %2, label %L.4, label %L.5
L.4:
	%3 = load [0 x [0 x i8]*]** %argv
	%4 = load i32* %i
	%5 = getelementptr [0 x [0 x i8]*]* %3, i32 0, i32 %4
	%6 = load [0 x i8]** %5
	%7 = getelementptr [0 x i8]* %6, i32 0, i32 0
	%8 = load i8* %7
	%9 = icmp eq i8 %8, 45
	br label %L.5
L.5:
	%10 = phi i1 [ false, %L.1 ], [ %9, %L.4 ]
	%11 = xor i1 %10, true
	br i1 %11, label %L.2, label %L.3
L.3:
	%12 = load [0 x [0 x i8]*]** %argv
	%13 = load i32* %i
	%14 = getelementptr [0 x [0 x i8]*]* %12, i32 0, i32 %13
	%15 = load [0 x i8]** %14
	%16 = getelementptr [0 x i8]* %15, i32 0, i32 1
	%17 = load i8* %16
	%18 = zext i8 %17 to i32
	switch i32 %18, label %L.6 [
		i32 68, label %L.8
		i32 109, label %L.9
		i32 73, label %L.10
		i32 111, label %L.11
		i32 79, label %L.12
		i32 70, label %L.13
		i32 77, label %L.14
		i32 103, label %L.15
	]
L.8:
	%19 = load [0 x [0 x i8]*]** %argv
	%20 = load i32* %i
	%21 = getelementptr [0 x [0 x i8]*]* %19, i32 0, i32 %20
	%22 = load [0 x i8]** %21
	%23 = getelementptr [0 x i8]* %22, i32 0, i32 2
	%24 = load i8* %23
	%25 = zext i8 %24 to i32
	switch i32 %25, label %L.16 [
		i32 97, label %L.18
		i32 115, label %L.19
		i32 102, label %L.20
		i32 116, label %L.21
		i32 109, label %L.22
	]
L.18:
	%26 = getelementptr %A.148602984* @debug, i32 0, i32 1
	store i8 1, i8* %26
	br label %L.17
L.19:
	%27 = getelementptr %A.148602984* @debug, i32 0, i32 0
	%28 = getelementptr %A.148603128* %27, i32 0, i32 0
	store i8 1, i8* %28
	%29 = getelementptr %A.148602984* @debug, i32 0, i32 0
	%30 = getelementptr %A.148603128* %29, i32 0, i32 1
	store i8 1, i8* %30
	%31 = getelementptr %A.148602984* @debug, i32 0, i32 0
	%32 = getelementptr %A.148603128* %31, i32 0, i32 2
	store i8 1, i8* %32
	%33 = getelementptr %A.148602984* @debug, i32 0, i32 0
	%34 = getelementptr %A.148603128* %33, i32 0, i32 3
	store i8 1, i8* %34
	br label %L.17
L.20:
	%35 = getelementptr %A.148602984* @debug, i32 0, i32 2
	store i8 1, i8* %35
	br label %L.17
L.21:
	%36 = getelementptr %A.148602984* @debug, i32 0, i32 3
	store i8 1, i8* %36
	br label %L.17
L.22:
	%37 = getelementptr %A.148602984* @debug, i32 0, i32 4
	store i8 1, i8* %37
	br label %L.17
L.16:
	br label %L.17
L.17:
	br label %L.7
L.9:
	%38 = load [0 x [0 x i8]*]** %argv
	%39 = load i32* %i
	%40 = getelementptr [0 x [0 x i8]*]* %38, i32 0, i32 %39
	%41 = load [0 x i8]** %40
	%42 = getelementptr [0 x i8]* %41, i32 0, i32 2
	%43 = load i8* %42
	%44 = icmp ne i8 %43, 0
	br i1 %44, label %L.24, label %L.25
L.24:
	%45 = load [0 x [0 x i8]*]** %argv
	%46 = load i32* %i
	%47 = getelementptr [0 x [0 x i8]*]* %45, i32 0, i32 %46
	%48 = load [0 x i8]** %47
	%49 = getelementptr [0 x i8]* %48, i32 0, i32 2
	%50 = bitcast i8* %49 to [0 x i8]*
	%51 = bitcast [0 x i8]* %50 to [0 x i8]*
	store [0 x i8]* %51, [0 x i8]** %targetarch
	br label %L.23
L.25:
	%52 = load i32* %i
	%53 = add i32 %52, 1
	store i32 %53, i32* %i
	%54 = load [0 x [0 x i8]*]** %argv
	%55 = load i32* %i
	%56 = getelementptr [0 x [0 x i8]*]* %54, i32 0, i32 %55
	%57 = load [0 x i8]** %56
	%58 = bitcast [0 x i8]* %57 to [0 x i8]*
	store [0 x i8]* %58, [0 x i8]** %targetarch
	br label %L.23
L.23:
	br label %L.7
L.10:
	%59 = load [0 x [0 x i8]*]** %argv
	%60 = load i32* %i
	%61 = getelementptr [0 x [0 x i8]*]* %59, i32 0, i32 %60
	%62 = load [0 x i8]** %61
	%63 = getelementptr [0 x i8]* %62, i32 0, i32 2
	%64 = bitcast i8* %63 to [0 x i8]*
	%65 = getelementptr [0 x i8]* %64
	%66 = call %lex.SearchPathEntry* @lex_SearchPathAdd([0 x i8]* %65, i8 0)
	br label %L.7
L.11:
	%67 = load [0 x [0 x i8]*]** %argv
	%68 = load i32* %i
	%69 = getelementptr [0 x [0 x i8]*]* %67, i32 0, i32 %68
	%70 = load [0 x i8]** %69
	%71 = getelementptr [0 x i8]* %70, i32 0, i32 2
	%72 = load i8* %71
	%73 = icmp ne i8 %72, 0
	br i1 %73, label %L.27, label %L.28
L.27:
	%74 = load [0 x [0 x i8]*]** %argv
	%75 = load i32* %i
	%76 = getelementptr [0 x [0 x i8]*]* %74, i32 0, i32 %75
	%77 = load [0 x i8]** %76
	%78 = getelementptr [0 x i8]* %77, i32 0, i32 2
	%79 = bitcast i8* %78 to [0 x i8]*
	%80 = bitcast [0 x i8]* %79 to [0 x i8]*
	store [0 x i8]* %80, [0 x i8]** %outfile
	br label %L.26
L.28:
	%81 = load i32* %i
	%82 = add i32 %81, 1
	store i32 %82, i32* %i
	%83 = load [0 x [0 x i8]*]** %argv
	%84 = load i32* %i
	%85 = getelementptr [0 x [0 x i8]*]* %83, i32 0, i32 %84
	%86 = load [0 x i8]** %85
	%87 = bitcast [0 x i8]* %86 to [0 x i8]*
	store [0 x i8]* %87, [0 x i8]** %outfile
	br label %L.26
L.26:
	br label %L.7
L.12:
	%88 = load [0 x [0 x i8]*]** %argv
	%89 = load i32* %i
	%90 = getelementptr [0 x [0 x i8]*]* %88, i32 0, i32 %89
	%91 = load [0 x i8]** %90
	%92 = getelementptr [0 x i8]* %91, i32 0, i32 2
	%93 = load i8* %92
	%94 = zext i8 %93 to i32
	switch i32 %94, label %L.29 [
		i32 115, label %L.31
	]
L.31:
	%95 = getelementptr %A.148603888* @feature, i32 0, i32 0
	store i8 1, i8* %95
	br label %L.30
L.29:
	br label %L.30
L.30:
	br label %L.7
L.13:
	%96 = load [0 x [0 x i8]*]** %argv
	%97 = load i32* %i
	%98 = getelementptr [0 x [0 x i8]*]* %96, i32 0, i32 %97
	%99 = load [0 x i8]** %98
	%100 = getelementptr [0 x i8]* %99, i32 0, i32 2
	%101 = load i8* %100
	%102 = zext i8 %101 to i32
	switch i32 %102, label %L.32 [
		i32 117, label %L.34
		i32 116, label %L.35
	]
L.34:
	%103 = getelementptr %A.148603888* @feature, i32 0, i32 1
	store i8 1, i8* %103
	br label %L.33
L.35:
	%104 = getelementptr %A.148603888* @feature, i32 0, i32 4
	store i8 1, i8* %104
	br label %L.33
L.32:
	br label %L.33
L.33:
	br label %L.7
L.14:
	%105 = getelementptr %A.148603888* @feature, i32 0, i32 2
	store i8 1, i8* %105
	br label %L.7
L.15:
	%106 = getelementptr %A.148603888* @feature, i32 0, i32 3
	store i8 1, i8* %106
	br label %L.7
L.6:
	br label %L.7
L.7:
	%107 = load i32* %i
	%108 = add i32 %107, 1
	store i32 %108, i32* %i
	br label %L.1
L.2:
	%109 = load i32* %i
	%110 = load i32* %argc
	%111 = icmp uge i32 %109, %110
	br i1 %111, label %L.37, label %L.36
L.37:
	store i32 1, i32* %rv.0
	br label %return
L.36:
	%112 = getelementptr %A.148603888* @feature, i32 0, i32 2
	%113 = load i8* %112
	%114 = icmp ne i8 %113, 0
	br i1 %114, label %L.39, label %L.38
L.39:
	%n = alloca i32
	%115 = load [0 x [0 x i8]*]** %argv
	%116 = load i32* %i
	%117 = getelementptr [0 x [0 x i8]*]* %115, i32 0, i32 %116
	%118 = load [0 x i8]** %117
	%119 = getelementptr [0 x i8]* %118
	%120 = call i32 @zstr_len([0 x i8]* %119, i32 1024)
	store i32 %120, i32* %n
	%121 = load [0 x [0 x i8]*]** %argv
	%122 = load i32* %i
	%123 = getelementptr [0 x [0 x i8]*]* %121, i32 0, i32 %122
	%124 = load [0 x i8]** %123
	%125 = load i32* %n
	%126 = sub i32 %125, 4
	%127 = getelementptr [0 x i8]* %124, i32 0, i32 %126
	%128 = bitcast i8* %127 to [4 x i8]*
	%129 = getelementptr [4 x i8]* %128
	%130 = bitcast [4 x i8]* %129 to [0 x i8]*
	%131 = getelementptr [5 x i8]* @.str766
	%132 = bitcast [5 x i8]* %131 to [0 x i8]*
	%133 = call i8 @zstr_eq([0 x i8]* %130, [0 x i8]* %132, i32 1024)
	%134 = icmp ne i8 %133, 0
	br i1 %134, label %L.41, label %L.40
L.41:
	%135 = load [0 x [0 x i8]*]** %argv
	%136 = load i32* %i
	%137 = getelementptr [0 x [0 x i8]*]* %135, i32 0, i32 %136
	%138 = load [0 x i8]** %137
	%139 = load i32* %n
	%140 = sub i32 %139, 4
	%141 = getelementptr [0 x i8]* %138, i32 0, i32 %140
	store i8 0, i8* %141
	%142 = load [0 x [0 x i8]*]** %argv
	%143 = load i32* %i
	%144 = getelementptr [0 x [0 x i8]*]* %142, i32 0, i32 %143
	%145 = load [0 x i8]** %144
	%146 = getelementptr [0 x i8]* %145
	call void @out_str(i32 1, [0 x i8]* %146)
	%147 = getelementptr [5 x i8]* @.str767
	%148 = bitcast [5 x i8]* %147 to [0 x i8]*
	call void @out_str(i32 1, [0 x i8]* %148)
	%149 = load [0 x [0 x i8]*]** %argv
	%150 = load i32* %i
	%151 = getelementptr [0 x [0 x i8]*]* %149, i32 0, i32 %150
	%152 = load [0 x i8]** %151
	%153 = load i32* %n
	%154 = sub i32 %153, 4
	%155 = getelementptr [0 x i8]* %152, i32 0, i32 %154
	store i8 46, i8* %155
	br label %L.40
L.40:
	br label %L.38
L.38:
	%156 = load [0 x i8]** %targetarch
	%157 = bitcast [0 x i8]* %156 to [0 x i8]*
	%158 = call i8 @target_set([0 x i8]* %157)
	%159 = icmp ne i8 %158, 0
	%160 = xor i1 %159, true
	br i1 %160, label %L.43, label %L.42
L.43:
	%161 = getelementptr [21 x i8]* @.str768
	%162 = bitcast [21 x i8]* %161 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %162)
	%163 = load [0 x i8]** %targetarch
	%164 = icmp ne [0 x i8]* %163, null
	br i1 %164, label %L.45, label %L.46
L.45:
	%165 = load [0 x i8]** %targetarch
	%166 = bitcast [0 x i8]* %165 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %166)
	br label %L.44
L.46:
	%167 = getelementptr [4 x i8]* @target_DefaultTarget
	%168 = bitcast [4 x i8]* %167 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %168)
	br label %L.44
L.44:
	call void @out_nl(i32 2)
	call void @target_list()
	store i32 2, i32* %rv.0
	br label %return
L.42:
	%169 = load [0 x [0 x i8]*]** %argv
	%170 = load i32* %i
	%171 = getelementptr [0 x [0 x i8]*]* %169, i32 0, i32 %170
	%172 = load [0 x i8]** %171
	%173 = getelementptr [0 x i8]* %172
	%174 = call i8 @lex_FileOpen([0 x i8]* %173)
	%175 = icmp ne i8 %174, 0
	%176 = xor i1 %175, true
	br i1 %176, label %L.48, label %L.47
L.48:
	%177 = getelementptr [28 x i8]* @.str769
	%178 = bitcast [28 x i8]* %177 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %178)
	%179 = load [0 x [0 x i8]*]** %argv
	%180 = load i32* %i
	%181 = getelementptr [0 x [0 x i8]*]* %179, i32 0, i32 %180
	%182 = load [0 x i8]** %181
	%183 = getelementptr [0 x i8]* %182
	call void @out_str(i32 2, [0 x i8]* %183)
	call void @out_nl(i32 2)
	store i32 2, i32* %rv.0
	br label %return
L.47:
	%184 = load [0 x i8]** %outfile
	%185 = icmp ne [0 x i8]* %184, null
	br i1 %185, label %L.50, label %L.49
L.50:
	%186 = load [0 x i8]** %outfile
	%187 = bitcast [0 x i8]* %186 to [0 x i8]*
	%188 = call i32 @open([0 x i8]* %187, i32 577, i32 416)
	store i32 %188, i32* %outfd
	%189 = load i32* %outfd
	%190 = icmp slt i32 %189, 0
	br i1 %190, label %L.52, label %L.51
L.52:
	%191 = getelementptr [31 x i8]* @.str770
	%192 = bitcast [31 x i8]* %191 to [0 x i8]*
	call void @out_str(i32 2, [0 x i8]* %192)
	%193 = load [0 x i8]** %outfile
	%194 = getelementptr [0 x i8]* %193
	call void @out_str(i32 2, [0 x i8]* %194)
	call void @out_nl(i32 2)
	store i32 2, i32* %rv.0
	br label %return
L.51:
	br label %L.49
L.49:
	call void @symb_Init()
	call void @symb_Push(%symb.SymbNode* null)
	%195 = load [0 x [0 x i8]*]** %argv
	%196 = load i32* %i
	%197 = getelementptr [0 x [0 x i8]*]* %195, i32 0, i32 %196
	%198 = load [0 x i8]** %197
	%199 = getelementptr [0 x i8]* %198
	%200 = call %ast.AstNode* @stmt_Program([0 x i8]* %199)
	store %ast.AstNode* %200, %ast.AstNode** %tree
	%201 = getelementptr %A.148602984* @debug, i32 0, i32 0
	%202 = getelementptr %A.148603128* %201, i32 0, i32 1
	%203 = load i8* %202
	%204 = icmp ne i8 %203, 0
	br i1 %204, label %L.54, label %L.53
L.54:
	call void @symb_Dump(i8 1)
	br label %L.53
L.53:
	call void @symb_Pop()
	%205 = getelementptr %A.148602984* @debug, i32 0, i32 0
	%206 = getelementptr %A.148603128* %205, i32 0, i32 0
	%207 = load i8* %206
	%208 = icmp ne i8 %207, 0
	br i1 %208, label %L.56, label %L.55
L.56:
	call void @symb_Dump(i8 1)
	br label %L.55
L.55:
	%209 = getelementptr %A.148602984* @debug, i32 0, i32 1
	%210 = load i8* %209
	%211 = icmp ne i8 %210, 0
	br i1 %211, label %L.58, label %L.57
L.58:
	%212 = load %ast.AstNode** %tree
	call void @ast_Dump(%ast.AstNode* %212)
	br label %L.57
L.57:
	%213 = load i8* @lex_ErrorCount
	%214 = icmp ne i8 %213, 0
	br i1 %214, label %L.60, label %L.59
L.60:
	store i32 3, i32* %rv.0
	br label %return
L.59:
	%215 = getelementptr %A.148603888* @feature, i32 0, i32 2
	%216 = load i8* %215
	%217 = icmp ne i8 %216, 0
	br i1 %217, label %L.62, label %L.63
L.62:
	call void @out_nl(i32 1)
	br label %L.61
L.63:
	%218 = load i32* %outfd
	%219 = load %ast.AstNode** %tree
	call void @llvm_Gen(i32 %218, %ast.AstNode* %219)
	br label %L.61
L.61:
	store i32 0, i32* %rv.0
	br label %return
return:
	%220 = load i32* %rv.0
	ret i32 %220
}
declare [0 x i8]* @malloc(i32)
declare void @memset([0 x i8]*, i32, i32)
declare void @memcpy([0 x i8]*, [0 x i8]*, i32)
@.str1 = internal constant [2 x i8] c"\0A\00"
declare i32 @write(i32, [0 x i8]*, i32)
@.str4 = internal constant [2 x i8] c"-\00"
@.str5 = internal constant [2 x i8] c"-\00"
@.str7 = internal constant [30 x i8] c"Feature not yet implemented: \00"
@.str8 = internal constant [42 x i8] c"Use of ':' deprecated, use 'then' instead\00"
@.str9 = internal constant [44 x i8] c"End of line in string or character constant\00"
@.str10 = internal constant [23 x i8] c"End of file in comment\00"
@.str11 = internal constant [23 x i8] c"Unexpected end of file\00"
@.str12 = internal constant [29 x i8] c"Malformed character constant\00"
@.str13 = internal constant [53 x i8] c"Malformed hex escape in string or character constant\00"
@.str14 = internal constant [25 x i8] c"Malformed unicode escape\00"
@.str15 = internal constant [20 x i8] c"Identifier too long\00"
@.str16 = internal constant [16 x i8] c"String too long\00"
@.str17 = internal constant [11 x i8] c"Expected: \00"
@.str18 = internal constant [20 x i8] c"Expected identifier\00"
@.str19 = internal constant [23 x i8] c"Undefined identifier: \00"
@.str20 = internal constant [28 x i8] c"Identifier already in use: \00"
@.str21 = internal constant [18 x i8] c"Undefined field: \00"
@.str22 = internal constant [24 x i8] c"Unexpected identifier: \00"
@.str23 = internal constant [35 x i8] c"Cannot dereference incomplete type\00"
@.str24 = internal constant [28 x i8] c"Illegal index specification\00"
@.str25 = internal constant [25 x i8] c"Identifier has no type: \00"
@.str26 = internal constant [25 x i8] c"Expected type identifier\00"
@.str27 = internal constant [25 x i8] c"Error in type definition\00"
@.str28 = internal constant [26 x i8] c"Enumeration type required\00"
@.str29 = internal constant [33 x i8] c"Illegal use of type identifier: \00"
@.str30 = internal constant [34 x i8] c"Operation not suppported for type\00"
@.str31 = internal constant [25 x i8] c"Error in type definition\00"
@.str32 = internal constant [20 x i8] c"Unknown attribute: \00"
@.str33 = internal constant [45 x i8] c"Statement begins with undefined identifier: \00"
@.str34 = internal constant [49 x i8] c"Statement begins with inappropriate identifier: \00"
@.str35 = internal constant [44 x i8] c"Statement begins with inappropriate token: \00"
@.str36 = internal constant [37 x i8] c"Illegal comparison, bad type perhaps\00"
@.str37 = internal constant [46 x i8] c"Syntax error in possible assignment statement\00"
@.str38 = internal constant [19 x i8] c"Illegal assignment\00"
@.str39 = internal constant [26 x i8] c"Illegal lhs in assignment\00"
@.str40 = internal constant [26 x i8] c"Illegal rhs in assignment\00"
@.str41 = internal constant [28 x i8] c"Type mismatch in assignment\00"
@.str42 = internal constant [36 x i8] c"Not enough rhs values in assignment\00"
@.str43 = internal constant [34 x i8] c"Too many rhs values in assignment\00"
@.str44 = internal constant [51 x i8] c"Return with no value in procedure that expects one\00"
@.str45 = internal constant [28 x i8] c"Boolean expression required\00"
@.str46 = internal constant [37 x i8] c"Unsigned integer expression required\00"
@.str47 = internal constant [13 x i8] c"Illegal cast\00"
@.str48 = internal constant [33 x i8] c"Missing type for composite value\00"
@.str49 = internal constant [33 x i8] c"Illegal type for composite value\00"
@.str50 = internal constant [41 x i8] c"Missing or undefined property identifier\00"
@.str51 = internal constant [25 x i8] c"Expecting \22then\22 or \22is\22\00"
@.str52 = internal constant [21 x i8] c"Error in \22is\22 clause\00"
@.str53 = internal constant [34 x i8] c"Return statement not in procedure\00"
@.str54 = internal constant [29 x i8] c"Exit statement not in a loop\00"
@.str55 = internal constant [29 x i8] c"Unknown statement in package\00"
@.str56 = internal constant [14 x i8] c"Not a pointer\00"
@.str57 = internal constant [13 x i8] c"Not a record\00"
@.str58 = internal constant [13 x i8] c"Not an array\00"
@.str59 = internal constant [35 x i8] c"Syntax error in record declaration\00"
@.str60 = internal constant [27 x i8] c"Base type must be a record\00"
@.str61 = internal constant [33 x i8] c"Base type must be an enumeration\00"
@.str62 = internal constant [41 x i8] c"Insufficient arguments to procedure call\00"
@.str63 = internal constant [37 x i8] c"Too many arguments to procedure call\00"
@.str64 = internal constant [49 x i8] c"Actual parameter type not compatible with formal\00"
@.str65 = internal constant [22 x i8] c"Too many initializers\00"
@.str66 = internal constant [32 x i8] c"Const requires a constant value\00"
@.str67 = internal constant [43 x i8] c"Expression must be a compile-time constant\00"
@.str68 = internal constant [19 x i8] c"Unable to import: \00"
@.str69 = internal constant [33 x i8] c"Expecting LIST for packed record\00"
@.str70 = internal constant [23 x i8] c"Assignment to constant\00"
@.str71 = internal constant [25 x i8] c"Illegal pointer constant\00"
@.str73 = internal constant [1 x i8] c"\00"
@.str74 = internal constant [10 x i8] c"ENDOFFILE\00"
@.str75 = internal constant [2 x i8] c".\00"
@.str76 = internal constant [2 x i8] c":\00"
@.str77 = internal constant [2 x i8] c";\00"
@.str78 = internal constant [2 x i8] c",\00"
@.str79 = internal constant [3 x i8] c"..\00"
@.str80 = internal constant [2 x i8] c"@\00"
@.str81 = internal constant [2 x i8] c"?\00"
@.str82 = internal constant [2 x i8] c"=\00"
@.str83 = internal constant [3 x i8] c"+=\00"
@.str84 = internal constant [3 x i8] c"-=\00"
@.str85 = internal constant [2 x i8] c"!\00"
@.str86 = internal constant [2 x i8] c"~\00"
@.str87 = internal constant [2 x i8] c"+\00"
@.str88 = internal constant [2 x i8] c"-\00"
@.str89 = internal constant [2 x i8] c"|\00"
@.str90 = internal constant [2 x i8] c"^\00"
@.str91 = internal constant [2 x i8] c"*\00"
@.str92 = internal constant [2 x i8] c"/\00"
@.str93 = internal constant [2 x i8] c"%\00"
@.str94 = internal constant [3 x i8] c"<<\00"
@.str95 = internal constant [3 x i8] c">>\00"
@.str96 = internal constant [2 x i8] c"&\00"
@.str97 = internal constant [3 x i8] c"==\00"
@.str98 = internal constant [3 x i8] c"!=\00"
@.str99 = internal constant [2 x i8] c"<\00"
@.str100 = internal constant [2 x i8] c">\00"
@.str101 = internal constant [3 x i8] c"<=\00"
@.str102 = internal constant [3 x i8] c">=\00"
@.str103 = internal constant [3 x i8] c"&&\00"
@.str104 = internal constant [3 x i8] c"||\00"
@.str105 = internal constant [2 x i8] c"(\00"
@.str106 = internal constant [2 x i8] c")\00"
@.str107 = internal constant [2 x i8] c"[\00"
@.str108 = internal constant [2 x i8] c"]\00"
@.str109 = internal constant [2 x i8] c"{\00"
@.str110 = internal constant [2 x i8] c"}\00"
@.str111 = internal constant [7 x i8] c"NUMBER\00"
@.str112 = internal constant [7 x i8] c"STRING\00"
@.str113 = internal constant [6 x i8] c"IDENT\00"
@.str114 = internal constant [5 x i8] c"type\00"
@.str115 = internal constant [4 x i8] c"var\00"
@.str116 = internal constant [6 x i8] c"const\00"
@.str117 = internal constant [5 x i8] c"proc\00"
@.str118 = internal constant [8 x i8] c"package\00"
@.str119 = internal constant [7 x i8] c"return\00"
@.str120 = internal constant [3 x i8] c"if\00"
@.str121 = internal constant [5 x i8] c"then\00"
@.str122 = internal constant [5 x i8] c"else\00"
@.str123 = internal constant [3 x i8] c"is\00"
@.str124 = internal constant [4 x i8] c"for\00"
@.str125 = internal constant [6 x i8] c"while\00"
@.str126 = internal constant [3 x i8] c"do\00"
@.str127 = internal constant [5 x i8] c"loop\00"
@.str128 = internal constant [5 x i8] c"exit\00"
@.str129 = internal constant [5 x i8] c"with\00"
@.str130 = internal constant [7 x i8] c"import\00"
@.str131 = internal constant [6 x i8] c"alias\00"
@.str132 = internal constant [3 x i8] c"as\00"
@.str133 = internal constant [5 x i8] c"when\00"
@.str134 = internal constant [4 x i8] c"asm\00"
@.str135 = internal constant [7 x i8] c"packed\00"
@.str136 = internal constant [10 x i8] c"mempacked\00"
@.str137 = internal constant [4 x i8] c"lsb\00"
@.str138 = internal constant [4 x i8] c"msb\00"
@.str139 = internal constant [3 x i8] c"le\00"
@.str140 = internal constant [3 x i8] c"be\00"
@.str141 = internal constant [3 x i8] c"ro\00"
@.str142 = internal constant [3 x i8] c"wo\00"
@.str143 = internal constant [3 x i8] c"in\00"
@.str144 = internal constant [4 x i8] c"out\00"
@.str145 = internal constant [9 x i8] c"external\00"
@.str146 = internal constant [7 x i8] c"global\00"
@.str147 = internal constant [8 x i8] c"section\00"
@.str148 = internal constant [6 x i8] c"align\00"
@.str149 = internal constant [7 x i8] c"inline\00"
@.str150 = internal constant [10 x i8] c"interrupt\00"
@.str151 = internal constant [4 x i8] c"min\00"
@.str152 = internal constant [4 x i8] c"max\00"
@.str153 = internal constant [5 x i8] c"bits\00"
@.str154 = internal constant [5 x i8] c"size\00"
@.str155 = internal constant [3 x i8] c": \00"
@.str156 = internal constant [10 x i8] c"Internal \00"
@.str157 = internal constant [8 x i8] c"Error: \00"
@.str158 = internal constant [10 x i8] c"Warning: \00"
@.str159 = internal constant [27 x i8] c"Too many errors, quiting.\0A\00"
declare void @exit(i32)
@.str160 = internal constant [18 x i8] c"New search path \22\00"
@.str161 = internal constant [3 x i8] c"\22\0A\00"
@.str162 = internal constant [2 x i8] c"/\00"
@.str163 = internal constant [5 x i8] c".esl\00"
declare i32 @open([0 x i8]*, i32, i32)
@.str164 = internal constant [2 x i8] c".\00"
@.str165 = internal constant [13 x i8] c"Open  file \22\00"
@.str166 = internal constant [3 x i8] c"\22\0A\00"
@.str167 = internal constant [5 x i8] c" \5C\0A \00"
declare void @close(i32)
@.str168 = internal constant [13 x i8] c"Close file \22\00"
@.str169 = internal constant [3 x i8] c"\22\0A\00"
declare i32 @read(i32, [0 x i8]*, i32)
@.str172 = internal constant [6 x i8] c" tok=\00"
@.str173 = internal constant [3 x i8] c" \22\00"
@.str180 = internal constant [4 x i8] c"x86\00"
@.str181 = internal constant [23 x i8] c"i386-unknown-linux-gnu\00"
@.str193 = internal constant [7 x i8] c"x86-64\00"
@.str194 = internal constant [25 x i8] c"x86_64-unknown-linux-gnu\00"
@.str206 = internal constant [7 x i8] c"x86_64\00"
@.str207 = internal constant [25 x i8] c"x86_64-unknown-linux-gnu\00"
@.str219 = internal constant [14 x i8] c"x86_64-darwin\00"
@.str220 = internal constant [22 x i8] c"x86_64-apple-darwin10\00"
@.str232 = internal constant [7 x i8] c"msp430\00"
@.str233 = internal constant [23 x i8] c"msp430-generic-generic\00"
@.str245 = internal constant [10 x i8] c"cortex-m3\00"
@.str246 = internal constant [23 x i8] c"thumb2-unknown-unknown\00"
@.str258 = internal constant [6 x i8] c"ppc32\00"
@.str259 = internal constant [18 x i8] c"ppc-unknown-linux\00"
@.str271 = internal constant [6 x i8] c"ppc64\00"
@.str272 = internal constant [20 x i8] c"ppc64-unknown-linux\00"
@.str284 = internal constant [6 x i8] c"s390x\00"
@.str285 = internal constant [22 x i8] c"systemz-unknown-linux\00"
@.str297 = internal constant [8 x i8] c"systemz\00"
@.str298 = internal constant [22 x i8] c"systemz-unknown-linux\00"
@.str310 = internal constant [5 x i8] c"mips\00"
@.str311 = internal constant [21 x i8] c"mips-unknown-unknown\00"
@.str322 = internal constant [42 x i8] c"Supported targets and generated triples:\0A\00"
@.str323 = internal constant [3 x i8] c": \00"
@.str324 = internal constant [2 x i8] c"_\00"
@.str325 = internal constant [2 x i8] c"/\00"
@.str326 = internal constant [4 x i8] c"In \00"
@.str327 = internal constant [10 x i8] c" unused: \00"
@.str328 = internal constant [5 x i8] c"true\00"
@.str329 = internal constant [6 x i8] c"false\00"
@.str330 = internal constant [9 x i8] c"_boolean\00"
@.str331 = internal constant [8 x i8] c"boolean\00"
@.str332 = internal constant [6 x i8] c"false\00"
@.str333 = internal constant [5 x i8] c"true\00"
@.str334 = internal constant [6 x i8] c"_byte\00"
@.str335 = internal constant [8 x i8] c"_memory\00"
@.str336 = internal constant [9 x i8] c"_address\00"
@.str337 = internal constant [6 x i8] c"_uint\00"
@.str338 = internal constant [5 x i8] c"_int\00"
@.str339 = internal constant [7 x i8] c"_uint8\00"
@.str340 = internal constant [6 x i8] c"_int8\00"
@.str341 = internal constant [8 x i8] c"_uint16\00"
@.str342 = internal constant [7 x i8] c"_int16\00"
@.str343 = internal constant [8 x i8] c"_uint32\00"
@.str344 = internal constant [7 x i8] c"_int32\00"
@.str345 = internal constant [8 x i8] c"_uint64\00"
@.str346 = internal constant [7 x i8] c"_int64\00"
@.str347 = internal constant [5 x i8] c"_abs\00"
@.str348 = internal constant [5 x i8] c"_min\00"
@.str349 = internal constant [5 x i8] c"_max\00"
@.str350 = internal constant [3 x i8] c", \00"
@.str351 = internal constant [10 x i8] c"constant \00"
@.str352 = internal constant [6 x i8] c"type \00"
@.str353 = internal constant [5 x i8] c"var \00"
@.str354 = internal constant [7 x i8] c"field \00"
@.str355 = internal constant [6 x i8] c"proc \00"
@.str356 = internal constant [11 x i8] c"intrinsic \00"
@.str357 = internal constant [3 x i8] c"()\00"
@.str358 = internal constant [9 x i8] c"package \00"
@.str359 = internal constant [7 x i8] c"alias \00"
@.str360 = internal constant [11 x i8] c"undefined \00"
@.str361 = internal constant [11 x i8] c"*** level \00"
@.str362 = internal constant [6 x i8] c" ***\0A\00"
@.str365 = internal constant [5 x i8] c"NULL\00"
@.str366 = internal constant [4 x i8] c"NOP\00"
@.str367 = internal constant [5 x i8] c"TYPE\00"
@.str368 = internal constant [5 x i8] c"FILE\00"
@.str369 = internal constant [8 x i8] c"PACKAGE\00"
@.str370 = internal constant [7 x i8] c"DCLVAR\00"
@.str371 = internal constant [7 x i8] c"DCLCON\00"
@.str372 = internal constant [6 x i8] c"CONST\00"
@.str373 = internal constant [7 x i8] c"STRCON\00"
@.str374 = internal constant [4 x i8] c"VAR\00"
@.str375 = internal constant [5 x i8] c"CALL\00"
@.str376 = internal constant [6 x i8] c"CALLI\00"
@.str377 = internal constant [4 x i8] c"ASM\00"
@.str378 = internal constant [7 x i8] c"CRANGE\00"
@.str379 = internal constant [6 x i8] c"CLIST\00"
@.str380 = internal constant [5 x i8] c"CAST\00"
@.str381 = internal constant [7 x i8] c"OFFSET\00"
@.str382 = internal constant [6 x i8] c"INDEX\00"
@.str383 = internal constant [6 x i8] c"SLICE\00"
@.str384 = internal constant [6 x i8] c"BYREF\00"
@.str385 = internal constant [5 x i8] c"COPY\00"
@.str386 = internal constant [6 x i8] c"ACOPY\00"
@.str387 = internal constant [4 x i8] c"AEQ\00"
@.str388 = internal constant [4 x i8] c"ANE\00"
@.str389 = internal constant [6 x i8] c"GETRV\00"
@.str390 = internal constant [5 x i8] c"LOAD\00"
@.str391 = internal constant [6 x i8] c"STORE\00"
@.str392 = internal constant [5 x i8] c"ZEXT\00"
@.str393 = internal constant [5 x i8] c"SEXT\00"
@.str394 = internal constant [6 x i8] c"TRUNC\00"
@.str395 = internal constant [5 x i8] c"REVB\00"
@.str396 = internal constant [4 x i8] c"NEG\00"
@.str397 = internal constant [4 x i8] c"NOT\00"
@.str398 = internal constant [4 x i8] c"ADD\00"
@.str399 = internal constant [4 x i8] c"SUB\00"
@.str400 = internal constant [4 x i8] c"MUL\00"
@.str401 = internal constant [4 x i8] c"DIV\00"
@.str402 = internal constant [4 x i8] c"MOD\00"
@.str403 = internal constant [3 x i8] c"EQ\00"
@.str404 = internal constant [3 x i8] c"NE\00"
@.str405 = internal constant [4 x i8] c"ULT\00"
@.str406 = internal constant [4 x i8] c"UGT\00"
@.str407 = internal constant [4 x i8] c"ULE\00"
@.str408 = internal constant [4 x i8] c"UGE\00"
@.str409 = internal constant [4 x i8] c"SLT\00"
@.str410 = internal constant [4 x i8] c"SGT\00"
@.str411 = internal constant [4 x i8] c"SLE\00"
@.str412 = internal constant [4 x i8] c"SGE\00"
@.str413 = internal constant [5 x i8] c"UMIN\00"
@.str414 = internal constant [5 x i8] c"UMAX\00"
@.str415 = internal constant [5 x i8] c"SMIN\00"
@.str416 = internal constant [5 x i8] c"SMAX\00"
@.str417 = internal constant [4 x i8] c"LSL\00"
@.str418 = internal constant [4 x i8] c"LSR\00"
@.str419 = internal constant [4 x i8] c"ASL\00"
@.str420 = internal constant [4 x i8] c"ASR\00"
@.str421 = internal constant [4 x i8] c"AND\00"
@.str422 = internal constant [3 x i8] c"OR\00"
@.str423 = internal constant [4 x i8] c"XOR\00"
@.str424 = internal constant [5 x i8] c"BAND\00"
@.str425 = internal constant [4 x i8] c"BOR\00"
@.str426 = internal constant [5 x i8] c"BNOT\00"
@.str427 = internal constant [7 x i8] c"IFEXPR\00"
@.str428 = internal constant [4 x i8] c"SEQ\00"
@.str429 = internal constant [5 x i8] c"LOOP\00"
@.str430 = internal constant [5 x i8] c"EXIT\00"
@.str431 = internal constant [3 x i8] c"IF\00"
@.str432 = internal constant [4 x i8] c"SEL\00"
@.str433 = internal constant [3 x i8] c"IS\00"
@.str434 = internal constant [4 x i8] c"RET\00"
@.str435 = internal constant [5 x i8] c"PROC\00"
@.str437 = internal constant [5 x i8] c"UNKN\00"
@.str438 = internal constant [5 x i8] c"ENUM\00"
@.str439 = internal constant [5 x i8] c"UINT\00"
@.str440 = internal constant [5 x i8] c"SINT\00"
@.str441 = internal constant [4 x i8] c"REF\00"
@.str442 = internal constant [6 x i8] c"ARRAY\00"
@.str443 = internal constant [7 x i8] c"RECORD\00"
@.str444 = internal constant [8 x i8] c"REFPROC\00"
@.str445 = internal constant [5 x i8] c" sz=\00"
@.str446 = internal constant [5 x i8] c" ln=\00"
@.str447 = internal constant [5 x i8] c" nc=\00"
@.str448 = internal constant [8 x i8] c" value \00"
@.str449 = internal constant [5 x i8] c" id \00"
@.str450 = internal constant [9 x i8] c" value \22\00"
@.str451 = internal constant [7 x i8] c" name \00"
@.str452 = internal constant [7 x i8] c"*NULL*\00"
@.str454 = internal constant [8 x i8] c"*NULL*\0A\00"
@.str456 = internal constant [7 x i8] c"UKNOWN\00"
@.str457 = internal constant [5 x i8] c"ENUM\00"
@.str458 = internal constant [5 x i8] c"UINT\00"
@.str459 = internal constant [5 x i8] c"SINT\00"
@.str460 = internal constant [4 x i8] c"REF\00"
@.str461 = internal constant [6 x i8] c"ARRAY\00"
@.str462 = internal constant [7 x i8] c"RECORD\00"
@.str463 = internal constant [8 x i8] c"REFPROC\00"
@.str470 = internal constant [2 x i8] c"_\00"
@.str471 = internal constant [20 x i8] c"field inital values\00"
@.str473 = internal constant [1 x i8] c"\00"
@.str474 = internal constant [7 x i8] c"memory\00"
@.str475 = internal constant [7 x i8] c"packed\00"
@.str477 = internal constant [1 x i8] c"\00"
@.str478 = internal constant [4 x i8] c"msb\00"
@.str479 = internal constant [4 x i8] c"lsb\00"
@.str481 = internal constant [1 x i8] c"\00"
@.str482 = internal constant [3 x i8] c"be\00"
@.str483 = internal constant [3 x i8] c"le\00"
@.str485 = internal constant [3 x i8] c"RW\00"
@.str486 = internal constant [3 x i8] c"RO\00"
@.str487 = internal constant [3 x i8] c"WO\00"
@.str489 = internal constant [3 x i8] c"..\00"
@.str490 = internal constant [3 x i8] c"..\00"
@.str491 = internal constant [3 x i8] c", \00"
@.str492 = internal constant [3 x i8] c"{\0A\00"
@.str493 = internal constant [3 x i8] c" (\00"
@.str494 = internal constant [4 x i8] c"): \00"
@.str495 = internal constant [3 x i8] c"@_\00"
@.str496 = internal constant [10 x i8] c"*UNKNOWN*\00"
@.str497 = internal constant [7 x i8] c" size=\00"
@.str498 = internal constant [7 x i8] c" attr=\00"
@.str499 = internal constant [13 x i8] c"\0A\09methods:\0A\09\00"
@.str502 = internal constant [19 x i8] c"Intrinsic unknown\0A\00"
@.str507 = internal constant [31 x i8] c"GetAlignment: unexpected node\0A\00"
@.str508 = internal constant [21 x i8] c"Both must be packed\0A\00"
@.str518 = internal constant [20 x i8] c"packed array slices\00"
@.str522 = internal constant [16 x i8] c" = metadata !{ \00"
@.str523 = internal constant [4 x i8] c" }\0A\00"
@.str524 = internal constant [3 x i8] c", \00"
@.str525 = internal constant [3 x i8] c" )\00"
@.str526 = internal constant [5 x i8] c"null\00"
@.str527 = internal constant [11 x i8] c"metadata !\00"
@.str528 = internal constant [4 x i8] c"i1 \00"
@.str529 = internal constant [5 x i8] c"true\00"
@.str530 = internal constant [6 x i8] c"false\00"
@.str531 = internal constant [5 x i8] c"i32 \00"
@.str532 = internal constant [5 x i8] c"i64 \00"
@.str533 = internal constant [12 x i8] c"metadata !\22\00"
@.str534 = internal constant [12 x i8] c"metadata !\22\00"
@.str535 = internal constant [4 x i8] c"ESL\00"
@.str536 = internal constant [1 x i8] c"\00"
@.str537 = internal constant [8 x i8] c", !dbg \00"
@.str538 = internal constant [41 x i8] c"\09call void @llvm.dbg.declare(metadata !{\00"
@.str539 = internal constant [3 x i8] c"* \00"
@.str540 = internal constant [4 x i8] c"}, \00"
@.str541 = internal constant [11 x i8] c"metadata !\00"
@.str542 = internal constant [3 x i8] c"* \00"
@.str543 = internal constant [3 x i8] c" (\00"
@.str544 = internal constant [3 x i8] c", \00"
@.str545 = internal constant [4 x i8] c")* \00"
@.str546 = internal constant [19 x i8] c"!llvm.dbg.gv = !{ \00"
@.str547 = internal constant [4 x i8] c" }\0A\00"
@.str548 = internal constant [3 x i8] c", \00"
@.str549 = internal constant [19 x i8] c"!llvm.dbg.sp = !{ \00"
@.str550 = internal constant [4 x i8] c" }\0A\00"
@.str551 = internal constant [3 x i8] c", \00"
@.str552 = internal constant [70 x i8] c"declare void @llvm.dbg.declare(metadata, metadata) nounwind readnone\0A\00"
@.str553 = internal constant [2 x i8] c"%\00"
@.str554 = internal constant [2 x i8] c".\00"
@.str555 = internal constant [3 x i8] c"A.\00"
@.str556 = internal constant [2 x i8] c"i\00"
@.str557 = internal constant [2 x i8] c"*\00"
@.str558 = internal constant [2 x i8] c"i\00"
@.str559 = internal constant [2 x i8] c"i\00"
@.str560 = internal constant [4 x i8] c" x \00"
@.str561 = internal constant [9 x i8] c" signext\00"
@.str562 = internal constant [9 x i8] c" zeroext\00"
@.str563 = internal constant [4 x i8] c" { \00"
@.str564 = internal constant [3 x i8] c", \00"
@.str565 = internal constant [3 x i8] c" }\00"
@.str566 = internal constant [6 x i8] c" void\00"
@.str567 = internal constant [3 x i8] c", \00"
@.str568 = internal constant [5 x i8] c"null\00"
@.str569 = internal constant [10 x i8] c"inttoptr(\00"
@.str570 = internal constant [5 x i8] c" to \00"
@.str571 = internal constant [5 x i8] c"void\00"
@.str572 = internal constant [2 x i8] c"*\00"
@.str573 = internal constant [2 x i8] c"i\00"
@.str574 = internal constant [10 x i8] c"inttoptr(\00"
@.str575 = internal constant [5 x i8] c" to \00"
@.str576 = internal constant [3 x i8] c"*)\00"
@.str577 = internal constant [11 x i8] c"__NoName__\00"
@.str578 = internal constant [6 x i8] c"@.str\00"
@.str579 = internal constant [5 x i8] c"%rv.\00"
@.str580 = internal constant [9 x i8] c" = type \00"
@.str581 = internal constant [2 x i8] c"i\00"
@.str582 = internal constant [2 x i8] c"<\00"
@.str583 = internal constant [2 x i8] c"{\00"
@.str584 = internal constant [3 x i8] c", \00"
@.str585 = internal constant [2 x i8] c"}\00"
@.str586 = internal constant [2 x i8] c">\00"
@.str587 = internal constant [7 x i8] c"define\00"
@.str588 = internal constant [8 x i8] c"declare\00"
@.str589 = internal constant [5 x i8] c" %I(\00"
@.str590 = internal constant [3 x i8] c" %\00"
@.str591 = internal constant [5 x i8] c".arg\00"
@.str592 = internal constant [3 x i8] c", \00"
@.str593 = internal constant [2 x i8] c")\00"
@.str594 = internal constant [16 x i8] c"zeroinitializer\00"
@.str595 = internal constant [3 x i8] c"{ \00"
@.str596 = internal constant [2 x i8] c" \00"
@.str597 = internal constant [3 x i8] c", \00"
@.str598 = internal constant [3 x i8] c" }\00"
@.str599 = internal constant [16 x i8] c"zeroinitializer\00"
@.str600 = internal constant [3 x i8] c"[ \00"
@.str601 = internal constant [2 x i8] c" \00"
@.str602 = internal constant [3 x i8] c", \00"
@.str603 = internal constant [3 x i8] c" ]\00"
@.str604 = internal constant [3 x i8] c"* \00"
@.str605 = internal constant [13 x i8] c"bitcast( %T \00"
@.str606 = internal constant [24 x i8] c"getelementptr( %T %S ) \00"
@.str607 = internal constant [9 x i8] c" to %T )\00"
@.str608 = internal constant [16 x i8] c"zeroinitializer\00"
@.str609 = internal constant [5 x i8] c"null\00"
@.str610 = internal constant [9 x i8] c", align \00"
@.str611 = internal constant [16 x i8] c"\09%I = alloca %B\00"
@.str612 = internal constant [7 x i8] c"store \00"
@.str613 = internal constant [3 x i8] c", \00"
@.str614 = internal constant [29 x i8] c"initialized local composites\00"
@.str615 = internal constant [25 x i8] c"%I = internal global %B \00"
@.str616 = internal constant [16 x i8] c"%I = global %B \00"
@.str617 = internal constant [24 x i8] c"%I = external global %B\00"
@.str618 = internal constant [27 x i8] c"%I = internal constant %B \00"
@.str619 = internal constant [18 x i8] c"%I = constant %B \00"
@.str620 = internal constant [27 x i8] c"%S = internal constant %B \00"
@.str621 = internal constant [27 x i8] c"%S = internal constant %B \00"
@.str622 = internal constant [58 x i8] c"declare void @llvm.memcpy.%W(i8*, i8*, %W, i32) nounwind\0A\00"
@.str623 = internal constant [70 x i8] c"declare void @llvm.memcpy.%W([0 x i8]*, [0 x i8]*, %W, i32) nounwind\0A\00"
@.str624 = internal constant [34 x i8] c"declare i16 @llvm.bswap.i16(i16)\0A\00"
@.str625 = internal constant [34 x i8] c"declare i32 @llvm.bswap.i32(i32)\0A\00"
@.str626 = internal constant [34 x i8] c"declare i64 @llvm.bswap.i64(i64)\0A\00"
@.str627 = internal constant [46 x i8] c"declare i1 @_builtin.memcmp.i8(i8*, i8*, %W)\0A\00"
@.str628 = internal constant [49 x i8] c"declare i1 @_builtin.memcmp.i16(i16*, i16*, %W)\0A\00"
@.str629 = internal constant [49 x i8] c"declare i1 @_builtin.memcmp.i32(i32*, i32*, %W)\0A\00"
@.str630 = internal constant [49 x i8] c"declare i1 @_builtin.memcmp.i64(i64*, i64*, %W)\0A\00"
@.str631 = internal constant [3 x i8] c"L.\00"
@.str632 = internal constant [3 x i8] c":\0A\00"
@.str633 = internal constant [8 x i8] c"label %\00"
@.str634 = internal constant [5 x i8] c"\09br \00"
@.str635 = internal constant [8 x i8] c"\09br i1 \00"
@.str636 = internal constant [3 x i8] c", \00"
@.str637 = internal constant [3 x i8] c", \00"
@.str638 = internal constant [16 x i8] c"\09switch %T %N, \00"
@.str639 = internal constant [4 x i8] c" [\0A\00"
@.str640 = internal constant [7 x i8] c"\09\09%0T \00"
@.str641 = internal constant [3 x i8] c", \00"
@.str642 = internal constant [4 x i8] c"\09]\0A\00"
@.str643 = internal constant [16 x i8] c"\09%N = phi i1 [ \00"
@.str644 = internal constant [6 x i8] c"false\00"
@.str645 = internal constant [5 x i8] c"true\00"
@.str646 = internal constant [4 x i8] c", %\00"
@.str647 = internal constant [7 x i8] c" ], [ \00"
@.str648 = internal constant [4 x i8] c", %\00"
@.str649 = internal constant [4 x i8] c" ]\0A\00"
@.str650 = internal constant [65 x i8] c"\09call void @llvm.memcpy.%2T(i8* %0N, i8* %1N, %2T %2N, i32 %3N)\0A\00"
@.str651 = internal constant [63 x i8] c"\09call void @llvm.memcpy.%2T(%T %0N, %T %1N, %2T %2N, i32 %3N)\0A\00"
@.str652 = internal constant [36 x i8] c"Array compare experimental: length=\00"
@.str653 = internal constant [9 x i8] c"variable\00"
@.str654 = internal constant [7 x i8] c" size=\00"
@.str655 = internal constant [8 x i8] c" align=\00"
@.str656 = internal constant [9 x i8] c" mask=0x\00"
@.str657 = internal constant [28 x i8] c"\09%N = icmp eq %0T %0N, %1N\0A\00"
@.str658 = internal constant [28 x i8] c"\09%N = icmp ne %0T %0N, %1N\0A\00"
@.str659 = internal constant [32 x i8] c"\09%N = call i1 @_builtin.memcmp.\00"
@.str660 = internal constant [29 x i8] c"(%0T %0N, %1T %1N, %2T %2N)\0A\00"
@.str661 = internal constant [38 x i8] c"\09%N = call %T @llvm.bswap.%T(%T %0N)\0A\00"
@.str662 = internal constant [3 x i8] c"\22\22\00"
@.str663 = internal constant [20 x i8] c"\09%N = extractvalue \00"
@.str664 = internal constant [7 x i8] c" %0N, \00"
@.str665 = internal constant [6 x i8] c"%N = \00"
@.str666 = internal constant [5 x i8] c"call\00"
@.str667 = internal constant [17 x i8] c" asm sideeffect \00"
@.str668 = internal constant [3 x i8] c", \00"
@.str669 = internal constant [3 x i8] c" (\00"
@.str670 = internal constant [6 x i8] c"%T %N\00"
@.str671 = internal constant [3 x i8] c", \00"
@.str672 = internal constant [3 x i8] c")\0A\00"
@.str673 = internal constant [6 x i8] c"%N = \00"
@.str674 = internal constant [6 x i8] c"tail \00"
@.str675 = internal constant [5 x i8] c"call\00"
@.str676 = internal constant [6 x i8] c" %0N(\00"
@.str677 = internal constant [5 x i8] c" %I(\00"
@.str678 = internal constant [6 x i8] c"%T %N\00"
@.str679 = internal constant [3 x i8] c", \00"
@.str680 = internal constant [3 x i8] c")\0A\00"
@.str681 = internal constant [16 x i8] c"DCLCON in proc\0A\00"
@.str682 = internal constant [14 x i8] c" alwaysinline\00"
@.str683 = internal constant [9 x i8] c" optsize\00"
@.str684 = internal constant [13 x i8] c" nounwind {\0A\00"
@.str685 = internal constant [11 x i8] c" = alloca \00"
@.str686 = internal constant [3 x i8] c"\09%\00"
@.str687 = internal constant [11 x i8] c" = alloca \00"
@.str688 = internal constant [8 x i8] c"\09store \00"
@.str689 = internal constant [3 x i8] c" %\00"
@.str690 = internal constant [7 x i8] c".arg, \00"
@.str691 = internal constant [4 x i8] c"* %\00"
@.str692 = internal constant [18 x i8] c"\09br label %return\00"
@.str693 = internal constant [9 x i8] c"return:\0A\00"
@.str694 = internal constant [9 x i8] c" = load \00"
@.str695 = internal constant [3 x i8] c"* \00"
@.str696 = internal constant [6 x i8] c"\09ret \00"
@.str697 = internal constant [3 x i8] c", \00"
@.str698 = internal constant [10 x i8] c"\09ret void\00"
@.str699 = internal constant [4 x i8] c"\0A}\0A\00"
@.str700 = internal constant [7 x i8] c"\09%N = \00"
@.str701 = internal constant [13 x i8] c" %T %0N, %1N\00"
@.str702 = internal constant [7 x i8] c"\09%N = \00"
@.str703 = internal constant [14 x i8] c" %0T %0N, %1N\00"
@.str704 = internal constant [7 x i8] c"\09%N = \00"
@.str705 = internal constant [15 x i8] c" %0T %0N to %T\00"
@.str706 = internal constant [32 x i8] c"BitfieldMask of variable SLICE\0A\00"
@.str707 = internal constant [7 x i8] c"\09%N = \00"
@.str708 = internal constant [10 x i8] c"volatile \00"
@.str709 = internal constant [13 x i8] c"load %T* %0N\00"
@.str710 = internal constant [10 x i8] c"volatile \00"
@.str711 = internal constant [7 x i8] c"store \00"
@.str712 = internal constant [3 x i8] c", \00"
@.str713 = internal constant [19 x i8] c"\09store %T %N, %T* \00"
@.str714 = internal constant [18 x i8] c"\09br label %return\00"
@.str715 = internal constant [38 x i8] c"\09%N = select i1 %0N, %1T %1N, %2T %2N\00"
@.str716 = internal constant [27 x i8] c"\09%N = getelementptr %T %S\0A\00"
@.str717 = internal constant [28 x i8] c"\09%N = getelementptr %T %0N\0A\00"
@.str718 = internal constant [40 x i8] c"\09%N = getelementptr %0T %0N, %W 0, i32 \00"
@.str719 = internal constant [44 x i8] c"\09%N = getelementptr %0T %0N, %W 0, %1T %1N\0A\00"
@.str720 = internal constant [44 x i8] c"\09%N = getelementptr %0T %0N, %W 0, %1T %1N\0A\00"
@.str721 = internal constant [25 x i8] c" = bitcast %A* %N to %T\0A\00"
@.str722 = internal constant [29 x i8] c"\09%N = bitcast %0T %0N to %T\0A\00"
@.str723 = internal constant [30 x i8] c"\09%N = inttoptr %0T %0N to %T\0A\00"
@.str724 = internal constant [30 x i8] c"\09%N = ptrtoint %0T %0N to %T\0A\00"
@.str725 = internal constant [29 x i8] c"\09%N = bitcast %0T %0N to %T\0A\00"
@.str726 = internal constant [5 x i8] c"zext\00"
@.str727 = internal constant [5 x i8] c"sext\00"
@.str728 = internal constant [6 x i8] c"trunc\00"
@.str729 = internal constant [23 x i8] c"\09%N = xor %0T %0N, -1\0A\00"
@.str730 = internal constant [22 x i8] c"\09%N = sub %0T 0, %0N\0A\00"
@.str731 = internal constant [4 x i8] c"add\00"
@.str732 = internal constant [4 x i8] c"sub\00"
@.str733 = internal constant [4 x i8] c"mul\00"
@.str734 = internal constant [5 x i8] c"udiv\00"
@.str735 = internal constant [5 x i8] c"urem\00"
@.str736 = internal constant [4 x i8] c"shl\00"
@.str737 = internal constant [5 x i8] c"lshr\00"
@.str738 = internal constant [5 x i8] c"ashr\00"
@.str739 = internal constant [8 x i8] c"icmp eq\00"
@.str740 = internal constant [8 x i8] c"icmp ne\00"
@.str741 = internal constant [9 x i8] c"icmp ugt\00"
@.str742 = internal constant [9 x i8] c"icmp ult\00"
@.str743 = internal constant [9 x i8] c"icmp uge\00"
@.str744 = internal constant [9 x i8] c"icmp ule\00"
@.str745 = internal constant [9 x i8] c"icmp sgt\00"
@.str746 = internal constant [9 x i8] c"icmp slt\00"
@.str747 = internal constant [9 x i8] c"icmp sge\00"
@.str748 = internal constant [9 x i8] c"icmp sle\00"
@.str749 = internal constant [4 x i8] c"and\00"
@.str750 = internal constant [3 x i8] c"or\00"
@.str751 = internal constant [4 x i8] c"xor\00"
@.str752 = internal constant [24 x i8] c"\09%N = xor i1 %0N, true\0A\00"
@.str753 = internal constant [22 x i8] c"target datalayout = \22\00"
@.str754 = internal constant [2 x i8] c"E\00"
@.str755 = internal constant [2 x i8] c"e\00"
@.str756 = internal constant [4 x i8] c"-p:\00"
@.str757 = internal constant [2 x i8] c":\00"
@.str758 = internal constant [2 x i8] c":\00"
@.str759 = internal constant [5 x i8] c"-i1:\00"
@.str760 = internal constant [2 x i8] c":\00"
@.str761 = internal constant [3 x i8] c"-i\00"
@.str762 = internal constant [2 x i8] c":\00"
@.str763 = internal constant [2 x i8] c":\00"
@.str764 = internal constant [20 x i8] c"\22\0Atarget triple = \22\00"
@.str765 = internal constant [3 x i8] c"\22\0A\00"
@.str766 = internal constant [5 x i8] c".esl\00"
@.str767 = internal constant [5 x i8] c".o: \00"
@.str768 = internal constant [21 x i8] c"Unsupported target: \00"
@.str769 = internal constant [28 x i8] c"Unable to open input file: \00"
@.str770 = internal constant [31 x i8] c"Unable to create output file: \00"
