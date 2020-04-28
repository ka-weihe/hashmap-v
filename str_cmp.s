	.file	"str_cmp.c"
	.text
	.section	.text.compare_ints,"ax",@progbits
	.p2align 4,,15
	.globl	compare_ints
	.type	compare_ints, @function
compare_ints:
.LFB115:
	.cfi_startproc
	movl	(%rsi), %eax
	cmpl	%eax, (%rdi)
	jl	.L3
	setg	%al
	movzbl	%al, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L3:
	movl	$-1, %eax
	ret
	.cfi_endproc
.LFE115:
	.size	compare_ints, .-compare_ints
	.section	.text.compare_rep_index,"ax",@progbits
	.p2align 4,,15
	.globl	compare_rep_index
	.type	compare_rep_index, @function
compare_rep_index:
.LFB260:
	.cfi_startproc
	movl	(%rsi), %eax
	cmpl	%eax, (%rdi)
	jl	.L7
	setg	%al
	movzbl	%al, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L7:
	movl	$-1, %eax
	ret
	.cfi_endproc
.LFE260:
	.size	compare_rep_index, .-compare_rep_index
	.section	.text.compare_strings_by_len,"ax",@progbits
	.p2align 4,,15
	.globl	compare_strings_by_len
	.type	compare_strings_by_len, @function
compare_strings_by_len:
.LFB312:
	.cfi_startproc
	movl	8(%rsi), %eax
	cmpl	%eax, 8(%rdi)
	jl	.L10
	setg	%al
	movzbl	%al, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L10:
	movl	$-1, %eax
	ret
	.cfi_endproc
.LFE312:
	.size	compare_strings_by_len, .-compare_strings_by_len
	.section	.text.wyhash,"ax",@progbits
	.p2align 4,,15
	.type	wyhash, @function
wyhash:
.LFB75:
	.cfi_startproc
	cmpq	$16, %rsi
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	ja	.L12
	movq	%rdx, %rcx
	movq	%rsi, %r8
.L18:
	movabsq	$-1800455987208640293, %rax
	xorq	%rcx, %rax
	movabsq	$-6884282663029611473, %rcx
	xorq	%rcx, %rdx
	cmpq	$8, %r8
	movq	%rdx, %r9
	ja	.L13
	cmpq	$3, %r8
	jbe	.L14
	movl	-4(%rdi,%r8), %ecx
	movl	(%rdi), %edi
	xorq	%rax, %rcx
	movq	%rdi, %rax
	xorq	%r9, %rax
	mulq	%rcx
	movq	%rax, %rcx
.L15:
	movq	%rsi, %rax
	movabsq	$-6884282663029611473, %rsi
	xorq	%rcx, %rax
	xorq	%rdx, %rsi
	mulq	%rsi
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	xorq	%rdx, %rax
	ret
	.p2align 4,,10
	.p2align 3
.L12:
	.cfi_restore_state
	leaq	-17(%rsi), %r8
	movq	%rdx, %rcx
	movabsq	$-6884282663029611473, %rbp
	movabsq	$-1800455987208640293, %rbx
	shrq	$4, %r8
	leaq	1(%r8), %r11
	salq	$4, %r11
	addq	%rdi, %r11
.L17:
	movq	(%rdi), %r9
	movq	8(%rdi), %rax
	addq	$16, %rdi
	xorq	%rbp, %r9
	xorq	%rbx, %rax
	xorq	%rdx, %r9
	xorq	%rax, %rcx
	movq	%r9, %rax
	mulq	%rcx
	cmpq	%r11, %rdi
	movq	%rdx, %r10
	movq	%rax, %rdx
	movq	%r10, %rcx
	jne	.L17
	negq	%r8
	salq	$4, %r8
	leaq	-16(%rsi,%r8), %r8
	jmp	.L18
	.p2align 4,,10
	.p2align 3
.L13:
	xorq	-8(%rdi,%r8), %rax
	movq	%rax, %r8
	movq	(%rdi), %rax
	xorq	%rdx, %rax
	mulq	%r8
	movq	%rax, %rcx
	jmp	.L15
	.p2align 4,,10
	.p2align 3
.L14:
	testq	%r8, %r8
	je	.L16
	leal	-1(%r8), %edx
	shrl	%r8d
	movzbl	(%rdi,%rdx), %ecx
	movzbl	(%rdi), %edx
	salq	$16, %rdx
	orq	%rdx, %rcx
	movzbl	(%rdi,%r8), %edx
	salq	$8, %rdx
	orq	%rdx, %rcx
	xorq	%r9, %rcx
	mulq	%rcx
	movq	%rax, %rcx
	jmp	.L15
.L16:
	mulq	%rdx
	movq	%rax, %rcx
	jmp	.L15
	.cfi_endproc
.LFE75:
	.size	wyhash, .-wyhash
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC1:
	.string	"hhmm12"
.LC2:
	.string	"hhmm24"
.LC3:
	.string	"hhmmss12"
.LC4:
	.string	"hhmmss24"
.LC5:
	.string	"no_time"
.LC6:
	.string	"unknown enum value"
	.section	.text.time__FormatTime_str,"ax",@progbits
	.p2align 4,,15
	.globl	time__FormatTime_str
	.type	time__FormatTime_str, @function
time__FormatTime_str:
.LFB80:
	.cfi_startproc
	cmpl	$4, %edi
	ja	.L23
	leaq	.L25(%rip), %rdx
	movl	%edi, %edi
	movslq	(%rdx,%rdi,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L25:
	.long	.L24-.L25
	.long	.L26-.L25
	.long	.L27-.L25
	.long	.L28-.L25
	.long	.L29-.L25
	.section	.text.time__FormatTime_str
	.p2align 4,,10
	.p2align 3
.L28:
	leaq	.LC4(%rip), %rax
	movl	$8, %edx
	ret
	.p2align 4,,10
	.p2align 3
.L29:
	leaq	.LC5(%rip), %rax
	movl	$7, %edx
	ret
	.p2align 4,,10
	.p2align 3
.L24:
	leaq	.LC1(%rip), %rax
	movl	$6, %edx
	ret
	.p2align 4,,10
	.p2align 3
.L26:
	leaq	.LC2(%rip), %rax
	movl	$6, %edx
	ret
	.p2align 4,,10
	.p2align 3
.L27:
	leaq	.LC3(%rip), %rax
	movl	$8, %edx
	ret
	.p2align 4,,10
	.p2align 3
.L23:
	leaq	.LC6(%rip), %rax
	movl	$18, %edx
	ret
	.cfi_endproc
.LFE80:
	.size	time__FormatTime_str, .-time__FormatTime_str
	.section	.rodata.str1.1
.LC7:
	.string	"ddmmyy"
.LC8:
	.string	"ddmmyyyy"
.LC9:
	.string	"mmddyy"
.LC10:
	.string	"mmddyyyy"
.LC11:
	.string	"mmmd"
.LC12:
	.string	"mmmdd"
.LC13:
	.string	"mmmddyyyy"
.LC14:
	.string	"no_date"
.LC15:
	.string	"yyyymmdd"
	.section	.text.time__FormatDate_str,"ax",@progbits
	.p2align 4,,15
	.globl	time__FormatDate_str
	.type	time__FormatDate_str, @function
time__FormatDate_str:
.LFB81:
	.cfi_startproc
	cmpl	$8, %edi
	ja	.L32
	leaq	.L34(%rip), %rdx
	movl	%edi, %edi
	movslq	(%rdx,%rdi,4), %rax
	addq	%rdx, %rax
	jmp	*%rax
	.section	.rodata
	.align 4
	.align 4
.L34:
	.long	.L33-.L34
	.long	.L35-.L34
	.long	.L36-.L34
	.long	.L37-.L34
	.long	.L38-.L34
	.long	.L39-.L34
	.long	.L40-.L34
	.long	.L41-.L34
	.long	.L42-.L34
	.section	.text.time__FormatDate_str
	.p2align 4,,10
	.p2align 3
.L41:
	leaq	.LC14(%rip), %rax
	movl	$7, %edx
	ret
	.p2align 4,,10
	.p2align 3
.L42:
	leaq	.LC15(%rip), %rax
	movl	$8, %edx
	ret
	.p2align 4,,10
	.p2align 3
.L33:
	leaq	.LC7(%rip), %rax
	movl	$6, %edx
	ret
	.p2align 4,,10
	.p2align 3
.L35:
	leaq	.LC8(%rip), %rax
	movl	$8, %edx
	ret
	.p2align 4,,10
	.p2align 3
.L36:
	leaq	.LC9(%rip), %rax
	movl	$6, %edx
	ret
	.p2align 4,,10
	.p2align 3
.L37:
	leaq	.LC10(%rip), %rax
	movl	$8, %edx
	ret
	.p2align 4,,10
	.p2align 3
.L38:
	leaq	.LC11(%rip), %rax
	movl	$4, %edx
	ret
	.p2align 4,,10
	.p2align 3
.L39:
	leaq	.LC12(%rip), %rax
	movl	$5, %edx
	ret
	.p2align 4,,10
	.p2align 3
.L40:
	leaq	.LC13(%rip), %rax
	movl	$9, %edx
	ret
	.p2align 4,,10
	.p2align 3
.L32:
	leaq	.LC6(%rip), %rax
	movl	$18, %edx
	ret
	.cfi_endproc
.LFE81:
	.size	time__FormatDate_str, .-time__FormatDate_str
	.section	.rodata.str1.1
.LC16:
	.string	"dot"
.LC17:
	.string	"hyphen"
.LC18:
	.string	"slash"
.LC19:
	.string	"space"
	.section	.text.time__FormatDelimiter_str,"ax",@progbits
	.p2align 4,,15
	.globl	time__FormatDelimiter_str
	.type	time__FormatDelimiter_str, @function
time__FormatDelimiter_str:
.LFB82:
	.cfi_startproc
	cmpl	$1, %edi
	je	.L46
	jb	.L47
	cmpl	$2, %edi
	je	.L48
	leaq	.LC6(%rip), %rdx
	leaq	.LC19(%rip), %rax
	cmpl	$3, %edi
	movl	$18, %ecx
	cmovne	%rdx, %rax
	movl	$5, %edx
	cmovne	%rcx, %rdx
	ret
	.p2align 4,,10
	.p2align 3
.L48:
	leaq	.LC18(%rip), %rax
	movl	$5, %edx
	ret
	.p2align 4,,10
	.p2align 3
.L47:
	leaq	.LC16(%rip), %rax
	movl	$3, %edx
	ret
	.p2align 4,,10
	.p2align 3
.L46:
	leaq	.LC17(%rip), %rax
	movl	$6, %edx
	ret
	.cfi_endproc
.LFE82:
	.size	time__FormatDelimiter_str, .-time__FormatDelimiter_str
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC20:
	.string	"00102030405060708090011121314151617181910212223242526272829203132333435363738393041424344454647484940515253545556575859506162636465666768696071727374757677787970818283848586878889809192939495969798999"
	.section	.rodata.str1.1
.LC21:
	.string	"MonTueWedThuFriSatSun"
	.section	.rodata.str1.8
	.align 8
.LC22:
	.string	"JanFebMarAprMayJunJulAugSepOctNovDec"
	.section	.rodata.str1.1
.LC23:
	.string	"Overflow Error"
.LC24:
	.string	"Divide Error"
	.section	.text.vinit_string_literals,"ax",@progbits
	.p2align 4,,15
	.globl	vinit_string_literals
	.type	vinit_string_literals, @function
vinit_string_literals:
.LFB83:
	.cfi_startproc
	leaq	.LC20(%rip), %rax
	movl	$200, 8+_const_digit_pairs(%rip)
	movl	$21, 8+_const_time__days_string(%rip)
	movl	$36, 8+_const_time__months_string(%rip)
	movl	$14, 8+_const_math__bits__overflow_error(%rip)
	movq	%rax, _const_digit_pairs(%rip)
	leaq	.LC21(%rip), %rax
	movl	$12, 8+_const_math__bits__divide_error(%rip)
	movq	%rax, _const_time__days_string(%rip)
	leaq	.LC22(%rip), %rax
	movq	%rax, _const_time__months_string(%rip)
	leaq	.LC23(%rip), %rax
	movq	%rax, _const_math__bits__overflow_error(%rip)
	leaq	.LC24(%rip), %rax
	movq	%rax, _const_math__bits__divide_error(%rip)
	ret
	.cfi_endproc
.LFE83:
	.size	vinit_string_literals, .-vinit_string_literals
	.section	.text._STR_TMP,"ax",@progbits
	.p2align 4,,15
	.globl	_STR_TMP
	.type	_STR_TMP, @function
_STR_TMP:
.LFB85:
	.cfi_startproc
	subq	$216, %rsp
	.cfi_def_cfa_offset 224
	testb	%al, %al
	movq	%rsi, 40(%rsp)
	movq	%rdx, 48(%rsp)
	movq	%rcx, 56(%rsp)
	movq	%r8, 64(%rsp)
	movq	%r9, 72(%rsp)
	je	.L53
	movaps	%xmm0, 80(%rsp)
	movaps	%xmm1, 96(%rsp)
	movaps	%xmm2, 112(%rsp)
	movaps	%xmm3, 128(%rsp)
	movaps	%xmm4, 144(%rsp)
	movaps	%xmm5, 160(%rsp)
	movaps	%xmm6, 176(%rsp)
	movaps	%xmm7, 192(%rsp)
.L53:
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	leaq	224(%rsp), %rax
	movq	%rdi, %rcx
	leaq	g_str_buf(%rip), %rdi
	movl	$1024, %edx
	movl	$1, %esi
	movq	%rsp, %r8
	movq	%rax, 8(%rsp)
	leaq	32(%rsp), %rax
	movl	$8, (%rsp)
	movl	$48, 4(%rsp)
	movq	%rax, 16(%rsp)
	call	__vsprintf_chk@PLT
	leaq	g_str_buf(%rip), %rsi
	movq	%rsi, %rdx
.L54:
	movl	(%rdx), %ecx
	addq	$4, %rdx
	leal	-16843009(%rcx), %eax
	notl	%ecx
	andl	%ecx, %eax
	andl	$-2139062144, %eax
	je	.L54
	movl	%eax, %ecx
	shrl	$16, %ecx
	testl	$32896, %eax
	cmove	%ecx, %eax
	leaq	2(%rdx), %rcx
	movl	%eax, %edi
	cmove	%rcx, %rdx
	addb	%al, %dil
	leaq	g_str_buf(%rip), %rax
	sbbq	$3, %rdx
	subl	%esi, %edx
	movq	24(%rsp), %rsi
	xorq	%fs:40, %rsi
	jne	.L60
	addq	$216, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L60:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE85:
	.size	_STR_TMP, .-_STR_TMP
	.section	.text.new_array_from_c_array_no_alloc,"ax",@progbits
	.p2align 4,,15
	.globl	new_array_from_c_array_no_alloc
	.type	new_array_from_c_array_no_alloc, @function
new_array_from_c_array_no_alloc:
.LFB89:
	.cfi_startproc
	movq	%rdi, %rax
	movq	%r8, (%rdi)
	movl	%esi, 8(%rdi)
	movl	%edx, 12(%rdi)
	movl	%ecx, 16(%rdi)
	ret
	.cfi_endproc
.LFE89:
	.size	new_array_from_c_array_no_alloc, .-new_array_from_c_array_no_alloc
	.section	.text.array_sort_with_compare,"ax",@progbits
	.p2align 4,,15
	.globl	array_sort_with_compare
	.type	array_sort_with_compare, @function
array_sort_with_compare:
.LFB92:
	.cfi_startproc
	movq	%rsi, %rcx
	movslq	16(%rdi), %rdx
	movslq	8(%rdi), %rsi
	movq	(%rdi), %rdi
	jmp	qsort@PLT
	.cfi_endproc
.LFE92:
	.size	array_sort_with_compare, .-array_sort_with_compare
	.section	.text.array_clear,"ax",@progbits
	.p2align 4,,15
	.globl	array_clear
	.type	array_clear, @function
array_clear:
.LFB96:
	.cfi_startproc
	movl	$0, 8(%rdi)
	ret
	.cfi_endproc
.LFE96:
	.size	array_clear, .-array_clear
	.section	.text.array_trim,"ax",@progbits
	.p2align 4,,15
	.globl	array_trim
	.type	array_trim, @function
array_trim:
.LFB97:
	.cfi_startproc
	cmpl	%esi, 8(%rdi)
	jle	.L64
	movl	%esi, 8(%rdi)
.L64:
	rep ret
	.cfi_endproc
.LFE97:
	.size	array_trim, .-array_trim
	.section	.text.array_free,"ax",@progbits
	.p2align 4,,15
	.globl	array_free
	.type	array_free, @function
array_free:
.LFB109:
	.cfi_startproc
	movq	8(%rsp), %rdi
	jmp	free@PLT
	.cfi_endproc
.LFE109:
	.size	array_free, .-array_free
	.section	.text.array_int_sort,"ax",@progbits
	.p2align 4,,15
	.globl	array_int_sort
	.type	array_int_sort, @function
array_int_sort:
.LFB116:
	.cfi_startproc
	movslq	16(%rdi), %rdx
	movslq	8(%rdi), %rsi
	leaq	compare_ints(%rip), %rcx
	movq	(%rdi), %rdi
	jmp	qsort@PLT
	.cfi_endproc
.LFE116:
	.size	array_int_sort, .-array_int_sort
	.section	.text.array_int_reduce,"ax",@progbits
	.p2align 4,,15
	.globl	array_int_reduce
	.type	array_int_reduce, @function
array_int_reduce:
.LFB121:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movl	%esi, %eax
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movl	40(%rsp), %ecx
	testl	%ecx, %ecx
	jle	.L68
	movq	32(%rsp), %rdx
	subl	$1, %ecx
	movq	%rdi, %rbp
	leaq	4(%rdx), %rbx
	leaq	(%rbx,%rcx,4), %r12
	jmp	.L70
	.p2align 4,,10
	.p2align 3
.L74:
	addq	$4, %rbx
.L70:
	movl	(%rdx), %esi
	movl	%eax, %edi
	call	*%rbp
	cmpq	%r12, %rbx
	movq	%rbx, %rdx
	jne	.L74
.L68:
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE121:
	.size	array_int_reduce, .-array_int_reduce
	.section	.text.compare_i64,"ax",@progbits
	.p2align 4,,15
	.globl	compare_i64
	.type	compare_i64, @function
compare_i64:
.LFB123:
	.cfi_startproc
	movq	(%rsi), %rax
	cmpq	%rax, (%rdi)
	jl	.L77
	setg	%al
	movzbl	%al, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L77:
	movl	$-1, %eax
	ret
	.cfi_endproc
.LFE123:
	.size	compare_i64, .-compare_i64
	.section	.text.compare_f64,"ax",@progbits
	.p2align 4,,15
	.globl	compare_f64
	.type	compare_f64, @function
compare_f64:
.LFB124:
	.cfi_startproc
	movsd	(%rdi), %xmm1
	movsd	(%rsi), %xmm0
	ucomisd	%xmm1, %xmm0
	ja	.L80
	xorl	%eax, %eax
	ucomisd	%xmm0, %xmm1
	seta	%al
	ret
	.p2align 4,,10
	.p2align 3
.L80:
	movl	$-1, %eax
	ret
	.cfi_endproc
.LFE124:
	.size	compare_f64, .-compare_f64
	.section	.text.compare_f32,"ax",@progbits
	.p2align 4,,15
	.globl	compare_f32
	.type	compare_f32, @function
compare_f32:
.LFB125:
	.cfi_startproc
	movss	(%rdi), %xmm1
	movss	(%rsi), %xmm0
	ucomiss	%xmm1, %xmm0
	ja	.L83
	xorl	%eax, %eax
	ucomiss	%xmm0, %xmm1
	seta	%al
	ret
	.p2align 4,,10
	.p2align 3
.L83:
	movl	$-1, %eax
	ret
	.cfi_endproc
.LFE125:
	.size	compare_f32, .-compare_f32
	.section	.text.v_exit,"ax",@progbits
	.p2align 4,,15
	.globl	v_exit
	.type	v_exit, @function
v_exit:
.LFB127:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	call	exit@PLT
	.cfi_endproc
.LFE127:
	.size	v_exit, .-v_exit
	.section	.text.isnil,"ax",@progbits
	.p2align 4,,15
	.globl	isnil
	.type	isnil, @function
isnil:
.LFB128:
	.cfi_startproc
	xorl	%eax, %eax
	testq	%rdi, %rdi
	sete	%al
	ret
	.cfi_endproc
.LFE128:
	.size	isnil, .-isnil
	.section	.rodata.str1.1
.LC25:
	.string	"%.*s"
	.section	.text.print,"ax",@progbits
	.p2align 4,,15
	.globl	print
	.type	print, @function
print:
.LFB135:
	.cfi_startproc
	movl	%esi, %edx
	leaq	.LC25(%rip), %rsi
	movq	%rdi, %rcx
	xorl	%eax, %eax
	movl	$1, %edi
	jmp	__printf_chk@PLT
	.cfi_endproc
.LFE135:
	.size	print, .-print
	.section	.text.looo,"ax",@progbits
	.p2align 4,,15
	.globl	looo
	.type	looo, @function
looo:
.LFB136:
	.cfi_startproc
	rep ret
	.cfi_endproc
.LFE136:
	.size	looo, .-looo
	.section	.text.v_calloc,"ax",@progbits
	.p2align 4,,15
	.globl	v_calloc
	.type	v_calloc, @function
v_calloc:
.LFB138:
	.cfi_startproc
	movslq	%edi, %rdi
	movl	$1, %esi
	jmp	calloc@PLT
	.cfi_endproc
.LFE138:
	.size	v_calloc, .-v_calloc
	.section	.text.v_free,"ax",@progbits
	.p2align 4,,15
	.globl	v_free
	.type	v_free, @function
v_free:
.LFB140:
	.cfi_startproc
	jmp	free@PLT
	.cfi_endproc
.LFE140:
	.size	v_free, .-v_free
	.section	.text.v_ptr_free,"ax",@progbits
	.p2align 4,,15
	.globl	v_ptr_free
	.type	v_ptr_free, @function
v_ptr_free:
.LFB563:
	.cfi_startproc
	jmp	free@PLT
	.cfi_endproc
.LFE563:
	.size	v_ptr_free, .-v_ptr_free
	.section	.text.is_atty,"ax",@progbits
	.p2align 4,,15
	.globl	is_atty
	.type	is_atty, @function
is_atty:
.LFB143:
	.cfi_startproc
	jmp	isatty@PLT
	.cfi_endproc
.LFE143:
	.size	is_atty, .-is_atty
	.section	.text.builtin_init,"ax",@progbits
	.p2align 4,,15
	.globl	builtin_init
	.type	builtin_init, @function
builtin_init:
.LFB561:
	.cfi_startproc
	rep ret
	.cfi_endproc
.LFE561:
	.size	builtin_init, .-builtin_init
	.section	.rodata.str1.1
.LC26:
	.string	"%.*s\n"
	.section	.text.println,"ax",@progbits
	.p2align 4,,15
	.globl	println
	.type	println, @function
println:
.LFB145:
	.cfi_startproc
	movl	%esi, %edx
	leaq	.LC26(%rip), %rsi
	movq	%rdi, %rcx
	xorl	%eax, %eax
	movl	$1, %edi
	jmp	__printf_chk@PLT
	.cfi_endproc
.LFE145:
	.size	println, .-println
	.section	.rodata.str1.8
	.align 8
.LC27:
	.string	"not implemented, see builtin_windows.v"
	.section	.text.print_backtrace_skipping_top_frames_msvc,"ax",@progbits
	.p2align 4,,15
	.globl	print_backtrace_skipping_top_frames_msvc
	.type	print_backtrace_skipping_top_frames_msvc, @function
print_backtrace_skipping_top_frames_msvc:
.LFB146:
	.cfi_startproc
	leaq	.LC27(%rip), %rcx
	leaq	.LC26(%rip), %rsi
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$38, %edx
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	xorl	%eax, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE146:
	.size	print_backtrace_skipping_top_frames_msvc, .-print_backtrace_skipping_top_frames_msvc
	.section	.text.print_backtrace_skipping_top_frames_mingw,"ax",@progbits
	.p2align 4,,15
	.globl	print_backtrace_skipping_top_frames_mingw
	.type	print_backtrace_skipping_top_frames_mingw, @function
print_backtrace_skipping_top_frames_mingw:
.LFB565:
	.cfi_startproc
	leaq	.LC27(%rip), %rcx
	leaq	.LC26(%rip), %rsi
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$38, %edx
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	xorl	%eax, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE565:
	.size	print_backtrace_skipping_top_frames_mingw, .-print_backtrace_skipping_top_frames_mingw
	.section	.text.print_backtrace_skipping_top_frames_mac,"ax",@progbits
	.p2align 4,,15
	.globl	print_backtrace_skipping_top_frames_mac
	.type	print_backtrace_skipping_top_frames_mac, @function
print_backtrace_skipping_top_frames_mac:
.LFB149:
	.cfi_startproc
	movl	$1, %eax
	ret
	.cfi_endproc
.LFE149:
	.size	print_backtrace_skipping_top_frames_mac, .-print_backtrace_skipping_top_frames_mac
	.section	.text.print_backtrace_skipping_top_frames_freebsd,"ax",@progbits
	.p2align 4,,15
	.globl	print_backtrace_skipping_top_frames_freebsd
	.type	print_backtrace_skipping_top_frames_freebsd, @function
print_backtrace_skipping_top_frames_freebsd:
.LFB567:
	.cfi_startproc
	movl	$1, %eax
	ret
	.cfi_endproc
.LFE567:
	.size	print_backtrace_skipping_top_frames_freebsd, .-print_backtrace_skipping_top_frames_freebsd
	.section	.text.f32_abs,"ax",@progbits
	.p2align 4,,15
	.globl	f32_abs
	.type	f32_abs, @function
f32_abs:
.LFB158:
	.cfi_startproc
	pxor	%xmm1, %xmm1
	ucomiss	%xmm0, %xmm1
	ja	.L105
	rep ret
	.p2align 4,,10
	.p2align 3
.L105:
	xorps	.LC29(%rip), %xmm0
	ret
	.cfi_endproc
.LFE158:
	.size	f32_abs, .-f32_abs
	.section	.text.f64_abs,"ax",@progbits
	.p2align 4,,15
	.globl	f64_abs
	.type	f64_abs, @function
f64_abs:
.LFB159:
	.cfi_startproc
	pxor	%xmm1, %xmm1
	ucomisd	%xmm0, %xmm1
	ja	.L110
	rep ret
	.p2align 4,,10
	.p2align 3
.L110:
	xorpd	.LC31(%rip), %xmm0
	ret
	.cfi_endproc
.LFE159:
	.size	f64_abs, .-f64_abs
	.section	.text.f64_eq,"ax",@progbits
	.p2align 4,,15
	.globl	f64_eq
	.type	f64_eq, @function
f64_eq:
.LFB160:
	.cfi_startproc
	subsd	%xmm1, %xmm0
	pxor	%xmm1, %xmm1
	ucomisd	%xmm0, %xmm1
	jbe	.L112
	xorpd	.LC31(%rip), %xmm0
.L112:
	xorl	%eax, %eax
	movsd	.LC32(%rip), %xmm1
	ucomisd	%xmm0, %xmm1
	setnb	%al
	ret
	.cfi_endproc
.LFE160:
	.size	f64_eq, .-f64_eq
	.section	.text.f32_eq,"ax",@progbits
	.p2align 4,,15
	.globl	f32_eq
	.type	f32_eq, @function
f32_eq:
.LFB161:
	.cfi_startproc
	subss	%xmm1, %xmm0
	pxor	%xmm1, %xmm1
	ucomiss	%xmm0, %xmm1
	jbe	.L116
	xorps	.LC29(%rip), %xmm0
.L116:
	movss	.LC33(%rip), %xmm1
	xorl	%eax, %eax
	ucomiss	%xmm0, %xmm1
	setnb	%al
	ret
	.cfi_endproc
.LFE161:
	.size	f32_eq, .-f32_eq
	.section	.text.f64_eqbit,"ax",@progbits
	.p2align 4,,15
	.globl	f64_eqbit
	.type	f64_eqbit, @function
f64_eqbit:
.LFB162:
	.cfi_startproc
	xorl	%eax, %eax
	movl	$0, %edx
	ucomisd	%xmm1, %xmm0
	setnp	%al
	cmovne	%edx, %eax
	ret
	.cfi_endproc
.LFE162:
	.size	f64_eqbit, .-f64_eqbit
	.section	.text.f32_eqbit,"ax",@progbits
	.p2align 4,,15
	.globl	f32_eqbit
	.type	f32_eqbit, @function
f32_eqbit:
.LFB163:
	.cfi_startproc
	xorl	%eax, %eax
	movl	$0, %edx
	ucomiss	%xmm1, %xmm0
	setnp	%al
	cmovne	%edx, %eax
	ret
	.cfi_endproc
.LFE163:
	.size	f32_eqbit, .-f32_eqbit
	.section	.text.f64_ne,"ax",@progbits
	.p2align 4,,15
	.globl	f64_ne
	.type	f64_ne, @function
f64_ne:
.LFB164:
	.cfi_startproc
	subsd	%xmm1, %xmm0
	pxor	%xmm1, %xmm1
	ucomisd	%xmm0, %xmm1
	jbe	.L122
	xorpd	.LC31(%rip), %xmm0
.L122:
	xorl	%eax, %eax
	movsd	.LC32(%rip), %xmm1
	ucomisd	%xmm0, %xmm1
	setb	%al
	ret
	.cfi_endproc
.LFE164:
	.size	f64_ne, .-f64_ne
	.section	.text.f32_ne,"ax",@progbits
	.p2align 4,,15
	.globl	f32_ne
	.type	f32_ne, @function
f32_ne:
.LFB165:
	.cfi_startproc
	subss	%xmm1, %xmm0
	pxor	%xmm1, %xmm1
	ucomiss	%xmm0, %xmm1
	jbe	.L126
	xorps	.LC29(%rip), %xmm0
.L126:
	movss	.LC33(%rip), %xmm1
	xorl	%eax, %eax
	ucomiss	%xmm0, %xmm1
	setb	%al
	ret
	.cfi_endproc
.LFE165:
	.size	f32_ne, .-f32_ne
	.section	.text.f64_nebit,"ax",@progbits
	.p2align 4,,15
	.globl	f64_nebit
	.type	f64_nebit, @function
f64_nebit:
.LFB166:
	.cfi_startproc
	xorl	%eax, %eax
	movl	$1, %edx
	ucomisd	%xmm1, %xmm0
	setp	%al
	cmovne	%edx, %eax
	ret
	.cfi_endproc
.LFE166:
	.size	f64_nebit, .-f64_nebit
	.section	.text.f32_nebit,"ax",@progbits
	.p2align 4,,15
	.globl	f32_nebit
	.type	f32_nebit, @function
f32_nebit:
.LFB167:
	.cfi_startproc
	xorl	%eax, %eax
	movl	$1, %edx
	ucomiss	%xmm1, %xmm0
	setp	%al
	cmovne	%edx, %eax
	ret
	.cfi_endproc
.LFE167:
	.size	f32_nebit, .-f32_nebit
	.section	.text.f64_lt,"ax",@progbits
	.p2align 4,,15
	.globl	f64_lt
	.type	f64_lt, @function
f64_lt:
.LFB168:
	.cfi_startproc
	movapd	%xmm0, %xmm2
	pxor	%xmm3, %xmm3
	subsd	%xmm1, %xmm2
	ucomisd	%xmm2, %xmm3
	jbe	.L132
	xorpd	.LC31(%rip), %xmm2
.L132:
	xorl	%eax, %eax
	movsd	.LC32(%rip), %xmm3
	ucomisd	%xmm2, %xmm3
	jnb	.L131
	xorl	%eax, %eax
	ucomisd	%xmm0, %xmm1
	seta	%al
.L131:
	rep ret
	.cfi_endproc
.LFE168:
	.size	f64_lt, .-f64_lt
	.section	.text.f32_lt,"ax",@progbits
	.p2align 4,,15
	.globl	f32_lt
	.type	f32_lt, @function
f32_lt:
.LFB169:
	.cfi_startproc
	movaps	%xmm0, %xmm2
	pxor	%xmm3, %xmm3
	subss	%xmm1, %xmm2
	ucomiss	%xmm2, %xmm3
	jbe	.L138
	xorps	.LC29(%rip), %xmm2
.L138:
	movss	.LC33(%rip), %xmm3
	xorl	%eax, %eax
	ucomiss	%xmm2, %xmm3
	jnb	.L137
	xorl	%eax, %eax
	ucomiss	%xmm0, %xmm1
	seta	%al
.L137:
	rep ret
	.cfi_endproc
.LFE169:
	.size	f32_lt, .-f32_lt
	.section	.text.f64_ltbit,"ax",@progbits
	.p2align 4,,15
	.globl	f64_ltbit
	.type	f64_ltbit, @function
f64_ltbit:
.LFB170:
	.cfi_startproc
	xorl	%eax, %eax
	ucomisd	%xmm0, %xmm1
	seta	%al
	ret
	.cfi_endproc
.LFE170:
	.size	f64_ltbit, .-f64_ltbit
	.section	.text.f32_ltbit,"ax",@progbits
	.p2align 4,,15
	.globl	f32_ltbit
	.type	f32_ltbit, @function
f32_ltbit:
.LFB171:
	.cfi_startproc
	xorl	%eax, %eax
	ucomiss	%xmm0, %xmm1
	seta	%al
	ret
	.cfi_endproc
.LFE171:
	.size	f32_ltbit, .-f32_ltbit
	.section	.text.f64_le,"ax",@progbits
	.p2align 4,,15
	.globl	f64_le
	.type	f64_le, @function
f64_le:
.LFB172:
	.cfi_startproc
	movapd	%xmm0, %xmm2
	pxor	%xmm3, %xmm3
	subsd	%xmm1, %xmm2
	ucomisd	%xmm2, %xmm3
	jbe	.L146
	xorpd	.LC31(%rip), %xmm2
.L146:
	movl	$1, %eax
	movsd	.LC32(%rip), %xmm3
	ucomisd	%xmm2, %xmm3
	jnb	.L145
	xorl	%eax, %eax
	ucomisd	%xmm1, %xmm0
	setbe	%al
.L145:
	rep ret
	.cfi_endproc
.LFE172:
	.size	f64_le, .-f64_le
	.section	.text.f32_le,"ax",@progbits
	.p2align 4,,15
	.globl	f32_le
	.type	f32_le, @function
f32_le:
.LFB173:
	.cfi_startproc
	movaps	%xmm0, %xmm2
	pxor	%xmm3, %xmm3
	subss	%xmm1, %xmm2
	ucomiss	%xmm2, %xmm3
	jbe	.L152
	xorps	.LC29(%rip), %xmm2
.L152:
	movss	.LC33(%rip), %xmm3
	movl	$1, %eax
	ucomiss	%xmm2, %xmm3
	jnb	.L151
	xorl	%eax, %eax
	ucomiss	%xmm1, %xmm0
	setbe	%al
.L151:
	rep ret
	.cfi_endproc
.LFE173:
	.size	f32_le, .-f32_le
	.section	.text.f64_lebit,"ax",@progbits
	.p2align 4,,15
	.globl	f64_lebit
	.type	f64_lebit, @function
f64_lebit:
.LFB174:
	.cfi_startproc
	xorl	%eax, %eax
	ucomisd	%xmm0, %xmm1
	setnb	%al
	ret
	.cfi_endproc
.LFE174:
	.size	f64_lebit, .-f64_lebit
	.section	.text.f32_lebit,"ax",@progbits
	.p2align 4,,15
	.globl	f32_lebit
	.type	f32_lebit, @function
f32_lebit:
.LFB175:
	.cfi_startproc
	xorl	%eax, %eax
	ucomiss	%xmm0, %xmm1
	setnb	%al
	ret
	.cfi_endproc
.LFE175:
	.size	f32_lebit, .-f32_lebit
	.section	.text.f64_gt,"ax",@progbits
	.p2align 4,,15
	.globl	f64_gt
	.type	f64_gt, @function
f64_gt:
.LFB176:
	.cfi_startproc
	movapd	%xmm0, %xmm2
	pxor	%xmm3, %xmm3
	subsd	%xmm1, %xmm2
	ucomisd	%xmm2, %xmm3
	jbe	.L160
	xorpd	.LC31(%rip), %xmm2
.L160:
	xorl	%eax, %eax
	movsd	.LC32(%rip), %xmm3
	ucomisd	%xmm2, %xmm3
	jnb	.L159
	xorl	%eax, %eax
	ucomisd	%xmm1, %xmm0
	seta	%al
.L159:
	rep ret
	.cfi_endproc
.LFE176:
	.size	f64_gt, .-f64_gt
	.section	.text.f32_gt,"ax",@progbits
	.p2align 4,,15
	.globl	f32_gt
	.type	f32_gt, @function
f32_gt:
.LFB177:
	.cfi_startproc
	movaps	%xmm0, %xmm2
	pxor	%xmm3, %xmm3
	subss	%xmm1, %xmm2
	ucomiss	%xmm2, %xmm3
	jbe	.L166
	xorps	.LC29(%rip), %xmm2
.L166:
	movss	.LC33(%rip), %xmm3
	xorl	%eax, %eax
	ucomiss	%xmm2, %xmm3
	jnb	.L165
	xorl	%eax, %eax
	ucomiss	%xmm1, %xmm0
	seta	%al
.L165:
	rep ret
	.cfi_endproc
.LFE177:
	.size	f32_gt, .-f32_gt
	.section	.text.f64_gtbit,"ax",@progbits
	.p2align 4,,15
	.globl	f64_gtbit
	.type	f64_gtbit, @function
f64_gtbit:
.LFB178:
	.cfi_startproc
	xorl	%eax, %eax
	ucomisd	%xmm1, %xmm0
	seta	%al
	ret
	.cfi_endproc
.LFE178:
	.size	f64_gtbit, .-f64_gtbit
	.section	.text.f32_gtbit,"ax",@progbits
	.p2align 4,,15
	.globl	f32_gtbit
	.type	f32_gtbit, @function
f32_gtbit:
.LFB179:
	.cfi_startproc
	xorl	%eax, %eax
	ucomiss	%xmm1, %xmm0
	seta	%al
	ret
	.cfi_endproc
.LFE179:
	.size	f32_gtbit, .-f32_gtbit
	.section	.text.f64_ge,"ax",@progbits
	.p2align 4,,15
	.globl	f64_ge
	.type	f64_ge, @function
f64_ge:
.LFB180:
	.cfi_startproc
	movapd	%xmm0, %xmm2
	pxor	%xmm3, %xmm3
	subsd	%xmm1, %xmm2
	ucomisd	%xmm2, %xmm3
	jbe	.L174
	xorpd	.LC31(%rip), %xmm2
.L174:
	movl	$1, %eax
	movsd	.LC32(%rip), %xmm3
	ucomisd	%xmm2, %xmm3
	jnb	.L173
	xorl	%eax, %eax
	ucomisd	%xmm0, %xmm1
	setbe	%al
.L173:
	rep ret
	.cfi_endproc
.LFE180:
	.size	f64_ge, .-f64_ge
	.section	.text.f32_ge,"ax",@progbits
	.p2align 4,,15
	.globl	f32_ge
	.type	f32_ge, @function
f32_ge:
.LFB181:
	.cfi_startproc
	movaps	%xmm0, %xmm2
	pxor	%xmm3, %xmm3
	subss	%xmm1, %xmm2
	ucomiss	%xmm2, %xmm3
	jbe	.L180
	xorps	.LC29(%rip), %xmm2
.L180:
	movss	.LC33(%rip), %xmm3
	movl	$1, %eax
	ucomiss	%xmm2, %xmm3
	jnb	.L179
	xorl	%eax, %eax
	ucomiss	%xmm0, %xmm1
	setbe	%al
.L179:
	rep ret
	.cfi_endproc
.LFE181:
	.size	f32_ge, .-f32_ge
	.section	.text.f64_gebit,"ax",@progbits
	.p2align 4,,15
	.globl	f64_gebit
	.type	f64_gebit, @function
f64_gebit:
.LFB182:
	.cfi_startproc
	xorl	%eax, %eax
	ucomisd	%xmm1, %xmm0
	setnb	%al
	ret
	.cfi_endproc
.LFE182:
	.size	f64_gebit, .-f64_gebit
	.section	.text.f32_gebit,"ax",@progbits
	.p2align 4,,15
	.globl	f32_gebit
	.type	f32_gebit, @function
f32_gebit:
.LFB183:
	.cfi_startproc
	xorl	%eax, %eax
	ucomiss	%xmm1, %xmm0
	setnb	%al
	ret
	.cfi_endproc
.LFE183:
	.size	f32_gebit, .-f32_gebit
	.section	.rodata.str1.1
.LC34:
	.string	"true"
.LC35:
	.string	"false"
	.section	.text.bool_str,"ax",@progbits
	.p2align 4,,15
	.globl	bool_str
	.type	bool_str, @function
bool_str:
.LFB193:
	.cfi_startproc
	cmpl	$1, %edi
	leaq	.LC35(%rip), %rcx
	leaq	.LC34(%rip), %rax
	sbbl	%edx, %edx
	testl	%edi, %edi
	notl	%edx
	cmove	%rcx, %rax
	addl	$5, %edx
	ret
	.cfi_endproc
.LFE193:
	.size	bool_str, .-bool_str
	.section	.text.array_byte_contains,"ax",@progbits
	.p2align 4,,15
	.globl	array_byte_contains
	.type	array_byte_contains, @function
array_byte_contains:
.LFB202:
	.cfi_startproc
	movl	16(%rsp), %edx
	movl	%edi, %ecx
	movq	8(%rsp), %rax
	testl	%edx, %edx
	jle	.L194
	cmpb	(%rax), %dil
	je	.L196
	addq	$1, %rax
	subl	$1, %edx
	addq	%rax, %rdx
	jmp	.L192
	.p2align 4,,10
	.p2align 3
.L193:
	addq	$1, %rax
	cmpb	%cl, -1(%rax)
	je	.L196
.L192:
	cmpq	%rdx, %rax
	jne	.L193
.L194:
	xorl	%eax, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L196:
	movl	$1, %eax
	ret
	.cfi_endproc
.LFE202:
	.size	array_byte_contains, .-array_byte_contains
	.section	.text.byte_is_capital,"ax",@progbits
	.p2align 4,,15
	.globl	byte_is_capital
	.type	byte_is_capital, @function
byte_is_capital:
.LFB205:
	.cfi_startproc
	subl	$65, %edi
	xorl	%eax, %eax
	cmpb	$25, %dil
	setbe	%al
	ret
	.cfi_endproc
.LFE205:
	.size	byte_is_capital, .-byte_is_capital
	.section	.text.DenseArray_push,"ax",@progbits
	.p2align 4,,15
	.globl	DenseArray_push
	.type	DenseArray_push, @function
DenseArray_push:
.LFB208:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	movl	4(%rdi), %eax
	cmpl	%eax, (%rbx)
	movq	16(%rdi), %rdi
	je	.L201
.L199:
	movl	%eax, %edx
	movq	32(%rsp), %rcx
	leaq	(%rdx,%rdx,2), %rdx
	movdqu	16(%rsp), %xmm0
	leaq	(%rdi,%rdx,8), %rdx
	movups	%xmm0, (%rdx)
	movq	%rcx, 16(%rdx)
	leal	1(%rax), %edx
	movl	%edx, 4(%rbx)
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L201:
	.cfi_restore_state
	movl	%eax, %edx
	shrl	$3, %edx
	addl	%edx, %eax
	leaq	(%rax,%rax,2), %rsi
	movl	%eax, (%rbx)
	salq	$3, %rsi
	call	realloc@PLT
	movq	%rax, %rdi
	movq	%rax, 16(%rbx)
	movl	4(%rbx), %eax
	jmp	.L199
	.cfi_endproc
.LFE208:
	.size	DenseArray_push, .-DenseArray_push
	.section	.text.DenseArray_zeros_to_end,"ax",@progbits
	.p2align 4,,15
	.globl	DenseArray_zeros_to_end
	.type	DenseArray_zeros_to_end, @function
DenseArray_zeros_to_end:
.LFB209:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	4(%rdi), %ecx
	movq	%rdi, %rbx
	movq	16(%rdi), %rdi
	testl	%ecx, %ecx
	je	.L206
	leal	-1(%rcx), %edx
	movq	%rdi, %rax
	xorl	%ecx, %ecx
	leaq	(%rdx,%rdx,2), %rdx
	leaq	24(%rdi,%rdx,8), %r11
	.p2align 4,,10
	.p2align 3
.L205:
	cmpq	$0, (%rax)
	je	.L204
	movl	%ecx, %edx
	movdqu	(%rax), %xmm0
	leaq	(%rdx,%rdx,2), %rdx
	addl	$1, %ecx
	leaq	(%rdi,%rdx,8), %rdx
	movq	(%rdx), %r9
	movl	8(%rdx), %r8d
	movq	16(%rdx), %rsi
	movups	%xmm0, (%rdx)
	movq	16(%rax), %r10
	movq	%r10, 16(%rdx)
	movq	%r9, (%rax)
	movl	%r8d, 8(%rax)
	movq	%rsi, 16(%rax)
.L204:
	addq	$24, %rax
	cmpq	%rax, %r11
	jne	.L205
	cmpl	$8, %ecx
	movl	$8, %eax
	cmovnb	%ecx, %eax
	movl	%eax, %edx
	leaq	(%rdx,%rdx,2), %rsi
	salq	$3, %rsi
.L203:
	movl	$0, 8(%rbx)
	movl	%ecx, 4(%rbx)
	movl	%eax, (%rbx)
	call	realloc@PLT
	movq	%rax, 16(%rbx)
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L206:
	.cfi_restore_state
	movl	$192, %esi
	movl	$8, %eax
	jmp	.L203
	.cfi_endproc
.LFE209:
	.size	DenseArray_zeros_to_end, .-DenseArray_zeros_to_end
	.section	.text.map_key_to_index,"ax",@progbits
	.p2align 4,,15
	.globl	map_key_to_index
	.type	map_key_to_index, @function
map_key_to_index:
.LFB212:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	xorl	%edx, %edx
	movslq	%esi, %rsi
	call	wyhash
	movzbl	25(%rsp), %ecx
	movq	%rax, %rdx
	andl	20(%rsp), %eax
	shrq	%cl, %rdx
	andl	_const_hash_mask(%rip), %edx
	orl	_const_probe_inc(%rip), %edx
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	salq	$32, %rdx
	orq	%rdx, %rax
	ret
	.cfi_endproc
.LFE212:
	.size	map_key_to_index, .-map_key_to_index
	.section	.text.map_meta_less,"ax",@progbits
	.p2align 4,,15
	.globl	map_meta_less
	.type	map_meta_less, @function
map_meta_less:
.LFB213:
	.cfi_startproc
	movq	48(%rsp), %rdx
	movl	%edi, %eax
	cmpl	(%rdx,%rax,4), %esi
	jnb	.L212
	movl	_const_probe_inc(%rip), %ecx
	.p2align 4,,10
	.p2align 3
.L213:
	leal	2(%rdi), %eax
	addl	%ecx, %esi
	cmpl	%esi, (%rdx,%rax,4)
	movq	%rax, %rdi
	ja	.L213
.L212:
	salq	$32, %rsi
	orq	%rsi, %rax
	ret
	.cfi_endproc
.LFE213:
	.size	map_meta_less, .-map_meta_less
	.section	.text.map_exists,"ax",@progbits
	.p2align 4,,15
	.globl	map_exists
	.type	map_exists, @function
map_exists:
.LFB220:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	xorl	%eax, %eax
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	movl	64(%rsp), %edx
	testl	%edx, %edx
	jne	.L227
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L227:
	.cfi_restore_state
	xorl	%edx, %edx
	movslq	%esi, %rsi
	movq	%rdi, %r14
	call	wyhash
	movzbl	73(%rsp), %ecx
	movl	%eax, %edx
	andl	68(%rsp), %edx
	movq	104(%rsp), %r12
	movl	_const_probe_inc(%rip), %r13d
	shrq	%cl, %rax
	andl	_const_hash_mask(%rip), %eax
	movl	%edx, %ebx
	orl	%r13d, %eax
	cmpl	(%r12,%rdx,4), %eax
	movl	%eax, %ebp
	jnb	.L217
	.p2align 4,,10
	.p2align 3
.L218:
	leal	2(%rbx), %eax
	addl	%r13d, %ebp
	movq	%rax, %rbx
	movl	(%r12,%rax,4), %eax
	cmpl	%eax, %ebp
	jb	.L218
.L219:
	cmpl	%eax, %ebp
	jne	.L222
	movq	96(%rsp), %r15
	jmp	.L220
	.p2align 4,,10
	.p2align 3
.L228:
	leal	2(%rbx), %edx
	leal	0(%r13,%rbp), %eax
	movl	(%r12,%rdx,4), %ebp
	movq	%rdx, %rbx
	cmpl	%eax, %ebp
	jne	.L222
.L220:
	leal	1(%rbx), %eax
	movq	%r14, %rdi
	movl	(%r12,%rax,4), %eax
	leaq	(%rax,%rax,2), %rax
	movq	(%r15,%rax,8), %rsi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L228
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	$1, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L222:
	.cfi_restore_state
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L217:
	.cfi_restore_state
	movl	(%r12,%rdx,4), %eax
	jmp	.L219
	.cfi_endproc
.LFE220:
	.size	map_exists, .-map_exists
	.section	.text.map_free,"ax",@progbits
	.p2align 4,,15
	.globl	map_free
	.type	map_free, @function
map_free:
.LFB223:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movl	52(%rsp), %ebp
	movq	72(%rsp), %rdi
	movq	64(%rsp), %r12
	call	free@PLT
	testl	%ebp, %ebp
	je	.L230
	leal	-1(%rbp), %eax
	movq	%r12, %rbx
	leaq	(%rax,%rax,2), %rax
	leaq	24(%r12,%rax,8), %rbp
	.p2align 4,,10
	.p2align 3
.L232:
	movq	(%rbx), %rdi
	testq	%rdi, %rdi
	je	.L231
	call	free@PLT
.L231:
	addq	$24, %rbx
	cmpq	%rbp, %rbx
	jne	.L232
.L230:
	popq	%rbx
	.cfi_def_cfa_offset 24
	movq	%r12, %rdi
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	jmp	free@PLT
	.cfi_endproc
.LFE223:
	.size	map_free, .-map_free
	.section	.rodata.str1.1
.LC36:
	.string	"TODO"
	.section	.text.map_print,"ax",@progbits
	.p2align 4,,15
	.globl	map_print
	.type	map_print, @function
map_print:
.LFB224:
	.cfi_startproc
	leaq	.LC36(%rip), %rcx
	leaq	.LC26(%rip), %rsi
	movl	$4, %edx
	movl	$1, %edi
	xorl	%eax, %eax
	jmp	__printf_chk@PLT
	.cfi_endproc
.LFE224:
	.size	map_print, .-map_print
	.section	.rodata.str1.1
.LC37:
	.string	""
	.section	.text.opt_none,"ax",@progbits
	.p2align 4,,15
	.globl	opt_none
	.type	opt_none, @function
opt_none:
.LFB227:
	.cfi_startproc
	xorl	%eax, %eax
	movl	$54, %ecx
	movq	%rdi, %rdx
	rep stosq
	leaq	.LC37(%rip), %rax
	movl	$1, 424(%rdx)
	movq	%rax, 400(%rdx)
	movq	%rdx, %rax
	ret
	.cfi_endproc
.LFE227:
	.size	opt_none, .-opt_none
	.section	.text.v_error,"ax",@progbits
	.p2align 4,,15
	.globl	v_error
	.type	v_error, @function
v_error:
.LFB228:
	.cfi_startproc
	movq	%rdi, %r8
	xorl	%eax, %eax
	movl	$54, %ecx
	rep stosq
	movq	%rsi, 400(%r8)
	movq	%rdx, 408(%r8)
	movq	%r8, %rax
	ret
	.cfi_endproc
.LFE228:
	.size	v_error, .-v_error
	.section	.text.error_with_code,"ax",@progbits
	.p2align 4,,15
	.globl	error_with_code
	.type	error_with_code, @function
error_with_code:
.LFB229:
	.cfi_startproc
	movq	%rdi, %r8
	movl	%ecx, %r9d
	xorl	%eax, %eax
	movl	$54, %ecx
	rep stosq
	movq	%rsi, 400(%r8)
	movq	%rdx, 408(%r8)
	movq	%r8, %rax
	movl	%r9d, 416(%r8)
	ret
	.cfi_endproc
.LFE229:
	.size	error_with_code, .-error_with_code
	.section	.text.mapnode_remove_from_leaf,"ax",@progbits
	.p2align 4,,15
	.globl	mapnode_remove_from_leaf
	.type	mapnode_remove_from_leaf, @function
mapnode_remove_from_leaf:
.LFB239:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	leal	1(%rsi), %eax
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rdi, %rbp
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	movl	272(%rdi), %r13d
	cmpl	%r13d, %eax
	jge	.L246
	movl	%r13d, %eax
	movslq	%esi, %rbx
	subl	%esi, %eax
	movq	%rbx, %rdi
	salq	$3, %rbx
	leal	-2(%rax), %r12d
	salq	$4, %rdi
	leaq	16(%rbp,%rdi), %rsi
	addq	%rbp, %rdi
	addq	$1, %r12
	movq	%r12, %rdx
	salq	$4, %rdx
	call	memmove@PLT
	leaq	0(,%r12,8), %rdx
	leaq	184(%rbp,%rbx), %rsi
	leaq	176(%rbp,%rbx), %rdi
	call	memmove@PLT
.L246:
	subl	$1, %r13d
	movl	%r13d, 272(%rbp)
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE239:
	.size	mapnode_remove_from_leaf, .-mapnode_remove_from_leaf
	.section	.text.mapnode_borrow_from_prev,"ax",@progbits
	.p2align 4,,15
	.globl	mapnode_borrow_from_prev
	.type	mapnode_borrow_from_prev, @function
mapnode_borrow_from_prev:
.LFB242:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movslq	%esi, %rdx
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	leaq	0(,%rdx,8), %r15
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rcx
	movq	%rdx, %r12
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movq	264(%rdi), %rax
	movq	(%rax,%rdx,8), %rbx
	movq	-8(%rax,%r15), %r14
	movl	272(%rbx), %r13d
	testl	%r13d, %r13d
	jle	.L249
	movslq	%r13d, %rbp
	leal	-1(%r13), %r8d
	movq	%rdi, 8(%rsp)
	movq	%rbp, %rax
	salq	$3, %rbp
	salq	$4, %rax
	addq	$1, %r8
	leaq	16(%rax), %rdi
	movq	%r8, %rdx
	movq	%rax, %rsi
	salq	$4, %rdx
	movq	%r8, (%rsp)
	movq	%rdi, %rax
	subq	%rdx, %rsi
	subq	%rdx, %rax
	addq	%rbx, %rsi
	leaq	(%rbx,%rax), %rdi
	call	memmove@PLT
	movq	(%rsp), %r8
	leaq	176(%rbp), %rsi
	addq	$184, %rbp
	leaq	0(,%r8,8), %rdx
	subq	%rdx, %rbp
	subq	%rdx, %rsi
	leaq	(%rbx,%rbp), %rdi
	addq	%rbx, %rsi
	call	memmove@PLT
	movq	8(%rsp), %rcx
.L249:
	movq	264(%rbx), %rdx
	testq	%rdx, %rdx
	je	.L250
	testl	%r13d, %r13d
	js	.L251
	movslq	%r13d, %rax
	salq	$3, %rax
	jmp	.L255
	.p2align 4,,10
	.p2align 3
.L252:
	subq	$8, %rax
.L255:
	movq	(%rdx,%rax), %rsi
	testq	%rax, %rax
	movq	%rsi, 8(%rdx,%rax)
	movq	264(%rbx), %rdx
	jne	.L252
	subl	$1, %r12d
	addq	%rcx, %r15
	movslq	%r12d, %r12
	movq	%r12, %rax
	salq	$4, %rax
	testq	%rdx, %rdx
	movdqu	(%rcx,%rax), %xmm0
	movups	%xmm0, (%rbx)
	movq	168(%r15), %rax
	movq	%rax, 176(%rbx)
	movl	272(%r14), %eax
	je	.L254
.L253:
	movq	264(%r14), %rdi
	movslq	%eax, %rsi
	movq	(%rdi,%rsi,8), %rsi
	movq	%rsi, (%rdx)
.L254:
	subl	$1, %eax
	salq	$4, %r12
	addl	$1, %r13d
	cltq
	movq	%rax, %rdx
	movq	176(%r14,%rax,8), %rax
	salq	$4, %rdx
	movdqu	(%r14,%rdx), %xmm0
	movups	%xmm0, (%rcx,%r12)
	movq	%rax, 168(%r15)
	movl	%r13d, 272(%rbx)
	subl	$1, 272(%r14)
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L250:
	.cfi_restore_state
	subl	$1, %r12d
	addq	%rcx, %r15
	movslq	%r12d, %r12
	movq	%r12, %rax
	salq	$4, %rax
	movdqu	(%rcx,%rax), %xmm0
	movups	%xmm0, (%rbx)
	movq	168(%r15), %rax
	movq	%rax, 176(%rbx)
	movl	272(%r14), %eax
	jmp	.L254
	.p2align 4,,10
	.p2align 3
.L251:
	subl	$1, %r12d
	addq	%rcx, %r15
	movslq	%r12d, %r12
	movq	%r12, %rax
	salq	$4, %rax
	movdqu	(%rcx,%rax), %xmm0
	movups	%xmm0, (%rbx)
	movq	168(%r15), %rax
	movq	%rax, 176(%rbx)
	movl	272(%r14), %eax
	jmp	.L253
	.cfi_endproc
.LFE242:
	.size	mapnode_borrow_from_prev, .-mapnode_borrow_from_prev
	.section	.text.mapnode_borrow_from_next,"ax",@progbits
	.p2align 4,,15
	.globl	mapnode_borrow_from_next
	.type	mapnode_borrow_from_next, @function
mapnode_borrow_from_next:
.LFB243:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movslq	%esi, %rsi
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	leaq	0(,%rsi,8), %rax
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rsi, %r8
	salq	$4, %r8
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	movq	264(%rdi), %rdx
	movdqu	(%rdi,%r8), %xmm0
	movq	(%rdx,%rsi,8), %rbp
	movq	8(%rdx,%rax), %rbx
	addq	%rdi, %rax
	movslq	272(%rbp), %rdx
	movq	264(%rbx), %r15
	movq	%rdx, %rcx
	movq	%rdx, %r14
	salq	$4, %rcx
	movups	%xmm0, 0(%rbp,%rcx)
	movq	176(%rax), %rcx
	movq	%rcx, 176(%rbp,%rdx,8)
	movq	264(%rbp), %rcx
	testq	%rcx, %rcx
	je	.L259
	movq	(%r15), %r8
	movq	%r8, 8(%rcx,%rdx,8)
	movq	264(%rbx), %r15
.L259:
	movq	176(%rbx), %rdx
	salq	$4, %rsi
	movdqu	(%rbx), %xmm0
	movups	%xmm0, (%rdi,%rsi)
	movq	%rdx, 176(%rax)
	movl	272(%rbx), %r13d
	cmpl	$1, %r13d
	jle	.L260
	leal	-2(%r13), %r12d
	leaq	16(%rbx), %rsi
	movq	%rbx, %rdi
	addq	$1, %r12
	movq	%r12, %rdx
	salq	$4, %rdx
	call	memmove@PLT
	leaq	0(,%r12,8), %rdx
	leaq	184(%rbx), %rsi
	leaq	176(%rbx), %rdi
	call	memmove@PLT
	testq	%r15, %r15
	je	.L262
	movq	8(%r15), %rax
	cmpl	$2, %r13d
	movq	%rax, (%r15)
	movq	264(%rbx), %rax
	movq	16(%rax), %rdx
	movq	%rdx, 8(%rax)
	je	.L262
	movq	264(%rbx), %rax
	cmpl	$3, %r13d
	movq	24(%rax), %rdx
	movq	%rdx, 16(%rax)
	je	.L262
	movq	264(%rbx), %rax
	cmpl	$4, %r13d
	movq	32(%rax), %rdx
	movq	%rdx, 24(%rax)
	je	.L262
	movq	264(%rbx), %rax
	cmpl	$5, %r13d
	movq	40(%rax), %rdx
	movq	%rdx, 32(%rax)
	je	.L262
	movq	264(%rbx), %rax
	cmpl	$6, %r13d
	movq	48(%rax), %rdx
	movq	%rdx, 40(%rax)
	je	.L262
	movq	264(%rbx), %rax
	cmpl	$7, %r13d
	movq	56(%rax), %rdx
	movq	%rdx, 48(%rax)
	je	.L262
	movq	264(%rbx), %rax
	cmpl	$8, %r13d
	movq	64(%rax), %rdx
	movq	%rdx, 56(%rax)
	je	.L262
	movq	264(%rbx), %rax
	cmpl	$9, %r13d
	movq	72(%rax), %rdx
	movq	%rdx, 64(%rax)
	je	.L262
	movq	264(%rbx), %rax
	cmpl	$10, %r13d
	movq	80(%rax), %rdx
	movq	%rdx, 72(%rax)
	je	.L262
	movq	264(%rbx), %rax
	cmpl	$11, %r13d
	movq	88(%rax), %rdx
	movq	%rdx, 80(%rax)
	je	.L262
	movq	264(%rbx), %rax
	movq	96(%rax), %rdx
	movq	%rdx, 88(%rax)
.L262:
	addl	$1, %r14d
	movl	%r14d, 272(%rbp)
	subl	$1, 272(%rbx)
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L260:
	.cfi_restore_state
	testq	%r15, %r15
	je	.L262
	cmpl	$1, %r13d
	jne	.L262
	movq	8(%r15), %rax
	movq	%rax, (%r15)
	jmp	.L262
	.cfi_endproc
.LFE243:
	.size	mapnode_borrow_from_next, .-mapnode_borrow_from_next
	.section	.text.mapnode_merge,"ax",@progbits
	.p2align 4,,15
	.globl	mapnode_merge
	.type	mapnode_merge, @function
mapnode_merge:
.LFB244:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbp
	movslq	%esi, %rdi
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movq	264(%rbp), %rax
	movslq	_const_mid_index(%rip), %rdx
	leaq	0(,%rdi,8), %rbx
	movq	%rdi, %r8
	movq	%rdi, %rcx
	salq	$4, %r8
	movq	(%rax,%rdi,8), %r12
	movq	8(%rax,%rbx), %rax
	movq	%rdx, %rsi
	movdqu	0(%rbp,%r8), %xmm0
	salq	$4, %rsi
	movl	272(%rax), %r13d
	movups	%xmm0, (%r12,%rsi)
	movq	176(%rbp,%rdi,8), %rsi
	testl	%r13d, %r13d
	movq	%rsi, 176(%r12,%rdx,8)
	movq	264(%r12), %rdx
	jle	.L301
	movdqu	(%rax), %xmm0
	cmpl	$1, %r13d
	movups	%xmm0, 96(%r12)
	movq	176(%rax), %rsi
	movq	%rsi, 224(%r12)
	je	.L303
	movdqu	16(%rax), %xmm0
	cmpl	$2, %r13d
	movups	%xmm0, 112(%r12)
	movq	184(%rax), %rsi
	movq	%rsi, 232(%r12)
	je	.L303
	movdqu	32(%rax), %xmm0
	cmpl	$3, %r13d
	movups	%xmm0, 128(%r12)
	movq	192(%rax), %rsi
	movq	%rsi, 240(%r12)
	je	.L303
	movdqu	48(%rax), %xmm0
	cmpl	$4, %r13d
	movups	%xmm0, 144(%r12)
	movq	200(%rax), %rsi
	movq	%rsi, 248(%r12)
	je	.L303
	movdqu	64(%rax), %xmm0
	movups	%xmm0, 160(%r12)
	movq	208(%rax), %rsi
	movq	%rsi, 256(%r12)
.L303:
	testq	%rdx, %rdx
	je	.L304
	movq	264(%rax), %rsi
	cmpl	$1, %r13d
	movq	(%rsi), %rsi
	movq	%rsi, 48(%rdx)
	movq	264(%rax), %rsi
	movq	264(%r12), %rdx
	movq	8(%rsi), %rsi
	movq	%rsi, 56(%rdx)
	jle	.L304
	movq	264(%rax), %rsi
	movq	264(%r12), %rdx
	cmpl	$2, %r13d
	movq	16(%rsi), %rsi
	movq	%rsi, 64(%rdx)
	je	.L304
	movq	264(%rax), %rsi
	movq	264(%r12), %rdx
	cmpl	$3, %r13d
	movq	24(%rsi), %rsi
	movq	%rsi, 72(%rdx)
	je	.L304
	movq	264(%rax), %rsi
	movq	264(%r12), %rdx
	cmpl	$4, %r13d
	movq	32(%rsi), %rsi
	movq	%rsi, 80(%rdx)
	je	.L304
	movq	264(%rax), %rsi
	movq	264(%r12), %rdx
	cmpl	$5, %r13d
	movq	40(%rsi), %rsi
	movq	%rsi, 88(%rdx)
	je	.L304
	movq	264(%rax), %rax
	movq	264(%r12), %rdx
	movq	48(%rax), %rax
	movq	%rax, 96(%rdx)
.L304:
	movl	272(%rbp), %r14d
	leal	1(%rcx), %eax
	cmpl	%r14d, %eax
	jge	.L306
	movl	%r14d, %eax
	salq	$4, %rdi
	movl	%ecx, 12(%rsp)
	subl	%ecx, %eax
	leaq	16(%rbp,%rdi), %rsi
	addq	%rbp, %rdi
	leal	-2(%rax), %r15d
	addq	$1, %r15
	movq	%r15, %rdx
	salq	$4, %rdx
	call	memmove@PLT
	leaq	0(,%r15,8), %rdx
	leaq	184(%rbp,%rbx), %rsi
	leaq	176(%rbp,%rbx), %rdi
	call	memmove@PLT
	movl	12(%rsp), %ecx
.L306:
	leal	2(%rcx), %edx
	cmpl	%r14d, %edx
	jg	.L307
	subl	%ecx, %r14d
	movslq	%edx, %rdx
	leaq	16(%rbx), %rax
	leal	-2(%r14), %ecx
	leaq	1(%rcx,%rdx), %rsi
	salq	$3, %rsi
	.p2align 4,,10
	.p2align 3
.L308:
	movq	264(%rbp), %rdx
	movq	(%rdx,%rax), %rcx
	movq	%rcx, -8(%rdx,%rax)
	addq	$8, %rax
	cmpq	%rsi, %rax
	jne	.L308
.L307:
	addl	$1, %r13d
	addl	%r13d, 272(%r12)
	subl	$1, 272(%rbp)
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L301:
	.cfi_restore_state
	testq	%rdx, %rdx
	je	.L304
	testl	%r13d, %r13d
	jne	.L304
	movq	264(%rax), %rax
	movq	(%rax), %rax
	movq	%rax, 48(%rdx)
	jmp	.L304
	.cfi_endproc
.LFE244:
	.size	mapnode_merge, .-mapnode_merge
	.section	.text.mapnode_fill,"ax",@progbits
	.p2align 4,,15
	.globl	mapnode_fill
	.type	mapnode_fill, @function
mapnode_fill:
.LFB241:
	.cfi_startproc
	testl	%esi, %esi
	je	.L340
	movq	264(%rdi), %rdx
	movslq	%esi, %rax
	movq	-8(%rdx,%rax,8), %rax
	cmpl	$5, 272(%rax)
	jg	.L347
.L340:
	cmpl	%esi, 272(%rdi)
	je	.L341
	movq	264(%rdi), %rdx
	movslq	%esi, %rax
	movq	8(%rdx,%rax,8), %rax
	cmpl	$5, 272(%rax)
	jg	.L348
	jmp	mapnode_merge
	.p2align 4,,10
	.p2align 3
.L341:
	subl	$1, %esi
	jmp	mapnode_merge
	.p2align 4,,10
	.p2align 3
.L348:
	jmp	mapnode_borrow_from_next
	.p2align 4,,10
	.p2align 3
.L347:
	jmp	mapnode_borrow_from_prev
	.cfi_endproc
.LFE241:
	.size	mapnode_fill, .-mapnode_fill
	.section	.text.mapnode_free,"ax",@progbits
	.p2align 4,,15
	.globl	mapnode_free
	.type	mapnode_free, @function
mapnode_free:
.LFB248:
	.cfi_startproc
	leaq	.LC36(%rip), %rcx
	leaq	.LC26(%rip), %rsi
	movl	$4, %edx
	movl	$1, %edi
	xorl	%eax, %eax
	jmp	__printf_chk@PLT
	.cfi_endproc
.LFE248:
	.size	mapnode_free, .-mapnode_free
	.section	.text.SortedMap_free,"ax",@progbits
	.p2align 4,,15
	.globl	SortedMap_free
	.type	SortedMap_free, @function
SortedMap_free:
.LFB249:
	.cfi_startproc
	cmpq	$0, 8(%rdi)
	je	.L350
	leaq	.LC36(%rip), %rcx
	leaq	.LC26(%rip), %rsi
	movl	$4, %edx
	movl	$1, %edi
	xorl	%eax, %eax
	jmp	__printf_chk@PLT
	.p2align 4,,10
	.p2align 3
.L350:
	rep ret
	.cfi_endproc
.LFE249:
	.size	SortedMap_free, .-SortedMap_free
	.section	.text.SortedMap_print,"ax",@progbits
	.p2align 4,,15
	.globl	SortedMap_print
	.type	SortedMap_print, @function
SortedMap_print:
.LFB250:
	.cfi_startproc
	leaq	.LC36(%rip), %rcx
	leaq	.LC26(%rip), %rsi
	movl	$4, %edx
	movl	$1, %edi
	xorl	%eax, %eax
	jmp	__printf_chk@PLT
	.cfi_endproc
.LFE250:
	.size	SortedMap_print, .-SortedMap_print
	.section	.text.vstrlen,"ax",@progbits
	.p2align 4,,15
	.globl	vstrlen
	.type	vstrlen, @function
vstrlen:
.LFB251:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	call	strlen@PLT
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE251:
	.size	vstrlen, .-vstrlen
	.section	.text.array_RepIndex_sort,"ax",@progbits
	.p2align 4,,15
	.globl	array_RepIndex_sort
	.type	array_RepIndex_sort, @function
array_RepIndex_sort:
.LFB261:
	.cfi_startproc
	movslq	16(%rdi), %rdx
	movslq	8(%rdi), %rsi
	leaq	compare_rep_index(%rip), %rcx
	movq	(%rdi), %rdi
	jmp	qsort@PLT
	.cfi_endproc
.LFE261:
	.size	array_RepIndex_sort, .-array_RepIndex_sort
	.section	.text.string_index_old,"ax",@progbits
	.p2align 4,,15
	.globl	string_index_old
	.type	string_index_old, @function
string_index_old:
.LFB287:
	.cfi_startproc
	testl	%ecx, %ecx
	movl	%ecx, %r10d
	movl	$-1, %eax
	je	.L363
	cmpl	%ecx, %esi
	jl	.L363
	testl	%esi, %esi
	jle	.L356
	leal	-1(%rsi), %eax
	leal	-1(%rcx), %r9d
	movq	%rdi, %r8
	leaq	1(%rdi,%rax), %r11
	addq	$1, %r9
	.p2align 4,,10
	.p2align 3
.L358:
	movl	%r8d, %eax
	subl	%edi, %eax
	testl	%r10d, %r10d
	jle	.L366
	movzbl	(%rdx), %esi
	movl	$1, %ecx
	cmpb	%sil, (%r8)
	je	.L360
	jmp	.L361
	.p2align 4,,10
	.p2align 3
.L368:
	movzbl	(%r8,%rcx), %esi
	addq	$1, %rcx
	cmpb	-1(%rdx,%rcx), %sil
	jne	.L361
.L360:
	cmpq	%rcx, %r9
	movl	%ecx, %esi
	jne	.L368
.L359:
	cmpl	%esi, %r10d
	je	.L356
.L361:
	addq	$1, %r8
	cmpq	%r11, %r8
	jne	.L358
	movl	$-1, %eax
.L356:
	rep ret
	.p2align 4,,10
	.p2align 3
.L366:
	xorl	%esi, %esi
	jmp	.L359
.L363:
	rep ret
	.cfi_endproc
.LFE287:
	.size	string_index_old, .-string_index_old
	.section	.text.string_index_after,"ax",@progbits
	.p2align 4,,15
	.globl	string_index_after
	.type	string_index_after, @function
string_index_after:
.LFB292:
	.cfi_startproc
	cmpl	%ecx, %esi
	movl	%esi, %r10d
	movl	%ecx, %r9d
	jl	.L379
	testl	%r8d, %r8d
	movl	$0, %eax
	cmovns	%r8d, %eax
	cmpl	%esi, %r8d
	jge	.L379
	cmpl	%esi, %eax
	jge	.L379
	leal	-1(%r9), %r8d
	movslq	%eax, %rcx
	addq	%rcx, %rdi
	addq	$1, %r8
	.p2align 4,,10
	.p2align 3
.L371:
	testl	%r9d, %r9d
	jle	.L380
	movzbl	(%rdi), %esi
	movl	$1, %ecx
	cmpb	%sil, (%rdx)
	je	.L373
	jmp	.L374
	.p2align 4,,10
	.p2align 3
.L382:
	movzbl	(%rdi,%rcx), %esi
	addq	$1, %rcx
	cmpb	-1(%rdx,%rcx), %sil
	jne	.L374
.L373:
	cmpq	%r8, %rcx
	movl	%ecx, %esi
	jne	.L382
.L372:
	cmpl	%esi, %r9d
	je	.L369
.L374:
	addl	$1, %eax
	addq	$1, %rdi
	cmpl	%eax, %r10d
	jne	.L371
.L379:
	movl	$-1, %eax
.L369:
	rep ret
	.p2align 4,,10
	.p2align 3
.L380:
	xorl	%esi, %esi
	jmp	.L372
	.cfi_endproc
.LFE292:
	.size	string_index_after, .-string_index_after
	.section	.text.string_index_byte,"ax",@progbits
	.p2align 4,,15
	.globl	string_index_byte
	.type	string_index_byte, @function
string_index_byte:
.LFB293:
	.cfi_startproc
	testl	%esi, %esi
	movl	%edx, %r8d
	movl	$-1, %eax
	jle	.L383
	cmpb	(%rdi), %dl
	je	.L388
	leal	-1(%rsi), %ecx
	movl	$1, %edx
	addq	$1, %rcx
	jmp	.L385
	.p2align 4,,10
	.p2align 3
.L386:
	addq	$1, %rdx
	cmpb	%r8b, -1(%rdi,%rdx)
	je	.L383
.L385:
	cmpq	%rcx, %rdx
	movl	%edx, %eax
	jne	.L386
	movl	$-1, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L388:
	xorl	%eax, %eax
.L383:
	rep ret
	.cfi_endproc
.LFE293:
	.size	string_index_byte, .-string_index_byte
	.section	.text.string_last_index_byte,"ax",@progbits
	.p2align 4,,15
	.globl	string_last_index_byte
	.type	string_last_index_byte, @function
string_last_index_byte:
.LFB294:
	.cfi_startproc
	movl	%esi, %eax
	movl	%edx, %ecx
	subl	$1, %eax
	js	.L393
	movslq	%eax, %r8
	cmpb	(%rdi,%r8), %dl
	je	.L389
	subl	$2, %esi
	movl	%eax, %eax
	movslq	%esi, %rsi
	movq	%rsi, %rdx
	subq	%rax, %rdx
	jmp	.L391
	.p2align 4,,10
	.p2align 3
.L392:
	subq	$1, %rsi
	cmpb	%cl, 1(%rsi,%rdi)
	je	.L389
.L391:
	cmpq	%rdx, %rsi
	movl	%esi, %eax
	jne	.L392
.L393:
	movl	$-1, %eax
.L389:
	rep ret
	.cfi_endproc
.LFE294:
	.size	string_last_index_byte, .-string_last_index_byte
	.section	.text.string_count,"ax",@progbits
	.p2align 4,,15
	.globl	string_count
	.type	string_count, @function
string_count:
.LFB295:
	.cfi_startproc
	testl	%esi, %esi
	sete	%r8b
	testl	%ecx, %ecx
	sete	%al
	orb	%al, %r8b
	jne	.L405
	cmpl	%esi, %ecx
	jle	.L413
.L405:
	xorl	%eax, %eax
	ret
.L413:
	testl	%esi, %esi
	jle	.L405
	leal	-1(%rcx), %r9d
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	%ecx, %r11d
	movl	%esi, %ebx
	xorl	%eax, %eax
	xorl	%r10d, %r10d
	addq	$1, %r9
	.p2align 4,,10
	.p2align 3
.L396:
	testl	%r11d, %r11d
	jle	.L406
.L416:
	movslq	%r10d, %r8
	movzbl	(%rdx), %esi
	movl	$1, %ecx
	addq	%rdi, %r8
	cmpb	%sil, (%r8)
	je	.L399
	jmp	.L401
	.p2align 4,,10
	.p2align 3
.L414:
	movzbl	(%r8,%rcx), %esi
	addq	$1, %rcx
	cmpb	-1(%rdx,%rcx), %sil
	jne	.L401
.L399:
	cmpq	%rcx, %r9
	movl	%ecx, %esi
	jne	.L414
.L398:
	cmpl	%esi, %r11d
	je	.L415
.L401:
	addl	$1, %r10d
	cmpl	%ebx, %r10d
	jl	.L396
.L394:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L415:
	.cfi_restore_state
	addl	%r11d, %r10d
	addl	$1, %eax
	cmpl	%ebx, %r10d
	jge	.L394
	testl	%r11d, %r11d
	jg	.L416
	.p2align 4,,10
	.p2align 3
.L406:
	xorl	%esi, %esi
	jmp	.L398
	.cfi_endproc
.LFE295:
	.size	string_count, .-string_count
	.section	.text.string_starts_with,"ax",@progbits
	.p2align 4,,15
	.globl	string_starts_with
	.type	string_starts_with, @function
string_starts_with:
.LFB297:
	.cfi_startproc
	xorl	%eax, %eax
	cmpl	%esi, %ecx
	jg	.L417
	testl	%ecx, %ecx
	jle	.L422
	movzbl	(%rdx), %esi
	cmpb	%sil, (%rdi)
	jne	.L417
	leal	-1(%rcx), %esi
	movl	$1, %eax
	addq	$1, %rsi
	jmp	.L419
	.p2align 4,,10
	.p2align 3
.L420:
	movzbl	(%rdi,%rax), %ecx
	addq	$1, %rax
	cmpb	-1(%rdx,%rax), %cl
	jne	.L424
.L419:
	cmpq	%rax, %rsi
	jne	.L420
.L422:
	movl	$1, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L424:
	xorl	%eax, %eax
.L417:
	rep ret
	.cfi_endproc
.LFE297:
	.size	string_starts_with, .-string_starts_with
	.section	.text.array_int_contains,"ax",@progbits
	.p2align 4,,15
	.globl	array_int_contains
	.type	array_int_contains, @function
array_int_contains:
.LFB305:
	.cfi_startproc
	movl	16(%rsp), %edx
	movq	8(%rsp), %rax
	testl	%edx, %edx
	jle	.L429
	cmpl	(%rax), %edi
	je	.L431
	addq	$4, %rax
	subl	$1, %edx
	leaq	(%rax,%rdx,4), %rdx
	jmp	.L427
	.p2align 4,,10
	.p2align 3
.L428:
	addq	$4, %rax
	cmpl	%edi, -4(%rax)
	je	.L431
.L427:
	cmpq	%rdx, %rax
	jne	.L428
.L429:
	xorl	%eax, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L431:
	movl	$1, %eax
	ret
	.cfi_endproc
.LFE305:
	.size	array_int_contains, .-array_int_contains
	.section	.text.byte_is_space,"ax",@progbits
	.p2align 4,,15
	.globl	byte_is_space
	.type	byte_is_space, @function
byte_is_space:
.LFB306:
	.cfi_startproc
	movl	%edi, %edx
	movl	$1, %eax
	andl	$127, %edx
	cmpb	$32, %dl
	je	.L432
	leal	-9(%rdi), %edx
	cmpb	$4, %dl
	jbe	.L432
	xorl	%eax, %eax
	cmpb	$-123, %dil
	sete	%al
.L432:
	rep ret
	.cfi_endproc
.LFE306:
	.size	byte_is_space, .-byte_is_space
	.section	.text.array_string_sort,"ax",@progbits
	.p2align 4,,15
	.globl	array_string_sort
	.type	array_string_sort, @function
array_string_sort:
.LFB314:
	.cfi_startproc
	movslq	16(%rdi), %rdx
	movslq	8(%rdi), %rsi
	leaq	compare_strings(%rip), %rcx
	movq	(%rdi), %rdi
	jmp	qsort@PLT
	.cfi_endproc
.LFE314:
	.size	array_string_sort, .-array_string_sort
	.section	.text.array_string_sort_ignore_case,"ax",@progbits
	.p2align 4,,15
	.globl	array_string_sort_ignore_case
	.type	array_string_sort_ignore_case, @function
array_string_sort_ignore_case:
.LFB315:
	.cfi_startproc
	movslq	16(%rdi), %rdx
	movslq	8(%rdi), %rsi
	leaq	compare_lower_strings(%rip), %rcx
	movq	(%rdi), %rdi
	jmp	qsort@PLT
	.cfi_endproc
.LFE315:
	.size	array_string_sort_ignore_case, .-array_string_sort_ignore_case
	.section	.text.array_string_sort_by_len,"ax",@progbits
	.p2align 4,,15
	.globl	array_string_sort_by_len
	.type	array_string_sort_by_len, @function
array_string_sort_by_len:
.LFB316:
	.cfi_startproc
	movslq	16(%rdi), %rdx
	movslq	8(%rdi), %rsi
	leaq	compare_strings_by_len(%rip), %rcx
	movq	(%rdi), %rdi
	jmp	qsort@PLT
	.cfi_endproc
.LFE316:
	.size	array_string_sort_by_len, .-array_string_sort_by_len
	.section	.text.ustring_str,"ax",@progbits
	.p2align 4,,15
	.globl	ustring_str
	.type	ustring_str, @function
ustring_str:
.LFB317:
	.cfi_startproc
	movq	8(%rsp), %rax
	movq	16(%rsp), %rdx
	ret
	.cfi_endproc
.LFE317:
	.size	ustring_str, .-ustring_str
	.section	.text.ustring_free,"ax",@progbits
	.p2align 4,,15
	.globl	ustring_free
	.type	ustring_free, @function
ustring_free:
.LFB334:
	.cfi_startproc
	movq	24(%rsp), %rdi
	jmp	free@PLT
	.cfi_endproc
.LFE334:
	.size	ustring_free, .-ustring_free
	.section	.text.byte_is_digit,"ax",@progbits
	.p2align 4,,15
	.globl	byte_is_digit
	.type	byte_is_digit, @function
byte_is_digit:
.LFB335:
	.cfi_startproc
	subl	$48, %edi
	xorl	%eax, %eax
	cmpb	$9, %dil
	setbe	%al
	ret
	.cfi_endproc
.LFE335:
	.size	byte_is_digit, .-byte_is_digit
	.section	.text.byte_is_hex_digit,"ax",@progbits
	.p2align 4,,15
	.globl	byte_is_hex_digit
	.type	byte_is_hex_digit, @function
byte_is_hex_digit:
.LFB336:
	.cfi_startproc
	leal	-48(%rdi), %edx
	movl	$1, %eax
	cmpb	$9, %dl
	jbe	.L443
	andl	$-33, %edi
	xorl	%eax, %eax
	subl	$65, %edi
	cmpb	$5, %dil
	setbe	%al
.L443:
	rep ret
	.cfi_endproc
.LFE336:
	.size	byte_is_hex_digit, .-byte_is_hex_digit
	.section	.text.byte_is_oct_digit,"ax",@progbits
	.p2align 4,,15
	.globl	byte_is_oct_digit
	.type	byte_is_oct_digit, @function
byte_is_oct_digit:
.LFB337:
	.cfi_startproc
	subl	$48, %edi
	xorl	%eax, %eax
	cmpb	$7, %dil
	setbe	%al
	ret
	.cfi_endproc
.LFE337:
	.size	byte_is_oct_digit, .-byte_is_oct_digit
	.section	.text.byte_is_bin_digit,"ax",@progbits
	.p2align 4,,15
	.globl	byte_is_bin_digit
	.type	byte_is_bin_digit, @function
byte_is_bin_digit:
.LFB338:
	.cfi_startproc
	subl	$48, %edi
	xorl	%eax, %eax
	cmpb	$1, %dil
	setbe	%al
	ret
	.cfi_endproc
.LFE338:
	.size	byte_is_bin_digit, .-byte_is_bin_digit
	.section	.text.byte_is_letter,"ax",@progbits
	.p2align 4,,15
	.globl	byte_is_letter
	.type	byte_is_letter, @function
byte_is_letter:
.LFB339:
	.cfi_startproc
	andl	$-33, %edi
	xorl	%eax, %eax
	subl	$65, %edi
	cmpb	$25, %dil
	setbe	%al
	ret
	.cfi_endproc
.LFE339:
	.size	byte_is_letter, .-byte_is_letter
	.section	.text.string_free,"ax",@progbits
	.p2align 4,,15
	.globl	string_free
	.type	string_free, @function
string_free:
.LFB340:
	.cfi_startproc
	jmp	free@PLT
	.cfi_endproc
.LFE340:
	.size	string_free, .-string_free
	.section	.text.string_hash,"ax",@progbits
	.p2align 4,,15
	.globl	string_hash
	.type	string_hash, @function
string_hash:
.LFB350:
	.cfi_startproc
	xorl	%eax, %eax
	testl	%esi, %esi
	jle	.L450
	leal	-1(%rsi), %edx
	leaq	1(%rdi,%rdx), %rcx
	.p2align 4,,10
	.p2align 3
.L452:
	movl	%eax, %edx
	addq	$1, %rdi
	sall	$5, %edx
	subl	%eax, %edx
	movzbl	-1(%rdi), %eax
	addl	%edx, %eax
	cmpq	%rdi, %rcx
	jne	.L452
.L450:
	rep ret
	.cfi_endproc
.LFE350:
	.size	string_hash, .-string_hash
	.section	.text.string_bytes,"ax",@progbits
	.p2align 4,,15
	.globl	string_bytes
	.type	string_bytes, @function
string_bytes:
.LFB351:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rdi, %rbx
	subq	$80, %rsp
	.cfi_def_cfa_offset 112
	movq	%fs:40, %rax
	movq	%rax, 72(%rsp)
	xorl	%eax, %eax
	testl	%edx, %edx
	je	.L460
	leaq	71(%rsp), %r8
	leaq	32(%rsp), %rdi
	movq	%rdx, %rbp
	movl	$1, %ecx
	movl	$1, %edx
	movq	%rsi, %r12
	movl	$1, %esi
	movb	$0, 71(%rsp)
	call	new_array_from_c_array
	movq	%rsp, %rdi
	subq	$8, %rsp
	.cfi_def_cfa_offset 120
	movl	%ebp, %esi
	pushq	56(%rsp)
	.cfi_def_cfa_offset 128
	pushq	56(%rsp)
	.cfi_def_cfa_offset 136
	pushq	56(%rsp)
	.cfi_def_cfa_offset 144
	call	array_repeat
	addq	$32, %rsp
	.cfi_def_cfa_offset 112
	movq	(%rsp), %rdi
	movslq	%ebp, %rdx
	movq	%r12, %rsi
	call	memcpy@PLT
	movdqa	(%rsp), %xmm0
	movq	16(%rsp), %rax
	movups	%xmm0, (%rbx)
	movq	%rax, 16(%rbx)
.L455:
	movq	72(%rsp), %rcx
	xorq	%fs:40, %rcx
	movq	%rbx, %rax
	jne	.L461
	addq	$80, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L460:
	.cfi_restore_state
	movl	$1, %esi
	movl	$1, %edi
	call	calloc@PLT
	movq	%rax, (%rbx)
	movabsq	$4294967296, %rax
	movl	$1, 16(%rbx)
	movq	%rax, 8(%rbx)
	jmp	.L455
.L461:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE351:
	.size	string_bytes, .-string_bytes
	.section	.text.string_trim,"ax",@progbits
	.p2align 4,,15
	.globl	string_trim
	.type	string_trim, @function
string_trim:
.LFB308:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdi, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rsi, %rdi
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	testl	%esi, %esi
	movl	%esi, 12(%rsp)
	jle	.L463
	testl	%ecx, %ecx
	jle	.L463
	leaq	32(%rsp), %rdi
	movq	%rsi, %rbp
	movq	%rdx, %rsi
	movq	%rcx, %rdx
	xorl	%r12d, %r12d
	call	string_bytes
	movl	40(%rsp), %edi
	movl	%ebp, %eax
	movq	32(%rsp), %r13
	leal	-1(%rax), %r15d
	movq	%rax, 24(%rsp)
	leal	-1(%rdi), %eax
	movl	%edi, 20(%rsp)
	movl	%eax, 8(%rsp)
	.p2align 4,,10
	.p2align 3
.L466:
	movabsq	$-4294967296, %rbx
	movl	%r12d, %edx
	movq	%r14, %rdi
	andq	%rbp, %rbx
	orq	24(%rsp), %rbx
	movq	%rbx, %rsi
	movq	%rbx, %rbp
	call	string_at
	movl	20(%rsp), %edx
	testl	%edx, %edx
	jle	.L467
	cmpb	0(%r13), %al
	je	.L468
	movl	8(%rsp), %ecx
	leaq	1(%r13), %rdx
	addq	%rdx, %rcx
	jmp	.L469
	.p2align 4,,10
	.p2align 3
.L470:
	addq	$1, %rdx
	cmpb	-1(%rdx), %al
	je	.L468
.L469:
	cmpq	%rdx, %rcx
	jne	.L470
	movb	$0, 19(%rsp)
.L471:
	movl	%r15d, %edx
	movq	%r14, %rdi
	movq	%rbx, %rsi
	call	string_at
	cmpb	%al, 0(%r13)
	je	.L472
	movl	8(%rsp), %ecx
	leaq	1(%r13), %rdx
	addq	%rdx, %rcx
	jmp	.L479
	.p2align 4,,10
	.p2align 3
.L473:
	addq	$1, %rdx
	cmpb	%al, -1(%rdx)
	je	.L472
.L479:
	cmpq	%rdx, %rcx
	jne	.L473
	cmpl	%r15d, %r12d
	jg	.L478
	cmpl	12(%rsp), %r12d
	jg	.L475
	cmpb	$0, 19(%rsp)
	jne	.L466
	.p2align 4,,10
	.p2align 3
.L475:
	movq	56(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L481
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	leal	1(%r15), %ecx
	movl	%r12d, %edx
	movq	%r14, %rdi
	movq	%rbx, %rsi
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	string_substr
	.p2align 4,,10
	.p2align 3
.L463:
	.cfi_restore_state
	movq	%r14, %rax
	movq	%rdi, %rdx
.L465:
	movq	56(%rsp), %rsi
	xorq	%fs:40, %rsi
	jne	.L481
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L472:
	.cfi_restore_state
	subl	$1, %r15d
	cmpl	%r15d, %r12d
	jg	.L478
	cmpl	12(%rsp), %r12d
	jle	.L466
	jmp	.L475
	.p2align 4,,10
	.p2align 3
.L468:
	addl	$1, %r12d
	movb	$1, 19(%rsp)
	jmp	.L471
	.p2align 4,,10
	.p2align 3
.L467:
	movl	%r15d, %edx
	movq	%r14, %rdi
	movq	%rbx, %rsi
	call	string_at
	cmpl	%r15d, %r12d
	jle	.L475
.L478:
	leaq	.LC37(%rip), %rax
	xorl	%edx, %edx
	jmp	.L465
.L481:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE308:
	.size	string_trim, .-string_trim
	.section	.rodata.str1.1
.LC38:
	.string	" \n\t\013\f\r"
	.section	.text.string_trim_space,"ax",@progbits
	.p2align 4,,15
	.globl	string_trim_space
	.type	string_trim_space, @function
string_trim_space:
.LFB307:
	.cfi_startproc
	leaq	.LC38(%rip), %rdx
	movl	$6, %ecx
	jmp	string_trim
	.cfi_endproc
.LFE307:
	.size	string_trim_space, .-string_trim_space
	.section	.rodata.str1.1
.LC39:
	.string	"("
.LC40:
	.string	"]"
.LC41:
	.string	"["
.LC42:
	.string	"addr2line -e %.*s %.*s"
.LC43:
	.string	"r"
.LC44:
	.string	":"
.LC45:
	.string	"??:0:"
.LC46:
	.string	"??:?:"
.LC47:
	.string	": (d."
.LC48:
	.string	" (discriminator"
.LC49:
	.string	"%-46s | %14s | %.*s"
	.section	.text.print_backtrace_skipping_top_frames_linux,"ax",@progbits
	.p2align 4,,15
	.globl	print_backtrace_skipping_top_frames_linux
	.type	print_backtrace_skipping_top_frames_linux, @function
print_backtrace_skipping_top_frames_linux:
.LFB151:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	$100, %ecx
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movslq	%edi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	$100, %esi
	subq	$2024, %rsp
	.cfi_def_cfa_offset 2080
	movq	%fs:40, %rax
	movq	%rax, 2008(%rsp)
	xorl	%eax, %eax
	leaq	208(%rsp), %r13
	leaq	208(%rsp), %rdi
	leaq	176(%rsp), %rbx
	rep stosq
	movq	%r13, %rdi
	call	backtrace@PLT
	xorl	%edx, %edx
	subl	%r12d, %eax
	xorl	%esi, %esi
	movl	$16, %ecx
	movq	%rbx, %rdi
	movl	%eax, %ebp
	call	new_array
	leaq	0(%r13,%r12,8), %rdi
	movl	%ebp, %esi
	call	backtrace_symbols@PLT
	testl	%ebp, %ebp
	jle	.L492
	movq	(%rax), %r14
	testq	%r14, %r14
	je	.L488
	leaq	8(%rax), %r13
	leal	-1(%rbp), %eax
	leaq	160(%rsp), %rbp
	leaq	0(%r13,%rax,8), %r12
	jmp	.L490
	.p2align 4,,10
	.p2align 3
.L491:
	addq	$8, %r13
	movq	-8(%r13), %r14
	testq	%r14, %r14
	je	.L488
.L490:
	movq	%r14, %rdi
	call	strlen@PLT
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	movq	%r14, 160(%rsp)
	movl	%eax, 168(%rsp)
	call	array_push
	cmpq	%r13, %r12
	jne	.L491
.L492:
	movl	184(%rsp), %eax
	movq	$0, 32(%rsp)
	movl	$0, 96(%rsp)
	testl	%eax, %eax
	jle	.L487
	leaq	1008(%rsp), %r13
	movabsq	$-4294967296, %r14
	.p2align 4,,10
	.p2align 3
.L486:
	movq	32(%rsp), %rax
	addq	176(%rsp), %rax
	leaq	.LC39(%rip), %rdx
	movq	(%rax), %rbp
	movq	8(%rax), %rbx
	movl	8(%rax), %eax
	movq	%rbp, %rdi
	movq	%rbx, %rsi
	movq	%rbp, 88(%rsp)
	movl	%eax, 100(%rsp)
	movq	64(%rsp), %rax
	andq	%r14, %rax
	orq	$1, %rax
	movq	%rax, %rcx
	movq	%rax, 64(%rsp)
	call	string_all_before
	movq	56(%rsp), %rsi
	movq	%rax, 72(%rsp)
	movq	%rdx, %r12
	movq	16(%rsp), %rax
	leaq	.LC41(%rip), %rdx
	andq	%r14, %rsi
	movq	%rsi, %rdi
	andq	%r14, %rax
	movq	%rbx, %rsi
	orq	$1, %rdi
	orq	$1, %rax
	movq	%rdi, %rcx
	movq	%rdi, 56(%rsp)
	movq	%rbp, %rdi
	movq	%rax, 16(%rsp)
	call	string_all_after
	movq	16(%rsp), %rcx
	movq	%rdx, %rsi
	leaq	.LC40(%rip), %rdx
	movq	%rax, %rdi
	call	string_all_before
	movq	48(%rsp), %rsi
	movq	%rdx, 80(%rsp)
	leaq	.LC41(%rip), %rdx
	movq	%rax, 24(%rsp)
	andq	%r14, %rsi
	movq	%rsi, %rdi
	movq	%rbx, %rsi
	orq	$1, %rdi
	movq	%rdi, %rcx
	movq	%rdi, 48(%rsp)
	movq	%rbp, %rdi
	call	string_all_before
	movq	24(%rsp), %r8
	movq	%rdx, 112(%rsp)
	leaq	.LC42(%rip), %rdi
	movl	80(%rsp), %ecx
	movq	72(%rsp), %rdx
	movl	%r12d, %esi
	movq	%rax, 104(%rsp)
	xorl	%eax, %eax
	call	_STR
	leaq	.LC43(%rip), %rsi
	movq	%rax, %rdi
	call	popen@PLT
	testq	%rax, %rax
	movq	%rax, %r12
	je	.L516
	movl	$125, %ecx
	xorl	%eax, %eax
	movq	%r13, %rdi
	rep stosq
	leaq	.LC37(%rip), %rbp
	andq	%r14, %r15
	xorl	%ebx, %ebx
.L495:
	movq	%r12, %rdx
	movl	$1000, %esi
	movq	%r13, %rdi
	call	fgets@PLT
	testq	%rax, %rax
	je	.L517
	movq	%r13, %rdx
.L496:
	movl	(%rdx), %ecx
	addq	$4, %rdx
	leal	-16843009(%rcx), %eax
	notl	%ecx
	andl	%ecx, %eax
	andl	$-2139062144, %eax
	je	.L496
	movl	%eax, %ecx
	movl	%ebx, %esi
	shrl	$16, %ecx
	testl	$32896, %eax
	cmove	%ecx, %eax
	leaq	2(%rdx), %rcx
	movl	%eax, %edi
	cmove	%rcx, %rdx
	addb	%al, %dil
	movq	8(%rsp), %rax
	sbbq	$3, %rdx
	andq	%r14, %r15
	movq	%rbp, %rdi
	subl	%r13d, %edx
	orq	%r15, %rsi
	andq	%r14, %rax
	orq	%rdx, %rax
	movq	%r13, %rdx
	movq	%rax, %rcx
	movq	%rax, 8(%rsp)
	call	string_add
	movq	%rdx, %r15
	movl	%edx, %ebx
	movq	%rax, %rbp
	jmp	.L495
	.p2align 4,,10
	.p2align 3
.L517:
	movq	40(%rsp), %rax
	movl	%ebx, %esi
	movq	%r15, %rbx
	andq	%r14, %rbx
	leaq	.LC38(%rip), %rdx
	movq	%rbp, %rdi
	orq	%rbx, %rsi
	andq	%r14, %rax
	orq	$1, %rax
	movq	%rax, 40(%rsp)
	movq	120(%rsp), %rax
	andq	%r14, %rax
	orq	$6, %rax
	movq	%rax, %rcx
	movq	%rax, 120(%rsp)
	call	string_trim
	movq	40(%rsp), %rcx
	movq	%rdx, %rsi
	leaq	.LC44(%rip), %rdx
	movq	%rax, %rdi
	call	string_add
	movq	%r12, %rdi
	movq	%rdx, %r15
	movq	%rax, %rbx
	call	pclose@PLT
	testl	%eax, %eax
	movl	%eax, %ebp
	jne	.L516
	movq	144(%rsp), %rax
	leaq	.LC45(%rip), %rdx
	movq	%rbx, %rdi
	movq	%r15, %rsi
	andq	%r14, %rax
	orq	$5, %rax
	movq	%rax, %rcx
	movq	%rax, 144(%rsp)
	call	string_eq
	testl	%eax, %eax
	jne	.L502
	movq	152(%rsp), %rax
	leaq	.LC46(%rip), %rdx
	movq	%rbx, %rdi
	movq	%r15, %rsi
	andq	%r14, %rax
	orq	$5, %rax
	movq	%rax, %rcx
	movq	%rax, 152(%rsp)
	call	string_eq
	testl	%eax, %eax
	jne	.L502
	movl	%r15d, %ebp
.L501:
	movq	136(%rsp), %rax
	andq	%r14, %r15
	leaq	.LC47(%rip), %r8
	movl	%ebp, %esi
	leaq	.LC48(%rip), %rdx
	movq	%rbx, %rdi
	orq	%r15, %rsi
	andq	%r14, %rax
	orq	$5, %rax
	movq	%rax, %r9
	movq	%rax, 136(%rsp)
	movq	128(%rsp), %rax
	andq	%r14, %rax
	orq	$15, %rax
	movq	%rax, %rcx
	movq	%rax, 128(%rsp)
	call	string_replace
	movl	112(%rsp), %ecx
	movq	%rdx, %r15
	movq	104(%rsp), %r8
	movq	24(%rsp), %rdx
	leaq	.LC49(%rip), %rdi
	movq	%rax, %rsi
	xorl	%eax, %eax
	call	_STR
	leaq	.LC26(%rip), %rsi
	movq	%rax, %rcx
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
.L503:
	addl	$1, 96(%rsp)
	addq	$16, 32(%rsp)
	movl	96(%rsp), %eax
	cmpl	%eax, 184(%rsp)
	jg	.L486
.L487:
	movq	2008(%rsp), %rbx
	xorq	%fs:40, %rbx
	movl	$1, %eax
	jne	.L518
	addq	$2024, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L516:
	.cfi_restore_state
	movq	88(%rsp), %rcx
	movl	100(%rsp), %edx
	leaq	.LC26(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	jmp	.L503
	.p2align 4,,10
	.p2align 3
.L502:
	leaq	.LC37(%rip), %rbx
	jmp	.L501
.L488:
	call	tos2.part.8
.L518:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE151:
	.size	print_backtrace_skipping_top_frames_linux, .-print_backtrace_skipping_top_frames_linux
	.section	.text.print_backtrace_skipping_top_frames_nix,"ax",@progbits
	.p2align 4,,15
	.globl	print_backtrace_skipping_top_frames_nix
	.type	print_backtrace_skipping_top_frames_nix, @function
print_backtrace_skipping_top_frames_nix:
.LFB148:
	.cfi_startproc
	addl	$2, %edi
	jmp	print_backtrace_skipping_top_frames_linux
	.cfi_endproc
.LFE148:
	.size	print_backtrace_skipping_top_frames_nix, .-print_backtrace_skipping_top_frames_nix
	.section	.rodata.str1.8
	.align 8
.LC50:
	.string	"print_backtrace_skipping_top_frames is not implemented on this platform for now...\n"
	.section	.text.print_backtrace_skipping_top_frames,"ax",@progbits
	.p2align 4,,15
	.globl	print_backtrace_skipping_top_frames
	.type	print_backtrace_skipping_top_frames, @function
print_backtrace_skipping_top_frames:
.LFB129:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	addl	$2, %edi
	call	print_backtrace_skipping_top_frames_linux
	testl	%eax, %eax
	je	.L523
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L523:
	.cfi_restore_state
	leaq	.LC50(%rip), %rcx
	leaq	.LC26(%rip), %rsi
	movl	$83, %edx
	movl	$1, %edi
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	jmp	__printf_chk@PLT
	.cfi_endproc
.LFE129:
	.size	print_backtrace_skipping_top_frames, .-print_backtrace_skipping_top_frames
	.section	.text.print_backtrace,"ax",@progbits
	.p2align 4,,15
	.globl	print_backtrace
	.type	print_backtrace, @function
print_backtrace:
.LFB130:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$4, %edi
	call	print_backtrace_skipping_top_frames_linux
	testl	%eax, %eax
	je	.L527
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L527:
	.cfi_restore_state
	leaq	.LC50(%rip), %rcx
	leaq	.LC26(%rip), %rsi
	movl	$83, %edx
	movl	$1, %edi
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	jmp	__printf_chk@PLT
	.cfi_endproc
.LFE130:
	.size	print_backtrace, .-print_backtrace
	.section	.rodata.str1.1
.LC51:
	.string	"V panic: %.*s"
	.section	.text.v_panic,"ax",@progbits
	.p2align 4,,15
	.globl	v_panic
	.type	v_panic, @function
v_panic:
.LFB132:
	.cfi_startproc
	movq	%rdi, %rdx
	leaq	.LC51(%rip), %rdi
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
	call	_STR
	leaq	.LC26(%rip), %rsi
	movq	%rax, %rcx
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	xorl	%eax, %eax
	call	print_backtrace
	movl	$1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE132:
	.size	v_panic, .-v_panic
	.section	.rodata.str1.1
.LC52:
	.string	"tos3: nil string"
	.section	.text.tos3,"ax",@progbits
	.p2align 4,,15
	.globl	tos3
	.type	tos3, @function
tos3:
.LFB255:
	.cfi_startproc
	testq	%rdi, %rdi
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	je	.L533
	movq	%rdi, %rbx
	call	strlen@PLT
	movl	%eax, %edx
	movq	%rbx, %rax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L533:
	.cfi_restore_state
	leaq	.LC52(%rip), %rdi
	call	tos3
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	v_panic
	.cfi_endproc
.LFE255:
	.size	tos3, .-tos3
	.section	.rodata.str1.1
.LC53:
	.string	"array.first: array is empty"
	.section	.text.array_first,"ax",@progbits
	.p2align 4,,15
	.globl	array_first
	.type	array_first, @function
array_first:
.LFB99:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	24(%rsp), %eax
	testl	%eax, %eax
	je	.L537
	movq	16(%rsp), %rax
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L537:
	.cfi_restore_state
	leaq	.LC53(%rip), %rdi
	movl	$27, %esi
	call	v_panic
	.cfi_endproc
.LFE99:
	.size	array_first, .-array_first
	.section	.rodata.str1.1
.LC54:
	.string	"array.last: array is empty"
	.section	.text.array_last,"ax",@progbits
	.p2align 4,,15
	.globl	array_last
	.type	array_last, @function
array_last:
.LFB100:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	24(%rsp), %eax
	testl	%eax, %eax
	je	.L541
	subl	$1, %eax
	imull	32(%rsp), %eax
	cltq
	addq	16(%rsp), %rax
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L541:
	.cfi_restore_state
	leaq	.LC54(%rip), %rdi
	movl	$26, %esi
	call	v_panic
	.cfi_endproc
.LFE100:
	.size	array_last, .-array_last
	.section	.rodata.str1.1
.LC55:
	.string	"eprintln(NIL)"
	.section	.text.eprintln,"ax",@progbits
	.p2align 4,,15
	.globl	eprintln
	.type	eprintln, @function
eprintln:
.LFB133:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	testq	%rdi, %rdi
	je	.L545
	movq	%rdi, %rbx
	movq	stdout(%rip), %rdi
	movq	%rsi, %rbp
	call	fflush@PLT
	movq	stderr(%rip), %rdi
	call	fflush@PLT
	movq	stderr(%rip), %rdi
	leaq	.LC26(%rip), %rdx
	movq	%rbx, %r8
	movl	%ebp, %ecx
	movl	$1, %esi
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	movq	stderr(%rip), %rdi
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	jmp	fflush@PLT
.L545:
	.cfi_restore_state
	leaq	.LC55(%rip), %rdi
	movl	$13, %esi
	call	v_panic
	.cfi_endproc
.LFE133:
	.size	eprintln, .-eprintln
	.section	.rodata.str1.1
.LC56:
	.string	"eprint(NIL)"
	.section	.text.eprint,"ax",@progbits
	.p2align 4,,15
	.globl	eprint
	.type	eprint, @function
eprint:
.LFB134:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	testq	%rdi, %rdi
	je	.L549
	movq	%rdi, %rbx
	movq	stdout(%rip), %rdi
	movq	%rsi, %rbp
	call	fflush@PLT
	movq	stderr(%rip), %rdi
	call	fflush@PLT
	movq	stderr(%rip), %rdi
	leaq	.LC25(%rip), %rdx
	movq	%rbx, %r8
	movl	%ebp, %ecx
	movl	$1, %esi
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	movq	stderr(%rip), %rdi
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	jmp	fflush@PLT
.L549:
	.cfi_restore_state
	leaq	.LC56(%rip), %rdi
	movl	$11, %esi
	call	v_panic
	.cfi_endproc
.LFE134:
	.size	eprint, .-eprint
	.section	.rodata.str1.1
.LC57:
	.string	"calloc(<=0)"
	.section	.text.vcalloc.part.5,"ax",@progbits
	.p2align 4,,15
	.type	vcalloc.part.5, @function
vcalloc.part.5:
.LFB535:
	.cfi_startproc
	leaq	.LC57(%rip), %rdi
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$11, %esi
	call	v_panic
	.cfi_endproc
.LFE535:
	.size	vcalloc.part.5, .-vcalloc.part.5
	.section	.text.vcalloc,"ax",@progbits
	.p2align 4,,15
	.globl	vcalloc
	.type	vcalloc, @function
vcalloc:
.LFB139:
	.cfi_startproc
	testl	%edi, %edi
	jle	.L557
	movslq	%edi, %rdi
	movl	$1, %esi
	jmp	calloc@PLT
.L557:
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	call	vcalloc.part.5
	.cfi_endproc
.LFE139:
	.size	vcalloc, .-vcalloc
	.section	.text.new_array,"ax",@progbits
	.p2align 4,,15
	.globl	new_array
	.type	new_array, @function
new_array:
.LFB86:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movl	%esi, %r13d
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movl	%ecx, %r12d
	movq	%rdi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	testl	%edx, %edx
	je	.L561
	movl	%edx, %edi
	movl	%edx, %ebp
	imull	%ecx, %edi
.L559:
	testl	%edi, %edi
	jle	.L563
	movslq	%edi, %rdi
	movl	$1, %esi
	call	calloc@PLT
	movl	%r13d, 8(%rbx)
	movq	%rax, (%rbx)
	movq	%rbx, %rax
	movl	%ebp, 12(%rbx)
	movl	%r12d, 16(%rbx)
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L561:
	.cfi_restore_state
	movl	%ecx, %edi
	movl	$1, %ebp
	jmp	.L559
.L563:
	call	vcalloc.part.5
	.cfi_endproc
.LFE86:
	.size	new_array, .-new_array
	.section	.text.new_array_from_c_array,"ax",@progbits
	.p2align 4,,15
	.globl	new_array_from_c_array
	.type	new_array_from_c_array, @function
new_array_from_c_array:
.LFB88:
	.cfi_startproc
	testl	%edx, %edx
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	movl	%edx, %r14d
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movq	%r8, %r13
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	movl	%esi, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movl	%ecx, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movq	%rdi, %rbx
	movl	%ecx, %edi
	je	.L565
	movl	%edx, %edi
	imull	%ecx, %edi
.L565:
	testl	%edi, %edi
	jle	.L571
	movslq	%edi, %rdi
	movl	$1, %esi
	call	calloc@PLT
	movl	%ebp, %edx
	movq	%r13, %rsi
	movq	%rax, %rdi
	imull	%r12d, %edx
	movslq	%edx, %rdx
	call	memcpy@PLT
	movl	%r12d, 8(%rbx)
	movq	%rax, (%rbx)
	movq	%rbx, %rax
	movl	%r14d, 12(%rbx)
	movl	%ebp, 16(%rbx)
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
.L571:
	.cfi_restore_state
	call	vcalloc.part.5
	.cfi_endproc
.LFE88:
	.size	new_array_from_c_array, .-new_array_from_c_array
	.section	.text.array_ensure_cap,"ax",@progbits
	.p2align 4,,15
	.globl	array_ensure_cap
	.type	array_ensure_cap, @function
array_ensure_cap:
.LFB90:
	.cfi_startproc
	movl	12(%rdi), %eax
	cmpl	%esi, %eax
	jge	.L584
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbp
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	testl	%eax, %eax
	jne	.L587
	cmpl	$2, %esi
	movl	$2, %ebx
	jle	.L580
	.p2align 4,,10
	.p2align 3
.L576:
	addl	%ebx, %ebx
	cmpl	%ebx, %esi
	jg	.L576
	testl	%eax, %eax
	jne	.L575
.L580:
	movl	16(%rbp), %edi
	imull	%ebx, %edi
	testl	%edi, %edi
	jle	.L588
	movslq	%edi, %rdi
	movl	$1, %esi
	call	calloc@PLT
	movl	%ebx, 12(%rbp)
	movq	%rax, 0(%rbp)
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L587:
	.cfi_restore_state
	leal	(%rax,%rax), %ebx
	cmpl	%ebx, %esi
	jg	.L576
.L575:
	movl	16(%rbp), %esi
	movq	0(%rbp), %rdi
	imull	%ebx, %esi
	movslq	%esi, %rsi
	call	realloc@PLT
	movl	%ebx, 12(%rbp)
	movq	%rax, 0(%rbp)
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L584:
	.cfi_restore 3
	.cfi_restore 6
	rep ret
.L588:
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -24
	.cfi_offset 6, -16
	call	vcalloc.part.5
	.cfi_endproc
.LFE90:
	.size	array_ensure_cap, .-array_ensure_cap
	.section	.text.array_push,"ax",@progbits
	.p2align 4,,15
	.globl	array_push
	.type	array_push, @function
array_push:
.LFB106:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rsi, %rbp
	movq	%rdi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movl	8(%rdi), %eax
	leal	1(%rax), %esi
	call	array_ensure_cap
	movslq	16(%rbx), %rdx
	movl	8(%rbx), %edi
	movq	%rbp, %rsi
	imull	%edx, %edi
	movslq	%edi, %rdi
	addq	(%rbx), %rdi
	call	memcpy@PLT
	addl	$1, 8(%rbx)
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE106:
	.size	array_push, .-array_push
	.section	.text.array_pointers,"ax",@progbits
	.p2align 4,,15
	.globl	array_pointers
	.type	array_pointers, @function
array_pointers:
.LFB126:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	$1, %esi
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	movl	136(%rsp), %ebp
	movq	%rdi, 8(%rsp)
	movl	$8, %edi
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	call	calloc@PLT
	testl	%ebp, %ebp
	movq	%rax, 32(%rsp)
	movabsq	$4294967296, %rax
	movq	%rax, 40(%rsp)
	movl	$8, 48(%rsp)
	jle	.L592
	movslq	144(%rsp), %r14
	movq	128(%rsp), %r15
	leaq	24(%rsp), %r13
	leaq	32(%rsp), %r12
	xorl	%ebx, %ebx
	.p2align 4,,10
	.p2align 3
.L593:
	movq	%r13, %rsi
	movq	%r12, %rdi
	addl	$1, %ebx
	movq	%r15, 24(%rsp)
	addq	%r14, %r15
	call	array_push
	cmpl	%ebx, %ebp
	jne	.L593
.L592:
	movq	8(%rsp), %rdx
	movq	48(%rsp), %rax
	movdqa	32(%rsp), %xmm0
	movq	56(%rsp), %rcx
	xorq	%fs:40, %rcx
	movq	%rax, 16(%rdx)
	movq	%rdx, %rax
	movups	%xmm0, (%rdx)
	jne	.L597
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L597:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE126:
	.size	array_pointers, .-array_pointers
	.section	.text.array_clone,"ax",@progbits
	.p2align 4,,15
	.globl	array_clone
	.type	array_clone, @function
array_clone:
.LFB103:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	movq	%rsi, %rbp
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	movl	12(%rsi), %r13d
	movl	16(%rsi), %r12d
	movl	%r13d, %edi
	imull	%r12d, %edi
	cmpl	$0, %edi
	je	.L601
	jle	.L600
	movslq	%edi, %rdi
	movq	%rdi, %r14
	jmp	.L599
	.p2align 4,,10
	.p2align 3
.L601:
	xorl	%r14d, %r14d
	movl	$1, %edi
.L599:
	movl	$1, %esi
	call	calloc@PLT
	movl	8(%rbp), %r15d
	movq	0(%rbp), %rsi
	movq	%r14, %rdx
	movq	%rax, %rdi
	call	memcpy@PLT
	movl	%r15d, 8(%rbx)
	movq	%rax, (%rbx)
	movq	%rbx, %rax
	movl	%r13d, 12(%rbx)
	movl	%r12d, 16(%rbx)
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L600:
	.cfi_restore_state
	call	vcalloc.part.5
	.cfi_endproc
.LFE103:
	.size	array_clone, .-array_clone
	.section	.text.array_reverse,"ax",@progbits
	.p2align 4,,15
	.globl	array_reverse
	.type	array_reverse, @function
array_reverse:
.LFB108:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdi, %r13
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movl	88(%rsp), %ebp
	cmpl	$1, %ebp
	jle	.L610
	movl	92(%rsp), %edi
	movl	96(%rsp), %eax
	movl	%edi, 4(%rsp)
	movl	%eax, (%rsp)
	imull	%eax, %edi
	testl	%edi, %edi
	jle	.L611
	movslq	%edi, %rdi
	movl	$1, %esi
	xorl	%r15d, %r15d
	call	calloc@PLT
	movslq	(%rsp), %rbx
	leal	-1(%rbp), %ecx
	movq	%rax, %r8
	movq	%rax, 8(%rsp)
	imull	%ebx, %ecx
	movl	%ebx, %r12d
	negl	%r12d
	movslq	%r12d, %r12
	movslq	%ecx, %rcx
	addq	80(%rsp), %rcx
	movq	%rcx, %r14
	.p2align 4,,10
	.p2align 3
.L607:
	movq	%r14, %rsi
	movq	%r8, %rdi
	movq	%rbx, %rdx
	call	memcpy@PLT
	addl	$1, %r15d
	movq	%rax, %r8
	addq	%r12, %r14
	addq	%rbx, %r8
	cmpl	%r15d, %ebp
	jne	.L607
	movq	8(%rsp), %rax
	movl	%ebp, 8(%r13)
	movq	%rax, 0(%r13)
	movl	4(%rsp), %eax
	movl	%eax, 12(%r13)
	movl	(%rsp), %eax
	movl	%eax, 16(%r13)
.L603:
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%r13, %rax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L610:
	.cfi_restore_state
	movq	96(%rsp), %rax
	movdqu	80(%rsp), %xmm0
	movq	%rax, 16(%rdi)
	movups	%xmm0, (%rdi)
	jmp	.L603
.L611:
	call	vcalloc.part.5
	.cfi_endproc
.LFE108:
	.size	array_reverse, .-array_reverse
	.section	.text.make,"ax",@progbits
	.p2align 4,,15
	.globl	make
	.type	make, @function
make:
.LFB87:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movl	%esi, %r13d
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movl	%ecx, %r12d
	movq	%rdi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	testl	%edx, %edx
	je	.L615
	movl	%edx, %edi
	movl	%edx, %ebp
	imull	%ecx, %edi
.L613:
	testl	%edi, %edi
	jle	.L617
	movslq	%edi, %rdi
	movl	$1, %esi
	call	calloc@PLT
	movl	%r13d, 8(%rbx)
	movq	%rax, (%rbx)
	movq	%rbx, %rax
	movl	%ebp, 12(%rbx)
	movl	%r12d, 16(%rbx)
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L615:
	.cfi_restore_state
	movl	%ecx, %edi
	movl	$1, %ebp
	jmp	.L613
.L617:
	call	vcalloc.part.5
	.cfi_endproc
.LFE87:
	.size	make, .-make
	.section	.text.string_ustring,"ax",@progbits
	.p2align 4,,15
	.globl	string_ustring
	.type	string_ustring, @function
string_ustring:
.LFB318:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$104, %rsp
	.cfi_def_cfa_offset 160
	movq	%fs:40, %rax
	movq	%rax, 88(%rsp)
	xorl	%eax, %eax
	testl	%edx, %edx
	movq	%rdi, 8(%rsp)
	movq	%rsi, 32(%rsp)
	movq	%rdx, 40(%rsp)
	je	.L619
	leal	0(,%rdx,4), %edi
	movq	%rdx, %rbx
	testl	%edi, %edi
	jle	.L628
	movq	%rsi, %rbp
	movslq	%edi, %rdi
	movl	$1, %esi
	movl	%edx, %r12d
	call	calloc@PLT
	testl	%ebx, %ebx
	movq	%rax, 48(%rsp)
	movl	$0, 56(%rsp)
	movl	%ebx, 60(%rsp)
	movl	$4, 64(%rsp)
	movl	$0, 72(%rsp)
	jle	.L623
	leaq	28(%rsp), %r15
	leaq	32(%rsp), %r14
	xorl	%r13d, %r13d
	.p2align 4,,10
	.p2align 3
.L622:
	movslq	%r13d, %rdx
	movl	$-452984832, %ebx
	movl	%r13d, 28(%rsp)
	movzbl	0(%rbp,%rdx), %ecx
	leaq	16(%r14), %rdi
	movq	%r15, %rsi
	shrb	$3, %cl
	andl	$30, %ecx
	shrl	%cl, %ebx
	andl	$3, %ebx
	leal	1(%r13,%rbx), %r13d
	call	array_push
	addl	$1, 72(%rsp)
	cmpl	%r13d, %r12d
	jg	.L622
.L623:
	movq	8(%rsp), %rax
	movq	88(%rsp), %rsi
	xorq	%fs:40, %rsi
	movdqa	32(%rsp), %xmm0
	movups	%xmm0, (%rax)
	movdqa	48(%rsp), %xmm0
	movups	%xmm0, 16(%rax)
	movdqa	64(%rsp), %xmm0
	movups	%xmm0, 32(%rax)
	jne	.L629
	addq	$104, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L619:
	.cfi_restore_state
	movl	$1, %esi
	movl	$4, %edi
	call	calloc@PLT
	movq	%rax, 48(%rsp)
	movabsq	$4294967296, %rax
	movl	$4, 64(%rsp)
	movq	%rax, 56(%rsp)
	movl	$0, 72(%rsp)
	jmp	.L623
.L628:
	call	vcalloc.part.5
.L629:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE318:
	.size	string_ustring, .-string_ustring
	.section	.text.array_push_many,"ax",@progbits
	.p2align 4,,15
	.globl	array_push_many
	.type	array_push_many, @function
array_push_many:
.LFB107:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%edx, %ebp
	movq	%rdi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	movq	(%rdi), %r13
	cmpq	%rsi, %r13
	je	.L637
	movq	%rsi, %r12
	movl	8(%rdi), %esi
	addl	%edx, %esi
	call	array_ensure_cap
	movl	16(%rbx), %edx
	movl	8(%rbx), %edi
	movq	%r12, %rsi
	imull	%edx, %edi
	imull	%ebp, %edx
	movslq	%edi, %rdi
	addq	(%rbx), %rdi
	movslq	%edx, %rdx
	call	memcpy@PLT
.L634:
	addl	%ebp, 8(%rbx)
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L637:
	.cfi_restore_state
	movl	12(%rdi), %edi
	imull	16(%rbx), %edi
	cmpl	$0, %edi
	je	.L635
	jle	.L633
	movslq	%edi, %rdi
	movq	%rdi, %r15
.L632:
	movl	$1, %esi
	call	calloc@PLT
	movl	8(%rbx), %r12d
	movq	%r15, %rdx
	movq	%r13, %rsi
	movq	%rax, %rdi
	movq	%rax, %r14
	call	memcpy@PLT
	leal	0(%rbp,%r12), %esi
	movq	%rbx, %rdi
	call	array_ensure_cap
	movl	16(%rbx), %edx
	movl	8(%rbx), %edi
	movq	%r14, %rsi
	imull	%edx, %edi
	imull	%ebp, %edx
	movslq	%edi, %rdi
	addq	(%rbx), %rdi
	movslq	%edx, %rdx
	call	memcpy@PLT
	jmp	.L634
	.p2align 4,,10
	.p2align 3
.L635:
	xorl	%r15d, %r15d
	movl	$1, %edi
	jmp	.L632
.L633:
	call	vcalloc.part.5
	.cfi_endproc
.LFE107:
	.size	array_push_many, .-array_push_many
	.section	.rodata.str1.1
.LC58:
	.string	"Probe overflow"
	.section	.text.map_meta_greater,"ax",@progbits
	.p2align 4,,15
	.globl	map_meta_greater
	.type	map_meta_greater, @function
map_meta_greater:
.LFB214:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	40(%rdi), %rdi
	movl	%esi, %eax
	leaq	(%rdi,%rax,4), %r8
	movl	(%r8), %eax
	testl	%eax, %eax
	je	.L640
	.p2align 4,,10
	.p2align 3
.L639:
	cmpl	%eax, %edx
	jbe	.L641
	movl	%edx, (%r8)
	leal	1(%rsi), %edx
	addl	$2, %esi
	leaq	(%rdi,%rdx,4), %rdx
	movl	(%rdx), %r9d
	movl	%ecx, (%rdx)
	addl	_const_probe_inc(%rip), %eax
	movl	%r9d, %ecx
	movl	%eax, %edx
	movl	%esi, %eax
	leaq	(%rdi,%rax,4), %r8
	movl	(%r8), %eax
	testl	%eax, %eax
	jne	.L639
.L640:
	movl	%edx, (%r8)
	shrl	$24, %edx
	leal	1(%rsi), %eax
	leal	-1(%rdx), %ebx
	movl	%ecx, (%rdi,%rax,4)
	leal	(%rbx,%rbx), %eax
	cmpl	48(%rbp), %eax
	je	.L647
.L638:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L641:
	.cfi_restore_state
	leal	2(%rsi), %eax
	addl	_const_probe_inc(%rip), %edx
	leaq	(%rdi,%rax,4), %r8
	movq	%rax, %rsi
	movl	(%r8), %eax
	testl	%eax, %eax
	jne	.L639
	jmp	.L640
	.p2align 4,,10
	.p2align 3
.L647:
	movl	4(%rbp), %edx
	addl	$4, %eax
	movl	%eax, 48(%rbp)
	leal	2(%rax,%rdx), %r12d
	salq	$2, %r12
	movq	%r12, %rsi
	call	realloc@PLT
	pxor	%xmm0, %xmm0
	cmpl	$252, %ebx
	movq	%rax, 40(%rbp)
	movups	%xmm0, -16(%rax,%r12)
	jne	.L638
	leaq	.LC58(%rip), %rdi
	movl	$14, %esi
	call	v_panic
	.cfi_endproc
.LFE214:
	.size	map_meta_greater, .-map_meta_greater
	.section	.rodata.str1.1
.LC59:
	.string	"tos(): nil string"
	.section	.text.unlikely.tos.part.7,"ax",@progbits
	.type	tos.part.7, @function
tos.part.7:
.LFB537:
	.cfi_startproc
	leaq	.LC59(%rip), %rdi
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$17, %esi
	call	v_panic
	.cfi_endproc
.LFE537:
	.size	tos.part.7, .-tos.part.7
	.section	.text.tos,"ax",@progbits
	.p2align 4,,15
	.globl	tos
	.type	tos, @function
tos:
.LFB252:
	.cfi_startproc
	testq	%rdi, %rdi
	je	.L655
	movl	%esi, %edx
	movq	%rdi, %rax
	ret
.L655:
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	call	tos.part.7
	.cfi_endproc
.LFE252:
	.size	tos, .-tos
	.section	.rodata.str1.1
.LC60:
	.string	"{}"
.LC61:
	.string	"{"
.LC62:
	.string	"}"
	.section	.text.map_string_str,"ax",@progbits
	.p2align 4,,15
	.globl	map_string_str
	.type	map_string_str, @function
map_string_str:
.LFB225:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$72, %rsp
	.cfi_def_cfa_offset 96
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	movl	148(%rsp), %eax
	testl	%eax, %eax
	jne	.L657
	leaq	.LC60(%rip), %rax
	movl	$2, %edx
.L658:
	movq	56(%rsp), %rcx
	xorq	%fs:40, %rcx
	jne	.L662
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L657:
	.cfi_restore_state
	leaq	16(%rsp), %rbx
	movl	$1, %esi
	movl	$50, %edi
	call	calloc@PLT
	leaq	15(%rsp), %rbp
	leaq	.LC61(%rip), %rsi
	movl	$1, %edx
	movq	%rax, 16(%rsp)
	movq	%rbx, %rdi
	movabsq	$214748364800, %rax
	movq	%rax, 24(%rsp)
	movq	%rax, 40(%rsp)
	movl	$1, 32(%rsp)
	call	array_push_many
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	movb	$10, 15(%rsp)
	call	array_push
	leaq	.LC62(%rip), %rsi
	movl	$1, %edx
	movq	%rbx, %rdi
	addl	$2, 40(%rsp)
	call	array_push_many
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	movb	$10, 15(%rsp)
	call	array_push
	movq	%rbp, %rsi
	movq	%rbx, %rdi
	addl	$2, 40(%rsp)
	movb	$0, 15(%rsp)
	call	array_push
	movq	16(%rsp), %rax
	movl	40(%rsp), %edx
	testq	%rax, %rax
	jne	.L658
	call	tos.part.7
.L662:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE225:
	.size	map_string_str, .-map_string_str
	.section	.rodata.str1.1
.LC63:
	.string	"tos2: nil string"
	.section	.text.unlikely.tos2.part.8,"ax",@progbits
	.type	tos2.part.8, @function
tos2.part.8:
.LFB538:
	.cfi_startproc
	leaq	.LC63(%rip), %rdi
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$16, %esi
	call	v_panic
	.cfi_endproc
.LFE538:
	.size	tos2.part.8, .-tos2.part.8
	.section	.text.tos2,"ax",@progbits
	.p2align 4,,15
	.globl	tos2
	.type	tos2, @function
tos2:
.LFB254:
	.cfi_startproc
	testq	%rdi, %rdi
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	je	.L668
	movq	%rdi, %rbx
	call	strlen@PLT
	movl	%eax, %edx
	movq	%rbx, %rax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L668:
	.cfi_restore_state
	call	tos2.part.8
	.cfi_endproc
.LFE254:
	.size	tos2, .-tos2
	.section	.rodata.str1.8
	.align 8
.LC64:
	.string	"Use `string.is_space` instead of `string.is_white"
	.section	.text.byte_is_white,"ax",@progbits
	.p2align 4,,15
	.globl	byte_is_white
	.type	byte_is_white, @function
byte_is_white:
.LFB349:
	.cfi_startproc
	leaq	.LC64(%rip), %rdi
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$49, %esi
	call	v_panic
	.cfi_endproc
.LFE349:
	.size	byte_is_white, .-byte_is_white
	.section	.text.map_rehash,"ax",@progbits
	.p2align 4,,15
	.globl	map_rehash
	.type	map_rehash, @function
map_rehash:
.LFB217:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rdi, %rbp
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	movl	48(%rdi), %eax
	addl	4(%rdi), %eax
	movq	40(%rdi), %rdi
	leal	8(,%rax,4), %ebx
	movslq	%ebx, %rbx
	movq	%rbx, %rsi
	call	realloc@PLT
	xorl	%esi, %esi
	movq	%rax, 40(%rbp)
	movq	%rbx, %rdx
	movq	%rax, %rdi
	call	memset@PLT
	movl	20(%rbp), %ecx
	testl	%ecx, %ecx
	je	.L671
	xorl	%r12d, %r12d
	.p2align 4,,10
	.p2align 3
.L684:
	movl	%r12d, %eax
	leaq	(%rax,%rax,2), %rdx
	movq	32(%rbp), %rax
	leaq	(%rax,%rdx,8), %rax
	movq	(%rax), %rdi
	testq	%rdi, %rdi
	je	.L673
	movslq	8(%rax), %rsi
	xorl	%edx, %edx
	call	wyhash
	movzbl	9(%rbp), %ecx
	movl	%eax, %r9d
	andl	4(%rbp), %r9d
	movl	_const_probe_inc(%rip), %r8d
	movq	40(%rbp), %rdi
	shrq	%cl, %rax
	andl	_const_hash_mask(%rip), %eax
	movl	%r9d, %esi
	orl	%r8d, %eax
	cmpl	(%rdi,%r9,4), %eax
	movl	%eax, %edx
	jnb	.L674
	.p2align 4,,10
	.p2align 3
.L675:
	leal	2(%rsi), %eax
	addl	%r8d, %edx
	leaq	(%rdi,%rax,4), %rcx
	movq	%rax, %rsi
	movl	(%rcx), %eax
	cmpl	%eax, %edx
	jb	.L675
.L676:
	testl	%eax, %eax
	movl	%r12d, %r9d
	je	.L678
	.p2align 4,,10
	.p2align 3
.L677:
	cmpl	%edx, %eax
	jnb	.L679
	movl	%edx, (%rcx)
	leal	1(%rsi), %edx
	addl	$2, %esi
	leaq	(%rdi,%rdx,4), %rdx
	movl	(%rdx), %r10d
	movl	%r9d, (%rdx)
	movl	_const_probe_inc(%rip), %r8d
	movl	%r10d, %r9d
	leal	(%rax,%r8), %edx
	movl	%esi, %eax
	leaq	(%rdi,%rax,4), %rcx
	movl	(%rcx), %eax
	testl	%eax, %eax
	jne	.L677
.L678:
	movl	%edx, (%rcx)
	shrl	$24, %edx
	leal	1(%rsi), %eax
	leal	-1(%rdx), %ebx
	movl	%r9d, (%rdi,%rax,4)
	leal	(%rbx,%rbx), %eax
	cmpl	48(%rbp), %eax
	je	.L682
.L697:
	movl	20(%rbp), %ecx
.L673:
	addl	$1, %r12d
	cmpl	%ecx, %r12d
	jb	.L684
.L671:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L679:
	.cfi_restore_state
	leal	2(%rsi), %eax
	addl	%r8d, %edx
	leaq	(%rdi,%rax,4), %rcx
	movq	%rax, %rsi
	movl	(%rcx), %eax
	testl	%eax, %eax
	jne	.L677
	jmp	.L678
	.p2align 4,,10
	.p2align 3
.L682:
	movl	4(%rbp), %edx
	addl	$4, %eax
	movl	%eax, 48(%rbp)
	leal	2(%rax,%rdx), %r13d
	salq	$2, %r13
	movq	%r13, %rsi
	call	realloc@PLT
	pxor	%xmm0, %xmm0
	cmpl	$252, %ebx
	movq	%rax, 40(%rbp)
	movups	%xmm0, -16(%rax,%r13)
	jne	.L697
	leaq	.LC58(%rip), %rdi
	movl	$14, %esi
	call	v_panic
	.p2align 4,,10
	.p2align 3
.L674:
	leaq	(%rdi,%r9,4), %rcx
	movl	(%rcx), %eax
	jmp	.L676
	.cfi_endproc
.LFE217:
	.size	map_rehash, .-map_rehash
	.section	.text.map_delete,"ax",@progbits
	.p2align 4,,15
	.globl	map_delete
	.type	map_delete, @function
map_delete:
.LFB221:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	movq	%rdi, 24(%rsp)
	movq	%rsi, 8(%rsp)
	movq	%rsi, %rdi
	movslq	%edx, %rsi
	xorl	%edx, %edx
	call	wyhash
	movq	%rbx, %rsi
	movl	%eax, %edx
	andl	4(%rbx), %edx
	movzbl	9(%rsi), %ecx
	movl	_const_probe_inc(%rip), %r15d
	movq	40(%rsi), %r12
	movl	%edx, %ebx
	shrq	%cl, %rax
	andl	_const_hash_mask(%rip), %eax
	orl	%r15d, %eax
	cmpl	(%r12,%rdx,4), %eax
	movl	%eax, %ebp
	jnb	.L699
	.p2align 4,,10
	.p2align 3
.L700:
	leal	2(%rbx), %eax
	addl	%r15d, %ebp
	movq	%rax, %rbx
	movl	(%r12,%rax,4), %eax
	cmpl	%eax, %ebp
	jb	.L700
.L701:
	cmpl	%eax, %ebp
	jne	.L698
	movq	24(%rsp), %rax
	movq	32(%rax), %rax
	movq	%rax, 16(%rsp)
	jmp	.L707
	.p2align 4,,10
	.p2align 3
.L703:
	addl	%r15d, %ebp
	movl	%edx, %ebx
	cmpl	%ecx, %ebp
	jne	.L698
.L707:
	leal	1(%rbx), %eax
	movq	16(%rsp), %rdi
	movq	%rax, %r14
	movl	(%r12,%rax,4), %eax
	leaq	(%rax,%rax,2), %rax
	leaq	(%rdi,%rax,8), %r13
	movq	8(%rsp), %rdi
	movq	0(%r13), %rsi
	call	strcmp@PLT
	leal	2(%rbx), %ecx
	testl	%eax, %eax
	movq	%rcx, %rdx
	movl	(%r12,%rcx,4), %ecx
	jne	.L703
	cmpl	$33554431, %ecx
	ja	.L705
	jmp	.L708
	.p2align 4,,10
	.p2align 3
.L712:
	movl	%edx, %ebx
	movl	_const_probe_inc(%rip), %r15d
	movl	%eax, %edx
	leal	1(%rbx), %r14d
.L705:
	subl	%r15d, %ecx
	movl	%ebx, %eax
	movl	%r14d, %r8d
	movl	%ecx, (%r12,%rax,4)
	leal	3(%rbx), %eax
	leal	2(%rdx), %ecx
	movl	(%r12,%rax,4), %eax
	movl	%eax, (%r12,%r8,4)
	movq	%rcx, %rax
	movl	(%r12,%rcx,4), %ecx
	cmpl	$33554431, %ecx
	ja	.L712
.L704:
	movq	24(%rsp), %rsi
	pxor	%xmm0, %xmm0
	subl	$1, 52(%rsi)
	movl	$0, (%r12,%rdx,4)
	addl	$1, 24(%rsi)
	movq	$0, 16(%r13)
	movups	%xmm0, 0(%r13)
	movl	20(%rsi), %eax
	cmpl	$32, %eax
	jbe	.L698
	shrl	%eax
	cmpl	%eax, 24(%rsi)
	jnb	.L713
.L698:
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L713:
	.cfi_restore_state
	leaq	16(%rsi), %rdi
	movq	%rsi, %rbx
	call	DenseArray_zeros_to_end
	movq	%rbx, %rdi
	call	map_rehash
	movl	$0, 24(%rbx)
	jmp	.L698
	.p2align 4,,10
	.p2align 3
.L699:
	movl	(%r12,%rdx,4), %eax
	jmp	.L701
	.p2align 4,,10
	.p2align 3
.L708:
	movl	%ebx, %edx
	jmp	.L704
	.cfi_endproc
.LFE221:
	.size	map_delete, .-map_delete
	.section	.text.map_cached_rehash,"ax",@progbits
	.p2align 4,,15
	.globl	map_cached_rehash
	.type	map_cached_rehash, @function
map_cached_rehash:
.LFB218:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	movl	48(%rdi), %r14d
	movl	4(%rdi), %eax
	movq	40(%rdi), %r13
	addl	%r14d, %eax
	leal	8(,%rax,4), %edi
	testl	%edi, %edi
	jle	.L733
	movl	%esi, %ebx
	movslq	%edi, %rdi
	movl	$1, %esi
	call	calloc@PLT
	addl	%ebx, %r14d
	movq	%rax, 40(%r12)
	xorl	%ebp, %ebp
	.p2align 4,,10
	.p2align 3
.L724:
	movl	%ebp, %eax
	movl	0(%r13,%rax,4), %eax
	testl	%eax, %eax
	je	.L716
	movl	%eax, %edx
	movl	4(%r12), %esi
	movl	%ebp, %ebx
	shrl	$24, %edx
	movq	40(%r12), %rdi
	movl	_const_probe_inc(%rip), %r8d
	leal	-2(%rdx,%rdx), %edx
	movl	%esi, %ecx
	subl	%edx, %ebx
	shrl	%ecx
	movl	%ebx, %edx
	movl	%eax, %ebx
	andl	_const_hash_mask(%rip), %eax
	andl	%ecx, %edx
	movzbl	9(%r12), %ecx
	orl	%r8d, %eax
	sall	%cl, %ebx
	orl	%ebx, %edx
	andl	%edx, %esi
	movl	%esi, %edx
	leaq	(%rdi,%rdx,4), %rcx
	movl	(%rcx), %edx
	cmpl	%edx, %eax
	jnb	.L717
	.p2align 4,,10
	.p2align 3
.L718:
	leal	2(%rsi), %edx
	addl	%r8d, %eax
	leaq	(%rdi,%rdx,4), %rcx
	movq	%rdx, %rsi
	movl	(%rcx), %edx
	cmpl	%edx, %eax
	jb	.L718
.L717:
	leal	1(%rbp), %r9d
	testl	%edx, %edx
	movl	0(%r13,%r9,4), %r9d
	je	.L720
	.p2align 4,,10
	.p2align 3
.L719:
	cmpl	%eax, %edx
	jnb	.L721
	movl	%eax, (%rcx)
	leal	1(%rsi), %eax
	addl	$2, %esi
	leaq	(%rdi,%rax,4), %rax
	movl	(%rax), %r10d
	movl	%r9d, (%rax)
	movl	_const_probe_inc(%rip), %r8d
	movl	%r10d, %r9d
	leal	(%rdx,%r8), %eax
	movl	%esi, %edx
	leaq	(%rdi,%rdx,4), %rcx
	movl	(%rcx), %edx
	testl	%edx, %edx
	jne	.L719
.L720:
	movl	%eax, (%rcx)
	shrl	$24, %eax
	leal	1(%rsi), %edx
	leal	-1(%rax), %ebx
	movl	%r9d, (%rdi,%rdx,4)
	leal	(%rbx,%rbx), %eax
	cmpl	48(%r12), %eax
	je	.L734
.L716:
	addl	$2, %ebp
	cmpl	%r14d, %ebp
	jbe	.L724
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%r13, %rdi
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	free@PLT
	.p2align 4,,10
	.p2align 3
.L721:
	.cfi_restore_state
	leal	2(%rsi), %edx
	addl	%r8d, %eax
	leaq	(%rdi,%rdx,4), %rcx
	movq	%rdx, %rsi
	movl	(%rcx), %edx
	testl	%edx, %edx
	jne	.L719
	jmp	.L720
	.p2align 4,,10
	.p2align 3
.L734:
	movl	4(%r12), %edx
	addl	$4, %eax
	movl	%eax, 48(%r12)
	leal	2(%rax,%rdx), %r15d
	salq	$2, %r15
	movq	%r15, %rsi
	call	realloc@PLT
	pxor	%xmm0, %xmm0
	cmpl	$252, %ebx
	movq	%rax, 40(%r12)
	movups	%xmm0, -16(%rax,%r15)
	jne	.L716
	leaq	.LC58(%rip), %rdi
	movl	$14, %esi
	call	v_panic
.L733:
	call	vcalloc.part.5
	.cfi_endproc
.LFE218:
	.size	map_cached_rehash, .-map_cached_rehash
	.section	.text.map_expand,"ax",@progbits
	.p2align 4,,15
	.globl	map_expand
	.type	map_expand, @function
map_expand:
.LFB216:
	.cfi_startproc
	movl	4(%rdi), %esi
	cmpb	$0, 8(%rdi)
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	leal	2(%rsi,%rsi), %eax
	movl	%eax, 4(%rdi)
	je	.L739
	call	map_cached_rehash
	subb	$1, 8(%rbx)
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L739:
	.cfi_restore_state
	addb	$16, 9(%rdi)
	movb	$16, 8(%rdi)
	call	map_rehash
	subb	$1, 8(%rbx)
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE216:
	.size	map_expand, .-map_expand
	.section	.text._STR,"ax",@progbits
	.p2align 4,,15
	.globl	_STR
	.type	_STR, @function
_STR:
.LFB84:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$208, %rsp
	.cfi_def_cfa_offset 240
	testb	%al, %al
	movq	%rsi, 40(%rsp)
	movq	%rdx, 48(%rsp)
	movq	%rcx, 56(%rsp)
	movq	%r8, 64(%rsp)
	movq	%r9, 72(%rsp)
	je	.L741
	movaps	%xmm0, 80(%rsp)
	movaps	%xmm1, 96(%rsp)
	movaps	%xmm2, 112(%rsp)
	movaps	%xmm3, 128(%rsp)
	movaps	%xmm4, 144(%rsp)
	movaps	%xmm5, 160(%rsp)
	movaps	%xmm6, 176(%rsp)
	movaps	%xmm7, 192(%rsp)
.L741:
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	leaq	240(%rsp), %rax
	movq	%rsp, %r12
	movq	%rbp, %r8
	movq	%r12, %r9
	movq	$-1, %rcx
	movl	$1, %edx
	movq	%rax, 8(%rsp)
	leaq	32(%rsp), %rax
	xorl	%esi, %esi
	xorl	%edi, %edi
	movl	$8, (%rsp)
	movl	$48, 4(%rsp)
	movq	%rax, 16(%rsp)
	call	__vsnprintf_chk@PLT
	leal	1(%rax), %edi
	movslq	%edi, %rdi
	call	malloc@PLT
	movq	%rax, %rbx
	leaq	240(%rsp), %rax
	movq	$-1, %rdx
	movq	%r12, %r8
	movq	%rbp, %rcx
	movl	$1, %esi
	movq	%rax, 8(%rsp)
	leaq	32(%rsp), %rax
	movq	%rbx, %rdi
	movl	$8, (%rsp)
	movl	$48, 4(%rsp)
	movq	%rax, 16(%rsp)
	call	__vsprintf_chk@PLT
	movq	%rbx, %rdx
.L742:
	movl	(%rdx), %ecx
	addq	$4, %rdx
	leal	-16843009(%rcx), %eax
	notl	%ecx
	andl	%ecx, %eax
	andl	$-2139062144, %eax
	je	.L742
	movl	%eax, %ecx
	shrl	$16, %ecx
	testl	$32896, %eax
	cmove	%ecx, %eax
	leaq	2(%rdx), %rcx
	movl	%eax, %esi
	cmove	%rcx, %rdx
	addb	%al, %sil
	movq	%rbx, %rax
	sbbq	$3, %rdx
	subl	%ebx, %edx
	movq	24(%rsp), %rsi
	xorq	%fs:40, %rsi
	jne	.L748
	addq	$208, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L748:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE84:
	.size	_STR, .-_STR
	.section	.rodata.str1.8
	.align 8
.LC65:
	.string	"array.repeat: count is negative: %d"
	.section	.text.array_repeat,"ax",@progbits
	.p2align 4,,15
	.globl	array_repeat
	.type	array_repeat, @function
array_repeat:
.LFB91:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%esi, %ebp
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	testl	%esi, %esi
	movl	88(%rsp), %ebx
	movl	96(%rsp), %r14d
	js	.L761
	movl	%esi, %eax
	movq	%rdi, %r13
	imull	%ebx, %eax
	movl	%eax, %edi
	movl	%eax, 4(%rsp)
	imull	%r14d, %edi
	testl	%edi, %edi
	cmove	%r14d, %edi
	testl	%edi, %edi
	jle	.L762
	movslq	%edi, %rdi
	movl	$1, %esi
	call	calloc@PLT
	testl	%ebp, %ebp
	movq	%rax, 8(%rsp)
	je	.L753
	imull	%r14d, %ebx
	movq	80(%rsp), %r12
	movq	%rax, %r8
	xorl	%r15d, %r15d
	movslq	%ebx, %rbx
	.p2align 4,,10
	.p2align 3
.L754:
	movq	%r8, %rdi
	movq	%rbx, %rdx
	movq	%r12, %rsi
	call	memcpy@PLT
	addl	$1, %r15d
	movq	%rax, %r8
	addq	%rbx, %r8
	cmpl	%r15d, %ebp
	jne	.L754
.L753:
	movq	8(%rsp), %rax
	movl	%r14d, 16(%r13)
	movq	%rax, 0(%r13)
	movl	4(%rsp), %eax
	movl	%eax, 8(%r13)
	movl	%eax, 12(%r13)
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	movq	%r13, %rax
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L761:
	.cfi_restore_state
	leaq	.LC65(%rip), %rdi
	xorl	%eax, %eax
	call	_STR
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	v_panic
.L762:
	call	vcalloc.part.5
	.cfi_endproc
.LFE91:
	.size	array_repeat, .-array_repeat
	.section	.rodata.str1.8
	.align 8
.LC66:
	.string	"array.insert: index out of range (i == %d, a.len == %d)"
	.section	.text.array_insert,"ax",@progbits
	.p2align 4,,15
	.globl	array_insert
	.type	array_insert, @function
array_insert:
.LFB93:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movl	%esi, %r13d
	testl	%r13d, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movl	8(%rdi), %esi
	js	.L764
	cmpl	%esi, %r13d
	jg	.L764
	movq	%rdi, %rbx
	addl	$1, %esi
	movq	%rdx, %r12
	call	array_ensure_cap
	movl	16(%rbx), %ebp
	movl	8(%rbx), %edx
	movl	%r13d, %eax
	movq	(%rbx), %rdi
	imull	%ebp, %eax
	subl	%r13d, %edx
	imull	%ebp, %edx
	movslq	%eax, %r14
	addl	%ebp, %eax
	leaq	(%rdi,%r14), %rsi
	cltq
	movslq	%edx, %rdx
	addq	%rax, %rdi
	call	memmove@PLT
	movq	(%rbx), %rdi
	movslq	%ebp, %rdx
	movq	%r12, %rsi
	addq	%r14, %rdi
	call	memcpy@PLT
	addl	$1, 8(%rbx)
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
.L764:
	.cfi_restore_state
	leaq	.LC66(%rip), %rdi
	movl	%esi, %edx
	xorl	%eax, %eax
	movl	%r13d, %esi
	call	_STR
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	v_panic
	.cfi_endproc
.LFE93:
	.size	array_insert, .-array_insert
	.section	.rodata.str1.8
	.align 8
.LC67:
	.string	"array.delete: index out of range (i == %d, a.len == %d)"
	.section	.text.array_delete,"ax",@progbits
	.p2align 4,,15
	.globl	array_delete
	.type	array_delete, @function
array_delete:
.LFB95:
	.cfi_startproc
	testl	%esi, %esi
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	8(%rdi), %edx
	js	.L768
	cmpl	%edx, %esi
	jge	.L768
	movl	16(%rdi), %ecx
	leal	1(%rsi), %eax
	subl	%esi, %edx
	movq	%rdi, %rbx
	movq	(%rdi), %rdi
	imull	%ecx, %eax
	imull	%ecx, %edx
	movslq	%eax, %rsi
	subl	%ecx, %eax
	cltq
	addq	%rdi, %rsi
	movslq	%edx, %rdx
	addq	%rax, %rdi
	call	memmove@PLT
	subl	$1, 8(%rbx)
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L768:
	.cfi_restore_state
	leaq	.LC67(%rip), %rdi
	xorl	%eax, %eax
	call	_STR
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	v_panic
	.cfi_endproc
.LFE95:
	.size	array_delete, .-array_delete
	.section	.rodata.str1.8
	.align 8
.LC68:
	.string	"array.get: index out of range (i == %d, a.len == %d)"
	.section	.text.array_get,"ax",@progbits
	.p2align 4,,15
	.globl	array_get
	.type	array_get, @function
array_get:
.LFB98:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	24(%rsp), %edx
	cmpl	%edx, %edi
	jge	.L774
	testl	%edi, %edi
	js	.L774
	imull	32(%rsp), %edi
	movslq	%edi, %rax
	addq	16(%rsp), %rax
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L774:
	.cfi_restore_state
	movl	%edi, %esi
	leaq	.LC68(%rip), %rdi
	xorl	%eax, %eax
	call	_STR
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	v_panic
	.cfi_endproc
.LFE98:
	.size	array_get, .-array_get
	.section	.text.string_ustring_tmp,"ax",@progbits
	.p2align 4,,15
	.globl	string_ustring_tmp
	.type	string_ustring_tmp, @function
string_ustring_tmp:
.LFB319:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rsi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%edx, %ebp
	subq	$88, %rsp
	.cfi_def_cfa_offset 144
	movl	8+g_ustring_runes(%rip), %eax
	movq	%rdi, 24(%rsp)
	movq	%rdx, 16(%rsp)
	testl	%eax, %eax
	je	.L777
	movl	12+g_ustring_runes(%rip), %eax
	movq	g_ustring_runes(%rip), %r13
	movl	%eax, 12(%rsp)
	movl	16+g_ustring_runes(%rip), %eax
	movl	%eax, 8(%rsp)
.L778:
	movq	16+g_ustring_runes(%rip), %rax
	testl	%edx, %edx
	movq	%r12, 32(%rsp)
	movdqu	g_ustring_runes(%rip), %xmm0
	movq	%rdx, 40(%rsp)
	movaps	%xmm0, 48(%rsp)
	movq	%rax, 64(%rsp)
	jle	.L781
	xorl	%r14d, %r14d
	xorl	%r15d, %r15d
	.p2align 4,,10
	.p2align 3
.L780:
	movslq	%r14d, %rax
	subq	$8, %rsp
	.cfi_def_cfa_offset 152
	movl	$-452984832, %ebx
	movzbl	(%r12,%rax), %ecx
	movl	20(%rsp), %eax
	movl	%r15d, %edi
	movq	%r13, 56(%rsp)
	movl	%ebp, 64(%rsp)
	addl	$1, %r15d
	movl	%eax, 68(%rsp)
	movl	16(%rsp), %eax
	shrb	$3, %cl
	andl	$30, %ecx
	movl	%eax, 72(%rsp)
	shrl	%cl, %ebx
	pushq	72(%rsp)
	.cfi_def_cfa_offset 160
	pushq	72(%rsp)
	.cfi_def_cfa_offset 168
	pushq	%r13
	.cfi_def_cfa_offset 176
	andl	$3, %ebx
	call	array_get
	movl	%r14d, (%rax)
	leal	1(%r14,%rbx), %r14d
	addq	$32, %rsp
	.cfi_def_cfa_offset 144
	cmpl	%r14d, %ebp
	jg	.L780
	movq	16(%rsp), %rax
.L779:
	movl	%eax, 40(%rsp)
	movl	%eax, 56(%rsp)
	movl	12(%rsp), %eax
	movq	%r12, 32(%rsp)
	movdqa	32(%rsp), %xmm0
	movq	%r13, 48(%rsp)
	movl	%r15d, 72(%rsp)
	movl	%eax, 60(%rsp)
	movl	8(%rsp), %eax
	movl	%eax, 64(%rsp)
	movq	24(%rsp), %rax
	movups	%xmm0, (%rax)
	movdqa	48(%rsp), %xmm0
	movups	%xmm0, 16(%rax)
	movdqa	64(%rsp), %xmm0
	movups	%xmm0, 32(%rax)
	addq	$88, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L777:
	.cfi_restore_state
	movl	$1, %esi
	movl	$512, %edi
	call	calloc@PLT
	movq	%rax, %r13
	movq	%rax, g_ustring_runes(%rip)
	movabsq	$549755813888, %rax
	movq	%rax, 8+g_ustring_runes(%rip)
	movl	$4, 16+g_ustring_runes(%rip)
	movl	$4, 8(%rsp)
	movl	$128, 12(%rsp)
	movq	16(%rsp), %rdx
	jmp	.L778
	.p2align 4,,10
	.p2align 3
.L781:
	xorl	%r15d, %r15d
	movq	%rdx, %rax
	jmp	.L779
	.cfi_endproc
.LFE319:
	.size	string_ustring_tmp, .-string_ustring_tmp
	.section	.rodata.str1.8
	.align 8
.LC69:
	.string	"array.slice: invalid slice index (%d > %d)"
	.align 8
.LC70:
	.string	"array.slice: slice bounds out of range (%d >= %d)"
	.align 8
.LC71:
	.string	"array.slice: slice bounds out of range (%d < 0)"
	.section	.text.array_slice,"ax",@progbits
	.p2align 4,,15
	.globl	array_slice
	.type	array_slice, @function
array_slice:
.LFB101:
	.cfi_startproc
	movl	%edx, %ecx
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	cmpl	%esi, %ecx
	movl	24(%rsp), %edx
	movl	32(%rsp), %eax
	jl	.L790
	cmpl	%edx, %ecx
	jg	.L791
	testl	%esi, %esi
	js	.L792
	movl	%ecx, %edx
	movl	%eax, 16(%rdi)
	subl	%esi, %edx
	imull	%eax, %esi
	movl	%edx, 8(%rdi)
	movl	%edx, 12(%rdi)
	movq	%rdi, %rax
	movslq	%esi, %rcx
	addq	16(%rsp), %rcx
	movq	%rcx, (%rdi)
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L790:
	.cfi_restore_state
	leaq	.LC69(%rip), %rdi
	movl	%ecx, %edx
.L789:
	xorl	%eax, %eax
	call	_STR
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	v_panic
.L792:
	leaq	.LC71(%rip), %rdi
	xorl	%eax, %eax
	call	_STR
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	v_panic
.L791:
	movl	%ecx, %esi
	leaq	.LC70(%rip), %rdi
	jmp	.L789
	.cfi_endproc
.LFE101:
	.size	array_slice, .-array_slice
	.section	.text.array_slice_clone,"ax",@progbits
	.p2align 4,,15
	.globl	array_slice_clone
	.type	array_slice_clone, @function
array_slice_clone:
.LFB104:
	.cfi_startproc
	cmpl	%edx, %ecx
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	movl	%edx, %eax
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	jl	.L802
	movl	8(%rsi), %edx
	cmpl	%ecx, %edx
	jl	.L803
	testl	%eax, %eax
	js	.L804
	movl	16(%rsi), %r13d
	subl	%eax, %ecx
	movq	%rdi, %r12
	movl	%ecx, %ebp
	movl	%r13d, %edi
	imull	%r13d, %eax
	imull	%ecx, %edi
	movslq	%eax, %rbx
	addq	(%rsi), %rbx
	cmpl	$0, %edi
	je	.L799
	jle	.L798
	movslq	%edi, %rdi
	movq	%rdi, %r14
.L797:
	movl	$1, %esi
	call	calloc@PLT
	movq	%r14, %rdx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	memcpy@PLT
	movl	%ebp, 8(%r12)
	movq	%rax, (%r12)
	movq	%r12, %rax
	movl	%ebp, 12(%r12)
	movl	%r13d, 16(%r12)
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L799:
	.cfi_restore_state
	xorl	%r14d, %r14d
	movl	$1, %edi
	jmp	.L797
.L798:
	call	vcalloc.part.5
.L804:
	leaq	.LC71(%rip), %rdi
	movl	%eax, %esi
	xorl	%eax, %eax
	call	_STR
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	v_panic
.L803:
	leaq	.LC70(%rip), %rdi
	movl	%ecx, %esi
.L801:
	xorl	%eax, %eax
	call	_STR
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	v_panic
.L802:
	movl	%ecx, %edx
	movl	%eax, %esi
	leaq	.LC69(%rip), %rdi
	jmp	.L801
	.cfi_endproc
.LFE104:
	.size	array_slice_clone, .-array_slice_clone
	.section	.rodata.str1.8
	.align 8
.LC72:
	.string	"array.set: index out of range (i == %d, a.len == %d)"
	.section	.text.array_set,"ax",@progbits
	.p2align 4,,15
	.globl	array_set
	.type	array_set, @function
array_set:
.LFB105:
	.cfi_startproc
	testl	%esi, %esi
	movq	%rdx, %rcx
	movl	8(%rdi), %edx
	js	.L806
	cmpl	%edx, %esi
	jge	.L806
	movslq	16(%rdi), %rdx
	imull	%edx, %esi
	movslq	%esi, %rax
	addq	(%rdi), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	jmp	memcpy@PLT
.L806:
	leaq	.LC72(%rip), %rdi
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
	call	_STR
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	v_panic
	.cfi_endproc
.LFE105:
	.size	array_set, .-array_set
	.section	.text.map_keys,"ax",@progbits
	.p2align 4,,15
	.globl	map_keys
	.type	map_keys, @function
map_keys:
.LFB222:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	$16, %ecx
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rsi, %r14
	movl	$1, %edx
	subq	$120, %rsp
	.cfi_def_cfa_offset 176
	movl	52(%rsi), %ebx
	movl	$1, %esi
	movq	%fs:40, %rax
	movq	%rax, 104(%rsp)
	xorl	%eax, %eax
	leaq	32(%rsp), %rdi
	leaq	.LC37(%rip), %rax
	leaq	64(%rsp), %r8
	movl	$0, 72(%rsp)
	movq	%rsp, %rbp
	movq	%rax, 64(%rsp)
	call	new_array_from_c_array
	subq	$8, %rsp
	.cfi_def_cfa_offset 184
	movl	%ebx, %esi
	movq	%rbp, %rdi
	pushq	56(%rsp)
	.cfi_def_cfa_offset 192
	pushq	56(%rsp)
	.cfi_def_cfa_offset 200
	pushq	56(%rsp)
	.cfi_def_cfa_offset 208
	call	array_repeat
	movl	(%r14), %eax
	addq	$32, %rsp
	.cfi_def_cfa_offset 176
	testl	%eax, %eax
	je	.L811
	movl	20(%r14), %edx
	testl	%edx, %edx
	je	.L811
	movq	32(%r14), %rcx
	leaq	80(%rsp), %r13
	xorl	%ebx, %ebx
	xorl	%r15d, %r15d
.L812:
	movl	%ebx, %eax
	leaq	(%rax,%rax,2), %rax
	leaq	(%rcx,%rax,8), %rax
	cmpq	$0, (%rax)
	je	.L814
.L821:
	movdqu	(%rax), %xmm0
	movq	%r13, %rdx
	movl	%r15d, %esi
	movq	%rbp, %rdi
	addl	$1, %ebx
	addl	$1, %r15d
	movaps	%xmm0, 80(%rsp)
	call	array_set
	movl	20(%r14), %edx
	cmpl	%edx, %ebx
	jnb	.L811
	movq	32(%r14), %rcx
	movl	%ebx, %eax
	leaq	(%rax,%rax,2), %rax
	leaq	(%rcx,%rax,8), %rax
	cmpq	$0, (%rax)
	jne	.L821
.L814:
	addl	$1, %ebx
	cmpl	%edx, %ebx
	jb	.L812
	.p2align 4,,10
	.p2align 3
.L811:
	movq	16(%rsp), %rax
	movdqa	(%rsp), %xmm0
	movq	104(%rsp), %rsi
	xorq	%fs:40, %rsi
	movq	%rax, 16(%r12)
	movq	%r12, %rax
	movups	%xmm0, (%r12)
	jne	.L822
	addq	$120, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L822:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE222:
	.size	map_keys, .-map_keys
	.section	.rodata.str1.1
.LC73:
	.string	"malloc(<=0)"
.LC74:
	.string	"malloc(%d) failed"
	.section	.text.v_malloc,"ax",@progbits
	.p2align 4,,15
	.globl	v_malloc
	.type	v_malloc, @function
v_malloc:
.LFB137:
	.cfi_startproc
	testl	%edi, %edi
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	jle	.L827
	movl	%edi, %ebx
	movslq	%edi, %rdi
	call	malloc@PLT
	testq	%rax, %rax
	je	.L828
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L827:
	.cfi_restore_state
	leaq	.LC73(%rip), %rdi
	movl	$11, %esi
	call	v_panic
.L828:
	leaq	.LC74(%rip), %rdi
	movl	%ebx, %esi
	call	_STR
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	v_panic
	.cfi_endproc
.LFE137:
	.size	v_malloc, .-v_malloc
	.section	.text.array_byte_hex,"ax",@progbits
	.p2align 4,,15
	.globl	array_byte_hex
	.type	array_byte_hex, @function
array_byte_hex:
.LFB113:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	24(%rsp), %ebx
	leal	1(%rbx,%rbx), %edi
	call	v_malloc
	testl	%ebx, %ebx
	jle	.L849
	movq	16(%rsp), %r9
	movslq	%ebx, %rdx
	leaq	(%rax,%rdx,2), %rcx
	cmpq	%rcx, %r9
	setnb	%cl
	addq	%r9, %rdx
	cmpq	%rdx, %rax
	setnb	%dl
	orb	%dl, %cl
	je	.L831
	cmpl	$15, %ebx
	jbe	.L831
	pxor	%xmm2, %xmm2
	movl	%ebx, %edi
	movq	%r9, %rsi
	movdqa	.LC75(%rip), %xmm6
	shrl	$4, %edi
	movq	%rax, %rdx
	xorl	%ecx, %ecx
	movdqa	.LC76(%rip), %xmm5
	movdqa	.LC77(%rip), %xmm4
	movdqa	.LC78(%rip), %xmm3
	movdqa	.LC79(%rip), %xmm7
	.p2align 4,,10
	.p2align 3
.L832:
	addl	$1, %ecx
	addq	$16, %rsi
	addq	$32, %rdx
	movdqu	-16(%rsi), %xmm0
	movdqa	%xmm0, %xmm1
	movdqa	%xmm0, %xmm8
	pand	%xmm7, %xmm0
	punpcklbw	%xmm2, %xmm1
	punpckhbw	%xmm2, %xmm8
	psrlw	$4, %xmm1
	pand	%xmm6, %xmm1
	psrlw	$4, %xmm8
	pand	%xmm6, %xmm8
	packuswb	%xmm8, %xmm1
	movdqa	%xmm1, %xmm8
	movdqa	%xmm1, %xmm9
	psubusb	%xmm5, %xmm1
	pcmpeqb	%xmm2, %xmm1
	paddb	%xmm4, %xmm8
	paddb	%xmm3, %xmm9
	pand	%xmm1, %xmm8
	pandn	%xmm9, %xmm1
	movdqa	%xmm0, %xmm9
	paddb	%xmm3, %xmm9
	por	%xmm8, %xmm1
	movdqa	%xmm0, %xmm8
	psubusb	%xmm5, %xmm0
	pcmpeqb	%xmm2, %xmm0
	paddb	%xmm4, %xmm8
	pand	%xmm0, %xmm8
	pandn	%xmm9, %xmm0
	por	%xmm8, %xmm0
	movdqa	%xmm1, %xmm8
	punpckhbw	%xmm0, %xmm1
	punpcklbw	%xmm0, %xmm8
	movups	%xmm1, -16(%rdx)
	movups	%xmm8, -32(%rdx)
	cmpl	%edi, %ecx
	jb	.L832
	movl	%ebx, %r8d
	andl	$-16, %r8d
	cmpl	%r8d, %ebx
	leal	(%r8,%r8), %ecx
	je	.L847
	movslq	%ecx, %rcx
	movslq	%r8d, %r8
	addq	%rax, %rcx
	.p2align 4,,10
	.p2align 3
.L837:
	movzbl	(%r9,%r8), %edx
	movl	%edx, %edi
	shrb	$4, %dil
	leal	87(%rdi), %r10d
	leal	48(%rdi), %esi
	cmpb	$10, %dil
	cmovnb	%r10d, %esi
	andl	$15, %edx
	movb	%sil, (%rcx)
	leal	87(%rdx), %edi
	leal	48(%rdx), %esi
	cmpb	$10, %dl
	cmovb	%esi, %edi
	addq	$1, %r8
	addq	$2, %rcx
	movb	%dil, -1(%rcx)
	cmpl	%r8d, %ebx
	jg	.L837
.L847:
	addl	%ebx, %ebx
	movslq	%ebx, %rdx
	addq	%rax, %rdx
.L830:
	testq	%rax, %rax
	movb	$0, (%rdx)
	je	.L861
	movl	%ebx, %edx
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L831:
	.cfi_restore_state
	leal	-1(%rbx), %edx
	leaq	1(%rax), %rcx
	leaq	1(%r9,%rdx), %r10
	.p2align 4,,10
	.p2align 3
.L846:
	movzbl	(%r9), %edx
	movl	%edx, %edi
	shrb	$4, %dil
	leal	87(%rdi), %r8d
	leal	48(%rdi), %esi
	cmpb	$10, %dil
	cmovnb	%r8d, %esi
	andl	$15, %edx
	movb	%sil, -1(%rcx)
	leal	87(%rdx), %edi
	leal	48(%rdx), %esi
	cmpb	$10, %dl
	cmovb	%esi, %edi
	addq	$1, %r9
	addq	$2, %rcx
	movb	%dil, -2(%rcx)
	cmpq	%r9, %r10
	jne	.L846
	jmp	.L847
	.p2align 4,,10
	.p2align 3
.L849:
	movq	%rax, %rdx
	xorl	%ebx, %ebx
	jmp	.L830
.L861:
	call	tos.part.7
	.cfi_endproc
.LFE113:
	.size	array_byte_hex, .-array_byte_hex
	.section	.text.memdup,"ax",@progbits
	.p2align 4,,15
	.globl	memdup
	.type	memdup, @function
memdup:
.LFB141:
	.cfi_startproc
	testl	%esi, %esi
	je	.L866
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbp
	movl	%esi, %edi
	movl	%esi, %ebx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	call	v_malloc
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	movslq	%ebx, %rdx
	movq	%rbp, %rsi
	popq	%rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	movq	%rax, %rdi
	jmp	memcpy@PLT
	.p2align 4,,10
	.p2align 3
.L866:
	movl	$1, %esi
	movl	$1, %edi
	jmp	calloc@PLT
	.cfi_endproc
.LFE141:
	.size	memdup, .-memdup
	.section	.text.int_str_l.part.15,"ax",@progbits
	.p2align 4,,15
	.type	int_str_l.part.15, @function
int_str_l.part.15:
.LFB545:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movl	%edi, %ebx
	leal	1(%rsi), %edi
	movl	%esi, %ebp
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	call	v_malloc
	testl	%ebx, %ebx
	movq	%rax, %r9
	js	.L878
	movslq	%ebp, %rax
	xorl	%r10d, %r10d
	testl	%ebx, %ebx
	leal	-1(%rbp), %r13d
	movb	$0, (%r9,%rax)
	je	.L870
.L869:
	leal	-3(%rbp), %ecx
	leaq	_const_digit_pairs(%rip), %r8
	leaq	2(%r9), %rdi
	movl	$1374389535, %esi
	movslq	%ecx, %rcx
	.p2align 4,,10
	.p2align 3
.L871:
	movl	%ebx, %eax
	leal	1(%rcx), %r12d
	movl	%ecx, %r13d
	mull	%esi
	shrl	$5, %edx
	imull	$-100, %edx, %eax
	addl	%ebx, %eax
	movq	(%r8), %rbx
	addl	%eax, %eax
	leal	1(%rax), %r11d
	cltq
	movzbl	(%rbx,%rax), %eax
	movb	%al, (%rdi,%rcx)
	movq	(%r8), %rbx
	movslq	%r11d, %rax
	movzbl	(%rbx,%rax), %eax
	movl	%edx, %ebx
	movb	%al, -1(%rdi,%rcx)
	subq	$2, %rcx
	testl	%edx, %edx
	jne	.L871
	cmpl	$19, %r11d
	jle	.L870
	testl	%r10d, %r10d
	jne	.L873
.L879:
	movslq	%r12d, %rsi
	addq	%r9, %rsi
.L874:
	subl	%r12d, %ebp
	movq	%r9, %rdi
	leal	1(%rbp), %edx
	movslq	%edx, %rdx
	call	memmove@PLT
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	movl	%ebp, %edx
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L870:
	.cfi_restore_state
	testl	%r10d, %r10d
	leal	2(%r13), %r12d
	je	.L879
.L873:
	subl	$1, %r12d
	movslq	%r12d, %rsi
	addq	%r9, %rsi
	movb	$45, (%rsi)
	jmp	.L874
	.p2align 4,,10
	.p2align 3
.L878:
	movslq	%ebp, %rax
	negl	%ebx
	movl	$1, %r10d
	movb	$0, (%r9,%rax)
	jmp	.L869
	.cfi_endproc
.LFE545:
	.size	int_str_l.part.15, .-int_str_l.part.15
	.section	.rodata.str1.1
.LC80:
	.string	"0"
	.section	.text.int_str_l,"ax",@progbits
	.p2align 4,,15
	.globl	int_str_l
	.type	int_str_l, @function
int_str_l:
.LFB185:
	.cfi_startproc
	testl	%edi, %edi
	jne	.L884
	leaq	.LC80(%rip), %rax
	movl	$1, %edx
	ret
	.p2align 4,,10
	.p2align 3
.L884:
	jmp	int_str_l.part.15
	.cfi_endproc
.LFE185:
	.size	int_str_l, .-int_str_l
	.section	.text.i8_str,"ax",@progbits
	.p2align 4,,15
	.globl	i8_str
	.type	i8_str, @function
i8_str:
.LFB186:
	.cfi_startproc
	movsbl	%dil, %edi
	testl	%edi, %edi
	jne	.L894
	movabsq	$-4294967296, %rsi
	movl	$1, %ecx
	leaq	.LC80(%rip), %rax
	andq	%rsi, %rdx
	orq	%rcx, %rdx
	ret
	.p2align 4,,10
	.p2align 3
.L894:
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$5, %esi
	call	int_str_l.part.15
	movabsq	$-4294967296, %rsi
	movl	%edx, %ecx
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	andq	%rsi, %rdx
	orq	%rcx, %rdx
	ret
	.cfi_endproc
.LFE186:
	.size	i8_str, .-i8_str
	.section	.text.i16_str,"ax",@progbits
	.p2align 4,,15
	.globl	i16_str
	.type	i16_str, @function
i16_str:
.LFB187:
	.cfi_startproc
	movswl	%di, %edi
	testl	%edi, %edi
	jne	.L904
	movabsq	$-4294967296, %rsi
	movl	$1, %ecx
	leaq	.LC80(%rip), %rax
	andq	%rsi, %rdx
	orq	%rcx, %rdx
	ret
	.p2align 4,,10
	.p2align 3
.L904:
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$7, %esi
	call	int_str_l.part.15
	movabsq	$-4294967296, %rsi
	movl	%edx, %ecx
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	andq	%rsi, %rdx
	orq	%rcx, %rdx
	ret
	.cfi_endproc
.LFE187:
	.size	i16_str, .-i16_str
	.section	.text.u16_str,"ax",@progbits
	.p2align 4,,15
	.globl	u16_str
	.type	u16_str, @function
u16_str:
.LFB188:
	.cfi_startproc
	andl	$65535, %edi
	jne	.L914
	movabsq	$-4294967296, %rsi
	movl	$1, %ecx
	leaq	.LC80(%rip), %rax
	andq	%rsi, %rdx
	orq	%rcx, %rdx
	ret
	.p2align 4,,10
	.p2align 3
.L914:
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$7, %esi
	call	int_str_l.part.15
	movabsq	$-4294967296, %rsi
	movl	%edx, %ecx
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	andq	%rsi, %rdx
	orq	%rcx, %rdx
	ret
	.cfi_endproc
.LFE188:
	.size	u16_str, .-u16_str
	.section	.text.int_str,"ax",@progbits
	.p2align 4,,15
	.globl	int_str
	.type	int_str, @function
int_str:
.LFB189:
	.cfi_startproc
	testl	%edi, %edi
	jne	.L924
	movabsq	$-4294967296, %rsi
	movl	$1, %ecx
	leaq	.LC80(%rip), %rax
	andq	%rsi, %rdx
	orq	%rcx, %rdx
	ret
	.p2align 4,,10
	.p2align 3
.L924:
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$12, %esi
	call	int_str_l.part.15
	movabsq	$-4294967296, %rsi
	movl	%edx, %ecx
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	andq	%rsi, %rdx
	orq	%rcx, %rdx
	ret
	.cfi_endproc
.LFE189:
	.size	int_str, .-int_str
	.section	.text.i8_hex,"ax",@progbits
	.p2align 4,,15
	.globl	i8_hex
	.type	i8_hex, @function
i8_hex:
.LFB195:
	.cfi_startproc
	testb	%dil, %dil
	jne	.L937
	movl	$1, %edx
	leaq	.LC80(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L937:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	%edi, %ebx
	movl	$3, %edi
	call	v_malloc
	movl	$1, %edi
	movb	$0, 2(%rax)
	leaq	1(%rax), %rsi
	jmp	.L929
	.p2align 4,,10
	.p2align 3
.L931:
	movl	%ecx, %edi
.L929:
	movl	%ebx, %ecx
	shrb	$4, %bl
	andl	$15, %ecx
	leal	48(%rcx), %eax
	leal	87(%rcx), %edx
	cmpb	$9, %cl
	leal	-1(%rdi), %ecx
	cmovbe	%eax, %edx
	testb	%bl, %bl
	movq	%rsi, %rax
	movb	%dl, (%rsi)
	leaq	-1(%rsi), %rsi
	jne	.L931
	movl	$2, %edx
	subl	%edi, %edx
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE195:
	.size	i8_hex, .-i8_hex
	.section	.text.i16_hex,"ax",@progbits
	.p2align 4,,15
	.globl	i16_hex
	.type	i16_hex, @function
i16_hex:
.LFB197:
	.cfi_startproc
	testw	%di, %di
	jne	.L950
	movl	$1, %edx
	leaq	.LC80(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L950:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	%edi, %ebx
	movl	$6, %edi
	call	v_malloc
	movl	$4, %edi
	movb	$0, 5(%rax)
	leaq	4(%rax), %rsi
	jmp	.L942
	.p2align 4,,10
	.p2align 3
.L944:
	movl	%ecx, %edi
.L942:
	movl	%ebx, %ecx
	shrw	$4, %bx
	andl	$15, %ecx
	leal	48(%rcx), %eax
	leal	87(%rcx), %edx
	cmpw	$9, %cx
	leal	-1(%rdi), %ecx
	cmovbe	%eax, %edx
	testw	%bx, %bx
	movq	%rsi, %rax
	movb	%dl, (%rsi)
	leaq	-1(%rsi), %rsi
	jne	.L944
	movl	$5, %edx
	subl	%edi, %edx
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE197:
	.size	i16_hex, .-i16_hex
	.section	.text.int_hex,"ax",@progbits
	.p2align 4,,15
	.globl	int_hex
	.type	int_hex, @function
int_hex:
.LFB199:
	.cfi_startproc
	testl	%edi, %edi
	jne	.L964
	movl	$1, %edx
	leaq	.LC80(%rip), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L964:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	%edi, %ebx
	movl	$11, %edi
	call	v_malloc
	movl	$9, %edi
	movb	$0, 10(%rax)
	leaq	9(%rax), %rsi
	jmp	.L955
	.p2align 4,,10
	.p2align 3
.L957:
	movl	%ecx, %edi
.L955:
	movl	%ebx, %ecx
	shrl	$4, %ebx
	andl	$15, %ecx
	leal	48(%rcx), %eax
	leal	87(%rcx), %edx
	cmpl	$9, %ecx
	leal	-1(%rdi), %ecx
	cmovbe	%eax, %edx
	testl	%ebx, %ebx
	movq	%rsi, %rax
	movb	%dl, (%rsi)
	leaq	-1(%rsi), %rsi
	jne	.L957
	movl	$10, %edx
	subl	%edi, %edx
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE199:
	.size	int_hex, .-int_hex
	.section	.text.i64_hex,"ax",@progbits
	.p2align 4,,15
	.globl	i64_hex
	.type	i64_hex, @function
i64_hex:
.LFB201:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movl	$1, %ebp
	leaq	.LC80(%rip), %r8
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	testq	%rdi, %rdi
	jne	.L975
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	movl	%ebp, %edx
	movq	%r8, %rax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L975:
	.cfi_restore_state
	movq	%rdi, %rbx
	movl	$19, %edi
	call	v_malloc
	movl	$17, %edi
	movq	%rax, %r8
	movb	$0, 18(%rax)
	leaq	17(%rax), %rax
	jmp	.L969
	.p2align 4,,10
	.p2align 3
.L971:
	movl	%ecx, %edi
.L969:
	movq	%rbx, %rcx
	shrq	$4, %rbx
	andl	$15, %ecx
	leal	48(%rcx), %esi
	leal	87(%rcx), %edx
	cmpq	$9, %rcx
	leal	-1(%rdi), %ecx
	cmovbe	%esi, %edx
	movq	%rax, %rsi
	subq	$1, %rax
	movb	%dl, 1(%rax)
	testq	%rbx, %rbx
	jne	.L971
	movl	$19, %edx
	movl	$18, %ebp
	subl	%edi, %edx
	subl	%edi, %ebp
	movq	%r8, %rdi
	movslq	%edx, %rdx
	call	memmove@PLT
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	movq	%rax, %r8
	movl	%ebp, %edx
	movq	%r8, %rax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE201:
	.size	i64_hex, .-i64_hex
	.section	.text.byte_str,"ax",@progbits
	.p2align 4,,15
	.globl	byte_str
	.type	byte_str, @function
byte_str:
.LFB204:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	%edi, %ebx
	movl	$2, %edi
	call	v_malloc
	movl	$1, %edx
	movb	%bl, (%rax)
	movb	$0, 1(%rax)
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE204:
	.size	byte_str, .-byte_str
	.section	.text.new_dense_array,"ax",@progbits
	.p2align 4,,15
	.globl	new_dense_array
	.type	new_dense_array, @function
new_dense_array:
.LFB207:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	movl	$192, %edi
	call	v_malloc
	movq	$8, (%rbx)
	movq	%rax, 16(%rbx)
	movq	%rbx, %rax
	movl	$0, 8(%rbx)
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE207:
	.size	new_dense_array, .-new_dense_array
	.section	.text.new_map,"ax",@progbits
	.p2align 4,,15
	.globl	new_map
	.type	new_map, @function
new_map:
.LFB210:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movl	%edx, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rdi, %rbx
	movl	$192, %edi
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	movl	_const_init_cap(%rip), %ebp
	call	v_malloc
	movq	%rax, %r13
	movl	_const_init_capicity(%rip), %eax
	leal	16(,%rax,4), %edi
	testl	%edi, %edi
	jle	.L983
	movslq	%edi, %rdi
	movl	$1, %esi
	call	calloc@PLT
	movl	$1296, %edx
	movl	%r12d, (%rbx)
	movl	%ebp, 4(%rbx)
	movq	%r13, 32(%rbx)
	movq	%rax, 40(%rbx)
	movq	%rbx, %rax
	movw	%dx, 8(%rbx)
	movq	$8, 16(%rbx)
	movl	$0, 24(%rbx)
	movq	$4, 48(%rbx)
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L983:
	.cfi_restore_state
	call	vcalloc.part.5
	.cfi_endproc
.LFE210:
	.size	new_map, .-new_map
	.section	.text.string_clone,"ax",@progbits
	.p2align 4,,15
	.globl	string_clone
	.type	string_clone, @function
string_clone:
.LFB256:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rsi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rdi, %rbx
	leal	1(%rsi), %edi
	movl	%esi, %r12d
	call	v_malloc
	testl	%ebp, %ebp
	jle	.L985
	leaq	16(%rbx), %rdx
	cmpq	%rdx, %rax
	leaq	16(%rax), %rdx
	setnb	%cl
	cmpq	%rdx, %rbx
	setnb	%dl
	orb	%dl, %cl
	je	.L986
	cmpl	$22, %ebp
	jbe	.L986
	movq	%rbx, %rdx
	leal	-1(%rbp), %esi
	negq	%rdx
	andl	$15, %edx
	leal	15(%rdx), %ecx
	cmpl	%ecx, %esi
	jb	.L995
	testl	%edx, %edx
	je	.L996
	movzbl	(%rbx), %ecx
	cmpl	$1, %edx
	movb	%cl, (%rax)
	je	.L997
	movzbl	1(%rbx), %ecx
	cmpl	$2, %edx
	movb	%cl, 1(%rax)
	je	.L998
	movzbl	2(%rbx), %ecx
	cmpl	$3, %edx
	movb	%cl, 2(%rax)
	je	.L999
	movzbl	3(%rbx), %ecx
	cmpl	$4, %edx
	movb	%cl, 3(%rax)
	je	.L1000
	movzbl	4(%rbx), %ecx
	cmpl	$5, %edx
	movb	%cl, 4(%rax)
	je	.L1001
	movzbl	5(%rbx), %ecx
	cmpl	$6, %edx
	movb	%cl, 5(%rax)
	je	.L1002
	movzbl	6(%rbx), %ecx
	cmpl	$7, %edx
	movb	%cl, 6(%rax)
	je	.L1003
	movzbl	7(%rbx), %ecx
	cmpl	$8, %edx
	movb	%cl, 7(%rax)
	je	.L1004
	movzbl	8(%rbx), %ecx
	cmpl	$9, %edx
	movb	%cl, 8(%rax)
	je	.L1005
	movzbl	9(%rbx), %ecx
	cmpl	$10, %edx
	movb	%cl, 9(%rax)
	je	.L1006
	movzbl	10(%rbx), %ecx
	cmpl	$11, %edx
	movb	%cl, 10(%rax)
	je	.L1007
	movzbl	11(%rbx), %ecx
	cmpl	$12, %edx
	movb	%cl, 11(%rax)
	je	.L1008
	movzbl	12(%rbx), %ecx
	cmpl	$13, %edx
	movb	%cl, 12(%rax)
	je	.L1009
	movzbl	13(%rbx), %ecx
	cmpl	$15, %edx
	movb	%cl, 13(%rax)
	jne	.L1010
	movzbl	14(%rbx), %ecx
	movb	%cl, 14(%rax)
	movl	$15, %ecx
	.p2align 4,,10
	.p2align 3
.L988:
	movl	%ebp, %r11d
	movl	%edx, %esi
	xorl	%edi, %edi
	subl	%edx, %r11d
	leaq	(%rbx,%rsi), %r9
	leaq	(%rax,%rsi), %rdx
	movl	%r11d, %r10d
	xorl	%r8d, %r8d
	shrl	$4, %r10d
	.p2align 4,,10
	.p2align 3
.L990:
	movdqa	(%r9,%rdi), %xmm0
	addl	$1, %r8d
	movups	%xmm0, (%rdx,%rdi)
	addq	$16, %rdi
	cmpl	%r8d, %r10d
	ja	.L990
	movl	%r11d, %edx
	andl	$-16, %edx
	addl	%edx, %ecx
	cmpl	%edx, %r11d
	je	.L985
.L987:
	movslq	%ecx, %rcx
	.p2align 4,,10
	.p2align 3
.L992:
	movzbl	(%rbx,%rcx), %edx
	movb	%dl, (%rax,%rcx)
	addq	$1, %rcx
	cmpl	%ecx, %r12d
	jg	.L992
.L985:
	movslq	%ebp, %rdx
	movb	$0, (%rax,%rdx)
	movl	%ebp, %edx
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L997:
	.cfi_restore_state
	movl	$1, %ecx
	jmp	.L988
	.p2align 4,,10
	.p2align 3
.L986:
	leal	-1(%rbp), %esi
	xorl	%edx, %edx
	addq	$1, %rsi
	.p2align 4,,10
	.p2align 3
.L993:
	movzbl	(%rbx,%rdx), %ecx
	movb	%cl, (%rax,%rdx)
	addq	$1, %rdx
	cmpq	%rsi, %rdx
	jne	.L993
	movslq	%ebp, %rdx
	movb	$0, (%rax,%rdx)
	movl	%ebp, %edx
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L998:
	.cfi_restore_state
	movl	$2, %ecx
	jmp	.L988
	.p2align 4,,10
	.p2align 3
.L995:
	xorl	%ecx, %ecx
	jmp	.L987
	.p2align 4,,10
	.p2align 3
.L999:
	movl	$3, %ecx
	jmp	.L988
	.p2align 4,,10
	.p2align 3
.L1000:
	movl	$4, %ecx
	jmp	.L988
.L1003:
	movl	$7, %ecx
	jmp	.L988
	.p2align 4,,10
	.p2align 3
.L1001:
	movl	$5, %ecx
	jmp	.L988
.L1002:
	movl	$6, %ecx
	jmp	.L988
.L996:
	xorl	%ecx, %ecx
	jmp	.L988
.L1004:
	movl	$8, %ecx
	jmp	.L988
.L1005:
	movl	$9, %ecx
	jmp	.L988
.L1006:
	movl	$10, %ecx
	jmp	.L988
.L1007:
	movl	$11, %ecx
	jmp	.L988
.L1008:
	movl	$12, %ecx
	jmp	.L988
.L1009:
	movl	$13, %ecx
	jmp	.L988
.L1010:
	movl	$14, %ecx
	jmp	.L988
	.cfi_endproc
.LFE256:
	.size	string_clone, .-string_clone
	.section	.text.string_add,"ax",@progbits
	.p2align 4,,15
	.globl	string_add
	.type	string_add, @function
string_add:
.LFB279:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rsi, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	leal	(%rcx,%rsi), %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbp
	leal	1(%r12), %edi
	movq	%rdx, %rbx
	movq	%rcx, %r15
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movl	%ecx, %r13d
	movl	%esi, 12(%rsp)
	call	v_malloc
	testl	%r14d, %r14d
	jle	.L1022
	leaq	16(%rax), %rdx
	cmpq	%rdx, %rbp
	leaq	16(%rbp), %rdx
	setnb	%sil
	cmpq	%rdx, %rax
	setnb	%dl
	orb	%dl, %sil
	je	.L1023
	cmpl	$22, %r14d
	jbe	.L1023
	movq	%rbp, %rdx
	leal	-1(%r14), %edi
	movl	12(%rsp), %ecx
	negq	%rdx
	andl	$15, %edx
	leal	15(%rdx), %esi
	cmpl	%esi, %edi
	jb	.L1042
	testl	%edx, %edx
	je	.L1043
	movzbl	0(%rbp), %esi
	cmpl	$1, %edx
	movb	%sil, (%rax)
	je	.L1044
	movzbl	1(%rbp), %esi
	cmpl	$2, %edx
	movb	%sil, 1(%rax)
	je	.L1045
	movzbl	2(%rbp), %esi
	cmpl	$3, %edx
	movb	%sil, 2(%rax)
	je	.L1046
	movzbl	3(%rbp), %esi
	cmpl	$4, %edx
	movb	%sil, 3(%rax)
	je	.L1047
	movzbl	4(%rbp), %esi
	cmpl	$5, %edx
	movb	%sil, 4(%rax)
	je	.L1048
	movzbl	5(%rbp), %esi
	cmpl	$6, %edx
	movb	%sil, 5(%rax)
	je	.L1049
	movzbl	6(%rbp), %esi
	cmpl	$7, %edx
	movb	%sil, 6(%rax)
	je	.L1050
	movzbl	7(%rbp), %esi
	cmpl	$8, %edx
	movb	%sil, 7(%rax)
	je	.L1051
	movzbl	8(%rbp), %esi
	cmpl	$9, %edx
	movb	%sil, 8(%rax)
	je	.L1052
	movzbl	9(%rbp), %esi
	cmpl	$10, %edx
	movb	%sil, 9(%rax)
	je	.L1053
	movzbl	10(%rbp), %esi
	cmpl	$11, %edx
	movb	%sil, 10(%rax)
	je	.L1054
	movzbl	11(%rbp), %esi
	cmpl	$12, %edx
	movb	%sil, 11(%rax)
	je	.L1055
	movzbl	12(%rbp), %esi
	cmpl	$13, %edx
	movb	%sil, 12(%rax)
	je	.L1056
	movzbl	13(%rbp), %esi
	cmpl	$15, %edx
	movb	%sil, 13(%rax)
	jne	.L1057
	movzbl	14(%rbp), %esi
	movl	$15, %edi
	movb	%sil, 14(%rax)
	.p2align 4,,10
	.p2align 3
.L1025:
	movl	%r14d, %r10d
	movl	%edx, %esi
	xorl	%r8d, %r8d
	subl	%edx, %r10d
	leaq	0(%rbp,%rsi), %r9
	xorl	%edx, %edx
	movl	%r10d, %r11d
	addq	%rax, %rsi
	shrl	$4, %r11d
	.p2align 4,,10
	.p2align 3
.L1027:
	movdqa	(%r9,%r8), %xmm0
	addl	$1, %edx
	movups	%xmm0, (%rsi,%r8)
	addq	$16, %r8
	cmpl	%edx, %r11d
	ja	.L1027
	movl	%r10d, %edx
	andl	$-16, %edx
	addl	%edx, %edi
	cmpl	%edx, %r10d
	je	.L1022
.L1024:
	movslq	%edi, %rdi
	.p2align 4,,10
	.p2align 3
.L1029:
	movzbl	0(%rbp,%rdi), %edx
	movb	%dl, (%rax,%rdi)
	addq	$1, %rdi
	cmpl	%edi, %ecx
	jg	.L1029
.L1022:
	testl	%r15d, %r15d
	jle	.L1032
	movslq	%r14d, %r8
	leaq	16(%rax,%r8), %rdx
	leaq	(%rax,%r8), %r9
	cmpq	%rdx, %rbx
	leaq	16(%rbx), %rdx
	setnb	%cl
	cmpq	%rdx, %r9
	setnb	%dl
	orb	%dl, %cl
	je	.L1033
	cmpl	$22, %r15d
	jbe	.L1033
	movq	%rbx, %rcx
	leal	-1(%r15), %esi
	negq	%rcx
	andl	$15, %ecx
	leal	15(%rcx), %edx
	cmpl	%edx, %esi
	jb	.L1058
	testl	%ecx, %ecx
	je	.L1059
	movzbl	(%rbx), %edx
	cmpl	$1, %ecx
	movb	%dl, (%r9)
	je	.L1060
	movzbl	1(%rbx), %esi
	leal	1(%r14), %edx
	cmpl	$2, %ecx
	movslq	%edx, %rdx
	movb	%sil, (%rax,%rdx)
	je	.L1061
	movzbl	2(%rbx), %esi
	leal	2(%r14), %edx
	cmpl	$3, %ecx
	movslq	%edx, %rdx
	movb	%sil, (%rax,%rdx)
	je	.L1062
	movzbl	3(%rbx), %esi
	leal	3(%r14), %edx
	cmpl	$4, %ecx
	movslq	%edx, %rdx
	movb	%sil, (%rax,%rdx)
	je	.L1063
	movzbl	4(%rbx), %esi
	leal	4(%r14), %edx
	cmpl	$5, %ecx
	movslq	%edx, %rdx
	movb	%sil, (%rax,%rdx)
	je	.L1064
	movzbl	5(%rbx), %esi
	leal	5(%r14), %edx
	cmpl	$6, %ecx
	movslq	%edx, %rdx
	movb	%sil, (%rax,%rdx)
	je	.L1065
	movzbl	6(%rbx), %esi
	leal	6(%r14), %edx
	cmpl	$7, %ecx
	movslq	%edx, %rdx
	movb	%sil, (%rax,%rdx)
	je	.L1066
	movzbl	7(%rbx), %esi
	leal	7(%r14), %edx
	cmpl	$8, %ecx
	movslq	%edx, %rdx
	movb	%sil, (%rax,%rdx)
	je	.L1067
	movzbl	8(%rbx), %esi
	leal	8(%r14), %edx
	cmpl	$9, %ecx
	movslq	%edx, %rdx
	movb	%sil, (%rax,%rdx)
	je	.L1068
	movzbl	9(%rbx), %esi
	leal	9(%r14), %edx
	cmpl	$10, %ecx
	movslq	%edx, %rdx
	movb	%sil, (%rax,%rdx)
	je	.L1069
	movzbl	10(%rbx), %esi
	leal	10(%r14), %edx
	cmpl	$11, %ecx
	movslq	%edx, %rdx
	movb	%sil, (%rax,%rdx)
	je	.L1070
	movzbl	11(%rbx), %esi
	leal	11(%r14), %edx
	cmpl	$12, %ecx
	movslq	%edx, %rdx
	movb	%sil, (%rax,%rdx)
	je	.L1071
	movzbl	12(%rbx), %esi
	leal	12(%r14), %edx
	cmpl	$13, %ecx
	movslq	%edx, %rdx
	movb	%sil, (%rax,%rdx)
	je	.L1072
	movzbl	13(%rbx), %esi
	leal	13(%r14), %edx
	cmpl	$15, %ecx
	movslq	%edx, %rdx
	movb	%sil, (%rax,%rdx)
	jne	.L1073
	movzbl	14(%rbx), %esi
	leal	14(%r14), %edx
	movslq	%edx, %rdx
	movb	%sil, (%rax,%rdx)
	movl	$15, %esi
	.p2align 4,,10
	.p2align 3
.L1035:
	movl	%ecx, %edx
	subl	%ecx, %r15d
	xorl	%edi, %edi
	addq	%rdx, %r8
	movl	%r15d, %r11d
	leaq	(%rbx,%rdx), %r10
	shrl	$4, %r11d
	addq	%rax, %r8
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L1037:
	movdqa	(%r10,%rdi), %xmm0
	addl	$1, %edx
	movups	%xmm0, (%r8,%rdi)
	addq	$16, %rdi
	cmpl	%edx, %r11d
	ja	.L1037
	movl	%r15d, %edx
	andl	$-16, %edx
	addl	%edx, %esi
	cmpl	%edx, %r15d
	je	.L1032
.L1034:
	movslq	%esi, %rcx
	.p2align 4,,10
	.p2align 3
.L1039:
	movzbl	(%rbx,%rcx), %edx
	movb	%dl, (%r9,%rcx)
	addq	$1, %rcx
	cmpl	%ecx, %r13d
	jg	.L1039
.L1032:
	movslq	%r12d, %rdx
	movb	$0, (%rax,%rdx)
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	%r12d, %edx
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L1060:
	.cfi_restore_state
	movl	$1, %esi
	jmp	.L1035
	.p2align 4,,10
	.p2align 3
.L1044:
	movl	$1, %edi
	jmp	.L1025
	.p2align 4,,10
	.p2align 3
.L1033:
	leal	-1(%r15), %esi
	xorl	%edx, %edx
	addq	$1, %rsi
	.p2align 4,,10
	.p2align 3
.L1040:
	movzbl	(%rbx,%rdx), %ecx
	movb	%cl, (%r9,%rdx)
	addq	$1, %rdx
	cmpq	%rsi, %rdx
	jne	.L1040
	jmp	.L1032
	.p2align 4,,10
	.p2align 3
.L1023:
	leal	-1(%r14), %esi
	xorl	%edx, %edx
	addq	$1, %rsi
	.p2align 4,,10
	.p2align 3
.L1030:
	movzbl	0(%rbp,%rdx), %ecx
	movb	%cl, (%rax,%rdx)
	addq	$1, %rdx
	cmpq	%rsi, %rdx
	jne	.L1030
	jmp	.L1022
	.p2align 4,,10
	.p2align 3
.L1061:
	movl	$2, %esi
	jmp	.L1035
	.p2align 4,,10
	.p2align 3
.L1045:
	movl	$2, %edi
	jmp	.L1025
	.p2align 4,,10
	.p2align 3
.L1058:
	xorl	%esi, %esi
	jmp	.L1034
	.p2align 4,,10
	.p2align 3
.L1042:
	xorl	%edi, %edi
	jmp	.L1024
	.p2align 4,,10
	.p2align 3
.L1062:
	movl	$3, %esi
	jmp	.L1035
	.p2align 4,,10
	.p2align 3
.L1046:
	movl	$3, %edi
	jmp	.L1025
	.p2align 4,,10
	.p2align 3
.L1063:
	movl	$4, %esi
	jmp	.L1035
	.p2align 4,,10
	.p2align 3
.L1047:
	movl	$4, %edi
	jmp	.L1025
.L1050:
	movl	$7, %edi
	jmp	.L1025
.L1066:
	movl	$7, %esi
	jmp	.L1035
	.p2align 4,,10
	.p2align 3
.L1048:
	movl	$5, %edi
	jmp	.L1025
	.p2align 4,,10
	.p2align 3
.L1064:
	movl	$5, %esi
	jmp	.L1035
.L1065:
	movl	$6, %esi
	jmp	.L1035
.L1049:
	movl	$6, %edi
	jmp	.L1025
.L1043:
	xorl	%edi, %edi
	jmp	.L1025
.L1059:
	xorl	%esi, %esi
	jmp	.L1035
.L1051:
	movl	$8, %edi
	jmp	.L1025
.L1067:
	movl	$8, %esi
	jmp	.L1035
.L1068:
	movl	$9, %esi
	jmp	.L1035
.L1052:
	movl	$9, %edi
	jmp	.L1025
.L1053:
	movl	$10, %edi
	jmp	.L1025
.L1069:
	movl	$10, %esi
	jmp	.L1035
.L1070:
	movl	$11, %esi
	jmp	.L1035
.L1054:
	movl	$11, %edi
	jmp	.L1025
.L1071:
	movl	$12, %esi
	jmp	.L1035
.L1055:
	movl	$12, %edi
	jmp	.L1025
.L1072:
	movl	$13, %esi
	jmp	.L1035
.L1056:
	movl	$13, %edi
	jmp	.L1025
.L1073:
	movl	$14, %esi
	jmp	.L1035
.L1057:
	movl	$14, %edi
	jmp	.L1025
	.cfi_endproc
.LFE279:
	.size	string_add, .-string_add
	.section	.text.ustring_add,"ax",@progbits
	.p2align 4,,15
	.globl	ustring_add
	.type	ustring_add, @function
ustring_add:
.LFB326:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$120, %rsp
	.cfi_def_cfa_offset 176
	movl	184(%rsp), %ebx
	movl	232(%rsp), %r14d
	movq	%rdi, 24(%rsp)
	movq	224(%rsp), %rdx
	movq	232(%rsp), %rcx
	movq	176(%rsp), %rdi
	movq	184(%rsp), %rsi
	movl	%ebx, (%rsp)
	movq	%fs:40, %rax
	movq	%rax, 104(%rsp)
	xorl	%eax, %eax
	movl	%r14d, 12(%rsp)
	call	string_add
	addl	%r14d, %ebx
	movq	%rax, 48(%rsp)
	movq	%rdx, 56(%rsp)
	je	.L1101
	leal	0(,%rbx,4), %edi
	testl	%edi, %edi
	jle	.L1095
	movslq	%edi, %rdi
.L1094:
	movl	$1, %esi
	call	calloc@PLT
	movl	(%rsp), %edx
	movq	%rax, 64(%rsp)
	movl	$0, 72(%rsp)
	movl	%ebx, 76(%rsp)
	movl	$4, 80(%rsp)
	movl	$0, 88(%rsp)
	testl	%edx, %edx
	jle	.L1102
	movq	176(%rsp), %rax
	leaq	44(%rsp), %rbp
	leaq	48(%rsp), %rbx
	xorl	%r15d, %r15d
	xorl	%r13d, %r13d
	movq	%rax, 16(%rsp)
	.p2align 4,,10
	.p2align 3
.L1097:
	movq	16(%rsp), %rax
	movslq	%r15d, %rdx
	leaq	16(%rbx), %rdi
	movq	%rbp, %rsi
	movl	%r13d, 44(%rsp)
	movzbl	(%rax,%rdx), %ecx
	movl	$-452984832, %edx
	shrb	$3, %cl
	andl	$30, %ecx
	shrl	%cl, %edx
	andl	$3, %edx
	leal	1(%rdx), %r12d
	movl	%edx, %r14d
	leal	1(%r15,%r14), %r15d
	call	array_push
	addl	%r12d, %r13d
	addl	$1, 88(%rsp)
	cmpl	%r15d, (%rsp)
	jg	.L1097
.L1096:
	movl	12(%rsp), %eax
	testl	%eax, %eax
	jle	.L1098
	movq	224(%rsp), %rax
	leaq	44(%rsp), %rbp
	leaq	48(%rsp), %rbx
	xorl	%r14d, %r14d
	movq	%rax, (%rsp)
	.p2align 4,,10
	.p2align 3
.L1099:
	movq	(%rsp), %rax
	movslq	%r14d, %rdx
	leaq	16(%rbx), %rdi
	movq	%rbp, %rsi
	movl	%r13d, 44(%rsp)
	movzbl	(%rax,%rdx), %ecx
	movl	$-452984832, %edx
	shrb	$3, %cl
	andl	$30, %ecx
	shrl	%cl, %edx
	andl	$3, %edx
	leal	1(%rdx), %r12d
	movl	%edx, %r15d
	leal	1(%r14,%r15), %r14d
	call	array_push
	addl	%r12d, %r13d
	addl	$1, 88(%rsp)
	cmpl	%r14d, 12(%rsp)
	jg	.L1099
.L1098:
	movq	24(%rsp), %rax
	movdqa	48(%rsp), %xmm0
	movq	104(%rsp), %rsi
	xorq	%fs:40, %rsi
	movups	%xmm0, (%rax)
	movdqa	64(%rsp), %xmm0
	movups	%xmm0, 16(%rax)
	movdqa	80(%rsp), %xmm0
	movups	%xmm0, 32(%rax)
	jne	.L1106
	addq	$120, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L1101:
	.cfi_restore_state
	movl	$4, %edi
	movl	$1, %ebx
	jmp	.L1094
	.p2align 4,,10
	.p2align 3
.L1102:
	xorl	%r13d, %r13d
	jmp	.L1096
.L1106:
	call	__stack_chk_fail@PLT
.L1095:
	call	vcalloc.part.5
	.cfi_endproc
.LFE326:
	.size	ustring_add, .-ustring_add
	.section	.text.string_to_lower,"ax",@progbits
	.p2align 4,,15
	.globl	string_to_lower
	.type	string_to_lower, @function
string_to_lower:
.LFB299:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movq	%rdi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	leal	1(%rsi), %edi
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rsi, %rbp
	call	v_malloc
	testl	%ebp, %ebp
	movq	%rax, %rbx
	jle	.L1108
	call	__ctype_tolower_loc@PLT
	leal	-1(%rbp), %r9d
	xorl	%ecx, %ecx
	addq	$1, %r9
	.p2align 4,,10
	.p2align 3
.L1109:
	movzbl	(%r12,%rcx), %r8d
	movq	(%rax), %rdi
	movl	(%rdi,%r8,4), %edi
	movb	%dil, (%rbx,%rcx)
	addq	$1, %rcx
	cmpq	%rcx, %r9
	jne	.L1109
.L1110:
	movl	%ebp, %edx
	movq	%rbx, %rax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L1108:
	.cfi_restore_state
	testq	%rax, %rax
	jne	.L1110
	call	tos.part.7
	.cfi_endproc
.LFE299:
	.size	string_to_lower, .-string_to_lower
	.section	.text.string_to_upper,"ax",@progbits
	.p2align 4,,15
	.globl	string_to_upper
	.type	string_to_upper, @function
string_to_upper:
.LFB300:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movq	%rdi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	leal	1(%rsi), %edi
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rsi, %rbp
	call	v_malloc
	testl	%ebp, %ebp
	movq	%rax, %rbx
	jle	.L1114
	call	__ctype_toupper_loc@PLT
	leal	-1(%rbp), %r9d
	xorl	%ecx, %ecx
	addq	$1, %r9
	.p2align 4,,10
	.p2align 3
.L1115:
	movzbl	(%r12,%rcx), %r8d
	movq	(%rax), %rdi
	movl	(%rdi,%r8,4), %edi
	movb	%dil, (%rbx,%rcx)
	addq	$1, %rcx
	cmpq	%rcx, %r9
	jne	.L1115
.L1116:
	movl	%ebp, %edx
	movq	%rbx, %rax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L1114:
	.cfi_restore_state
	testq	%rax, %rax
	jne	.L1116
	call	tos.part.7
	.cfi_endproc
.LFE300:
	.size	string_to_upper, .-string_to_upper
	.section	.text.rune_str,"ax",@progbits
	.p2align 4,,15
	.globl	rune_str
	.type	rune_str, @function
rune_str:
.LFB203:
	.cfi_startproc
	movl	%edi, %ecx
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movl	%edi, %ebp
	shrl	$27, %ecx
	movl	$-452984832, %edi
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	andl	$30, %ecx
	shrl	%cl, %edi
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	andl	$3, %edi
	leal	1(%rdi), %ebx
	addl	$2, %edi
	call	v_malloc
	movl	$24, %ecx
	xorl	%esi, %esi
	.p2align 4,,10
	.p2align 3
.L1120:
	movl	%ebp, %edi
	sarl	%cl, %edi
	subl	$8, %ecx
	movb	%dil, (%rax,%rsi)
	addq	$1, %rsi
	cmpl	%esi, %ebx
	jg	.L1120
	movslq	%ebx, %rdx
	movb	$0, (%rax,%rdx)
	movl	%ebx, %edx
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	andl	$7, %edx
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE203:
	.size	rune_str, .-rune_str
	.section	.text.map_set,"ax",@progbits
	.p2align 4,,15
	.globl	map_set
	.type	map_set, @function
map_set:
.LFB215:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	pxor	%xmm0, %xmm0
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	movl	4(%rdi), %ebp
	movl	52(%rdi), %eax
	pxor	%xmm1, %xmm1
	movq	%rsi, (%rsp)
	movq	%rdx, 16(%rsp)
	movq	%rcx, 24(%rsp)
	addl	%eax, %eax
	cvtsi2ss	%eax, %xmm0
	cvtsi2ssq	%rbp, %xmm1
	divss	%xmm1, %xmm0
	cvtss2sd	%xmm0, %xmm0
	ucomisd	_const_max_load_factor(%rip), %xmm0
	ja	.L1142
.L1124:
	movslq	16(%rsp), %rsi
	movq	(%rsp), %rdi
	xorl	%edx, %edx
	call	wyhash
	movzbl	9(%rbx), %ecx
	movq	%rbp, %rsi
	movq	40(%rbx), %r13
	andq	%rax, %rsi
	movl	_const_probe_inc(%rip), %ebp
	movl	%esi, %r15d
	shrq	%cl, %rax
	andl	_const_hash_mask(%rip), %eax
	orl	%ebp, %eax
	cmpl	0(%r13,%rsi,4), %eax
	movl	%eax, %r14d
	jnb	.L1130
	.p2align 4,,10
	.p2align 3
.L1131:
	leal	2(%r15), %eax
	addl	%ebp, %r14d
	movq	%rax, %r15
	movl	0(%r13,%rax,4), %eax
	cmpl	%eax, %r14d
	jb	.L1131
.L1132:
	cmpl	%eax, %r14d
	jne	.L1133
	movq	32(%rbx), %rax
	movq	%rax, 8(%rsp)
	jmp	.L1135
	.p2align 4,,10
	.p2align 3
.L1134:
	leal	2(%r15), %eax
	addl	%ebp, %r14d
	cmpl	%r14d, 0(%r13,%rax,4)
	movq	%rax, %r15
	jne	.L1133
.L1135:
	leal	1(%r15), %eax
	movq	8(%rsp), %rcx
	movq	(%rsp), %rdi
	movl	0(%r13,%rax,4), %eax
	leaq	(%rax,%rax,2), %rax
	leaq	(%rcx,%rax,8), %r12
	movq	(%r12), %rsi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L1134
	movq	16(%r12), %rdi
	movslq	(%rbx), %rdx
	movq	24(%rsp), %rsi
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	memcpy@PLT
	.p2align 4,,10
	.p2align 3
.L1133:
	.cfi_restore_state
	movl	(%rbx), %edi
	call	v_malloc
	movslq	(%rbx), %rdx
	movq	24(%rsp), %rsi
	movq	%rax, %rdi
	movq	%rax, %rbp
	call	memcpy@PLT
	movl	20(%rbx), %ecx
	cmpl	%ecx, 16(%rbx)
	je	.L1136
	movq	32(%rbx), %rax
.L1137:
	movl	%ecx, %edx
	movl	%r15d, %esi
	movq	%rbx, %rdi
	leaq	(%rdx,%rdx,2), %rdx
	leaq	(%rax,%rdx,8), %rax
	movq	(%rsp), %rdx
	movq	%rbp, 16(%rax)
	movq	%rdx, (%rax)
	movl	16(%rsp), %edx
	movl	%edx, 8(%rax)
	leal	1(%rcx), %eax
	movl	%r14d, %edx
	movl	%eax, 20(%rbx)
	call	map_meta_greater
	addl	$1, 52(%rbx)
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L1142:
	.cfi_restore_state
	cmpb	$0, 8(%rdi)
	leal	2(%rbp,%rbp), %eax
	movq	%rbp, %rsi
	movl	%eax, 4(%rdi)
	je	.L1143
	call	map_cached_rehash
.L1129:
	subb	$1, 8(%rbx)
	movl	4(%rbx), %ebp
	jmp	.L1124
	.p2align 4,,10
	.p2align 3
.L1143:
	addb	$16, 9(%rdi)
	movb	$16, 8(%rdi)
	call	map_rehash
	jmp	.L1129
	.p2align 4,,10
	.p2align 3
.L1136:
	movl	%ecx, %eax
	movq	32(%rbx), %rdi
	shrl	$3, %eax
	addl	%eax, %ecx
	leaq	(%rcx,%rcx,2), %rsi
	movl	%ecx, 16(%rbx)
	salq	$3, %rsi
	call	realloc@PLT
	movl	20(%rbx), %ecx
	movq	%rax, 32(%rbx)
	jmp	.L1137
	.p2align 4,,10
	.p2align 3
.L1130:
	movl	0(%r13,%rsi,4), %eax
	jmp	.L1132
	.cfi_endproc
.LFE215:
	.size	map_set, .-map_set
	.section	.text.map_get3,"ax",@progbits
	.p2align 4,,15
	.globl	map_get3
	.type	map_get3, @function
map_get3:
.LFB219:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movslq	%esi, %rsi
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movq	%rdx, 8(%rsp)
	xorl	%edx, %edx
	movq	%rdi, (%rsp)
	call	wyhash
	movzbl	89(%rsp), %ecx
	movl	%eax, %esi
	andl	84(%rsp), %esi
	movq	120(%rsp), %r13
	movl	_const_probe_inc(%rip), %ebp
	movq	112(%rsp), %r14
	shrq	%cl, %rax
	andl	_const_hash_mask(%rip), %eax
	movl	%esi, %ebx
	orl	%ebp, %eax
	cmpl	0(%r13,%rsi,4), %eax
	movl	%eax, %r15d
	jnb	.L1145
	.p2align 4,,10
	.p2align 3
.L1146:
	leal	2(%rbx), %eax
	addl	%ebp, %r15d
	movq	%rax, %rbx
	movl	0(%r13,%rax,4), %eax
	cmpl	%eax, %r15d
	jb	.L1146
	cmpl	%eax, %r15d
	jne	.L1148
	.p2align 4,,10
	.p2align 3
.L1150:
	leal	1(%rbx), %eax
	movq	(%rsp), %rdi
	movl	0(%r13,%rax,4), %eax
	leaq	(%rax,%rax,2), %rax
	leaq	(%r14,%rax,8), %r12
	movq	(%r12), %rsi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L1155
	leal	2(%rbx), %edx
	leal	0(%rbp,%r15), %eax
	movl	0(%r13,%rdx,4), %r15d
	movq	%rdx, %rbx
.L1154:
	cmpl	%eax, %r15d
	je	.L1150
.L1148:
	movq	8(%rsp), %rax
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L1155:
	.cfi_restore_state
	movl	80(%rsp), %ebx
	movl	%ebx, %edi
	call	v_malloc
	movq	16(%r12), %rsi
	movslq	%ebx, %rdx
	movq	%rax, %rdi
	movq	%rax, 8(%rsp)
	call	memcpy@PLT
	jmp	.L1148
	.p2align 4,,10
	.p2align 3
.L1145:
	movl	0(%r13,%rsi,4), %eax
	jmp	.L1154
	.cfi_endproc
.LFE219:
	.size	map_get3, .-map_get3
	.section	.text.new_node,"ax",@progbits
	.p2align 4,,15
	.globl	new_node
	.type	new_node, @function
new_node:
.LFB232:
	.cfi_startproc
	subq	$296, %rsp
	.cfi_def_cfa_offset 304
	movl	$35, %ecx
	movq	%fs:40, %rax
	movq	%rax, 280(%rsp)
	xorl	%eax, %eax
	movq	%rsp, %rdi
	rep stosq
	movl	$280, %edi
	call	v_malloc
	movq	(%rsp), %rdx
	leaq	8(%rax), %rdi
	movq	%rax, %rcx
	movq	%rsp, %rsi
	andq	$-8, %rdi
	movq	%rdx, (%rax)
	movq	272(%rsp), %rdx
	subq	%rdi, %rcx
	subq	%rcx, %rsi
	addl	$280, %ecx
	shrl	$3, %ecx
	movq	%rdx, 272(%rax)
	rep movsq
	movq	280(%rsp), %rsi
	xorq	%fs:40, %rsi
	jne	.L1159
	addq	$296, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L1159:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE232:
	.size	new_node, .-new_node
	.section	.text.new_sorted_map,"ax",@progbits
	.p2align 4,,15
	.globl	new_sorted_map
	.type	new_sorted_map, @function
new_sorted_map:
.LFB230:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movl	%edx, %ebp
	movq	%rdi, %rbx
	xorl	%eax, %eax
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	call	new_node
	movl	%ebp, (%rbx)
	movq	%rax, 8(%rbx)
	movq	%rbx, %rax
	movl	$0, 16(%rbx)
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE230:
	.size	new_sorted_map, .-new_sorted_map
	.section	.text.mapnode_split_child,"ax",@progbits
	.p2align 4,,15
	.globl	mapnode_split_child
	.type	mapnode_split_child, @function
mapnode_split_child:
.LFB234:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	xorl	%eax, %eax
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movslq	%esi, %r13
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdx, %rbp
	movq	%rdi, %rbx
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	call	new_node
	movq	%rax, %r12
	movl	_const_mid_index(%rip), %eax
	movl	%eax, %edx
	movl	%eax, 272(%r12)
	movl	%eax, 272(%rbp)
	subl	$1, %edx
	js	.L1163
	leal	5(%rax), %ecx
	movslq	%edx, %rdx
	movq	%rdx, %r9
	addq	$22, %rdx
	movslq	%ecx, %rcx
	salq	$4, %r9
	movq	%rcx, %rsi
	movq	176(%rbp,%rcx,8), %rcx
	salq	$4, %rsi
	movdqu	0(%rbp,%rsi), %xmm0
	movups	%xmm0, (%r12,%r9)
	movq	%rcx, (%r12,%rdx,8)
	leal	-2(%rax), %ecx
	cmpl	$-1, %ecx
	je	.L1163
	leal	4(%rax), %esi
	movslq	%ecx, %rcx
	movq	%rcx, %r10
	addq	$22, %rcx
	movslq	%esi, %rsi
	salq	$4, %r10
	movq	%rsi, %rdi
	movq	176(%rbp,%rsi,8), %rsi
	salq	$4, %rdi
	movdqu	0(%rbp,%rdi), %xmm0
	movups	%xmm0, (%r12,%r10)
	movq	%rsi, (%r12,%rcx,8)
	leal	-3(%rax), %esi
	cmpl	$-1, %esi
	je	.L1163
	leal	3(%rax), %edi
	movslq	%esi, %rsi
	movq	%rsi, %r15
	addq	$22, %rsi
	movslq	%edi, %rdi
	salq	$4, %r15
	movq	%rsi, 8(%rsp)
	movq	%rdi, %r8
	movq	176(%rbp,%rdi,8), %rdi
	movq	%r15, (%rsp)
	salq	$4, %r8
	movdqu	0(%rbp,%r8), %xmm0
	movups	%xmm0, (%r12,%r15)
	movq	%rdi, (%r12,%rsi,8)
	leal	-4(%rax), %esi
	cmpl	$-1, %esi
	je	.L1163
	leal	2(%rax), %edi
	movslq	%esi, %r8
	movq	%r8, %r11
	movslq	%edi, %rdi
	salq	$4, %r11
	movq	%rdi, %r14
	movq	176(%rbp,%rdi,8), %rdi
	salq	$4, %r14
	movdqu	0(%rbp,%r14), %xmm0
	movups	%xmm0, (%r12,%r11)
	movq	%rdi, 176(%r12,%r8,8)
	leal	-5(%rax), %r8d
	cmpl	$-1, %r8d
	je	.L1163
	movslq	%r8d, %r11
	leal	1(%rax), %edi
	movq	%r11, %r14
	salq	$4, %r14
	movslq	%edi, %rdi
	movq	%r14, %r15
	movq	%rdi, %r14
	movq	176(%rbp,%rdi,8), %rdi
	salq	$4, %r14
	movdqu	0(%rbp,%r14), %xmm0
	movups	%xmm0, (%r12,%r15)
	movq	%rdi, 176(%r12,%r11,8)
	leal	-6(%rax), %edi
	cmpl	$-1, %edi
	je	.L1163
	movslq	%eax, %r11
	movslq	%edi, %rdi
	movq	%r11, %r15
	movq	176(%rbp,%r11,8), %r11
	movq	%rdi, %r14
	salq	$4, %r15
	salq	$4, %r14
	movdqu	0(%rbp,%r15), %xmm0
	movups	%xmm0, (%r12,%r14)
	movq	%r11, 176(%r12,%rdi,8)
	leal	-7(%rax), %edi
	cmpl	$-1, %edi
	je	.L1163
	movslq	%edi, %rdi
	movq	0(%rbp,%rdx,8), %rdx
	movdqu	0(%rbp,%r9), %xmm0
	movq	%rdi, %r11
	salq	$4, %r11
	movups	%xmm0, (%r12,%r11)
	movq	%rdx, 176(%r12,%rdi,8)
	leal	-8(%rax), %edx
	cmpl	$-1, %edx
	je	.L1163
	movslq	%edx, %rdx
	movq	0(%rbp,%rcx,8), %rcx
	movq	%rdx, %rdi
	movdqu	0(%rbp,%r10), %xmm0
	salq	$4, %rdi
	movups	%xmm0, (%r12,%rdi)
	movq	%rcx, 176(%r12,%rdx,8)
	leal	-9(%rax), %edx
	cmpl	$-1, %edx
	je	.L1163
	movq	(%rsp), %r15
	movslq	%edx, %rdx
	movq	8(%rsp), %rdi
	movq	%rdx, %rcx
	salq	$4, %rcx
	movdqu	0(%rbp,%r15), %xmm0
	movups	%xmm0, (%r12,%rcx)
	movq	0(%rbp,%rdi,8), %rcx
	movq	%rcx, 176(%r12,%rdx,8)
	leal	-10(%rax), %edx
	cmpl	$-1, %edx
	je	.L1163
	movslq	%esi, %rsi
	movslq	%edx, %rdx
	subl	$11, %eax
	movq	%rsi, %rdi
	movq	%rdx, %rcx
	salq	$4, %rdi
	salq	$4, %rcx
	cmpl	$-1, %eax
	movdqu	0(%rbp,%rdi), %xmm0
	movups	%xmm0, (%r12,%rcx)
	movq	176(%rbp,%rsi,8), %rcx
	movq	%rcx, 176(%r12,%rdx,8)
	je	.L1163
	movslq	%r8d, %r8
	cltq
	movq	%r8, %rcx
	movq	%rax, %rdx
	salq	$4, %rcx
	salq	$4, %rdx
	movdqu	0(%rbp,%rcx), %xmm0
	movups	%xmm0, (%r12,%rdx)
	movq	176(%rbp,%r8,8), %rdx
	movq	%rdx, 176(%r12,%rax,8)
	.p2align 4,,10
	.p2align 3
.L1163:
	cmpq	$0, 264(%rbp)
	je	.L1164
	movl	_const_children_bytes(%rip), %edi
	call	v_malloc
	movq	%rax, 264(%r12)
	movq	264(%rbp), %rdx
	movq	88(%rdx), %rdx
	movq	%rdx, 40(%rax)
	movq	264(%rbp), %rdx
	movq	264(%r12), %rax
	movq	80(%rdx), %rdx
	movq	%rdx, 32(%rax)
	movq	264(%rbp), %rdx
	movq	264(%r12), %rax
	movq	72(%rdx), %rdx
	movq	%rdx, 24(%rax)
	movq	264(%rbp), %rdx
	movq	264(%r12), %rax
	movq	64(%rdx), %rdx
	movq	%rdx, 16(%rax)
	movq	264(%rbp), %rdx
	movq	264(%r12), %rax
	movq	56(%rdx), %rdx
	movq	%rdx, 8(%rax)
	movq	264(%rbp), %rdx
	movq	264(%r12), %rax
	movq	48(%rdx), %rdx
	movq	%rdx, (%rax)
.L1164:
	movq	264(%rbx), %rax
	testq	%rax, %rax
	je	.L1198
.L1165:
	movslq	272(%rbx), %rcx
	movq	(%rax,%rcx,8), %rdi
	leaq	0(,%rcx,8), %rsi
	cmpl	%r13d, %ecx
	movq	%rcx, %rdx
	movq	%rdi, 8(%rax,%rsi)
	jle	.L1166
	leal	-1(%rcx), %r8d
	movq	%rcx, %r9
	salq	$4, %r9
	movslq	%r8d, %rdi
	movq	%rdi, %rax
	salq	$4, %rax
	addq	%rbx, %rax
	cmpl	%r8d, %r13d
	movdqu	(%rax), %xmm0
	movups	%xmm0, (%rbx,%r9)
	leaq	(%rbx,%rsi), %r9
	movq	168(%r9), %r10
	movq	%r10, 176(%r9)
	movq	264(%rbx), %r9
	movq	-8(%r9,%rsi), %rsi
	movq	%rsi, (%r9,%rcx,8)
	jge	.L1166
	leal	-2(%rcx), %r8d
	leaq	0(,%rdi,8), %r9
	movslq	%r8d, %rsi
	movq	%rsi, %rcx
	salq	$4, %rcx
	addq	%rbx, %rcx
	cmpl	%r8d, %r13d
	movdqu	(%rcx), %xmm0
	movups	%xmm0, (%rax)
	leaq	(%rbx,%r9), %rax
	movq	168(%rax), %r10
	movq	%r10, 176(%rax)
	movq	264(%rbx), %rax
	movq	-8(%rax,%r9), %r9
	movq	%r9, (%rax,%rdi,8)
	jge	.L1166
	leal	-3(%rdx), %r8d
	leaq	0(,%rsi,8), %r9
	movslq	%r8d, %rdi
	movq	%rdi, %rax
	salq	$4, %rax
	addq	%rbx, %rax
	cmpl	%r8d, %r13d
	movdqu	(%rax), %xmm0
	movups	%xmm0, (%rcx)
	leaq	(%rbx,%r9), %rcx
	movq	168(%rcx), %r10
	movq	%r10, 176(%rcx)
	movq	264(%rbx), %rcx
	movq	-8(%rcx,%r9), %r9
	movq	%r9, (%rcx,%rsi,8)
	jge	.L1166
	leal	-4(%rdx), %r9d
	leaq	0(,%rdi,8), %r8
	movslq	%r9d, %rsi
	movq	%rsi, %rcx
	salq	$4, %rcx
	addq	%rbx, %rcx
	cmpl	%r9d, %r13d
	movdqu	(%rcx), %xmm0
	movups	%xmm0, (%rax)
	leaq	(%rbx,%r8), %rax
	movq	168(%rax), %r10
	movq	%r10, 176(%rax)
	movq	264(%rbx), %rax
	movq	-8(%rax,%r8), %r8
	movq	%r8, (%rax,%rdi,8)
	jge	.L1166
	leal	-5(%rdx), %r9d
	leaq	0(,%rsi,8), %rdi
	movslq	%r9d, %r8
	movq	%r8, %rax
	salq	$4, %rax
	addq	%rbx, %rax
	cmpl	%r9d, %r13d
	movdqu	(%rax), %xmm0
	movups	%xmm0, (%rcx)
	leaq	(%rbx,%rdi), %rcx
	movq	168(%rcx), %r10
	movq	%r10, 176(%rcx)
	movq	264(%rbx), %rcx
	movq	-8(%rcx,%rdi), %rdi
	movq	%rdi, (%rcx,%rsi,8)
	jge	.L1166
	leal	-6(%rdx), %r9d
	leaq	0(,%r8,8), %rcx
	movslq	%r9d, %rdi
	movq	%rdi, %rsi
	salq	$4, %rsi
	addq	%rbx, %rsi
	cmpl	%r9d, %r13d
	movdqu	(%rsi), %xmm0
	movups	%xmm0, (%rax)
	leaq	(%rbx,%rcx), %rax
	movq	168(%rax), %r10
	movq	%r10, 176(%rax)
	movq	264(%rbx), %rax
	movq	-8(%rax,%rcx), %rcx
	movq	%rcx, (%rax,%r8,8)
	jge	.L1166
	leal	-7(%rdx), %eax
	leaq	0(,%rdi,8), %r9
	movslq	%eax, %r8
	movq	%r8, %rcx
	salq	$4, %rcx
	addq	%rbx, %rcx
	cmpl	%eax, %r13d
	movdqu	(%rcx), %xmm0
	movups	%xmm0, (%rsi)
	leaq	(%rbx,%r9), %rsi
	movq	168(%rsi), %r10
	movq	%r10, 176(%rsi)
	movq	264(%rbx), %rsi
	movq	-8(%rsi,%r9), %r9
	movq	%r9, (%rsi,%rdi,8)
	jge	.L1166
	leal	-8(%rdx), %edi
	leaq	0(,%r8,8), %r9
	movslq	%edi, %rsi
	movq	%rsi, %rax
	salq	$4, %rax
	addq	%rbx, %rax
	cmpl	%edi, %r13d
	movdqu	(%rax), %xmm0
	movups	%xmm0, (%rcx)
	leaq	(%rbx,%r9), %rcx
	movq	168(%rcx), %r10
	movq	%r10, 176(%rcx)
	movq	264(%rbx), %rcx
	movq	-8(%rcx,%r9), %r9
	movq	%r9, (%rcx,%r8,8)
	jge	.L1166
	leal	-9(%rdx), %edi
	movslq	%edi, %rcx
	movq	%rcx, %r8
	salq	$4, %r8
	cmpl	%edi, %r13d
	movdqu	(%rbx,%r8), %xmm0
	leaq	0(,%rsi,8), %r8
	movups	%xmm0, (%rax)
	leaq	(%rbx,%r8), %rax
	movq	168(%rax), %r9
	movq	%r9, 176(%rax)
	movq	264(%rbx), %rax
	movq	-8(%rax,%r8), %r8
	movq	%r8, (%rax,%rsi,8)
	jge	.L1166
	leal	-10(%rdx), %eax
	leaq	0(,%rcx,8), %r9
	movq	%rcx, %r8
	salq	$4, %r8
	movslq	%eax, %rdi
	movq	%rdi, %rsi
	salq	$4, %rsi
	addq	%rbx, %rsi
	cmpl	%eax, %r13d
	movdqu	(%rsi), %xmm0
	movups	%xmm0, (%rbx,%r8)
	leaq	(%rbx,%r9), %r8
	movq	168(%r8), %r10
	movq	%r10, 176(%r8)
	movq	264(%rbx), %r8
	movq	-8(%r8,%r9), %r9
	movq	%r9, (%r8,%rcx,8)
	jge	.L1166
	leal	-11(%rdx), %eax
	leaq	0(,%rdi,8), %rcx
	cltq
	salq	$4, %rax
	movdqu	(%rbx,%rax), %xmm0
	leaq	(%rbx,%rcx), %rax
	movups	%xmm0, (%rsi)
	movq	168(%rax), %rsi
	movq	%rsi, 176(%rax)
	movq	264(%rbx), %rax
	movq	-8(%rax,%rcx), %rcx
	movq	%rcx, (%rax,%rdi,8)
.L1166:
	movslq	_const_mid_index(%rip), %rax
	movq	%r13, %rcx
	addl	$1, %edx
	salq	$4, %rcx
	movq	%rax, %rsi
	movq	176(%rbp,%rax,8), %rax
	salq	$4, %rsi
	movdqu	0(%rbp,%rsi), %xmm0
	movups	%xmm0, (%rbx,%rcx)
	movq	%rax, 176(%rbx,%r13,8)
	movq	264(%rbx), %rax
	movq	%rbp, (%rax,%r13,8)
	movq	264(%rbx), %rax
	movq	%r12, 8(%rax,%r13,8)
	movl	%edx, 272(%rbx)
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L1198:
	.cfi_restore_state
	movl	_const_children_bytes(%rip), %edi
	call	v_malloc
	movq	%rax, 264(%rbx)
	jmp	.L1165
	.cfi_endproc
.LFE234:
	.size	mapnode_split_child, .-mapnode_split_child
	.section	.text.cstring_to_vstring,"ax",@progbits
	.p2align 4,,15
	.globl	cstring_to_vstring
	.type	cstring_to_vstring, @function
cstring_to_vstring:
.LFB257:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movq	%rdi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	call	strlen@PLT
	movl	%eax, %ebp
	movq	%rax, %rbx
	movslq	%eax, %r13
	addl	$1, %ebp
	je	.L1204
	movl	%ebp, %edi
	call	v_malloc
	movslq	%ebp, %rdx
	movq	%r12, %rsi
	movq	%rax, %rdi
	call	memcpy@PLT
	movb	$0, (%rax,%r13)
.L1202:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	movl	%ebx, %edx
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L1204:
	.cfi_restore_state
	movl	$1, %esi
	movl	$1, %edi
	call	calloc@PLT
	testq	%rax, %rax
	movb	$0, (%rax,%r13)
	jne	.L1202
	call	tos.part.7
	.cfi_endproc
.LFE257:
	.size	cstring_to_vstring, .-cstring_to_vstring
	.section	.rodata.str1.1
.LC81:
	.string	"tos: nil string"
	.section	.text.tos_clone,"ax",@progbits
	.p2align 4,,15
	.globl	tos_clone
	.type	tos_clone, @function
tos_clone:
.LFB253:
	.cfi_startproc
	testq	%rdi, %rdi
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	je	.L1243
	movq	%rdi, %rbx
	call	strlen@PLT
	leal	1(%rax), %edi
	movq	%rax, %rbp
	movl	%eax, %r12d
	call	v_malloc
	testl	%ebp, %ebp
	jle	.L1207
	leaq	16(%rbx), %rdx
	cmpq	%rdx, %rax
	leaq	16(%rax), %rdx
	setnb	%cl
	cmpq	%rdx, %rbx
	setnb	%dl
	orb	%dl, %cl
	je	.L1208
	cmpl	$22, %ebp
	jbe	.L1208
	movq	%rbx, %rdx
	leal	-1(%rbp), %esi
	negq	%rdx
	andl	$15, %edx
	leal	15(%rdx), %ecx
	cmpl	%ecx, %esi
	jb	.L1217
	testl	%edx, %edx
	je	.L1218
	movzbl	(%rbx), %ecx
	cmpl	$1, %edx
	movb	%cl, (%rax)
	je	.L1219
	movzbl	1(%rbx), %ecx
	cmpl	$2, %edx
	movb	%cl, 1(%rax)
	je	.L1220
	movzbl	2(%rbx), %ecx
	cmpl	$3, %edx
	movb	%cl, 2(%rax)
	je	.L1221
	movzbl	3(%rbx), %ecx
	cmpl	$4, %edx
	movb	%cl, 3(%rax)
	je	.L1222
	movzbl	4(%rbx), %ecx
	cmpl	$5, %edx
	movb	%cl, 4(%rax)
	je	.L1223
	movzbl	5(%rbx), %ecx
	cmpl	$6, %edx
	movb	%cl, 5(%rax)
	je	.L1224
	movzbl	6(%rbx), %ecx
	cmpl	$7, %edx
	movb	%cl, 6(%rax)
	je	.L1225
	movzbl	7(%rbx), %ecx
	cmpl	$8, %edx
	movb	%cl, 7(%rax)
	je	.L1226
	movzbl	8(%rbx), %ecx
	cmpl	$9, %edx
	movb	%cl, 8(%rax)
	je	.L1227
	movzbl	9(%rbx), %ecx
	cmpl	$10, %edx
	movb	%cl, 9(%rax)
	je	.L1228
	movzbl	10(%rbx), %ecx
	cmpl	$11, %edx
	movb	%cl, 10(%rax)
	je	.L1229
	movzbl	11(%rbx), %ecx
	cmpl	$12, %edx
	movb	%cl, 11(%rax)
	je	.L1230
	movzbl	12(%rbx), %ecx
	cmpl	$13, %edx
	movb	%cl, 12(%rax)
	je	.L1231
	movzbl	13(%rbx), %ecx
	cmpl	$15, %edx
	movb	%cl, 13(%rax)
	jne	.L1232
	movzbl	14(%rbx), %ecx
	movb	%cl, 14(%rax)
	movl	$15, %ecx
	.p2align 4,,10
	.p2align 3
.L1210:
	movl	%ebp, %r10d
	movl	%edx, %esi
	xorl	%edi, %edi
	subl	%edx, %r10d
	leaq	(%rbx,%rsi), %r8
	leaq	(%rax,%rsi), %rdx
	movl	%r10d, %r9d
	xorl	%esi, %esi
	shrl	$4, %r9d
	.p2align 4,,10
	.p2align 3
.L1212:
	movdqa	(%r8,%rsi), %xmm0
	addl	$1, %edi
	movups	%xmm0, (%rdx,%rsi)
	addq	$16, %rsi
	cmpl	%edi, %r9d
	ja	.L1212
	movl	%r10d, %edx
	andl	$-16, %edx
	addl	%edx, %ecx
	cmpl	%edx, %r10d
	je	.L1207
.L1209:
	movslq	%ecx, %rcx
	.p2align 4,,10
	.p2align 3
.L1214:
	movzbl	(%rbx,%rcx), %edx
	movb	%dl, (%rax,%rcx)
	addq	$1, %rcx
	cmpl	%ecx, %r12d
	jg	.L1214
.L1207:
	movslq	%ebp, %rdx
	movb	$0, (%rax,%rdx)
	movl	%ebp, %edx
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L1219:
	.cfi_restore_state
	movl	$1, %ecx
	jmp	.L1210
	.p2align 4,,10
	.p2align 3
.L1208:
	leal	-1(%rbp), %esi
	xorl	%edx, %edx
	addq	$1, %rsi
	.p2align 4,,10
	.p2align 3
.L1215:
	movzbl	(%rbx,%rdx), %ecx
	movb	%cl, (%rax,%rdx)
	addq	$1, %rdx
	cmpq	%rsi, %rdx
	jne	.L1215
	movslq	%ebp, %rdx
	movb	$0, (%rax,%rdx)
	movl	%ebp, %edx
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L1220:
	.cfi_restore_state
	movl	$2, %ecx
	jmp	.L1210
	.p2align 4,,10
	.p2align 3
.L1217:
	xorl	%ecx, %ecx
	jmp	.L1209
	.p2align 4,,10
	.p2align 3
.L1221:
	movl	$3, %ecx
	jmp	.L1210
	.p2align 4,,10
	.p2align 3
.L1222:
	movl	$4, %ecx
	jmp	.L1210
.L1225:
	movl	$7, %ecx
	jmp	.L1210
	.p2align 4,,10
	.p2align 3
.L1223:
	movl	$5, %ecx
	jmp	.L1210
.L1224:
	movl	$6, %ecx
	jmp	.L1210
.L1218:
	xorl	%ecx, %ecx
	jmp	.L1210
.L1226:
	movl	$8, %ecx
	jmp	.L1210
.L1227:
	movl	$9, %ecx
	jmp	.L1210
.L1228:
	movl	$10, %ecx
	jmp	.L1210
.L1229:
	movl	$11, %ecx
	jmp	.L1210
.L1230:
	movl	$12, %ecx
	jmp	.L1210
.L1231:
	movl	$13, %ecx
	jmp	.L1210
.L1232:
	movl	$14, %ecx
	jmp	.L1210
.L1243:
	leaq	.LC81(%rip), %rdi
	movl	$15, %esi
	call	v_panic
	.cfi_endproc
.LFE253:
	.size	tos_clone, .-tos_clone
	.section	.text.new_map_init,"ax",@progbits
	.p2align 4,,15
	.globl	new_map_init
	.type	new_map_init, @function
new_map_init:
.LFB211:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movslq	%edx, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	$192, %edi
	movl	%esi, %r13d
	movq	%rcx, %rbx
	movq	%r8, %rbp
	subq	$88, %rsp
	.cfi_def_cfa_offset 144
	movl	_const_init_cap(%rip), %r15d
	movq	%fs:40, %rax
	movq	%rax, 72(%rsp)
	xorl	%eax, %eax
	call	v_malloc
	movq	%rax, (%rsp)
	movl	_const_init_capicity(%rip), %eax
	leal	16(,%rax,4), %edi
	testl	%edi, %edi
	jle	.L1251
	movslq	%edi, %rdi
	movl	$1, %esi
	call	calloc@PLT
	movq	(%rsp), %xmm0
	movq	%rax, 8(%rsp)
	movhps	8(%rsp), %xmm0
	movl	$1296, %eax
	testl	%r13d, %r13d
	movl	%r14d, 16(%rsp)
	movl	%r15d, 20(%rsp)
	movw	%ax, 24(%rsp)
	movq	$8, 32(%rsp)
	movl	$0, 40(%rsp)
	movq	$4, 64(%rsp)
	movaps	%xmm0, 48(%rsp)
	jle	.L1246
	leal	-1(%r13), %eax
	leaq	16(%rsp), %r13
	salq	$4, %rax
	leaq	16(%rbx,%rax), %r15
	.p2align 4,,10
	.p2align 3
.L1247:
	movq	(%rbx), %rsi
	movq	8(%rbx), %rdx
	movq	%rbp, %rcx
	movq	%r13, %rdi
	addq	$16, %rbx
	addq	%r14, %rbp
	call	map_set
	cmpq	%r15, %rbx
	jne	.L1247
.L1246:
	movdqa	16(%rsp), %xmm0
	movq	64(%rsp), %rax
	movups	%xmm0, (%r12)
	movq	72(%rsp), %rcx
	xorq	%fs:40, %rcx
	movdqa	32(%rsp), %xmm0
	movq	%rax, 48(%r12)
	movq	%r12, %rax
	movups	%xmm0, 16(%r12)
	movdqa	48(%rsp), %xmm0
	movups	%xmm0, 32(%r12)
	jne	.L1252
	addq	$88, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L1251:
	.cfi_restore_state
	call	vcalloc.part.5
.L1252:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE211:
	.size	new_map_init, .-new_map_init
	.section	.text.byte_hex,"ax",@progbits
	.p2align 4,,15
	.globl	byte_hex
	.type	byte_hex, @function
byte_hex:
.LFB194:
	.cfi_startproc
	testb	%dil, %dil
	jne	.L1254
	leaq	.LC80(%rip), %rax
	movl	$1, %edx
	ret
	.p2align 4,,10
	.p2align 3
.L1254:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	%edi, %ebx
	movl	$3, %edi
	call	v_malloc
	movl	$1, %esi
	movb	$0, 2(%rax)
	leaq	1(%rax), %rdx
	jmp	.L1258
	.p2align 4,,10
	.p2align 3
.L1259:
	movl	%edi, %esi
.L1258:
	movl	%ebx, %eax
	shrb	$4, %bl
	andl	$15, %eax
	leal	48(%rax), %edi
	leal	87(%rax), %ecx
	cmpb	$9, %al
	movq	%rdx, %rax
	cmovbe	%edi, %ecx
	subq	$1, %rdx
	leal	-1(%rsi), %edi
	movb	%cl, 1(%rdx)
	testb	%bl, %bl
	jne	.L1259
	movl	$2, %edx
	subl	%esi, %edx
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE194:
	.size	byte_hex, .-byte_hex
	.section	.text.u16_hex,"ax",@progbits
	.p2align 4,,15
	.globl	u16_hex
	.type	u16_hex, @function
u16_hex:
.LFB196:
	.cfi_startproc
	testw	%di, %di
	jne	.L1264
	leaq	.LC80(%rip), %rax
	movl	$1, %edx
	ret
	.p2align 4,,10
	.p2align 3
.L1264:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	%edi, %ebx
	movl	$6, %edi
	call	v_malloc
	movl	$4, %esi
	movb	$0, 5(%rax)
	leaq	4(%rax), %rdx
	jmp	.L1268
	.p2align 4,,10
	.p2align 3
.L1269:
	movl	%edi, %esi
.L1268:
	movl	%ebx, %eax
	shrw	$4, %bx
	andl	$15, %eax
	leal	48(%rax), %edi
	leal	87(%rax), %ecx
	cmpw	$9, %ax
	movq	%rdx, %rax
	cmovbe	%edi, %ecx
	subq	$1, %rdx
	leal	-1(%rsi), %edi
	movb	%cl, 1(%rdx)
	testw	%bx, %bx
	jne	.L1269
	movl	$5, %edx
	subl	%esi, %edx
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE196:
	.size	u16_hex, .-u16_hex
	.section	.text.u32_hex,"ax",@progbits
	.p2align 4,,15
	.globl	u32_hex
	.type	u32_hex, @function
u32_hex:
.LFB198:
	.cfi_startproc
	testl	%edi, %edi
	jne	.L1274
	leaq	.LC80(%rip), %rax
	movl	$1, %edx
	ret
	.p2align 4,,10
	.p2align 3
.L1274:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	%edi, %ebx
	movl	$11, %edi
	call	v_malloc
	movl	$9, %esi
	movb	$0, 10(%rax)
	leaq	9(%rax), %rdx
	jmp	.L1278
	.p2align 4,,10
	.p2align 3
.L1279:
	movl	%edi, %esi
.L1278:
	movl	%ebx, %eax
	shrl	$4, %ebx
	andl	$15, %eax
	leal	48(%rax), %edi
	leal	87(%rax), %ecx
	cmpl	$9, %eax
	movq	%rdx, %rax
	cmovbe	%edi, %ecx
	subq	$1, %rdx
	leal	-1(%rsi), %edi
	movb	%cl, 1(%rdx)
	testl	%ebx, %ebx
	jne	.L1279
	movl	$10, %edx
	subl	%esi, %edx
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE198:
	.size	u32_hex, .-u32_hex
	.section	.text.ptr_str,"ax",@progbits
	.p2align 4,,15
	.globl	ptr_str
	.type	ptr_str, @function
ptr_str:
.LFB184:
	.cfi_startproc
	testq	%rdi, %rdi
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	je	.L1288
	movq	%rdi, %rbx
	movl	$19, %edi
	call	v_malloc
	movl	$17, %edi
	movq	%rax, %r8
	movb	$0, 18(%rax)
	leaq	17(%rax), %rax
	jmp	.L1287
	.p2align 4,,10
	.p2align 3
.L1289:
	movl	%ecx, %edi
.L1287:
	movq	%rbx, %rcx
	shrq	$4, %rbx
	andl	$15, %ecx
	leal	48(%rcx), %esi
	leal	87(%rcx), %edx
	cmpq	$9, %rcx
	leal	-1(%rdi), %ecx
	cmovbe	%esi, %edx
	movq	%rax, %rsi
	subq	$1, %rax
	movb	%dl, 1(%rax)
	testq	%rbx, %rbx
	jne	.L1289
	movl	$19, %edx
	movl	$18, %ebx
	subl	%edi, %edx
	subl	%edi, %ebx
	movq	%r8, %rdi
	movslq	%edx, %rdx
	call	memmove@PLT
	movq	%rax, %r8
	movl	%ebx, %edx
	movq	%r8, %rax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L1288:
	.cfi_restore_state
	leaq	.LC80(%rip), %r8
	movl	$1, %ebx
	movl	%ebx, %edx
	movq	%r8, %rax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE184:
	.size	ptr_str, .-ptr_str
	.section	.text.u64_hex,"ax",@progbits
	.p2align 4,,15
	.globl	u64_hex
	.type	u64_hex, @function
u64_hex:
.LFB200:
	.cfi_startproc
	testq	%rdi, %rdi
	jne	.L1292
	leaq	.LC80(%rip), %rax
	movl	$1, %edx
	ret
	.p2align 4,,10
	.p2align 3
.L1292:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbx
	movl	$19, %edi
	movl	$17, %ebp
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	call	v_malloc
	movq	%rax, %r8
	movb	$0, 18(%rax)
	leaq	17(%rax), %rdx
	jmp	.L1296
	.p2align 4,,10
	.p2align 3
.L1297:
	movl	%eax, %ebp
.L1296:
	movq	%rbx, %rsi
	shrq	$4, %rbx
	leal	-1(%rbp), %eax
	andl	$15, %esi
	leal	48(%rsi), %edi
	leal	87(%rsi), %ecx
	cmpq	$9, %rsi
	movq	%rdx, %rsi
	cmovbe	%edi, %ecx
	subq	$1, %rdx
	movb	%cl, 1(%rdx)
	testq	%rbx, %rbx
	jne	.L1297
	movl	$19, %edx
	movq	%r8, %rdi
	subl	%ebp, %edx
	movslq	%edx, %rdx
	call	memmove@PLT
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	movl	$18, %edx
	subl	%ebp, %edx
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE200:
	.size	u64_hex, .-u64_hex
	.section	.rodata.str1.8
	.align 8
.LC82:
	.string	"option size too big: %d (max is 400), this is a temporary limit"
	.section	.text.opt_ok,"ax",@progbits
	.p2align 4,,15
	.globl	opt_ok
	.type	opt_ok, @function
opt_ok:
.LFB226:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	subq	$448, %rsp
	.cfi_def_cfa_offset 464
	movq	%fs:40, %rax
	movq	%rax, 440(%rsp)
	xorl	%eax, %eax
	cmpl	$399, %edx
	jg	.L1305
	movq	%rdi, %rbx
	xorl	%eax, %eax
	movq	%rsp, %rdi
	movl	$54, %ecx
	movq	%rsp, %r8
	movslq	%edx, %rdx
	rep stosq
	leaq	.LC37(%rip), %rax
	movl	$432, %ecx
	movq	%r8, %rdi
	movl	$1, 420(%rsp)
	movq	%rax, 400(%rsp)
	call	__memcpy_chk@PLT
	movq	%rbx, %rdi
	movq	%rax, %rsi
	movq	%rbx, %rax
	movq	440(%rsp), %rbx
	xorq	%fs:40, %rbx
	movl	$54, %ecx
	rep movsq
	jne	.L1306
	addq	$448, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
.L1305:
	.cfi_restore_state
	leaq	.LC82(%rip), %rdi
	movl	%edx, %esi
	call	_STR
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	v_panic
.L1306:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE226:
	.size	opt_ok, .-opt_ok
	.section	.text.string_index,"ax",@progbits
	.p2align 4,,15
	.globl	string_index
	.type	string_index, @function
string_index:
.LFB288:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	testl	%r8d, %r8d
	je	.L1309
	cmpl	%r8d, %edx
	jge	.L1320
.L1309:
	xorl	%eax, %eax
	movl	$54, %ecx
	movq	%rbx, %rdi
	rep stosq
	leaq	.LC37(%rip), %rax
	movl	$1, 424(%rbx)
	movq	%rax, 400(%rbx)
.L1307:
	movq	%rbx, %rax
	movq	8(%rsp), %rbx
	xorq	%fs:40, %rbx
	jne	.L1321
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L1320:
	.cfi_restore_state
	testl	%edx, %edx
	jle	.L1309
	movl	%r8d, %r9d
	movq	%rsi, %rdi
	leal	-1(%r8), %r8d
	leal	-1(%rdx), %eax
	movl	%edi, %r10d
	addq	$1, %r8
	subl	%esi, %r10d
	testl	%r9d, %r9d
	leaq	1(%rsi,%rax), %r11
	jle	.L1317
	.p2align 4,,10
	.p2align 3
.L1324:
	movzbl	(%rcx), %edx
	movl	$1, %eax
	cmpb	%dl, (%rdi)
	je	.L1313
	jmp	.L1314
	.p2align 4,,10
	.p2align 3
.L1322:
	movzbl	(%rdi,%rax), %edx
	addq	$1, %rax
	cmpb	-1(%rcx,%rax), %dl
	jne	.L1314
.L1313:
	cmpq	%rax, %r8
	movl	%eax, %edx
	jne	.L1322
	cmpl	%edx, %r9d
	je	.L1323
.L1314:
	addq	$1, %rdi
	cmpq	%r11, %rdi
	je	.L1309
	movl	%edi, %r10d
	subl	%esi, %r10d
	testl	%r9d, %r9d
	jg	.L1324
.L1317:
	xorl	%edx, %edx
	cmpl	%edx, %r9d
	jne	.L1314
	.p2align 4,,10
	.p2align 3
.L1323:
	leaq	4(%rsp), %rsi
	movl	$4, %edx
	movq	%rbx, %rdi
	movl	%r10d, 4(%rsp)
	call	opt_ok
	jmp	.L1307
.L1321:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE288:
	.size	string_index, .-string_index
	.section	.text.string_contains,"ax",@progbits
	.p2align 4,,15
	.globl	string_contains
	.type	string_contains, @function
string_contains:
.LFB296:
	.cfi_startproc
	subq	$456, %rsp
	.cfi_def_cfa_offset 464
	movq	%rsi, %rax
	movq	%rdi, %r9
	movq	%fs:40, %rsi
	movq	%rsi, 440(%rsp)
	xorl	%esi, %esi
	movq	%rcx, %r8
	movq	%r9, %rsi
	movq	%rdx, %rcx
	movq	%rsp, %rdi
	movq	%rax, %rdx
	call	string_index
	movl	420(%rsp), %eax
	testl	%eax, %eax
	setne	%al
	movq	440(%rsp), %rsi
	xorq	%fs:40, %rsi
	jne	.L1328
	movzbl	%al, %eax
	addq	$456, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L1328:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE296:
	.size	string_contains, .-string_contains
	.section	.text.string_last_index,"ax",@progbits
	.p2align 4,,15
	.globl	string_last_index
	.type	string_last_index, @function
string_last_index:
.LFB291:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	testl	%r8d, %r8d
	je	.L1337
	cmpl	%edx, %r8d
	jle	.L1330
.L1337:
	xorl	%eax, %eax
	movl	$54, %ecx
	movq	%rbx, %rdi
	rep stosq
	leaq	.LC37(%rip), %rax
	movl	$1, 424(%rbx)
	movq	%rax, 400(%rbx)
.L1329:
	movq	%rbx, %rax
	movq	8(%rsp), %rbx
	xorq	%fs:40, %rbx
	jne	.L1344
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L1330:
	.cfi_restore_state
	subl	%r8d, %edx
	movl	%r8d, %r9d
	leal	-1(%r8), %r8d
	movslq	%edx, %rax
	addq	%rax, %rsi
	addq	$1, %r8
	testl	%r9d, %r9d
	jle	.L1340
	.p2align 4,,10
	.p2align 3
.L1347:
	movzbl	(%rsi), %edi
	movl	$1, %eax
	cmpb	%dil, (%rcx)
	je	.L1335
	jmp	.L1336
	.p2align 4,,10
	.p2align 3
.L1345:
	movzbl	(%rsi,%rax), %edi
	addq	$1, %rax
	cmpb	-1(%rcx,%rax), %dil
	jne	.L1336
.L1335:
	cmpq	%rax, %r8
	movl	%eax, %edi
	jne	.L1345
	cmpl	%edi, %r9d
	je	.L1346
.L1336:
	subl	$1, %edx
	subq	$1, %rsi
	cmpl	$-1, %edx
	je	.L1337
	testl	%r9d, %r9d
	jg	.L1347
.L1340:
	xorl	%edi, %edi
	cmpl	%edi, %r9d
	jne	.L1336
	.p2align 4,,10
	.p2align 3
.L1346:
	leaq	4(%rsp), %rsi
	movl	%edx, 4(%rsp)
	movq	%rbx, %rdi
	movl	$4, %edx
	call	opt_ok
	jmp	.L1329
.L1344:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE291:
	.size	string_last_index, .-string_last_index
	.section	.text.string_index_any,"ax",@progbits
	.p2align 4,,15
	.globl	string_index_any
	.type	string_index_any, @function
string_index_any:
.LFB290:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$488, %rsp
	.cfi_def_cfa_offset 544
	movq	%fs:40, %rax
	movq	%rax, 472(%rsp)
	xorl	%eax, %eax
	testl	%ecx, %ecx
	jle	.L1355
	leal	-1(%rcx), %eax
	leaq	32(%rsp), %r14
	leaq	28(%rsp), %r13
	movq	%rdi, %r12
	movl	%esi, %ebp
	movq	%rdx, %rbx
	leaq	1(%rdx,%rax), %rax
	movq	%rax, (%rsp)
	leal	-1(%rsi), %eax
	movl	%eax, 12(%rsp)
.L1354:
	movzbl	(%rbx), %r15d
	movl	$2, %edi
	call	v_malloc
	testl	%ebp, %ebp
	movb	$0, 1(%rax)
	movb	%r15b, (%rax)
	jle	.L1351
	movl	12(%rsp), %ecx
	xorl	%eax, %eax
	addq	$1, %rcx
.L1357:
	cmpb	(%r12,%rax), %r15b
	jne	.L1364
	movl	$4, %edx
	movq	%r13, %rsi
	movq	%r14, %rdi
	movl	%eax, 28(%rsp)
	call	opt_ok
	movl	452(%rsp), %eax
	testl	%eax, %eax
	je	.L1351
	movl	32(%rsp), %eax
.L1348:
	movq	472(%rsp), %rdi
	xorq	%fs:40, %rdi
	jne	.L1365
	addq	$488, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L1364:
	.cfi_restore_state
	addq	$1, %rax
	cmpq	%rax, %rcx
	jne	.L1357
.L1351:
	addq	$1, %rbx
	cmpq	(%rsp), %rbx
	jne	.L1354
.L1355:
	movl	$-1, %eax
	jmp	.L1348
.L1365:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE290:
	.size	string_index_any, .-string_index_any
	.section	.rodata.str1.8
	.align 8
.LC83:
	.string	"substr(%d, %d) out of bounds (len=%d)"
	.section	.text.string_substr,"ax",@progbits
	.p2align 4,,15
	.globl	string_substr
	.type	string_substr, @function
string_substr:
.LFB286:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	cmpl	%ecx, %edx
	movl	%edx, %r12d
	setg	%dl
	cmpl	%esi, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	setg	%al
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movl	%ecx, %ebx
	orb	%al, %dl
	jne	.L1367
	cmpl	%esi, %ecx
	jg	.L1367
	testl	%r12d, %r12d
	js	.L1367
	testl	%ecx, %ecx
	js	.L1367
	subl	%r12d, %ebx
	movq	%rdi, %rbp
	leal	1(%rbx), %edi
	call	v_malloc
	testl	%ebx, %ebx
	jle	.L1370
	movslq	%r12d, %r9
	leaq	16(%r9,%rbp), %rdx
	leaq	0(%rbp,%r9), %rdi
	cmpq	%rdx, %rax
	leaq	16(%rax), %rdx
	setnb	%cl
	cmpq	%rdx, %rdi
	setnb	%dl
	orb	%dl, %cl
	je	.L1371
	cmpl	$22, %ebx
	jbe	.L1371
	movq	%rdi, %rcx
	leal	-1(%rbx), %esi
	negq	%rcx
	andl	$15, %ecx
	leal	15(%rcx), %edx
	cmpl	%edx, %esi
	jb	.L1380
	testl	%ecx, %ecx
	je	.L1381
	movzbl	(%rdi), %edx
	cmpl	$1, %ecx
	movb	%dl, (%rax)
	je	.L1382
	leal	1(%r12), %edx
	cmpl	$2, %ecx
	movslq	%edx, %rdx
	movzbl	0(%rbp,%rdx), %edx
	movb	%dl, 1(%rax)
	je	.L1383
	leal	2(%r12), %edx
	cmpl	$3, %ecx
	movslq	%edx, %rdx
	movzbl	0(%rbp,%rdx), %edx
	movb	%dl, 2(%rax)
	je	.L1384
	leal	3(%r12), %edx
	cmpl	$4, %ecx
	movslq	%edx, %rdx
	movzbl	0(%rbp,%rdx), %edx
	movb	%dl, 3(%rax)
	je	.L1385
	leal	4(%r12), %edx
	cmpl	$5, %ecx
	movslq	%edx, %rdx
	movzbl	0(%rbp,%rdx), %edx
	movb	%dl, 4(%rax)
	je	.L1386
	leal	5(%r12), %edx
	cmpl	$6, %ecx
	movslq	%edx, %rdx
	movzbl	0(%rbp,%rdx), %edx
	movb	%dl, 5(%rax)
	je	.L1387
	leal	6(%r12), %edx
	cmpl	$7, %ecx
	movslq	%edx, %rdx
	movzbl	0(%rbp,%rdx), %edx
	movb	%dl, 6(%rax)
	je	.L1388
	leal	7(%r12), %edx
	cmpl	$8, %ecx
	movslq	%edx, %rdx
	movzbl	0(%rbp,%rdx), %edx
	movb	%dl, 7(%rax)
	je	.L1389
	leal	8(%r12), %edx
	cmpl	$9, %ecx
	movslq	%edx, %rdx
	movzbl	0(%rbp,%rdx), %edx
	movb	%dl, 8(%rax)
	je	.L1390
	leal	9(%r12), %edx
	cmpl	$10, %ecx
	movslq	%edx, %rdx
	movzbl	0(%rbp,%rdx), %edx
	movb	%dl, 9(%rax)
	je	.L1391
	leal	10(%r12), %edx
	cmpl	$11, %ecx
	movslq	%edx, %rdx
	movzbl	0(%rbp,%rdx), %edx
	movb	%dl, 10(%rax)
	je	.L1392
	leal	11(%r12), %edx
	cmpl	$12, %ecx
	movslq	%edx, %rdx
	movzbl	0(%rbp,%rdx), %edx
	movb	%dl, 11(%rax)
	je	.L1393
	leal	12(%r12), %edx
	cmpl	$13, %ecx
	movslq	%edx, %rdx
	movzbl	0(%rbp,%rdx), %edx
	movb	%dl, 12(%rax)
	je	.L1394
	leal	13(%r12), %edx
	cmpl	$15, %ecx
	movslq	%edx, %rdx
	movzbl	0(%rbp,%rdx), %edx
	movb	%dl, 13(%rax)
	jne	.L1395
	leal	14(%r12), %edx
	movl	$15, %esi
	movslq	%edx, %rdx
	movzbl	0(%rbp,%rdx), %edx
	movb	%dl, 14(%rax)
	.p2align 4,,10
	.p2align 3
.L1373:
	movl	%ebx, %r11d
	movl	%ecx, %r8d
	xorl	%edx, %edx
	subl	%ecx, %r11d
	addq	%r8, %r9
	xorl	%ecx, %ecx
	movl	%r11d, %r10d
	addq	%r9, %rbp
	addq	%rax, %r8
	shrl	$4, %r10d
	.p2align 4,,10
	.p2align 3
.L1375:
	movdqa	0(%rbp,%rdx), %xmm0
	addl	$1, %ecx
	movups	%xmm0, (%r8,%rdx)
	addq	$16, %rdx
	cmpl	%ecx, %r10d
	ja	.L1375
	movl	%r11d, %edx
	andl	$-16, %edx
	addl	%edx, %esi
	cmpl	%edx, %r11d
	je	.L1370
.L1372:
	movslq	%esi, %rsi
	.p2align 4,,10
	.p2align 3
.L1377:
	movzbl	(%rdi,%rsi), %edx
	movb	%dl, (%rax,%rsi)
	addq	$1, %rsi
	cmpl	%esi, %ebx
	jg	.L1377
.L1370:
	movslq	%ebx, %rdx
	movb	$0, (%rax,%rdx)
	movl	%ebx, %edx
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L1382:
	.cfi_restore_state
	movl	$1, %esi
	jmp	.L1373
	.p2align 4,,10
	.p2align 3
.L1371:
	leal	-1(%rbx), %esi
	xorl	%edx, %edx
	addq	$1, %rsi
	.p2align 4,,10
	.p2align 3
.L1378:
	movzbl	(%rdi,%rdx), %ecx
	movb	%cl, (%rax,%rdx)
	addq	$1, %rdx
	cmpq	%rsi, %rdx
	jne	.L1378
	movslq	%ebx, %rdx
	movb	$0, (%rax,%rdx)
	movl	%ebx, %edx
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L1383:
	.cfi_restore_state
	movl	$2, %esi
	jmp	.L1373
	.p2align 4,,10
	.p2align 3
.L1380:
	xorl	%esi, %esi
	jmp	.L1372
	.p2align 4,,10
	.p2align 3
.L1384:
	movl	$3, %esi
	jmp	.L1373
	.p2align 4,,10
	.p2align 3
.L1385:
	movl	$4, %esi
	jmp	.L1373
.L1388:
	movl	$7, %esi
	jmp	.L1373
	.p2align 4,,10
	.p2align 3
.L1386:
	movl	$5, %esi
	jmp	.L1373
.L1387:
	movl	$6, %esi
	jmp	.L1373
.L1381:
	xorl	%esi, %esi
	jmp	.L1373
.L1389:
	movl	$8, %esi
	jmp	.L1373
.L1390:
	movl	$9, %esi
	jmp	.L1373
.L1391:
	movl	$10, %esi
	jmp	.L1373
.L1392:
	movl	$11, %esi
	jmp	.L1373
.L1393:
	movl	$12, %esi
	jmp	.L1373
.L1394:
	movl	$13, %esi
	jmp	.L1373
.L1395:
	movl	$14, %esi
	jmp	.L1373
.L1367:
	leaq	.LC83(%rip), %rdi
	movl	%esi, %ecx
	movl	%ebx, %edx
	movl	%r12d, %esi
	xorl	%eax, %eax
	call	_STR
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	v_panic
	.cfi_endproc
.LFE286:
	.size	string_substr, .-string_substr
	.section	.text.string_replace_once,"ax",@progbits
	.p2align 4,,15
	.globl	string_replace_once
	.type	string_replace_once, @function
string_replace_once:
.LFB258:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%r9, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rcx, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbp
	movq	%rsi, %rbx
	movq	%rdx, %rcx
	movq	%r8, %r13
	subq	$472, %rsp
	.cfi_def_cfa_offset 528
	movq	%r12, %r8
	movq	%rbp, %rsi
	leaq	16(%rsp), %rdi
	movq	%rbx, %rdx
	movq	%fs:40, %rax
	movq	%rax, 456(%rsp)
	xorl	%eax, %eax
	call	string_index
	movl	436(%rsp), %eax
	testl	%eax, %eax
	jne	.L1407
	movq	456(%rsp), %rcx
	xorq	%fs:40, %rcx
	movq	%rbp, %rax
	movq	%rbx, %rdx
	jne	.L1411
	addq	$472, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L1407:
	.cfi_restore_state
	movl	16(%rsp), %r15d
	movl	%ebx, %ecx
	movq	%rbp, %rdi
	movq	%rbx, %rsi
	leal	(%r15,%r12), %edx
	call	string_substr
	movl	%r15d, %ecx
	movq	%rdx, 8(%rsp)
	movq	%rbp, %rdi
	xorl	%edx, %edx
	movq	%rbx, %rsi
	movq	%rax, (%rsp)
	call	string_substr
	movq	%r14, %rcx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movq	%r13, %rdx
	call	string_add
	movq	456(%rsp), %rcx
	xorq	%fs:40, %rcx
	jne	.L1411
	movq	%rdx, %rsi
	movq	8(%rsp), %rcx
	movq	(%rsp), %rdx
	addq	$472, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%rax, %rdi
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	string_add
.L1411:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE258:
	.size	string_replace_once, .-string_replace_once
	.section	.text.string_split_into_lines,"ax",@progbits
	.p2align 4,,15
	.globl	string_split_into_lines
	.type	string_split_into_lines, @function
string_split_into_lines:
.LFB282:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%edx, %r15d
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdi, %r13
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdx, %r12
	movl	$16, %edi
	subq	$88, %rsp
	.cfi_def_cfa_offset 144
	movq	%rsi, 8(%rsp)
	movl	$1, %esi
	movq	%fs:40, %rax
	movq	%rax, 72(%rsp)
	xorl	%eax, %eax
	call	calloc@PLT
	cmpl	$0, %r12d
	movq	%rax, 48(%rsp)
	movabsq	$4294967296, %rax
	movq	%rax, 56(%rsp)
	movl	$16, 64(%rsp)
	je	.L1414
	movq	8(%rsp), %r8
	jle	.L1414
	leaq	32(%rsp), %rax
	leal	-1(%r12), %r14d
	xorl	%ebx, %ebx
	xorl	%edx, %edx
	movq	%rax, 16(%rsp)
	leaq	48(%rsp), %rax
	movq	%rax, 24(%rsp)
	jmp	.L1424
	.p2align 4,,10
	.p2align 3
.L1417:
	cmpl	%ebx, %r14d
	leal	1(%rbx), %ebp
	sete	%cl
	testb	%sil, %sil
	jne	.L1427
	testb	%cl, %cl
	jne	.L1427
.L1420:
	cmpl	%ebp, %r15d
	movl	%ebp, %ebx
	jle	.L1414
.L1424:
	movslq	%ebx, %rcx
	movzbl	(%r8,%rcx), %eax
	cmpb	$10, %al
	sete	%sil
	cmpb	$13, %al
	jne	.L1417
	cmpl	%ebx, %r14d
	je	.L1417
	cmpb	$10, 1(%r8,%rcx)
	leal	1(%rbx), %ebp
	jne	.L1420
	movabsq	$-4294967296, %rdi
	movl	%r15d, %eax
	movl	%ebx, %ecx
	andq	%rdi, %r12
	movq	%r8, %rdi
	movq	%r8, 8(%rsp)
	orq	%rax, %r12
	leal	2(%rbx), %ebp
	movq	%r12, %rsi
	call	string_substr
	movq	16(%rsp), %rsi
	movq	24(%rsp), %rdi
	movq	%rdx, 40(%rsp)
	movq	%rax, 32(%rsp)
	call	array_push
	movq	8(%rsp), %r8
	movl	%ebp, %edx
.L1446:
	cmpl	%ebp, %r15d
	movl	%ebp, %ebx
	jg	.L1424
.L1414:
	movq	64(%rsp), %rax
	movdqa	48(%rsp), %xmm0
	movq	72(%rsp), %rdx
	xorq	%fs:40, %rdx
	movq	%rax, 16(%r13)
	movq	%r13, %rax
	movups	%xmm0, 0(%r13)
	jne	.L1445
	addq	$88, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L1445:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
.L1427:
	cmpb	$10, %al
	je	.L1428
	testb	%cl, %cl
	je	.L1428
.L1422:
	movabsq	$-4294967296, %rdi
	movl	%r15d, %eax
	movl	%ebp, %ecx
	andq	%rdi, %r12
	movq	%r8, %rdi
	movq	%r8, 8(%rsp)
	orq	%rax, %r12
	addl	$1, %ebp
	movq	%r12, %rsi
	call	string_substr
	movq	16(%rsp), %rsi
	movq	24(%rsp), %rdi
	movq	%rdx, 40(%rsp)
	movq	%rax, 32(%rsp)
	call	array_push
	movq	8(%rsp), %r8
	movl	%ebp, %edx
	jmp	.L1446
.L1428:
	movl	%ebx, %ebp
	jmp	.L1422
	.cfi_endproc
.LFE282:
	.size	string_split_into_lines, .-string_split_into_lines
	.section	.text.string_left,"ax",@progbits
	.p2align 4,,15
	.globl	string_left
	.type	string_left, @function
string_left:
.LFB283:
	.cfi_startproc
	cmpl	%esi, %edx
	jl	.L1451
	movq	%rdi, %rax
	movq	%rsi, %rdx
	ret
	.p2align 4,,10
	.p2align 3
.L1451:
	movl	%edx, %ecx
	xorl	%edx, %edx
	jmp	string_substr
	.cfi_endproc
.LFE283:
	.size	string_left, .-string_left
	.section	.text.string_all_before,"ax",@progbits
	.p2align 4,,15
	.globl	string_all_before
	.type	string_all_before, @function
string_all_before:
.LFB341:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rsi, %rbx
	movq	%rcx, %r8
	movl	%esi, %r12d
	movq	%rdx, %rcx
	movq	%rbp, %rsi
	subq	$448, %rsp
	.cfi_def_cfa_offset 480
	movq	%rbx, %rdx
	movq	%rsp, %rdi
	movq	%fs:40, %rax
	movq	%rax, 440(%rsp)
	xorl	%eax, %eax
	call	string_index
	movl	420(%rsp), %eax
	testl	%eax, %eax
	je	.L1459
	movl	(%rsp), %ecx
	cmpl	%ebx, %ecx
	jl	.L1455
	movq	%rbp, %rax
	movq	%rbx, %rdx
.L1456:
	movabsq	$-4294967296, %rcx
	movl	%r12d, %ebx
	andq	%rcx, %rdx
	orq	%rbx, %rdx
.L1454:
	movq	440(%rsp), %rsi
	xorq	%fs:40, %rsi
	jne	.L1460
	addq	$448, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L1459:
	.cfi_restore_state
	movq	%rbp, %rax
	movq	%rbx, %rdx
	jmp	.L1454
	.p2align 4,,10
	.p2align 3
.L1455:
	xorl	%edx, %edx
	movq	%rbp, %rdi
	movq	%rbx, %rsi
	call	string_substr
	movl	%edx, %r12d
	jmp	.L1456
.L1460:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE341:
	.size	string_all_before, .-string_all_before
	.section	.text.string_all_before_last,"ax",@progbits
	.p2align 4,,15
	.globl	string_all_before_last
	.type	string_all_before_last, @function
string_all_before_last:
.LFB342:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rax
	movq	%rsi, %rbx
	subq	$488, %rsp
	.cfi_def_cfa_offset 512
	movq	%fs:40, %rdi
	movq	%rdi, 472(%rsp)
	xorl	%edi, %edi
	testl	%ecx, %ecx
	je	.L1462
	cmpl	%ecx, %esi
	jge	.L1480
.L1462:
	movq	%rbx, %rdx
.L1469:
	movq	472(%rsp), %rbx
	xorq	%fs:40, %rbx
	jne	.L1481
	addq	$488, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L1480:
	.cfi_restore_state
	movl	%esi, %r9d
	subl	%ecx, %r9d
	js	.L1462
	leal	-1(%rcx), %r8d
	movl	%ecx, %r10d
	movslq	%r9d, %rdi
	addq	%rax, %rdi
	movl	%esi, %ebp
	addq	$1, %r8
	testl	%r10d, %r10d
	jle	.L1473
	.p2align 4,,10
	.p2align 3
.L1484:
	movzbl	(%rdi), %esi
	movl	$1, %ecx
	cmpb	%sil, (%rdx)
	je	.L1465
	jmp	.L1466
	.p2align 4,,10
	.p2align 3
.L1482:
	movzbl	(%rdi,%rcx), %esi
	addq	$1, %rcx
	cmpb	-1(%rdx,%rcx), %sil
	jne	.L1466
.L1465:
	cmpq	%rcx, %r8
	movl	%ecx, %esi
	jne	.L1482
	cmpl	%r10d, %esi
	je	.L1483
.L1466:
	subl	$1, %r9d
	subq	$1, %rdi
	cmpl	$-1, %r9d
	je	.L1462
	testl	%r10d, %r10d
	jg	.L1484
.L1473:
	xorl	%esi, %esi
	cmpl	%r10d, %esi
	jne	.L1466
	.p2align 4,,10
	.p2align 3
.L1483:
	leaq	32(%rsp), %rdi
	leaq	28(%rsp), %rsi
	movl	$4, %edx
	movq	%rax, 8(%rsp)
	movl	%r9d, 28(%rsp)
	call	opt_ok
	movl	452(%rsp), %eax
	movl	32(%rsp), %ecx
	testl	%eax, %eax
	movq	8(%rsp), %rax
	je	.L1462
	cmpl	%ecx, %ebx
	movq	%rbx, %rdx
	jg	.L1485
.L1471:
	movabsq	$-4294967296, %rcx
	movl	%ebp, %ebx
	andq	%rcx, %rdx
	orq	%rbx, %rdx
	jmp	.L1469
	.p2align 4,,10
	.p2align 3
.L1485:
	xorl	%edx, %edx
	movq	%rax, %rdi
	movq	%rbx, %rsi
	call	string_substr
	movl	%edx, %ebp
	jmp	.L1471
.L1481:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE342:
	.size	string_all_before_last, .-string_all_before_last
	.section	.text.string_right,"ax",@progbits
	.p2align 4,,15
	.globl	string_right
	.type	string_right, @function
string_right:
.LFB284:
	.cfi_startproc
	cmpl	%esi, %edx
	jl	.L1490
	leaq	.LC37(%rip), %rax
	xorl	%edx, %edx
	ret
	.p2align 4,,10
	.p2align 3
.L1490:
	movl	%esi, %ecx
	jmp	string_substr
	.cfi_endproc
.LFE284:
	.size	string_right, .-string_right
	.section	.text.string_find_between,"ax",@progbits
	.p2align 4,,15
	.globl	string_find_between
	.type	string_find_between, @function
string_find_between:
.LFB303:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdi, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%r8, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rcx, %rbp
	movq	%rsi, %rbx
	movq	%rdx, %rcx
	movq	%rbp, %r8
	subq	$904, %rsp
	.cfi_def_cfa_offset 960
	movq	%rbx, %rdx
	movq	%r14, %rsi
	leaq	16(%rsp), %rdi
	movq	%r9, %r13
	movq	%fs:40, %rax
	movq	%rax, 888(%rsp)
	xorl	%eax, %eax
	call	string_index
	movl	436(%rsp), %edx
	testl	%edx, %edx
	je	.L1501
	movl	16(%rsp), %edx
	xorl	%r15d, %r15d
	addl	%ebp, %edx
	leaq	.LC37(%rip), %rbp
	cmpl	%ebx, %edx
	jl	.L1502
.L1494:
	movabsq	$-4294967296, %rdx
	andq	8(%rsp), %rdx
	movl	%r15d, %r14d
	leaq	448(%rsp), %rdi
	movq	%r13, %r8
	movq	%r12, %rcx
	movq	%rbp, %rsi
	movq	%rdx, %rbx
	orq	%r14, %rbx
	movq	%rbx, %rdx
	call	string_index
	movl	868(%rsp), %eax
	testl	%eax, %eax
	je	.L1503
	movl	448(%rsp), %ecx
	movq	%rbx, %rdx
	cmpl	%ecx, %r15d
	jg	.L1504
.L1497:
	movabsq	$-4294967296, %rbx
	movq	%rbp, %rax
	andq	%rbx, %rdx
	orq	%r14, %rdx
	jmp	.L1493
	.p2align 4,,10
	.p2align 3
.L1503:
	movq	%rbp, %rax
	movq	%rbx, %rdx
.L1493:
	movq	888(%rsp), %rsi
	xorq	%fs:40, %rsi
	jne	.L1505
	addq	$904, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L1501:
	.cfi_restore_state
	leaq	.LC37(%rip), %rax
	xorl	%edx, %edx
	jmp	.L1493
	.p2align 4,,10
	.p2align 3
.L1502:
	movl	%ebx, %ecx
	movq	%r14, %rdi
	movq	%rbx, %rsi
	call	string_substr
	movq	%rdx, 8(%rsp)
	movq	%rax, %rbp
	movl	%edx, %r15d
	jmp	.L1494
	.p2align 4,,10
	.p2align 3
.L1504:
	movq	%rbp, %rdi
	xorl	%edx, %edx
	movq	%rbx, %rsi
	call	string_substr
	movq	%rax, %rbp
	movl	%edx, %r14d
	jmp	.L1497
.L1505:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE303:
	.size	string_find_between, .-string_find_between
	.section	.text.string_all_after,"ax",@progbits
	.p2align 4,,15
	.globl	string_all_after
	.type	string_all_after, @function
string_all_after:
.LFB343:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movq	%rdi, %r13
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rsi, %r12
	movq	%rcx, %rbp
	movq	%r13, %rsi
	movq	%rdx, %rcx
	subq	$456, %rsp
	.cfi_def_cfa_offset 496
	movq	%rbp, %r8
	movq	%r12, %rdx
	movq	%rsp, %rdi
	movq	%fs:40, %rax
	movq	%rax, 440(%rsp)
	xorl	%eax, %eax
	call	string_last_index
	movl	420(%rsp), %eax
	testl	%eax, %eax
	je	.L1513
	movl	(%rsp), %edx
	xorl	%ecx, %ecx
	leaq	.LC37(%rip), %rax
	addl	%ebp, %edx
	cmpl	%r12d, %edx
	jl	.L1514
.L1509:
	movabsq	$-4294967296, %rdx
	andq	%rbx, %rdx
	orq	%rcx, %rdx
.L1508:
	movq	440(%rsp), %rbx
	xorq	%fs:40, %rbx
	jne	.L1515
	addq	$456, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L1513:
	.cfi_restore_state
	movq	%r13, %rax
	movq	%r12, %rdx
	jmp	.L1508
	.p2align 4,,10
	.p2align 3
.L1514:
	movl	%r12d, %ecx
	movq	%r13, %rdi
	movq	%r12, %rsi
	call	string_substr
	movq	%rdx, %rbx
	movl	%edx, %ecx
	jmp	.L1509
.L1515:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE343:
	.size	string_all_after, .-string_all_after
	.section	.text.string_after,"ax",@progbits
	.p2align 4,,15
	.globl	string_after
	.type	string_after, @function
string_after:
.LFB344:
	.cfi_startproc
	jmp	string_all_after
	.cfi_endproc
.LFE344:
	.size	string_after, .-string_after
	.section	.text.string_substr2,"ax",@progbits
	.p2align 4,,15
	.globl	string_substr2
	.type	string_substr2, @function
string_substr2:
.LFB285:
	.cfi_startproc
	testl	%r8d, %r8d
	cmovne	%esi, %ecx
	jmp	string_substr
	.cfi_endproc
.LFE285:
	.size	string_substr2, .-string_substr2
	.section	.text.ustring_substr,"ax",@progbits
	.p2align 4,,15
	.globl	ustring_substr
	.type	ustring_substr, @function
ustring_substr:
.LFB329:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movl	%edi, %ebx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	cmpl	%esi, %edi
	movl	72(%rsp), %ecx
	setg	%dl
	cmpl	%ecx, %edi
	setg	%al
	orb	%al, %dl
	jne	.L1522
	cmpl	%ecx, %esi
	jg	.L1522
	testl	%edi, %edi
	js	.L1522
	testl	%esi, %esi
	js	.L1522
	cmpl	%ecx, %esi
	jl	.L1525
	movl	40(%rsp), %ebp
.L1526:
	subq	$8, %rsp
	.cfi_def_cfa_offset 40
	movl	%ebx, %edi
	pushq	72(%rsp)
	.cfi_def_cfa_offset 48
	pushq	72(%rsp)
	.cfi_def_cfa_offset 56
	pushq	72(%rsp)
	.cfi_def_cfa_offset 64
	call	array_get
	movq	64(%rsp), %rdi
	movl	(%rax), %edx
	movl	%ebp, %ecx
	movq	72(%rsp), %rsi
	addq	$40, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	jmp	string_substr
	.p2align 4,,10
	.p2align 3
.L1525:
	.cfi_def_cfa_offset 32
	subq	$8, %rsp
	.cfi_def_cfa_offset 40
	movl	%esi, %edi
	pushq	72(%rsp)
	.cfi_def_cfa_offset 48
	pushq	72(%rsp)
	.cfi_def_cfa_offset 56
	pushq	72(%rsp)
	.cfi_def_cfa_offset 64
	call	array_get
	addq	$32, %rsp
	.cfi_def_cfa_offset 32
	movl	(%rax), %ebp
	jmp	.L1526
.L1522:
	leaq	.LC83(%rip), %rdi
	movl	%esi, %edx
	xorl	%eax, %eax
	movl	%ebx, %esi
	call	_STR
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	v_panic
	.cfi_endproc
.LFE329:
	.size	ustring_substr, .-ustring_substr
	.section	.text.ustring_left,"ax",@progbits
	.p2align 4,,15
	.globl	ustring_left
	.type	ustring_left, @function
ustring_left:
.LFB330:
	.cfi_startproc
	cmpl	%edi, 48(%rsp)
	jg	.L1533
	movq	8(%rsp), %rax
	movq	16(%rsp), %rdx
	ret
	.p2align 4,,10
	.p2align 3
.L1533:
	movl	%edi, %esi
	xorl	%edi, %edi
	jmp	ustring_substr
	.cfi_endproc
.LFE330:
	.size	ustring_left, .-ustring_left
	.section	.text.ustring_right,"ax",@progbits
	.p2align 4,,15
	.globl	ustring_right
	.type	ustring_right, @function
ustring_right:
.LFB331:
	.cfi_startproc
	movl	48(%rsp), %esi
	cmpl	%esi, %edi
	jl	.L1538
	leaq	.LC37(%rip), %rax
	xorl	%edx, %edx
	ret
	.p2align 4,,10
	.p2align 3
.L1538:
	jmp	ustring_substr
	.cfi_endproc
.LFE331:
	.size	ustring_right, .-ustring_right
	.section	.text.string_limit,"ax",@progbits
	.p2align 4,,15
	.globl	string_limit
	.type	string_limit, @function
string_limit:
.LFB348:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rsi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbp
	subq	$136, %rsp
	.cfi_def_cfa_offset 192
	movq	%fs:40, %rax
	movq	%rax, 120(%rsp)
	xorl	%eax, %eax
	testl	%esi, %esi
	movl	%edx, 12(%rsp)
	movq	%rdi, 64(%rsp)
	movl	%esi, 72(%rsp)
	je	.L1540
	leal	0(,%rsi,4), %edi
	testl	%edi, %edi
	jle	.L1551
	movl	%esi, %r13d
	movslq	%edi, %rdi
	movl	$1, %esi
	call	calloc@PLT
	testl	%r12d, %r12d
	movq	%rax, 80(%rsp)
	movl	$0, 88(%rsp)
	movl	%r12d, 92(%rsp)
	movl	$4, 96(%rsp)
	movl	$0, 104(%rsp)
	jle	.L1547
	leaq	16(%rsp), %rax
	leaq	64(%rsp), %r14
	xorl	%r15d, %r15d
	movq	%rax, (%rsp)
	.p2align 4,,10
	.p2align 3
.L1543:
	movslq	%r15d, %rdx
	movq	(%rsp), %rsi
	leaq	16(%r14), %rdi
	movzbl	0(%rbp,%rdx), %ecx
	movl	$-452984832, %ebx
	movl	%r15d, 16(%rsp)
	shrb	$3, %cl
	andl	$30, %ecx
	shrl	%cl, %ebx
	call	array_push
	movl	104(%rsp), %eax
	andl	$3, %ebx
	leal	1(%r15,%rbx), %r15d
	leal	1(%rax), %r8d
	cmpl	%r15d, %r13d
	movl	%r8d, 104(%rsp)
	jg	.L1543
.L1542:
	cmpl	%r8d, 12(%rsp)
	movq	64(%rsp), %rax
	movq	72(%rsp), %rdx
	movq	80(%rsp), %rcx
	movq	88(%rsp), %rbx
	movq	96(%rsp), %rsi
	movq	104(%rsp), %rdi
	movq	%rax, 16(%rsp)
	movq	%rdx, 24(%rsp)
	movq	%rcx, 32(%rsp)
	movq	%rbx, 40(%rsp)
	movq	%rsi, 48(%rsp)
	movq	%rdi, 56(%rsp)
	jl	.L1544
	movq	%rbp, %rax
	movq	%r12, %rdx
.L1545:
	movq	120(%rsp), %rsi
	xorq	%fs:40, %rsi
	jne	.L1552
	addq	$136, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L1540:
	.cfi_restore_state
	movl	$1, %esi
	movl	$4, %edi
	call	calloc@PLT
	movq	%rax, 80(%rsp)
	movabsq	$4294967296, %rax
	movl	$4, 96(%rsp)
	movq	%rax, 88(%rsp)
	movl	$0, 104(%rsp)
	xorl	%r8d, %r8d
	jmp	.L1542
	.p2align 4,,10
	.p2align 3
.L1544:
	pushq	%rdi
	.cfi_def_cfa_offset 200
	pushq	%rsi
	.cfi_def_cfa_offset 208
	xorl	%edi, %edi
	pushq	%rbx
	.cfi_def_cfa_offset 216
	pushq	%rcx
	.cfi_def_cfa_offset 224
	pushq	%rdx
	.cfi_def_cfa_offset 232
	pushq	%rax
	.cfi_def_cfa_offset 240
	movl	60(%rsp), %esi
	call	ustring_substr
	addq	$48, %rsp
	.cfi_def_cfa_offset 192
	jmp	.L1545
.L1551:
	call	vcalloc.part.5
.L1552:
	call	__stack_chk_fail@PLT
.L1547:
	xorl	%r8d, %r8d
	jmp	.L1542
	.cfi_endproc
.LFE348:
	.size	string_limit, .-string_limit
	.section	.rodata.str1.8
	.align 8
.LC84:
	.string	"string index out of range: %d / %d"
	.section	.text.string_at,"ax",@progbits
	.p2align 4,,15
	.globl	string_at
	.type	string_at, @function
string_at:
.LFB332:
	.cfi_startproc
	cmpl	%esi, %edx
	jge	.L1556
	testl	%edx, %edx
	js	.L1556
	movslq	%edx, %rdx
	movzbl	(%rdx,%rdi), %eax
	ret
.L1556:
	movl	%edx, %eax
	leaq	.LC84(%rip), %rdi
	movq	%rsi, %rdx
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	%eax, %esi
	xorl	%eax, %eax
	call	_STR
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	v_panic
	.cfi_endproc
.LFE332:
	.size	string_at, .-string_at
	.section	.text.u32_str,"ax",@progbits
	.p2align 4,,15
	.globl	u32_str
	.type	u32_str, @function
u32_str:
.LFB190:
	.cfi_startproc
	testl	%edi, %edi
	jne	.L1560
	leaq	.LC80(%rip), %rax
	movl	$1, %edx
	ret
	.p2align 4,,10
	.p2align 3
.L1560:
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	leaq	_const_digit_pairs(%rip), %r15
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	leaq	8(%r15), %r14
	movl	$11, %ebx
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	movl	%edi, 8(%rsp)
	movl	$13, %edi
	call	v_malloc
	movl	8(%rsp), %ecx
	movq	%rax, 24(%rsp)
	leaq	11(%rax), %r13
	movb	$0, 12(%rax)
	jmp	.L1562
	.p2align 4,,10
	.p2align 3
.L1564:
	movl	8(%rsp), %ebx
.L1562:
	movl	$1374389535, %eax
	movq	(%r15), %rdi
	movq	(%r14), %rsi
	mull	%ecx
	movq	%r13, (%rsp)
	shrl	$5, %edx
	imull	$100, %edx, %eax
	movl	%edx, %r12d
	subl	%eax, %ecx
	leal	-1(%rbx), %eax
	leal	(%rcx,%rcx), %edx
	movl	%eax, 12(%rsp)
	leal	1(%rdx), %ebp
	call	string_at
	movb	%al, 0(%r13)
	leal	-2(%rbx), %eax
	movq	(%r15), %rdi
	movq	(%r14), %rsi
	movl	%ebp, %edx
	movl	%eax, 8(%rsp)
	leaq	-1(%r13), %rax
	subq	$2, %r13
	movq	%rax, 16(%rsp)
	call	string_at
	movb	%al, 1(%r13)
	testl	%r12d, %r12d
	movl	%r12d, %ecx
	jne	.L1564
	cmpl	$20, %ebp
	cmovnb	12(%rsp), %ebx
	movq	24(%rsp), %r14
	movq	16(%rsp), %rsi
	cmovb	(%rsp), %rsi
	movl	$13, %edx
	movq	%r14, %rdi
	subl	%ebx, %edx
	movslq	%edx, %rdx
	call	memmove@PLT
	addq	$40, %rsp
	.cfi_def_cfa_offset 56
	movl	$12, %edx
	subl	%ebx, %edx
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE190:
	.size	u32_str, .-u32_str
	.section	.text.i64_str.part.21,"ax",@progbits
	.p2align 4,,15
	.type	i64_str.part.21, @function
i64_str.part.21:
.LFB551:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	$1, %esi
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movq	%rdi, (%rsp)
	movl	$21, %edi
	call	calloc@PLT
	movq	(%rsp), %r11
	movq	%rax, %rbx
	testq	%r11, %r11
	js	.L1569
	movb	$0, 20(%rax)
	movl	$0, 12(%rsp)
	je	.L1579
.L1570:
	leaq	_const_digit_pairs(%rip), %r14
	movl	$17, %r13d
	leaq	8(%r14), %r15
	.p2align 4,,10
	.p2align 3
.L1572:
	movq	%r11, %rdx
	movabsq	$2951479051793528259, %rax
	movq	(%r14), %rdi
	shrq	$2, %rdx
	movq	(%r15), %rsi
	mulq	%rdx
	leal	1(%r13), %eax
	movl	%eax, (%rsp)
	shrq	$2, %rdx
	movq	%rdx, %r12
	imulq	$-100, %rdx, %rdx
	addq	%r11, %rdx
	addq	%rdx, %rdx
	leaq	1(%rdx), %rbp
	call	string_at
	movq	(%r14), %rdi
	movq	(%r15), %rsi
	movl	%ebp, %edx
	movb	%al, 2(%rbx,%r13)
	movl	%r13d, 8(%rsp)
	call	string_at
	movb	%al, 1(%rbx,%r13)
	subq	$2, %r13
	testq	%r12, %r12
	movq	%r12, %r11
	jne	.L1572
	movl	8(%rsp), %r13d
	movl	12(%rsp), %eax
	addl	$2, %r13d
	cmpq	$20, %rbp
	cmovge	(%rsp), %r13d
	testl	%eax, %eax
	movl	%r13d, (%rsp)
	je	.L1571
	subl	$1, (%rsp)
	movslq	(%rsp), %rsi
	movq	%rsi, %rax
	addq	%rbx, %rsi
	movb	$45, (%rsi)
	movl	%eax, %r14d
.L1575:
	movl	$21, %edx
	movq	%rbx, %rdi
	movl	$21, %ecx
	subl	%r14d, %edx
	movslq	%edx, %rdx
	call	__memmove_chk@PLT
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	$20, %edx
	popq	%rbx
	.cfi_def_cfa_offset 48
	subl	%r14d, %edx
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L1579:
	.cfi_restore_state
	movl	$21, (%rsp)
	.p2align 4,,10
	.p2align 3
.L1571:
	movslq	(%rsp), %rsi
	movl	(%rsp), %r14d
	addq	%rbx, %rsi
	jmp	.L1575
	.p2align 4,,10
	.p2align 3
.L1569:
	negq	%r11
	movb	$0, 20(%rax)
	movl	$1, 12(%rsp)
	jmp	.L1570
	.cfi_endproc
.LFE551:
	.size	i64_str.part.21, .-i64_str.part.21
	.section	.text.i64_str,"ax",@progbits
	.p2align 4,,15
	.globl	i64_str
	.type	i64_str, @function
i64_str:
.LFB191:
	.cfi_startproc
	testq	%rdi, %rdi
	jne	.L1584
	leaq	.LC80(%rip), %rax
	movl	$1, %edx
	ret
	.p2align 4,,10
	.p2align 3
.L1584:
	jmp	i64_str.part.21
	.cfi_endproc
.LFE191:
	.size	i64_str, .-i64_str
	.section	.text.u64_str,"ax",@progbits
	.p2align 4,,15
	.globl	u64_str
	.type	u64_str, @function
u64_str:
.LFB192:
	.cfi_startproc
	testq	%rdi, %rdi
	jne	.L1586
	leaq	.LC80(%rip), %rax
	movl	$1, %edx
	ret
	.p2align 4,,10
	.p2align 3
.L1586:
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	leaq	_const_digit_pairs(%rip), %r15
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	$1, %esi
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	leaq	8(%r15), %r14
	movl	$19, %ebx
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	movq	%rdi, 8(%rsp)
	movl	$21, %edi
	call	calloc@PLT
	movq	8(%rsp), %rcx
	movq	%rax, 40(%rsp)
	leaq	18(%rax), %r13
	movb	$0, 20(%rax)
	jmp	.L1588
	.p2align 4,,10
	.p2align 3
.L1590:
	movl	8(%rsp), %ebx
.L1588:
	movq	%rcx, %rdx
	movabsq	$2951479051793528259, %rax
	movq	(%r15), %rdi
	shrq	$2, %rdx
	movq	(%r14), %rsi
	mulq	%rdx
	shrq	$2, %rdx
	leaq	(%rdx,%rdx,4), %rax
	movq	%rdx, %r12
	leaq	(%rax,%rax,4), %rax
	salq	$2, %rax
	subq	%rax, %rcx
	leal	-1(%rbx), %eax
	leaq	(%rcx,%rcx), %rdx
	movl	%eax, 28(%rsp)
	leaq	1(%r13), %rax
	leal	1(%rdx), %ebp
	movq	%rax, 32(%rsp)
	call	string_at
	movq	(%r15), %rdi
	movq	(%r14), %rsi
	movl	%ebp, %edx
	movb	%al, 1(%r13)
	leal	-2(%rbx), %eax
	movq	%r13, 16(%rsp)
	subq	$2, %r13
	movl	%eax, 8(%rsp)
	call	string_at
	movb	%al, 2(%r13)
	testq	%r12, %r12
	movq	%r12, %rcx
	jne	.L1590
	cmpl	$20, %ebp
	cmovge	28(%rsp), %ebx
	movq	40(%rsp), %r14
	movq	16(%rsp), %rsi
	cmovl	32(%rsp), %rsi
	movl	$21, %edx
	movl	$21, %ecx
	movq	%r14, %rdi
	subl	%ebx, %edx
	movslq	%edx, %rdx
	call	__memmove_chk@PLT
	addq	$56, %rsp
	.cfi_def_cfa_offset 56
	movl	$20, %edx
	subl	%ebx, %edx
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE192:
	.size	u64_str, .-u64_str
	.section	.text.string_lt,"ax",@progbits
	.p2align 4,,15
	.globl	string_lt
	.type	string_lt, @function
string_lt:
.LFB275:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	testl	%esi, %esi
	movq	%rdi, (%rsp)
	movl	%esi, 8(%rsp)
	movl	%ecx, 12(%rsp)
	jle	.L1600
	movl	8(%rsp), %eax
	xorl	%ebx, %ebx
	testl	%ecx, %ecx
	movq	%rsi, %rbp
	movq	%rdx, %r14
	movq	%rcx, %r12
	movabsq	$-4294967296, %r13
	movq	%rax, 24(%rsp)
	movl	12(%rsp), %eax
	movq	%rax, 16(%rsp)
	jg	.L1597
	jmp	.L1598
	.p2align 4,,10
	.p2align 3
.L1605:
	movq	(%rsp), %rdi
	movl	%ebx, %edx
	movq	%rbp, %rsi
	call	string_at
	movl	%ebx, %edx
	movl	%eax, %r15d
	movq	%r14, %rdi
	movq	%r12, %rsi
	call	string_at
	cmpb	%al, %r15b
	jb	.L1602
	addl	$1, %ebx
	cmpl	%ebx, 8(%rsp)
	je	.L1600
	cmpl	%ebx, 12(%rsp)
	je	.L1598
.L1597:
	andq	%r13, %rbp
	orq	24(%rsp), %rbp
	movq	(%rsp), %rdi
	movl	%ebx, %edx
	andq	%r13, %r12
	movq	%rbp, %rsi
	call	string_at
	orq	16(%rsp), %r12
	movl	%eax, %r15d
	movl	%ebx, %edx
	movq	%r14, %rdi
	movq	%r12, %rsi
	call	string_at
	cmpb	%al, %r15b
	jbe	.L1605
.L1598:
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L1600:
	.cfi_restore_state
	movl	8(%rsp), %ecx
	xorl	%eax, %eax
	cmpl	%ecx, 12(%rsp)
	setg	%al
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L1602:
	.cfi_restore_state
	addq	$40, %rsp
	.cfi_def_cfa_offset 56
	movl	$1, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE275:
	.size	string_lt, .-string_lt
	.section	.text.string_ge,"ax",@progbits
	.p2align 4,,15
	.globl	string_ge
	.type	string_ge, @function
string_ge:
.LFB278:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	call	string_lt
	testl	%eax, %eax
	sete	%al
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	movzbl	%al, %eax
	ret
	.cfi_endproc
.LFE278:
	.size	string_ge, .-string_ge
	.section	.text.ustring_lt,"ax",@progbits
	.p2align 4,,15
	.globl	ustring_lt
	.type	ustring_lt, @function
ustring_lt:
.LFB322:
	.cfi_startproc
	movq	56(%rsp), %rdx
	movq	64(%rsp), %rcx
	movq	8(%rsp), %rdi
	movq	16(%rsp), %rsi
	jmp	string_lt
	.cfi_endproc
.LFE322:
	.size	ustring_lt, .-ustring_lt
	.section	.text.ustring_ge,"ax",@progbits
	.p2align 4,,15
	.globl	ustring_ge
	.type	ustring_ge, @function
ustring_ge:
.LFB325:
	.cfi_startproc
	subq	$104, %rsp
	.cfi_def_cfa_offset 112
	movdqu	112(%rsp), %xmm0
	movq	160(%rsp), %rdx
	movq	168(%rsp), %rcx
	movaps	%xmm0, (%rsp)
	movq	8(%rsp), %rsi
	movq	%xmm0, %rdi
	call	string_lt
	testl	%eax, %eax
	sete	%al
	addq	$104, %rsp
	.cfi_def_cfa_offset 8
	movzbl	%al, %eax
	ret
	.cfi_endproc
.LFE325:
	.size	ustring_ge, .-ustring_ge
	.section	.text.string_ends_with,"ax",@progbits
	.p2align 4,,15
	.globl	string_ends_with
	.type	string_ends_with, @function
string_ends_with:
.LFB298:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	cmpl	%esi, %ecx
	movq	%rdi, 16(%rsp)
	jg	.L1612
	testl	%ecx, %ecx
	jle	.L1616
	movl	%ecx, %eax
	movq	%rsi, %rbx
	movl	%esi, %r15d
	leal	-1(%rax), %esi
	subl	%eax, %r15d
	movq	%rax, 24(%rsp)
	movl	%ebx, %eax
	movq	%rdx, %r14
	xorl	%ebp, %ebp
	leaq	1(%rsi), %rdi
	movq	%rax, 32(%rsp)
	movabsq	$-4294967296, %r12
	movq	%rdi, 40(%rsp)
	jmp	.L1615
	.p2align 4,,10
	.p2align 3
.L1619:
	addq	$1, %rbp
	cmpq	40(%rsp), %rbp
	movq	8(%rsp), %rcx
	je	.L1616
.L1615:
	andq	%r12, %rcx
	orq	24(%rsp), %rcx
	movl	%ebp, %edx
	movq	%r14, %rdi
	andq	%r12, %rbx
	movq	%rcx, %rsi
	movq	%rcx, 8(%rsp)
	call	string_at
	orq	32(%rsp), %rbx
	movq	16(%rsp), %rdi
	leal	(%r15,%rbp), %edx
	movl	%eax, %r13d
	movq	%rbx, %rsi
	call	string_at
	cmpb	%al, %r13b
	je	.L1619
.L1612:
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L1616:
	.cfi_restore_state
	addq	$56, %rsp
	.cfi_def_cfa_offset 56
	movl	$1, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE298:
	.size	string_ends_with, .-string_ends_with
	.section	.text.string_capitalize,"ax",@progbits
	.p2align 4,,15
	.globl	string_capitalize
	.type	string_capitalize, @function
string_capitalize:
.LFB301:
	.cfi_startproc
	testl	%esi, %esi
	jne	.L1633
	leaq	.LC37(%rip), %rax
	xorl	%edx, %edx
	ret
	.p2align 4,,10
	.p2align 3
.L1633:
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movq	%rsi, %r13
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movq	%rdi, %rbx
	leal	1(%rsi), %edi
	call	v_malloc
	testl	%r13d, %r13d
	movq	%rax, %r12
	jle	.L1623
	call	__ctype_tolower_loc@PLT
	leal	-1(%r13), %edi
	xorl	%edx, %edx
	addq	$1, %rdi
	.p2align 4,,10
	.p2align 3
.L1624:
	movzbl	(%rbx,%rdx), %r9d
	movq	(%rax), %r8
	movl	(%r8,%r9,4), %r8d
	movb	%r8b, (%r12,%rdx)
	addq	$1, %rdx
	cmpq	%rdx, %rdi
	jne	.L1624
.L1625:
	xorl	%ecx, %ecx
	cmpl	$1, %r13d
	movl	%r13d, %ebx
	leaq	.LC37(%rip), %r14
	jg	.L1634
.L1626:
	movabsq	$-4294967296, %rax
	movq	%rbx, %rsi
	xorl	%edx, %edx
	movq	%r12, %rdi
	andq	%rax, %rbp
	orq	%rcx, %rbp
	call	string_at
	movl	$2, %edi
	movl	%eax, %r12d
	call	v_malloc
	movl	$2, %edi
	movq	%rax, %rbx
	movb	%r12b, (%rax)
	movb	$0, 1(%rax)
	call	v_malloc
	movq	%rax, %r12
	call	__ctype_toupper_loc@PLT
	movzbl	(%rbx), %edx
	movq	(%rax), %rax
	movq	%rbp, %rcx
	movq	%r12, %rdi
	movl	$1, %esi
	movl	(%rax,%rdx,4), %eax
	movq	%r14, %rdx
	movb	%al, (%r12)
	popq	%rbx
	.cfi_remember_state
	.cfi_restore 3
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_restore 12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_restore 13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_restore 14
	.cfi_def_cfa_offset 8
	jmp	string_add
	.p2align 4,,10
	.p2align 3
.L1634:
	.cfi_restore_state
	movl	%r13d, %ecx
	movl	$1, %edx
	movq	%r12, %rdi
	movq	%rbx, %rsi
	call	string_substr
	movq	%rdx, %rbp
	movq	%rax, %r14
	movl	%edx, %ecx
	jmp	.L1626
	.p2align 4,,10
	.p2align 3
.L1623:
	testq	%rax, %rax
	jne	.L1625
	call	tos.part.7
	.cfi_endproc
.LFE301:
	.size	string_capitalize, .-string_capitalize
	.section	.text.string_reverse,"ax",@progbits
	.p2align 4,,15
	.globl	string_reverse
	.type	string_reverse, @function
string_reverse:
.LFB347:
	.cfi_startproc
	cmpl	$1, %esi
	jbe	.L1644
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdi, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	%esi, %edi
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rsi, %rbx
	movl	%ebx, %ebp
	movl	%esi, %r13d
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movq	%rsi, 8(%rsp)
	call	v_malloc
	subl	$1, %ebp
	movq	%rax, (%rsp)
	js	.L1638
	movq	%rax, %r12
	movabsq	$-4294967296, %r15
	.p2align 4,,10
	.p2align 3
.L1639:
	andq	%r15, %rbx
	movl	%ebp, %edx
	movq	%r14, %rdi
	orq	%r13, %rbx
	subl	$1, %ebp
	addq	$1, %r12
	movq	%rbx, %rsi
	call	string_at
	movb	%al, -1(%r12)
	cmpl	$-1, %ebp
	jne	.L1639
.L1638:
	movq	(%rsp), %rax
	movl	8(%rsp), %edx
	addq	$24, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L1644:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	.cfi_restore 15
	movq	%rdi, %rax
	movq	%rsi, %rdx
	ret
	.cfi_endproc
.LFE347:
	.size	string_reverse, .-string_reverse
	.section	.rodata.str1.1
.LC85:
	.string	"string.eq(): nil string"
	.section	.text.string_eq,"ax",@progbits
	.p2align 4,,15
	.globl	string_eq
	.type	string_eq, @function
string_eq:
.LFB273:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	testq	%rdi, %rdi
	je	.L1655
	cmpl	%esi, %ecx
	movq	%rsi, %r8
	movq	%rcx, %rbp
	movl	%ecx, %r14d
	je	.L1656
.L1647:
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L1656:
	.cfi_restore_state
	xorl	%ebx, %ebx
	movl	%ecx, %eax
	testl	%ecx, %ecx
	movq	%rdi, %r13
	movq	%rdx, %r15
	movq	%rax, 8(%rsp)
	jg	.L1648
	jmp	.L1650
	.p2align 4,,10
	.p2align 3
.L1657:
	addl	$1, %ebx
	movq	(%rsp), %r8
	cmpl	%ebx, %r14d
	je	.L1650
.L1648:
	movabsq	$-4294967296, %rax
	movl	%ebx, %edx
	movq	%r13, %rdi
	andq	%rax, %r8
	orq	8(%rsp), %r8
	movq	%r8, %rsi
	movq	%r8, (%rsp)
	call	string_at
	movl	%ebx, %edx
	movl	%eax, %r12d
	movq	%r15, %rdi
	movq	%rbp, %rsi
	call	string_at
	cmpb	%al, %r12b
	je	.L1657
	jmp	.L1647
	.p2align 4,,10
	.p2align 3
.L1650:
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	$1, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L1655:
	.cfi_restore_state
	leaq	.LC85(%rip), %rdi
	movl	$23, %esi
	call	v_panic
	.cfi_endproc
.LFE273:
	.size	string_eq, .-string_eq
	.section	.rodata.str1.1
.LC86:
	.string	"t"
	.section	.text.string_bool,"ax",@progbits
	.p2align 4,,15
	.globl	string_bool
	.type	string_bool, @function
string_bool:
.LFB263:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	leaq	.LC34(%rip), %rdx
	movl	$4, %ecx
	movq	%rdi, %rbp
	movq	%rsi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	call	string_eq
	testl	%eax, %eax
	movl	$1, %edx
	jne	.L1658
	leaq	.LC86(%rip), %rdx
	movl	$1, %ecx
	movq	%rbp, %rdi
	movq	%rbx, %rsi
	call	string_eq
	xorl	%edx, %edx
	testl	%eax, %eax
	setne	%dl
.L1658:
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	movl	%edx, %eax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE263:
	.size	string_bool, .-string_bool
	.section	.text.string_ne,"ax",@progbits
	.p2align 4,,15
	.globl	string_ne
	.type	string_ne, @function
string_ne:
.LFB274:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	call	string_eq
	testl	%eax, %eax
	sete	%al
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	movzbl	%al, %eax
	ret
	.cfi_endproc
.LFE274:
	.size	string_ne, .-string_ne
	.section	.text.array_string_eq,"ax",@progbits
	.p2align 4,,15
	.globl	array_string_eq
	.type	array_string_eq, @function
array_string_eq:
.LFB122:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	movl	56(%rsp), %r12d
	movl	80(%rsp), %ebp
	cmpl	%r12d, %ebp
	je	.L1677
.L1666:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L1677:
	.cfi_restore_state
	xorl	%ebx, %ebx
	testl	%ebp, %ebp
	jg	.L1667
	jmp	.L1669
	.p2align 4,,10
	.p2align 3
.L1678:
	addl	$1, %ebx
	cmpl	%ebx, %ebp
	je	.L1669
.L1667:
	subq	$8, %rsp
	.cfi_def_cfa_offset 56
	movl	%ebx, %edi
	pushq	96(%rsp)
	.cfi_def_cfa_offset 64
	pushq	96(%rsp)
	.cfi_def_cfa_offset 72
	pushq	96(%rsp)
	.cfi_def_cfa_offset 80
	call	array_get
	movl	%r12d, 88(%rsp)
	addq	$24, %rsp
	.cfi_def_cfa_offset 56
	movq	%rax, %r13
	pushq	72(%rsp)
	.cfi_def_cfa_offset 64
	pushq	72(%rsp)
	.cfi_def_cfa_offset 72
	movl	%ebx, %edi
	pushq	72(%rsp)
	.cfi_def_cfa_offset 80
	call	array_get
	movq	0(%r13), %rdx
	movq	(%rax), %rdi
	addq	$32, %rsp
	.cfi_def_cfa_offset 48
	movq	8(%rax), %rsi
	movq	8(%r13), %rcx
	call	string_eq
	testl	%eax, %eax
	jne	.L1678
	jmp	.L1666
	.p2align 4,,10
	.p2align 3
.L1669:
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	movl	$1, %eax
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE122:
	.size	array_string_eq, .-array_string_eq
	.section	.text.ustring_eq,"ax",@progbits
	.p2align 4,,15
	.globl	ustring_eq
	.type	ustring_eq, @function
ustring_eq:
.LFB320:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	xorl	%eax, %eax
	movl	104(%rsp), %ecx
	cmpl	%ecx, 56(%rsp)
	je	.L1684
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L1684:
	.cfi_restore_state
	movq	24(%rsp), %rsi
	movq	64(%rsp), %rdx
	movq	72(%rsp), %rcx
	movq	16(%rsp), %rdi
	call	string_eq
	testl	%eax, %eax
	setne	%al
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	movzbl	%al, %eax
	ret
	.cfi_endproc
.LFE320:
	.size	ustring_eq, .-ustring_eq
	.section	.text.ustring_ne,"ax",@progbits
	.p2align 4,,15
	.globl	ustring_ne
	.type	ustring_ne, @function
ustring_ne:
.LFB321:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$1, %eax
	movl	104(%rsp), %edx
	cmpl	%edx, 56(%rsp)
	je	.L1690
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L1690:
	.cfi_restore_state
	movl	24(%rsp), %esi
	movl	72(%rsp), %ecx
	movq	64(%rsp), %rdx
	movq	16(%rsp), %rdi
	call	string_eq
	testl	%eax, %eax
	sete	%al
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	movzbl	%al, %eax
	ret
	.cfi_endproc
.LFE321:
	.size	ustring_ne, .-ustring_ne
	.section	.text.ustring_le,"ax",@progbits
	.p2align 4,,15
	.globl	ustring_le
	.type	ustring_le, @function
ustring_le:
.LFB323:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$104, %rsp
	.cfi_def_cfa_offset 128
	movdqu	128(%rsp), %xmm0
	movq	176(%rsp), %rdx
	movq	184(%rsp), %rcx
	movaps	%xmm0, (%rsp)
	movq	8(%rsp), %rsi
	movq	%xmm0, %rdi
	movl	168(%rsp), %ebp
	movl	216(%rsp), %ebx
	call	string_lt
	testl	%eax, %eax
	movl	$1, %edx
	jne	.L1691
	xorl	%edx, %edx
	cmpl	%ebx, %ebp
	je	.L1696
.L1691:
	addq	$104, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	movl	%edx, %eax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L1696:
	.cfi_restore_state
	movl	136(%rsp), %esi
	movl	184(%rsp), %ecx
	movq	176(%rsp), %rdx
	movq	128(%rsp), %rdi
	call	string_eq
	xorl	%edx, %edx
	testl	%eax, %eax
	setne	%dl
	addq	$104, %rsp
	.cfi_def_cfa_offset 24
	movl	%edx, %eax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE323:
	.size	ustring_le, .-ustring_le
	.section	.text.array_string_contains,"ax",@progbits
	.p2align 4,,15
	.globl	array_string_contains
	.type	array_string_contains, @function
array_string_contains:
.LFB304:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	movl	56(%rsp), %eax
	testl	%eax, %eax
	jle	.L1698
	movq	48(%rsp), %rbx
	subl	$1, %eax
	movq	%rsi, %r12
	salq	$4, %rax
	movq	%rdi, %rbp
	leaq	16(%rbx,%rax), %r13
	jmp	.L1701
	.p2align 4,,10
	.p2align 3
.L1699:
	addq	$16, %rbx
	cmpq	%r13, %rbx
	je	.L1698
.L1701:
	movq	(%rbx), %rdi
	movq	8(%rbx), %rsi
	movq	%rbp, %rdx
	movq	%r12, %rcx
	call	string_eq
	testl	%eax, %eax
	je	.L1699
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	movl	$1, %eax
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L1698:
	.cfi_restore_state
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE304:
	.size	array_string_contains, .-array_string_contains
	.section	.text.string_le,"ax",@progbits
	.p2align 4,,15
	.globl	string_le
	.type	string_le, @function
string_le:
.LFB276:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movq	%rcx, %r14
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rdx, %r13
	movq	%rdi, %rbp
	movq	%rsi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	call	string_lt
	testl	%eax, %eax
	movl	$1, %edx
	jne	.L1704
	movq	%r13, %rdx
	movq	%r14, %rcx
	movq	%rbp, %rdi
	movq	%rbx, %rsi
	call	string_eq
	xorl	%edx, %edx
	testl	%eax, %eax
	setne	%dl
.L1704:
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	movl	%edx, %eax
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE276:
	.size	string_le, .-string_le
	.section	.text.string_gt,"ax",@progbits
	.p2align 4,,15
	.globl	string_gt
	.type	string_gt, @function
string_gt:
.LFB277:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movq	%rcx, %r14
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rdx, %r13
	movq	%rdi, %rbp
	movq	%rsi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	call	string_lt
	xorl	%edx, %edx
	testl	%eax, %eax
	jne	.L1709
	movq	%r13, %rdx
	movq	%r14, %rcx
	movq	%rbp, %rdi
	movq	%rbx, %rsi
	call	string_eq
	xorl	%edx, %edx
	testl	%eax, %eax
	sete	%dl
.L1709:
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	movl	%edx, %eax
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE277:
	.size	string_gt, .-string_gt
	.section	.text.compare_lower_strings,"ax",@progbits
	.p2align 4,,15
	.globl	compare_lower_strings
	.type	compare_lower_strings, @function
compare_lower_strings:
.LFB313:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rsi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	movl	8(%rdi), %ebp
	movq	(%rdi), %r13
	leal	1(%rbp), %edi
	call	v_malloc
	testl	%ebp, %ebp
	movq	%rax, %rbx
	jle	.L1715
	call	__ctype_tolower_loc@PLT
	leal	-1(%rbp), %esi
	xorl	%edx, %edx
	addq	$1, %rsi
	.p2align 4,,10
	.p2align 3
.L1716:
	movzbl	0(%r13,%rdx), %edi
	movq	(%rax), %rcx
	movl	(%rcx,%rdi,4), %ecx
	movb	%cl, (%rbx,%rdx)
	addq	$1, %rdx
	cmpq	%rdx, %rsi
	jne	.L1716
.L1717:
	movq	(%r12), %r15
	movl	8(%r12), %r12d
	movq	%rbp, %r13
	leal	1(%r12), %edi
	call	v_malloc
	testl	%r12d, %r12d
	movq	%rax, %r14
	jle	.L1718
	call	__ctype_tolower_loc@PLT
	leal	-1(%r12), %ecx
	xorl	%edx, %edx
	addq	$1, %rcx
	.p2align 4,,10
	.p2align 3
.L1719:
	movzbl	(%r15,%rdx), %edi
	movq	(%rax), %rsi
	movl	(%rsi,%rdi,4), %edi
	movb	%dil, (%r14,%rdx)
	addq	$1, %rdx
	cmpq	%rcx, %rdx
	jne	.L1719
.L1720:
	movq	%r12, %rcx
	movq	%r14, %rdx
	movq	%rbx, %rdi
	movq	%r13, %rsi
	call	string_lt
	testl	%eax, %eax
	jne	.L1723
	movq	%r14, %rdx
	movq	%r12, %rcx
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	call	string_lt
	xorl	%edx, %edx
	testl	%eax, %eax
	jne	.L1714
	movq	%r14, %rdx
	movq	%r12, %rcx
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	call	string_eq
	xorl	%edx, %edx
	testl	%eax, %eax
	sete	%dl
.L1714:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	%edx, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L1718:
	.cfi_restore_state
	testq	%rax, %rax
	jne	.L1720
.L1721:
	call	tos.part.7
	.p2align 4,,10
	.p2align 3
.L1715:
	testq	%rax, %rax
	jne	.L1717
	jmp	.L1721
	.p2align 4,,10
	.p2align 3
.L1723:
	movl	$-1, %edx
	jmp	.L1714
	.cfi_endproc
.LFE313:
	.size	compare_lower_strings, .-compare_lower_strings
	.section	.text.compare_strings,"ax",@progbits
	.p2align 4,,15
	.globl	compare_strings
	.type	compare_strings, @function
compare_strings:
.LFB311:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movq	%rsi, %rbp
	movq	%rdi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	movq	(%rdi), %rdi
	movq	8(%rbx), %rsi
	movq	0(%rbp), %rdx
	movq	8(%rbp), %rcx
	call	string_lt
	testl	%eax, %eax
	jne	.L1733
	movq	0(%rbp), %r13
	movq	(%rbx), %r12
	movl	8(%rbp), %ebp
	movl	8(%rbx), %ebx
	movq	%r13, %rdx
	movq	%r12, %rdi
	movq	%rbp, %rcx
	movq	%rbx, %rsi
	call	string_lt
	xorl	%edx, %edx
	testl	%eax, %eax
	jne	.L1731
	movq	%r13, %rdx
	movq	%rbp, %rcx
	movq	%r12, %rdi
	movq	%rbx, %rsi
	call	string_eq
	xorl	%edx, %edx
	testl	%eax, %eax
	sete	%dl
.L1731:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	movl	%edx, %eax
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L1733:
	.cfi_restore_state
	movl	$-1, %edx
	jmp	.L1731
	.cfi_endproc
.LFE311:
	.size	compare_strings, .-compare_strings
	.section	.text.ustring_gt,"ax",@progbits
	.p2align 4,,15
	.globl	ustring_gt
	.type	ustring_gt, @function
ustring_gt:
.LFB324:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$104, %rsp
	.cfi_def_cfa_offset 160
	movl	168(%rsp), %ebx
	movq	208(%rsp), %r15
	movl	216(%rsp), %ebp
	movq	160(%rsp), %r12
	movl	200(%rsp), %r14d
	movl	248(%rsp), %r13d
	movl	%ebx, 56(%rsp)
	movq	%r15, (%rsp)
	movl	%ebp, 8(%rsp)
	movq	(%rsp), %rdx
	movq	%r12, %rdi
	movq	8(%rsp), %rcx
	movq	56(%rsp), %rsi
	call	string_lt
	xorl	%edx, %edx
	testl	%eax, %eax
	jne	.L1736
	cmpl	%r13d, %r14d
	movl	$1, %edx
	je	.L1741
.L1736:
	addq	$104, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	%edx, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L1741:
	.cfi_restore_state
	movq	%r15, %rdx
	movl	%ebx, %esi
	movl	%ebp, %ecx
	movq	%r12, %rdi
	call	string_eq
	xorl	%edx, %edx
	testl	%eax, %eax
	sete	%dl
	jmp	.L1736
	.cfi_endproc
.LFE324:
	.size	ustring_gt, .-ustring_gt
	.section	.text.string_split_nth.constprop.37,"ax",@progbits
	.p2align 4,,15
	.type	string_split_nth.constprop.37, @function
string_split_nth.constprop.37:
.LFB589:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rsi, %r15
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	$1, %esi
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rcx, %r14
	movq	%rdx, %rbx
	movl	%edx, %ebp
	subq	$104, %rsp
	.cfi_def_cfa_offset 160
	movq	%rdi, 24(%rsp)
	movl	$16, %edi
	movq	%r8, 32(%rsp)
	movq	%fs:40, %rax
	movq	%rax, 88(%rsp)
	xorl	%eax, %eax
	call	calloc@PLT
	movq	%rax, 64(%rsp)
	movabsq	$4294967296, %rax
	testl	%ebx, %ebx
	movq	%rax, 72(%rsp)
	movl	%ebx, %eax
	movl	$16, 80(%rsp)
	movq	%rax, (%rsp)
	js	.L1743
	leaq	48(%rsp), %rax
	xorl	%edx, %edx
	xorl	%ecx, %ecx
	movabsq	$-4294967296, %r12
	movq	%rax, 8(%rsp)
	leaq	64(%rsp), %rax
	movq	%rax, 16(%rsp)
	jmp	.L1749
	.p2align 4,,10
	.p2align 3
.L1747:
	andq	%r12, %rsi
	movq	%rdi, 48(%rsp)
	movq	16(%rsp), %rdi
	orq	%rcx, %rsi
	movq	%rsi, 56(%rsp)
	movq	8(%rsp), %rsi
	call	array_push
	movl	%r13d, %ecx
	movl	%r13d, %edx
.L1746:
	cmpl	%ebp, %r13d
	jg	.L1743
.L1749:
	movslq	%ecx, %rax
	movzbl	(%r14), %edi
	leal	1(%rcx), %r13d
	cmpb	%dil, (%r15,%rax)
	jne	.L1763
.L1744:
	andq	%r12, %rbx
	orq	(%rsp), %rbx
	movq	%r15, %rdi
	movq	%rbx, %rsi
	call	string_substr
	movq	%rdx, %rsi
	movq	%rax, %rdi
	movl	%edx, %ecx
	testl	%esi, %esi
	jle	.L1747
	movzbl	(%r14), %r9d
	cmpb	%r9b, (%rax)
	jne	.L1747
	cmpl	$1, %ecx
	jne	.L1764
	leaq	.LC37(%rip), %rdi
	xorl	%edx, %edx
.L1748:
	movq	40(%rsp), %rax
	movl	%edx, %ecx
	andq	%r12, %rax
	orq	%rcx, %rax
	movq	%rax, 40(%rsp)
	movq	%rax, %rsi
	jmp	.L1747
	.p2align 4,,10
	.p2align 3
.L1743:
	movq	32(%rsp), %rcx
	movabsq	$-4294967296, %r13
	andq	%r13, %rbx
	orq	(%rsp), %rbx
	cmpl	%ebp, %ecx
	jg	.L1753
	testl	%ecx, %ecx
	jle	.L1751
	leal	-1(%rcx), %eax
	subl	%ecx, %ebp
	movq	%r14, 32(%rsp)
	movl	%ebp, 8(%rsp)
	xorl	%r12d, %r12d
	movq	%rcx, %r14
	addq	$1, %rax
	movq	%rax, 40(%rsp)
	movl	%ecx, %eax
	movq	%rax, 16(%rsp)
	jmp	.L1752
	.p2align 4,,10
	.p2align 3
.L1765:
	addq	$1, %r12
	cmpq	%r12, 40(%rsp)
	je	.L1751
.L1752:
	movq	%r14, %rcx
	movq	32(%rsp), %rdi
	movl	%r12d, %edx
	andq	%r13, %rcx
	orq	16(%rsp), %rcx
	andq	%r13, %rbx
	movq	%rcx, %rsi
	movq	%rcx, %r14
	call	string_at
	orq	(%rsp), %rbx
	movl	%eax, %ebp
	movl	8(%rsp), %eax
	movq	%r15, %rdi
	leal	(%rax,%r12), %edx
	movq	%rbx, %rsi
	call	string_at
	cmpb	%al, %bpl
	je	.L1765
.L1753:
	movq	24(%rsp), %rdi
	movq	80(%rsp), %rax
	movdqa	64(%rsp), %xmm0
	movq	88(%rsp), %rbx
	xorq	%fs:40, %rbx
	movq	%rax, 16(%rdi)
	movq	%rdi, %rax
	movups	%xmm0, (%rdi)
	jne	.L1766
	addq	$104, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L1763:
	.cfi_restore_state
	leal	-1(%rbp), %eax
	cmpl	%eax, %ecx
	movl	%r13d, %ecx
	jne	.L1746
	leal	1(%rbp), %r13d
	jmp	.L1744
	.p2align 4,,10
	.p2align 3
.L1751:
	leaq	.LC37(%rip), %rax
	leaq	48(%rsp), %rsi
	leaq	64(%rsp), %rdi
	movl	$0, 56(%rsp)
	movq	%rax, 48(%rsp)
	call	array_push
	jmp	.L1753
	.p2align 4,,10
	.p2align 3
.L1764:
	movl	%esi, %ecx
	movl	$1, %edx
	call	string_substr
	movq	%rdx, 40(%rsp)
	movq	%rax, %rdi
	jmp	.L1748
.L1766:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE589:
	.size	string_split_nth.constprop.37, .-string_split_nth.constprop.37
	.section	.text.string_split_nth,"ax",@progbits
	.p2align 4,,15
	.globl	string_split_nth
	.type	string_split_nth, @function
string_split_nth:
.LFB281:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%r8, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdx, %r13
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rcx, %r12
	movq	%rdx, %rbx
	movl	%edx, %r15d
	movl	%r8d, %ebp
	subq	$136, %rsp
	.cfi_def_cfa_offset 192
	movq	%rdi, 48(%rsp)
	movq	%rsi, 8(%rsp)
	movl	$16, %edi
	movl	$1, %esi
	movq	%r8, 56(%rsp)
	movl	%r9d, 4(%rsp)
	movq	%fs:40, %rcx
	movq	%rcx, 120(%rsp)
	xorl	%ecx, %ecx
	call	calloc@PLT
	movabsq	$4294967296, %rcx
	testl	%r14d, %r14d
	movq	%rax, 96(%rsp)
	movq	%rcx, 104(%rsp)
	movl	$16, 112(%rsp)
	jne	.L1768
	testl	%r13d, %r13d
	jle	.L1770
	movl	4(%rsp), %eax
	movq	8(%rsp), %rdi
	testl	%eax, %eax
	movzbl	(%rdi), %r14d
	setg	24(%rsp)
	cmpl	$1, %eax
	je	.L1821
	leal	-1(%r13), %ebx
	leaq	80(%rsp), %rax
	leaq	96(%rsp), %rbp
	movl	$2, %r12d
	addq	$2, %rbx
	movq	%rax, 16(%rsp)
	.p2align 4,,10
	.p2align 3
.L1810:
	movl	$2, %edi
	call	v_malloc
	movq	16(%rsp), %rsi
	movb	%r14b, (%rax)
	movq	%rbp, %rdi
	movb	$0, 1(%rax)
	movq	%rax, 80(%rsp)
	movl	$1, 88(%rsp)
	call	array_push
	cmpq	%r12, %rbx
	movl	%r12d, %edx
	je	.L1770
	movq	8(%rsp), %rax
	movzbl	-1(%rax,%r12), %r14d
	addq	$1, %r12
	cmpl	%edx, 4(%rsp)
	jg	.L1810
	cmpb	$0, 24(%rsp)
	je	.L1810
	movq	%rax, %rdi
.L1771:
	movq	%r13, %rsi
	movl	%r15d, %ecx
	call	string_substr
	movq	16(%rsp), %rsi
	movq	%rbp, %rdi
	movq	%rax, 80(%rsp)
	movq	%rdx, 88(%rsp)
	call	array_push
.L1770:
	movq	48(%rsp), %rdi
	movq	112(%rsp), %rax
	movdqa	96(%rsp), %xmm0
	movq	%rax, 16(%rdi)
	movq	%rdi, %rax
	movups	%xmm0, (%rdi)
	movq	120(%rsp), %rdi
	xorq	%fs:40, %rdi
	jne	.L1822
	addq	$136, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L1768:
	.cfi_restore_state
	movl	4(%rsp), %eax
	subl	$1, %eax
	testl	%r13d, %r13d
	movl	%eax, 72(%rsp)
	movl	%r13d, %eax
	movq	%rax, 24(%rsp)
	js	.L1790
	leaq	80(%rsp), %rax
	movl	$0, 16(%rsp)
	xorl	%r13d, %r13d
	movq	8(%rsp), %r14
	movq	%rax, 32(%rsp)
	leaq	96(%rsp), %rax
	movq	%rax, 40(%rsp)
	jmp	.L1791
	.p2align 4,,10
	.p2align 3
.L1780:
	movzbl	(%rcx,%rax), %edx
	addq	$1, %rax
	cmpb	-1(%r12,%rax), %dl
	je	.L1779
.L1777:
	leal	-1(%r15), %eax
	leal	1(%r13), %r10d
	cmpl	%r13d, %eax
	je	.L1823
	cmpl	%r10d, %r15d
	movl	%r10d, %r13d
	jl	.L1790
.L1791:
	movslq	%r13d, %rcx
	movzbl	(%r12), %eax
	addq	%r14, %rcx
	cmpb	%al, (%rcx)
	jne	.L1777
	testl	%ebp, %ebp
	jle	.L1778
	leal	-1(%rbp), %esi
	movl	$1, %eax
	addq	$1, %rsi
.L1779:
	cmpq	%rax, %rsi
	jne	.L1780
	movabsq	$-4294967296, %rax
	movl	16(%rsp), %edx
	movl	%r13d, %ecx
	andq	%rax, %rbx
	orq	24(%rsp), %rbx
	movq	%r14, %rdi
	movq	%rbx, %rsi
	call	string_substr
	cmpl	%ebp, %edx
	movq	%rdx, %rsi
	movq	%rax, %r11
	movl	%edx, %ecx
	jge	.L1798
.L1783:
	movl	4(%rsp), %edx
	testl	%edx, %edx
	jle	.L1787
	movl	72(%rsp), %eax
	cmpl	%eax, 104(%rsp)
	je	.L1788
.L1787:
	movabsq	$-4294967296, %rax
	movq	40(%rsp), %rdi
	movq	%r11, 80(%rsp)
	andq	%rax, %rsi
	orq	%rcx, %rsi
	movq	%rsi, 88(%rsp)
	movq	32(%rsp), %rsi
	call	array_push
	leal	1(%r13), %r10d
	leal	0(%rbp,%r13), %eax
	cmpl	%r10d, %r15d
	movl	%eax, 16(%rsp)
	movl	%r10d, %r13d
	jge	.L1791
.L1790:
	movq	56(%rsp), %rcx
	movabsq	$-4294967296, %r14
	andq	%r14, %rbx
	orq	24(%rsp), %rbx
	cmpl	%r15d, %ecx
	jg	.L1770
	testl	%ecx, %ecx
	jle	.L1792
	leal	-1(%rcx), %eax
	xorl	%r13d, %r13d
	subl	%ecx, %r15d
	movq	%r12, 32(%rsp)
	movl	%r15d, 16(%rsp)
	movq	%rcx, %r12
	addq	$1, %rax
	movq	%rax, 40(%rsp)
	movq	%rbp, %rax
	movq	%r13, %rbp
	movq	%rax, %r13
	jmp	.L1793
	.p2align 4,,10
	.p2align 3
.L1824:
	addq	$1, %rbp
	cmpq	%rbp, 40(%rsp)
	je	.L1792
.L1793:
	movq	%r12, %rcx
	movq	32(%rsp), %rdi
	movl	%ebp, %edx
	andq	%r14, %rcx
	andq	%r14, %rbx
	orq	%r13, %rcx
	movq	%rcx, %rsi
	movq	%rcx, %r12
	call	string_at
	orq	24(%rsp), %rbx
	movl	%eax, %r15d
	movl	16(%rsp), %eax
	movq	8(%rsp), %rdi
	leal	(%rax,%rbp), %edx
	movq	%rbx, %rsi
	call	string_at
	cmpb	%al, %r15b
	je	.L1824
	jmp	.L1770
.L1823:
	movabsq	$-4294967296, %rax
	movl	16(%rsp), %edx
	movl	%r10d, %ecx
	andq	%rax, %rbx
	orq	24(%rsp), %rbx
	movq	%r14, %rdi
	movl	%r10d, 76(%rsp)
	movq	%rbx, %rsi
	call	string_substr
	movl	76(%rsp), %r10d
	cmpl	%edx, %ebp
	movq	%rdx, %rsi
	movq	%rax, %r11
	movl	%edx, %ecx
	movl	%r10d, %r13d
	jg	.L1783
	testl	%ebp, %ebp
	jle	.L1784
	.p2align 4,,10
	.p2align 3
.L1798:
	movzbl	(%rax), %edi
	cmpb	%dil, (%r12)
	jne	.L1783
	leal	-1(%rbp), %r10d
	movl	$1, %edx
	addq	$1, %r10
	jmp	.L1785
	.p2align 4,,10
	.p2align 3
.L1786:
	movzbl	(%rax,%rdx), %edi
	addq	$1, %rdx
	cmpb	-1(%r12,%rdx), %dil
	jne	.L1783
.L1785:
	cmpq	%rdx, %r10
	jne	.L1786
.L1784:
	cmpl	%ecx, %ebp
	jl	.L1825
	leaq	.LC37(%rip), %r11
	xorl	%ecx, %ecx
.L1794:
	movabsq	$-4294967296, %rdx
	andq	64(%rsp), %rdx
	movl	%ecx, %eax
	orq	%rax, %rdx
	movq	%rdx, %rsi
	movq	%rdx, 64(%rsp)
	jmp	.L1783
	.p2align 4,,10
	.p2align 3
.L1778:
	movabsq	$-4294967296, %rax
	movl	16(%rsp), %edx
	movl	%r13d, %ecx
	andq	%rax, %rbx
	orq	24(%rsp), %rbx
	movq	%r14, %rdi
	movq	%rbx, %rsi
	call	string_substr
	cmpl	%edx, %ebp
	movq	%rdx, %rsi
	movq	%rax, %r11
	movl	%edx, %ecx
	jg	.L1783
	jmp	.L1784
.L1792:
	movl	4(%rsp), %eax
	testl	%eax, %eax
	jle	.L1796
	movl	4(%rsp), %eax
	cmpl	%eax, 104(%rsp)
	jge	.L1770
.L1796:
	leaq	.LC37(%rip), %rax
	leaq	80(%rsp), %rsi
	leaq	96(%rsp), %rdi
	movl	$0, 88(%rsp)
	movq	%rax, 80(%rsp)
	call	array_push
	jmp	.L1770
.L1788:
	xorl	%eax, %eax
	cmpl	16(%rsp), %r15d
	leaq	.LC37(%rip), %rcx
	jle	.L1789
	movl	16(%rsp), %edx
	movq	8(%rsp), %rdi
	movl	%r15d, %ecx
	movq	%rbx, %rsi
	call	string_substr
	movq	%rax, %rcx
	movl	%edx, %eax
.L1789:
	leaq	80(%rsp), %rsi
	leaq	96(%rsp), %rdi
	movq	%rcx, 80(%rsp)
	movl	%eax, 88(%rsp)
	call	array_push
	jmp	.L1790
.L1825:
	movl	%ebp, %edx
	movq	%rax, %rdi
	call	string_substr
	movq	%rdx, 64(%rsp)
	movq	%rax, %r11
	movl	%edx, %ecx
	jmp	.L1794
.L1821:
	leaq	80(%rsp), %rax
	movl	$1, %edx
	leaq	96(%rsp), %rbp
	movq	%rax, 16(%rsp)
	jmp	.L1771
.L1822:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE281:
	.size	string_split_nth, .-string_split_nth
	.section	.text.string_split,"ax",@progbits
	.p2align 4,,15
	.globl	string_split
	.type	string_split, @function
string_split:
.LFB280:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	xorl	%r9d, %r9d
	movq	%rdi, %rbx
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	call	string_split_nth
	movq	8(%rsp), %rdi
	xorq	%fs:40, %rdi
	jne	.L1829
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	movq	%rbx, %rax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
.L1829:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE280:
	.size	string_split, .-string_split
	.section	.text.ustring_at,"ax",@progbits
	.p2align 4,,15
	.globl	ustring_at
	.type	ustring_at, @function
ustring_at:
.LFB333:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	testl	%edi, %edi
	js	.L1831
	cmpl	%edi, 56(%rsp)
	jle	.L1831
	leal	1(%rdi), %esi
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	jmp	ustring_substr
.L1831:
	.cfi_restore_state
	movl	40(%rsp), %edx
	movl	%edi, %esi
	leaq	.LC84(%rip), %rdi
	xorl	%eax, %eax
	call	_STR
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	v_panic
	.cfi_endproc
.LFE333:
	.size	ustring_at, .-ustring_at
	.section	.text.array_get.constprop.46,"ax",@progbits
	.p2align 4,,15
	.type	array_get.constprop.46, @function
array_get.constprop.46:
.LFB580:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	24(%rsp), %edx
	testl	%edx, %edx
	jle	.L1837
	movq	16(%rsp), %rax
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L1837:
	.cfi_restore_state
	leaq	.LC68(%rip), %rdi
	xorl	%esi, %esi
	xorl	%eax, %eax
	call	_STR
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	v_panic
	.cfi_endproc
.LFE580:
	.size	array_get.constprop.46, .-array_get.constprop.46
	.section	.text.string_replace,"ax",@progbits
	.p2align 4,,15
	.globl	string_replace
	.type	string_replace, @function
string_replace:
.LFB259:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdi, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$136, %rsp
	.cfi_def_cfa_offset 192
	movq	%fs:40, %rax
	movq	%rax, 120(%rsp)
	xorl	%eax, %eax
	testl	%ecx, %ecx
	movq	%r8, 24(%rsp)
	je	.L1861
	testl	%esi, %esi
	jne	.L1839
.L1861:
	movq	%r14, %rax
	movq	%rsi, %rdx
.L1841:
	movq	120(%rsp), %rbx
	xorq	%fs:40, %rbx
	jne	.L1872
	addq	$136, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L1839:
	.cfi_restore_state
	movl	%esi, %r12d
	movq	%rsi, (%rsp)
	movl	$4, %edi
	movl	$1, %esi
	movq	%rdx, %r13
	movq	%r9, %rbx
	movl	%ecx, %ebp
	movq	%rcx, 8(%rsp)
	movl	%r9d, 36(%rsp)
	call	calloc@PLT
	movq	8(%rsp), %r11
	movq	%rax, 96(%rsp)
	movabsq	$4294967296, %rax
	movq	%rax, 104(%rsp)
	movl	$4, 112(%rsp)
	movq	(%rsp), %r10
	cmpl	%r11d, %r12d
	jl	.L1842
	testl	%r12d, %r12d
	jle	.L1842
	leal	-1(%rbp), %r15d
	xorl	%ecx, %ecx
	addq	$1, %r15
	.p2align 4,,10
	.p2align 3
.L1843:
	testl	%ebp, %ebp
	jle	.L1848
	movslq	%ecx, %rsi
	movl	$1, %eax
	addq	%r14, %rsi
	movzbl	(%rsi), %edi
	cmpb	%dil, 0(%r13)
	je	.L1847
	jmp	.L1848
	.p2align 4,,10
	.p2align 3
.L1873:
	movzbl	(%rsi,%rax), %edx
	addq	$1, %rax
	cmpb	-1(%r13,%rax), %dl
	jne	.L1848
.L1847:
	cmpq	%rax, %r15
	jne	.L1873
	cmpl	%eax, %ebp
	je	.L1849
.L1848:
	addl	$1, %ecx
	cmpl	%ecx, %r12d
	jg	.L1843
.L1845:
	movl	104(%rsp), %eax
	testl	%eax, %eax
	je	.L1842
	movl	36(%rsp), %edx
	movq	%r10, 48(%rsp)
	xorl	%r13d, %r13d
	subl	%r11d, %edx
	imull	%edx, %eax
	addl	%r12d, %eax
	leal	1(%rax), %edi
	movl	%eax, 60(%rsp)
	call	v_malloc
	subq	$8, %rsp
	.cfi_def_cfa_offset 200
	movq	%rax, 24(%rsp)
	pushq	120(%rsp)
	.cfi_def_cfa_offset 208
	pushq	120(%rsp)
	.cfi_def_cfa_offset 216
	pushq	120(%rsp)
	.cfi_def_cfa_offset 224
	call	array_get.constprop.46
	addq	$32, %rsp
	.cfi_def_cfa_offset 192
	movl	36(%rsp), %edx
	movl	(%rax), %r15d
	movq	48(%rsp), %r10
	movl	%ebp, 64(%rsp)
	movl	$0, 8(%rsp)
	movl	$0, 56(%rsp)
	leal	-1(%rdx), %eax
	movl	%r15d, %ecx
	movq	%r14, 40(%rsp)
	movq	%r10, %rbp
	addq	$1, %rax
	movq	%rax, (%rsp)
	jmp	.L1855
.L1851:
	movslq	8(%rsp), %r15
	movabsq	$-4294967296, %rdi
	movl	%r12d, %eax
	andq	%rdi, %rbp
	movq	40(%rsp), %rdi
	movl	%r13d, %edx
	orq	%rax, %rbp
	movl	%ecx, 48(%rsp)
	movq	%rbp, %rsi
	movq	%r15, %r14
	addq	16(%rsp), %r15
	call	string_at
	movl	48(%rsp), %ecx
	addl	$1, %r14d
	movl	%r14d, 8(%rsp)
	movb	%al, (%r15)
.L1854:
	addl	$1, %r13d
	cmpl	%r13d, %r12d
	jle	.L1874
.L1855:
	cmpl	%ecx, %r13d
	jne	.L1851
	movl	36(%rsp), %eax
	testl	%eax, %eax
	jle	.L1852
	xorl	%r14d, %r14d
	movslq	8(%rsp), %r15
	movl	%r12d, 48(%rsp)
	movl	%r13d, 68(%rsp)
	movq	24(%rsp), %r12
	movq	%rbx, %r13
	movq	%r14, %rbx
	movq	16(%rsp), %r14
	movq	%rbp, 72(%rsp)
	movq	%rax, %rbp
	.p2align 4,,10
	.p2align 3
.L1853:
	movabsq	$-4294967296, %r8
	movl	%ebx, %edx
	movq	%r12, %rdi
	andq	%r13, %r8
	orq	%rbp, %r8
	movq	%r8, %rsi
	movq	%r8, %r13
	call	string_at
	leaq	(%r14,%r15), %rdx
	movb	%al, (%rdx,%rbx)
	addq	$1, %rbx
	cmpq	%rbx, (%rsp)
	jne	.L1853
	movl	36(%rsp), %edi
	addl	%edi, 8(%rsp)
	movq	%r13, %rbx
	movl	48(%rsp), %r12d
	movq	72(%rsp), %rbp
	movl	68(%rsp), %r13d
.L1852:
	addl	$1, 56(%rsp)
	movl	%r13d, %ecx
	movl	56(%rsp), %eax
	cmpl	%eax, 104(%rsp)
	movl	64(%rsp), %edi
	leal	-1(%rdi,%r13), %r13d
	jle	.L1854
	subq	$8, %rsp
	.cfi_def_cfa_offset 200
	pushq	120(%rsp)
	.cfi_def_cfa_offset 208
	pushq	120(%rsp)
	.cfi_def_cfa_offset 216
	pushq	120(%rsp)
	.cfi_def_cfa_offset 224
	movl	88(%rsp), %edi
	call	array_get
	addq	$32, %rsp
	.cfi_def_cfa_offset 192
	movl	(%rax), %ecx
	jmp	.L1854
	.p2align 4,,10
	.p2align 3
.L1842:
	movabsq	$-4294967296, %rdx
	movl	%r12d, %r9d
	movq	%r14, %rax
	andq	%rdx, %r10
	movq	%r10, %rdx
	orq	%r9, %rdx
	jmp	.L1841
	.p2align 4,,10
	.p2align 3
.L1849:
	leaq	96(%rsp), %rdi
	leaq	92(%rsp), %rsi
	movq	%r11, 16(%rsp)
	movq	%r10, 8(%rsp)
	movl	%ecx, 92(%rsp)
	movl	%ecx, (%rsp)
	call	array_push
	movl	(%rsp), %ecx
	movq	8(%rsp), %r10
	movabsq	$-4294967296, %rdi
	movl	%r12d, %eax
	movq	16(%rsp), %r11
	andq	%rdi, %r10
	addl	%ebp, %ecx
	orq	%rax, %r10
	cmpl	%ecx, %r12d
	jg	.L1843
	jmp	.L1845
.L1874:
	movq	16(%rsp), %rbx
	movslq	60(%rsp), %rax
	testq	%rbx, %rbx
	movb	$0, (%rbx,%rax)
	je	.L1875
	movq	%rbx, %rax
	movl	60(%rsp), %edx
	jmp	.L1841
.L1875:
	call	tos.part.7
.L1872:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE259:
	.size	string_replace, .-string_replace
	.section	.rodata.str1.8
	.align 8
.LC87:
	.string	"string.replace_many(): odd number of strings"
	.section	.text.string_replace_each,"ax",@progbits
	.p2align 4,,15
	.globl	string_replace_each
	.type	string_replace_each, @function
string_replace_each:
.LFB262:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$136, %rsp
	.cfi_def_cfa_offset 192
	movq	%rdi, (%rsp)
	movq	%rsi, 32(%rsp)
	movq	%fs:40, %rdi
	movq	%rdi, 120(%rsp)
	xorl	%edi, %edi
	movl	200(%rsp), %edi
	testl	%edi, %edi
	movl	%edi, 64(%rsp)
	je	.L1916
	testl	%esi, %esi
	jne	.L1877
.L1916:
	movq	(%rsp), %rax
	movq	32(%rsp), %rdx
.L1879:
	movq	120(%rsp), %rdi
	xorq	%fs:40, %rdi
	jne	.L1917
	addq	$136, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L1877:
	.cfi_restore_state
	testb	$1, 64(%rsp)
	jne	.L1918
	movl	%esi, %r15d
	movl	$8, %edi
	movl	$1, %esi
	call	calloc@PLT
	movq	%rax, 96(%rsp)
	movabsq	$4294967296, %rax
	movl	$8, 112(%rsp)
	movq	%rax, 104(%rsp)
	movl	64(%rsp), %eax
	testl	%eax, %eax
	jle	.L1916
	subl	$1, %eax
	movl	32(%rsp), %ebx
	movl	$0, 8(%rsp)
	andl	$-2, %eax
	xorl	%edx, %edx
	movl	%r15d, %r13d
	addl	$2, %eax
	movl	%eax, 48(%rsp)
	leaq	88(%rsp), %rax
	movq	%rax, 16(%rsp)
	leaq	96(%rsp), %rax
	movq	%rax, 24(%rsp)
.L1890:
	movl	64(%rsp), %eax
	movl	%edx, 40(%rsp)
	subq	$8, %rsp
	.cfi_def_cfa_offset 200
	movl	%eax, 208(%rsp)
	pushq	216(%rsp)
	.cfi_def_cfa_offset 208
	pushq	216(%rsp)
	.cfi_def_cfa_offset 216
	pushq	216(%rsp)
	.cfi_def_cfa_offset 224
	movl	40(%rsp), %r14d
	movl	%r14d, %edi
	call	array_get
	addq	$24, %rsp
	.cfi_def_cfa_offset 200
	movl	8(%rax), %r15d
	movq	(%rax), %rbp
	leal	1(%r14), %edi
	pushq	216(%rsp)
	.cfi_def_cfa_offset 208
	pushq	216(%rsp)
	.cfi_def_cfa_offset 216
	pushq	216(%rsp)
	.cfi_def_cfa_offset 224
	call	array_get
	movl	8(%rax), %eax
	movl	%eax, 44(%rsp)
	addq	$32, %rsp
	.cfi_def_cfa_offset 192
	cmpl	%r13d, %r15d
	jg	.L1883
	movl	40(%rsp), %edx
	cmpl	%r13d, %edx
	jge	.L1883
	leal	-1(%r15), %r8d
	xorl	%r12d, %r12d
	leaq	1(%r8), %r14
	movq	%r14, %rax
	movq	%rbp, %r14
	movl	%ebx, %ebp
	movl	%r12d, %ebx
	movl	%r13d, %r12d
	movl	%r15d, %r13d
	movq	%rax, %r15
	.p2align 4,,10
	.p2align 3
.L1900:
	cmpl	%ebx, %r12d
	jle	.L1913
	movslq	%ebx, %rsi
	addq	(%rsp), %rsi
	.p2align 4,,10
	.p2align 3
.L1884:
	testl	%r13d, %r13d
	jle	.L1902
	movzbl	(%rsi), %ecx
	movl	$1, %eax
	cmpb	%cl, (%r14)
	je	.L1886
	jmp	.L1887
	.p2align 4,,10
	.p2align 3
.L1919:
	movzbl	(%rsi,%rax), %edx
	addq	$1, %rax
	cmpb	-1(%r14,%rax), %dl
	jne	.L1887
.L1886:
	cmpq	%rax, %r15
	movl	%eax, %edx
	jne	.L1919
.L1885:
	cmpl	%edx, %r13d
	je	.L1888
.L1887:
	addl	$1, %ebx
	addq	$1, %rsi
	cmpl	%r12d, %ebx
	jne	.L1884
.L1913:
	movl	%ebp, %ebx
	movl	%r12d, %r13d
.L1883:
	addl	$2, 8(%rsp)
	movl	$-1, %edx
	movl	8(%rsp), %eax
	cmpl	%eax, 48(%rsp)
	jne	.L1890
	movl	104(%rsp), %eax
	movl	%r13d, %r15d
	testl	%eax, %eax
	je	.L1916
	movslq	112(%rsp), %rdx
	movq	96(%rsp), %rdi
	leaq	compare_rep_index(%rip), %rcx
	movslq	%eax, %rsi
	call	qsort@PLT
	leal	1(%rbx), %edi
	call	v_malloc
	subq	$8, %rsp
	.cfi_def_cfa_offset 200
	movq	%rax, %r14
	pushq	120(%rsp)
	.cfi_def_cfa_offset 208
	pushq	120(%rsp)
	.cfi_def_cfa_offset 216
	pushq	120(%rsp)
	.cfi_def_cfa_offset 224
	call	array_get.constprop.46
	movl	(%rax), %edi
	movl	4(%rax), %eax
	movl	%edi, 48(%rsp)
	movl	%eax, 44(%rsp)
	addq	$32, %rsp
	.cfi_def_cfa_offset 192
	movl	32(%rsp), %eax
	testl	%eax, %eax
	jle	.L1892
	xorl	%r13d, %r13d
	movl	%ebx, %eax
	xorl	%r12d, %r12d
	movl	%r13d, %ebx
	movl	$0, 8(%rsp)
	movl	%eax, %r13d
	jmp	.L1898
.L1893:
	movq	(%rsp), %rdi
	movslq	%r12d, %rax
	movzbl	(%rdi,%rax), %edx
	movslq	%ebx, %rax
	addl	$1, %ebx
	movb	%dl, (%r14,%rax)
.L1897:
	addl	$1, %r12d
	cmpl	%r15d, %r12d
	jge	.L1920
.L1898:
	cmpl	16(%rsp), %r12d
	jne	.L1893
	movl	64(%rsp), %eax
	subq	$8, %rsp
	.cfi_def_cfa_offset 200
	movl	%eax, 208(%rsp)
	pushq	216(%rsp)
	.cfi_def_cfa_offset 208
	pushq	216(%rsp)
	.cfi_def_cfa_offset 216
	pushq	216(%rsp)
	.cfi_def_cfa_offset 224
	movl	44(%rsp), %edi
	call	array_get
	addq	$24, %rsp
	.cfi_def_cfa_offset 200
	movl	8(%rax), %ebp
	movl	20(%rsp), %eax
	pushq	216(%rsp)
	.cfi_def_cfa_offset 208
	pushq	216(%rsp)
	.cfi_def_cfa_offset 216
	pushq	216(%rsp)
	.cfi_def_cfa_offset 224
	leal	1(%rax), %edi
	call	array_get
	movq	(%rax), %rdi
	movl	8(%rax), %r10d
	movq	8(%rax), %r9
	movq	%rdi, 64(%rsp)
	addq	$32, %rsp
	.cfi_def_cfa_offset 192
	testl	%r10d, %r10d
	jle	.L1894
	leal	-1(%r10), %eax
	xorl	%r8d, %r8d
	movslq	%ebx, %r11
	addq	$1, %rax
	movq	%rax, 24(%rsp)
	movl	%r10d, %eax
	movq	%rax, 40(%rsp)
.L1895:
	movabsq	$-4294967296, %rax
	movq	32(%rsp), %rdi
	movl	%r8d, %edx
	andq	%rax, %r9
	orq	40(%rsp), %r9
	movq	%r11, 72(%rsp)
	movl	%r10d, 68(%rsp)
	movq	%r8, 56(%rsp)
	movq	%r9, %rsi
	movq	%r9, 48(%rsp)
	call	string_at
	movq	72(%rsp), %r11
	movq	56(%rsp), %r8
	movq	48(%rsp), %r9
	movl	68(%rsp), %r10d
	leaq	(%r14,%r11), %rdx
	movb	%al, (%rdx,%r8)
	addq	$1, %r8
	cmpq	%r8, 24(%rsp)
	jne	.L1895
	addl	%r10d, %ebx
.L1894:
	addl	$1, 8(%rsp)
	leal	-1(%r12,%rbp), %r12d
	movl	8(%rsp), %eax
	cmpl	%eax, 104(%rsp)
	jle	.L1897
	subq	$8, %rsp
	.cfi_def_cfa_offset 200
	pushq	120(%rsp)
	.cfi_def_cfa_offset 208
	pushq	120(%rsp)
	.cfi_def_cfa_offset 216
	pushq	120(%rsp)
	.cfi_def_cfa_offset 224
	movl	40(%rsp), %edi
	call	array_get
	movl	(%rax), %edi
	movl	4(%rax), %eax
	movl	%edi, 48(%rsp)
	movl	%eax, 44(%rsp)
	addq	$32, %rsp
	.cfi_def_cfa_offset 192
	jmp	.L1897
	.p2align 4,,10
	.p2align 3
.L1918:
	leaq	.LC87(%rip), %rcx
	leaq	.LC26(%rip), %rsi
	movl	$44, %edx
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	jmp	.L1916
	.p2align 4,,10
	.p2align 3
.L1888:
	movl	8(%rsp), %eax
	movq	16(%rsp), %rsi
	movq	24(%rsp), %rdi
	movl	%ebx, 88(%rsp)
	addl	$1, %ebx
	movl	%eax, 92(%rsp)
	call	array_push
	movl	12(%rsp), %eax
	subl	%r13d, %eax
	addl	%eax, %ebp
	cmpl	%r12d, %ebx
	jl	.L1900
	jmp	.L1913
	.p2align 4,,10
	.p2align 3
.L1902:
	xorl	%edx, %edx
	jmp	.L1885
.L1920:
	movl	%r13d, %ebx
.L1892:
	movslq	%ebx, %rax
	testq	%r14, %r14
	movb	$0, (%r14,%rax)
	je	.L1921
	movq	%r14, %rax
	movl	%ebx, %edx
	jmp	.L1879
.L1917:
	call	__stack_chk_fail@PLT
.L1921:
	call	tos.part.7
	.cfi_endproc
.LFE262:
	.size	string_replace_each, .-string_replace_each
	.section	.text.array_prepend,"ax",@progbits
	.p2align 4,,15
	.globl	array_prepend
	.type	array_prepend, @function
array_prepend:
.LFB94:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rsi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movl	8(%rdi), %esi
	testl	%esi, %esi
	js	.L1925
	movq	%rdi, %rbx
	addl	$1, %esi
	call	array_ensure_cap
	movslq	16(%rbx), %r12
	movq	(%rbx), %rsi
	movq	%r12, %rdx
	leaq	(%rsi,%r12), %rdi
	imull	8(%rbx), %edx
	movslq	%edx, %rdx
	call	memmove@PLT
	movq	(%rbx), %rdi
	movq	%r12, %rdx
	movq	%rbp, %rsi
	call	memcpy@PLT
	addl	$1, 8(%rbx)
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L1925:
	.cfi_restore_state
	leaq	.LC66(%rip), %rdi
	movl	%esi, %edx
	xorl	%eax, %eax
	xorl	%esi, %esi
	call	_STR
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	v_panic
	.cfi_endproc
.LFE94:
	.size	array_prepend, .-array_prepend
	.section	.text.SortedMap_get,"ax",@progbits
	.p2align 4,,15
	.globl	SortedMap_get
	.type	SortedMap_get, @function
SortedMap_get:
.LFB235:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%esi, %r14d
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	leal	-1(%rsi), %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movq	88(%rsp), %r13
	movq	%rsi, (%rsp)
	movq	%rdx, 8(%rsp)
	movl	272(%r13), %ebp
	subl	$1, %ebp
	js	.L1927
.L1949:
	movslq	%ebp, %rax
	movl	%r12d, %esi
	salq	$4, %rax
	leaq	8(%r13,%rax), %rdi
	.p2align 4,,10
	.p2align 3
.L1928:
	testl	%r14d, %r14d
	movq	-8(%rdi), %rdx
	movl	(%rdi), %r10d
	jle	.L1930
	testl	%r10d, %r10d
	jle	.L1931
	movzbl	(%rbx), %eax
	cmpb	%al, (%rdx)
	jb	.L1931
	leal	-1(%r10), %ecx
	xorl	%eax, %eax
	jmp	.L1932
	.p2align 4,,10
	.p2align 3
.L1948:
	cmpq	%rax, %rsi
	je	.L1930
	cmpq	%rax, %rcx
	je	.L1931
	addq	$1, %rax
	movzbl	(%rbx,%rax), %r9d
	cmpb	%r9b, (%rdx,%rax)
	jb	.L1931
.L1932:
	movzbl	(%rbx,%rax), %r8d
	cmpb	%r8b, (%rdx,%rax)
	jbe	.L1948
.L1933:
	subl	$1, %ebp
	subq	$16, %rdi
	cmpl	$-1, %ebp
	jne	.L1928
.L1929:
	movq	264(%r13), %rax
	testq	%rax, %rax
	je	.L1938
	movslq	%ebp, %rbp
	movq	8(%rax,%rbp,8), %r13
	movl	272(%r13), %ebp
	subl	$1, %ebp
	jns	.L1949
.L1927:
	cmpl	$-1, %ebp
	je	.L1929
	jmp	.L1931
	.p2align 4,,10
	.p2align 3
.L1930:
	cmpl	%r14d, %r10d
	jg	.L1933
.L1931:
	movslq	%ebp, %r15
	movq	(%rsp), %rsi
	movq	%rbx, %rdi
	movq	%r15, %rax
	salq	$4, %rax
	movq	0(%r13,%rax), %rdx
	movq	8(%r13,%rax), %rcx
	call	string_eq
	testl	%eax, %eax
	je	.L1929
	movslq	80(%rsp), %rdx
	movq	176(%r13,%r15,8), %rsi
	movq	8(%rsp), %rdi
	call	memcpy@PLT
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	$1, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L1938:
	.cfi_restore_state
	addq	$24, %rsp
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE235:
	.size	SortedMap_get, .-SortedMap_get
	.section	.text.SortedMap_exists,"ax",@progbits
	.p2align 4,,15
	.globl	SortedMap_exists
	.type	SortedMap_exists, @function
SortedMap_exists:
.LFB236:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	movq	72(%rsp), %r14
	testq	%r14, %r14
	je	.L1951
	movl	272(%r14), %r12d
	movq	%rsi, %rbp
	movq	%rdi, %rbx
	movl	%esi, %r13d
	leal	-1(%rsi), %r15d
	subl	$1, %r12d
	js	.L1952
.L1977:
	movslq	%r12d, %rax
	movl	%r15d, %edi
	salq	$4, %rax
	leaq	8(%r14,%rax), %rsi
	.p2align 4,,10
	.p2align 3
.L1953:
	testl	%r13d, %r13d
	movq	-8(%rsi), %rdx
	movl	(%rsi), %r8d
	jle	.L1955
	testl	%r8d, %r8d
	jle	.L1956
	movzbl	(%rdx), %eax
	cmpb	%al, (%rbx)
	ja	.L1956
	leal	-1(%r8), %ecx
	xorl	%eax, %eax
	jmp	.L1957
	.p2align 4,,10
	.p2align 3
.L1976:
	cmpq	%rdi, %rax
	je	.L1955
	cmpq	%rcx, %rax
	je	.L1956
	addq	$1, %rax
	movzbl	(%rbx,%rax), %r10d
	cmpb	%r10b, (%rdx,%rax)
	jb	.L1956
.L1957:
	movzbl	(%rbx,%rax), %r9d
	cmpb	%r9b, (%rdx,%rax)
	jbe	.L1976
.L1958:
	subl	$1, %r12d
	subq	$16, %rsi
	cmpl	$-1, %r12d
	jne	.L1953
.L1954:
	movq	264(%r14), %rax
	testq	%rax, %rax
	je	.L1951
	movslq	%r12d, %r12
	movq	8(%rax,%r12,8), %r14
	movl	272(%r14), %r12d
	subl	$1, %r12d
	jns	.L1977
.L1952:
	cmpl	$-1, %r12d
	je	.L1954
	jmp	.L1956
	.p2align 4,,10
	.p2align 3
.L1955:
	cmpl	%r13d, %r8d
	jg	.L1958
.L1956:
	movslq	%r12d, %rax
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	salq	$4, %rax
	movq	(%r14,%rax), %rdx
	movq	8(%r14,%rax), %rcx
	call	string_eq
	testl	%eax, %eax
	je	.L1954
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	$1, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L1951:
	.cfi_restore_state
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE236:
	.size	SortedMap_exists, .-SortedMap_exists
	.section	.text.mapnode_remove_key,"ax",@progbits
	.p2align 4,,15
	.globl	mapnode_remove_key
	.type	mapnode_remove_key, @function
mapnode_remove_key:
.LFB238:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	leal	-1(%rdx), %eax
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdi, %r13
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%edx, %r12d
	movq	%rsi, %rbx
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	movq	%rdx, 16(%rsp)
	movl	%eax, 12(%rsp)
.L1979:
	movl	272(%r13), %r11d
	testl	%r11d, %r11d
	jle	.L1998
.L2010:
	movl	12(%rsp), %esi
	movq	%r13, %rdi
	xorl	%ebp, %ebp
	.p2align 4,,10
	.p2align 3
.L1981:
	movl	8(%rdi), %r10d
	movq	(%rdi), %rdx
	testl	%r10d, %r10d
	jle	.L1982
	testl	%r12d, %r12d
	jle	.L1983
	movzbl	(%rdx), %eax
	cmpb	%al, (%rbx)
	jb	.L1983
	leal	-1(%r10), %ecx
	xorl	%eax, %eax
	jmp	.L1984
	.p2align 4,,10
	.p2align 3
.L2008:
	cmpq	%rax, %rcx
	je	.L1982
	cmpq	%rsi, %rax
	je	.L1983
	addq	$1, %rax
	movzbl	(%rdx,%rax), %r9d
	cmpb	%r9b, (%rbx,%rax)
	jb	.L1983
.L1984:
	movzbl	(%rdx,%rax), %r8d
	cmpb	%r8b, (%rbx,%rax)
	jbe	.L2008
.L1985:
	addl	$1, %ebp
	addq	$16, %rdi
	cmpl	%r11d, %ebp
	jne	.L1981
	.p2align 4,,10
	.p2align 3
.L1980:
	movq	264(%r13), %rax
	testq	%rax, %rax
	je	.L2000
.L2011:
	movslq	%ebp, %r14
	movl	272(%r13), %r15d
	movq	(%rax,%r14,8), %rdx
	leaq	0(,%r14,8), %rcx
	cmpl	$5, 272(%rdx)
	jle	.L2009
.L1990:
	cmpl	%ebp, %r15d
	je	.L1995
.L1994:
	movq	(%rax,%r14,8), %r13
	movl	272(%r13), %r11d
	testl	%r11d, %r11d
	jg	.L2010
.L1998:
	movq	264(%r13), %rax
	xorl	%ebp, %ebp
	testq	%rax, %rax
	jne	.L2011
.L2000:
	xorl	%eax, %eax
.L1978:
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L1983:
	.cfi_restore_state
	cmpl	%ebp, %r11d
	jle	.L1980
	jmp	.L1997
	.p2align 4,,10
	.p2align 3
.L1982:
	cmpl	%r10d, %r12d
	jg	.L1985
.L1997:
	movslq	%ebp, %r14
	movq	16(%rsp), %rcx
	movq	%rbx, %rdx
	movq	%r14, %rax
	salq	$4, %rax
	leaq	0(%r13,%rax), %r15
	movq	%rax, 24(%rsp)
	movq	(%r15), %rdi
	movq	8(%r15), %rsi
	call	string_eq
	testl	%eax, %eax
	je	.L1980
	cmpq	$0, 264(%r13)
	jne	.L1987
	movl	272(%r13), %r12d
	leal	1(%rbp), %eax
	cmpl	%r12d, %eax
	jge	.L1988
	movl	%r12d, %eax
	movq	%r15, %rdi
	salq	$3, %r14
	subl	%ebp, %eax
	leal	-2(%rax), %ebx
	movq	24(%rsp), %rax
	addq	$1, %rbx
	leaq	16(%r13,%rax), %rsi
	movq	%rbx, %rdx
	salq	$4, %rdx
	call	memmove@PLT
	leaq	0(,%rbx,8), %rdx
	leaq	184(%r13,%r14), %rsi
	leaq	176(%r13,%r14), %rdi
	call	memmove@PLT
.L1988:
	subl	$1, %r12d
	movl	$1, %eax
	movl	%r12d, 272(%r13)
	jmp	.L1978
.L1992:
	leal	-1(%rbp), %esi
	movq	%r13, %rdi
	movq	%rcx, 24(%rsp)
	call	mapnode_merge
	movq	264(%r13), %rax
	movq	24(%rsp), %rcx
.L1995:
	cmpl	%ebp, 272(%r13)
	jge	.L1994
	movq	-8(%rax,%rcx), %r13
	jmp	.L1979
.L2009:
	testl	%ebp, %ebp
	je	.L1991
	movq	-8(%rax,%rcx), %rdx
	cmpl	$5, 272(%rdx)
	jg	.L2012
.L1991:
	cmpl	%ebp, %r15d
	je	.L1992
	movq	8(%rax,%rcx), %rax
	movl	%ebp, %esi
	movq	%r13, %rdi
	cmpl	$5, 272(%rax)
	jg	.L2013
	call	mapnode_merge
	movq	264(%r13), %rax
	jmp	.L1994
.L2012:
	movl	%ebp, %esi
	movq	%r13, %rdi
	movq	%rcx, 24(%rsp)
	call	mapnode_borrow_from_prev
	movq	264(%r13), %rax
	movq	24(%rsp), %rcx
	jmp	.L1990
.L2013:
	call	mapnode_borrow_from_next
	movq	264(%r13), %rax
	jmp	.L1994
.L1987:
	movl	%ebp, %esi
	movq	%r13, %rdi
	call	mapnode_remove_from_non_leaf
	movl	$1, %eax
	jmp	.L1978
	.cfi_endproc
.LFE238:
	.size	mapnode_remove_key, .-mapnode_remove_key
	.section	.text.mapnode_remove_from_non_leaf,"ax",@progbits
	.p2align 4,,15
	.globl	mapnode_remove_from_non_leaf
	.type	mapnode_remove_from_non_leaf, @function
mapnode_remove_from_non_leaf:
.LFB240:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movslq	%esi, %rbp
	leaq	0(,%rbp,8), %r8
	movq	%rbp, %rax
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	movq	264(%rdi), %r9
	salq	$4, %rax
	movq	(%rdi,%rax), %r12
	movq	8(%rdi,%rax), %r13
	leaq	(%r9,%r8), %r10
	movq	(%r10), %rcx
	movslq	272(%rcx), %rax
	cmpl	$5, %eax
	jle	.L2015
	movq	264(%rcx), %rdx
	testq	%rdx, %rdx
	je	.L2016
	.p2align 4,,10
	.p2align 3
.L2017:
	movq	(%rdx,%rax,8), %rcx
	movq	264(%rcx), %rdx
	movslq	272(%rcx), %rax
	testq	%rdx, %rdx
	jne	.L2017
.L2016:
	subl	$1, %eax
	movq	%rbp, %r8
	cltq
	salq	$4, %r8
	movq	%rax, %rdx
	movq	176(%rcx,%rax,8), %rax
	salq	$4, %rdx
	movq	(%rcx,%rdx), %rsi
	movq	8(%rcx,%rdx), %rdx
	movq	%rsi, (%rdi,%r8)
	movq	%rdx, 8(%rdi,%r8)
	movq	%rax, 176(%rdi,%rbp,8)
	movq	(%r10), %rdi
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	jmp	mapnode_remove_key
	.p2align 4,,10
	.p2align 3
.L2015:
	.cfi_restore_state
	leaq	8(%r9,%r8), %r8
	movq	(%r8), %rcx
	cmpl	$5, 272(%rcx)
	jg	.L2030
	movq	%rdi, %rbx
	call	mapnode_merge
	movq	264(%rbx), %rax
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	(%rax,%rbp,8), %rdi
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	jmp	mapnode_remove_key
	.p2align 4,,10
	.p2align 3
.L2020:
	.cfi_restore_state
	movq	(%rax), %rcx
.L2030:
	movq	264(%rcx), %rax
	testq	%rax, %rax
	jne	.L2020
	movq	(%rcx), %rsi
	movq	8(%rcx), %rdx
	movq	%rbp, %rax
	salq	$4, %rax
	movq	%rsi, (%rdi,%rax)
	movq	%rdx, 8(%rdi,%rax)
	movq	176(%rcx), %rax
	movq	%rax, 176(%rdi,%rbp,8)
	movq	(%r8), %rdi
	addq	$8, %rsp
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	jmp	mapnode_remove_key
	.cfi_endproc
.LFE240:
	.size	mapnode_remove_from_non_leaf, .-mapnode_remove_from_non_leaf
	.section	.text.SortedMap_delete,"ax",@progbits
	.p2align 4,,15
	.globl	SortedMap_delete
	.type	SortedMap_delete, @function
SortedMap_delete:
.LFB245:
	.cfi_startproc
	movq	8(%rdi), %rax
	movl	272(%rax), %ecx
	testl	%ecx, %ecx
	jne	.L2047
	rep ret
	.p2align 4,,10
	.p2align 3
.L2047:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	movq	%rax, %rdi
	call	mapnode_remove_key
	testl	%eax, %eax
	je	.L2035
	subl	$1, 16(%rbx)
.L2035:
	movq	8(%rbx), %rax
	movl	272(%rax), %edx
	testl	%edx, %edx
	jne	.L2032
	movq	264(%rax), %rax
	testq	%rax, %rax
	je	.L2032
	movq	(%rax), %rax
	movq	%rax, 8(%rbx)
.L2032:
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE245:
	.size	SortedMap_delete, .-SortedMap_delete
	.section	.text.array_slice2,"ax",@progbits
	.p2align 4,,15
	.globl	array_slice2
	.type	array_slice2, @function
array_slice2:
.LFB102:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	testl	%ecx, %ecx
	movl	%edx, %r9d
	movl	32(%rsp), %r8d
	movl	24(%rsp), %edx
	movq	16(%rsp), %rax
	je	.L2049
	cmpl	%edx, %esi
	jg	.L2058
.L2051:
	testl	%esi, %esi
	js	.L2059
	subl	%esi, %edx
	movl	%r8d, 16(%rdi)
	imull	%r8d, %esi
	movl	%edx, 8(%rdi)
	movl	%edx, 12(%rdi)
	movslq	%esi, %rsi
	addq	%rax, %rsi
	movq	%rdi, %rax
	movq	%rsi, (%rdi)
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L2049:
	.cfi_restore_state
	cmpl	%esi, %r9d
	jl	.L2050
	cmpl	%edx, %r9d
	jg	.L2060
	movl	%r9d, %edx
	jmp	.L2051
.L2058:
	movl	%edx, %r9d
.L2050:
	leaq	.LC69(%rip), %rdi
	movl	%r9d, %edx
.L2057:
	xorl	%eax, %eax
	call	_STR
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	v_panic
.L2060:
	movl	%r9d, %esi
	leaq	.LC70(%rip), %rdi
	jmp	.L2057
.L2059:
	leaq	.LC71(%rip), %rdi
	xorl	%eax, %eax
	call	_STR
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	v_panic
	.cfi_endproc
.LFE102:
	.size	array_slice2, .-array_slice2
	.section	.text.SortedMap_set,"ax",@progbits
	.p2align 4,,15
	.globl	SortedMap_set
	.type	SortedMap_set, @function
SortedMap_set:
.LFB233:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%edx, %eax
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	subl	$1, %eax
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	xorl	%r13d, %r13d
	xorl	%r14d, %r14d
	movq	%rsi, %rbx
	movabsq	$-4294967296, %r8
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	movq	8(%rdi), %r15
	movq	%rdi, 48(%rsp)
	movq	%rdx, 40(%rsp)
	movq	%rcx, 56(%rsp)
	movl	%edx, 8(%rsp)
	movl	272(%r15), %r11d
	cmpl	_const_max_size(%rip), %r11d
	movl	%eax, 36(%rsp)
	je	.L2095
	.p2align 4,,10
	.p2align 3
.L2062:
	testl	%r11d, %r11d
	jle	.L2081
.L2102:
	movl	8(%rsp), %eax
	leaq	8(%r15), %r13
	xorl	%r14d, %r14d
	movq	%rax, 16(%rsp)
	.p2align 4,,10
	.p2align 3
.L2072:
	movl	0(%r13), %ecx
	movq	%r12, %rsi
	movl	8(%rsp), %eax
	andq	%r8, %rsi
	orq	16(%rsp), %rsi
	andq	%r8, %rbp
	movq	-8(%r13), %rdx
	movq	%rcx, %r10
	orq	%rbp, %rcx
	testl	%eax, %eax
	movq	%rsi, %r12
	movq	%rcx, %rbp
	jle	.L2067
	testl	%r10d, %r10d
	jle	.L2068
	movzbl	(%rbx), %eax
	cmpb	%al, (%rdx)
	jb	.L2068
	leal	-1(%r10), %r9d
	movl	36(%rsp), %edi
	xorl	%eax, %eax
	movl	%r10d, 24(%rsp)
	jmp	.L2069
	.p2align 4,,10
	.p2align 3
.L2097:
	cmpq	%rdi, %rax
	je	.L2096
	cmpq	%rax, %r9
	je	.L2068
	addq	$1, %rax
	movzbl	(%rbx,%rax), %r10d
	cmpb	%r10b, (%rdx,%rax)
	jb	.L2068
.L2069:
	movzbl	(%rbx,%rax), %r10d
	cmpb	%r10b, (%rdx,%rax)
	jbe	.L2097
.L2066:
	cmpl	%r11d, %r14d
	je	.L2073
	movslq	%r14d, %r13
	movq	40(%rsp), %rsi
	movq	%rbx, %rdi
	movq	%r13, %rax
	movq	%r8, 16(%rsp)
	salq	$4, %rax
	movq	(%r15,%rax), %rdx
	movq	8(%r15,%rax), %rcx
	call	string_eq
	testl	%eax, %eax
	movq	16(%rsp), %r8
	jne	.L2098
.L2073:
	movq	264(%r15), %rdx
	testq	%rdx, %rdx
	je	.L2099
	movslq	%r14d, %rax
	movq	%r15, %r13
	movq	(%rdx,%rax,8), %r15
	movl	272(%r15), %r11d
	cmpl	_const_max_size(%rip), %r11d
	jne	.L2062
.L2095:
	testq	%r13, %r13
	je	.L2100
.L2063:
	movl	%r14d, %esi
	movslq	%r14d, %r14
	movq	%r15, %rdx
	movq	%r14, %r15
	movq	%r13, %rdi
	movq	%r8, 16(%rsp)
	salq	$4, %r15
	addq	%r13, %r15
	call	mapnode_split_child
	movq	(%r15), %rdx
	movq	8(%r15), %rcx
	movq	%rbx, %rdi
	movq	40(%rsp), %rsi
	call	string_eq
	testl	%eax, %eax
	movq	16(%rsp), %r8
	jne	.L2101
	movq	(%r15), %rdx
	movq	8(%r15), %rcx
	movq	%rbx, %rdi
	movq	40(%rsp), %rsi
	movq	%r8, 16(%rsp)
	call	string_lt
	testl	%eax, %eax
	movq	16(%rsp), %r8
	movq	264(%r13), %rax
	je	.L2065
	movq	(%rax,%r14,8), %r15
	movl	272(%r15), %r11d
	testl	%r11d, %r11d
	jg	.L2102
.L2081:
	xorl	%r14d, %r14d
	jmp	.L2066
	.p2align 4,,10
	.p2align 3
.L2096:
	movl	24(%rsp), %r10d
.L2067:
	cmpl	8(%rsp), %r10d
	jg	.L2066
.L2068:
	movq	%rbx, %rdi
	movq	%r8, 24(%rsp)
	call	string_eq
	testl	%eax, %eax
	movq	24(%rsp), %r8
	je	.L2071
	movl	272(%r15), %r11d
	jmp	.L2066
	.p2align 4,,10
	.p2align 3
.L2071:
	movl	272(%r15), %r11d
	addl	$1, %r14d
	addq	$16, %r13
	cmpl	%r14d, %r11d
	jg	.L2072
	jmp	.L2066
.L2065:
	movq	8(%rax,%r14,8), %r15
	movl	272(%r15), %r11d
	jmp	.L2062
.L2100:
	xorl	%eax, %eax
	movq	%r8, 16(%rsp)
	call	new_node
	movq	%rax, %r13
	movq	48(%rsp), %rax
	movq	16(%rsp), %r8
	movq	%r13, 8(%rax)
	jmp	.L2063
.L2099:
	movslq	272(%r15), %rdx
	movl	%edx, %ebp
	subl	$1, %ebp
	js	.L2076
	movq	%rdx, %rcx
	movslq	%ebp, %rax
	xorl	%r13d, %r13d
	salq	$4, %rcx
	movq	%rax, %r12
	leaq	(%r15,%rax,8), %r14
	addq	%r15, %rcx
	salq	$4, %r12
	movq	%rcx, 16(%rsp)
	leaq	(%r15,%rdx,8), %rcx
	addq	%r15, %r12
	movq	%rcx, 8(%rsp)
	jmp	.L2077
.L2078:
	movq	16(%rsp), %rax
	movq	8(%rsp), %rcx
	subl	$1, %ebp
	movdqu	(%r12,%r13,2), %xmm0
	movups	%xmm0, (%rax,%r13,2)
	movq	176(%r14,%r13), %rax
	movq	%rax, 176(%rcx,%r13)
	subq	$8, %r13
	cmpl	$-1, %ebp
	je	.L2087
	movslq	%ebp, %rax
.L2077:
	salq	$4, %rax
	movq	40(%rsp), %rsi
	movq	%rbx, %rdi
	movq	(%r15,%rax), %rdx
	movq	8(%r15,%rax), %rcx
	call	string_lt
	testl	%eax, %eax
	leal	1(%rbp), %edx
	jne	.L2078
.L2076:
	movslq	%edx, %rbp
	movq	40(%rsp), %rcx
	movq	%rbp, %rax
	salq	$4, %rax
	addq	%r15, %rax
	movq	%rbx, (%rax)
	movq	48(%rsp), %rbx
	movq	%rcx, 8(%rax)
	movl	(%rbx), %edi
	call	v_malloc
	movslq	(%rbx), %rdx
	movq	56(%rsp), %rsi
	movq	%rax, %rdi
	movq	%rax, 176(%r15,%rbp,8)
	call	memcpy@PLT
	addl	$1, 272(%r15)
	addl	$1, 16(%rbx)
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L2087:
	.cfi_restore_state
	xorl	%edx, %edx
	jmp	.L2076
.L2098:
	movq	176(%r15,%r13,8), %rdi
.L2094:
	movq	48(%rsp), %rax
	movq	56(%rsp), %rsi
	movslq	(%rax), %rdx
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	memcpy@PLT
.L2101:
	.cfi_restore_state
	movq	176(%r13,%r14,8), %rdi
	jmp	.L2094
	.cfi_endproc
.LFE233:
	.size	SortedMap_set, .-SortedMap_set
	.section	.text.new_sorted_map_init,"ax",@progbits
	.p2align 4,,15
	.globl	new_sorted_map_init
	.type	new_sorted_map_init, @function
new_sorted_map_init:
.LFB231:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%esi, %r14d
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdi, %r13
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movslq	%edx, %r12
	movq	%rcx, %rbx
	movq	%r8, %rbp
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	call	new_node
	testl	%r14d, %r14d
	movl	%r12d, (%rsp)
	movq	%rax, 8(%rsp)
	movl	$0, 16(%rsp)
	jle	.L2104
	leal	-1(%r14), %eax
	movq	%rsp, %r14
	salq	$4, %rax
	leaq	16(%rbx,%rax), %r15
	.p2align 4,,10
	.p2align 3
.L2105:
	movq	(%rbx), %rsi
	movq	8(%rbx), %rdx
	movq	%rbp, %rcx
	movq	%r14, %rdi
	addq	$16, %rbx
	addq	%r12, %rbp
	call	SortedMap_set
	cmpq	%rbx, %r15
	jne	.L2105
.L2104:
	movq	16(%rsp), %rax
	movdqa	(%rsp), %xmm0
	movq	24(%rsp), %rcx
	xorq	%fs:40, %rcx
	movq	%rax, 16(%r13)
	movq	%r13, %rax
	movups	%xmm0, 0(%r13)
	jne	.L2109
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L2109:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE231:
	.size	new_sorted_map_init, .-new_sorted_map_init
	.section	.text.array_string_join_lines,"ax",@progbits
	.p2align 4,,15
	.globl	array_string_join_lines
	.type	array_string_join_lines, @function
array_string_join_lines:
.LFB346:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	leaq	.LC37(%rip), %rax
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movl	88(%rsp), %r13d
	cmpl	$0, %r13d
	je	.L2111
	jle	.L2112
	movq	80(%rsp), %rbx
	leal	-1(%r13), %edx
	xorl	%edi, %edi
	movl	%edx, 8(%rsp)
	salq	$4, %rdx
	leaq	8(%rbx), %rax
	leaq	24(%rbx,%rdx), %rcx
	.p2align 4,,10
	.p2align 3
.L2113:
	movl	(%rax), %edx
	addq	$16, %rax
	cmpq	%rax, %rcx
	leal	1(%rdi,%rdx), %edi
	jne	.L2113
	leal	-1(%rdi), %eax
	xorl	%r14d, %r14d
	movl	%eax, 12(%rsp)
	call	v_malloc
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L2129:
	movl	8(%rbx), %r8d
	movq	(%rbx), %rdi
	testl	%r8d, %r8d
	jle	.L2115
	movslq	%edx, %r11
	leaq	16(%rax,%r11), %rcx
	leaq	(%rax,%r11), %rsi
	cmpq	%rcx, %rdi
	leaq	16(%rdi), %rcx
	setnb	%r9b
	cmpq	%rcx, %rsi
	setnb	%cl
	orb	%cl, %r9b
	je	.L2116
	cmpl	$22, %r8d
	jbe	.L2116
	movq	%rdi, %r9
	leal	-1(%r8), %r10d
	negq	%r9
	andl	$15, %r9d
	leal	15(%r9), %ecx
	cmpl	%ecx, %r10d
	jb	.L2132
	testl	%r9d, %r9d
	je	.L2133
	movzbl	(%rdi), %ecx
	cmpl	$1, %r9d
	movb	%cl, (%rsi)
	leal	1(%rdx), %esi
	je	.L2134
	movzbl	1(%rdi), %ecx
	movslq	%esi, %rsi
	cmpl	$2, %r9d
	movb	%cl, (%rax,%rsi)
	leal	2(%rdx), %esi
	je	.L2135
	movzbl	2(%rdi), %ecx
	movslq	%esi, %rsi
	cmpl	$3, %r9d
	movb	%cl, (%rax,%rsi)
	leal	3(%rdx), %esi
	je	.L2136
	movzbl	3(%rdi), %ecx
	movslq	%esi, %rsi
	cmpl	$4, %r9d
	movb	%cl, (%rax,%rsi)
	leal	4(%rdx), %esi
	je	.L2137
	movzbl	4(%rdi), %ecx
	movslq	%esi, %rsi
	cmpl	$5, %r9d
	movb	%cl, (%rax,%rsi)
	leal	5(%rdx), %esi
	je	.L2138
	movzbl	5(%rdi), %ecx
	movslq	%esi, %rsi
	cmpl	$6, %r9d
	movb	%cl, (%rax,%rsi)
	leal	6(%rdx), %esi
	je	.L2139
	movzbl	6(%rdi), %ecx
	movslq	%esi, %rsi
	cmpl	$7, %r9d
	movb	%cl, (%rax,%rsi)
	leal	7(%rdx), %esi
	je	.L2140
	movzbl	7(%rdi), %ecx
	movslq	%esi, %rsi
	cmpl	$8, %r9d
	movb	%cl, (%rax,%rsi)
	leal	8(%rdx), %esi
	je	.L2141
	movzbl	8(%rdi), %ecx
	movslq	%esi, %rsi
	cmpl	$9, %r9d
	movb	%cl, (%rax,%rsi)
	leal	9(%rdx), %esi
	je	.L2142
	movzbl	9(%rdi), %ecx
	movslq	%esi, %rsi
	cmpl	$10, %r9d
	movb	%cl, (%rax,%rsi)
	leal	10(%rdx), %esi
	je	.L2143
	movzbl	10(%rdi), %ecx
	movslq	%esi, %rsi
	cmpl	$11, %r9d
	movb	%cl, (%rax,%rsi)
	leal	11(%rdx), %esi
	je	.L2144
	movzbl	11(%rdi), %ecx
	movslq	%esi, %rsi
	cmpl	$12, %r9d
	movb	%cl, (%rax,%rsi)
	leal	12(%rdx), %esi
	je	.L2145
	movzbl	12(%rdi), %ecx
	movslq	%esi, %rsi
	cmpl	$13, %r9d
	movb	%cl, (%rax,%rsi)
	leal	13(%rdx), %esi
	je	.L2146
	movzbl	13(%rdi), %ecx
	movslq	%esi, %rsi
	cmpl	$15, %r9d
	movb	%cl, (%rax,%rsi)
	leal	14(%rdx), %esi
	jne	.L2147
	movzbl	14(%rdi), %ecx
	movslq	%esi, %rsi
	movb	%cl, (%rax,%rsi)
	leal	15(%rdx), %esi
	movl	$15, %ecx
	jmp	.L2118
	.p2align 4,,10
	.p2align 3
.L2134:
	movl	$1, %ecx
	.p2align 4,,10
	.p2align 3
.L2118:
	movl	%r8d, %ebp
	movl	%r9d, %r10d
	subl	%r9d, %ebp
	addq	%r10, %r11
	leaq	(%rdi,%r10), %r12
	movl	%ebp, %r15d
	addq	%rax, %r11
	xorl	%r9d, %r9d
	shrl	$4, %r15d
	xorl	%r10d, %r10d
	.p2align 4,,10
	.p2align 3
.L2120:
	movdqa	(%r12,%r9), %xmm0
	addl	$1, %r10d
	movups	%xmm0, (%r11,%r9)
	addq	$16, %r9
	cmpl	%r10d, %r15d
	ja	.L2120
	movl	%ebp, %r9d
	andl	$-16, %r9d
	addl	%r9d, %ecx
	addl	%r9d, %esi
	cmpl	%r9d, %ebp
	je	.L2125
.L2117:
	movslq	%ecx, %rcx
	movslq	%esi, %rsi
	subq	%rcx, %rsi
	addq	%rax, %rsi
	.p2align 4,,10
	.p2align 3
.L2123:
	movzbl	(%rdi,%rcx), %r9d
	movb	%r9b, (%rsi,%rcx)
	addq	$1, %rcx
	cmpl	%ecx, %r8d
	jg	.L2123
.L2125:
	addl	%r8d, %edx
.L2115:
	cmpl	8(%rsp), %r14d
	je	.L2164
	movslq	%edx, %rcx
	addl	$1, %edx
	movb	$10, (%rax,%rcx)
.L2164:
	addl	$1, %r14d
	addq	$16, %rbx
	cmpl	%r13d, %r14d
	jne	.L2129
	movslq	12(%rsp), %rdx
	movq	%rdx, %r13
.L2130:
	movb	$0, (%rax,%rdx)
.L2111:
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	%r13d, %edx
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L2116:
	.cfi_restore_state
	leal	-1(%r8), %r10d
	xorl	%ecx, %ecx
	addq	$1, %r10
	.p2align 4,,10
	.p2align 3
.L2124:
	movzbl	(%rdi,%rcx), %r9d
	movb	%r9b, (%rsi,%rcx)
	addq	$1, %rcx
	cmpq	%r10, %rcx
	jne	.L2124
	addl	%r8d, %edx
	jmp	.L2115
	.p2align 4,,10
	.p2align 3
.L2135:
	movl	$2, %ecx
	jmp	.L2118
	.p2align 4,,10
	.p2align 3
.L2132:
	movl	%edx, %esi
	xorl	%ecx, %ecx
	jmp	.L2117
.L2112:
	xorl	%edi, %edi
	call	v_malloc
	movq	$-1, %rdx
	movl	%edx, %r13d
	jmp	.L2130
	.p2align 4,,10
	.p2align 3
.L2136:
	movl	$3, %ecx
	jmp	.L2118
	.p2align 4,,10
	.p2align 3
.L2137:
	movl	$4, %ecx
	jmp	.L2118
	.p2align 4,,10
	.p2align 3
.L2138:
	movl	$5, %ecx
	jmp	.L2118
.L2133:
	movl	%edx, %esi
	xorl	%ecx, %ecx
	jmp	.L2118
.L2139:
	movl	$6, %ecx
	jmp	.L2118
.L2140:
	movl	$7, %ecx
	jmp	.L2118
.L2141:
	movl	$8, %ecx
	jmp	.L2118
.L2142:
	movl	$9, %ecx
	jmp	.L2118
.L2143:
	movl	$10, %ecx
	jmp	.L2118
.L2144:
	movl	$11, %ecx
	jmp	.L2118
.L2147:
	movl	$14, %ecx
	jmp	.L2118
.L2145:
	movl	$12, %ecx
	jmp	.L2118
.L2146:
	movl	$13, %ecx
	jmp	.L2118
	.cfi_endproc
.LFE346:
	.size	array_string_join_lines, .-array_string_join_lines
	.section	.text.copy,"ax",@progbits
	.p2align 4,,15
	.globl	copy
	.type	copy, @function
copy:
.LFB114:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	48(%rsp), %eax
	movl	24(%rsp), %ebx
	testl	%eax, %eax
	jle	.L2168
	testl	%ebx, %ebx
	jle	.L2168
	movl	32(%rsp), %edx
	cmpl	%eax, %ebx
	movq	40(%rsp), %rsi
	cmovg	%eax, %ebx
	imull	%ebx, %edx
	cmpl	%eax, %ebx
	movslq	%edx, %rdx
	jg	.L2176
	movq	16(%rsp), %rdi
	call	memcpy@PLT
	movl	%ebx, %eax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L2168:
	.cfi_restore_state
	xorl	%ebx, %ebx
	movl	%ebx, %eax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L2176:
	.cfi_restore_state
	leaq	.LC70(%rip), %rdi
	movl	%eax, %edx
	movl	%ebx, %esi
	xorl	%eax, %eax
	call	_STR
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	v_panic
	.cfi_endproc
.LFE114:
	.size	copy, .-copy
	.section	.text.mapnode_find_key,"ax",@progbits
	.p2align 4,,15
	.globl	mapnode_find_key
	.type	mapnode_find_key, @function
mapnode_find_key:
.LFB237:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	xorl	%eax, %eax
	movl	272(%rdi), %ebx
	testl	%ebx, %ebx
	jle	.L2177
	leal	-1(%rdx), %r10d
	.p2align 4,,10
	.p2align 3
.L2179:
	movl	8(%rdi), %r11d
	movq	(%rdi), %r8
	testl	%r11d, %r11d
	jle	.L2180
	testl	%edx, %edx
	jle	.L2177
	movzbl	(%r8), %ecx
	cmpb	%cl, (%rsi)
	jb	.L2177
	leal	-1(%r11), %r9d
	xorl	%ecx, %ecx
	jmp	.L2181
	.p2align 4,,10
	.p2align 3
.L2187:
	cmpq	%rcx, %r9
	je	.L2180
	cmpq	%rcx, %r10
	je	.L2177
	addq	$1, %rcx
	movzbl	(%r8,%rcx), %r14d
	cmpb	%r14b, (%rsi,%rcx)
	jb	.L2177
.L2181:
	movzbl	(%r8,%rcx), %r14d
	cmpb	%r14b, (%rsi,%rcx)
	jbe	.L2187
.L2182:
	addl	$1, %eax
	addq	$16, %rdi
	cmpl	%eax, %ebx
	jne	.L2179
.L2177:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L2180:
	.cfi_restore_state
	cmpl	%r11d, %edx
	jg	.L2182
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE237:
	.size	mapnode_find_key, .-mapnode_find_key
	.section	.text.array_int_index,"ax",@progbits
	.p2align 4,,15
	.globl	array_int_index
	.type	array_int_index, @function
array_int_index:
.LFB118:
	.cfi_startproc
	movl	16(%rsp), %esi
	movl	$-1, %eax
	testl	%esi, %esi
	jle	.L2188
	movq	8(%rsp), %rdx
	movslq	24(%rsp), %rcx
	cmpl	(%rdx), %edi
	je	.L2193
	movq	%rcx, %r8
	addq	%rcx, %rdx
	xorl	%eax, %eax
	negq	%r8
	jmp	.L2190
	.p2align 4,,10
	.p2align 3
.L2191:
	addq	%rcx, %rdx
	cmpl	%edi, (%rdx,%r8)
	je	.L2188
.L2190:
	addl	$1, %eax
	cmpl	%eax, %esi
	jne	.L2191
	movl	$-1, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L2193:
	xorl	%eax, %eax
.L2188:
	rep ret
	.cfi_endproc
.LFE118:
	.size	array_int_index, .-array_int_index
	.section	.text.array_byte_index,"ax",@progbits
	.p2align 4,,15
	.globl	array_byte_index
	.type	array_byte_index, @function
array_byte_index:
.LFB119:
	.cfi_startproc
	movl	16(%rsp), %esi
	movl	%edi, %r8d
	movl	$-1, %eax
	testl	%esi, %esi
	jle	.L2194
	movq	8(%rsp), %rdx
	movslq	24(%rsp), %rcx
	cmpb	(%rdx), %dil
	je	.L2199
	movq	%rcx, %rdi
	addq	%rcx, %rdx
	xorl	%eax, %eax
	negq	%rdi
	jmp	.L2196
	.p2align 4,,10
	.p2align 3
.L2197:
	addq	%rcx, %rdx
	cmpb	%r8b, (%rdx,%rdi)
	je	.L2194
.L2196:
	addl	$1, %eax
	cmpl	%eax, %esi
	jne	.L2197
	movl	$-1, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L2199:
	xorl	%eax, %eax
.L2194:
	rep ret
	.cfi_endproc
.LFE119:
	.size	array_byte_index, .-array_byte_index
	.section	.text.array_char_index,"ax",@progbits
	.p2align 4,,15
	.globl	array_char_index
	.type	array_char_index, @function
array_char_index:
.LFB120:
	.cfi_startproc
	movl	16(%rsp), %esi
	movl	%edi, %r8d
	movl	$-1, %eax
	testl	%esi, %esi
	jle	.L2200
	movq	8(%rsp), %rdx
	movslq	24(%rsp), %rcx
	cmpb	(%rdx), %dil
	je	.L2205
	movq	%rcx, %rdi
	addq	%rcx, %rdx
	xorl	%eax, %eax
	negq	%rdi
	jmp	.L2202
	.p2align 4,,10
	.p2align 3
.L2203:
	addq	%rcx, %rdx
	cmpb	%r8b, (%rdx,%rdi)
	je	.L2200
.L2202:
	addl	$1, %eax
	cmpl	%eax, %esi
	jne	.L2203
	movl	$-1, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L2205:
	xorl	%eax, %eax
.L2200:
	rep ret
	.cfi_endproc
.LFE120:
	.size	array_char_index, .-array_char_index
	.section	.text.array_string_index,"ax",@progbits
	.p2align 4,,15
	.globl	array_string_index
	.type	array_string_index, @function
array_string_index:
.LFB117:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	movl	72(%rsp), %r14d
	testl	%r14d, %r14d
	jle	.L2207
	movq	%rsi, %r13
	movq	%rdi, %r12
	movslq	80(%rsp), %r15
	movq	64(%rsp), %rbx
	xorl	%ebp, %ebp
	jmp	.L2209
	.p2align 4,,10
	.p2align 3
.L2212:
	addl	$1, %ebp
	addq	%r15, %rbx
	cmpl	%ebp, %r14d
	je	.L2207
.L2209:
	movq	(%rbx), %rdi
	movq	8(%rbx), %rsi
	movq	%r12, %rdx
	movq	%r13, %rcx
	call	string_eq
	testl	%eax, %eax
	je	.L2212
.L2206:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	%ebp, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L2207:
	.cfi_restore_state
	movl	$-1, %ebp
	jmp	.L2206
	.cfi_endproc
.LFE117:
	.size	array_string_index, .-array_string_index
	.section	.rodata.str1.1
.LC88:
	.string	" "
	.section	.text.string_title,"ax",@progbits
	.p2align 4,,15
	.globl	string_title
	.type	string_title, @function
string_title:
.LFB302:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdi, %rax
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	leaq	.LC88(%rip), %rcx
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rsi, %rdx
	movl	$1, %r8d
	movq	%rax, %rsi
	subq	$104, %rsp
	.cfi_def_cfa_offset 160
	leaq	32(%rsp), %rdi
	movq	%fs:40, %rbx
	movq	%rbx, 88(%rsp)
	xorl	%ebx, %ebx
	call	string_split_nth.constprop.37
	movl	40(%rsp), %ebx
	movl	$1, %esi
	movl	$16, %edi
	call	calloc@PLT
	movq	%rax, 64(%rsp)
	movabsq	$4294967296, %rax
	movl	$16, 80(%rsp)
	testl	%ebx, %ebx
	movq	%rax, 72(%rsp)
	jle	.L2236
	movq	32(%rsp), %rax
	leal	-1(%rbx), %ebp
	leaq	16(%rsp), %r13
	leaq	64(%rsp), %r12
	salq	$4, %rbp
	leaq	16(%rax), %rbx
	addq	%rbx, %rbp
	jmp	.L2215
	.p2align 4,,10
	.p2align 3
.L2271:
	addq	$16, %rbx
.L2215:
	movq	(%rax), %rdi
	movq	8(%rax), %rsi
	call	string_capitalize
	movq	%r13, %rsi
	movq	%r12, %rdi
	movq	%rax, 16(%rsp)
	movq	%rdx, 24(%rsp)
	call	array_push
	cmpq	%rbx, %rbp
	movq	%rbx, %rax
	jne	.L2271
	movl	72(%rsp), %r13d
	movq	64(%rsp), %rbx
	leaq	.LC37(%rip), %rax
	cmpl	$0, %r13d
	je	.L2214
	jle	.L2216
	leal	-1(%r13), %edx
	leaq	8(%rbx), %rax
	xorl	%edi, %edi
	movl	%edx, 8(%rsp)
	salq	$4, %rdx
	leaq	24(%rbx,%rdx), %rcx
	.p2align 4,,10
	.p2align 3
.L2217:
	movl	(%rax), %edx
	addq	$16, %rax
	cmpq	%rax, %rcx
	leal	1(%rdi,%rdx), %edi
	jne	.L2217
	leal	-1(%rdi), %eax
	xorl	%r14d, %r14d
	movl	%eax, 12(%rsp)
	call	v_malloc
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L2233:
	movl	8(%rbx), %r8d
	movq	(%rbx), %rdi
	testl	%r8d, %r8d
	jle	.L2219
	movslq	%edx, %r10
	leaq	16(%rax,%r10), %rcx
	leaq	(%rax,%r10), %rsi
	cmpq	%rcx, %rdi
	leaq	16(%rdi), %rcx
	setnb	%r9b
	cmpq	%rcx, %rsi
	setnb	%cl
	orb	%cl, %r9b
	je	.L2220
	cmpl	$22, %r8d
	jbe	.L2220
	movq	%rdi, %r9
	leal	-1(%r8), %r11d
	negq	%r9
	andl	$15, %r9d
	leal	15(%r9), %ecx
	cmpl	%ecx, %r11d
	jb	.L2238
	testl	%r9d, %r9d
	je	.L2239
	movzbl	(%rdi), %ecx
	cmpl	$1, %r9d
	movb	%cl, (%rsi)
	leal	1(%rdx), %esi
	je	.L2240
	movzbl	1(%rdi), %ecx
	movslq	%esi, %rsi
	cmpl	$2, %r9d
	movb	%cl, (%rax,%rsi)
	leal	2(%rdx), %esi
	je	.L2241
	movzbl	2(%rdi), %ecx
	movslq	%esi, %rsi
	cmpl	$3, %r9d
	movb	%cl, (%rax,%rsi)
	leal	3(%rdx), %esi
	je	.L2242
	movzbl	3(%rdi), %ecx
	movslq	%esi, %rsi
	cmpl	$4, %r9d
	movb	%cl, (%rax,%rsi)
	leal	4(%rdx), %esi
	je	.L2243
	movzbl	4(%rdi), %ecx
	movslq	%esi, %rsi
	cmpl	$5, %r9d
	movb	%cl, (%rax,%rsi)
	leal	5(%rdx), %esi
	je	.L2244
	movzbl	5(%rdi), %ecx
	movslq	%esi, %rsi
	cmpl	$6, %r9d
	movb	%cl, (%rax,%rsi)
	leal	6(%rdx), %esi
	je	.L2245
	movzbl	6(%rdi), %ecx
	movslq	%esi, %rsi
	cmpl	$7, %r9d
	movb	%cl, (%rax,%rsi)
	leal	7(%rdx), %esi
	je	.L2246
	movzbl	7(%rdi), %ecx
	movslq	%esi, %rsi
	cmpl	$8, %r9d
	movb	%cl, (%rax,%rsi)
	leal	8(%rdx), %esi
	je	.L2247
	movzbl	8(%rdi), %ecx
	movslq	%esi, %rsi
	cmpl	$9, %r9d
	movb	%cl, (%rax,%rsi)
	leal	9(%rdx), %esi
	je	.L2248
	movzbl	9(%rdi), %ecx
	movslq	%esi, %rsi
	cmpl	$10, %r9d
	movb	%cl, (%rax,%rsi)
	leal	10(%rdx), %esi
	je	.L2249
	movzbl	10(%rdi), %ecx
	movslq	%esi, %rsi
	cmpl	$11, %r9d
	movb	%cl, (%rax,%rsi)
	leal	11(%rdx), %esi
	je	.L2250
	movzbl	11(%rdi), %ecx
	movslq	%esi, %rsi
	cmpl	$12, %r9d
	movb	%cl, (%rax,%rsi)
	leal	12(%rdx), %esi
	je	.L2251
	movzbl	12(%rdi), %ecx
	movslq	%esi, %rsi
	cmpl	$13, %r9d
	movb	%cl, (%rax,%rsi)
	leal	13(%rdx), %esi
	je	.L2252
	movzbl	13(%rdi), %ecx
	movslq	%esi, %rsi
	cmpl	$15, %r9d
	movb	%cl, (%rax,%rsi)
	leal	14(%rdx), %esi
	jne	.L2253
	movzbl	14(%rdi), %ecx
	movslq	%esi, %rsi
	movb	%cl, (%rax,%rsi)
	leal	15(%rdx), %esi
	movl	$15, %ecx
	jmp	.L2222
	.p2align 4,,10
	.p2align 3
.L2240:
	movl	$1, %ecx
	.p2align 4,,10
	.p2align 3
.L2222:
	movl	%r8d, %ebp
	movl	%r9d, %r11d
	subl	%r9d, %ebp
	leaq	(%rdi,%r11), %r12
	addq	%r10, %r11
	movl	%ebp, %r15d
	addq	%rax, %r11
	xorl	%r9d, %r9d
	shrl	$4, %r15d
	xorl	%r10d, %r10d
	.p2align 4,,10
	.p2align 3
.L2224:
	movdqa	(%r12,%r9), %xmm0
	addl	$1, %r10d
	movups	%xmm0, (%r11,%r9)
	addq	$16, %r9
	cmpl	%r10d, %r15d
	ja	.L2224
	movl	%ebp, %r9d
	andl	$-16, %r9d
	addl	%r9d, %ecx
	addl	%r9d, %esi
	cmpl	%r9d, %ebp
	je	.L2229
.L2221:
	movslq	%ecx, %rcx
	movslq	%esi, %rsi
	subq	%rcx, %rsi
	addq	%rax, %rsi
	.p2align 4,,10
	.p2align 3
.L2227:
	movzbl	(%rdi,%rcx), %r9d
	movb	%r9b, (%rsi,%rcx)
	addq	$1, %rcx
	cmpl	%ecx, %r8d
	jg	.L2227
.L2229:
	addl	%r8d, %edx
.L2219:
	cmpl	8(%rsp), %r14d
	je	.L2272
	addl	$1, %r14d
	movslq	%edx, %rcx
	addq	$16, %rbx
	addl	$1, %edx
	cmpl	%r13d, %r14d
	movb	$32, (%rax,%rcx)
	jne	.L2233
.L2232:
	movslq	12(%rsp), %rdx
	movq	%rdx, %r13
.L2234:
	movb	$0, (%rax,%rdx)
.L2214:
	movq	88(%rsp), %rbx
	xorq	%fs:40, %rbx
	movl	%r13d, %edx
	jne	.L2273
	addq	$104, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L2220:
	.cfi_restore_state
	leal	-1(%r8), %r10d
	xorl	%ecx, %ecx
	addq	$1, %r10
	.p2align 4,,10
	.p2align 3
.L2228:
	movzbl	(%rdi,%rcx), %r9d
	movb	%r9b, (%rsi,%rcx)
	addq	$1, %rcx
	cmpq	%r10, %rcx
	jne	.L2228
	addl	%r8d, %edx
	jmp	.L2219
	.p2align 4,,10
	.p2align 3
.L2241:
	movl	$2, %ecx
	jmp	.L2222
	.p2align 4,,10
	.p2align 3
.L2238:
	movl	%edx, %esi
	xorl	%ecx, %ecx
	jmp	.L2221
.L2216:
	xorl	%edi, %edi
	call	v_malloc
	movq	$-1, %rdx
	movl	%edx, %r13d
	jmp	.L2234
	.p2align 4,,10
	.p2align 3
.L2242:
	movl	$3, %ecx
	jmp	.L2222
	.p2align 4,,10
	.p2align 3
.L2243:
	movl	$4, %ecx
	jmp	.L2222
	.p2align 4,,10
	.p2align 3
.L2236:
	xorl	%r13d, %r13d
	leaq	.LC37(%rip), %rax
	jmp	.L2214
	.p2align 4,,10
	.p2align 3
.L2244:
	movl	$5, %ecx
	jmp	.L2222
.L2245:
	movl	$6, %ecx
	jmp	.L2222
.L2239:
	movl	%edx, %esi
	xorl	%ecx, %ecx
	jmp	.L2222
.L2246:
	movl	$7, %ecx
	jmp	.L2222
.L2247:
	movl	$8, %ecx
	jmp	.L2222
.L2248:
	movl	$9, %ecx
	jmp	.L2222
.L2272:
	addl	$1, %r14d
	addq	$16, %rbx
	cmpl	%r14d, %r13d
	jne	.L2233
	jmp	.L2232
.L2249:
	movl	$10, %ecx
	jmp	.L2222
.L2250:
	movl	$11, %ecx
	jmp	.L2222
.L2253:
	movl	$14, %ecx
	jmp	.L2222
.L2251:
	movl	$12, %ecx
	jmp	.L2222
.L2252:
	movl	$13, %ecx
	jmp	.L2222
.L2273:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE302:
	.size	string_title, .-string_title
	.section	.text.array_string_join,"ax",@progbits
	.p2align 4,,15
	.globl	array_string_join
	.type	array_string_join, @function
array_string_join:
.LFB345:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	xorl	%edx, %edx
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	leaq	.LC37(%rip), %rax
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	movl	136(%rsp), %ecx
	cmpl	$0, %ecx
	movl	%ecx, 20(%rsp)
	je	.L2357
	movq	%rdi, %rbx
	movl	%esi, %ebp
	jle	.L2358
	movq	128(%rsp), %rdx
	movq	%rdx, %r13
	leaq	8(%rdx), %rax
	leal	-1(%rcx), %edx
	movl	%edx, 32(%rsp)
	salq	$4, %rdx
	leaq	24(%r13,%rdx), %rdi
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L2279:
	movl	(%rax), %ecx
	addq	$16, %rax
	addl	%ebp, %ecx
	addl	%ecx, %edx
	cmpq	%rax, %rdi
	jne	.L2279
	subl	%esi, %edx
	leal	1(%rdx), %edi
	movl	%edx, 52(%rsp)
	call	v_malloc
	leal	-1(%rbp), %edx
	movl	$0, 12(%rsp)
	xorl	%r9d, %r9d
	leaq	1(%rdx), %rdi
	movl	%edx, 36(%rsp)
	movq	%rbx, %rdx
	negq	%rdx
	movl	%edx, %r15d
	movq	%rdi, 56(%rsp)
	movl	%ebp, %edi
	andl	$15, %r15d
	subl	%r15d, %edi
	movl	%r15d, %esi
	movl	%edi, 16(%rsp)
	andl	$-16, %edi
	leaq	(%rbx,%rsi), %r14
	movl	%edi, 48(%rsp)
	movl	%r15d, %edi
	movq	%rsi, 40(%rsp)
	movq	%r13, %r15
	movl	%edi, %r13d
	.p2align 4,,10
	.p2align 3
.L2303:
	movl	8(%r15), %r10d
	movq	(%r15), %rdi
	testl	%r10d, %r10d
	jle	.L2281
	movslq	%r9d, %r11
	leaq	16(%rax,%r11), %rcx
	leaq	(%rax,%r11), %rdx
	cmpq	%rcx, %rdi
	leaq	16(%rdi), %rcx
	setnb	%sil
	cmpq	%rcx, %rdx
	setnb	%cl
	orb	%cl, %sil
	je	.L2282
	cmpl	$22, %r10d
	jbe	.L2282
	movq	%rdi, %r8
	leal	-1(%r10), %esi
	negq	%r8
	andl	$15, %r8d
	leal	15(%r8), %ecx
	cmpl	%ecx, %esi
	jb	.L2305
	testl	%r8d, %r8d
	je	.L2306
	movzbl	(%rdi), %ecx
	cmpl	$1, %r8d
	movb	%cl, (%rdx)
	leal	1(%r9), %ecx
	je	.L2307
	movzbl	1(%rdi), %edx
	movslq	%ecx, %rcx
	cmpl	$2, %r8d
	movb	%dl, (%rax,%rcx)
	leal	2(%r9), %ecx
	je	.L2308
	movzbl	2(%rdi), %edx
	movslq	%ecx, %rcx
	cmpl	$3, %r8d
	movb	%dl, (%rax,%rcx)
	leal	3(%r9), %ecx
	je	.L2309
	movzbl	3(%rdi), %edx
	movslq	%ecx, %rcx
	cmpl	$4, %r8d
	movb	%dl, (%rax,%rcx)
	leal	4(%r9), %ecx
	je	.L2310
	movzbl	4(%rdi), %edx
	movslq	%ecx, %rcx
	cmpl	$5, %r8d
	movb	%dl, (%rax,%rcx)
	leal	5(%r9), %ecx
	je	.L2311
	movzbl	5(%rdi), %edx
	movslq	%ecx, %rcx
	cmpl	$6, %r8d
	movb	%dl, (%rax,%rcx)
	leal	6(%r9), %ecx
	je	.L2312
	movzbl	6(%rdi), %edx
	movslq	%ecx, %rcx
	cmpl	$7, %r8d
	movb	%dl, (%rax,%rcx)
	leal	7(%r9), %ecx
	je	.L2313
	movzbl	7(%rdi), %edx
	movslq	%ecx, %rcx
	cmpl	$8, %r8d
	movb	%dl, (%rax,%rcx)
	leal	8(%r9), %ecx
	je	.L2314
	movzbl	8(%rdi), %edx
	movslq	%ecx, %rcx
	cmpl	$9, %r8d
	movb	%dl, (%rax,%rcx)
	leal	9(%r9), %ecx
	je	.L2315
	movzbl	9(%rdi), %edx
	movslq	%ecx, %rcx
	cmpl	$10, %r8d
	movb	%dl, (%rax,%rcx)
	leal	10(%r9), %ecx
	je	.L2316
	movzbl	10(%rdi), %edx
	movslq	%ecx, %rcx
	cmpl	$11, %r8d
	movb	%dl, (%rax,%rcx)
	leal	11(%r9), %ecx
	je	.L2317
	movzbl	11(%rdi), %edx
	movslq	%ecx, %rcx
	cmpl	$12, %r8d
	movb	%dl, (%rax,%rcx)
	leal	12(%r9), %ecx
	je	.L2318
	movzbl	12(%rdi), %edx
	movslq	%ecx, %rcx
	cmpl	$13, %r8d
	movb	%dl, (%rax,%rcx)
	leal	13(%r9), %ecx
	je	.L2319
	movzbl	13(%rdi), %edx
	movslq	%ecx, %rcx
	cmpl	$15, %r8d
	movb	%dl, (%rax,%rcx)
	leal	14(%r9), %ecx
	jne	.L2320
	movzbl	14(%rdi), %edx
	movslq	%ecx, %rcx
	movl	$15, 28(%rsp)
	movb	%dl, (%rax,%rcx)
	leal	15(%r9), %ecx
	jmp	.L2284
.L2358:
	movl	%esi, %eax
	movl	$1, %edi
	negl	%eax
	subl	%esi, %edi
	movl	%eax, 52(%rsp)
	call	v_malloc
	movslq	52(%rsp), %rdx
	movb	$0, (%rax,%rdx)
	movl	%edx, %edx
.L2357:
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L2307:
	.cfi_restore_state
	movl	$1, 28(%rsp)
	.p2align 4,,10
	.p2align 3
.L2284:
	movl	%r8d, %esi
	movl	%r10d, %edx
	subl	%r8d, %edx
	addq	%rsi, %r11
	leaq	(%rdi,%rsi), %r12
	movl	%edx, 24(%rsp)
	addq	%rax, %r11
	shrl	$4, %edx
	xorl	%esi, %esi
	xorl	%r8d, %r8d
	.p2align 4,,10
	.p2align 3
.L2286:
	movdqa	(%r12,%rsi), %xmm0
	addl	$1, %r8d
	movups	%xmm0, (%r11,%rsi)
	addq	$16, %rsi
	cmpl	%r8d, %edx
	ja	.L2286
	movl	24(%rsp), %r11d
	movl	28(%rsp), %edx
	movl	%r11d, %esi
	andl	$-16, %esi
	addl	%esi, %ecx
	addl	%esi, %edx
	cmpl	%esi, %r11d
	je	.L2291
.L2283:
	movslq	%edx, %rdx
	movslq	%ecx, %rcx
	subq	%rdx, %rcx
	addq	%rax, %rcx
	.p2align 4,,10
	.p2align 3
.L2289:
	movzbl	(%rdi,%rdx), %esi
	movb	%sil, (%rcx,%rdx)
	addq	$1, %rdx
	cmpl	%edx, %r10d
	jg	.L2289
.L2291:
	addl	%r10d, %r9d
.L2281:
	movl	32(%rsp), %esi
	cmpl	%esi, 12(%rsp)
	je	.L2292
	testl	%ebp, %ebp
	jle	.L2292
	movslq	%r9d, %r8
	leaq	16(%rax,%r8), %rcx
	leaq	(%rax,%r8), %rdx
	cmpq	%rcx, %rbx
	leaq	16(%rbx), %rcx
	setnb	%sil
	cmpq	%rcx, %rdx
	setnb	%cl
	orb	%cl, %sil
	je	.L2293
	cmpl	$22, %ebp
	jbe	.L2293
	leal	15(%r13), %ecx
	cmpl	%ecx, 36(%rsp)
	jb	.L2321
	testl	%r13d, %r13d
	je	.L2322
	movzbl	(%rbx), %ecx
	cmpl	$1, %r13d
	movb	%cl, (%rdx)
	leal	1(%r9), %ecx
	je	.L2323
	movzbl	1(%rbx), %edx
	movslq	%ecx, %rcx
	cmpl	$2, %r13d
	movb	%dl, (%rax,%rcx)
	leal	2(%r9), %ecx
	je	.L2324
	movzbl	2(%rbx), %edx
	movslq	%ecx, %rcx
	cmpl	$3, %r13d
	movb	%dl, (%rax,%rcx)
	leal	3(%r9), %ecx
	je	.L2325
	movzbl	3(%rbx), %edx
	movslq	%ecx, %rcx
	cmpl	$4, %r13d
	movb	%dl, (%rax,%rcx)
	leal	4(%r9), %ecx
	je	.L2326
	movzbl	4(%rbx), %edx
	movslq	%ecx, %rcx
	cmpl	$5, %r13d
	movb	%dl, (%rax,%rcx)
	leal	5(%r9), %ecx
	je	.L2327
	movzbl	5(%rbx), %edx
	movslq	%ecx, %rcx
	cmpl	$6, %r13d
	movb	%dl, (%rax,%rcx)
	leal	6(%r9), %ecx
	je	.L2328
	movzbl	6(%rbx), %edx
	movslq	%ecx, %rcx
	cmpl	$7, %r13d
	movb	%dl, (%rax,%rcx)
	leal	7(%r9), %ecx
	je	.L2329
	movzbl	7(%rbx), %edx
	movslq	%ecx, %rcx
	cmpl	$8, %r13d
	movb	%dl, (%rax,%rcx)
	leal	8(%r9), %ecx
	je	.L2330
	movzbl	8(%rbx), %edx
	movslq	%ecx, %rcx
	cmpl	$9, %r13d
	movb	%dl, (%rax,%rcx)
	leal	9(%r9), %ecx
	je	.L2331
	movzbl	9(%rbx), %edx
	movslq	%ecx, %rcx
	cmpl	$10, %r13d
	movb	%dl, (%rax,%rcx)
	leal	10(%r9), %ecx
	je	.L2332
	movzbl	10(%rbx), %edx
	movslq	%ecx, %rcx
	cmpl	$11, %r13d
	movb	%dl, (%rax,%rcx)
	leal	11(%r9), %ecx
	je	.L2333
	movzbl	11(%rbx), %edx
	movslq	%ecx, %rcx
	cmpl	$12, %r13d
	movb	%dl, (%rax,%rcx)
	leal	12(%r9), %ecx
	je	.L2334
	movzbl	12(%rbx), %edx
	movslq	%ecx, %rcx
	cmpl	$13, %r13d
	movb	%dl, (%rax,%rcx)
	leal	13(%r9), %ecx
	je	.L2335
	movzbl	13(%rbx), %edx
	movslq	%ecx, %rcx
	cmpl	$15, %r13d
	movb	%dl, (%rax,%rcx)
	leal	14(%r9), %ecx
	jne	.L2336
	movzbl	14(%rbx), %edx
	movslq	%ecx, %rcx
	movb	%dl, (%rax,%rcx)
	leal	15(%r9), %ecx
	movl	$15, %edx
	jmp	.L2295
	.p2align 4,,10
	.p2align 3
.L2323:
	movl	$1, %edx
	.p2align 4,,10
	.p2align 3
.L2295:
	addq	40(%rsp), %r8
	movl	16(%rsp), %r10d
	xorl	%esi, %esi
	xorl	%edi, %edi
	shrl	$4, %r10d
	addq	%rax, %r8
	.p2align 4,,10
	.p2align 3
.L2297:
	movdqa	(%r14,%rsi), %xmm0
	addl	$1, %edi
	movups	%xmm0, (%r8,%rsi)
	addq	$16, %rsi
	cmpl	%edi, %r10d
	ja	.L2297
	movl	48(%rsp), %edi
	addl	%edi, %ecx
	addl	%edi, %edx
	cmpl	%edi, 16(%rsp)
	je	.L2302
.L2294:
	movslq	%edx, %rdx
	movslq	%ecx, %rcx
	subq	%rdx, %rcx
	addq	%rax, %rcx
	.p2align 4,,10
	.p2align 3
.L2300:
	movzbl	(%rbx,%rdx), %esi
	movb	%sil, (%rcx,%rdx)
	addq	$1, %rdx
	cmpl	%edx, %ebp
	jg	.L2300
.L2302:
	addl	%ebp, %r9d
.L2292:
	addl	$1, 12(%rsp)
	addq	$16, %r15
	movl	12(%rsp), %edi
	cmpl	%edi, 20(%rsp)
	jne	.L2303
	movslq	52(%rsp), %rdx
	movb	$0, (%rax,%rdx)
	movl	%edx, %edx
	jmp	.L2357
	.p2align 4,,10
	.p2align 3
.L2282:
	leal	-1(%r10), %esi
	xorl	%ecx, %ecx
	addq	$1, %rsi
	.p2align 4,,10
	.p2align 3
.L2290:
	movzbl	(%rdi,%rcx), %r8d
	movb	%r8b, (%rdx,%rcx)
	addq	$1, %rcx
	cmpq	%rcx, %rsi
	jne	.L2290
	addl	%r10d, %r9d
	jmp	.L2281
	.p2align 4,,10
	.p2align 3
.L2293:
	movq	56(%rsp), %rdi
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L2301:
	movzbl	(%rbx,%rcx), %esi
	movb	%sil, (%rdx,%rcx)
	addq	$1, %rcx
	cmpq	%rdi, %rcx
	jne	.L2301
	addl	%ebp, %r9d
	jmp	.L2292
	.p2align 4,,10
	.p2align 3
.L2308:
	movl	$2, 28(%rsp)
	jmp	.L2284
	.p2align 4,,10
	.p2align 3
.L2324:
	movl	$2, %edx
	jmp	.L2295
	.p2align 4,,10
	.p2align 3
.L2305:
	movl	%r9d, %ecx
	xorl	%edx, %edx
	jmp	.L2283
	.p2align 4,,10
	.p2align 3
.L2321:
	movl	%r9d, %ecx
	xorl	%edx, %edx
	jmp	.L2294
	.p2align 4,,10
	.p2align 3
.L2309:
	movl	$3, 28(%rsp)
	jmp	.L2284
	.p2align 4,,10
	.p2align 3
.L2325:
	movl	$3, %edx
	jmp	.L2295
	.p2align 4,,10
	.p2align 3
.L2310:
	movl	$4, 28(%rsp)
	jmp	.L2284
	.p2align 4,,10
	.p2align 3
.L2326:
	movl	$4, %edx
	jmp	.L2295
	.p2align 4,,10
	.p2align 3
.L2311:
	movl	$5, 28(%rsp)
	jmp	.L2284
	.p2align 4,,10
	.p2align 3
.L2327:
	movl	$5, %edx
	jmp	.L2295
.L2312:
	movl	$6, 28(%rsp)
	jmp	.L2284
.L2306:
	movl	%r9d, %ecx
	movl	$0, 28(%rsp)
	jmp	.L2284
.L2328:
	movl	$6, %edx
	jmp	.L2295
.L2322:
	movl	%r9d, %ecx
	xorl	%edx, %edx
	jmp	.L2295
.L2313:
	movl	$7, 28(%rsp)
	jmp	.L2284
.L2329:
	movl	$7, %edx
	jmp	.L2295
.L2314:
	movl	$8, 28(%rsp)
	jmp	.L2284
.L2330:
	movl	$8, %edx
	jmp	.L2295
.L2331:
	movl	$9, %edx
	jmp	.L2295
.L2315:
	movl	$9, 28(%rsp)
	jmp	.L2284
.L2332:
	movl	$10, %edx
	jmp	.L2295
.L2316:
	movl	$10, 28(%rsp)
	jmp	.L2284
.L2317:
	movl	$11, 28(%rsp)
	jmp	.L2284
.L2333:
	movl	$11, %edx
	jmp	.L2295
.L2320:
	movl	$14, 28(%rsp)
	jmp	.L2284
.L2336:
	movl	$14, %edx
	jmp	.L2295
.L2318:
	movl	$12, 28(%rsp)
	jmp	.L2284
.L2334:
	movl	$12, %edx
	jmp	.L2295
.L2335:
	movl	$13, %edx
	jmp	.L2295
.L2319:
	movl	$13, 28(%rsp)
	jmp	.L2284
	.cfi_endproc
.LFE345:
	.size	array_string_join, .-array_string_join
	.section	.text.string_index_kmp,"ax",@progbits
	.p2align 4,,15
	.globl	string_index_kmp
	.type	string_index_kmp, @function
string_index_kmp:
.LFB289:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$136, %rsp
	.cfi_def_cfa_offset 192
	movq	%fs:40, %rax
	movq	%rax, 120(%rsp)
	xorl	%eax, %eax
	cmpl	%ecx, %esi
	movq	%rdi, 40(%rsp)
	movq	%rsi, 24(%rsp)
	movl	%ecx, 36(%rsp)
	jl	.L2365
	leaq	80(%rsp), %rdi
	leaq	112(%rsp), %r8
	movq	%rcx, %rbx
	movl	$1, %esi
	movl	$4, %ecx
	movq	%rdx, %rbp
	movl	$1, %edx
	movl	$0, 112(%rsp)
	call	new_array_from_c_array
	leaq	48(%rsp), %rdi
	subq	$8, %rsp
	.cfi_def_cfa_offset 200
	movl	%ebx, %esi
	pushq	104(%rsp)
	.cfi_def_cfa_offset 208
	pushq	104(%rsp)
	.cfi_def_cfa_offset 216
	pushq	104(%rsp)
	.cfi_def_cfa_offset 224
	call	array_repeat
	movq	80(%rsp), %r14
	movl	88(%rsp), %r15d
	movl	96(%rsp), %r13d
	addq	$32, %rsp
	.cfi_def_cfa_offset 192
	cmpl	$1, %ebx
	jle	.L2366
	movslq	%r13d, %rax
	movl	$1, %r12d
	leaq	(%r14,%rax), %r11
	movq	%rax, (%rsp)
	leal	-2(%rbx), %eax
	xorl	%ebx, %ebx
	addq	$2, %rax
	movq	%rax, 8(%rsp)
	leaq	116(%rsp), %rax
	movq	%rax, 16(%rsp)
	movl	%r13d, %eax
	movq	%r14, %r13
	movl	%eax, %r14d
	.p2align 4,,10
	.p2align 3
.L2367:
	movzbl	0(%rbp,%r12), %edx
	movslq	%ebx, %rsi
	movl	%r12d, %eax
	cmpb	0(%rbp,%rsi), %dl
	jne	.L2394
	jmp	.L2369
	.p2align 4,,10
	.p2align 3
.L2397:
	subl	$1, %ebx
	cmpl	%r15d, %ebx
	jge	.L2396
	imull	%r14d, %ebx
	movslq	%ebx, %rbx
	movslq	0(%r13,%rbx), %rcx
	cmpb	%dl, 0(%rbp,%rcx)
	movq	%rcx, %rbx
	je	.L2369
.L2394:
	testl	%ebx, %ebx
	jg	.L2397
	movl	%ebx, 116(%rsp)
.L2382:
	cmpl	%r15d, %eax
	jge	.L2398
	movq	(%rsp), %rdx
	movq	16(%rsp), %rsi
	movq	%r11, %rdi
	addq	$1, %r12
	call	memcpy@PLT
	movq	%rax, %r11
	addq	(%rsp), %r11
	cmpq	%r12, 8(%rsp)
	jne	.L2367
	movl	%r14d, %eax
	movq	%r13, %r14
	movl	%eax, %r13d
.L2366:
	movq	24(%rsp), %rax
	testl	%eax, %eax
	jle	.L2365
	leal	-1(%rax), %r11d
	movl	36(%rsp), %r8d
	movq	40(%rsp), %rcx
	xorl	%edi, %edi
	xorl	%esi, %esi
	addq	$1, %r11
	.p2align 4,,10
	.p2align 3
.L2374:
	movzbl	(%rcx,%rdi), %edx
	movslq	%esi, %rax
	movl	%edi, %r10d
	cmpb	0(%rbp,%rax), %dl
	jne	.L2392
	jmp	.L2376
	.p2align 4,,10
	.p2align 3
.L2377:
	subl	$1, %esi
	cmpl	%r15d, %esi
	jge	.L2399
	imull	%r13d, %esi
	movslq	%esi, %rsi
	movslq	(%r14,%rsi), %rax
	cmpb	%dl, 0(%rbp,%rax)
	movq	%rax, %rsi
	je	.L2376
.L2392:
	testl	%esi, %esi
	jg	.L2377
	cmpl	%r8d, %esi
	je	.L2400
.L2378:
	addq	$1, %rdi
	cmpq	%rdi, %r11
	jne	.L2374
.L2365:
	movl	$-1, %eax
.L2364:
	movq	120(%rsp), %rdi
	xorq	%fs:40, %rdi
	jne	.L2401
	addq	$136, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L2376:
	.cfi_restore_state
	addl	$1, %esi
	cmpl	%r8d, %esi
	jne	.L2378
.L2400:
	subl	%esi, %r10d
	leal	1(%r10), %eax
	jmp	.L2364
	.p2align 4,,10
	.p2align 3
.L2369:
	addl	$1, %ebx
	movl	%ebx, 116(%rsp)
	jmp	.L2382
.L2399:
	leaq	.LC68(%rip), %rdi
	movl	%r15d, %edx
.L2395:
	xorl	%eax, %eax
	call	_STR
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	v_panic
.L2396:
	movl	%r15d, %edx
	movl	%ebx, %esi
	leaq	.LC68(%rip), %rdi
	jmp	.L2395
.L2398:
	movl	%r15d, %edx
	movl	%eax, %esi
	leaq	.LC72(%rip), %rdi
	jmp	.L2395
.L2401:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE289:
	.size	string_index_kmp, .-string_index_kmp
	.section	.rodata.str1.1
.LC89:
	.string	", "
	.section	.text.array_bool_str,"ax",@progbits
	.p2align 4,,15
	.globl	array_bool_str
	.type	array_bool_str, @function
array_bool_str:
.LFB112:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$64, %rsp
	.cfi_def_cfa_offset 112
	movl	120(%rsp), %ebp
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	leal	0(%rbp,%rbp,2), %ebx
	cmpl	$0, %ebx
	je	.L2416
	jle	.L2404
	movslq	%ebx, %rdi
	movl	%ebx, %r12d
	jmp	.L2403
	.p2align 4,,10
	.p2align 3
.L2416:
	movl	$1, %edi
	movl	$1, %r12d
.L2403:
	movl	$1, %esi
	call	calloc@PLT
	movl	%r12d, 28(%rsp)
	leaq	16(%rsp), %r12
	leaq	.LC41(%rip), %rsi
	movl	$1, %edx
	movq	%rax, 16(%rsp)
	movl	$0, 24(%rsp)
	movq	%r12, %rdi
	movl	$1, 32(%rsp)
	movl	$0, 40(%rsp)
	movl	%ebx, 44(%rsp)
	call	array_push_many
	addl	$1, 40(%rsp)
	testl	%ebp, %ebp
	jle	.L2405
	leal	-1(%rbp), %r13d
	xorl	%ebx, %ebx
	testl	%r13d, %r13d
	jle	.L2407
	leaq	.LC35(%rip), %r14
	.p2align 4,,10
	.p2align 3
.L2406:
	movl	%ebp, 120(%rsp)
	subq	$8, %rsp
	.cfi_def_cfa_offset 120
	movl	%ebx, %edi
	pushq	136(%rsp)
	.cfi_def_cfa_offset 128
	pushq	136(%rsp)
	.cfi_def_cfa_offset 136
	pushq	136(%rsp)
	.cfi_def_cfa_offset 144
	call	array_get
	movl	(%rax), %edx
	addq	$32, %rsp
	.cfi_def_cfa_offset 112
	testl	%edx, %edx
	je	.L2408
	leaq	.LC34(%rip), %rsi
	movl	$4, %edx
	movq	%r12, %rdi
	addl	$1, %ebx
	call	array_push_many
	leaq	.LC89(%rip), %rsi
	movl	$2, %edx
	movq	%r12, %rdi
	addl	$4, 40(%rsp)
	call	array_push_many
	addl	$2, 40(%rsp)
	cmpl	%ebx, %r13d
	jg	.L2406
.L2410:
	cmpl	%ebx, %ebp
	jle	.L2405
.L2407:
	leaq	.LC35(%rip), %r13
	jmp	.L2413
	.p2align 4,,10
	.p2align 3
.L2420:
	leaq	.LC34(%rip), %rsi
	movl	$4, %edx
	movq	%r12, %rdi
	addl	$1, %ebx
	call	array_push_many
	addl	$4, 40(%rsp)
	cmpl	%ebx, %ebp
	jle	.L2405
.L2413:
	movl	%ebp, 120(%rsp)
	subq	$8, %rsp
	.cfi_def_cfa_offset 120
	movl	%ebx, %edi
	pushq	136(%rsp)
	.cfi_def_cfa_offset 128
	pushq	136(%rsp)
	.cfi_def_cfa_offset 136
	pushq	136(%rsp)
	.cfi_def_cfa_offset 144
	call	array_get
	movl	(%rax), %eax
	addq	$32, %rsp
	.cfi_def_cfa_offset 112
	testl	%eax, %eax
	jne	.L2420
	movl	$5, %edx
	movq	%r13, %rsi
	movq	%r12, %rdi
	addl	$1, %ebx
	call	array_push_many
	addl	$5, 40(%rsp)
	cmpl	%ebx, %ebp
	jg	.L2413
.L2405:
	leaq	.LC40(%rip), %rsi
	movl	$1, %edx
	movq	%r12, %rdi
	call	array_push_many
	leaq	15(%rsp), %rsi
	movq	%r12, %rdi
	addl	$1, 40(%rsp)
	movb	$0, 15(%rsp)
	call	array_push
	movq	16(%rsp), %rax
	movl	40(%rsp), %edx
	testq	%rax, %rax
	je	.L2421
	movq	56(%rsp), %rcx
	xorq	%fs:40, %rcx
	jne	.L2422
	addq	$64, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L2408:
	.cfi_restore_state
	movl	$5, %edx
	movq	%r14, %rsi
	movq	%r12, %rdi
	call	array_push_many
	leaq	.LC89(%rip), %rsi
	movl	$2, %edx
	movq	%r12, %rdi
	addl	$1, %ebx
	addl	$5, 40(%rsp)
	call	array_push_many
	addl	$2, 40(%rsp)
	cmpl	%r13d, %ebx
	jl	.L2406
	jmp	.L2410
.L2404:
	call	vcalloc.part.5
.L2422:
	call	__stack_chk_fail@PLT
.L2421:
	call	tos.part.7
	.cfi_endproc
.LFE112:
	.size	array_bool_str, .-array_bool_str
	.section	.rodata.str1.1
.LC90:
	.string	"\""
	.section	.text.array_string_str,"ax",@progbits
	.p2align 4,,15
	.globl	array_string_str
	.type	array_string_str, @function
array_string_str:
.LFB110:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$88, %rsp
	.cfi_def_cfa_offset 144
	movl	152(%rsp), %r14d
	movq	%fs:40, %rax
	movq	%rax, 72(%rsp)
	xorl	%eax, %eax
	leal	(%r14,%r14,2), %ebp
	cmpl	$0, %ebp
	je	.L2437
	jle	.L2425
	movslq	%ebp, %rdi
	movl	%ebp, %r12d
	jmp	.L2424
	.p2align 4,,10
	.p2align 3
.L2437:
	movl	$1, %edi
	movl	$1, %r12d
.L2424:
	movl	$1, %esi
	call	calloc@PLT
	movl	%r12d, 44(%rsp)
	leaq	32(%rsp), %r12
	leaq	.LC41(%rip), %rsi
	movl	$1, %edx
	movq	%rax, 32(%rsp)
	movl	$0, 40(%rsp)
	movq	%r12, %rdi
	movl	$1, 48(%rsp)
	movl	$0, 56(%rsp)
	movl	%ebp, 60(%rsp)
	call	array_push_many
	addl	$1, 56(%rsp)
	testl	%r14d, %r14d
	jle	.L2426
	leal	-1(%r14), %eax
	xorl	%ebp, %ebp
	testl	%eax, %eax
	movl	%eax, 12(%rsp)
	jle	.L2432
	.p2align 4,,10
	.p2align 3
.L2427:
	movl	%r14d, 152(%rsp)
	subq	$8, %rsp
	.cfi_def_cfa_offset 152
	movl	%ebp, %edi
	pushq	168(%rsp)
	.cfi_def_cfa_offset 160
	pushq	168(%rsp)
	.cfi_def_cfa_offset 168
	pushq	168(%rsp)
	.cfi_def_cfa_offset 176
	call	array_get
	movq	(%rax), %rcx
	movl	8(%rax), %r15d
	leaq	.LC90(%rip), %rsi
	movl	$1, %edx
	movq	%r12, %rdi
	movq	%rcx, 32(%rsp)
	addq	$32, %rsp
	.cfi_def_cfa_offset 144
	call	array_push_many
	movabsq	$-4294967296, %rsi
	movl	%r15d, %eax
	movq	(%rsp), %rdi
	andq	%rsi, %rbx
	andq	%rsi, %r13
	leaq	.LC37(%rip), %rdx
	orq	%rax, %rbx
	movq	%r13, %rcx
	addl	$1, 56(%rsp)
	movq	%rbx, %rsi
	call	string_eq
	testl	%eax, %eax
	je	.L2440
	leaq	.LC90(%rip), %rsi
	movl	$1, %edx
	movq	%r12, %rdi
	addl	$1, %ebp
	call	array_push_many
	leaq	.LC89(%rip), %rsi
	movl	$2, %edx
	movq	%r12, %rdi
	addl	$1, 56(%rsp)
	call	array_push_many
	addl	$2, 56(%rsp)
	cmpl	12(%rsp), %ebp
	jl	.L2427
	cmpl	%ebp, %r14d
	jle	.L2426
	.p2align 4,,10
	.p2align 3
.L2432:
	movl	%r14d, 152(%rsp)
	subq	$8, %rsp
	.cfi_def_cfa_offset 152
	movl	%ebp, %edi
	pushq	168(%rsp)
	.cfi_def_cfa_offset 160
	pushq	168(%rsp)
	.cfi_def_cfa_offset 168
	pushq	168(%rsp)
	.cfi_def_cfa_offset 176
	call	array_get
	movq	(%rax), %rcx
	movl	8(%rax), %r15d
	leaq	.LC90(%rip), %rsi
	movl	$1, %edx
	movq	%r12, %rdi
	movq	%rcx, 32(%rsp)
	addq	$32, %rsp
	.cfi_def_cfa_offset 144
	call	array_push_many
	movabsq	$-4294967296, %rdx
	movl	%r15d, %eax
	movq	(%rsp), %rdi
	andq	%rdx, %rbx
	andq	%rdx, %r13
	leaq	.LC37(%rip), %rdx
	orq	%rax, %rbx
	movq	%r13, %rcx
	addl	$1, 56(%rsp)
	movq	%rbx, %rsi
	call	string_eq
	testl	%eax, %eax
	jne	.L2433
	movq	(%rsp), %rsi
	movl	%r15d, %edx
	movq	%r12, %rdi
	call	array_push_many
	addl	%r15d, 56(%rsp)
.L2433:
	leaq	.LC90(%rip), %rsi
	movl	$1, %edx
	movq	%r12, %rdi
	addl	$1, %ebp
	call	array_push_many
	addl	$1, 56(%rsp)
	cmpl	%ebp, %r14d
	jg	.L2432
.L2426:
	leaq	.LC40(%rip), %rsi
	movl	$1, %edx
	movq	%r12, %rdi
	call	array_push_many
	leaq	31(%rsp), %rsi
	movq	%r12, %rdi
	addl	$1, 56(%rsp)
	movb	$0, 31(%rsp)
	call	array_push
	movq	32(%rsp), %rax
	movl	56(%rsp), %edx
	testq	%rax, %rax
	je	.L2441
	movq	72(%rsp), %rcx
	xorq	%fs:40, %rcx
	jne	.L2442
	addq	$88, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L2440:
	.cfi_restore_state
	movq	(%rsp), %rsi
	movl	%r15d, %edx
	movq	%r12, %rdi
	addl	$1, %ebp
	call	array_push_many
	leaq	.LC90(%rip), %rsi
	movl	$1, %edx
	movq	%r12, %rdi
	addl	%r15d, 56(%rsp)
	call	array_push_many
	leaq	.LC89(%rip), %rsi
	movl	$2, %edx
	movq	%r12, %rdi
	addl	$1, 56(%rsp)
	call	array_push_many
	addl	$2, 56(%rsp)
	cmpl	%ebp, 12(%rsp)
	jg	.L2427
	cmpl	%ebp, %r14d
	jg	.L2432
	jmp	.L2426
.L2425:
	call	vcalloc.part.5
.L2442:
	call	__stack_chk_fail@PLT
.L2441:
	call	tos.part.7
	.cfi_endproc
.LFE110:
	.size	array_string_str, .-array_string_str
	.section	.text.array_int_str,"ax",@progbits
	.p2align 4,,15
	.globl	array_int_str
	.type	array_int_str, @function
array_int_str:
.LFB111:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$104, %rsp
	.cfi_def_cfa_offset 160
	movl	168(%rsp), %ecx
	movq	%fs:40, %rax
	movq	%rax, 88(%rsp)
	xorl	%eax, %eax
	leal	(%rcx,%rcx,2), %eax
	movl	%ecx, 24(%rsp)
	leal	(%rcx,%rax,4), %ebx
	cmpl	$0, %ebx
	je	.L2469
	jle	.L2445
	movslq	%ebx, %rdi
	movl	%ebx, %r12d
	jmp	.L2444
	.p2align 4,,10
	.p2align 3
.L2469:
	movl	$1, %edi
	movl	$1, %r12d
.L2444:
	movl	$1, %esi
	call	calloc@PLT
	movq	%rax, 48(%rsp)
	leaq	48(%rsp), %rax
	leaq	.LC41(%rip), %rsi
	movl	$1, %edx
	movl	$0, 56(%rsp)
	movl	%r12d, 60(%rsp)
	movq	%rax, %rdi
	movq	%rax, 16(%rsp)
	movl	$1, 64(%rsp)
	movl	$0, 72(%rsp)
	movl	%ebx, 76(%rsp)
	call	array_push_many
	movl	24(%rsp), %eax
	addl	$1, 72(%rsp)
	testl	%eax, %eax
	jle	.L2446
	subl	$1, %eax
	xorl	%r12d, %r12d
	testl	%eax, %eax
	movl	%eax, 28(%rsp)
	jg	.L2447
	jmp	.L2448
	.p2align 4,,10
	.p2align 3
.L2449:
	movabsq	$-4294967296, %rcx
	movl	%r14d, %eax
	andq	%rcx, 8(%rsp)
	andq	%rcx, %rbp
	leaq	.LC37(%rip), %rdx
	movq	%r13, %rdi
	orq	%rax, %rbp
	movq	8(%rsp), %rax
	movq	%rbp, %rsi
	movq	%rax, %rcx
	call	string_eq
	testl	%eax, %eax
	jne	.L2454
	movq	16(%rsp), %rdi
	movl	%r14d, %edx
	movq	%r13, %rsi
	call	array_push_many
	addl	%r14d, 72(%rsp)
.L2454:
	subq	$8, %rsp
	.cfi_def_cfa_offset 168
	movl	%r12d, %edi
	pushq	184(%rsp)
	.cfi_def_cfa_offset 176
	pushq	184(%rsp)
	.cfi_def_cfa_offset 184
	pushq	184(%rsp)
	.cfi_def_cfa_offset 192
	call	array_get
	movl	(%rax), %ecx
	addq	$32, %rsp
	.cfi_def_cfa_offset 160
	testl	%ecx, %ecx
	jne	.L2487
.L2455:
	movq	16(%rsp), %rdi
	leaq	.LC89(%rip), %rsi
	movl	$2, %edx
	addl	$1, %r12d
	call	array_push_many
	addl	$2, 72(%rsp)
	cmpl	28(%rsp), %r12d
	jge	.L2488
.L2447:
	movl	24(%rsp), %eax
	subq	$8, %rsp
	.cfi_def_cfa_offset 168
	movl	%r12d, %edi
	movl	$1, %r14d
	leaq	.LC80(%rip), %r13
	movl	%eax, 176(%rsp)
	pushq	184(%rsp)
	.cfi_def_cfa_offset 176
	pushq	184(%rsp)
	.cfi_def_cfa_offset 184
	pushq	184(%rsp)
	.cfi_def_cfa_offset 192
	call	array_get
	movl	(%rax), %ebx
	addq	$32, %rsp
	.cfi_def_cfa_offset 160
	testl	%ebx, %ebx
	je	.L2449
	movl	$13, %edi
	call	v_malloc
	xorl	%r11d, %r11d
	testl	%ebx, %ebx
	movq	%rax, %r13
	jns	.L2450
	negl	%ebx
	movl	$1, %r11d
.L2450:
	movb	$0, 12(%r13)
	leaq	11(%r13), %r8
	movl	$11, %ecx
	leaq	_const_digit_pairs(%rip), %rdi
	movl	$1374389535, %r10d
	jmp	.L2451
	.p2align 4,,10
	.p2align 3
.L2473:
	movl	%r9d, %ecx
.L2451:
	movl	%ebx, %eax
	movq	%r8, %rsi
	movq	(%rdi), %r8
	mull	%r10d
	leal	-1(%rcx), %r14d
	leaq	-1(%rsi), %r15
	shrl	$5, %edx
	imull	$-100, %edx, %r9d
	addl	%ebx, %r9d
	addl	%r9d, %r9d
	testl	%edx, %edx
	leal	1(%r9), %eax
	movslq	%r9d, %r9
	movzbl	(%r8,%r9), %r8d
	leal	-2(%rcx), %r9d
	movb	%r8b, (%rsi)
	movq	(%rdi), %rbx
	movslq	%eax, %r8
	movzbl	(%rbx,%r8), %r8d
	movl	%edx, %ebx
	movb	%r8b, -1(%rsi)
	leaq	-2(%rsi), %r8
	jne	.L2473
	cmpl	$20, %eax
	cmovge	%r15, %rsi
	cmovge	%r14d, %ecx
	testl	%r11d, %r11d
	je	.L2453
	subl	$1, %ecx
	movslq	%ecx, %rsi
	addq	%r13, %rsi
	movb	$45, (%rsi)
.L2453:
	movl	$13, %edx
	movl	$12, %r14d
	movq	%r13, %rdi
	subl	%ecx, %edx
	subl	%ecx, %r14d
	movslq	%edx, %rdx
	call	memmove@PLT
	jmp	.L2449
	.p2align 4,,10
	.p2align 3
.L2487:
	movq	%r13, %rdi
	call	free@PLT
	jmp	.L2455
	.p2align 4,,10
	.p2align 3
.L2488:
	cmpl	%r12d, 24(%rsp)
	jg	.L2448
	.p2align 4,,10
	.p2align 3
.L2446:
	movq	16(%rsp), %rbx
	leaq	.LC40(%rip), %rsi
	movl	$1, %edx
	movq	%rbx, %rdi
	call	array_push_many
	leaq	47(%rsp), %rsi
	movq	%rbx, %rdi
	addl	$1, 72(%rsp)
	movb	$0, 47(%rsp)
	call	array_push
	movq	48(%rsp), %rax
	movl	72(%rsp), %edx
	testq	%rax, %rax
	je	.L2489
	movq	88(%rsp), %rdi
	xorq	%fs:40, %rdi
	jne	.L2490
	addq	$104, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L2448:
	.cfi_restore_state
	movq	8(%rsp), %r15
	jmp	.L2465
	.p2align 4,,10
	.p2align 3
.L2458:
	movabsq	$-4294967296, %rdi
	movl	%r14d, %eax
	leaq	.LC37(%rip), %rdx
	andq	%rdi, %rbp
	andq	%rdi, %r15
	movq	%r13, %rdi
	orq	%rax, %rbp
	movq	%r15, %rcx
	movq	%rbp, %rsi
	call	string_eq
	testl	%eax, %eax
	jne	.L2463
	movq	16(%rsp), %rdi
	movl	%r14d, %edx
	movq	%r13, %rsi
	call	array_push_many
	addl	%r14d, 72(%rsp)
.L2463:
	subq	$8, %rsp
	.cfi_def_cfa_offset 168
	movl	%r12d, %edi
	pushq	184(%rsp)
	.cfi_def_cfa_offset 176
	pushq	184(%rsp)
	.cfi_def_cfa_offset 184
	pushq	184(%rsp)
	.cfi_def_cfa_offset 192
	call	array_get
	movl	(%rax), %eax
	addq	$32, %rsp
	.cfi_def_cfa_offset 160
	testl	%eax, %eax
	jne	.L2491
.L2464:
	addl	$1, %r12d
	cmpl	%r12d, 24(%rsp)
	jle	.L2446
.L2465:
	movl	24(%rsp), %eax
	subq	$8, %rsp
	.cfi_def_cfa_offset 168
	movl	%r12d, %edi
	movl	$1, %r14d
	leaq	.LC80(%rip), %r13
	movl	%eax, 176(%rsp)
	pushq	184(%rsp)
	.cfi_def_cfa_offset 176
	pushq	184(%rsp)
	.cfi_def_cfa_offset 184
	pushq	184(%rsp)
	.cfi_def_cfa_offset 192
	call	array_get
	movl	(%rax), %ebx
	addq	$32, %rsp
	.cfi_def_cfa_offset 160
	testl	%ebx, %ebx
	je	.L2458
	movl	$13, %edi
	call	v_malloc
	testl	%ebx, %ebx
	movq	%rax, %r13
	movl	$0, 8(%rsp)
	jns	.L2459
	negl	%ebx
	movl	$1, 8(%rsp)
.L2459:
	movb	$0, 12(%r13)
	leaq	11(%r13), %r8
	movl	$11, %ecx
	leaq	_const_digit_pairs(%rip), %rdi
	movl	$1374389535, %r10d
	jmp	.L2460
	.p2align 4,,10
	.p2align 3
.L2476:
	movl	%r9d, %ecx
.L2460:
	movl	%ebx, %eax
	movq	%r8, %rsi
	movq	(%rdi), %r8
	mull	%r10d
	leal	-1(%rcx), %r11d
	leaq	-1(%rsi), %r14
	shrl	$5, %edx
	imull	$-100, %edx, %r9d
	addl	%ebx, %r9d
	addl	%r9d, %r9d
	testl	%edx, %edx
	leal	1(%r9), %eax
	movslq	%r9d, %r9
	movzbl	(%r8,%r9), %r8d
	leal	-2(%rcx), %r9d
	movb	%r8b, (%rsi)
	movq	(%rdi), %rbx
	movslq	%eax, %r8
	movzbl	(%rbx,%r8), %r8d
	movl	%edx, %ebx
	movb	%r8b, -1(%rsi)
	leaq	-2(%rsi), %r8
	jne	.L2476
	movl	8(%rsp), %edx
	cmpl	$20, %eax
	cmovge	%r14, %rsi
	cmovge	%r11d, %ecx
	testl	%edx, %edx
	je	.L2462
	subl	$1, %ecx
	movslq	%ecx, %rsi
	addq	%r13, %rsi
	movb	$45, (%rsi)
.L2462:
	movl	$13, %edx
	movl	$12, %r14d
	movq	%r13, %rdi
	subl	%ecx, %edx
	subl	%ecx, %r14d
	movslq	%edx, %rdx
	call	memmove@PLT
	jmp	.L2458
	.p2align 4,,10
	.p2align 3
.L2491:
	movq	%r13, %rdi
	call	free@PLT
	jmp	.L2464
.L2445:
	call	vcalloc.part.5
.L2490:
	call	__stack_chk_fail@PLT
.L2489:
	call	tos.part.7
	.cfi_endproc
.LFE111:
	.size	array_int_str, .-array_int_str
	.section	.text.mapnode_subkeys,"ax",@progbits
	.p2align 4,,15
	.globl	mapnode_subkeys
	.type	mapnode_subkeys, @function
mapnode_subkeys:
.LFB246:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdi, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rsi, %r13
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%edx, %ebx
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	movslq	272(%rdi), %rdx
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	movq	264(%rdi), %rax
	testq	%rax, %rax
	jne	.L2493
	testl	%edx, %edx
	jle	.L2494
	movdqu	(%rdi), %xmm0
	testl	%ebx, %ebx
	movl	%ebx, %r12d
	movl	8(%rsi), %edx
	movaps	%xmm0, 32(%rsp)
	js	.L2495
	cmpl	%edx, %ebx
	jge	.L2495
	movl	$1, %r15d
	leaq	32(%rsp), %rbp
	jmp	.L2496
	.p2align 4,,10
	.p2align 3
.L2501:
	movq	%r15, %rax
	movl	8(%r13), %edx
	salq	$4, %rax
	addl	$1, %r12d
	movdqu	(%r14,%rax), %xmm0
	movaps	%xmm0, 32(%rsp)
	js	.L2495
	addq	$1, %r15
	cmpl	%edx, %r12d
	jge	.L2495
.L2496:
	movslq	16(%r13), %rdx
	movq	%rbp, %rsi
	movl	%edx, %edi
	imull	%r12d, %edi
	movslq	%edi, %rdi
	addq	0(%r13), %rdi
	call	memcpy@PLT
	movl	272(%r14), %edx
	cmpl	%r15d, %edx
	jg	.L2501
.L2494:
	leal	(%rbx,%rdx), %eax
.L2500:
	subl	%ebx, %eax
	movq	56(%rsp), %rcx
	xorq	%fs:40, %rcx
	jne	.L2508
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L2493:
	.cfi_restore_state
	testl	%edx, %edx
	movl	%ebx, %ebp
	jle	.L2497
	leaq	16(%rsp), %rcx
	xorl	%r15d, %r15d
	xorl	%r12d, %r12d
	movq	%rcx, 8(%rsp)
.L2499:
	movq	(%rax,%r15), %rdi
	movl	%ebp, %edx
	movq	%r13, %rsi
	addl	$1, %r12d
	call	mapnode_subkeys
	movq	8(%rsp), %rdx
	addl	%eax, %ebp
	movq	%r13, %rdi
	movdqu	(%r14,%r15,2), %xmm0
	movl	%ebp, %esi
	addq	$8, %r15
	addl	$1, %ebp
	movaps	%xmm0, 16(%rsp)
	call	array_set
	movslq	272(%r14), %rdx
	movq	264(%r14), %rax
	cmpl	%r12d, %edx
	jg	.L2499
.L2497:
	movq	(%rax,%rdx,8), %rdi
	movq	%r13, %rsi
	movl	%ebp, %edx
	call	mapnode_subkeys
	addl	%ebp, %eax
	jmp	.L2500
.L2495:
	leaq	.LC72(%rip), %rdi
	movl	%r12d, %esi
	xorl	%eax, %eax
	call	_STR
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	v_panic
.L2508:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE246:
	.size	mapnode_subkeys, .-mapnode_subkeys
	.section	.text.SortedMap_keys,"ax",@progbits
	.p2align 4,,15
	.globl	SortedMap_keys
	.type	SortedMap_keys, @function
SortedMap_keys:
.LFB247:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movl	$16, %ecx
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rdi, %rbx
	movq	%rsi, %rbp
	movl	$1, %edx
	subq	$112, %rsp
	.cfi_def_cfa_offset 144
	movl	16(%rsi), %r12d
	movl	$1, %esi
	movq	%fs:40, %rax
	movq	%rax, 104(%rsp)
	xorl	%eax, %eax
	leaq	32(%rsp), %rdi
	leaq	.LC37(%rip), %rax
	leaq	64(%rsp), %r8
	movl	$0, 72(%rsp)
	movq	%rax, 64(%rsp)
	call	new_array_from_c_array
	movq	%rsp, %rdi
	subq	$8, %rsp
	.cfi_def_cfa_offset 152
	movl	%r12d, %esi
	pushq	56(%rsp)
	.cfi_def_cfa_offset 160
	pushq	56(%rsp)
	.cfi_def_cfa_offset 168
	pushq	56(%rsp)
	.cfi_def_cfa_offset 176
	call	array_repeat
	movq	8(%rbp), %rdi
	addq	$32, %rsp
	.cfi_def_cfa_offset 144
	movdqa	(%rsp), %xmm0
	testq	%rdi, %rdi
	je	.L2518
	movl	272(%rdi), %eax
	testl	%eax, %eax
	jne	.L2511
.L2518:
	movq	16(%rsp), %rax
	movq	104(%rsp), %rcx
	xorq	%fs:40, %rcx
	movups	%xmm0, (%rbx)
	movq	%rax, 16(%rbx)
	movq	%rbx, %rax
	jne	.L2519
	addq	$112, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L2511:
	.cfi_restore_state
	movq	16(%rsp), %rax
	leaq	80(%rsp), %rsi
	xorl	%edx, %edx
	movaps	%xmm0, 80(%rsp)
	movq	%rax, 96(%rsp)
	call	mapnode_subkeys
	movdqa	(%rsp), %xmm0
	jmp	.L2518
.L2519:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE247:
	.size	SortedMap_keys, .-SortedMap_keys
	.section	.text.array_byte_clone,"ax",@progbits
	.p2align 4,,15
	.globl	array_byte_clone
	.type	array_byte_clone, @function
array_byte_clone:
.LFB206:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	$1, %ecx
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	$1, %edx
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	$1, %esi
	subq	$104, %rsp
	.cfi_def_cfa_offset 160
	movq	%rdi, 8(%rsp)
	leaq	86(%rsp), %r8
	leaq	48(%rsp), %rdi
	movl	168(%rsp), %ebp
	movb	$0, 86(%rsp)
	movq	%fs:40, %rax
	movq	%rax, 88(%rsp)
	xorl	%eax, %eax
	call	new_array_from_c_array
	leaq	16(%rsp), %rdi
	subq	$8, %rsp
	.cfi_def_cfa_offset 168
	movl	%ebp, %esi
	pushq	72(%rsp)
	.cfi_def_cfa_offset 176
	pushq	72(%rsp)
	.cfi_def_cfa_offset 184
	pushq	72(%rsp)
	.cfi_def_cfa_offset 192
	call	array_repeat
	movl	56(%rsp), %r13d
	addq	$32, %rsp
	.cfi_def_cfa_offset 160
	testl	%ebp, %ebp
	jle	.L2526
	movq	160(%rsp), %r8
	testl	%r13d, %r13d
	movslq	176(%rsp), %r12
	movzbl	(%r8), %eax
	movb	%al, 87(%rsp)
	jle	.L2533
	leaq	87(%rsp), %rax
	movslq	32(%rsp), %rbx
	movq	16(%rsp), %r9
	leaq	(%r8,%r12), %r14
	xorl	%r15d, %r15d
	movq	%rax, (%rsp)
	jmp	.L2524
	.p2align 4,,10
	.p2align 3
.L2525:
	movzbl	(%r14), %eax
	addq	%rbx, %r9
	addq	%r12, %r14
	cmpl	%r15d, %r13d
	movb	%al, 87(%rsp)
	je	.L2522
.L2524:
	movq	(%rsp), %rsi
	movq	%r9, %rdi
	movq	%rbx, %rdx
	addl	$1, %r15d
	call	memcpy@PLT
	cmpl	%r15d, %ebp
	movq	%rax, %r9
	jne	.L2525
.L2526:
	movq	8(%rsp), %rcx
	movq	32(%rsp), %rax
	movdqa	16(%rsp), %xmm0
	movq	88(%rsp), %rdx
	xorq	%fs:40, %rdx
	movq	%rax, 16(%rcx)
	movq	%rcx, %rax
	movups	%xmm0, (%rcx)
	jne	.L2534
	addq	$104, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L2533:
	.cfi_restore_state
	xorl	%r15d, %r15d
.L2522:
	leaq	.LC72(%rip), %rdi
	movl	%r15d, %esi
	movl	%r13d, %edx
	xorl	%eax, %eax
	call	_STR
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	v_panic
.L2534:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE206:
	.size	array_byte_clone, .-array_byte_clone
	.section	.text.ustring_index_after,"ax",@progbits
	.p2align 4,,15
	.globl	ustring_index_after
	.type	ustring_index_after, @function
ustring_index_after:
.LFB327:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$104, %rsp
	.cfi_def_cfa_offset 160
	movl	200(%rsp), %esi
	movl	248(%rsp), %eax
	cmpl	%esi, %eax
	movl	%esi, 24(%rsp)
	movl	%eax, 16(%rsp)
	jg	.L2536
	testl	%edi, %edi
	movl	$0, %eax
	cmovns	%edi, %eax
	cmpl	%edi, %esi
	movl	%eax, 84(%rsp)
	jl	.L2536
	cmpl	%eax, %esi
	jle	.L2536
.L2570:
	movl	16(%rsp), %eax
	testl	%eax, %eax
	jle	.L2571
	movl	232(%rsp), %edi
	movl	216(%rsp), %esi
	movl	240(%rsp), %ebx
	movl	84(%rsp), %ebp
	movl	$0, 12(%rsp)
	movl	$0, 20(%rsp)
	movl	%edi, 52(%rsp)
	movq	208(%rsp), %rdi
	movl	%esi, 28(%rsp)
	movq	224(%rsp), %rsi
	addl	%ebp, %eax
	movl	%ebx, 80(%rsp)
	movl	%eax, 60(%rsp)
	movq	%rdi, 72(%rsp)
	movslq	%ebx, %rdi
	movl	%ebx, 56(%rsp)
	movq	%rsi, 88(%rsp)
	movq	%rdi, 64(%rsp)
	movq	%rsi, 32(%rsp)
	.p2align 4,,10
	.p2align 3
.L2568:
	movl	20(%rsp), %eax
	leal	1(%rax), %r13d
	movl	16(%rsp), %eax
	cmpl	%r13d, %eax
	jl	.L2574
	movl	12(%rsp), %esi
	cmpl	%esi, %eax
	jl	.L2574
	cmpl	%r13d, 16(%rsp)
	movl	28(%rsp), %ebx
	jg	.L2587
.L2540:
	movl	52(%rsp), %edi
	cmpl	%edi, 12(%rsp)
	jge	.L2588
	movq	32(%rsp), %rax
	movl	28(%rsp), %ecx
	movl	(%rax), %r12d
	cmpl	%ecx, %ebx
	setg	%dl
	cmpl	%ebx, %r12d
	setg	%al
	orb	%al, %dl
	jne	.L2543
	cmpl	%ecx, %r12d
	jg	.L2543
	testl	%r12d, %r12d
	js	.L2543
	testl	%ebx, %ebx
	js	.L2543
	subl	%r12d, %ebx
	leal	1(%rbx), %r14d
	testl	%r14d, %r14d
	jle	.L2583
	movslq	%r14d, %rdi
	call	malloc@PLT
	testq	%rax, %rax
	movq	%rax, %r15
	je	.L2547
	testl	%ebx, %ebx
	jle	.L2549
	movslq	%r12d, %rsi
	addq	72(%rsp), %rsi
	leal	-1(%rbx), %edx
	movq	%rax, %rdi
	addq	$1, %rdx
	call	memcpy@PLT
.L2549:
	movslq	%ebx, %rax
	cmpl	%ebp, 24(%rsp)
	movl	168(%rsp), %edx
	movb	$0, (%r15,%rax)
	movq	160(%rsp), %rax
	movq	176(%rsp), %rdi
	movl	184(%rsp), %esi
	movq	%rax, 40(%rsp)
	movl	192(%rsp), %eax
	jle	.L2575
	testl	%ebp, %ebp
	js	.L2575
	leal	1(%rbp), %r14d
	cmpl	%r14d, 24(%rsp)
	jl	.L2589
	movl	%edx, %ecx
	jg	.L2590
.L2553:
	cmpl	%ebp, %esi
	jle	.L2591
	imull	%ebp, %eax
	cmpl	%edx, %ecx
	cltq
	movl	(%rdi,%rax), %r12d
	setg	%dil
	cmpl	%ecx, %r12d
	setg	%al
	orb	%al, %dil
	jne	.L2556
	cmpl	%edx, %r12d
	jg	.L2556
	testl	%r12d, %r12d
	js	.L2556
	testl	%ecx, %ecx
	js	.L2556
	subl	%r12d, %ecx
	leal	1(%rcx), %edx
	movl	%ecx, %ebp
	testl	%edx, %edx
	jle	.L2583
	movslq	%edx, %rdi
	movl	%edx, 48(%rsp)
	call	malloc@PLT
	testq	%rax, %rax
	movq	%rax, %r9
	movl	48(%rsp), %edx
	je	.L2560
	testl	%ebp, %ebp
	jle	.L2592
	movslq	%r12d, %rsi
	addq	40(%rsp), %rsi
	leal	-1(%rbp), %edx
	movq	%rax, %rdi
	addq	$1, %rdx
	call	memcpy@PLT
	cmpl	%ebp, %ebx
	movq	%rax, %r9
	movslq	%ebp, %rax
	movb	$0, (%r9,%rax)
	je	.L2593
.L2537:
	movl	20(%rsp), %esi
	cmpl	%esi, 16(%rsp)
	je	.L2535
	addl	$1, 84(%rsp)
	movl	84(%rsp), %eax
	cmpl	%eax, 24(%rsp)
	jne	.L2570
.L2536:
	movl	$-1, 84(%rsp)
.L2535:
	movl	84(%rsp), %eax
	addq	$104, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L2592:
	.cfi_restore_state
	movslq	%ebp, %rax
	cmpl	%ebp, %ebx
	movb	$0, (%r9,%rax)
	jne	.L2537
.L2565:
	addl	$1, 12(%rsp)
	movq	64(%rsp), %rbx
	movl	%r14d, %ebp
	addq	%rbx, 32(%rsp)
	movl	80(%rsp), %esi
	addl	%esi, 56(%rsp)
	cmpl	60(%rsp), %r14d
	movl	%r13d, 20(%rsp)
	jne	.L2568
	jmp	.L2537
	.p2align 4,,10
	.p2align 3
.L2587:
	cmpl	52(%rsp), %r13d
	jge	.L2594
	movslq	56(%rsp), %rax
	movq	88(%rsp), %rbx
	movl	(%rbx,%rax), %ebx
	jmp	.L2540
	.p2align 4,,10
	.p2align 3
.L2590:
	cmpl	%esi, %r14d
	jge	.L2595
	movl	%r14d, %ecx
	imull	%eax, %ecx
	movslq	%ecx, %rcx
	movl	(%rdi,%rcx), %ecx
	jmp	.L2553
	.p2align 4,,10
	.p2align 3
.L2593:
	movzbl	(%r15), %eax
	cmpb	%al, (%r9)
	jne	.L2537
	leal	-1(%rbx), %ecx
	movl	$1, %eax
	addq	$1, %rcx
	jmp	.L2566
	.p2align 4,,10
	.p2align 3
.L2567:
	movzbl	(%r9,%rax), %edx
	addq	$1, %rax
	cmpb	%dl, -1(%r15,%rax)
	jne	.L2537
.L2566:
	cmpq	%rax, %rcx
	jne	.L2567
	jmp	.L2565
.L2571:
	movl	$0, 20(%rsp)
	jmp	.L2537
.L2556:
	movl	%edx, %eax
	movl	%r12d, %ebp
	movl	%ecx, %edx
	movl	%eax, %ecx
.L2584:
	movl	%ebp, %esi
.L2581:
	leaq	.LC83(%rip), %rdi
	xorl	%eax, %eax
	call	_STR
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	v_panic
.L2574:
	movl	16(%rsp), %ecx
	movl	%r13d, %edx
	movl	20(%rsp), %esi
	jmp	.L2581
.L2543:
	movl	%r12d, %ebp
	movl	%ebx, %edx
	jmp	.L2584
.L2589:
	movl	24(%rsp), %ecx
	movl	%r14d, %edx
	movl	%ebp, %esi
	jmp	.L2581
.L2583:
	leaq	.LC73(%rip), %rdi
	movl	$11, %esi
	call	v_panic
.L2547:
	movl	%r14d, %esi
.L2586:
	leaq	.LC74(%rip), %rdi
	xorl	%eax, %eax
	call	_STR
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	v_panic
.L2588:
	movl	20(%rsp), %esi
	movl	%edi, %edx
.L2582:
	leaq	.LC68(%rip), %rdi
.L2585:
	xorl	%eax, %eax
	call	_STR
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	v_panic
.L2575:
	movl	%esi, %edx
	leaq	.LC84(%rip), %rdi
	movl	%ebp, %esi
	jmp	.L2585
.L2560:
	movl	%edx, %esi
	jmp	.L2586
.L2591:
	movl	%esi, %edx
	movl	%ebp, %esi
	jmp	.L2582
.L2594:
	movl	52(%rsp), %edx
	movl	%r13d, %esi
	jmp	.L2582
.L2595:
	movl	%esi, %edx
	movl	%r14d, %esi
	jmp	.L2582
	.cfi_endproc
.LFE327:
	.size	ustring_index_after, .-ustring_index_after
	.section	.text.ustring_count,"ax",@progbits
	.p2align 4,,15
	.globl	ustring_count
	.type	ustring_count, @function
ustring_count:
.LFB328:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movl	72(%rsp), %r12d
	movl	120(%rsp), %ebx
	testl	%r12d, %r12d
	sete	%dl
	testl	%ebx, %ebx
	sete	%al
	orb	%al, %dl
	jne	.L2599
	cmpl	%ebx, %r12d
	jge	.L2605
.L2599:
	xorl	%ebp, %ebp
	movl	%ebp, %eax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L2605:
	.cfi_restore_state
	xorl	%edi, %edi
	xorl	%ebp, %ebp
	jmp	.L2598
	.p2align 4,,10
	.p2align 3
.L2606:
	leal	(%rax,%rbx), %edi
	addl	$1, %ebp
.L2598:
	movl	%r12d, 72(%rsp)
	movl	%ebx, 120(%rsp)
	pushq	120(%rsp)
	.cfi_def_cfa_offset 40
	pushq	120(%rsp)
	.cfi_def_cfa_offset 48
	pushq	120(%rsp)
	.cfi_def_cfa_offset 56
	pushq	120(%rsp)
	.cfi_def_cfa_offset 64
	pushq	120(%rsp)
	.cfi_def_cfa_offset 72
	pushq	120(%rsp)
	.cfi_def_cfa_offset 80
	pushq	120(%rsp)
	.cfi_def_cfa_offset 88
	pushq	120(%rsp)
	.cfi_def_cfa_offset 96
	pushq	120(%rsp)
	.cfi_def_cfa_offset 104
	pushq	120(%rsp)
	.cfi_def_cfa_offset 112
	pushq	120(%rsp)
	.cfi_def_cfa_offset 120
	pushq	120(%rsp)
	.cfi_def_cfa_offset 128
	call	ustring_index_after
	addq	$96, %rsp
	.cfi_def_cfa_offset 32
	cmpl	$-1, %eax
	jne	.L2606
	movl	%ebp, %eax
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE328:
	.size	ustring_count, .-ustring_count
	.section	.rodata.str1.8
	.align 8
.LC91:
	.string	"================ V panic ================"
	.section	.rodata.str1.1
.LC92:
	.string	"   module: %.*s"
.LC93:
	.string	" function: %.*s()"
.LC94:
	.string	"     file: %.*s"
.LC95:
	.string	"     line: "
.LC96:
	.string	"  message: %.*s"
	.section	.rodata.str1.8
	.align 8
.LC97:
	.string	"========================================="
	.section	.text.panic_debug,"ax",@progbits
	.p2align 4,,15
	.globl	panic_debug
	.type	panic_debug, @function
panic_debug:
.LFB131:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rcx, %r15
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	leaq	.LC91(%rip), %rcx
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rsi, %r12
	leaq	.LC26(%rip), %rsi
	movq	%rdx, %rbp
	movl	$41, %edx
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	movq	112(%rsp), %rax
	movl	%edi, 12(%rsp)
	movl	$1, %edi
	movq	%r8, 24(%rsp)
	movq	96(%rsp), %r14
	movq	104(%rsp), %r13
	movq	120(%rsp), %rbx
	movq	%rax, 16(%rsp)
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movq	24(%rsp), %r8
	leaq	.LC92(%rip), %rdi
	xorl	%eax, %eax
	movq	%r15, %rdx
	movl	%r8d, %esi
	call	_STR
	leaq	.LC26(%rip), %rsi
	movq	%rax, %rcx
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	leaq	.LC93(%rip), %rdi
	movl	%r13d, %esi
	xorl	%eax, %eax
	movq	%r14, %rdx
	call	_STR
	leaq	.LC26(%rip), %rsi
	movq	%rax, %rcx
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	leaq	.LC94(%rip), %rdi
	movl	%ebp, %esi
	xorl	%eax, %eax
	movq	%r12, %rdx
	call	_STR
	leaq	.LC26(%rip), %rsi
	movq	%rax, %rcx
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	12(%rsp), %edi
	call	int_str
	leaq	.LC95(%rip), %rdi
	movq	%rdx, %rcx
	movl	$11, %esi
	movq	%rax, %rdx
	call	string_add
	leaq	.LC26(%rip), %rsi
	movq	%rax, %rcx
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movq	16(%rsp), %rdx
	leaq	.LC96(%rip), %rdi
	movl	%ebx, %esi
	xorl	%eax, %eax
	call	_STR
	leaq	.LC26(%rip), %rsi
	movq	%rax, %rcx
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	leaq	.LC97(%rip), %rcx
	leaq	.LC26(%rip), %rsi
	movl	$41, %edx
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	$3, %edi
	call	print_backtrace_skipping_top_frames_linux
	testl	%eax, %eax
	je	.L2610
.L2608:
	movl	$1, %edi
	call	exit@PLT
.L2610:
	leaq	.LC50(%rip), %rcx
	leaq	.LC26(%rip), %rsi
	movl	$83, %edx
	movl	$1, %edi
	call	__printf_chk@PLT
	jmp	.L2608
	.cfi_endproc
.LFE131:
	.size	panic_debug, .-panic_debug
	.section	.text.string_trim_left,"ax",@progbits
	.p2align 4,,15
	.globl	string_trim_left
	.type	string_trim_left, @function
string_trim_left:
.LFB309:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	movq	%rsi, %rdi
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	testl	%esi, %esi
	jle	.L2612
	testl	%ecx, %ecx
	jle	.L2612
	leaq	32(%rsp), %rdi
	movq	%rsi, %r14
	movl	%esi, %r13d
	movq	%rdx, %rsi
	movq	%rcx, %rdx
	xorl	%r15d, %r15d
	call	string_bytes
	movl	40(%rsp), %eax
	movq	32(%rsp), %r12
	movl	%r14d, %esi
	movq	%rsi, 8(%rsp)
	movl	%eax, 16(%rsp)
	subl	$1, %eax
	movl	%eax, 20(%rsp)
	.p2align 4,,10
	.p2align 3
.L2621:
	movabsq	$-4294967296, %rbp
	movl	%r15d, %edx
	movq	%rbx, %rdi
	andq	%r14, %rbp
	orq	8(%rsp), %rbp
	movq	%rbp, %rsi
	movq	%rbp, %r14
	call	string_at
	movl	16(%rsp), %edx
	testl	%edx, %edx
	jle	.L2615
	cmpb	(%r12), %al
	je	.L2616
	movl	20(%rsp), %ecx
	leaq	1(%r12), %rdx
	addq	%rdx, %rcx
	jmp	.L2617
	.p2align 4,,10
	.p2align 3
.L2618:
	addq	$1, %rdx
	cmpb	-1(%rdx), %al
	je	.L2616
.L2617:
	cmpq	%rcx, %rdx
	jne	.L2618
.L2615:
	cmpl	%r15d, %r13d
	jle	.L2622
	movl	%r13d, %ecx
	movl	%r15d, %edx
	movq	%rbx, %rdi
	movq	%rbp, %rsi
	call	string_substr
	movq	%rdx, 24(%rsp)
	jmp	.L2620
	.p2align 4,,10
	.p2align 3
.L2612:
	movq	%rbx, %rax
	movq	%rdi, %rdx
.L2614:
	movq	56(%rsp), %rbx
	xorq	%fs:40, %rbx
	jne	.L2627
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L2616:
	.cfi_restore_state
	addl	$1, %r15d
	cmpl	%r13d, %r15d
	jne	.L2621
.L2622:
	leaq	.LC37(%rip), %rax
	xorl	%edx, %edx
.L2620:
	movl	%edx, %ecx
	movabsq	$-4294967296, %rdx
	andq	24(%rsp), %rdx
	orq	%rcx, %rdx
	jmp	.L2614
.L2627:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE309:
	.size	string_trim_left, .-string_trim_left
	.section	.text.string_trim_right,"ax",@progbits
	.p2align 4,,15
	.globl	string_trim_right
	.type	string_trim_right, @function
string_trim_right:
.LFB310:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rsi, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbp
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	testl	%esi, %esi
	movl	%esi, 12(%rsp)
	jle	.L2629
	testl	%ecx, %ecx
	jle	.L2629
	leaq	16(%rsp), %rdi
	movq	%rsi, %r15
	movq	%rdx, %rsi
	movq	%rcx, %rdx
	call	string_bytes
	movl	24(%rsp), %r13d
	movl	%r14d, %eax
	movq	16(%rsp), %r12
	leal	-1(%rax), %r14d
	movq	%rax, (%rsp)
	leal	-1(%r13), %eax
	movl	%eax, 8(%rsp)
	.p2align 4,,10
	.p2align 3
.L2637:
	movabsq	$-4294967296, %rbx
	movl	%r14d, %edx
	movq	%rbp, %rdi
	andq	%r15, %rbx
	orq	(%rsp), %rbx
	movq	%rbx, %rsi
	movq	%rbx, %r15
	call	string_at
	testl	%r13d, %r13d
	jle	.L2632
	cmpb	(%r12), %al
	je	.L2633
	movl	8(%rsp), %edi
	leaq	1(%r12), %rdx
	addq	%rdx, %rdi
	jmp	.L2634
	.p2align 4,,10
	.p2align 3
.L2635:
	addq	$1, %rdx
	cmpb	-1(%rdx), %al
	je	.L2633
.L2634:
	cmpq	%rdi, %rdx
	jne	.L2635
.L2632:
	leal	1(%r14), %ecx
	cmpl	12(%rsp), %ecx
	jl	.L2647
.L2636:
	movabsq	$-4294967296, %rdx
	movq	%rbp, %rax
	andq	%rdx, %rbx
	movq	(%rsp), %rdx
	orq	%rbx, %rdx
	jmp	.L2631
	.p2align 4,,10
	.p2align 3
.L2629:
	movq	%rbp, %rax
	movq	%r14, %rdx
.L2631:
	movq	40(%rsp), %rcx
	xorq	%fs:40, %rcx
	jne	.L2648
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L2633:
	.cfi_restore_state
	subl	$1, %r14d
	cmpl	$-1, %r14d
	jne	.L2637
	leaq	.LC37(%rip), %rax
	xorl	%edx, %edx
	jmp	.L2631
	.p2align 4,,10
	.p2align 3
.L2647:
	movq	%rbp, %rdi
	movq	%rbx, %rsi
	xorl	%edx, %edx
	call	string_substr
	movq	%rax, %rbp
	movl	%edx, %eax
	movq	%rdx, %rbx
	movq	%rax, (%rsp)
	jmp	.L2636
.L2648:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE310:
	.size	string_trim_right, .-string_trim_right
	.section	.rodata.str1.8
	.align 8
.LC98:
	.string	"string.repeat: count is negative: %d"
	.section	.text.string_repeat,"ax",@progbits
	.p2align 4,,15
	.globl	string_repeat
	.type	string_repeat, @function
string_repeat:
.LFB352:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	testl	%edx, %edx
	js	.L2692
	je	.L2693
	cmpl	$1, %edx
	movq	%rdi, %rbx
	je	.L2694
	movl	%edx, %eax
	movl	%esi, %r12d
	movq	%rsi, 8(%rsp)
	imull	%esi, %eax
	movl	%edx, 52(%rsp)
	leal	1(%rax), %edi
	movl	%eax, 48(%rsp)
	call	v_malloc
	movq	8(%rsp), %rsi
	movq	%rax, %rbp
	testl	%esi, %esi
	jle	.L2654
	movq	%rbx, %rcx
	leal	-1(%rsi), %edx
	movslq	%esi, %rax
	negq	%rcx
	movq	%rax, 16(%rsp)
	movl	%esi, %r15d
	movl	%ecx, %r10d
	andl	$15, %ecx
	movl	%edx, 24(%rsp)
	andl	$15, %r10d
	movq	%rcx, 40(%rsp)
	movl	%edx, %ecx
	leal	15(%r10), %eax
	leaq	1(%rcx), %rdx
	movq	%rbp, %r9
	xorl	%r14d, %r14d
	movl	%eax, 28(%rsp)
	movl	%esi, %eax
	leaq	16(%rbx), %rsi
	subl	%r10d, %eax
	movq	%rdx, 56(%rsp)
	movl	52(%rsp), %edx
	movl	%eax, %r13d
	movl	%eax, 32(%rsp)
	movq	%rsi, 8(%rsp)
	andl	$-16, %eax
	movl	%r10d, %esi
	shrl	$4, %r13d
	movl	%eax, 36(%rsp)
	addq	%rbx, %rsi
	movl	$1, %eax
	.p2align 4,,10
	.p2align 3
.L2655:
	cmpq	8(%rsp), %r9
	leaq	16(%r9), %rcx
	setnb	%dil
	cmpq	%rcx, %rbx
	setnb	%cl
	orb	%cl, %dil
	je	.L2666
	cmpl	$22, %r15d
	jbe	.L2666
	movl	28(%rsp), %ecx
	cmpl	%ecx, 24(%rsp)
	jb	.L2668
	testl	%r10d, %r10d
	je	.L2669
	movzbl	(%rbx), %ecx
	cmpl	$1, %r10d
	movb	%cl, (%r9)
	je	.L2670
	movzbl	1(%rbx), %edi
	movslq	%eax, %rcx
	cmpl	$2, %r10d
	movb	%dil, 0(%rbp,%rcx)
	je	.L2671
	movzbl	2(%rbx), %edi
	leal	1(%rax), %ecx
	cmpl	$3, %r10d
	movslq	%ecx, %rcx
	movb	%dil, 0(%rbp,%rcx)
	je	.L2672
	movzbl	3(%rbx), %edi
	leal	2(%rax), %ecx
	cmpl	$4, %r10d
	movslq	%ecx, %rcx
	movb	%dil, 0(%rbp,%rcx)
	je	.L2673
	movzbl	4(%rbx), %edi
	leal	3(%rax), %ecx
	cmpl	$5, %r10d
	movslq	%ecx, %rcx
	movb	%dil, 0(%rbp,%rcx)
	je	.L2674
	movzbl	5(%rbx), %edi
	leal	4(%rax), %ecx
	cmpl	$6, %r10d
	movslq	%ecx, %rcx
	movb	%dil, 0(%rbp,%rcx)
	je	.L2675
	movzbl	6(%rbx), %edi
	leal	5(%rax), %ecx
	cmpl	$7, %r10d
	movslq	%ecx, %rcx
	movb	%dil, 0(%rbp,%rcx)
	je	.L2676
	movzbl	7(%rbx), %edi
	leal	6(%rax), %ecx
	cmpl	$8, %r10d
	movslq	%ecx, %rcx
	movb	%dil, 0(%rbp,%rcx)
	je	.L2677
	movzbl	8(%rbx), %edi
	leal	7(%rax), %ecx
	cmpl	$9, %r10d
	movslq	%ecx, %rcx
	movb	%dil, 0(%rbp,%rcx)
	je	.L2678
	movzbl	9(%rbx), %edi
	leal	8(%rax), %ecx
	cmpl	$10, %r10d
	movslq	%ecx, %rcx
	movb	%dil, 0(%rbp,%rcx)
	je	.L2679
	movzbl	10(%rbx), %edi
	leal	9(%rax), %ecx
	cmpl	$11, %r10d
	movslq	%ecx, %rcx
	movb	%dil, 0(%rbp,%rcx)
	je	.L2680
	movzbl	11(%rbx), %edi
	leal	10(%rax), %ecx
	cmpl	$12, %r10d
	movslq	%ecx, %rcx
	movb	%dil, 0(%rbp,%rcx)
	je	.L2681
	movzbl	12(%rbx), %edi
	leal	11(%rax), %ecx
	cmpl	$13, %r10d
	movslq	%ecx, %rcx
	movb	%dil, 0(%rbp,%rcx)
	je	.L2682
	movzbl	13(%rbx), %edi
	leal	12(%rax), %ecx
	cmpl	$15, %r10d
	movslq	%ecx, %rcx
	movb	%dil, 0(%rbp,%rcx)
	jne	.L2683
	movzbl	14(%rbx), %edi
	leal	13(%rax), %ecx
	movslq	%ecx, %rcx
	movb	%dil, 0(%rbp,%rcx)
	movl	$15, %ecx
	.p2align 4,,10
	.p2align 3
.L2657:
	movq	40(%rsp), %rdi
	xorl	%r8d, %r8d
	leaq	(%rdi,%r9), %r11
	xorl	%edi, %edi
	.p2align 4,,10
	.p2align 3
.L2659:
	movdqa	(%rsi,%rdi), %xmm0
	addl	$1, %r8d
	movups	%xmm0, (%r11,%rdi)
	addq	$16, %rdi
	cmpl	%r8d, %r13d
	ja	.L2659
	movl	36(%rsp), %edi
	addl	%edi, %ecx
	cmpl	%edi, 32(%rsp)
	je	.L2663
.L2656:
	movslq	%ecx, %rcx
	.p2align 4,,10
	.p2align 3
.L2661:
	movzbl	(%rbx,%rcx), %edi
	movb	%dil, (%r9,%rcx)
	addq	$1, %rcx
	cmpl	%ecx, %r12d
	jg	.L2661
.L2663:
	addl	$1, %r14d
	addq	16(%rsp), %r9
	addl	%r15d, %eax
	cmpl	%r14d, %edx
	jg	.L2655
.L2654:
	movslq	48(%rsp), %rax
	testq	%rbp, %rbp
	movb	$0, 0(%rbp,%rax)
	je	.L2695
	movq	%rbp, %rdi
	call	strlen@PLT
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%rax, %rdx
	movq	%rbp, %rax
	popq	%rbx
	.cfi_def_cfa_offset 48
	movl	%edx, %edx
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L2694:
	.cfi_restore_state
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%rdi, %rax
	movq	%rsi, %rdx
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L2693:
	.cfi_restore_state
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	leaq	.LC37(%rip), %rax
	xorl	%edx, %edx
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L2666:
	.cfi_restore_state
	movq	56(%rsp), %r8
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L2662:
	movzbl	(%rbx,%rcx), %edi
	movb	%dil, (%r9,%rcx)
	addq	$1, %rcx
	cmpq	%r8, %rcx
	jne	.L2662
	jmp	.L2663
	.p2align 4,,10
	.p2align 3
.L2670:
	movl	$1, %ecx
	jmp	.L2657
	.p2align 4,,10
	.p2align 3
.L2671:
	movl	$2, %ecx
	jmp	.L2657
	.p2align 4,,10
	.p2align 3
.L2668:
	xorl	%ecx, %ecx
	jmp	.L2656
	.p2align 4,,10
	.p2align 3
.L2672:
	movl	$3, %ecx
	jmp	.L2657
	.p2align 4,,10
	.p2align 3
.L2673:
	movl	$4, %ecx
	jmp	.L2657
	.p2align 4,,10
	.p2align 3
.L2674:
	movl	$5, %ecx
	jmp	.L2657
.L2675:
	movl	$6, %ecx
	jmp	.L2657
.L2669:
	xorl	%ecx, %ecx
	jmp	.L2657
.L2676:
	movl	$7, %ecx
	jmp	.L2657
.L2679:
	movl	$10, %ecx
	jmp	.L2657
.L2677:
	movl	$8, %ecx
	jmp	.L2657
.L2678:
	movl	$9, %ecx
	jmp	.L2657
.L2680:
	movl	$11, %ecx
	jmp	.L2657
.L2681:
	movl	$12, %ecx
	jmp	.L2657
.L2682:
	movl	$13, %ecx
	jmp	.L2657
.L2683:
	movl	$14, %ecx
	jmp	.L2657
.L2692:
	leaq	.LC98(%rip), %rdi
	movl	%edx, %esi
	xorl	%eax, %eax
	call	_STR
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	v_panic
.L2695:
	call	tos2.part.8
	.cfi_endproc
.LFE352:
	.size	string_repeat, .-string_repeat
	.section	.rodata.str1.8
	.align 8
.LC99:
	.string	"Warning: `strip_margin` cannot use white-space as a delimiter"
	.section	.rodata.str1.1
.LC100:
	.string	"    Defaulting to `|`"
	.section	.text.string_strip_margin_custom,"ax",@progbits
	.p2align 4,,15
	.globl	string_strip_margin_custom
	.type	string_strip_margin_custom, @function
string_strip_margin_custom:
.LFB354:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	%edx, %eax
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	andl	$127, %eax
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %r12
	movq	%rsi, %rbx
	movl	%esi, %r15d
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	cmpb	$32, %al
	je	.L2697
	leal	-9(%rdx), %eax
	cmpb	$4, %al
	jbe	.L2697
	cmpb	$-123, %dl
	movl	%edx, %r14d
	jne	.L2698
	.p2align 4,,10
	.p2align 3
.L2697:
	movq	stdout(%rip), %rdi
	movl	$124, %r14d
	call	fflush@PLT
	movq	stderr(%rip), %rdi
	call	fflush@PLT
	movq	stderr(%rip), %rdi
	leaq	.LC99(%rip), %r8
	leaq	.LC26(%rip), %rdx
	movl	$61, %ecx
	movl	$1, %esi
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	movq	stderr(%rip), %rdi
	call	fflush@PLT
	movq	stdout(%rip), %rdi
	call	fflush@PLT
	movq	stderr(%rip), %rdi
	call	fflush@PLT
	movq	stderr(%rip), %rdi
	leaq	.LC100(%rip), %r8
	leaq	.LC26(%rip), %rdx
	movl	$21, %ecx
	movl	$1, %esi
	xorl	%eax, %eax
	call	__fprintf_chk@PLT
	movq	stderr(%rip), %rdi
	call	fflush@PLT
.L2698:
	leal	1(%r15), %edi
	call	v_malloc
	testl	%r15d, %r15d
	movq	%rax, 24(%rsp)
	jle	.L2699
	movl	%r15d, %eax
	xorl	%ebp, %ebp
	movl	$0, 40(%rsp)
	movq	%rax, 32(%rsp)
	leal	-1(%r15), %eax
	movl	%eax, 44(%rsp)
	movl	%ebp, %eax
	movl	%r15d, %ebp
	movl	%eax, %r15d
	jmp	.L2709
	.p2align 4,,10
	.p2align 3
.L2720:
	movl	%r15d, %edx
	movq	%r12, %rdi
	movq	%rbx, %rsi
	call	string_at
	addl	$1, %r15d
	movb	%al, 0(%r13)
.L2722:
	movl	12(%rsp), %eax
	cmpl	%r15d, %ebp
	movl	%eax, 40(%rsp)
	jle	.L2723
.L2709:
	movabsq	$-4294967296, %rax
	movq	%r12, %rdi
	movl	%r15d, %edx
	andq	%rax, %rbx
	orq	32(%rsp), %rbx
	movq	%rbx, %rsi
	movq	%rbx, 16(%rsp)
	call	string_at
	movslq	40(%rsp), %r13
	movq	%r13, %rcx
	addq	24(%rsp), %r13
	cmpb	$10, %al
	leal	1(%rcx), %edi
	movl	%edi, 12(%rsp)
	je	.L2703
	movl	%r15d, %edx
	movq	%r12, %rdi
	movq	%rbx, %rsi
	call	string_at
	cmpb	$13, %al
	jne	.L2720
.L2703:
	movq	16(%rsp), %rsi
	movl	%r15d, %edx
	movq	%r12, %rdi
	call	string_at
	movq	16(%rsp), %rsi
	movb	%al, 0(%r13)
	movl	%r15d, %edx
	movq	%r12, %rdi
	call	string_at
	cmpb	$13, %al
	je	.L2724
.L2702:
	movslq	%r15d, %rax
	movl	%r15d, %edx
	addq	%r12, %rax
	jmp	.L2705
	.p2align 4,,10
	.p2align 3
.L2712:
	movl	%r15d, %edx
.L2705:
	cmpl	%ebp, %r15d
	jge	.L2725
	addl	$1, %r15d
	cmpb	(%rax), %r14b
	je	.L2722
	addq	$1, %rax
	cmpl	%r15d, %ebp
	jg	.L2712
	leal	2(%rdx), %r15d
	movl	12(%rsp), %eax
	cmpl	%r15d, %ebp
	movl	%eax, 40(%rsp)
	jg	.L2709
.L2723:
	movslq	12(%rsp), %rax
	addq	24(%rsp), %rax
.L2699:
	cmpq	$0, 24(%rsp)
	movb	$0, (%rax)
	je	.L2726
	movq	24(%rsp), %rbx
	movq	%rbx, %rdi
	call	strlen@PLT
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	%eax, %edx
	movq	%rbx, %rax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L2724:
	.cfi_restore_state
	cmpl	%r15d, 44(%rsp)
	jle	.L2702
	leal	1(%r15), %r13d
	movq	16(%rsp), %rsi
	movq	%r12, %rdi
	movl	%r13d, %edx
	call	string_at
	cmpb	$10, %al
	jne	.L2702
	movslq	12(%rsp), %rax
	movq	24(%rsp), %rsi
	movl	%r13d, %edx
	movq	%r12, %rdi
	leaq	(%rsi,%rax), %r15
	movq	16(%rsp), %rsi
	call	string_at
	movb	%al, (%r15)
	movl	40(%rsp), %eax
	movl	%r13d, %r15d
	addl	$2, %eax
	movl	%eax, 12(%rsp)
	jmp	.L2702
.L2725:
	movl	%r15d, %eax
	leaq	.LC84(%rip), %rdi
	movl	%ebp, %r15d
	movl	%eax, %esi
	movl	%r15d, %edx
	xorl	%eax, %eax
	call	_STR
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	v_panic
.L2726:
	call	tos2.part.8
	.cfi_endproc
.LFE354:
	.size	string_strip_margin_custom, .-string_strip_margin_custom
	.section	.text.string_strip_margin,"ax",@progbits
	.p2align 4,,15
	.globl	string_strip_margin
	.type	string_strip_margin, @function
string_strip_margin:
.LFB353:
	.cfi_startproc
	movl	$124, %edx
	jmp	string_strip_margin_custom
	.cfi_endproc
.LFE353:
	.size	string_strip_margin, .-string_strip_margin
	.section	.text.utf8_char_len,"ax",@progbits
	.p2align 4,,15
	.globl	utf8_char_len
	.type	utf8_char_len, @function
utf8_char_len:
.LFB355:
	.cfi_startproc
	movl	%edi, %ecx
	movl	$-452984832, %eax
	shrb	$3, %cl
	andl	$30, %ecx
	shrl	%cl, %eax
	andl	$3, %eax
	addl	$1, %eax
	ret
	.cfi_endproc
.LFE355:
	.size	utf8_char_len, .-utf8_char_len
	.section	.text.utf32_to_str,"ax",@progbits
	.p2align 4,,15
	.globl	utf32_to_str
	.type	utf32_to_str, @function
utf32_to_str:
.LFB356:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	%edi, %ebx
	movl	$5, %edi
	call	v_malloc
	cmpl	$127, %ebx
	jle	.L2736
	cmpl	$2047, %ebx
	jle	.L2737
	cmpl	$65535, %ebx
	jle	.L2738
	xorl	%edx, %edx
	cmpl	$1114111, %ebx
	leaq	.LC37(%rip), %rcx
	jg	.L2731
	movl	%ebx, %edx
	movq	%rax, %rcx
	sarl	$18, %edx
	orl	$-16, %edx
	movb	%dl, (%rax)
	movl	%ebx, %edx
	sarl	$12, %edx
	andl	$63, %edx
	orl	$-128, %edx
	movb	%dl, 1(%rax)
	movl	%ebx, %edx
	andl	$63, %ebx
	sarl	$6, %edx
	orl	$-128, %ebx
	andl	$63, %edx
	movb	%bl, 3(%rax)
	orl	$-128, %edx
	movb	%dl, 2(%rax)
	movl	$4, %edx
	jmp	.L2731
	.p2align 4,,10
	.p2align 3
.L2737:
	movl	%ebx, %edx
	andl	$63, %ebx
	movq	%rax, %rcx
	sarl	$6, %edx
	orl	$-128, %ebx
	orl	$-64, %edx
	movb	%bl, 1(%rax)
	movb	%dl, (%rax)
	movl	$2, %edx
.L2731:
	movq	%rcx, %rax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L2736:
	.cfi_restore_state
	movq	%rax, %rcx
	movb	%bl, (%rax)
	movl	$1, %edx
	movq	%rcx, %rax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L2738:
	.cfi_restore_state
	movl	%ebx, %edx
	movq	%rax, %rcx
	sarl	$12, %edx
	orl	$-32, %edx
	movb	%dl, (%rax)
	movl	%ebx, %edx
	andl	$63, %ebx
	sarl	$6, %edx
	orl	$-128, %ebx
	andl	$63, %edx
	movb	%bl, 2(%rax)
	orl	$-128, %edx
	movb	%dl, 1(%rax)
	movl	$3, %edx
	movq	%rcx, %rax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE356:
	.size	utf32_to_str, .-utf32_to_str
	.section	.text.utf32_to_str_no_malloc,"ax",@progbits
	.p2align 4,,15
	.globl	utf32_to_str_no_malloc
	.type	utf32_to_str_no_malloc, @function
utf32_to_str_no_malloc:
.LFB357:
	.cfi_startproc
	cmpl	$127, %edi
	jle	.L2745
	cmpl	$2047, %edi
	jle	.L2746
	cmpl	$65535, %edi
	jle	.L2747
	xorl	%edx, %edx
	cmpl	$1114111, %edi
	leaq	.LC37(%rip), %rax
	jle	.L2748
	rep ret
	.p2align 4,,10
	.p2align 3
.L2746:
	movl	%edi, %eax
	andl	$63, %edi
	movl	$2, %edx
	sarl	$6, %eax
	orl	$-128, %edi
	orl	$-64, %eax
	movb	%dil, 1(%rsi)
	movb	%al, (%rsi)
	movq	%rsi, %rax
	ret
	.p2align 4,,10
	.p2align 3
.L2745:
	movb	%dil, (%rsi)
	movq	%rsi, %rax
	movl	$1, %edx
	ret
	.p2align 4,,10
	.p2align 3
.L2747:
	movl	%edi, %eax
	movl	$3, %edx
	sarl	$12, %eax
	orl	$-32, %eax
	movb	%al, (%rsi)
	movl	%edi, %eax
	andl	$63, %edi
	sarl	$6, %eax
	orl	$-128, %edi
	andl	$63, %eax
	movb	%dil, 2(%rsi)
	orl	$-128, %eax
	movb	%al, 1(%rsi)
	movq	%rsi, %rax
	ret
	.p2align 4,,10
	.p2align 3
.L2748:
	movl	%edi, %eax
	movl	$4, %edx
	sarl	$18, %eax
	orl	$-16, %eax
	movb	%al, (%rsi)
	movl	%edi, %eax
	sarl	$12, %eax
	andl	$63, %eax
	orl	$-128, %eax
	movb	%al, 1(%rsi)
	movl	%edi, %eax
	andl	$63, %edi
	sarl	$6, %eax
	orl	$-128, %edi
	andl	$63, %eax
	movb	%dil, 3(%rsi)
	orl	$-128, %eax
	movb	%al, 2(%rsi)
	movq	%rsi, %rax
	ret
	.cfi_endproc
.LFE357:
	.size	utf32_to_str_no_malloc, .-utf32_to_str_no_malloc
	.section	.text.string_utf32_code,"ax",@progbits
	.p2align 4,,15
	.globl	string_utf32_code
	.type	string_utf32_code, @function
string_utf32_code:
.LFB358:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	%esi, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	testl	%esi, %esi
	je	.L2749
	movq	%rsi, %rbx
	xorl	%edx, %edx
	cmpl	$1, %r12d
	movq	%rdi, %r13
	movq	%rbx, %rsi
	je	.L2756
	call	string_at
	movl	%r12d, %ecx
	movzbl	%al, %ebp
	sall	%cl, %ebp
	movl	$6, %ecx
	subl	%r12d, %ecx
	cmpl	$1, %r12d
	movzbl	%bpl, %ebp
	movl	%ecx, %r15d
	jle	.L2753
	movl	%r12d, %eax
	movl	$1, %r14d
	movq	%rax, 8(%rsp)
	.p2align 4,,10
	.p2align 3
.L2752:
	movabsq	$-4294967296, %rax
	movl	%r14d, %edx
	movq	%r13, %rdi
	andq	%rax, %rbx
	orq	8(%rsp), %rbx
	addl	$1, %r14d
	movq	%rbx, %rsi
	call	string_at
	movl	%r15d, %ecx
	andl	$63, %eax
	movl	$6, %r15d
	sall	%cl, %ebp
	orl	%eax, %ebp
	cmpl	%r14d, %r12d
	jne	.L2752
.L2753:
	movl	%ebp, %r12d
.L2749:
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	%r12d, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L2756:
	.cfi_restore_state
	call	string_at
	movzbl	%al, %r12d
	jmp	.L2749
	.cfi_endproc
.LFE358:
	.size	string_utf32_code, .-string_utf32_code
	.section	.text.string_to_wide,"ax",@progbits
	.p2align 4,,15
	.globl	string_to_wide
	.type	string_to_wide, @function
string_to_wide:
.LFB359:
	.cfi_startproc
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE359:
	.size	string_to_wide, .-string_to_wide
	.section	.text.string_from_wide,"ax",@progbits
	.p2align 4,,15
	.globl	string_from_wide
	.type	string_from_wide, @function
string_from_wide:
.LFB360:
	.cfi_startproc
	leaq	.LC37(%rip), %rax
	xorl	%edx, %edx
	ret
	.cfi_endproc
.LFE360:
	.size	string_from_wide, .-string_from_wide
	.section	.text.string_from_wide2,"ax",@progbits
	.p2align 4,,15
	.globl	string_from_wide2
	.type	string_from_wide2, @function
string_from_wide2:
.LFB361:
	.cfi_startproc
	leaq	.LC37(%rip), %rax
	xorl	%edx, %edx
	ret
	.cfi_endproc
.LFE361:
	.size	string_from_wide2, .-string_from_wide2
	.section	.text.utf8_len,"ax",@progbits
	.p2align 4,,15
	.globl	utf8_len
	.type	utf8_len, @function
utf8_len:
.LFB362:
	.cfi_startproc
	movl	%edi, %edx
	andl	$240, %edi
	je	.L2764
	shrb	$4, %dl
	movl	$2, %eax
	xorl	%ecx, %ecx
.L2761:
	testb	$12, %dl
	je	.L2762
	shrb	$2, %dl
	movl	%ecx, %eax
.L2762:
	andl	$2, %edx
	cmpb	$1, %dl
	adcl	$0, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L2764:
	movl	$6, %eax
	movl	$4, %ecx
	jmp	.L2761
	.cfi_endproc
.LFE362:
	.size	utf8_len, .-utf8_len
	.section	.text.utf8_getchar,"ax",@progbits
	.p2align 4,,15
	.globl	utf8_getchar
	.type	utf8_getchar, @function
utf8_getchar:
.LFB363:
	.cfi_startproc
	movq	stdin(%rip), %rdi
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	call	_IO_getc@PLT
	movl	%eax, %ebx
	notl	%eax
	testb	$-16, %al
	je	.L2778
	shrb	$4, %al
	movl	$3, %edx
	movl	$1, %edi
	movl	$2, %ecx
	xorl	%esi, %esi
.L2769:
	testb	$12, %al
	je	.L2770
	shrb	$2, %al
	movl	%edi, %edx
	movl	%esi, %ecx
.L2770:
	testb	$2, %al
	jne	.L2771
	testl	%ebx, %ebx
	js	.L2772
.L2773:
	cmpl	$1, %edx
	je	.L2775
	movl	$7, %ecx
	movl	$1, %eax
	leal	-1(%rdx), %r12d
	subl	%edx, %ecx
	xorl	%ebp, %ebp
	sall	%cl, %eax
	subl	$1, %eax
	andl	%eax, %ebx
	jmp	.L2776
	.p2align 4,,10
	.p2align 3
.L2794:
	movl	%eax, %edx
	sarl	$6, %edx
	cmpl	$2, %edx
	jne	.L2775
	sall	$6, %ebx
	andl	$63, %eax
	addl	$1, %ebp
	orl	%eax, %ebx
	cmpl	%ebp, %r12d
	je	.L2768
.L2776:
	movq	stdin(%rip), %rdi
	call	_IO_getc@PLT
	cmpl	$-1, %eax
	jne	.L2794
.L2772:
	xorl	%ebx, %ebx
	movl	%ebx, %eax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L2778:
	.cfi_restore_state
	movl	$7, %edx
	movl	$5, %edi
	movl	$6, %ecx
	movl	$4, %esi
	jmp	.L2769
	.p2align 4,,10
	.p2align 3
.L2771:
	testl	%ebx, %ebx
	js	.L2772
	testl	%ecx, %ecx
	movl	%ecx, %edx
	jne	.L2773
.L2768:
	movl	%ebx, %eax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L2775:
	.cfi_restore_state
	movl	$-1, %ebx
	movl	%ebx, %eax
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE363:
	.size	utf8_getchar, .-utf8_getchar
	.section	.text.generate_strings,"ax",@progbits
	.p2align 4,,15
	.globl	generate_strings
	.type	generate_strings, @function
generate_strings:
.LFB364:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	%edi, %r14d
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	%esi, %edi
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	sall	$4, %edi
	movl	%esi, %ebx
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	call	v_malloc
	cmpl	$1, %ebx
	movq	%rax, 40(%rsp)
	jle	.L2795
	leal	1(%r14), %eax
	testl	%eax, %eax
	jle	.L2809
	cltq
	movslq	%r14d, %rdi
	movq	%rax, 16(%rsp)
	leal	-2(%rbx), %eax
	movq	%rdi, 8(%rsp)
	movq	40(%rsp), %rdi
	shrl	%eax
	salq	$5, %rax
	leaq	32(%rdi,%rax), %rax
	movq	%rdi, %r13
	movq	%rax, 32(%rsp)
	leal	-1(%r14), %eax
	movl	%eax, 28(%rsp)
	.p2align 4,,10
	.p2align 3
.L2803:
	movq	16(%rsp), %rdi
	movl	$1, %esi
	call	calloc@PLT
	testl	%r14d, %r14d
	movq	%rax, %rbx
	jle	.L2798
	movq	%rax, %r15
	movl	28(%rsp), %eax
	movl	$1374389535, %ebp
	leaq	1(%rbx,%rax), %r12
	.p2align 4,,10
	.p2align 3
.L2799:
	call	rand@PLT
	movl	%eax, %ecx
	addq	$1, %r15
	imull	%ebp
	movl	%ecx, %eax
	sarl	$31, %eax
	sarl	$3, %edx
	subl	%eax, %edx
	leal	(%rdx,%rdx,4), %eax
	leal	(%rax,%rax,4), %eax
	subl	%eax, %ecx
	addl	$97, %ecx
	movb	%cl, -1(%r15)
	cmpq	%r15, %r12
	jne	.L2799
.L2798:
	movq	8(%rsp), %rax
	testq	%rbx, %rbx
	movb	$0, (%rbx,%rax)
	je	.L2810
	movq	%rbx, %rdx
.L2801:
	movl	(%rdx), %ecx
	addq	$4, %rdx
	leal	-16843009(%rcx), %eax
	notl	%ecx
	andl	%ecx, %eax
	andl	$-2139062144, %eax
	je	.L2801
	movl	%eax, %ecx
	movq	%rbx, 0(%r13)
	movq	%rbx, 16(%r13)
	shrl	$16, %ecx
	testl	$32896, %eax
	cmove	%ecx, %eax
	leaq	2(%rdx), %rcx
	movl	%eax, %esi
	cmove	%rcx, %rdx
	addb	%al, %sil
	sbbq	$3, %rdx
	addq	$32, %r13
	subq	%rbx, %rdx
	movl	%edx, -24(%r13)
	movl	%edx, -8(%r13)
	cmpq	32(%rsp), %r13
	jne	.L2803
.L2795:
	movq	40(%rsp), %rax
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L2809:
	.cfi_restore_state
	call	vcalloc.part.5
.L2810:
	leaq	.LC63(%rip), %rdi
	movl	$16, %esi
	call	v_panic
	.cfi_endproc
.LFE364:
	.size	generate_strings, .-generate_strings
	.section	.text.fast_string_eq,"ax",@progbits
	.p2align 4,,15
	.globl	fast_string_eq
	.type	fast_string_eq, @function
fast_string_eq:
.LFB365:
	.cfi_startproc
	cmpl	%ecx, %esi
	je	.L2819
	xorl	%eax, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L2819:
	movq	%rdx, %rcx
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movslq	%esi, %rdx
	movq	%rcx, %rsi
	call	memcmp@PLT
	testl	%eax, %eax
	sete	%al
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	movzbl	%al, %eax
	ret
	.cfi_endproc
.LFE365:
	.size	fast_string_eq, .-fast_string_eq
	.section	.text.fast_string_eq2,"ax",@progbits
	.p2align 4,,15
	.globl	fast_string_eq2
	.type	fast_string_eq2, @function
fast_string_eq2:
.LFB366:
	.cfi_startproc
	cmpl	%ecx, %esi
	je	.L2828
	xorl	%eax, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L2828:
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movq	%rdx, %rsi
	call	strcmp@PLT
	testl	%eax, %eax
	sete	%al
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	movzbl	%al, %eax
	ret
	.cfi_endproc
.LFE366:
	.size	fast_string_eq2, .-fast_string_eq2
	.section	.text.strings__new_builder,"ax",@progbits
	.p2align 4,,15
	.globl	strings__new_builder
	.type	strings__new_builder, @function
strings__new_builder:
.LFB368:
	.cfi_startproc
	cmpl	$0, %esi
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movl	%esi, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rdi, %rbx
	je	.L2832
	jle	.L2831
	movslq	%esi, %rdi
	movl	%esi, %r12d
	jmp	.L2830
	.p2align 4,,10
	.p2align 3
.L2832:
	movl	$1, %edi
	movl	$1, %r12d
.L2830:
	movl	$1, %esi
	call	calloc@PLT
	movl	%r12d, 12(%rbx)
	movq	%rax, (%rbx)
	movq	%rbx, %rax
	movl	%ebp, 28(%rbx)
	movl	$0, 8(%rbx)
	movl	$1, 16(%rbx)
	movl	$0, 24(%rbx)
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L2831:
	.cfi_restore_state
	call	vcalloc.part.5
	.cfi_endproc
.LFE368:
	.size	strings__new_builder, .-strings__new_builder
	.section	.text.strings__Builder_write_bytes,"ax",@progbits
	.p2align 4,,15
	.globl	strings__Builder_write_bytes
	.type	strings__Builder_write_bytes, @function
strings__Builder_write_bytes:
.LFB369:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbx
	movl	%edx, %ebp
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	call	array_push_many
	addl	%ebp, 24(%rbx)
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE369:
	.size	strings__Builder_write_bytes, .-strings__Builder_write_bytes
	.section	.text.strings__Builder_write_b,"ax",@progbits
	.p2align 4,,15
	.globl	strings__Builder_write_b
	.type	strings__Builder_write_b, @function
strings__Builder_write_b:
.LFB370:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	movb	%sil, 7(%rsp)
	leaq	7(%rsp), %rsi
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	call	array_push
	addl	$1, 24(%rbx)
	movq	8(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L2839
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
.L2839:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE370:
	.size	strings__Builder_write_b, .-strings__Builder_write_b
	.section	.text.strings__Builder_write,"ax",@progbits
	.p2align 4,,15
	.globl	strings__Builder_write
	.type	strings__Builder_write, @function
strings__Builder_write:
.LFB371:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	xorl	%ecx, %ecx
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rdx, %rbx
	leaq	.LC37(%rip), %rdx
	movq	%rdi, %r12
	movq	%rsi, %rbp
	movq	%rsi, %rdi
	movq	%rbx, %rsi
	call	string_eq
	testl	%eax, %eax
	jne	.L2840
	movl	%ebx, %edx
	movq	%rbp, %rsi
	movq	%r12, %rdi
	call	array_push_many
	addl	%ebx, 24(%r12)
.L2840:
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE371:
	.size	strings__Builder_write, .-strings__Builder_write
	.section	.text.strings__Builder_go_back,"ax",@progbits
	.p2align 4,,15
	.globl	strings__Builder_go_back
	.type	strings__Builder_go_back, @function
strings__Builder_go_back:
.LFB372:
	.cfi_startproc
	movl	8(%rdi), %eax
	movl	%eax, %edx
	subl	%esi, %edx
	cmpl	%edx, %eax
	jle	.L2844
	movl	%edx, 8(%rdi)
.L2844:
	subl	%esi, 24(%rdi)
	ret
	.cfi_endproc
.LFE372:
	.size	strings__Builder_go_back, .-strings__Builder_go_back
	.section	.text.strings__Builder_writeln,"ax",@progbits
	.p2align 4,,15
	.globl	strings__Builder_writeln
	.type	strings__Builder_writeln, @function
strings__Builder_writeln:
.LFB373:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdx, %rbp
	movq	%rdi, %rbx
	addl	$1, %ebp
	subq	$24, %rsp
	.cfi_def_cfa_offset 48
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	call	array_push_many
	leaq	7(%rsp), %rsi
	movq	%rbx, %rdi
	movb	$10, 7(%rsp)
	call	array_push
	addl	%ebp, 24(%rbx)
	movq	8(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L2848
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L2848:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE373:
	.size	strings__Builder_writeln, .-strings__Builder_writeln
	.section	.text.strings__Builder_last_n,"ax",@progbits
	.p2align 4,,15
	.globl	strings__Builder_last_n
	.type	strings__Builder_last_n, @function
strings__Builder_last_n:
.LFB374:
	.cfi_startproc
	movl	24(%rdi), %eax
	cmpl	%esi, %eax
	jge	.L2850
	leaq	.LC37(%rip), %rax
	xorl	%edx, %edx
	ret
	.p2align 4,,10
	.p2align 3
.L2850:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subl	%esi, %eax
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movl	8(%rdi), %edx
	movq	(%rdi), %rbx
	movl	16(%rdi), %edi
	cmpl	%eax, %edx
	jl	.L2864
	movl	%eax, %ecx
	subl	%eax, %edx
	imull	%edi, %ecx
	imull	%edi, %edx
	movslq	%ecx, %rcx
	addq	%rcx, %rbx
	cmpl	$0, %edx
	je	.L2857
	jle	.L2854
	movslq	%edx, %rdi
	movq	%rdi, %rbp
.L2853:
	movl	$1, %esi
	call	calloc@PLT
	movq	%rbp, %rdx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	call	memcpy@PLT
	movq	%rax, %r8
	movq	%rax, %rdx
.L2855:
	movl	(%rdx), %eax
	addq	$4, %rdx
	leal	-16843009(%rax), %ecx
	notl	%eax
	andl	%eax, %ecx
	andl	$-2139062144, %ecx
	je	.L2855
	movl	%ecx, %eax
	shrl	$16, %eax
	testl	$32896, %ecx
	cmove	%eax, %ecx
	leaq	2(%rdx), %rax
	cmove	%rax, %rdx
	movl	%ecx, %eax
	addb	%cl, %al
	movq	%r8, %rax
	sbbq	$3, %rdx
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	subl	%r8d, %edx
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L2857:
	.cfi_restore_state
	xorl	%ebp, %ebp
	movl	$1, %edi
	jmp	.L2853
.L2854:
	call	vcalloc.part.5
.L2864:
	leaq	.LC69(%rip), %rdi
	movl	%eax, %esi
	xorl	%eax, %eax
	call	_STR
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	v_panic
	.cfi_endproc
.LFE374:
	.size	strings__Builder_last_n, .-strings__Builder_last_n
	.section	.text.strings__Builder_after,"ax",@progbits
	.p2align 4,,15
	.globl	strings__Builder_after
	.type	strings__Builder_after, @function
strings__Builder_after:
.LFB375:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$56, %rsp
	.cfi_def_cfa_offset 96
	movq	%fs:40, %rax
	movq	%rax, 40(%rsp)
	xorl	%eax, %eax
	cmpl	%esi, 24(%rdi)
	jg	.L2866
	leaq	.LC37(%rip), %rax
	xorl	%edx, %edx
.L2867:
	movq	40(%rsp), %rcx
	xorq	%fs:40, %rcx
	jne	.L2876
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L2866:
	.cfi_restore_state
	movl	8(%rdi), %ebx
	movq	(%rdi), %rax
	movl	16(%rdi), %ebp
	cmpl	%esi, %ebx
	jl	.L2877
	testl	%esi, %esi
	js	.L2878
	subl	%esi, %ebx
	movl	%ebx, %edi
	imull	%ebp, %esi
	imull	%ebp, %edi
	movslq	%esi, %rsi
	cmpl	$0, %edi
	leaq	(%rax,%rsi), %r12
	je	.L2874
	jle	.L2871
	movslq	%edi, %rdi
	movq	%rdi, %r13
.L2870:
	movl	$1, %esi
	call	calloc@PLT
	movq	%r13, %rdx
	movq	%r12, %rsi
	movq	%rax, %rdi
	call	memcpy@PLT
	leaq	15(%rsp), %rsi
	leaq	16(%rsp), %rdi
	movl	%ebx, 24(%rsp)
	movl	%ebx, 28(%rsp)
	movq	%rax, 16(%rsp)
	movl	%ebp, 32(%rsp)
	movb	$0, 15(%rsp)
	call	array_push
	movq	16(%rsp), %rbx
	testq	%rbx, %rbx
	je	.L2879
	movq	%rbx, %rdi
	call	strlen@PLT
	movq	%rax, %rdx
	movq	%rbx, %rax
	movl	%edx, %edx
	jmp	.L2867
	.p2align 4,,10
	.p2align 3
.L2874:
	xorl	%r13d, %r13d
	movl	$1, %edi
	jmp	.L2870
.L2876:
	call	__stack_chk_fail@PLT
.L2879:
	call	tos2.part.8
.L2871:
	call	vcalloc.part.5
.L2877:
	leaq	.LC69(%rip), %rdi
	movl	%ebx, %edx
	xorl	%eax, %eax
	call	_STR
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	v_panic
.L2878:
	leaq	.LC71(%rip), %rdi
	xorl	%eax, %eax
	call	_STR
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	v_panic
	.cfi_endproc
.LFE375:
	.size	strings__Builder_after, .-strings__Builder_after
	.section	.text.strings__Builder_str,"ax",@progbits
	.p2align 4,,15
	.globl	strings__Builder_str
	.type	strings__Builder_str, @function
strings__Builder_str:
.LFB376:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdi, %rbx
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	leaq	7(%rsp), %rsi
	movb	$0, 7(%rsp)
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	call	array_push
	movq	(%rbx), %rax
	movl	24(%rbx), %edx
	testq	%rax, %rax
	je	.L2884
	movq	8(%rsp), %rcx
	xorq	%fs:40, %rcx
	jne	.L2885
	addq	$16, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
.L2884:
	.cfi_restore_state
	call	tos.part.7
.L2885:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE376:
	.size	strings__Builder_str, .-strings__Builder_str
	.section	.text.strings__Builder_free,"ax",@progbits
	.p2align 4,,15
	.globl	strings__Builder_free
	.type	strings__Builder_free, @function
strings__Builder_free:
.LFB377:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movq	(%rdi), %rdi
	call	free@PLT
	movl	28(%rbx), %ebp
	cmpl	$0, %ebp
	je	.L2889
	jle	.L2888
	movslq	%ebp, %rdi
	jmp	.L2887
	.p2align 4,,10
	.p2align 3
.L2889:
	movl	$1, %edi
	movl	$1, %ebp
.L2887:
	movl	$1, %esi
	call	calloc@PLT
	movl	%ebp, 12(%rbx)
	movq	%rax, (%rbx)
	movl	$0, 8(%rbx)
	movl	$1, 16(%rbx)
	movl	$0, 24(%rbx)
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L2888:
	.cfi_restore_state
	call	vcalloc.part.5
	.cfi_endproc
.LFE377:
	.size	strings__Builder_free, .-strings__Builder_free
	.section	.text.strings__levenshtein_distance,"ax",@progbits
	.p2align 4,,15
	.globl	strings__levenshtein_distance
	.type	strings__levenshtein_distance, @function
strings__levenshtein_distance:
.LFB378:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdi, %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdx, %r13
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rcx, %rbp
	movl	$1, %edx
	movq	%rsi, %r12
	movl	$1, %esi
	subq	$120, %rsp
	.cfi_def_cfa_offset 176
	leaq	64(%rsp), %rdi
	leaq	92(%rsp), %r8
	movl	%ecx, 24(%rsp)
	movl	$4, %ecx
	movl	$0, 92(%rsp)
	leaq	32(%rsp), %rbx
	movq	%fs:40, %rax
	movq	%rax, 104(%rsp)
	xorl	%eax, %eax
	call	new_array_from_c_array
	subq	$8, %rsp
	.cfi_def_cfa_offset 184
	leal	1(%rbp), %esi
	movq	%rbx, %rdi
	pushq	88(%rsp)
	.cfi_def_cfa_offset 192
	pushq	88(%rsp)
	.cfi_def_cfa_offset 200
	pushq	88(%rsp)
	.cfi_def_cfa_offset 208
	call	array_repeat
	movl	72(%rsp), %edi
	addq	$32, %rsp
	.cfi_def_cfa_offset 176
	testl	%edi, %edi
	jle	.L2892
	leaq	96(%rsp), %rbp
	xorl	%r15d, %r15d
	.p2align 4,,10
	.p2align 3
.L2893:
	movl	%r15d, %esi
	movq	%rbx, %rdi
	movq	%rbp, %rdx
	movl	%r15d, 96(%rsp)
	addl	$1, %r15d
	call	array_set
	movl	40(%rsp), %edi
	cmpl	%r15d, %edi
	jg	.L2893
	testl	%r12d, %r12d
	jle	.L2894
	testl	%edi, %edi
	movzbl	(%r14), %ebp
	movq	32(%rsp), %rcx
	jle	.L2895
	leaq	1(%r14), %rdi
	leal	-1(%r12), %eax
	addq	%rdi, %rax
	movq	%rdi, 8(%rsp)
	movq	%rax, 16(%rsp)
	movl	24(%rsp), %eax
	subl	$1, %eax
	movl	%eax, 28(%rsp)
	leaq	100(%rsp), %rax
	movq	%rax, (%rsp)
	.p2align 4,,10
	.p2align 3
.L2897:
	movl	24(%rsp), %edx
	movl	(%rcx), %eax
	addl	$1, (%rcx)
	testl	%edx, %edx
	jle	.L2910
	movl	40(%rsp), %r9d
	movzbl	0(%r13), %r10d
	movq	32(%rsp), %rsi
	movslq	48(%rsp), %rdx
	testl	%r9d, %r9d
	jle	.L2921
	movl	28(%rsp), %r12d
	xorl	%ebx, %ebx
	jmp	.L2902
	.p2align 4,,10
	.p2align 3
.L2922:
	movl	(%rsi,%r11), %r14d
	cmpb	%r10b, %bpl
	leal	1(%r14), %ecx
	je	.L2907
.L2924:
	addl	$1, %eax
	cmpl	%ecx, %eax
	cmovle	%eax, %ecx
.L2908:
	movq	(%rsp), %rsi
	movl	%ecx, 100(%rsp)
	call	memcpy@PLT
	cmpq	%rbx, %r12
	je	.L2910
	movl	40(%rsp), %r9d
	movzbl	1(%r13,%rbx), %r10d
	addq	$1, %rbx
	movq	32(%rsp), %rsi
	movslq	48(%rsp), %rdx
	movl	%r14d, %eax
	cmpl	%r9d, %r15d
	jge	.L2900
.L2902:
	movl	%edx, %ecx
	leal	1(%rbx), %r15d
	movl	%ebx, %r8d
	imull	%ebx, %ecx
	cmpl	%r9d, %r15d
	movslq	%ecx, %rcx
	movl	(%rsi,%rcx), %ecx
	jge	.L2900
	movl	%r15d, %r11d
	imull	%edx, %r11d
	movslq	%r11d, %r11
	leaq	(%rsi,%r11), %rdi
	cmpl	(%rdi), %ecx
	jge	.L2922
	cmpl	%r9d, %ebx
	jge	.L2923
	imull	%edx, %r8d
	cmpb	%r10b, %bpl
	movl	(%rsi,%r11), %r14d
	movslq	%r8d, %r8
	movl	(%rsi,%r8), %r8d
	leal	1(%r8), %ecx
	jne	.L2924
.L2907:
	cmpl	%eax, %ecx
	cmovg	%eax, %ecx
	jmp	.L2908
	.p2align 4,,10
	.p2align 3
.L2910:
	movq	8(%rsp), %rsi
	cmpq	%rsi, 16(%rsp)
	movl	40(%rsp), %edi
	je	.L2894
	movq	%rsi, %rax
	movzbl	(%rsi), %ebp
	movq	32(%rsp), %rcx
	addq	$1, %rax
	testl	%edi, %edi
	movq	%rax, 8(%rsp)
	jg	.L2897
.L2895:
	movl	%edi, %edx
	xorl	%esi, %esi
.L2920:
	leaq	.LC68(%rip), %rdi
	xorl	%eax, %eax
	call	_STR
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	v_panic
.L2892:
	testl	%r12d, %r12d
	jg	.L2895
	.p2align 4,,10
	.p2align 3
.L2894:
	subq	$8, %rsp
	.cfi_def_cfa_offset 184
	subl	$1, %edi
	pushq	56(%rsp)
	.cfi_def_cfa_offset 192
	pushq	56(%rsp)
	.cfi_def_cfa_offset 200
	pushq	56(%rsp)
	.cfi_def_cfa_offset 208
	call	array_get
	addq	$32, %rsp
	.cfi_def_cfa_offset 176
	movl	(%rax), %eax
	movq	104(%rsp), %rdi
	xorq	%fs:40, %rdi
	jne	.L2925
	addq	$120, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L2921:
	.cfi_restore_state
	xorl	%r15d, %r15d
.L2900:
	movl	%r9d, %edx
	movl	%r15d, %esi
	jmp	.L2920
.L2923:
	movl	%r9d, %edx
	movl	%ebx, %esi
	jmp	.L2920
.L2925:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE378:
	.size	strings__levenshtein_distance, .-strings__levenshtein_distance
	.section	.text.strings__levenshtein_distance_percentage,"ax",@progbits
	.p2align 4,,15
	.globl	strings__levenshtein_distance_percentage
	.type	strings__levenshtein_distance_percentage, @function
strings__levenshtein_distance_percentage:
.LFB379:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rsi, %rbp
	movq	%rcx, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	call	strings__levenshtein_distance
	pxor	%xmm1, %xmm1
	cmpl	%ebp, %ebx
	pxor	%xmm0, %xmm0
	cmovle	%ebp, %ebx
	cvtsi2ss	%eax, %xmm1
	cvtsi2ss	%ebx, %xmm0
	divss	%xmm0, %xmm1
	movsd	.LC101(%rip), %xmm0
	cvtss2sd	%xmm1, %xmm1
	subsd	%xmm1, %xmm0
	mulsd	.LC102(%rip), %xmm0
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	cvtsd2ss	%xmm0, %xmm0
	ret
	.cfi_endproc
.LFE379:
	.size	strings__levenshtein_distance_percentage, .-strings__levenshtein_distance_percentage
	.section	.text.strings__dice_coefficient,"ax",@progbits
	.p2align 4,,15
	.globl	strings__dice_coefficient
	.type	strings__dice_coefficient, @function
strings__dice_coefficient:
.LFB380:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$152, %rsp
	.cfi_def_cfa_offset 208
	movq	%fs:40, %rax
	movq	%rax, 136(%rsp)
	xorl	%eax, %eax
	testl	%ecx, %ecx
	je	.L2932
	testl	%esi, %esi
	movq	%rsi, %r14
	jne	.L2929
.L2932:
	pxor	%xmm0, %xmm0
.L2928:
	movq	136(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L2951
	addq	$152, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L2929:
	.cfi_restore_state
	movq	%rdi, %r12
	movq	%rdx, %r13
	movq	%rcx, %r15
	movl	%esi, %ebx
	call	string_eq
	testl	%eax, %eax
	movss	.LC103(%rip), %xmm0
	jne	.L2928
	cmpl	$1, %r15d
	jle	.L2932
	cmpl	$1, %r14d
	jle	.L2932
	cmpl	%r14d, %r15d
	jge	.L2933
	movq	%r12, 8(%rsp)
	movq	%r14, %rbp
	movl	%r14d, 52(%rsp)
	movq	%r12, %rdi
.L2934:
	movl	52(%rsp), %esi
	movabsq	$-4294967296, %rax
	movq	%r12, %rdx
	andq	%rax, %rbp
	movq	%r14, %rcx
	orq	%rsi, %rbp
	movq	%rsi, 40(%rsp)
	movq	%rbp, %rsi
	call	string_eq
	testl	%eax, %eax
	je	.L2935
	movq	%r13, 24(%rsp)
	movq	%r15, %r14
	movl	%r15d, %ebx
.L2936:
	leaq	64(%rsp), %rdi
	movl	$4, %edx
	movl	$1, %esi
	xorl	%r15d, %r15d
	movq	%rdi, 16(%rsp)
	call	new_map
	movl	52(%rsp), %eax
	subl	$1, %eax
	movl	%eax, 48(%rsp)
	leaq	124(%rsp), %rax
	movq	%rax, 32(%rsp)
	leaq	120(%rsp), %rax
	movq	%rax, 56(%rsp)
	jmp	.L2942
	.p2align 4,,10
	.p2align 3
.L2937:
	movl	$1, 124(%rsp)
.L2950:
	movq	32(%rsp), %rcx
	movq	16(%rsp), %rdi
	movq	%r13, %rsi
	movq	%r12, %rdx
	addl	$1, %r15d
	call	map_set
	cmpl	48(%rsp), %r15d
	je	.L2952
.L2942:
	movabsq	$-4294967296, %rax
	movq	8(%rsp), %rdi
	leal	2(%r15), %ecx
	andq	%rax, %rbp
	orq	40(%rsp), %rbp
	movl	%r15d, %edx
	movq	%rbp, %rsi
	call	string_substr
	subq	$8, %rsp
	.cfi_def_cfa_offset 216
	movq	%rax, %rdi
	movq	%rdx, %rsi
	pushq	120(%rsp)
	.cfi_def_cfa_offset 224
	pushq	120(%rsp)
	.cfi_def_cfa_offset 232
	movq	%rax, %r13
	pushq	120(%rsp)
	.cfi_def_cfa_offset 240
	pushq	120(%rsp)
	.cfi_def_cfa_offset 248
	movq	%rdx, %r12
	pushq	120(%rsp)
	.cfi_def_cfa_offset 256
	pushq	120(%rsp)
	.cfi_def_cfa_offset 264
	pushq	120(%rsp)
	.cfi_def_cfa_offset 272
	call	map_exists
	addq	$64, %rsp
	.cfi_def_cfa_offset 208
	testl	%eax, %eax
	je	.L2937
	movl	$0, 120(%rsp)
	subq	$8, %rsp
	.cfi_def_cfa_offset 216
	movq	%r13, %rdi
	pushq	120(%rsp)
	.cfi_def_cfa_offset 224
	pushq	120(%rsp)
	.cfi_def_cfa_offset 232
	movq	%r12, %rsi
	pushq	120(%rsp)
	.cfi_def_cfa_offset 240
	pushq	120(%rsp)
	.cfi_def_cfa_offset 248
	pushq	120(%rsp)
	.cfi_def_cfa_offset 256
	pushq	120(%rsp)
	.cfi_def_cfa_offset 264
	pushq	120(%rsp)
	.cfi_def_cfa_offset 272
	movq	120(%rsp), %rdx
	call	map_get3
	movl	(%rax), %eax
	addl	$1, %eax
	movl	%eax, 188(%rsp)
	addq	$64, %rsp
	.cfi_def_cfa_offset 208
	jmp	.L2950
	.p2align 4,,10
	.p2align 3
.L2952:
	leaq	128(%rsp), %rdi
	xorl	%r13d, %r13d
	movl	%ebx, %eax
	leal	-1(%rbx), %r15d
	movl	%ebx, 32(%rsp)
	movl	$0, 48(%rsp)
	movq	%rdi, 8(%rsp)
	leaq	132(%rsp), %rdi
	movl	%r13d, %ebx
	movq	%rax, %r13
	movq	%rdi, 40(%rsp)
	jmp	.L2941
	.p2align 4,,10
	.p2align 3
.L2940:
	addl	$1, %ebx
	cmpl	%ebx, %r15d
	je	.L2953
.L2941:
	movabsq	$-4294967296, %rax
	movq	24(%rsp), %rdi
	leal	2(%rbx), %ecx
	andq	%rax, %r14
	movl	%ebx, %edx
	orq	%r13, %r14
	movq	%r14, %rsi
	call	string_substr
	subq	$8, %rsp
	.cfi_def_cfa_offset 216
	movq	%rax, %rdi
	movq	%rdx, %rsi
	pushq	120(%rsp)
	.cfi_def_cfa_offset 224
	pushq	120(%rsp)
	.cfi_def_cfa_offset 232
	movq	%rax, %r12
	pushq	120(%rsp)
	.cfi_def_cfa_offset 240
	pushq	120(%rsp)
	.cfi_def_cfa_offset 248
	movq	%rdx, %rbp
	pushq	120(%rsp)
	.cfi_def_cfa_offset 256
	pushq	120(%rsp)
	.cfi_def_cfa_offset 264
	pushq	120(%rsp)
	.cfi_def_cfa_offset 272
	call	map_exists
	addq	$64, %rsp
	.cfi_def_cfa_offset 208
	testl	%eax, %eax
	je	.L2940
	movl	$0, 128(%rsp)
	subq	$8, %rsp
	.cfi_def_cfa_offset 216
	movq	%r12, %rdi
	pushq	120(%rsp)
	.cfi_def_cfa_offset 224
	pushq	120(%rsp)
	.cfi_def_cfa_offset 232
	movq	%rbp, %rsi
	pushq	120(%rsp)
	.cfi_def_cfa_offset 240
	pushq	120(%rsp)
	.cfi_def_cfa_offset 248
	pushq	120(%rsp)
	.cfi_def_cfa_offset 256
	pushq	120(%rsp)
	.cfi_def_cfa_offset 264
	pushq	120(%rsp)
	.cfi_def_cfa_offset 272
	movq	72(%rsp), %rdx
	call	map_get3
	movl	(%rax), %eax
	addq	$64, %rsp
	.cfi_def_cfa_offset 208
	testl	%eax, %eax
	jle	.L2940
	movq	40(%rsp), %rcx
	movq	16(%rsp), %rdi
	subl	$1, %eax
	movq	%r12, %rsi
	movq	%rbp, %rdx
	movl	%eax, 132(%rsp)
	call	map_set
	addl	$1, 48(%rsp)
	jmp	.L2940
	.p2align 4,,10
	.p2align 3
.L2953:
	movl	32(%rsp), %ebx
	pxor	%xmm2, %xmm2
	pxor	%xmm1, %xmm1
	pxor	%xmm0, %xmm0
	cvtsi2ss	%ebx, %xmm2
	cvtsi2ss	52(%rsp), %xmm1
	cvtsi2sd	48(%rsp), %xmm0
	addsd	%xmm0, %xmm0
	addss	%xmm2, %xmm1
	subss	.LC104(%rip), %xmm1
	cvtss2sd	%xmm1, %xmm1
	divsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	jmp	.L2928
	.p2align 4,,10
	.p2align 3
.L2935:
	movq	%r12, 24(%rsp)
	jmp	.L2936
	.p2align 4,,10
	.p2align 3
.L2933:
	movq	%r13, 8(%rsp)
	movq	%r15, %rbp
	movl	%r15d, 52(%rsp)
	movq	%r13, %rdi
	jmp	.L2934
.L2951:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE380:
	.size	strings__dice_coefficient, .-strings__dice_coefficient
	.section	.text.strings__repeat,"ax",@progbits
	.p2align 4,,15
	.globl	strings__repeat
	.type	strings__repeat, @function
strings__repeat:
.LFB381:
	.cfi_startproc
	testl	%esi, %esi
	jle	.L2960
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movslq	%esi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movl	%edi, %ebx
	leal	1(%r12), %edi
	call	v_malloc
	movq	%r12, %rdx
	movzbl	%bl, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movl	%r12d, %edx
	movb	$48, (%rax,%r12)
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L2960:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	leaq	.LC37(%rip), %rax
	xorl	%edx, %edx
	ret
	.cfi_endproc
.LFE381:
	.size	strings__repeat, .-strings__repeat
	.section	.text.strings__repeat_string,"ax",@progbits
	.p2align 4,,15
	.globl	strings__repeat_string
	.type	strings__repeat_string, @function
strings__repeat_string:
.LFB382:
	.cfi_startproc
	testl	%esi, %esi
	je	.L2993
	testl	%edx, %edx
	jg	.L2962
.L2993:
	leaq	.LC37(%rip), %rax
	xorl	%edx, %edx
	ret
	.p2align 4,,10
	.p2align 3
.L2962:
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	movl	%esi, %ebp
	subq	$72, %rsp
	.cfi_def_cfa_offset 128
	movl	%edx, 12(%rsp)
	imull	%esi, %edx
	leal	1(%rdx), %edi
	movl	%edx, 52(%rsp)
	call	v_malloc
	testl	%ebp, %ebp
	jle	.L2965
	movq	%rbx, %rdx
	leal	-1(%rbp), %ecx
	movslq	%ebp, %rdi
	negq	%rdx
	movq	%rdi, 24(%rsp)
	movl	%ebp, %r14d
	movl	%edx, %r9d
	andl	$15, %edx
	movq	%rax, %rdi
	andl	$15, %r9d
	movl	%ecx, 32(%rsp)
	movl	$1, %r8d
	leal	15(%r9), %esi
	movl	%r9d, %r11d
	xorl	%r13d, %r13d
	addq	%rbx, %r11
	movq	%rdx, 40(%rsp)
	movl	%esi, 36(%rsp)
	movl	%ebp, %esi
	subl	%r9d, %esi
	movl	%esi, %r12d
	movl	%esi, 48(%rsp)
	andl	$-16, %esi
	movl	%esi, %r15d
	leaq	16(%rbx), %rsi
	shrl	$4, %r12d
	movq	%rsi, 16(%rsp)
	leaq	1(%rcx), %rsi
	movq	%rsi, 56(%rsp)
	.p2align 4,,10
	.p2align 3
.L2975:
	cmpq	16(%rsp), %rdi
	leaq	16(%rdi), %rdx
	setnb	%cl
	cmpq	%rdx, %rbx
	setnb	%dl
	orb	%dl, %cl
	je	.L2966
	cmpl	$22, %r14d
	jbe	.L2966
	movl	36(%rsp), %ecx
	cmpl	%ecx, 32(%rsp)
	jb	.L2977
	testl	%r9d, %r9d
	je	.L2978
	movzbl	(%rbx), %edx
	cmpl	$1, %r9d
	movb	%dl, (%rdi)
	je	.L2979
	movzbl	1(%rbx), %ecx
	movslq	%r8d, %rdx
	cmpl	$2, %r9d
	movb	%cl, (%rax,%rdx)
	je	.L2980
	movzbl	2(%rbx), %ecx
	leal	1(%r8), %edx
	cmpl	$3, %r9d
	movslq	%edx, %rdx
	movb	%cl, (%rax,%rdx)
	je	.L2981
	movzbl	3(%rbx), %ecx
	leal	2(%r8), %edx
	cmpl	$4, %r9d
	movslq	%edx, %rdx
	movb	%cl, (%rax,%rdx)
	je	.L2982
	movzbl	4(%rbx), %ecx
	leal	3(%r8), %edx
	cmpl	$5, %r9d
	movslq	%edx, %rdx
	movb	%cl, (%rax,%rdx)
	je	.L2983
	movzbl	5(%rbx), %ecx
	leal	4(%r8), %edx
	cmpl	$6, %r9d
	movslq	%edx, %rdx
	movb	%cl, (%rax,%rdx)
	je	.L2984
	movzbl	6(%rbx), %ecx
	leal	5(%r8), %edx
	cmpl	$7, %r9d
	movslq	%edx, %rdx
	movb	%cl, (%rax,%rdx)
	je	.L2985
	movzbl	7(%rbx), %ecx
	leal	6(%r8), %edx
	cmpl	$8, %r9d
	movslq	%edx, %rdx
	movb	%cl, (%rax,%rdx)
	je	.L2986
	movzbl	8(%rbx), %ecx
	leal	7(%r8), %edx
	cmpl	$9, %r9d
	movslq	%edx, %rdx
	movb	%cl, (%rax,%rdx)
	je	.L2987
	movzbl	9(%rbx), %ecx
	leal	8(%r8), %edx
	cmpl	$10, %r9d
	movslq	%edx, %rdx
	movb	%cl, (%rax,%rdx)
	je	.L2988
	movzbl	10(%rbx), %ecx
	leal	9(%r8), %edx
	cmpl	$11, %r9d
	movslq	%edx, %rdx
	movb	%cl, (%rax,%rdx)
	je	.L2989
	movzbl	11(%rbx), %ecx
	leal	10(%r8), %edx
	cmpl	$12, %r9d
	movslq	%edx, %rdx
	movb	%cl, (%rax,%rdx)
	je	.L2990
	movzbl	12(%rbx), %ecx
	leal	11(%r8), %edx
	cmpl	$13, %r9d
	movslq	%edx, %rdx
	movb	%cl, (%rax,%rdx)
	je	.L2991
	movzbl	13(%rbx), %ecx
	leal	12(%r8), %edx
	cmpl	$15, %r9d
	movslq	%edx, %rdx
	movb	%cl, (%rax,%rdx)
	jne	.L2992
	movzbl	14(%rbx), %ecx
	leal	13(%r8), %edx
	movslq	%edx, %rdx
	movb	%cl, (%rax,%rdx)
	movl	$15, %edx
	.p2align 4,,10
	.p2align 3
.L2968:
	movq	40(%rsp), %rsi
	xorl	%ecx, %ecx
	leaq	(%rsi,%rdi), %r10
	xorl	%esi, %esi
	.p2align 4,,10
	.p2align 3
.L2970:
	movdqa	(%r11,%rcx), %xmm0
	addl	$1, %esi
	movups	%xmm0, (%r10,%rcx)
	addq	$16, %rcx
	cmpl	%esi, %r12d
	ja	.L2970
	addl	%r15d, %edx
	cmpl	%r15d, 48(%rsp)
	je	.L2974
.L2967:
	movslq	%edx, %rdx
	.p2align 4,,10
	.p2align 3
.L2972:
	movzbl	(%rbx,%rdx), %ecx
	movb	%cl, (%rdi,%rdx)
	addq	$1, %rdx
	cmpl	%edx, %ebp
	jg	.L2972
.L2974:
	addl	$1, %r13d
	addq	24(%rsp), %rdi
	addl	%r14d, %r8d
	cmpl	%r13d, 12(%rsp)
	jg	.L2975
.L2965:
	movslq	52(%rsp), %rdx
	testq	%rax, %rax
	movb	$48, (%rax,%rdx)
	je	.L3007
	movl	52(%rsp), %edx
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L2966:
	.cfi_restore_state
	movq	56(%rsp), %rsi
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L2973:
	movzbl	(%rbx,%rdx), %ecx
	movb	%cl, (%rdi,%rdx)
	addq	$1, %rdx
	cmpq	%rsi, %rdx
	jne	.L2973
	jmp	.L2974
	.p2align 4,,10
	.p2align 3
.L2979:
	movl	$1, %edx
	jmp	.L2968
	.p2align 4,,10
	.p2align 3
.L2980:
	movl	$2, %edx
	jmp	.L2968
	.p2align 4,,10
	.p2align 3
.L2977:
	xorl	%edx, %edx
	jmp	.L2967
	.p2align 4,,10
	.p2align 3
.L2981:
	movl	$3, %edx
	jmp	.L2968
	.p2align 4,,10
	.p2align 3
.L2982:
	movl	$4, %edx
	jmp	.L2968
	.p2align 4,,10
	.p2align 3
.L2983:
	movl	$5, %edx
	jmp	.L2968
.L2984:
	movl	$6, %edx
	jmp	.L2968
.L2978:
	xorl	%edx, %edx
	jmp	.L2968
.L2987:
	movl	$9, %edx
	jmp	.L2968
.L2985:
	movl	$7, %edx
	jmp	.L2968
.L2986:
	movl	$8, %edx
	jmp	.L2968
.L2988:
	movl	$10, %edx
	jmp	.L2968
.L2989:
	movl	$11, %edx
	jmp	.L2968
.L2990:
	movl	$12, %edx
	jmp	.L2968
.L2991:
	movl	$13, %edx
	jmp	.L2968
.L2992:
	movl	$14, %edx
	jmp	.L2968
.L3007:
	call	tos.part.7
	.cfi_endproc
.LFE382:
	.size	strings__repeat_string, .-strings__repeat_string
	.section	.rodata.str1.1
.LC105:
	.string	"too big"
	.section	.text.strconv__ftoa__Dec32_get_string_32,"ax",@progbits
	.p2align 4,,15
	.globl	strconv__ftoa__Dec32_get_string_32
	.type	strconv__ftoa__Dec32_get_string_32, @function
strconv__ftoa__Dec32_get_string_32:
.LFB383:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$120, %rsp
	.cfi_def_cfa_offset 176
	movq	%fs:40, %rax
	movq	%rax, 104(%rsp)
	xorl	%eax, %eax
	cmpl	$999999999, %edi
	ja	.L3040
	cmpl	$99999999, %edi
	movq	%rdi, %r12
	movl	%esi, %r14d
	leal	1(%rdx), %r13d
	movl	%edi, %r9d
	ja	.L3024
	cmpl	$9999999, %edi
	ja	.L3025
	cmpl	$999999, %edi
	ja	.L3026
	cmpl	$99999, %edi
	ja	.L3027
	cmpl	$9999, %edi
	ja	.L3028
	cmpl	$999, %edi
	ja	.L3029
	cmpl	$99, %edi
	ja	.L3030
	cmpl	$9, %edi
	ja	.L3041
	movl	%edi, 16(%rsp)
	leaq	93(%rsp), %r8
	leaq	64(%rsp), %rdi
	movl	$1, %ecx
	movl	$1, %edx
	movl	$1, %esi
	movb	$0, 93(%rsp)
	leaq	32(%rsp), %rbp
	call	new_array_from_c_array
	subq	$8, %rsp
	.cfi_def_cfa_offset 184
	movl	$8, %esi
	movq	%rbp, %rdi
	pushq	88(%rsp)
	.cfi_def_cfa_offset 192
	pushq	88(%rsp)
	.cfi_def_cfa_offset 200
	pushq	88(%rsp)
	.cfi_def_cfa_offset 208
	call	array_repeat
	addq	$32, %rsp
	.cfi_def_cfa_offset 176
	testl	%r14d, %r14d
	movl	16(%rsp), %r9d
	jne	.L3035
	movl	$1, %r15d
	movl	$1, 20(%rsp)
	xorl	%ebx, %ebx
	movl	$1, %r14d
	jmp	.L3022
	.p2align 4,,10
	.p2align 3
.L3025:
	movl	$15, %ebx
	movl	$8, 20(%rsp)
.L3010:
	leaq	64(%rsp), %rdi
	leaq	93(%rsp), %r8
	movl	$1, %ecx
	movl	$1, %edx
	movl	$1, %esi
	movl	%r9d, 16(%rsp)
	movb	$0, 93(%rsp)
	leaq	32(%rsp), %rbp
	call	new_array_from_c_array
	subq	$8, %rsp
	.cfi_def_cfa_offset 184
	movl	%ebx, %esi
	movq	%rbp, %rdi
	pushq	88(%rsp)
	.cfi_def_cfa_offset 192
	pushq	88(%rsp)
	.cfi_def_cfa_offset 200
	pushq	88(%rsp)
	.cfi_def_cfa_offset 208
	call	array_repeat
	addq	$32, %rsp
	.cfi_def_cfa_offset 176
	testl	%r14d, %r14d
	movl	16(%rsp), %r9d
	jne	.L3034
	movl	$1, %r15d
	xorl	%ebx, %ebx
.L3022:
	cmpl	20(%rsp), %r13d
	jl	.L3042
	movl	20(%rsp), %r13d
.L3012:
	movl	%r13d, %ecx
	leal	0(%r13,%rbx), %eax
	subl	%r14d, %ecx
	cmpl	$1, %ecx
	movl	%eax, 24(%rsp)
	movl	%ecx, 28(%rsp)
	jle	.L3033
	movl	%eax, %r14d
	addl	$1, %eax
	subl	%ecx, %eax
	movl	%eax, 16(%rsp)
	leaq	95(%rsp), %rax
	movq	%rax, 8(%rsp)
	.p2align 4,,10
	.p2align 3
.L3014:
	movl	$-858993459, %eax
	movl	%r14d, %esi
	movq	%rbp, %rdi
	mull	%r9d
	subl	$1, %r14d
	shrl	$3, %edx
	movl	%edx, %r15d
	leal	(%rdx,%rdx,4), %edx
	addl	%edx, %edx
	subl	%edx, %r9d
	movq	8(%rsp), %rdx
	addl	$48, %r9d
	movb	%r9b, 95(%rsp)
	call	array_set
	cmpl	16(%rsp), %r14d
	movl	%r15d, %r9d
	jne	.L3014
	movl	28(%rsp), %eax
	movl	24(%rsp), %esi
	leal	-1(%rbx,%rax), %ebx
	leal	-1(%rax), %r14d
	leal	1(%rbx), %r15d
	subl	%r14d, %esi
.L3013:
	testl	%r13d, %r13d
	jle	.L3015
	leaq	96(%rsp), %rdx
	movq	%rbp, %rdi
	movl	%r9d, 16(%rsp)
	movb	$46, 96(%rsp)
	addl	$1, %r14d
	movl	%r15d, %ebx
	call	array_set
	movl	24(%rsp), %esi
	movl	16(%rsp), %r9d
	addl	$1, %r15d
	subl	%r14d, %esi
.L3015:
	testl	%esi, %esi
	js	.L3016
	movl	%r9d, %eax
	movl	$-858993459, %edx
	movq	%rbp, %rdi
	mull	%edx
	movl	%r15d, %ebx
	addl	$1, %r15d
	shrl	$3, %edx
	leal	(%rdx,%rdx,4), %eax
	leaq	97(%rsp), %rdx
	addl	%eax, %eax
	subl	%eax, %r9d
	addl	$48, %r9d
	movb	%r9b, 97(%rsp)
	call	array_set
.L3016:
	leaq	98(%rsp), %rdx
	movl	%ebx, %esi
	movq	%rbp, %rdi
	sarq	$32, %r12
	movb	$101, 98(%rsp)
	leal	2(%rbx), %r14d
	call	array_set
	addl	20(%rsp), %r12d
	movl	%r12d, %r13d
	subl	$1, %r13d
	js	.L3043
	leaq	100(%rsp), %rdx
	movl	%r15d, %esi
	movq	%rbp, %rdi
	movb	$43, 100(%rsp)
	call	array_set
.L3018:
	movl	%r13d, %eax
	movl	$1717986919, %edx
	movl	%r14d, %esi
	imull	%edx
	movl	%r13d, %eax
	movq	%rbp, %rdi
	sarl	$31, %eax
	sarl	$2, %edx
	subl	%eax, %edx
	leal	48(%rdx), %eax
	movl	%edx, %r12d
	leaq	101(%rsp), %rdx
	movb	%al, 101(%rsp)
	call	array_set
	leal	(%r12,%r12,4), %eax
	leal	3(%rbx), %esi
	leaq	102(%rsp), %rdx
	movq	%rbp, %rdi
	addl	$4, %ebx
	addl	%eax, %eax
	subl	%eax, %r13d
	addl	$48, %r13d
	movb	%r13b, 102(%rsp)
	call	array_set
	leaq	103(%rsp), %rdx
	movl	%ebx, %esi
	movq	%rbp, %rdi
	movb	$0, 103(%rsp)
	call	array_set
	movl	40(%rsp), %edx
	movq	32(%rsp), %rax
	testl	%edx, %edx
	jle	.L3044
	testq	%rax, %rax
	je	.L3045
	movl	%ebx, %edx
	movq	104(%rsp), %rbx
	xorq	%fs:40, %rbx
	jne	.L3046
	addq	$120, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L3043:
	.cfi_restore_state
	leaq	99(%rsp), %rdx
	movl	%r15d, %esi
	movq	%rbp, %rdi
	movl	$1, %r13d
	movb	$45, 99(%rsp)
	subl	%r12d, %r13d
	call	array_set
	jmp	.L3018
	.p2align 4,,10
	.p2align 3
.L3042:
	movl	20(%rsp), %edx
	subq	$8, %rsp
	.cfi_def_cfa_offset 184
	pushq	16+_const_strconv__ftoa__ten_pow_table_32(%rip)
	.cfi_def_cfa_offset 192
	pushq	8+_const_strconv__ftoa__ten_pow_table_32(%rip)
	.cfi_def_cfa_offset 200
	pushq	_const_strconv__ftoa__ten_pow_table_32(%rip)
	.cfi_def_cfa_offset 208
	subl	%r13d, %edx
	movl	%edx, %edi
	movl	%edx, 40(%rsp)
	call	array_get
	movl	(%rax), %eax
	leal	1(%rax,%r12), %eax
	movl	%eax, 48(%rsp)
	addq	$24, %rsp
	.cfi_def_cfa_offset 184
	pushq	16+_const_strconv__ftoa__ten_pow_table_32(%rip)
	.cfi_def_cfa_offset 192
	pushq	8+_const_strconv__ftoa__ten_pow_table_32(%rip)
	.cfi_def_cfa_offset 200
	pushq	_const_strconv__ftoa__ten_pow_table_32(%rip)
	.cfi_def_cfa_offset 208
	movl	40(%rsp), %edx
	movl	%edx, %edi
	call	array_get
	movq	%rax, %rcx
	movl	48(%rsp), %eax
	xorl	%edx, %edx
	addq	$32, %rsp
	.cfi_def_cfa_offset 176
	divl	(%rcx)
	movl	%eax, %r9d
	jmp	.L3012
	.p2align 4,,10
	.p2align 3
.L3034:
	xorl	%r14d, %r14d
.L3021:
	leaq	94(%rsp), %rdx
	xorl	%esi, %esi
	movq	%rbp, %rdi
	movl	%r9d, 16(%rsp)
	movb	$45, 94(%rsp)
	movl	$2, %r15d
	call	array_set
	movl	$1, %ebx
	movl	16(%rsp), %r9d
	jmp	.L3022
	.p2align 4,,10
	.p2align 3
.L3024:
	movl	$16, %ebx
	movl	$9, 20(%rsp)
	jmp	.L3010
	.p2align 4,,10
	.p2align 3
.L3028:
	movl	$12, %ebx
	movl	$5, 20(%rsp)
	jmp	.L3010
	.p2align 4,,10
	.p2align 3
.L3033:
	movl	%eax, %esi
	xorl	%r14d, %r14d
	jmp	.L3013
	.p2align 4,,10
	.p2align 3
.L3026:
	movl	$14, %ebx
	movl	$7, 20(%rsp)
	jmp	.L3010
	.p2align 4,,10
	.p2align 3
.L3027:
	movl	$13, %ebx
	movl	$6, 20(%rsp)
	jmp	.L3010
.L3029:
	movl	$11, %ebx
	movl	$4, 20(%rsp)
	jmp	.L3010
.L3030:
	movl	$10, %ebx
	movl	$3, 20(%rsp)
	jmp	.L3010
.L3041:
	movl	$9, %ebx
	movl	$2, 20(%rsp)
	jmp	.L3010
.L3045:
	call	tos.part.7
.L3046:
	call	__stack_chk_fail@PLT
.L3044:
	leaq	.LC68(%rip), %rdi
	xorl	%esi, %esi
	xorl	%eax, %eax
	call	_STR
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	v_panic
.L3040:
	leaq	.LC105(%rip), %rdi
	movl	$7, %esi
	call	v_panic
.L3035:
	movl	$1, %r14d
	movl	$1, 20(%rsp)
	jmp	.L3021
	.cfi_endproc
.LFE383:
	.size	strconv__ftoa__Dec32_get_string_32, .-strconv__ftoa__Dec32_get_string_32
	.section	.text.strconv__ftoa__f32_to_decimal_exact_int,"ax",@progbits
	.p2align 4,,15
	.globl	strconv__ftoa__f32_to_decimal_exact_int
	.type	strconv__ftoa__f32_to_decimal_exact_int, @function
strconv__ftoa__f32_to_decimal_exact_int:
.LFB384:
	.cfi_startproc
	subl	_const_strconv__ftoa__bias32(%rip), %esi
	movl	_const_strconv__ftoa__mantbits32(%rip), %ecx
	cmpl	%esi, %ecx
	jb	.L3057
	orl	$8388608, %edi
	subl	%esi, %ecx
	movl	%edi, %esi
	shrl	%cl, %esi
	movl	%esi, %eax
	sall	%cl, %eax
	cmpl	%edi, %eax
	je	.L3058
	movq	$0, -16(%rsp)
	movl	%esi, -20(%rsp)
	movl	-12(%rsp), %edx
	movq	-20(%rsp), %rax
	ret
	.p2align 4,,10
	.p2align 3
.L3058:
	movl	%esi, %eax
	movl	$-858993459, %edi
	xorl	%r8d, %r8d
	mull	%edi
	movl	$1, %ecx
	shrl	$3, %edx
	leal	(%rdx,%rdx,4), %eax
	addl	%eax, %eax
	cmpl	%eax, %esi
	jne	.L3052
	.p2align 4,,10
	.p2align 3
.L3051:
	movl	%esi, %eax
	movl	%ecx, %r8d
	addl	$1, %ecx
	mull	%edi
	movl	%edx, %esi
	shrl	$3, %esi
	movl	%esi, %eax
	mull	%edi
	shrl	$3, %edx
	leal	(%rdx,%rdx,4), %eax
	addl	%eax, %eax
	cmpl	%eax, %esi
	je	.L3051
.L3052:
	movl	%esi, -20(%rsp)
	movl	%r8d, -16(%rsp)
	movl	$1, -12(%rsp)
	movq	-20(%rsp), %rax
	movl	-12(%rsp), %edx
	ret
	.p2align 4,,10
	.p2align 3
.L3057:
	movq	$0, -20(%rsp)
	movl	$0, -12(%rsp)
	movq	-20(%rsp), %rax
	movl	-12(%rsp), %edx
	ret
	.cfi_endproc
.LFE384:
	.size	strconv__ftoa__f32_to_decimal_exact_int, .-strconv__ftoa__f32_to_decimal_exact_int
	.section	.text.strconv__ftoa__Dec64_get_string_64,"ax",@progbits
	.p2align 4,,15
	.globl	strconv__ftoa__Dec64_get_string_64
	.type	strconv__ftoa__Dec64_get_string_64, @function
strconv__ftoa__Dec64_get_string_64:
.LFB387:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdi, %r9
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	%edx, %r14d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %r12
	leal	1(%rcx), %r13d
	subq	$120, %rsp
	.cfi_def_cfa_offset 176
	movq	%fs:40, %rax
	movq	%rax, 104(%rsp)
	xorl	%eax, %eax
	movl	$4294967295, %eax
	movq	%rsi, 16(%rsp)
	cmpq	%rax, %rdi
	jbe	.L3075
	shrq	$32, %rdi
	movl	$48, %eax
	movl	$32, %ebx
.L3060:
	cmpq	$65535, %rdi
	jbe	.L3061
	shrq	$16, %rdi
	movl	%eax, %ebx
.L3061:
	cmpq	$255, %rdi
	jbe	.L3062
	shrq	$8, %rdi
	addl	$8, %ebx
.L3062:
	movq	%r9, (%rsp)
	subq	$8, %rsp
	.cfi_def_cfa_offset 184
	pushq	16+_const_math__bits__len_8_tab(%rip)
	.cfi_def_cfa_offset 192
	pushq	8+_const_math__bits__len_8_tab(%rip)
	.cfi_def_cfa_offset 200
	pushq	_const_math__bits__len_8_tab(%rip)
	.cfi_def_cfa_offset 208
	movl	$1, %r15d
	call	array_get
	movzbl	(%rax), %ebp
	addq	$24, %rsp
	.cfi_def_cfa_offset 184
	pushq	16+_const_strconv__ftoa__powers_of_10(%rip)
	.cfi_def_cfa_offset 192
	pushq	8+_const_strconv__ftoa__powers_of_10(%rip)
	.cfi_def_cfa_offset 200
	pushq	_const_strconv__ftoa__powers_of_10(%rip)
	.cfi_def_cfa_offset 208
	addl	%ebx, %ebp
	imull	$1233, %ebp, %ebp
	sarl	$12, %ebp
	movl	%ebp, %edi
	call	array_get
	addq	$32, %rsp
	.cfi_def_cfa_offset 176
	cmpq	(%rax), %r12
	movl	$1, %ecx
	leaq	64(%rsp), %rdi
	leaq	92(%rsp), %r8
	movl	$1, %edx
	movl	$1, %esi
	movb	$0, 92(%rsp)
	leaq	32(%rsp), %rbx
	sbbl	$0, %ebp
	leal	1(%rbp), %eax
	movl	%eax, 24(%rsp)
	call	new_array_from_c_array
	subq	$8, %rsp
	.cfi_def_cfa_offset 184
	leal	9(%rbp), %esi
	movq	%rbx, %rdi
	pushq	88(%rsp)
	.cfi_def_cfa_offset 192
	pushq	88(%rsp)
	.cfi_def_cfa_offset 200
	xorl	%ebp, %ebp
	pushq	88(%rsp)
	.cfi_def_cfa_offset 208
	call	array_repeat
	addq	$32, %rsp
	.cfi_def_cfa_offset 176
	testl	%r14d, %r14d
	movq	(%rsp), %r9
	jne	.L3082
.L3063:
	movl	24(%rsp), %eax
	xorl	%r14d, %r14d
	cmpl	$1, %eax
	setle	%r14b
	cmpl	%eax, %r13d
	jl	.L3083
	movl	%eax, %r13d
.L3064:
	movl	%r13d, %eax
	leal	0(%r13,%rbp), %r12d
	subl	%r14d, %eax
	cmpl	$1, %eax
	movl	%eax, 28(%rsp)
	jle	.L3078
	subl	$2, %eax
	xorl	%r14d, %r14d
	addq	$1, %rax
	movq	%rax, (%rsp)
	leaq	94(%rsp), %rax
	movq	%rax, 8(%rsp)
	.p2align 4,,10
	.p2align 3
.L3066:
	movabsq	$-3689348814741910323, %rax
	movl	%r12d, %esi
	movq	%rbx, %rdi
	mulq	%r9
	subl	%r14d, %esi
	addq	$1, %r14
	shrq	$3, %rdx
	movq	%rdx, %r15
	leaq	(%rdx,%rdx,4), %rdx
	addq	%rdx, %rdx
	subq	%rdx, %r9
	movq	8(%rsp), %rdx
	addl	$48, %r9d
	movb	%r9b, 94(%rsp)
	call	array_set
	cmpq	(%rsp), %r14
	movq	%r15, %r9
	jne	.L3066
	movl	28(%rsp), %eax
	movl	%r12d, %esi
	leal	-1(%rbp,%rax), %ebp
	leal	-1(%rax), %r14d
	leal	1(%rbp), %r15d
	subl	%r14d, %esi
.L3065:
	testl	%r13d, %r13d
	jle	.L3067
	leaq	95(%rsp), %rdx
	movq	%rbx, %rdi
	movq	%r9, (%rsp)
	movb	$46, 95(%rsp)
	addl	$1, %r14d
	movl	%r15d, %ebp
	call	array_set
	movq	(%rsp), %r9
	movl	%r12d, %esi
	addl	$1, %r15d
	subl	%r14d, %esi
.L3067:
	testl	%esi, %esi
	js	.L3068
	movq	%r9, %rax
	movabsq	$-3689348814741910323, %rdx
	movq	%rbx, %rdi
	mulq	%rdx
	movl	%r15d, %ebp
	addl	$1, %r15d
	shrq	$3, %rdx
	leaq	(%rdx,%rdx,4), %rax
	leaq	96(%rsp), %rdx
	addq	%rax, %rax
	subq	%rax, %r9
	addl	$48, %r9d
	movb	%r9b, 96(%rsp)
	call	array_set
.L3068:
	leaq	97(%rsp), %rdx
	movl	%ebp, %esi
	movq	%rbx, %rdi
	movb	$101, 97(%rsp)
	leal	2(%rbp), %r13d
	call	array_set
	movl	24(%rsp), %r12d
	addl	16(%rsp), %r12d
	movl	%r12d, %r14d
	subl	$1, %r14d
	js	.L3084
	leaq	99(%rsp), %rdx
	movl	%r15d, %esi
	movq	%rbx, %rdi
	movb	$43, 99(%rsp)
	call	array_set
.L3070:
	movl	$1717986919, %r12d
	movl	%r14d, %eax
	movl	%r14d, %esi
	imull	%r12d
	sarl	$31, %esi
	movl	%r14d, %r15d
	sarl	$2, %edx
	subl	%esi, %edx
	leal	(%rdx,%rdx,4), %eax
	movl	%edx, %ecx
	addl	%eax, %eax
	subl	%eax, %r15d
	movl	%edx, %eax
	imull	%r12d
	movl	%ecx, %eax
	sarl	$31, %eax
	movl	%edx, %r12d
	movl	$1374389535, %edx
	sarl	$2, %r12d
	subl	%eax, %r12d
	leal	(%r12,%r12,4), %eax
	addl	%eax, %eax
	subl	%eax, %ecx
	movl	%r14d, %eax
	leal	3(%rbp), %r14d
	imull	%edx
	movl	%ecx, %r12d
	sarl	$5, %edx
	subl	%esi, %edx
	testl	%edx, %edx
	jle	.L3071
	leal	48(%rdx), %eax
	movl	%r13d, %esi
	leaq	100(%rsp), %rdx
	movl	%r14d, %r13d
	leal	4(%rbp), %r14d
	movq	%rbx, %rdi
	movb	%al, 100(%rsp)
	call	array_set
.L3071:
	leaq	101(%rsp), %rdx
	movl	%r13d, %esi
	addl	$48, %r12d
	movq	%rbx, %rdi
	movb	%r12b, 101(%rsp)
	addl	$48, %r15d
	call	array_set
	leaq	102(%rsp), %rdx
	movl	%r14d, %esi
	movq	%rbx, %rdi
	addl	$2, %r13d
	movb	%r15b, 102(%rsp)
	call	array_set
	leaq	103(%rsp), %rdx
	movl	%r13d, %esi
	movq	%rbx, %rdi
	movb	$0, 103(%rsp)
	call	array_set
	movl	40(%rsp), %edx
	movq	32(%rsp), %rax
	testl	%edx, %edx
	jle	.L3085
	testq	%rax, %rax
	je	.L3086
	movq	104(%rsp), %rcx
	xorq	%fs:40, %rcx
	movl	%r13d, %edx
	jne	.L3087
	addq	$120, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L3075:
	.cfi_restore_state
	movl	$16, %eax
	xorl	%ebx, %ebx
	jmp	.L3060
	.p2align 4,,10
	.p2align 3
.L3084:
	leaq	98(%rsp), %rdx
	movl	%r15d, %esi
	movq	%rbx, %rdi
	movb	$45, 98(%rsp)
	call	array_set
	movl	$1, %edx
	subl	%r12d, %edx
	movl	%edx, %r14d
	jmp	.L3070
	.p2align 4,,10
	.p2align 3
.L3083:
	movl	%eax, %edx
	subq	$8, %rsp
	.cfi_def_cfa_offset 184
	pushq	16+_const_strconv__ftoa__ten_pow_table_64(%rip)
	.cfi_def_cfa_offset 192
	subl	%r13d, %edx
	pushq	8+_const_strconv__ftoa__ten_pow_table_64(%rip)
	.cfi_def_cfa_offset 200
	pushq	_const_strconv__ftoa__ten_pow_table_64(%rip)
	.cfi_def_cfa_offset 208
	movl	%edx, %edi
	movl	%edx, 32(%rsp)
	call	array_get
	addq	$24, %rsp
	.cfi_def_cfa_offset 184
	movq	(%rax), %rax
	pushq	16+_const_strconv__ftoa__ten_pow_table_64(%rip)
	.cfi_def_cfa_offset 192
	pushq	8+_const_strconv__ftoa__ten_pow_table_64(%rip)
	.cfi_def_cfa_offset 200
	pushq	_const_strconv__ftoa__ten_pow_table_64(%rip)
	.cfi_def_cfa_offset 208
	movl	32(%rsp), %edx
	leaq	1(%r12,%rax), %r12
	movl	%edx, %edi
	call	array_get
	xorl	%edx, %edx
	movq	%rax, %rcx
	movq	%r12, %rax
	divq	(%rcx)
	addq	$32, %rsp
	.cfi_def_cfa_offset 176
	movq	%rax, %r9
	jmp	.L3064
	.p2align 4,,10
	.p2align 3
.L3082:
	leaq	93(%rsp), %rdx
	xorl	%esi, %esi
	movq	%rbx, %rdi
	movb	$45, 93(%rsp)
	movl	$2, %r15d
	movl	$1, %ebp
	call	array_set
	movq	(%rsp), %r9
	jmp	.L3063
	.p2align 4,,10
	.p2align 3
.L3078:
	movl	%r12d, %esi
	xorl	%r14d, %r14d
	jmp	.L3065
.L3085:
	leaq	.LC68(%rip), %rdi
	xorl	%esi, %esi
	xorl	%eax, %eax
	call	_STR
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	v_panic
.L3087:
	call	__stack_chk_fail@PLT
.L3086:
	call	tos.part.7
	.cfi_endproc
.LFE387:
	.size	strconv__ftoa__Dec64_get_string_64, .-strconv__ftoa__Dec64_get_string_64
	.section	.text.strconv__ftoa__f64_to_decimal_exact_int,"ax",@progbits
	.p2align 4,,15
	.globl	strconv__ftoa__f64_to_decimal_exact_int
	.type	strconv__ftoa__f64_to_decimal_exact_int, @function
strconv__ftoa__f64_to_decimal_exact_int:
.LFB388:
	.cfi_startproc
	movl	_const_strconv__ftoa__bias64(%rip), %eax
	subq	%rax, %rdx
	movl	_const_strconv__ftoa__mantbits64(%rip), %eax
	cmpq	%rdx, %rax
	movq	%rax, %rcx
	jb	.L3098
	movabsq	$4503599627370496, %rax
	subl	%edx, %ecx
	orq	%rax, %rsi
	movq	%rsi, %r8
	shrq	%cl, %r8
	movq	%r8, %rax
	salq	%cl, %rax
	cmpq	%rsi, %rax
	je	.L3099
	movq	%r8, (%rdi)
	movl	$0, 8(%rdi)
	movq	%rdi, %rax
	movl	$0, 16(%rdi)
	ret
	.p2align 4,,10
	.p2align 3
.L3099:
	movq	%r8, %rax
	movabsq	$-3689348814741910323, %rsi
	xorl	%r9d, %r9d
	mulq	%rsi
	movl	$1, %ecx
	shrq	$3, %rdx
	leaq	(%rdx,%rdx,4), %rax
	addq	%rax, %rax
	cmpq	%rax, %r8
	jne	.L3093
	.p2align 4,,10
	.p2align 3
.L3092:
	movq	%r8, %rax
	movl	%ecx, %r9d
	addl	$1, %ecx
	mulq	%rsi
	movq	%rdx, %r8
	shrq	$3, %r8
	movq	%r8, %rax
	mulq	%rsi
	shrq	$3, %rdx
	leaq	(%rdx,%rdx,4), %rax
	addq	%rax, %rax
	cmpq	%rax, %r8
	je	.L3092
.L3093:
	movq	%r8, (%rdi)
	movl	%r9d, 8(%rdi)
	movq	%rdi, %rax
	movl	$1, 16(%rdi)
	ret
	.p2align 4,,10
	.p2align 3
.L3098:
	movq	$0, (%rdi)
	movl	$0, 8(%rdi)
	movq	%rdi, %rax
	movl	$0, 16(%rdi)
	ret
	.cfi_endproc
.LFE388:
	.size	strconv__ftoa__f64_to_decimal_exact_int, .-strconv__ftoa__f64_to_decimal_exact_int
	.section	.text.strconv__ftoa__assert1,"ax",@progbits
	.p2align 4,,15
	.globl	strconv__ftoa__assert1
	.type	strconv__ftoa__assert1, @function
strconv__ftoa__assert1:
.LFB395:
	.cfi_startproc
	testl	%edi, %edi
	je	.L3105
	rep ret
.L3105:
	movq	%rsi, %rdi
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movq	%rdx, %rsi
	call	v_panic
	.cfi_endproc
.LFE395:
	.size	strconv__ftoa__assert1, .-strconv__ftoa__assert1
	.section	.text.strconv__ftoa__bool_to_int,"ax",@progbits
	.p2align 4,,15
	.globl	strconv__ftoa__bool_to_int
	.type	strconv__ftoa__bool_to_int, @function
strconv__ftoa__bool_to_int:
.LFB396:
	.cfi_startproc
	xorl	%eax, %eax
	testl	%edi, %edi
	setne	%al
	ret
	.cfi_endproc
.LFE396:
	.size	strconv__ftoa__bool_to_int, .-strconv__ftoa__bool_to_int
	.section	.text.strconv__ftoa__bool_to_u32,"ax",@progbits
	.p2align 4,,15
	.globl	strconv__ftoa__bool_to_u32
	.type	strconv__ftoa__bool_to_u32, @function
strconv__ftoa__bool_to_u32:
.LFB397:
	.cfi_startproc
	xorl	%eax, %eax
	testl	%edi, %edi
	setne	%al
	ret
	.cfi_endproc
.LFE397:
	.size	strconv__ftoa__bool_to_u32, .-strconv__ftoa__bool_to_u32
	.section	.text.strconv__ftoa__bool_to_u64,"ax",@progbits
	.p2align 4,,15
	.globl	strconv__ftoa__bool_to_u64
	.type	strconv__ftoa__bool_to_u64, @function
strconv__ftoa__bool_to_u64:
.LFB398:
	.cfi_startproc
	xorl	%eax, %eax
	testl	%edi, %edi
	setne	%al
	ret
	.cfi_endproc
.LFE398:
	.size	strconv__ftoa__bool_to_u64, .-strconv__ftoa__bool_to_u64
	.section	.rodata.str1.1
.LC106:
	.string	"-inf"
.LC107:
	.string	"+inf"
.LC108:
	.string	"nan"
.LC109:
	.string	"-0e+00"
.LC110:
	.string	"0e+00"
	.section	.text.strconv__ftoa__get_string_special,"ax",@progbits
	.p2align 4,,15
	.globl	strconv__ftoa__get_string_special
	.type	strconv__ftoa__get_string_special, @function
strconv__ftoa__get_string_special:
.LFB399:
	.cfi_startproc
	testl	%edx, %edx
	je	.L3116
	testl	%esi, %esi
	jne	.L3112
	leaq	.LC107(%rip), %rdx
	leaq	.LC106(%rip), %rax
	testl	%edi, %edi
	cmove	%rdx, %rax
	movl	$4, %edx
	ret
	.p2align 4,,10
	.p2align 3
.L3112:
	leaq	.LC109(%rip), %rdx
	leaq	.LC110(%rip), %rax
	testl	%edi, %edi
	cmovne	%rdx, %rax
	cmpl	$1, %edi
	sbbq	%rdx, %rdx
	addq	$6, %rdx
	ret
	.p2align 4,,10
	.p2align 3
.L3116:
	leaq	.LC108(%rip), %rax
	movl	$3, %edx
	ret
	.cfi_endproc
.LFE399:
	.size	strconv__ftoa__get_string_special, .-strconv__ftoa__get_string_special
	.section	.text.strconv__ftoa__decimal_len_32,"ax",@progbits
	.p2align 4,,15
	.globl	strconv__ftoa__decimal_len_32
	.type	strconv__ftoa__decimal_len_32, @function
strconv__ftoa__decimal_len_32:
.LFB400:
	.cfi_startproc
	cmpl	$999999999, %edi
	ja	.L3131
	cmpl	$99999999, %edi
	movl	$9, %eax
	ja	.L3117
	cmpl	$9999999, %edi
	movl	$8, %eax
	ja	.L3117
	cmpl	$999999, %edi
	movl	$7, %eax
	ja	.L3117
	cmpl	$99999, %edi
	movl	$6, %eax
	ja	.L3117
	cmpl	$9999, %edi
	movl	$5, %eax
	ja	.L3117
	cmpl	$999, %edi
	movl	$4, %eax
	ja	.L3117
	cmpl	$99, %edi
	movl	$3, %eax
	ja	.L3117
	xorl	%eax, %eax
	cmpl	$9, %edi
	seta	%al
	addl	$1, %eax
.L3117:
	rep ret
.L3131:
	leaq	.LC105(%rip), %rdi
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$7, %esi
	call	v_panic
	.cfi_endproc
.LFE400:
	.size	strconv__ftoa__decimal_len_32, .-strconv__ftoa__decimal_len_32
	.section	.rodata.str1.1
.LC111:
	.string	"shiftedSum <= math.max_u32"
	.section	.text.strconv__ftoa__mul_shift_32,"ax",@progbits
	.p2align 4,,15
	.globl	strconv__ftoa__mul_shift_32
	.type	strconv__ftoa__mul_shift_32, @function
strconv__ftoa__mul_shift_32:
.LFB401:
	.cfi_startproc
	movq	_const_math__bits__mask32(%rip), %rax
	movl	%edi, %edi
	movq	%rsi, %r8
	movq	%rdi, %rcx
	imulq	%rsi, %rdi
	andq	%rax, %rcx
	andq	%rax, %r8
	imulq	%rcx, %r8
	shrq	$32, %r8
	andq	%rax, %r8
	movq	%rsi, %rax
	shrq	$32, %rax
	imulq	%rcx, %rax
	movl	$64, %ecx
	subl	%edx, %ecx
	addq	%r8, %rax
	shrq	$32, %rax
	salq	%cl, %rax
	movl	%edx, %ecx
	shrq	%cl, %rdi
	addq	%rdi, %rax
	cmpq	$2147483647, %rax
	ja	.L3137
	rep ret
.L3137:
	leaq	.LC111(%rip), %rdi
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$26, %esi
	call	v_panic
	.cfi_endproc
.LFE401:
	.size	strconv__ftoa__mul_shift_32, .-strconv__ftoa__mul_shift_32
	.section	.text.strconv__ftoa__mul_pow5_invdiv_pow2,"ax",@progbits
	.p2align 4,,15
	.globl	strconv__ftoa__mul_pow5_invdiv_pow2
	.type	strconv__ftoa__mul_pow5_invdiv_pow2, @function
strconv__ftoa__mul_pow5_invdiv_pow2:
.LFB402:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movl	%edi, %ebp
	movl	%esi, %edi
	movl	%edx, %ebx
	subq	$16, %rsp
	.cfi_def_cfa_offset 40
	pushq	16+_const_strconv__ftoa__pow5_inv_split_32(%rip)
	.cfi_def_cfa_offset 48
	pushq	8+_const_strconv__ftoa__pow5_inv_split_32(%rip)
	.cfi_def_cfa_offset 56
	pushq	_const_strconv__ftoa__pow5_inv_split_32(%rip)
	.cfi_def_cfa_offset 64
	call	array_get
	movq	(%rax), %r8
	movq	_const_math__bits__mask32(%rip), %rax
	movl	%ebp, %edi
	movq	%rdi, %rdx
	movl	$64, %ecx
	addq	$32, %rsp
	.cfi_def_cfa_offset 32
	subl	%ebx, %ecx
	movq	%r8, %rsi
	andq	%rax, %rdx
	andq	%rax, %rsi
	imulq	%rdx, %rsi
	shrq	$32, %rsi
	andq	%rax, %rsi
	movq	%r8, %rax
	shrq	$32, %rax
	imulq	%rdx, %rax
	imulq	%rdi, %r8
	addq	%rsi, %rax
	shrq	$32, %rax
	salq	%cl, %rax
	movl	%ebx, %ecx
	shrq	%cl, %r8
	addq	%r8, %rax
	cmpq	$2147483647, %rax
	ja	.L3141
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L3141:
	.cfi_restore_state
	leaq	.LC111(%rip), %rdi
	movl	$26, %esi
	call	v_panic
	.cfi_endproc
.LFE402:
	.size	strconv__ftoa__mul_pow5_invdiv_pow2, .-strconv__ftoa__mul_pow5_invdiv_pow2
	.section	.text.strconv__ftoa__mul_pow5_div_pow2,"ax",@progbits
	.p2align 4,,15
	.globl	strconv__ftoa__mul_pow5_div_pow2
	.type	strconv__ftoa__mul_pow5_div_pow2, @function
strconv__ftoa__mul_pow5_div_pow2:
.LFB403:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movl	%edi, %ebp
	movl	%esi, %edi
	movl	%edx, %ebx
	subq	$16, %rsp
	.cfi_def_cfa_offset 40
	pushq	16+_const_strconv__ftoa__pow5_split_32(%rip)
	.cfi_def_cfa_offset 48
	pushq	8+_const_strconv__ftoa__pow5_split_32(%rip)
	.cfi_def_cfa_offset 56
	pushq	_const_strconv__ftoa__pow5_split_32(%rip)
	.cfi_def_cfa_offset 64
	call	array_get
	movq	(%rax), %r8
	movq	_const_math__bits__mask32(%rip), %rax
	movl	%ebp, %edi
	movq	%rdi, %rdx
	movl	$64, %ecx
	addq	$32, %rsp
	.cfi_def_cfa_offset 32
	subl	%ebx, %ecx
	movq	%r8, %rsi
	andq	%rax, %rdx
	andq	%rax, %rsi
	imulq	%rdx, %rsi
	shrq	$32, %rsi
	andq	%rax, %rsi
	movq	%r8, %rax
	shrq	$32, %rax
	imulq	%rdx, %rax
	imulq	%rdi, %r8
	addq	%rsi, %rax
	shrq	$32, %rax
	salq	%cl, %rax
	movl	%ebx, %ecx
	shrq	%cl, %r8
	addq	%r8, %rax
	cmpq	$2147483647, %rax
	ja	.L3145
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L3145:
	.cfi_restore_state
	leaq	.LC111(%rip), %rdi
	movl	$26, %esi
	call	v_panic
	.cfi_endproc
.LFE403:
	.size	strconv__ftoa__mul_pow5_div_pow2, .-strconv__ftoa__mul_pow5_div_pow2
	.section	.text.strconv__ftoa__pow5_factor_32,"ax",@progbits
	.p2align 4,,15
	.globl	strconv__ftoa__pow5_factor_32
	.type	strconv__ftoa__pow5_factor_32, @function
strconv__ftoa__pow5_factor_32:
.LFB404:
	.cfi_startproc
	movl	%edi, %eax
	movl	$-858993459, %r8d
	xorl	%esi, %esi
	mull	%r8d
	shrl	$2, %edx
	leal	(%rdx,%rdx,4), %eax
	movl	%edx, %ecx
	cmpl	%eax, %edi
	jne	.L3146
	.p2align 4,,10
	.p2align 3
.L3147:
	movl	%ecx, %eax
	addl	$1, %esi
	mull	%r8d
	shrl	$2, %edx
	leal	(%rdx,%rdx,4), %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%edx, %ecx
	testl	%eax, %eax
	je	.L3147
.L3146:
	movl	%esi, %eax
	ret
	.cfi_endproc
.LFE404:
	.size	strconv__ftoa__pow5_factor_32, .-strconv__ftoa__pow5_factor_32
	.section	.text.strconv__ftoa__multiple_of_power_of_five_32,"ax",@progbits
	.p2align 4,,15
	.globl	strconv__ftoa__multiple_of_power_of_five_32
	.type	strconv__ftoa__multiple_of_power_of_five_32, @function
strconv__ftoa__multiple_of_power_of_five_32:
.LFB405:
	.cfi_startproc
	movl	%edi, %eax
	movl	$-858993459, %r9d
	xorl	%r8d, %r8d
	mull	%r9d
	shrl	$2, %edx
	leal	(%rdx,%rdx,4), %eax
	movl	%edx, %ecx
	cmpl	%eax, %edi
	jne	.L3153
	.p2align 4,,10
	.p2align 3
.L3152:
	movl	%ecx, %eax
	addl	$1, %r8d
	mull	%r9d
	shrl	$2, %edx
	leal	(%rdx,%rdx,4), %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%edx, %ecx
	testl	%eax, %eax
	je	.L3152
.L3153:
	xorl	%eax, %eax
	cmpl	%r8d, %esi
	setbe	%al
	ret
	.cfi_endproc
.LFE405:
	.size	strconv__ftoa__multiple_of_power_of_five_32, .-strconv__ftoa__multiple_of_power_of_five_32
	.section	.text.strconv__ftoa__multiple_of_power_of_two_32,"ax",@progbits
	.p2align 4,,15
	.globl	strconv__ftoa__multiple_of_power_of_two_32
	.type	strconv__ftoa__multiple_of_power_of_two_32, @function
strconv__ftoa__multiple_of_power_of_two_32:
.LFB406:
	.cfi_startproc
	testl	%edi, %edi
	jne	.L3166
	movl	$32, %eax
	cmpl	%eax, %esi
	setbe	%al
	movzbl	%al, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L3166:
	movl	%edi, %eax
	subq	$32, %rsp
	.cfi_def_cfa_offset 40
	negl	%eax
	movl	%esi, 20(%rsp)
	pushq	16+_const_math__bits__de_bruijn32tab(%rip)
	.cfi_def_cfa_offset 48
	andl	%eax, %edi
	pushq	8+_const_math__bits__de_bruijn32tab(%rip)
	.cfi_def_cfa_offset 56
	pushq	_const_math__bits__de_bruijn32tab(%rip)
	.cfi_def_cfa_offset 64
	imull	_const_math__bits__de_bruijn32(%rip), %edi
	shrl	$27, %edi
	call	array_get
	movzbl	(%rax), %eax
	movl	44(%rsp), %esi
	cmpl	%eax, %esi
	setbe	%al
	addq	$56, %rsp
	.cfi_def_cfa_offset 8
	movzbl	%al, %eax
	ret
	.cfi_endproc
.LFE406:
	.size	strconv__ftoa__multiple_of_power_of_two_32, .-strconv__ftoa__multiple_of_power_of_two_32
	.section	.rodata.str1.1
.LC112:
	.string	"e >= 0"
.LC113:
	.string	"e <= 1650"
	.section	.text.strconv__ftoa__log10_pow2,"ax",@progbits
	.p2align 4,,15
	.globl	strconv__ftoa__log10_pow2
	.type	strconv__ftoa__log10_pow2, @function
strconv__ftoa__log10_pow2:
.LFB407:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	testl	%edi, %edi
	js	.L3171
	cmpl	$1650, %edi
	jg	.L3172
	imull	$78913, %edi, %eax
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	shrl	$18, %eax
	ret
.L3171:
	.cfi_restore_state
	leaq	.LC112(%rip), %rdi
	movl	$6, %esi
	call	v_panic
.L3172:
	leaq	.LC113(%rip), %rdi
	movl	$9, %esi
	call	v_panic
	.cfi_endproc
.LFE407:
	.size	strconv__ftoa__log10_pow2, .-strconv__ftoa__log10_pow2
	.section	.rodata.str1.1
.LC114:
	.string	"e <= 2620"
	.section	.text.strconv__ftoa__log10_pow5,"ax",@progbits
	.p2align 4,,15
	.globl	strconv__ftoa__log10_pow5
	.type	strconv__ftoa__log10_pow5, @function
strconv__ftoa__log10_pow5:
.LFB408:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	testl	%edi, %edi
	js	.L3177
	cmpl	$2620, %edi
	jg	.L3178
	imull	$732923, %edi, %eax
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	shrl	$20, %eax
	ret
.L3177:
	.cfi_restore_state
	leaq	.LC112(%rip), %rdi
	movl	$6, %esi
	call	v_panic
.L3178:
	leaq	.LC114(%rip), %rdi
	movl	$9, %esi
	call	v_panic
	.cfi_endproc
.LFE408:
	.size	strconv__ftoa__log10_pow5, .-strconv__ftoa__log10_pow5
	.section	.rodata.str1.1
.LC115:
	.string	"e <= 3528"
	.section	.text.strconv__ftoa__pow5_bits,"ax",@progbits
	.p2align 4,,15
	.globl	strconv__ftoa__pow5_bits
	.type	strconv__ftoa__pow5_bits, @function
strconv__ftoa__pow5_bits:
.LFB409:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	testl	%edi, %edi
	js	.L3183
	cmpl	$3528, %edi
	jg	.L3184
	imull	$1217359, %edi, %eax
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	shrl	$19, %eax
	leal	1(%rax), %eax
	ret
.L3183:
	.cfi_restore_state
	leaq	.LC112(%rip), %rdi
	movl	$6, %esi
	call	v_panic
.L3184:
	leaq	.LC115(%rip), %rdi
	movl	$9, %esi
	call	v_panic
	.cfi_endproc
.LFE409:
	.size	strconv__ftoa__pow5_bits, .-strconv__ftoa__pow5_bits
	.section	.text.strconv__ftoa__f32_to_decimal,"ax",@progbits
	.p2align 4,,15
	.globl	strconv__ftoa__f32_to_decimal
	.type	strconv__ftoa__f32_to_decimal, @function
strconv__ftoa__f32_to_decimal:
.LFB385:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	movl	_const_strconv__ftoa__bias32(%rip), %ebp
	movl	_const_strconv__ftoa__mantbits32(%rip), %ecx
	addl	%ecx, %ebp
	testl	%esi, %esi
	jne	.L3186
	leal	0(,%rdi,4), %r13d
	movl	%edi, %eax
	andl	$1, %eax
	xorl	$-1, %ebp
	movl	%eax, 32(%rsp)
	leal	2(%r13), %eax
	movl	%eax, 8(%rsp)
	leal	-2(%r13), %eax
	movl	%eax, 16(%rsp)
	js	.L3269
.L3187:
	cmpl	$1650, %ebp
	jg	.L3270
	imull	$78913, %ebp, %r12d
	shrl	$18, %r12d
	movl	%r12d, %edi
	movl	%r12d, %r14d
	call	strconv__ftoa__pow5_bits
	subq	$8, %rsp
	.cfi_def_cfa_offset 120
	movl	%r12d, %edx
	pushq	16+_const_strconv__ftoa__pow5_inv_split_32(%rip)
	.cfi_def_cfa_offset 128
	pushq	8+_const_strconv__ftoa__pow5_inv_split_32(%rip)
	.cfi_def_cfa_offset 136
	pushq	_const_strconv__ftoa__pow5_inv_split_32(%rip)
	.cfi_def_cfa_offset 144
	subl	%ebp, %edx
	movl	%r12d, %edi
	leal	58(%rax,%rdx), %r15d
	call	array_get
	movq	(%rax), %rdx
	movq	_const_math__bits__mask32(%rip), %rdi
	movl	%r13d, %esi
	movq	%rsi, %rax
	movq	%rdx, %rcx
	andq	%rdi, %rax
	movq	%rdx, %r8
	andq	%rdi, %rcx
	shrq	$32, %r8
	imulq	%rax, %rcx
	imulq	%r8, %rax
	imulq	%rsi, %rdx
	shrq	$32, %rcx
	andq	%rdi, %rcx
	movl	$64, %edi
	leaq	(%rax,%rcx), %r8
	movl	%edi, %ebx
	subl	%r15d, %ebx
	shrq	$32, %r8
	movl	%ebx, %ecx
	movl	%ebx, 52(%rsp)
	movq	%r8, %rax
	addq	$32, %rsp
	.cfi_def_cfa_offset 112
	salq	%cl, %rax
	movl	%r15d, %ecx
	shrq	%cl, %rdx
	leaq	(%rax,%rdx), %r8
	cmpq	$2147483647, %r8
	ja	.L3268
	movl	%r8d, 24(%rsp)
	subq	$8, %rsp
	.cfi_def_cfa_offset 120
	pushq	16+_const_strconv__ftoa__pow5_inv_split_32(%rip)
	.cfi_def_cfa_offset 128
	pushq	8+_const_strconv__ftoa__pow5_inv_split_32(%rip)
	.cfi_def_cfa_offset 136
	pushq	_const_strconv__ftoa__pow5_inv_split_32(%rip)
	.cfi_def_cfa_offset 144
	movl	%r12d, %edi
	call	array_get
	movl	40(%rsp), %esi
	movq	(%rax), %rdx
	movq	_const_math__bits__mask32(%rip), %r10
	movq	%rdx, %rax
	movq	%rsi, %rcx
	andq	%r10, %rax
	andq	%r10, %rcx
	imulq	%rcx, %rax
	shrq	$32, %rax
	andq	%r10, %rax
	movq	%rdx, %r10
	shrq	$32, %r10
	imulq	%rcx, %r10
	movzbl	52(%rsp), %ecx
	addq	$32, %rsp
	.cfi_def_cfa_offset 112
	imulq	%rsi, %rdx
	movl	24(%rsp), %r8d
	addq	%rax, %r10
	shrq	$32, %r10
	movq	%r10, %rax
	salq	%cl, %rax
	movl	%r15d, %ecx
	shrq	%cl, %rdx
	leaq	(%rax,%rdx), %r10
	cmpq	$2147483647, %r10
	ja	.L3268
	movl	%r8d, 36(%rsp)
	movq	%r10, 24(%rsp)
	subq	$8, %rsp
	.cfi_def_cfa_offset 120
	pushq	16+_const_strconv__ftoa__pow5_inv_split_32(%rip)
	.cfi_def_cfa_offset 128
	pushq	8+_const_strconv__ftoa__pow5_inv_split_32(%rip)
	.cfi_def_cfa_offset 136
	movl	%r12d, %edi
	pushq	_const_strconv__ftoa__pow5_inv_split_32(%rip)
	.cfi_def_cfa_offset 144
	movl	%r10d, %ebx
	call	array_get
	movl	48(%rsp), %edi
	movq	(%rax), %rsi
	movq	_const_math__bits__mask32(%rip), %rdx
	movq	%rsi, %rax
	movq	%rdi, %rcx
	andq	%rdx, %rax
	andq	%rdx, %rcx
	imulq	%rcx, %rax
	shrq	$32, %rax
	andq	%rdx, %rax
	movq	%rsi, %rdx
	shrq	$32, %rdx
	imulq	%rcx, %rdx
	movzbl	52(%rsp), %ecx
	addq	$32, %rsp
	.cfi_def_cfa_offset 112
	imulq	%rdi, %rsi
	movq	24(%rsp), %r10
	movl	36(%rsp), %r8d
	addq	%rax, %rdx
	shrq	$32, %rdx
	movq	%rdx, %rax
	salq	%cl, %rax
	movl	%r15d, %ecx
	shrq	%cl, %rsi
	leaq	(%rax,%rsi), %rdx
	cmpq	$2147483647, %rdx
	ja	.L3268
	movl	$-858993459, %r15d
	movl	%edx, %eax
	movl	%edx, %r9d
	mull	%r15d
	movl	%edx, %ecx
	shrl	$3, %ecx
	testl	%r12d, %r12d
	je	.L3229
	leal	-1(%r10), %edx
	xorl	%esi, %esi
	movl	%edx, %eax
	mull	%r15d
	shrl	$3, %edx
	cmpl	%ecx, %edx
	jbe	.L3271
.L3195:
	cmpl	$9, %r12d
	jbe	.L3194
.L3196:
	movl	%ebx, %eax
	movl	$-858993459, %r10d
	xorl	%r11d, %r11d
	mull	%r10d
	movl	%edx, %ebx
	shrl	$3, %ebx
	cmpl	%ecx, %ebx
	ja	.L3226
	jmp	.L3272
	.p2align 4,,10
	.p2align 3
.L3239:
	movl	%edi, %r8d
	movl	%edx, %ecx
.L3226:
	movl	%r8d, %eax
	addl	$1, %r11d
	mull	%r10d
	movl	%ebx, %eax
	movl	%edx, %edi
	mull	%r10d
	movl	%ecx, %eax
	shrl	$3, %edi
	movl	%edx, %ebx
	mull	%r10d
	shrl	$3, %ebx
	shrl	$3, %edx
	cmpl	%edx, %ebx
	ja	.L3239
	leal	(%rdi,%rdi,4), %eax
	movl	%r8d, %esi
	addl	%r11d, %r14d
	addl	%eax, %eax
	subl	%eax, %esi
.L3227:
	cmpl	%edi, %ecx
	sete	%r8b
	cmpb	$4, %sil
	seta	%al
	orl	%eax, %r8d
	movzbl	%r8b, %r8d
	addl	%edi, %r8d
.L3225:
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	salq	$32, %r14
	movl	%r8d, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	orq	%r14, %rax
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L3186:
	.cfi_restore_state
	movl	$1, %r13d
	movl	%esi, %eax
	sall	%cl, %r13d
	subl	%ebp, %eax
	orl	%edi, %r13d
	movl	%eax, %ebp
	movl	%r13d, %eax
	sall	$2, %r13d
	andl	$1, %eax
	testl	%edi, %edi
	movl	%eax, 32(%rsp)
	leal	2(%r13), %eax
	setne	%r12b
	cmpl	$1, %esi
	movl	%eax, 8(%rsp)
	setbe	%al
	orl	%eax, %r12d
	leal	-1(%r13), %eax
	movzbl	%r12b, %r12d
	subl	%r12d, %eax
	subl	$2, %ebp
	movl	%eax, 16(%rsp)
	jns	.L3187
	movl	%ebp, %esi
	negl	%esi
	jmp	.L3228
	.p2align 4,,10
	.p2align 3
.L3229:
	xorl	%esi, %esi
.L3194:
	movl	%r13d, %eax
	movl	$-858993459, %r11d
	mull	%r11d
	shrl	$2, %edx
	leal	(%rdx,%rdx,4), %eax
	cmpl	%eax, %r13d
	je	.L3273
	movl	32(%rsp), %ebp
	testl	%ebp, %ebp
	jne	.L3201
	movl	16(%rsp), %eax
	xorl	%r10d, %r10d
	mull	%r11d
	movl	%edx, %edi
	shrl	$2, %edi
	leal	(%rdi,%rdi,4), %eax
	cmpl	%eax, 16(%rsp)
	jne	.L3274
	.p2align 4,,10
	.p2align 3
.L3202:
	movl	%edi, %eax
	addl	$1, %r10d
	mull	%r11d
	shrl	$2, %edx
	leal	(%rdx,%rdx,4), %eax
	subl	%eax, %edi
	movl	%edi, %eax
	movl	%edx, %edi
	testl	%eax, %eax
	je	.L3202
.L3203:
	cmpl	%r12d, %r10d
	setnb	%r12b
	xorl	%r11d, %r11d
	movzbl	%r12b, %r12d
	jmp	.L3199
	.p2align 4,,10
	.p2align 3
.L3269:
	movl	%ebp, %esi
	movl	$1, %r12d
	negl	%esi
.L3228:
	cmpl	$-2620, %ebp
	jl	.L3275
	imull	$-732923, %ebp, %r15d
	shrl	$20, %r15d
	subl	%r15d, %esi
	leal	(%r15,%rbp), %r14d
	movl	%esi, %edi
	movl	%esi, %ebp
	call	strconv__ftoa__pow5_bits
	movl	%r15d, %r9d
	subl	$61, %eax
	movl	%ebp, %esi
	subl	%eax, %r9d
	movl	%r13d, %edi
	movl	%r9d, %edx
	movl	%r9d, 24(%rsp)
	call	strconv__ftoa__mul_pow5_div_pow2
	subq	$8, %rsp
	.cfi_def_cfa_offset 120
	movl	%eax, 28(%rsp)
	pushq	16+_const_strconv__ftoa__pow5_split_32(%rip)
	.cfi_def_cfa_offset 128
	pushq	8+_const_strconv__ftoa__pow5_split_32(%rip)
	.cfi_def_cfa_offset 136
	pushq	_const_strconv__ftoa__pow5_split_32(%rip)
	.cfi_def_cfa_offset 144
	movl	%ebp, %edi
	call	array_get
	movl	40(%rsp), %esi
	movq	(%rax), %rdx
	movq	_const_math__bits__mask32(%rip), %r10
	movl	56(%rsp), %r9d
	addq	$32, %rsp
	.cfi_def_cfa_offset 112
	movl	20(%rsp), %r8d
	movq	%rdx, %rax
	movq	%rsi, %rcx
	andq	%r10, %rax
	andq	%r10, %rcx
	imulq	%rcx, %rax
	shrq	$32, %rax
	andq	%r10, %rax
	movq	%rdx, %r10
	shrq	$32, %r10
	imulq	%rcx, %r10
	movl	$64, %ecx
	imulq	%rsi, %rdx
	subl	%r9d, %ecx
	addq	%rax, %r10
	shrq	$32, %r10
	movq	%r10, %rax
	salq	%cl, %rax
	movl	%r9d, %ecx
	shrq	%cl, %rdx
	leaq	(%rax,%rdx), %r10
	cmpq	$2147483647, %r10
	ja	.L3268
	movl	16(%rsp), %edi
	movl	%r9d, %edx
	movl	%ebp, %esi
	movl	%r8d, 20(%rsp)
	movl	%r10d, %ebx
	movq	%r10, 8(%rsp)
	call	strconv__ftoa__mul_pow5_div_pow2
	testl	%r15d, %r15d
	movl	%eax, %r9d
	movq	8(%rsp), %r10
	movl	20(%rsp), %r8d
	je	.L3233
	movl	$-858993459, %r11d
	xorl	%esi, %esi
	mull	%r11d
	movl	%edx, %ecx
	leal	-1(%r10), %edx
	shrl	$3, %ecx
	movl	%edx, %eax
	mull	%r11d
	shrl	$3, %edx
	cmpl	%ecx, %edx
	jbe	.L3276
.L3210:
	cmpl	$1, %r15d
	je	.L3209
	cmpl	$30, %r15d
	ja	.L3196
	subl	$1, %r15d
	testl	%r13d, %r13d
	movl	$32, %eax
	jne	.L3277
.L3214:
	xorl	%r11d, %r11d
	cmpl	%eax, %r15d
	setbe	%r11b
	xorl	%r12d, %r12d
.L3199:
	movl	%r12d, %eax
	orl	%r11d, %eax
	je	.L3196
	movl	%r11d, %edi
	andl	$1, %edi
.L3213:
	movl	%ebx, %eax
	movl	$-858993459, %r10d
	xorl	%ebp, %ebp
	mull	%r10d
	movl	%edx, %ebx
	shrl	$3, %ebx
	cmpl	%ecx, %ebx
	ja	.L3217
	jmp	.L3278
	.p2align 4,,10
	.p2align 3
.L3237:
	movl	%edx, %ecx
.L3217:
	testl	%r12d, %r12d
	je	.L3216
	movl	%r9d, %eax
	xorl	%r12d, %r12d
	mull	%r10d
	shrl	$3, %edx
	leal	(%rdx,%rdx,4), %eax
	addl	%eax, %eax
	cmpl	%eax, %r9d
	sete	%r12b
.L3216:
	testb	%sil, %sil
	movl	%r8d, %eax
	movl	%r8d, %esi
	sete	%dil
	addl	$1, %ebp
	movl	%ecx, %r9d
	mull	%r10d
	andl	%r11d, %edi
	movzbl	%dil, %r11d
	shrl	$3, %edx
	leal	(%rdx,%rdx,4), %eax
	movl	%edx, %r8d
	addl	%eax, %eax
	subl	%eax, %esi
	movl	%ebx, %eax
	mull	%r10d
	movl	%ecx, %eax
	movl	%edx, %ebx
	mull	%r10d
	shrl	$3, %ebx
	shrl	$3, %edx
	cmpl	%ebx, %edx
	jb	.L3237
.L3218:
	testl	%r12d, %r12d
	je	.L3219
	movl	$-858993459, %r9d
	jmp	.L3266
	.p2align 4,,10
	.p2align 3
.L3279:
	testb	%sil, %sil
	movl	%r8d, %eax
	movl	%r8d, %esi
	sete	%dil
	addl	$1, %ebp
	mull	%r9d
	andl	%r11d, %edi
	movzbl	%dil, %r11d
	shrl	$3, %edx
	leal	(%rdx,%rdx,4), %eax
	movl	%edx, %r8d
	addl	%eax, %eax
	subl	%eax, %esi
	movl	%ecx, %eax
	mull	%r9d
	movl	%edx, %ecx
	shrl	$3, %ecx
.L3266:
	movl	%ecx, %eax
	mull	%r9d
	shrl	$3, %edx
	leal	(%rdx,%rdx,4), %eax
	addl	%eax, %eax
	cmpl	%eax, %ecx
	je	.L3279
.L3219:
	addl	%ebp, %r14d
	cmpb	$5, %sil
	jne	.L3221
	testb	%dil, %dil
	je	.L3221
	testb	$1, %r8b
	jne	.L3223
	cmpl	%ecx, %r8d
	jne	.L3225
	andl	$1, %r12d
	je	.L3223
	movl	32(%rsp), %eax
	testl	%eax, %eax
	je	.L3225
	.p2align 4,,10
	.p2align 3
.L3223:
	addl	$1, %r8d
	jmp	.L3225
	.p2align 4,,10
	.p2align 3
.L3273:
	movl	%edx, %edi
	xorl	%r10d, %r10d
	.p2align 4,,10
	.p2align 3
.L3198:
	movl	%edi, %eax
	addl	$1, %r10d
	mull	%r11d
	shrl	$2, %edx
	leal	(%rdx,%rdx,4), %eax
	subl	%eax, %edi
	movl	%edi, %eax
	movl	%edx, %edi
	testl	%eax, %eax
	je	.L3198
	xorl	%r11d, %r11d
	cmpl	%r12d, %r10d
	setnb	%r11b
	xorl	%r12d, %r12d
	jmp	.L3199
	.p2align 4,,10
	.p2align 3
.L3221:
	cmpl	%ecx, %r8d
	je	.L3280
.L3224:
	cmpb	$4, %sil
	jbe	.L3225
	addl	$1, %r8d
	jmp	.L3225
	.p2align 4,,10
	.p2align 3
.L3233:
	xorl	%esi, %esi
.L3209:
	movl	$-858993459, %edx
	movl	%r9d, %eax
	movl	32(%rsp), %edi
	mull	%edx
	movl	%edx, %ecx
	shrl	$3, %ecx
	testl	%edi, %edi
	jne	.L3212
	movl	$1, %edi
	movl	$1, %r11d
	jmp	.L3213
	.p2align 4,,10
	.p2align 3
.L3271:
	leal	-1(%r12), %esi
	movl	%r8d, 44(%rsp)
	movl	%r9d, 40(%rsp)
	movl	%ecx, 36(%rsp)
	movq	%r10, 24(%rsp)
	movl	%esi, %edi
	movl	%esi, 20(%rsp)
	call	strconv__ftoa__pow5_bits
	movl	20(%rsp), %esi
	subl	%ebp, %eax
	movl	%r13d, %edi
	leal	57(%rax,%r12), %edx
	call	strconv__ftoa__mul_pow5_invdiv_pow2
	movl	%eax, %esi
	movl	44(%rsp), %r8d
	movl	40(%rsp), %r9d
	mull	%r15d
	movl	36(%rsp), %ecx
	movq	24(%rsp), %r10
	shrl	$3, %edx
	leal	(%rdx,%rdx,4), %eax
	addl	%eax, %eax
	subl	%eax, %esi
	jmp	.L3195
	.p2align 4,,10
	.p2align 3
.L3280:
	andl	$1, %r12d
	je	.L3223
	movl	32(%rsp), %edx
	testl	%edx, %edx
	je	.L3224
	jmp	.L3223
	.p2align 4,,10
	.p2align 3
.L3201:
	movl	8(%rsp), %eax
	xorl	%ebp, %ebp
	mull	%r11d
	movl	%edx, %edi
	shrl	$2, %edi
	leal	(%rdi,%rdi,4), %eax
	cmpl	%eax, 8(%rsp)
	jne	.L3206
	.p2align 4,,10
	.p2align 3
.L3204:
	movl	%edi, %eax
	addl	$1, %ebp
	mull	%r11d
	shrl	$2, %edx
	leal	(%rdx,%rdx,4), %eax
	subl	%eax, %edi
	movl	%edi, %eax
	movl	%edx, %edi
	testl	%eax, %eax
	je	.L3204
.L3206:
	subl	$1, %r10d
	cmpl	%ebp, %r12d
	cmovbe	%r10d, %ebx
	jmp	.L3196
	.p2align 4,,10
	.p2align 3
.L3272:
	movl	%r9d, %ecx
	movl	%r8d, %edi
	jmp	.L3227
	.p2align 4,,10
	.p2align 3
.L3278:
	movl	%r9d, %ecx
	jmp	.L3218
	.p2align 4,,10
	.p2align 3
.L3212:
	leal	-1(%r10), %ebx
	movl	$1, %edi
	movl	$1, %r11d
	xorl	%r12d, %r12d
	jmp	.L3213
	.p2align 4,,10
	.p2align 3
.L3276:
	addl	$1, %ebp
	movl	%r11d, 36(%rsp)
	movl	%r8d, 24(%rsp)
	movl	%ebp, %edi
	movl	%r9d, 20(%rsp)
	movl	%ecx, 16(%rsp)
	call	strconv__ftoa__pow5_bits
	movl	%r15d, %esi
	movl	%r13d, %edi
	subl	%eax, %esi
	leal	60(%rsi), %edx
	movl	%ebp, %esi
	call	strconv__ftoa__mul_pow5_div_pow2
	movl	36(%rsp), %r11d
	movl	%eax, %esi
	movl	24(%rsp), %r8d
	movl	20(%rsp), %r9d
	movq	8(%rsp), %r10
	movl	16(%rsp), %ecx
	mull	%r11d
	shrl	$3, %edx
	leal	(%rdx,%rdx,4), %eax
	addl	%eax, %eax
	subl	%eax, %esi
	jmp	.L3210
	.p2align 4,,10
	.p2align 3
.L3277:
	movl	%r13d, %edi
	movb	%sil, 24(%rsp)
	movl	%r8d, 20(%rsp)
	negl	%edi
	movl	%r9d, 8(%rsp)
	movl	%ecx, 16(%rsp)
	andl	%r13d, %edi
	subq	$8, %rsp
	.cfi_def_cfa_offset 120
	pushq	16+_const_math__bits__de_bruijn32tab(%rip)
	.cfi_def_cfa_offset 128
	imull	_const_math__bits__de_bruijn32(%rip), %edi
	pushq	8+_const_math__bits__de_bruijn32tab(%rip)
	.cfi_def_cfa_offset 136
	pushq	_const_math__bits__de_bruijn32tab(%rip)
	.cfi_def_cfa_offset 144
	shrl	$27, %edi
	call	array_get
	addq	$32, %rsp
	.cfi_def_cfa_offset 112
	movzbl	(%rax), %eax
	movzbl	24(%rsp), %esi
	movl	20(%rsp), %r8d
	movl	8(%rsp), %r9d
	movl	16(%rsp), %ecx
	jmp	.L3214
.L3274:
	movl	32(%rsp), %r10d
	jmp	.L3203
.L3268:
	leaq	.LC111(%rip), %rdi
	movl	$26, %esi
	call	v_panic
.L3270:
	leaq	.LC113(%rip), %rdi
	movl	$9, %esi
	call	v_panic
.L3275:
	leaq	.LC114(%rip), %rdi
	movl	$9, %esi
	call	v_panic
	.cfi_endproc
.LFE385:
	.size	strconv__ftoa__f32_to_decimal, .-strconv__ftoa__f32_to_decimal
	.section	.text.strconv__ftoa__f32_to_str,"ax",@progbits
	.p2align 4,,15
	.globl	strconv__ftoa__f32_to_str
	.type	strconv__ftoa__f32_to_str, @function
strconv__ftoa__f32_to_str:
.LFB386:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movd	%xmm0, %ebx
	movl	$-1, %eax
	movd	%xmm0, %r8d
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movl	_const_strconv__ftoa__mantbits32(%rip), %r10d
	movl	_const_strconv__ftoa__expbits32(%rip), %esi
	movl	%eax, %r9d
	leal	(%r10,%rsi), %ecx
	shrl	%cl, %ebx
	movl	%r10d, %ecx
	sall	%cl, %r9d
	movl	%esi, %ecx
	sall	%cl, %eax
	notl	%r9d
	movl	%r10d, %ecx
	movl	%eax, %esi
	andl	%r8d, %r9d
	shrl	%cl, %r8d
	notl	%esi
	andl	%r8d, %esi
	cmpl	$255, %esi
	je	.L3282
	movl	%r9d, %eax
	orl	%esi, %eax
	jne	.L3301
	cmpl	$1, %ebx
	leaq	.LC109(%rip), %rax
	leaq	.LC110(%rip), %rcx
	sbbl	%edx, %edx
	addl	$6, %edx
	testl	%ebx, %ebx
	cmove	%rcx, %rax
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L3301:
	.cfi_restore_state
	movl	%esi, %eax
	subl	_const_strconv__ftoa__bias32(%rip), %eax
	movl	%edi, %ebp
	cmpl	%eax, %r10d
	jb	.L3288
	movl	%r10d, %ecx
	subl	%eax, %ecx
	movl	%r9d, %eax
	orl	$8388608, %eax
	movl	%eax, %r8d
	shrl	%cl, %r8d
	movl	%r8d, %edx
	sall	%cl, %edx
	cmpl	%edx, %eax
	jne	.L3288
	movl	%r8d, %eax
	movl	$-858993459, %esi
	mull	%esi
	shrl	$3, %edx
	leal	(%rdx,%rdx,4), %eax
	addl	%eax, %eax
	cmpl	%eax, %r8d
	jne	.L3295
	movl	$1, %ecx
	.p2align 4,,10
	.p2align 3
.L3290:
	movl	%r8d, %eax
	movl	%ecx, %edi
	addl	$1, %ecx
	mull	%esi
	movl	%edx, %r8d
	shrl	$3, %r8d
	movl	%r8d, %eax
	mull	%esi
	shrl	$3, %edx
	leal	(%rdx,%rdx,4), %edx
	addl	%edx, %edx
	cmpl	%edx, %r8d
	je	.L3290
.L3289:
	salq	$32, %rdi
	movl	%r8d, %eax
	orq	%rax, %rdi
	jmp	.L3291
	.p2align 4,,10
	.p2align 3
.L3288:
	movl	%r9d, %edi
	call	strconv__ftoa__f32_to_decimal
	movq	%rax, %rdi
.L3291:
	xorl	%esi, %esi
	testl	%ebx, %ebx
	movl	%ebp, %edx
	setne	%sil
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	jmp	strconv__ftoa__Dec32_get_string_32
	.p2align 4,,10
	.p2align 3
.L3282:
	.cfi_restore_state
	testl	%r9d, %r9d
	je	.L3302
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	movl	$3, %edx
	leaq	.LC108(%rip), %rax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L3302:
	.cfi_restore_state
	leaq	.LC107(%rip), %rdx
	leaq	.LC106(%rip), %rax
	testl	%ebx, %ebx
	cmove	%rdx, %rax
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	movl	$4, %edx
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L3295:
	.cfi_restore_state
	xorl	%edi, %edi
	jmp	.L3289
	.cfi_endproc
.LFE386:
	.size	strconv__ftoa__f32_to_str, .-strconv__ftoa__f32_to_str
	.section	.text.f32_strsci,"ax",@progbits
	.p2align 4,,15
	.globl	f32_strsci
	.type	f32_strsci, @function
f32_strsci:
.LFB156:
	.cfi_startproc
	cmpl	$8, %edi
	movl	$8, %eax
	cmovg	%eax, %edi
	movl	$1, %eax
	testl	%edi, %edi
	cmovle	%eax, %edi
	jmp	strconv__ftoa__f32_to_str
	.cfi_endproc
.LFE156:
	.size	f32_strsci, .-f32_strsci
	.section	.text.strconv__ftoa__ftoa_32,"ax",@progbits
	.p2align 4,,15
	.globl	strconv__ftoa__ftoa_32
	.type	strconv__ftoa__ftoa_32, @function
strconv__ftoa__ftoa_32:
.LFB393:
	.cfi_startproc
	movl	$8, %edi
	jmp	strconv__ftoa__f32_to_str
	.cfi_endproc
.LFE393:
	.size	strconv__ftoa__ftoa_32, .-strconv__ftoa__ftoa_32
	.section	.text.f32_str,"ax",@progbits
	.p2align 4,,15
	.globl	f32_str
	.type	f32_str, @function
f32_str:
.LFB155:
	.cfi_startproc
	movl	$8, %edi
	jmp	strconv__ftoa__f32_to_str
	.cfi_endproc
.LFE155:
	.size	f32_str, .-f32_str
	.section	.text.strconv__ftoa__decimal_len_64,"ax",@progbits
	.p2align 4,,15
	.globl	strconv__ftoa__decimal_len_64
	.type	strconv__ftoa__decimal_len_64, @function
strconv__ftoa__decimal_len_64:
.LFB410:
	.cfi_startproc
	movl	$4294967295, %eax
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	cmpq	%rax, %rdi
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rdi, %rbp
	jbe	.L3310
	shrq	$32, %rdi
	movl	$48, %eax
	movl	$32, %r12d
.L3307:
	cmpq	$65535, %rdi
	jbe	.L3308
	shrq	$16, %rdi
	movl	%eax, %r12d
.L3308:
	cmpq	$255, %rdi
	jbe	.L3309
	shrq	$8, %rdi
	addl	$8, %r12d
.L3309:
	subq	$8, %rsp
	.cfi_def_cfa_offset 40
	pushq	16+_const_math__bits__len_8_tab(%rip)
	.cfi_def_cfa_offset 48
	pushq	8+_const_math__bits__len_8_tab(%rip)
	.cfi_def_cfa_offset 56
	pushq	_const_math__bits__len_8_tab(%rip)
	.cfi_def_cfa_offset 64
	call	array_get
	movzbl	(%rax), %ebx
	addq	$24, %rsp
	.cfi_def_cfa_offset 40
	pushq	16+_const_strconv__ftoa__powers_of_10(%rip)
	.cfi_def_cfa_offset 48
	pushq	8+_const_strconv__ftoa__powers_of_10(%rip)
	.cfi_def_cfa_offset 56
	pushq	_const_strconv__ftoa__powers_of_10(%rip)
	.cfi_def_cfa_offset 64
	addl	%r12d, %ebx
	imull	$1233, %ebx, %ebx
	sarl	$12, %ebx
	movl	%ebx, %edi
	call	array_get
	addq	$32, %rsp
	.cfi_def_cfa_offset 32
	cmpq	%rbp, (%rax)
	setbe	%al
	movzbl	%al, %eax
	addl	%ebx, %eax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L3310:
	.cfi_restore_state
	movl	$16, %eax
	xorl	%r12d, %r12d
	jmp	.L3307
	.cfi_endproc
.LFE410:
	.size	strconv__ftoa__decimal_len_64, .-strconv__ftoa__decimal_len_64
	.section	.rodata.str1.1
.LC116:
	.string	"shift < 64"
	.section	.text.strconv__ftoa__shift_right_128,"ax",@progbits
	.p2align 4,,15
	.globl	strconv__ftoa__shift_right_128
	.type	strconv__ftoa__shift_right_128, @function
strconv__ftoa__shift_right_128:
.LFB411:
	.cfi_startproc
	cmpl	$63, %edx
	jg	.L3317
	movl	$64, %ecx
	subl	%edx, %ecx
	salq	%cl, %rsi
	movl	%edx, %ecx
	shrq	%cl, %rdi
	movq	%rsi, %rax
	orq	%rdi, %rax
	ret
.L3317:
	leaq	.LC116(%rip), %rdi
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$10, %esi
	call	v_panic
	.cfi_endproc
.LFE411:
	.size	strconv__ftoa__shift_right_128, .-strconv__ftoa__shift_right_128
	.section	.text.strconv__ftoa__mul_shift_64,"ax",@progbits
	.p2align 4,,15
	.globl	strconv__ftoa__mul_shift_64
	.type	strconv__ftoa__mul_shift_64, @function
strconv__ftoa__mul_shift_64:
.LFB412:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movq	_const_math__bits__mask32(%rip), %r12
	movq	%rdx, %r8
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rdi, %rbx
	movq	%rdi, %rbp
	movq	%rdx, %rax
	andq	%r12, %rbx
	andq	%r12, %r8
	shrq	$32, %rbp
	movq	%rbx, %r10
	shrq	$32, %rax
	imulq	%r8, %r10
	imulq	%rbp, %r8
	imulq	%rdx, %rdi
	movq	%r10, %r9
	shrq	$32, %r9
	leaq	(%r9,%r8), %r10
	movq	%rbp, %r9
	movq	%r12, %r8
	imulq	%rax, %r9
	imulq	%rbx, %rax
	andq	%r10, %r8
	shrq	$32, %r10
	addq	%r9, %r10
	addq	%r8, %rax
	movq	%rsi, %r8
	shrq	$32, %rsi
	andq	%r12, %r8
	movq	%rsi, %r11
	shrq	$32, %rax
	movq	%r8, %r9
	imulq	%rbx, %r9
	imulq	%rbp, %r8
	imulq	%rbx, %r11
	shrq	$32, %r9
	addq	%r9, %r8
	imulq	%rsi, %rbp
	andq	%r8, %r12
	shrq	$32, %r8
	addq	%r12, %r11
	shrq	$32, %r11
	addq	%rbp, %r8
	leaq	(%r8,%r11), %rsi
	addq	%rdi, %rsi
	adcq	%rax, %r10
	leal	-64(%rcx), %eax
	cmpl	$63, %eax
	jg	.L3325
	movl	$64, %ecx
	subl	%eax, %ecx
	salq	%cl, %r10
	movl	%eax, %ecx
	shrq	%cl, %rsi
	movq	%r10, %rax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	orq	%rsi, %rax
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L3325:
	.cfi_restore_state
	leaq	.LC116(%rip), %rdi
	movl	$10, %esi
	call	v_panic
	.cfi_endproc
.LFE412:
	.size	strconv__ftoa__mul_shift_64, .-strconv__ftoa__mul_shift_64
	.section	.text.strconv__ftoa__f64_to_decimal,"ax",@progbits
	.p2align 4,,15
	.globl	strconv__ftoa__f64_to_decimal
	.type	strconv__ftoa__f64_to_decimal, @function
strconv__ftoa__f64_to_decimal:
.LFB389:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	movl	_const_strconv__ftoa__bias64(%rip), %ebx
	movl	_const_strconv__ftoa__mantbits64(%rip), %ecx
	addl	%ecx, %ebx
	testq	%rsi, %rsi
	jne	.L3327
	movq	%rdi, %rax
	leaq	0(,%rdi,4), %r12
	movl	$1, %ebp
	andl	$1, %eax
	xorl	$-1, %ebx
	movq	%rax, 24(%rsp)
	js	.L3388
.L3328:
	cmpl	$1650, %ebx
	jg	.L3393
	imull	$78913, %ebx, %r9d
	xorl	%eax, %eax
	shrl	$18, %r9d
	cmpl	$3, %ebx
	setg	%al
	movl	%r9d, %r14d
	subl	%eax, %r14d
	movl	%r14d, %edi
	movl	%r14d, 20(%rsp)
	call	strconv__ftoa__pow5_bits
	subq	$8, %rsp
	.cfi_def_cfa_offset 120
	movl	%r14d, %edx
	pushq	16+_const_strconv__ftoa__pow5_inv_split_64(%rip)
	.cfi_def_cfa_offset 128
	pushq	8+_const_strconv__ftoa__pow5_inv_split_64(%rip)
	.cfi_def_cfa_offset 136
	pushq	_const_strconv__ftoa__pow5_inv_split_64(%rip)
	.cfi_def_cfa_offset 144
	subl	%ebx, %edx
	movl	%r14d, %edi
	leal	121(%rax,%rdx), %r15d
	call	array_get
	movq	8(%rax), %r13
	movq	(%rax), %rbx
	addq	$32, %rsp
	.cfi_def_cfa_offset 112
	movl	%r15d, %ecx
	movq	%r12, %rdi
	movq	%r13, %rdx
	movq	%rbx, %rsi
	call	strconv__ftoa__mul_shift_64
	movq	%rax, 32(%rsp)
	leaq	2(%r12), %rax
	movq	%r13, %rdx
	movl	%r15d, %ecx
	movq	%rbx, %rsi
	movq	%rax, %rdi
	movq	%rax, 40(%rsp)
	call	strconv__ftoa__mul_shift_64
	movq	%rax, 8(%rsp)
	leaq	-1(%r12), %rax
	movq	%r13, %rdx
	movl	%r15d, %ecx
	movq	%rbx, %rsi
	subq	%rbp, %rax
	movq	%rax, %rdi
	movq	%rax, %rbp
	call	strconv__ftoa__mul_shift_64
	cmpl	$21, %r14d
	movq	%rax, %r13
	movq	32(%rsp), %r8
	jbe	.L3394
.L3392:
	xorl	%r9d, %r9d
.L3389:
	movq	8(%rsp), %rdi
	movabsq	$2951479051793528259, %r11
	shrq	$2, %rdi
	movq	%rdi, %rax
	mulq	%r11
	movq	%rdx, %rdi
	movq	%r13, %rdx
	shrq	$2, %rdx
	shrq	$2, %rdi
	movq	%rdx, %rax
	mulq	%r11
	shrq	$2, %rdx
	cmpq	%rdx, %rdi
	movq	%rdx, %r10
	ja	.L3349
	xorl	%ebp, %ebp
	movq	%r13, %r10
	movq	8(%rsp), %rdi
	movq	%r8, %rsi
	jmp	.L3350
	.p2align 4,,10
	.p2align 3
.L3372:
	movq	%rsi, %r8
	movq	%rdx, %r10
	movq	%rcx, %rdi
.L3349:
	movq	%r8, %rdx
	addl	$2, %r9d
	shrq	$2, %rdx
	movq	%rdx, %rax
	mulq	%r11
	movq	%rdx, %rsi
	movq	%rdi, %rdx
	shrq	$2, %rdx
	shrq	$2, %rsi
	movq	%rdx, %rax
	mulq	%r11
	movq	%rdx, %rcx
	movq	%r10, %rdx
	shrq	$2, %rdx
	shrq	$2, %rcx
	movq	%rdx, %rax
	mulq	%r11
	shrq	$2, %rdx
	cmpq	%rdx, %rcx
	ja	.L3372
	leaq	(%rsi,%rsi,4), %rax
	xorl	%ebp, %ebp
	leaq	(%rax,%rax,4), %rax
	salq	$2, %rax
	subq	%rax, %r8
	cmpq	$49, %r8
	seta	%bpl
.L3350:
	movq	%rdi, %rax
	movabsq	$-3689348814741910323, %r8
	mulq	%r8
	movq	%r10, %rax
	movq	%rdx, %rdi
	mulq	%r8
	shrq	$3, %rdi
	shrq	$3, %rdx
	cmpq	%rdi, %rdx
	movq	%rdx, %r11
	jb	.L3361
	jmp	.L3373
	.p2align 4,,10
	.p2align 3
.L3374:
	movq	%rcx, %rsi
	movq	%rdx, %r11
.L3361:
	movq	%rsi, %rax
	addl	$1, %r9d
	mulq	%r8
	movq	%rdi, %rax
	movq	%rdx, %rcx
	mulq	%r8
	movq	%r11, %rax
	shrq	$3, %rcx
	movq	%rdx, %rdi
	mulq	%r8
	shrq	$3, %rdi
	shrq	$3, %rdx
	cmpq	%rdx, %rdi
	ja	.L3374
	leaq	(%rcx,%rcx,4), %rax
	xorl	%ebp, %ebp
	addq	%rax, %rax
	subq	%rax, %rsi
	cmpq	$4, %rsi
	seta	%bpl
.L3360:
	cmpq	%r11, %rcx
	sete	%dl
	orl	%edx, %ebp
	movzbl	%bpl, %edx
	addq	%rdx, %rcx
.L3359:
	movl	20(%rsp), %edx
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%rcx, %rax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	addl	%r9d, %edx
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L3327:
	.cfi_restore_state
	movl	$1, %r12d
	movl	%esi, %eax
	salq	%cl, %r12
	subl	%ebx, %eax
	orq	%rdi, %r12
	movl	%eax, %ebx
	movq	%r12, %rax
	salq	$2, %r12
	andl	$1, %eax
	testq	%rdi, %rdi
	setne	%bpl
	cmpq	$1, %rsi
	movq	%rax, 24(%rsp)
	setbe	%al
	orl	%eax, %ebp
	subl	$2, %ebx
	movzbl	%bpl, %ebp
	jns	.L3328
.L3388:
	movl	%ebx, %eax
	negl	%eax
	cmpl	$-2620, %ebx
	jl	.L3395
	imull	$-732923, %ebx, %r9d
	xorl	%edx, %edx
	shrl	$20, %r9d
	cmpl	$-1, %ebx
	setne	%dl
	movl	%r9d, %r15d
	subl	%edx, %r15d
	subl	%r15d, %eax
	addl	%r15d, %ebx
	movl	%eax, %edi
	movl	%ebx, 20(%rsp)
	movl	%eax, %ebx
	call	strconv__ftoa__pow5_bits
	movl	%r15d, %esi
	subl	$121, %eax
	subq	$8, %rsp
	.cfi_def_cfa_offset 120
	subl	%eax, %esi
	movl	%ebx, %edi
	movl	%esi, 16(%rsp)
	pushq	16+_const_strconv__ftoa__pow5_split_64(%rip)
	.cfi_def_cfa_offset 128
	pushq	8+_const_strconv__ftoa__pow5_split_64(%rip)
	.cfi_def_cfa_offset 136
	pushq	_const_strconv__ftoa__pow5_split_64(%rip)
	.cfi_def_cfa_offset 144
	call	array_get
	addq	$32, %rsp
	.cfi_def_cfa_offset 112
	movq	8(%rax), %r13
	movq	(%rax), %r14
	movl	8(%rsp), %ebx
	movq	%r12, %rdi
	movq	%r13, %rdx
	movq	%r14, %rsi
	movl	%ebx, %ecx
	call	strconv__ftoa__mul_shift_64
	leaq	2(%r12), %rdi
	movq	%r13, %rdx
	movl	%ebx, %ecx
	movq	%r14, %rsi
	movq	%rax, 32(%rsp)
	call	strconv__ftoa__mul_shift_64
	leaq	-1(%r12), %rdi
	movq	%r13, %rdx
	movl	%ebx, %ecx
	movq	%r14, %rsi
	movq	%rax, 8(%rsp)
	subq	%rbp, %rdi
	call	strconv__ftoa__mul_shift_64
	cmpl	$1, %r15d
	movq	%rax, %r13
	movq	32(%rsp), %r8
	jbe	.L3396
	cmpl	$62, %r15d
	ja	.L3392
	testq	%r12, %r12
	leal	-1(%r15), %ebp
	movl	$64, %eax
	jne	.L3397
.L3347:
	xorl	%r10d, %r10d
	cmpl	%eax, %ebp
	setbe	%r10b
	xorl	%ebp, %ebp
	movl	%r10d, %r9d
	jmp	.L3342
	.p2align 4,,10
	.p2align 3
.L3394:
	movq	%r12, %rax
	movabsq	$-3689348814741910323, %rsi
	mulq	%rsi
	shrq	$2, %rdx
	leaq	(%rdx,%rdx,4), %rax
	cmpq	%rax, %r12
	je	.L3398
	cmpq	$0, 24(%rsp)
	jne	.L3336
	movq	%rbp, %rax
	xorl	%edi, %edi
	mulq	%rsi
	movq	%rdx, %rcx
	shrq	$2, %rcx
	leaq	(%rcx,%rcx,4), %rax
	cmpq	%rax, %rbp
	jne	.L3338
	.p2align 4,,10
	.p2align 3
.L3337:
	movq	%rcx, %rax
	addl	$1, %edi
	mulq	%rsi
	shrq	$2, %rdx
	leaq	(%rdx,%rdx,4), %rax
	subq	%rax, %rcx
	movq	%rcx, %rax
	movq	%rdx, %rcx
	testq	%rax, %rax
	je	.L3337
.L3338:
	xorl	%ebp, %ebp
	cmpl	%edi, %r14d
	setbe	%bpl
	xorl	%r10d, %r10d
	movl	%ebp, %r9d
	jmp	.L3342
	.p2align 4,,10
	.p2align 3
.L3398:
	movq	%rdx, %rcx
	xorl	%edi, %edi
	.p2align 4,,10
	.p2align 3
.L3334:
	movq	%rcx, %rax
	addl	$1, %edi
	mulq	%rsi
	shrq	$2, %rdx
	leaq	(%rdx,%rdx,4), %rax
	subq	%rax, %rcx
	movq	%rcx, %rax
	movq	%rdx, %rcx
	testq	%rax, %rax
	je	.L3334
	xorl	%r10d, %r10d
	cmpl	%edi, %r14d
	setbe	%r10b
	xorl	%ebp, %ebp
	movl	%r10d, %r9d
.L3342:
	testl	%r9d, %r9d
	je	.L3389
.L3348:
	movq	8(%rsp), %rax
	movabsq	$-3689348814741910323, %rdi
	mulq	%rdi
	movq	%r13, %rax
	movq	%rdx, %rbx
	mulq	%rdi
	shrq	$3, %rbx
	movq	%rdx, %rsi
	shrq	$3, %rsi
	cmpq	%rbx, %rsi
	jnb	.L3369
	xorl	%r11d, %r11d
	xorl	%r9d, %r9d
	jmp	.L3352
	.p2align 4,,10
	.p2align 3
.L3370:
	movq	%r12, %rsi
.L3352:
	movq	%r8, %rax
	mulq	%rdi
	movq	%r13, %rax
	movq	%rdx, %rcx
	mulq	%rdi
	shrq	$3, %rcx
	shrq	$3, %rdx
	leaq	(%rdx,%rdx,4), %rax
	addq	%rax, %rax
	cmpq	%rax, %r13
	movq	%rsi, %r13
	sete	%al
	movzbl	%al, %eax
	andl	%eax, %ebp
	testb	%r11b, %r11b
	movl	%r8d, %r11d
	sete	%al
	addl	$1, %r9d
	movq	%rcx, %r8
	andl	%eax, %r10d
	leaq	(%rcx,%rcx,4), %rax
	addq	%rax, %rax
	subl	%eax, %r11d
	movq	%rbx, %rax
	mulq	%rdi
	movq	%rsi, %rax
	movq	%rdx, %rbx
	mulq	%rdi
	shrq	$3, %rbx
	shrq	$3, %rdx
	cmpq	%rdx, %rbx
	movq	%rdx, %r12
	ja	.L3370
.L3351:
	testl	%ebp, %ebp
	je	.L3353
	movq	%rsi, %rax
	movabsq	$-3689348814741910323, %rdi
	mulq	%rdi
	shrq	$3, %rdx
	leaq	(%rdx,%rdx,4), %rax
	addq	%rax, %rax
	cmpq	%rax, %rsi
	jne	.L3353
	movq	%r12, %rsi
	movq	%rcx, %r8
	jmp	.L3354
	.p2align 4,,10
	.p2align 3
.L3371:
	movq	%rdx, %rsi
.L3354:
	movq	%rcx, %rax
	mulq	%rdi
	movq	%rdx, %rcx
	shrq	$3, %rcx
	testb	%r11b, %r11b
	movl	%r8d, %r11d
	sete	%al
	addl	$1, %r9d
	movq	%rcx, %r8
	andl	%eax, %r10d
	leaq	(%rcx,%rcx,4), %rax
	addq	%rax, %rax
	subl	%eax, %r11d
	movq	%rsi, %rax
	mulq	%rdi
	shrq	$3, %rdx
	leaq	(%rdx,%rdx,4), %rax
	addq	%rax, %rax
	cmpq	%rax, %rsi
	je	.L3371
.L3353:
	cmpb	$5, %r11b
	jne	.L3355
	testl	%r10d, %r10d
	je	.L3355
	testb	$1, %cl
	jne	.L3357
	cmpq	%rsi, %rcx
	jne	.L3359
	andl	$1, %ebp
	je	.L3357
	cmpq	$0, 24(%rsp)
	je	.L3359
	.p2align 4,,10
	.p2align 3
.L3357:
	addq	$1, %rcx
	jmp	.L3359
	.p2align 4,,10
	.p2align 3
.L3355:
	cmpq	%rsi, %rcx
	je	.L3399
.L3358:
	cmpb	$4, %r11b
	jbe	.L3359
	addq	$1, %rcx
	jmp	.L3359
	.p2align 4,,10
	.p2align 3
.L3396:
	cmpq	$0, 24(%rsp)
	movl	$1, %r10d
	je	.L3348
	subq	$1, 8(%rsp)
	movl	$1, %r10d
	xorl	%ebp, %ebp
	jmp	.L3348
	.p2align 4,,10
	.p2align 3
.L3399:
	andl	$1, %ebp
	je	.L3357
	cmpq	$0, 24(%rsp)
	je	.L3358
	jmp	.L3357
	.p2align 4,,10
	.p2align 3
.L3336:
	movq	40(%rsp), %rax
	xorl	%edi, %edi
	mulq	%rsi
	movq	%rdx, %rcx
	shrq	$2, %rcx
	leaq	(%rcx,%rcx,4), %rax
	cmpq	%rax, 40(%rsp)
	jne	.L3341
	.p2align 4,,10
	.p2align 3
.L3339:
	movq	%rcx, %rax
	addl	$1, %edi
	mulq	%rsi
	shrq	$2, %rdx
	leaq	(%rdx,%rdx,4), %rax
	subq	%rax, %rcx
	movq	%rcx, %rax
	movq	%rdx, %rcx
	testq	%rax, %rax
	je	.L3339
.L3341:
	cmpl	%edi, %r14d
	ja	.L3392
	subq	$1, 8(%rsp)
	jmp	.L3392
	.p2align 4,,10
	.p2align 3
.L3369:
	movq	%rsi, %r12
	movq	%r8, %rcx
	movq	%r13, %rsi
	xorl	%r11d, %r11d
	xorl	%r9d, %r9d
	jmp	.L3351
	.p2align 4,,10
	.p2align 3
.L3373:
	movq	%r10, %r11
	movq	%rsi, %rcx
	jmp	.L3360
	.p2align 4,,10
	.p2align 3
.L3397:
	movq	%r12, %rdi
	movq	%r8, 32(%rsp)
	subq	$8, %rsp
	.cfi_def_cfa_offset 120
	negq	%rdi
	pushq	16+_const_math__bits__de_bruijn64tab(%rip)
	.cfi_def_cfa_offset 128
	pushq	8+_const_math__bits__de_bruijn64tab(%rip)
	.cfi_def_cfa_offset 136
	andq	%r12, %rdi
	pushq	_const_math__bits__de_bruijn64tab(%rip)
	.cfi_def_cfa_offset 144
	imulq	_const_math__bits__de_bruijn64(%rip), %rdi
	shrq	$58, %rdi
	call	array_get
	addq	$32, %rsp
	.cfi_def_cfa_offset 112
	movzbl	(%rax), %eax
	movq	32(%rsp), %r8
	jmp	.L3347
.L3393:
	leaq	.LC113(%rip), %rdi
	movl	$9, %esi
	call	v_panic
.L3395:
	leaq	.LC114(%rip), %rdi
	movl	$9, %esi
	call	v_panic
	.cfi_endproc
.LFE389:
	.size	strconv__ftoa__f64_to_decimal, .-strconv__ftoa__f64_to_decimal
	.section	.text.strconv__ftoa__f64_to_str,"ax",@progbits
	.p2align 4,,15
	.globl	strconv__ftoa__f64_to_str
	.type	strconv__ftoa__f64_to_str, @function
strconv__ftoa__f64_to_str:
.LFB390:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%xmm0, %rbx
	movq	$-1, %rax
	movq	%xmm0, %rdx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movl	_const_strconv__ftoa__mantbits64(%rip), %r9d
	movl	_const_strconv__ftoa__expbits64(%rip), %esi
	movq	%rax, %r8
	leal	(%r9,%rsi), %ecx
	shrq	%cl, %rbx
	movl	%r9d, %ecx
	salq	%cl, %r8
	movl	%esi, %ecx
	salq	%cl, %rax
	notq	%r8
	movl	%r9d, %ecx
	movq	%rax, %rsi
	andq	%rdx, %r8
	shrq	%cl, %rdx
	notq	%rsi
	andq	%rdx, %rsi
	cmpq	$2047, %rsi
	je	.L3401
	movq	%r8, %rax
	orq	%rsi, %rax
	jne	.L3420
	cmpq	$1, %rbx
	leaq	.LC109(%rip), %rax
	leaq	.LC110(%rip), %rcx
	sbbl	%edx, %edx
	addl	$6, %edx
	testq	%rbx, %rbx
	cmove	%rcx, %rax
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L3420:
	.cfi_restore_state
	movl	_const_strconv__ftoa__bias64(%rip), %eax
	movl	%edi, %ebp
	movq	%rsi, %rdi
	movl	%r9d, %edx
	subq	%rax, %rdi
	cmpq	%rdx, %rdi
	ja	.L3407
	movabsq	$4503599627370496, %rax
	movl	%r9d, %ecx
	orq	%r8, %rax
	subl	%edi, %ecx
	movq	%rax, %r9
	shrq	%cl, %r9
	movq	%r9, %rdx
	salq	%cl, %rdx
	cmpq	%rdx, %rax
	jne	.L3407
	movq	%r9, %rax
	movabsq	$-3689348814741910323, %r8
	mulq	%r8
	shrq	$3, %rdx
	leaq	(%rdx,%rdx,4), %rax
	addq	%rax, %rax
	cmpq	%rax, %r9
	jne	.L3414
	movl	$1, %ecx
	.p2align 4,,10
	.p2align 3
.L3409:
	movq	%r9, %rax
	movl	%ecx, %esi
	addl	$1, %ecx
	mulq	%r8
	movq	%rdx, %r9
	shrq	$3, %r9
	movq	%r9, %rax
	mulq	%r8
	shrq	$3, %rdx
	leaq	(%rdx,%rdx,4), %rax
	addq	%rax, %rax
	cmpq	%rax, %r9
	je	.L3409
.L3408:
	movq	%r9, %rdi
	jmp	.L3410
	.p2align 4,,10
	.p2align 3
.L3407:
	movq	%r8, %rdi
	call	strconv__ftoa__f64_to_decimal
	movq	%rax, %rdi
	movq	%rdx, %rsi
.L3410:
	xorl	%edx, %edx
	testq	%rbx, %rbx
	movl	%ebp, %ecx
	setne	%dl
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	jmp	strconv__ftoa__Dec64_get_string_64
	.p2align 4,,10
	.p2align 3
.L3401:
	.cfi_restore_state
	testq	%r8, %r8
	je	.L3421
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	movl	$3, %edx
	leaq	.LC108(%rip), %rax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L3421:
	.cfi_restore_state
	leaq	.LC107(%rip), %rdx
	leaq	.LC106(%rip), %rax
	testq	%rbx, %rbx
	cmove	%rdx, %rax
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	movl	$4, %edx
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L3414:
	.cfi_restore_state
	xorl	%esi, %esi
	jmp	.L3408
	.cfi_endproc
.LFE390:
	.size	strconv__ftoa__f64_to_str, .-strconv__ftoa__f64_to_str
	.section	.text.f64_strsci,"ax",@progbits
	.p2align 4,,15
	.globl	f64_strsci
	.type	f64_strsci, @function
f64_strsci:
.LFB153:
	.cfi_startproc
	cmpl	$17, %edi
	movl	$17, %eax
	cmovg	%eax, %edi
	movl	$1, %eax
	testl	%edi, %edi
	cmovle	%eax, %edi
	jmp	strconv__ftoa__f64_to_str
	.cfi_endproc
.LFE153:
	.size	f64_strsci, .-f64_strsci
	.section	.text.strconv__ftoa__ftoa_64,"ax",@progbits
	.p2align 4,,15
	.globl	strconv__ftoa__ftoa_64
	.type	strconv__ftoa__ftoa_64, @function
strconv__ftoa__ftoa_64:
.LFB391:
	.cfi_startproc
	movl	$17, %edi
	jmp	strconv__ftoa__f64_to_str
	.cfi_endproc
.LFE391:
	.size	strconv__ftoa__ftoa_64, .-strconv__ftoa__ftoa_64
	.section	.text.f64_str,"ax",@progbits
	.p2align 4,,15
	.globl	f64_str
	.type	f64_str, @function
f64_str:
.LFB152:
	.cfi_startproc
	movl	$17, %edi
	jmp	strconv__ftoa__f64_to_str
	.cfi_endproc
.LFE152:
	.size	f64_str, .-f64_str
	.section	.text.strconv__ftoa__pow5_factor_64,"ax",@progbits
	.p2align 4,,15
	.globl	strconv__ftoa__pow5_factor_64
	.type	strconv__ftoa__pow5_factor_64, @function
strconv__ftoa__pow5_factor_64:
.LFB413:
	.cfi_startproc
	movq	%rdi, %rax
	movabsq	$-3689348814741910323, %r8
	xorl	%esi, %esi
	mulq	%r8
	shrq	$2, %rdx
	leaq	(%rdx,%rdx,4), %rax
	movq	%rdx, %rcx
	cmpq	%rax, %rdi
	jne	.L3425
	.p2align 4,,10
	.p2align 3
.L3426:
	movq	%rcx, %rax
	addl	$1, %esi
	mulq	%r8
	shrq	$2, %rdx
	leaq	(%rdx,%rdx,4), %rax
	subq	%rax, %rcx
	movq	%rcx, %rax
	movq	%rdx, %rcx
	testq	%rax, %rax
	je	.L3426
.L3425:
	movl	%esi, %eax
	ret
	.cfi_endproc
.LFE413:
	.size	strconv__ftoa__pow5_factor_64, .-strconv__ftoa__pow5_factor_64
	.section	.text.strconv__ftoa__multiple_of_power_of_five_64,"ax",@progbits
	.p2align 4,,15
	.globl	strconv__ftoa__multiple_of_power_of_five_64
	.type	strconv__ftoa__multiple_of_power_of_five_64, @function
strconv__ftoa__multiple_of_power_of_five_64:
.LFB414:
	.cfi_startproc
	movq	%rdi, %rax
	movabsq	$-3689348814741910323, %r9
	xorl	%r8d, %r8d
	mulq	%r9
	shrq	$2, %rdx
	leaq	(%rdx,%rdx,4), %rax
	movq	%rdx, %rcx
	cmpq	%rax, %rdi
	jne	.L3432
	.p2align 4,,10
	.p2align 3
.L3431:
	movq	%rcx, %rax
	addl	$1, %r8d
	mulq	%r9
	shrq	$2, %rdx
	leaq	(%rdx,%rdx,4), %rax
	subq	%rax, %rcx
	movq	%rcx, %rax
	movq	%rdx, %rcx
	testq	%rax, %rax
	je	.L3431
.L3432:
	xorl	%eax, %eax
	cmpl	%r8d, %esi
	setbe	%al
	ret
	.cfi_endproc
.LFE414:
	.size	strconv__ftoa__multiple_of_power_of_five_64, .-strconv__ftoa__multiple_of_power_of_five_64
	.section	.text.strconv__ftoa__multiple_of_power_of_two_64,"ax",@progbits
	.p2align 4,,15
	.globl	strconv__ftoa__multiple_of_power_of_two_64
	.type	strconv__ftoa__multiple_of_power_of_two_64, @function
strconv__ftoa__multiple_of_power_of_two_64:
.LFB415:
	.cfi_startproc
	testq	%rdi, %rdi
	jne	.L3445
	movl	$64, %eax
	cmpl	%eax, %esi
	setbe	%al
	movzbl	%al, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L3445:
	movq	%rdi, %rax
	subq	$32, %rsp
	.cfi_def_cfa_offset 40
	negq	%rax
	movl	%esi, 20(%rsp)
	pushq	16+_const_math__bits__de_bruijn64tab(%rip)
	.cfi_def_cfa_offset 48
	andq	%rax, %rdi
	pushq	8+_const_math__bits__de_bruijn64tab(%rip)
	.cfi_def_cfa_offset 56
	pushq	_const_math__bits__de_bruijn64tab(%rip)
	.cfi_def_cfa_offset 64
	imulq	_const_math__bits__de_bruijn64(%rip), %rdi
	shrq	$58, %rdi
	call	array_get
	movzbl	(%rax), %eax
	movl	44(%rsp), %esi
	cmpl	%eax, %esi
	setbe	%al
	addq	$56, %rsp
	.cfi_def_cfa_offset 8
	movzbl	%al, %eax
	ret
	.cfi_endproc
.LFE415:
	.size	strconv__ftoa__multiple_of_power_of_two_64, .-strconv__ftoa__multiple_of_power_of_two_64
	.section	.rodata.str1.1
.LC117:
	.string	"Float conversion error!!"
	.section	.text.strconv__ftoa__f64_to_str_l,"ax",@progbits
	.p2align 4,,15
	.globl	strconv__ftoa__f64_to_str_l
	.type	strconv__ftoa__f64_to_str_l, @function
strconv__ftoa__f64_to_str_l:
.LFB417:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movl	$18, %edi
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$168, %rsp
	.cfi_def_cfa_offset 224
	movq	%fs:40, %rax
	movq	%rax, 152(%rsp)
	xorl	%eax, %eax
	call	strconv__ftoa__f64_to_str
	cmpl	$2, %edx
	movq	%rax, %r12
	movq	%rdx, %rbx
	movl	%edx, %r13d
	jg	.L3508
	pxor	%xmm0, %xmm0
	xorl	%edx, %edx
	testl	%ebx, %ebx
	movq	$0, 128(%rsp)
	movw	%dx, 136(%rsp)
	movaps	%xmm0, 112(%rsp)
	jle	.L3481
.L3479:
	xorl	%eax, %eax
	xorl	%edi, %edi
	movl	$-1, %r9d
	movl	$1, 24(%rsp)
	movl	$1, 8(%rsp)
	jmp	.L3460
	.p2align 4,,10
	.p2align 3
.L3453:
	cmpb	$43, %cl
	je	.L3509
	leal	-48(%rcx), %edx
	cmpb	$9, %dl
	ja	.L3456
	movslq	%edi, %rdx
	leal	1(%rax), %r15d
	addl	$1, %edi
	movb	%cl, 112(%rsp,%rdx)
.L3454:
	addq	$1, %rax
	cmpl	%r13d, %r15d
	jge	.L3452
.L3460:
	movzbl	(%r12,%rax), %ecx
	movl	%eax, %esi
	cmpb	$45, %cl
	jne	.L3453
	leal	1(%rax), %r15d
	addq	$1, %rax
	movl	%r9d, 8(%rsp)
	cmpl	%r13d, %r15d
	jl	.L3460
.L3452:
	movslq	%edi, %rdi
	movl	%r15d, %edx
	movq	%rbx, %rsi
	movb	$0, 112(%rsp,%rdi)
	movq	%r12, %rdi
	call	string_at
	cmpb	$45, %al
	jne	.L3461
	addl	$1, %r15d
	movl	$-1, 28(%rsp)
.L3462:
	movl	%r13d, %eax
	xorl	%r14d, %r14d
	xorl	%ebp, %ebp
	movq	%rax, 16(%rsp)
	jmp	.L3463
	.p2align 4,,10
	.p2align 3
.L3464:
	movl	%r13d, %ecx
	movl	%r15d, %edx
	movq	%r12, %rdi
	movq	%rbx, %rsi
	addq	$1, %r14
	call	string_substr
	movzbl	-1(%r14,%rax), %eax
	leal	0(%rbp,%rbp,4), %edx
	leal	-48(%rax,%rdx,2), %ebp
.L3463:
	movabsq	$-4294967296, %rax
	movl	%r13d, %ecx
	movl	%r15d, %edx
	andq	%rax, %rbx
	orq	16(%rsp), %rbx
	movq	%r12, %rdi
	movq	%rbx, %rsi
	call	string_substr
	cmpl	%r14d, %edx
	jg	.L3464
	leaq	64(%rsp), %rdi
	leaq	103(%rsp), %r8
	movl	$1, %ecx
	movl	$1, %edx
	movl	$1, %esi
	movb	$48, 103(%rsp)
	leaq	32(%rsp), %rbx
	xorl	%r14d, %r14d
	call	new_array_from_c_array
	subq	$8, %rsp
	.cfi_def_cfa_offset 232
	leal	32(%rbp), %esi
	movq	%rbx, %rdi
	pushq	88(%rsp)
	.cfi_def_cfa_offset 240
	pushq	88(%rsp)
	.cfi_def_cfa_offset 248
	pushq	88(%rsp)
	.cfi_def_cfa_offset 256
	call	array_repeat
	addq	$32, %rsp
	.cfi_def_cfa_offset 224
	cmpl	$1, 8(%rsp)
	je	.L3465
	leaq	104(%rsp), %rdx
	xorl	%esi, %esi
	movq	%rbx, %rdi
	movl	$1, %r14d
	movb	$45, 104(%rsp)
	call	array_set
.L3465:
	cmpl	$-1, 28(%rsp)
	je	.L3510
	leaq	105(%rsp), %rax
	movl	$1, %r15d
	leaq	111(%rsp), %r12
	movq	%rax, 8(%rsp)
	leaq	106(%rsp), %rax
	movq	%rax, 16(%rsp)
	jmp	.L3466
	.p2align 4,,10
	.p2align 3
.L3471:
	movb	%dl, 105(%rsp)
	movq	8(%rsp), %rdx
	movl	%r14d, %esi
	movq	%rbx, %rdi
	leal	1(%r14), %r13d
	call	array_set
	cmpl	%r15d, 24(%rsp)
	jg	.L3469
	testl	%ebp, %ebp
	js	.L3469
	testl	%ebp, %ebp
	je	.L3511
.L3470:
	subl	$1, %ebp
.L3469:
	addq	$1, %r15
	movl	%r13d, %r14d
.L3466:
	movzbl	(%r12,%r15), %edx
	testb	%dl, %dl
	jne	.L3471
	testl	%ebp, %ebp
	js	.L3486
	leaq	107(%rsp), %rax
	leal	1(%r14,%rbp), %r15d
	movl	%r14d, %esi
	movq	%rax, 8(%rsp)
	.p2align 4,,10
	.p2align 3
.L3473:
	movq	8(%rsp), %rdx
	leal	1(%rsi), %r13d
	movq	%rbx, %rdi
	movb	$48, 107(%rsp)
	call	array_set
	cmpl	%r15d, %r13d
	movl	%r13d, %esi
	jne	.L3473
	leal	1(%r14,%rbp), %ebp
.L3472:
	movq	%r12, %rdx
	movl	%ebp, %esi
	movq	%rbx, %rdi
	movb	$0, 111(%rsp)
	call	array_set
	movl	40(%rsp), %edx
	movq	32(%rsp), %rax
	testl	%edx, %edx
	jle	.L3512
	testq	%rax, %rax
	je	.L3513
	movl	%ebp, %edx
.L3449:
	movq	152(%rsp), %rdi
	xorq	%fs:40, %rdi
	jne	.L3514
	addq	$168, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L3509:
	.cfi_restore_state
	leal	1(%rax), %r15d
	movl	$1, 8(%rsp)
	jmp	.L3454
	.p2align 4,,10
	.p2align 3
.L3456:
	cmpb	$46, %cl
	jne	.L3457
	cmpl	$1, 8(%rsp)
	leal	-1(%rax), %edx
	leal	1(%rax), %r15d
	cmovne	%edx, %esi
	movl	%esi, 24(%rsp)
	jmp	.L3454
	.p2align 4,,10
	.p2align 3
.L3461:
	movl	%r15d, %edx
	movq	%r12, %rdi
	movq	%rbx, %rsi
	call	string_at
	cmpb	$43, %al
	movl	$1, 28(%rsp)
	sete	%al
	movzbl	%al, %eax
	addl	%eax, %r15d
	jmp	.L3462
	.p2align 4,,10
	.p2align 3
.L3511:
	movq	16(%rsp), %rdx
	movl	%r13d, %esi
	addl	$2, %r14d
	movq	%rbx, %rdi
	movb	$46, 106(%rsp)
	movl	%r14d, %r13d
	call	array_set
	jmp	.L3470
	.p2align 4,,10
	.p2align 3
.L3508:
	xorl	%edx, %edx
	movq	%r12, %rdi
	movq	%rbx, %rsi
	call	string_at
	cmpb	$110, %al
	je	.L3450
	movl	$1, %edx
	movq	%r12, %rdi
	movq	%rbx, %rsi
	call	string_at
	cmpb	$105, %al
	je	.L3450
	pxor	%xmm0, %xmm0
	xorl	%eax, %eax
	movq	$0, 128(%rsp)
	movw	%ax, 136(%rsp)
	movaps	%xmm0, 112(%rsp)
	jmp	.L3479
	.p2align 4,,10
	.p2align 3
.L3450:
	movq	%r12, %rax
	movq	%rbx, %rdx
	jmp	.L3449
	.p2align 4,,10
	.p2align 3
.L3510:
	leaq	109(%rsp), %rax
	testl	%ebp, %ebp
	movl	$1, %r15d
	leaq	108(%rsp), %r13
	movq	%rax, 8(%rsp)
	jg	.L3467
	jmp	.L3468
	.p2align 4,,10
	.p2align 3
.L3487:
	xorl	%r15d, %r15d
	testl	%ebp, %ebp
	movl	%r12d, %r14d
	je	.L3468
.L3467:
	movq	%r13, %rdx
	movl	%r14d, %esi
	movq	%rbx, %rdi
	movb	$48, 108(%rsp)
	subl	$1, %ebp
	leal	1(%r14), %r12d
	call	array_set
	testl	%r15d, %r15d
	je	.L3487
	movq	8(%rsp), %rdx
	movl	%r12d, %esi
	movq	%rbx, %rdi
	movb	$46, 109(%rsp)
	addl	$2, %r14d
	xorl	%r15d, %r15d
	call	array_set
	testl	%ebp, %ebp
	jne	.L3467
.L3468:
	movzbl	112(%rsp), %edx
	testb	%dl, %dl
	je	.L3488
	leaq	113(%rsp), %r12
	leaq	110(%rsp), %r13
	.p2align 4,,10
	.p2align 3
.L3476:
	movb	%dl, 110(%rsp)
	movl	%r14d, %esi
	movq	%r13, %rdx
	addq	$1, %r12
	movq	%rbx, %rdi
	leal	1(%r14), %ebp
	call	array_set
	movzbl	-1(%r12), %edx
	movl	%ebp, %r14d
	testb	%dl, %dl
	jne	.L3476
.L3507:
	leaq	111(%rsp), %r12
	jmp	.L3472
	.p2align 4,,10
	.p2align 3
.L3457:
	cmpb	$101, %cl
	leaq	.LC117(%rip), %rax
	movl	$24, %edx
	leal	1(%rsi), %r15d
	jne	.L3449
	jmp	.L3452
.L3486:
	movl	%r14d, %ebp
	jmp	.L3472
.L3481:
	xorl	%edi, %edi
	movl	$1, 24(%rsp)
	movl	$1, 8(%rsp)
	xorl	%r15d, %r15d
	jmp	.L3452
.L3488:
	movl	%r14d, %ebp
	jmp	.L3507
.L3512:
	leaq	.LC68(%rip), %rdi
	xorl	%esi, %esi
	xorl	%eax, %eax
	call	_STR
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	v_panic
.L3513:
	call	tos.part.7
.L3514:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE417:
	.size	strconv__ftoa__f64_to_str_l, .-strconv__ftoa__f64_to_str_l
	.section	.text.f64_strlong,"ax",@progbits
	.p2align 4,,15
	.globl	f64_strlong
	.type	f64_strlong, @function
f64_strlong:
.LFB154:
	.cfi_startproc
	jmp	strconv__ftoa__f64_to_str_l
	.cfi_endproc
.LFE154:
	.size	f64_strlong, .-f64_strlong
	.section	.text.strconv__ftoa__f32_to_str_l,"ax",@progbits
	.p2align 4,,15
	.globl	strconv__ftoa__f32_to_str_l
	.type	strconv__ftoa__f32_to_str_l, @function
strconv__ftoa__f32_to_str_l:
.LFB416:
	.cfi_startproc
	cvtsd2ss	%xmm0, %xmm0
	cvtss2sd	%xmm0, %xmm0
	jmp	strconv__ftoa__f64_to_str_l
	.cfi_endproc
.LFE416:
	.size	strconv__ftoa__f32_to_str_l, .-strconv__ftoa__f32_to_str_l
	.section	.text.f32_strlong,"ax",@progbits
	.p2align 4,,15
	.globl	f32_strlong
	.type	f32_strlong, @function
f32_strlong:
.LFB157:
	.cfi_startproc
	cvtss2sd	%xmm0, %xmm0
	jmp	strconv__ftoa__f64_to_str_l
	.cfi_endproc
.LFE157:
	.size	f32_strlong, .-f32_strlong
	.section	.text.strconv__ftoa__ftoa_long_64,"ax",@progbits
	.p2align 4,,15
	.globl	strconv__ftoa__ftoa_long_64
	.type	strconv__ftoa__ftoa_long_64, @function
strconv__ftoa__ftoa_long_64:
.LFB569:
	.cfi_startproc
	jmp	strconv__ftoa__f64_to_str_l
	.cfi_endproc
.LFE569:
	.size	strconv__ftoa__ftoa_long_64, .-strconv__ftoa__ftoa_long_64
	.section	.text.strconv__ftoa__ftoa_long_32,"ax",@progbits
	.p2align 4,,15
	.globl	strconv__ftoa__ftoa_long_32
	.type	strconv__ftoa__ftoa_long_32, @function
strconv__ftoa__ftoa_long_32:
.LFB571:
	.cfi_startproc
	cvtss2sd	%xmm0, %xmm0
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	call	strconv__ftoa__f64_to_str_l
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	movl	%edx, %edx
	ret
	.cfi_endproc
.LFE571:
	.size	strconv__ftoa__ftoa_long_32, .-strconv__ftoa__ftoa_long_32
	.section	.text.hash__wyhash__rand_u64,"ax",@progbits
	.p2align 4,,15
	.globl	hash__wyhash__rand_u64
	.type	hash__wyhash__rand_u64, @function
hash__wyhash__rand_u64:
.LFB418:
	.cfi_startproc
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE418:
	.size	hash__wyhash__rand_u64, .-hash__wyhash__rand_u64
	.section	.text.hash__wyhash__wyhash_c,"ax",@progbits
	.p2align 4,,15
	.globl	hash__wyhash__wyhash_c
	.type	hash__wyhash__wyhash_c, @function
hash__wyhash__wyhash_c:
.LFB419:
	.cfi_startproc
	jmp	wyhash
	.cfi_endproc
.LFE419:
	.size	hash__wyhash__wyhash_c, .-hash__wyhash__wyhash_c
	.section	.text.hash__wyhash__wyrotr,"ax",@progbits
	.p2align 4,,15
	.globl	hash__wyhash__wyrotr
	.type	hash__wyhash__wyrotr, @function
hash__wyhash__wyrotr:
.LFB423:
	.cfi_startproc
	movq	%rdi, %rax
	movl	%esi, %ecx
	rorq	%cl, %rax
	ret
	.cfi_endproc
.LFE423:
	.size	hash__wyhash__wyrotr, .-hash__wyhash__wyrotr
	.section	.text.hash__wyhash__wymum,"ax",@progbits
	.p2align 4,,15
	.globl	hash__wyhash__wymum
	.type	hash__wyhash__wymum, @function
hash__wyhash__wymum:
.LFB424:
	.cfi_startproc
	movl	%edi, %ecx
	movl	%esi, %r8d
	movq	%rdi, %rdx
	movq	%rcx, %r9
	shrq	$32, %rdx
	movq	%rsi, %rax
	imulq	%r8, %r9
	shrq	$32, %rax
	imulq	%rdx, %r8
	imulq	%rax, %rcx
	shrq	$32, %r9
	addq	%r9, %r8
	imulq	%rax, %rdx
	movl	%r8d, %r9d
	shrq	$32, %r8
	leaq	(%rcx,%r9), %rax
	imulq	%rsi, %rdi
	shrq	$32, %rax
	addq	%r8, %rdx
	leaq	(%rdx,%rax), %rax
	xorq	%rdi, %rax
	ret
	.cfi_endproc
.LFE424:
	.size	hash__wyhash__wymum, .-hash__wyhash__wymum
	.section	.text.hash__wyhash__wyr3,"ax",@progbits
	.p2align 4,,15
	.globl	hash__wyhash__wyr3
	.type	hash__wyhash__wyr3, @function
hash__wyhash__wyr3:
.LFB425:
	.cfi_startproc
	movzbl	(%rdi), %edx
	movzbl	-1(%rdi,%rsi), %eax
	shrq	%rsi
	salq	$16, %rdx
	orq	%rdx, %rax
	movzbl	(%rdi,%rsi), %edx
	salq	$8, %rdx
	orq	%rdx, %rax
	ret
	.cfi_endproc
.LFE425:
	.size	hash__wyhash__wyr3, .-hash__wyhash__wyr3
	.section	.text.hash__wyhash__wyr4,"ax",@progbits
	.p2align 4,,15
	.globl	hash__wyhash__wyr4
	.type	hash__wyhash__wyr4, @function
hash__wyhash__wyr4:
.LFB426:
	.cfi_startproc
	movl	(%rdi), %eax
	ret
	.cfi_endproc
.LFE426:
	.size	hash__wyhash__wyr4, .-hash__wyhash__wyr4
	.section	.text.hash__wyhash__wyr8,"ax",@progbits
	.p2align 4,,15
	.globl	hash__wyhash__wyr8
	.type	hash__wyhash__wyr8, @function
hash__wyhash__wyr8:
.LFB427:
	.cfi_startproc
	movq	(%rdi), %rax
	ret
	.cfi_endproc
.LFE427:
	.size	hash__wyhash__wyr8, .-hash__wyhash__wyr8
	.section	.text.hash__wyhash__wyhash64.part.27,"ax",@progbits
	.p2align 4,,15
	.type	hash__wyhash__wyhash64.part.27, @function
hash__wyhash__wyhash64.part.27:
.LFB557:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rsi, %rcx
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	andl	$63, %ecx
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdx, %r8
	movq	%rdi, %rbx
	subq	$32, %rsp
	.cfi_def_cfa_offset 88
	movq	_const_hash__wyhash__wyp1(%rip), %rbp
	movq	_const_hash__wyhash__wyp0(%rip), %r12
	movq	%rsi, 8(%rsp)
	movq	%rdx, %rsi
	xorq	%rbp, %r8
	xorq	%r12, %rsi
	cmpq	$3, %rcx
	ja	.L3529
	movzbl	(%rdi), %eax
	movzbl	-1(%rdi,%rcx), %edx
	salq	$16, %rax
	orq	%rax, %rdx
	movq	%rcx, %rax
	shrq	%rax
	movzbl	(%rdi,%rax), %eax
	salq	$8, %rax
	orq	%rax, %rdx
	movl	%r8d, %eax
	xorq	%rdx, %rsi
	movq	%r8, %rdx
	movl	%esi, %r9d
	movq	%rsi, %r10
	shrq	$32, %rdx
	movq	%r9, %rdi
	shrq	$32, %r10
	imulq	%rax, %rdi
	imulq	%r10, %rax
	imulq	%rdx, %r9
	shrq	$32, %rdi
	addq	%rdi, %rax
	imulq	%rdx, %r10
	movl	%eax, %edi
	shrq	$32, %rax
	leaq	(%r9,%rdi), %rdx
	imulq	%r8, %rsi
	shrq	$32, %rdx
	addq	%r10, %rax
	addq	%rax, %rdx
	xorq	%rsi, %rdx
.L3530:
	cmpq	%rcx, 8(%rsp)
	movq	_const_hash__wyhash__wyp4(%rip), %rax
	movq	%rax, 16(%rsp)
	je	.L3542
	movq	8(%rsp), %rax
	addq	%rcx, %rbx
	subq	%rcx, %rax
	cmpq	$63, %rax
	jbe	.L3539
	subq	$64, %rax
	movq	_const_hash__wyhash__wyp3(%rip), %r14
	movq	_const_hash__wyhash__wyp2(%rip), %r13
	andq	$-64, %rax
	movq	%rdx, %r10
	movq	%rdx, %r9
	leaq	64(%rbx,%rax), %rax
	movq	%rdx, %rcx
	movq	%rax, (%rsp)
	.p2align 4,,10
	.p2align 3
.L3538:
	leaq	8(%rbx), %rdi
	call	hash__wyhash__wyr8
	xorq	%rdx, %rax
	movq	%rbx, %rdi
	movq	%rax, %rsi
	xorq	%rbp, %rsi
	call	hash__wyhash__wyr8
	xorq	%rdx, %rax
	movl	%esi, %edx
	movq	%rsi, %r15
	xorq	%r12, %rax
	shrq	$32, %r15
	movl	%eax, %r11d
	movq	%rax, %r8
	movq	%r11, %rdi
	shrq	$32, %r8
	imulq	%rdx, %rdi
	imulq	%r8, %rdx
	imulq	%r15, %r11
	shrq	$32, %rdi
	addq	%rdx, %rdi
	imulq	%r15, %r8
	movl	%edi, %edx
	shrq	$32, %rdi
	imulq	%rax, %rsi
	addq	%r11, %rdx
	shrq	$32, %rdx
	addq	%rdi, %r8
	leaq	24(%rbx), %rdi
	addq	%r8, %rdx
	xorq	%rsi, %rdx
	call	hash__wyhash__wyr8
	leaq	16(%rbx), %rdi
	xorq	%rcx, %rax
	movq	%rax, %rsi
	xorq	%r14, %rsi
	call	hash__wyhash__wyr8
	xorq	%rcx, %rax
	movl	%esi, %ecx
	movq	%rsi, %r15
	xorq	%r13, %rax
	shrq	$32, %r15
	movl	%eax, %r11d
	movq	%rax, %r8
	movq	%r11, %rdi
	shrq	$32, %r8
	imulq	%rcx, %rdi
	imulq	%r8, %rcx
	shrq	$32, %rdi
	addq	%rcx, %rdi
	imulq	%r15, %r11
	movl	%edi, %ecx
	shrq	$32, %rdi
	imulq	%r15, %r8
	imulq	%rax, %rsi
	addq	%r11, %rcx
	addq	%rdi, %r8
	shrq	$32, %rcx
	leaq	40(%rbx), %rdi
	addq	%r8, %rcx
	xorq	%rsi, %rcx
	call	hash__wyhash__wyr8
	leaq	32(%rbx), %rdi
	xorq	%r9, %rax
	movq	%rax, %rsi
	xorq	%r13, %rsi
	call	hash__wyhash__wyr8
	xorq	%r9, %rax
	movl	%esi, %r9d
	movq	%rsi, %r15
	xorq	%rbp, %rax
	shrq	$32, %r15
	movl	%eax, %r11d
	movq	%rax, %r8
	movq	%r11, %rdi
	shrq	$32, %r8
	imulq	%r9, %rdi
	imulq	%r8, %r9
	imulq	%r15, %r11
	shrq	$32, %rdi
	addq	%r9, %rdi
	imulq	%r15, %r8
	movl	%edi, %r9d
	shrq	$32, %rdi
	imulq	%rax, %rsi
	addq	%r11, %r9
	shrq	$32, %r9
	addq	%rdi, %r8
	leaq	56(%rbx), %rdi
	addq	%r8, %r9
	xorq	%rsi, %r9
	call	hash__wyhash__wyr8
	leaq	48(%rbx), %rdi
	xorq	%r10, %rax
	addq	$64, %rbx
	movq	%rax, %rsi
	xorq	%r12, %rsi
	call	hash__wyhash__wyr8
	xorq	%r10, %rax
	movl	%esi, %r10d
	movq	%rsi, %r15
	xorq	%r14, %rax
	shrq	$32, %r15
	movl	%eax, %r11d
	movq	%rax, %r8
	movq	%r11, %rdi
	shrq	$32, %r8
	imulq	%r10, %rdi
	imulq	%r8, %r10
	imulq	%r15, %r11
	shrq	$32, %rdi
	addq	%r10, %rdi
	imulq	%r15, %r8
	movl	%edi, %r10d
	shrq	$32, %rdi
	imulq	%rax, %rsi
	addq	%r11, %r10
	shrq	$32, %r10
	addq	%rdi, %r8
	addq	%r8, %r10
	xorq	%rsi, %r10
	cmpq	(%rsp), %rbx
	jne	.L3538
	xorq	%r9, %rcx
.L3537:
	movq	8(%rsp), %rax
	xorq	16(%rsp), %rax
	xorq	%rcx, %rdx
	movl	%edx, %ecx
	movq	%rdx, %rsi
	addq	$32, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%rcx, %r11
	shrq	$32, %rsi
	popq	%rbx
	.cfi_def_cfa_offset 48
	xorq	%rax, %r10
	movl	%r10d, %edi
	movq	%r10, %rax
	imulq	%rdi, %r11
	shrq	$32, %rax
	imulq	%rsi, %rdi
	imulq	%rax, %rcx
	popq	%rbp
	.cfi_def_cfa_offset 40
	shrq	$32, %r11
	addq	%r11, %rdi
	imulq	%rax, %rsi
	movl	%edi, %r8d
	shrq	$32, %rdi
	leaq	(%rcx,%r8), %rax
	imulq	%r10, %rdx
	shrq	$32, %rax
	addq	%rsi, %rdi
	addq	%rdi, %rax
	popq	%r12
	.cfi_def_cfa_offset 32
	xorq	%rdx, %rax
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L3529:
	.cfi_restore_state
	cmpq	$8, %rcx
	ja	.L3531
	movl	-4(%rdi,%rcx), %edx
	xorq	%rdx, %r8
	movl	(%rdi), %edx
	movl	%r8d, %eax
	movq	%r8, %r10
	shrq	$32, %r10
	xorq	%rdx, %rsi
	movl	%esi, %r9d
	movq	%rsi, %rdx
	movq	%r9, %rdi
	shrq	$32, %rdx
	imulq	%rax, %rdi
	imulq	%rdx, %rax
	imulq	%r10, %r9
	shrq	$32, %rdi
	addq	%rdi, %rax
	imulq	%r10, %rdx
	movl	%eax, %edi
	shrq	$32, %rax
	imulq	%rsi, %r8
	addq	%rdx, %rax
	leaq	(%r9,%rdi), %rdx
	shrq	$32, %rdx
	leaq	(%rax,%rdx), %rdx
	xorq	%r8, %rdx
	jmp	.L3530
	.p2align 4,,10
	.p2align 3
.L3531:
	call	hash__wyhash__wyr8
	xorq	%rsi, %rax
	leaq	-8(%rdi,%rcx), %rdi
	movq	%rax, %r10
	movq	%rax, %r9
	movl	%eax, %r11d
	shrq	$32, %r10
	call	hash__wyhash__wyr8
	cmpq	$16, %rcx
	movq	%rax, (%rsp)
	jbe	.L3543
	leaq	8(%rbx), %rdi
	call	hash__wyhash__wyr8
	xorq	%r8, %rax
	movq	%r11, %rdi
	movl	%eax, %r13d
	movq	%rax, %r14
	imulq	%r13, %rdi
	shrq	$32, %r14
	imulq	%r10, %r13
	imulq	%r14, %r11
	shrq	$32, %rdi
	leaq	(%rdi,%r13), %rdi
	imulq	%r14, %r10
	movl	%edi, %r13d
	shrq	$32, %rdi
	addq	%r13, %r11
	shrq	$32, %r11
	addq	%rdi, %r10
	addq	%r11, %r10
	movq	_const_hash__wyhash__wyp3(%rip), %r11
	imulq	%rax, %r9
	xorq	%rdx, %r11
	xorq	_const_hash__wyhash__wyp2(%rip), %rdx
	cmpq	$24, %rcx
	ja	.L3533
	xorq	(%rsp), %rdx
	movl	%r11d, %edi
	movq	%r11, %r8
	shrq	$32, %r8
	movl	%edx, %eax
	movq	%rdx, %r13
	movq	%rax, %rsi
	shrq	$32, %r13
	imulq	%rdi, %rsi
	imulq	%r13, %rdi
	imulq	%r8, %rax
	shrq	$32, %rsi
	addq	%rsi, %rdi
	imulq	%r8, %r13
	movl	%edi, %esi
	shrq	$32, %rdi
	imulq	%r11, %rdx
	addq	%rsi, %rax
	shrq	$32, %rax
	addq	%r13, %rdi
	addq	%rdi, %rax
	xorq	%rax, %rdx
	xorq	%rdx, %r9
	movq	%r9, %rdx
	xorq	%r10, %rdx
	jmp	.L3530
	.p2align 4,,10
	.p2align 3
.L3542:
	movq	8(%rsp), %rsi
	movl	%edx, %r8d
	movq	%rdx, %r9
	movq	%r8, %rdi
	shrq	$32, %r9
	addq	$32, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	xorq	%rax, %rsi
	movl	%esi, %ecx
	movq	%rsi, %rax
	imulq	%rcx, %rdi
	shrq	$32, %rax
	imulq	%r9, %rcx
	imulq	%rax, %r8
	popq	%rbp
	.cfi_def_cfa_offset 40
	shrq	$32, %rdi
	addq	%rdi, %rcx
	imulq	%rax, %r9
	movl	%ecx, %edi
	shrq	$32, %rcx
	leaq	(%r8,%rdi), %rax
	imulq	%rsi, %rdx
	shrq	$32, %rax
	addq	%r9, %rcx
	leaq	(%rcx,%rax), %rax
	popq	%r12
	.cfi_def_cfa_offset 32
	xorq	%rdx, %rax
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L3543:
	.cfi_restore_state
	xorq	%rax, %r8
	movl	%r8d, %esi
	movq	%r8, %rdx
	movq	%rsi, %rax
	shrq	$32, %rdx
	imulq	%r11, %rax
	imulq	%r10, %rsi
	imulq	%rdx, %r11
	shrq	$32, %rax
	leaq	(%rax,%rsi), %rax
	imulq	%rdx, %r10
	movl	%eax, %esi
	shrq	$32, %rax
	leaq	(%r11,%rsi), %rdx
	imulq	%r9, %r8
	shrq	$32, %rdx
	addq	%rax, %r10
	leaq	(%r10,%rdx), %rax
	xorq	%r8, %rax
	movq	%rax, %rdx
	jmp	.L3530
	.p2align 4,,10
	.p2align 3
.L3539:
	movq	%rdx, %r10
	xorl	%ecx, %ecx
	jmp	.L3537
	.p2align 4,,10
	.p2align 3
.L3533:
	leaq	16(%rbx), %rdi
	call	hash__wyhash__wyr8
	xorq	%rdx, %rax
	movq	%rax, %r15
	movq	%rax, %r13
	movl	%eax, %r14d
	shrq	$32, %r15
	cmpq	$32, %rcx
	ja	.L3534
	xorq	(%rsp), %r11
	xorq	%r10, %r9
	movl	%r11d, %edi
	movq	%r11, %rdx
	movq	%rdi, %rax
	shrq	$32, %rdx
	imulq	%r14, %rax
	imulq	%r15, %rdi
	imulq	%rdx, %r15
	shrq	$32, %rax
	leaq	(%rax,%rdi), %rax
	imulq	%r14, %rdx
	imulq	%r13, %r11
	movl	%eax, %esi
	shrq	$32, %rax
	addq	%r15, %rax
	addq	%rsi, %rdx
	shrq	$32, %rdx
	xorq	%r11, %r9
	addq	%rax, %rdx
	xorq	%r9, %rdx
	jmp	.L3530
.L3534:
	leaq	24(%rbx), %rdi
	call	hash__wyhash__wyr8
	xorq	%r11, %rax
	xorq	%r9, %r10
	movq	%rax, %rdi
	movl	%eax, %eax
	movq	%rdi, 24(%rsp)
	shrq	$32, %rdi
	movq	%rdi, 16(%rsp)
	movq	%rax, %rdi
	imulq	%r14, %rdi
	imulq	16(%rsp), %r14
	imulq	%r15, %rax
	imulq	16(%rsp), %r15
	shrq	$32, %rdi
	addq	%rdi, %rax
	movl	%eax, %edi
	shrq	$32, %rax
	addq	%rdi, %r14
	leaq	-24(%rbx,%rcx), %rdi
	shrq	$32, %r14
	addq	%r15, %rax
	movq	%r10, %r15
	addq	%r14, %rax
	movq	24(%rsp), %r14
	movq	%rax, 16(%rsp)
	call	hash__wyhash__wyr8
	leaq	-32(%rbx,%rcx), %rdi
	xorq	%rax, %rdx
	imulq	%r13, %r14
	call	hash__wyhash__wyr8
	xorq	%rax, %r8
	movl	%edx, %edi
	movq	%rdx, %r10
	movl	%r8d, %r9d
	movq	%r8, %rax
	shrq	$32, %r10
	movq	%r9, %r13
	shrq	$32, %rax
	imulq	%rdi, %r13
	imulq	%rax, %rdi
	imulq	%r10, %r9
	shrq	$32, %r13
	addq	%r13, %rdi
	imulq	%r10, %rax
	movl	%edi, %r13d
	shrq	$32, %rdi
	addq	%r13, %r9
	shrq	$32, %r9
	addq	%rdi, %rax
	leaq	-16(%rbx,%rcx), %rdi
	addq	%rax, %r9
	xorq	(%rsp), %rsi
	xorq	%r14, %r15
	imulq	%rdx, %r8
	call	hash__wyhash__wyr8
	xorq	%rax, %r11
	movl	%r11d, %r13d
	movl	%esi, %edi
	movq	%r11, %rdx
	movq	%r13, %r14
	shrq	$32, %rdx
	movq	%rsi, %rax
	imulq	%rdi, %r14
	shrq	$32, %rax
	xorq	%r15, %r8
	imulq	%rdx, %rdi
	imulq	%r11, %rsi
	shrq	$32, %r14
	addq	%r14, %rdi
	imulq	%rax, %r13
	movl	%edi, %r14d
	shrq	$32, %rdi
	imulq	%rax, %rdx
	movq	%rsi, %rax
	xorq	%r8, %rax
	xorq	16(%rsp), %rax
	addq	%r13, %r14
	addq	%rdi, %rdx
	shrq	$32, %r14
	leaq	(%rdx,%r14), %rdi
	xorq	%r9, %rax
	movq	%rdi, %rdx
	xorq	%rax, %rdx
	jmp	.L3530
	.cfi_endproc
.LFE557:
	.size	hash__wyhash__wyhash64.part.27, .-hash__wyhash__wyhash64.part.27
	.section	.text.hash__wyhash__wyhash64,"ax",@progbits
	.p2align 4,,15
	.globl	hash__wyhash__wyhash64
	.type	hash__wyhash__wyhash64, @function
hash__wyhash__wyhash64:
.LFB422:
	.cfi_startproc
	testq	%rsi, %rsi
	je	.L3545
	jmp	hash__wyhash__wyhash64.part.27
	.p2align 4,,10
	.p2align 3
.L3545:
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE422:
	.size	hash__wyhash__wyhash64, .-hash__wyhash__wyhash64
	.section	.text.hash__wyhash__sum64_string,"ax",@progbits
	.p2align 4,,15
	.globl	hash__wyhash__sum64_string
	.type	hash__wyhash__sum64_string, @function
hash__wyhash__sum64_string:
.LFB420:
	.cfi_startproc
	movslq	%esi, %rsi
	testq	%rsi, %rsi
	je	.L3546
	jmp	hash__wyhash__wyhash64.part.27
	.p2align 4,,10
	.p2align 3
.L3546:
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE420:
	.size	hash__wyhash__sum64_string, .-hash__wyhash__sum64_string
	.section	.text.hash__wyhash__sum64,"ax",@progbits
	.p2align 4,,15
	.globl	hash__wyhash__sum64
	.type	hash__wyhash__sum64, @function
hash__wyhash__sum64:
.LFB421:
	.cfi_startproc
	movslq	16(%rsp), %rsi
	testq	%rsi, %rsi
	je	.L3548
	movq	%rdi, %rdx
	movq	8(%rsp), %rdi
	jmp	hash__wyhash__wyhash64.part.27
	.p2align 4,,10
	.p2align 3
.L3548:
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE421:
	.size	hash__wyhash__sum64, .-hash__wyhash__sum64
	.section	.text.strconv__lsr96,"ax",@progbits
	.p2align 4,,15
	.globl	strconv__lsr96
	.type	strconv__lsr96, @function
strconv__lsr96:
.LFB428:
	.cfi_startproc
	movl	%edi, %eax
	sall	$31, %edi
	shrl	%edx
	shrl	%eax
	movl	%eax, -20(%rsp)
	movl	%esi, %eax
	sall	$31, %esi
	shrl	%eax
	orl	%esi, %edx
	orl	%eax, %edi
	movl	%edi, -16(%rsp)
	movq	-20(%rsp), %rax
	ret
	.cfi_endproc
.LFE428:
	.size	strconv__lsr96, .-strconv__lsr96
	.section	.text.strconv__lsl96,"ax",@progbits
	.p2align 4,,15
	.globl	strconv__lsl96
	.type	strconv__lsl96, @function
strconv__lsl96:
.LFB429:
	.cfi_startproc
	movl	%esi, %eax
	addl	%edi, %edi
	addl	%esi, %esi
	shrl	$31, %eax
	orl	%eax, %edi
	movl	%edx, %eax
	addl	%edx, %edx
	shrl	$31, %eax
	movl	%edi, -20(%rsp)
	orl	%eax, %esi
	movl	%esi, -16(%rsp)
	movq	-20(%rsp), %rax
	ret
	.cfi_endproc
.LFE429:
	.size	strconv__lsl96, .-strconv__lsl96
	.section	.text.strconv__add96,"ax",@progbits
	.p2align 4,,15
	.globl	strconv__add96
	.type	strconv__add96, @function
strconv__add96:
.LFB430:
	.cfi_startproc
	movl	%edx, %eax
	movl	%r9d, %r10d
	movl	%r8d, %r8d
	addq	%r10, %rax
	movl	%esi, %esi
	movl	%ecx, %ecx
	shrq	$32, %rax
	addq	%r8, %rsi
	movl	%edi, %edi
	leaq	(%rsi,%rax), %r8
	addq	%rcx, %rdi
	addl	%r9d, %edx
	movq	%r8, %rax
	movl	%r8d, -16(%rsp)
	shrq	$32, %rax
	addq	%rax, %rdi
	movl	%edi, -20(%rsp)
	movq	-20(%rsp), %rax
	ret
	.cfi_endproc
.LFE430:
	.size	strconv__add96, .-strconv__add96
	.section	.text.strconv__sub96,"ax",@progbits
	.p2align 4,,15
	.globl	strconv__sub96
	.type	strconv__sub96, @function
strconv__sub96:
.LFB431:
	.cfi_startproc
	movl	%edx, %eax
	movl	%r9d, %r10d
	movl	%r8d, %r8d
	subq	%r10, %rax
	movl	%esi, %esi
	movl	%ecx, %ecx
	shrq	$32, %rax
	subq	%r8, %rsi
	movl	%edi, %edi
	addq	%rax, %rsi
	subq	%rcx, %rdi
	subl	%r9d, %edx
	movq	%rsi, %rax
	movl	%esi, -16(%rsp)
	shrq	$32, %rax
	addq	%rax, %rdi
	movl	%edi, -20(%rsp)
	movq	-20(%rsp), %rax
	ret
	.cfi_endproc
.LFE431:
	.size	strconv__sub96, .-strconv__sub96
	.section	.text.strconv__is_digit,"ax",@progbits
	.p2align 4,,15
	.globl	strconv__is_digit
	.type	strconv__is_digit, @function
strconv__is_digit:
.LFB573:
	.cfi_startproc
	subl	$48, %edi
	xorl	%eax, %eax
	cmpb	$9, %dil
	setbe	%al
	ret
	.cfi_endproc
.LFE573:
	.size	strconv__is_digit, .-strconv__is_digit
	.section	.text.strconv__is_space,"ax",@progbits
	.p2align 4,,15
	.globl	strconv__is_space
	.type	strconv__is_space, @function
strconv__is_space:
.LFB433:
	.cfi_startproc
	xorl	%eax, %eax
	cmpb	$32, %dil
	sete	%al
	ret
	.cfi_endproc
.LFE433:
	.size	strconv__is_space, .-strconv__is_space
	.section	.text.strconv__is_exp,"ax",@progbits
	.p2align 4,,15
	.globl	strconv__is_exp
	.type	strconv__is_exp, @function
strconv__is_exp:
.LFB434:
	.cfi_startproc
	andl	$-33, %edi
	xorl	%eax, %eax
	cmpb	$69, %dil
	sete	%al
	ret
	.cfi_endproc
.LFE434:
	.size	strconv__is_exp, .-strconv__is_exp
	.section	.text.strconv__parser,"ax",@progbits
	.p2align 4,,15
	.globl	strconv__parser
	.type	strconv__parser, @function
strconv__parser:
.LFB435:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdi, %r15
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	xorl	%r14d, %r14d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%edx, %r12d
	xorl	%ebp, %ebp
	xorl	%r13d, %r13d
	movl	$32, %eax
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	xorl	%ebx, %ebx
	movq	%rdx, 8(%rsp)
	movq	%rsi, (%rsp)
	xorl	%edx, %edx
	movl	$0, 16(%rsp)
	movl	$0, 20(%rsp)
	movl	$0, 24(%rsp)
.L3583:
	testl	%ebx, %ebx
	jne	.L3558
	cmpb	$32, %al
	je	.L3605
	movl	$1, %ebx
.L3559:
	cmpl	%r12d, %edx
	jl	.L3583
.L3584:
	movl	20(%rsp), %edx
	movl	%r13d, %eax
	movl	16(%rsp), %r12d
	negl	%eax
	testl	%edx, %edx
	cmovne	%eax, %r13d
	leal	1(%r14), %eax
	addl	%r13d, %r12d
	testq	%rbp, %rbp
	je	.L3580
	cmpl	$309, %r12d
	leal	3(%r14), %eax
	jg	.L3580
	leal	1(%r14), %eax
	cmpl	$-328, %r12d
	movl	$0, %edx
	cmovge	%edx, %eax
.L3580:
	movl	%eax, (%r15)
	movl	%r14d, 8(%r15)
	movq	%r15, %rax
	movl	%r12d, 12(%r15)
	movq	%rbp, 16(%r15)
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L3558:
	.cfi_restore_state
	cmpl	$1, %ebx
	je	.L3606
	cmpl	$2, %ebx
	je	.L3607
	cmpl	$3, %ebx
	je	.L3608
	cmpl	$4, %ebx
	je	.L3609
	cmpl	$5, %ebx
	je	.L3610
	cmpl	$6, %ebx
	je	.L3611
	cmpl	$7, %ebx
	je	.L3612
	leal	-48(%rax), %esi
	cmpb	$9, %sil
	ja	.L3584
	cmpl	$214748363, %r13d
	jg	.L3577
	leal	0(%r13,%r13,4), %ecx
	movzbl	%al, %eax
	leal	-48(%rax,%rcx,2), %r13d
.L3577:
	movq	(%rsp), %rdi
	movq	8(%rsp), %rsi
	leal	1(%rdx), %ebx
	call	string_at
	movl	%ebx, %edx
	movl	$8, %ebx
	jmp	.L3559
	.p2align 4,,10
	.p2align 3
.L3609:
	leal	-48(%rax), %esi
	cmpb	$9, %sil
	ja	.L3568
	movl	24(%rsp), %edi
	cmpl	$17, %edi
	jg	.L3569
	movzbl	%al, %eax
	leaq	0(%rbp,%rbp,4), %rsi
	addl	$1, %edi
	subl	$48, %eax
	movl	%edi, 24(%rsp)
	cltq
	leaq	(%rax,%rsi,2), %rbp
	.p2align 4,,10
	.p2align 3
.L3605:
	movq	(%rsp), %rdi
	movq	8(%rsp), %rsi
	leal	1(%rdx), %eax
	movl	%eax, 28(%rsp)
	call	string_at
	movl	28(%rsp), %edx
	jmp	.L3559
	.p2align 4,,10
	.p2align 3
.L3606:
	cmpb	$43, %al
	je	.L3613
	cmpb	$45, %al
	je	.L3614
	leal	-48(%rax), %esi
	cmpb	$9, %sil
	ja	.L3615
	movl	$2, %ebx
	jmp	.L3559
	.p2align 4,,10
	.p2align 3
.L3607:
	cmpb	$48, %al
	je	.L3605
	cmpb	$46, %al
	movl	$4, %ebx
	jne	.L3559
	movq	(%rsp), %rdi
	movq	8(%rsp), %rsi
	leal	1(%rdx), %ebx
	call	string_at
	movl	%ebx, %edx
	movl	$3, %ebx
	jmp	.L3559
	.p2align 4,,10
	.p2align 3
.L3615:
	cmpb	$46, %al
	jne	.L3584
	movl	$2, %ebx
	jmp	.L3559
	.p2align 4,,10
	.p2align 3
.L3608:
	cmpb	$48, %al
	je	.L3616
	movl	$5, %ebx
	jmp	.L3559
	.p2align 4,,10
	.p2align 3
.L3610:
	leal	-48(%rax), %esi
	cmpb	$9, %sil
	ja	.L3572
	movl	24(%rsp), %edi
	cmpl	$17, %edi
	jg	.L3605
	movzbl	%al, %eax
	leaq	0(%rbp,%rbp,4), %rsi
	addl	$1, %edi
	subl	$48, %eax
	subl	$1, 16(%rsp)
	movl	%edi, 24(%rsp)
	cltq
	leaq	(%rax,%rsi,2), %rbp
	jmp	.L3605
	.p2align 4,,10
	.p2align 3
.L3568:
	cmpb	$46, %al
	movl	$5, %ebx
	jne	.L3559
	jmp	.L3605
	.p2align 4,,10
	.p2align 3
.L3612:
	cmpb	$48, %al
	je	.L3605
	movl	$8, %ebx
	jmp	.L3559
	.p2align 4,,10
	.p2align 3
.L3613:
	movq	(%rsp), %rdi
	movq	8(%rsp), %rsi
	leal	1(%rdx), %ebx
	call	string_at
	movl	%ebx, %edx
	movl	$2, %ebx
	jmp	.L3559
	.p2align 4,,10
	.p2align 3
.L3614:
	movq	(%rsp), %rdi
	movq	8(%rsp), %rsi
	leal	1(%rdx), %ebx
	movl	$1, %r14d
	call	string_at
	movl	%ebx, %edx
	movl	$2, %ebx
	jmp	.L3559
	.p2align 4,,10
	.p2align 3
.L3611:
	cmpb	$43, %al
	je	.L3617
	cmpb	$45, %al
	movl	$7, %ebx
	jne	.L3559
	movq	(%rsp), %rdi
	movq	8(%rsp), %rsi
	leal	1(%rdx), %eax
	movl	%eax, 20(%rsp)
	call	string_at
	movl	20(%rsp), %edx
	movl	$1, 20(%rsp)
	jmp	.L3559
	.p2align 4,,10
	.p2align 3
.L3572:
	movl	%eax, %esi
	movl	$6, %ebx
	andl	$-33, %esi
	cmpb	$69, %sil
	jne	.L3559
	jmp	.L3605
	.p2align 4,,10
	.p2align 3
.L3616:
	movq	8(%rsp), %rsi
	movq	(%rsp), %rdi
	leal	1(%rdx), %eax
	movl	%eax, 28(%rsp)
	call	string_at
	movl	16(%rsp), %ecx
	xorl	%esi, %esi
	movl	28(%rsp), %edx
	cmpl	$-2147483647, %ecx
	setg	%sil
	subl	%esi, %ecx
	movl	%ecx, 16(%rsp)
	jmp	.L3559
	.p2align 4,,10
	.p2align 3
.L3569:
	movl	16(%rsp), %ecx
	xorl	%eax, %eax
	cmpl	$2147483647, %ecx
	setne	%al
	addl	%eax, %ecx
	movl	%ecx, 16(%rsp)
	jmp	.L3605
.L3617:
	movq	(%rsp), %rdi
	movq	8(%rsp), %rsi
	leal	1(%rdx), %ebx
	call	string_at
	movl	%ebx, %edx
	movl	$7, %ebx
	jmp	.L3559
	.cfi_endproc
.LFE435:
	.size	strconv__parser, .-strconv__parser
	.section	.text.strconv__converter,"ax",@progbits
	.p2align 4,,15
	.globl	strconv__converter
	.type	strconv__converter, @function
strconv__converter:
.LFB436:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	movq	8(%rdi), %rcx
	xorl	%esi, %esi
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	movl	$92, %r10d
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movl	4(%rdi), %ebx
	movl	%ecx, %r9d
	shrq	$32, %rcx
	movl	%ebx, %r11d
.L3619:
	testl	%r11d, %r11d
	jle	.L3665
.L3622:
	movl	%ecx, %eax
	leal	(%rcx,%rcx), %r12d
	movl	%r9d, %ecx
	leal	(%r9,%r9), %r13d
	shrl	$31, %ecx
	shrl	$31, %eax
	orl	%ecx, %r12d
	addl	%esi, %esi
	leal	0(,%r9,8), %r8d
	orl	%eax, %esi
	leal	(%r12,%r12), %ebp
	movl	%r13d, %eax
	shrl	$31, %eax
	movl	%r12d, %ecx
	subl	$1, %r11d
	orl	%eax, %ebp
	leal	0(,%r9,4), %eax
	movq	%r8, %r9
	leal	(%rbp,%rbp), %edx
	addq	%r13, %r8
	shrl	$31, %ebp
	shrl	$31, %eax
	shrq	$32, %r8
	addl	%r13d, %r9d
	orl	%edx, %eax
	addq	%rcx, %r8
	leal	(%rsi,%rsi), %edx
	addq	%rax, %r8
	movl	%r12d, %eax
	movl	%r11d, 4(%rdi)
	shrl	$31, %eax
	movl	%r8d, %ecx
	shrq	$32, %r8
	orl	%eax, %edx
	leal	(%rdx,%rdx), %eax
	orl	%ebp, %eax
	addq	%rsi, %rax
	addq	%r8, %rax
	testl	$-268435456, %eax
	movl	%eax, %esi
	je	.L3619
	.p2align 4,,10
	.p2align 3
.L3621:
	movl	%ecx, %r8d
	shrl	%r9d
	shrl	%ecx
	sall	$31, %r8d
	addl	$1, %r10d
	orl	%r8d, %r9d
	movl	%esi, %r8d
	shrl	%esi
	sall	$31, %r8d
	orl	%r8d, %ecx
	testl	$1879048192, %esi
	jne	.L3621
	testl	%r11d, %r11d
	jg	.L3622
.L3665:
	testl	%ebx, %ebx
	movl	$0, %eax
	cmovns	%ebx, %eax
	subl	%eax, %ebx
	jns	.L3623
	movl	_const_strconv__TEN(%rip), %r11d
	.p2align 4,,10
	.p2align 3
.L3624:
	testl	%esi, %esi
	js	.L3626
	.p2align 4,,10
	.p2align 3
.L3625:
	movl	%ecx, %r8d
	movl	%r9d, %eax
	addl	%ecx, %ecx
	shrl	$31, %eax
	addl	%esi, %esi
	shrl	$31, %r8d
	orl	%eax, %ecx
	addl	%r9d, %r9d
	subl	$1, %r10d
	orl	%r8d, %esi
	jns	.L3625
.L3626:
	movl	%esi, %eax
	xorl	%edx, %edx
	addl	$1, %ebx
	divl	%r11d
	movl	%ebx, 4(%rdi)
	movl	%eax, %esi
	movl	%ecx, %eax
	sall	$24, %edx
	shrl	$8, %eax
	orl	%edx, %eax
	xorl	%edx, %edx
	divl	%r11d
	movl	%eax, %r8d
	movl	%ecx, %eax
	movl	%r9d, %ecx
	sall	$16, %eax
	shrl	$16, %ecx
	sall	$24, %edx
	andl	$16711680, %eax
	sall	$8, %r8d
	orl	%ecx, %eax
	orl	%edx, %eax
	xorl	%edx, %edx
	divl	%r11d
	movl	%eax, %ecx
	sall	$16, %eax
	sall	$16, %edx
	shrl	$16, %ecx
	movzbl	%cl, %ecx
	orl	%r8d, %ecx
	movl	%eax, %r8d
	movzwl	%r9w, %eax
	orl	%edx, %eax
	xorl	%edx, %edx
	divl	%r11d
	orl	%r8d, %eax
	testl	%ebx, %ebx
	movl	%eax, %r9d
	jne	.L3624
.L3623:
	movl	%esi, %eax
	orl	%ecx, %eax
	orl	%r9d, %eax
	jne	.L3663
.L3627:
	leal	1023(%r10), %edx
	cmpl	$2046, %edx
	jle	.L3632
.L3666:
	movl	(%rdi), %esi
	movq	_const_strconv__DOUBLE_PLUS_INFINITY(%rip), %rax
	testl	%esi, %esi
	je	.L3618
	movq	_const_strconv__DOUBLE_MINUS_INFINITY(%rip), %rax
.L3618:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L3629:
	.cfi_restore_state
	movl	%ecx, %eax
	addl	%esi, %esi
	addl	%ecx, %ecx
	shrl	$31, %eax
	subl	$1, %r10d
	orl	%eax, %esi
	movl	%r9d, %eax
	addl	%r9d, %r9d
	shrl	$31, %eax
	orl	%eax, %ecx
.L3663:
	testl	$-268435456, %esi
	je	.L3629
	testb	$-128, %cl
	je	.L3627
	testb	$127, %cl
	je	.L3630
.L3664:
	movl	%ecx, %eax
	subl	$-128, %ecx
	subq	$-128, %rax
	shrq	$32, %rax
	addl	%eax, %esi
.L3631:
	andl	$-128, %ecx
	testl	$-536870912, %esi
	je	.L3627
	subl	$1, %r10d
	movl	%esi, %eax
	shrl	%ecx
	leal	1023(%r10), %edx
	sall	$31, %eax
	shrl	%esi
	orl	%eax, %ecx
	cmpl	$2046, %edx
	jg	.L3666
.L3632:
	testl	%edx, %edx
	jle	.L3667
	xorl	%eax, %eax
	testl	%esi, %esi
	je	.L3618
	movl	%esi, %eax
	salq	$52, %rdx
	movl	%ecx, %ecx
	andl	$268435455, %eax
	subq	$-128, %rcx
	salq	$24, %rax
	shrq	$8, %rcx
	orq	%rdx, %rax
	movl	(%rdi), %edx
	orq	%rcx, %rax
	testl	%edx, %edx
	je	.L3618
	movabsq	$-9223372036854775808, %rdx
	orq	%rdx, %rax
	jmp	.L3618
.L3630:
	testb	$1, %ch
	je	.L3631
	jmp	.L3664
.L3667:
	movl	(%rdi), %ecx
	movq	_const_strconv__DOUBLE_PLUS_ZERO(%rip), %rax
	testl	%ecx, %ecx
	je	.L3618
	movq	_const_strconv__DOUBLE_MINUS_ZERO(%rip), %rax
	jmp	.L3618
	.cfi_endproc
.LFE436:
	.size	strconv__converter, .-strconv__converter
	.section	.text.string_f32,"ax",@progbits
	.p2align 4,,15
	.globl	string_f32
	.type	string_f32, @function
string_f32:
.LFB268:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movq	%rdi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	leal	2(%rsi), %edi
	movq	%rsi, %rbx
	movl	%esi, %r13d
	leal	1(%rsi), %ebp
	subq	$72, %rsp
	.cfi_def_cfa_offset 112
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	movq	$0, 16(%rsp)
	movq	$0, 24(%rsp)
	call	v_malloc
	testl	%ebx, %ebx
	movq	%rax, %rsi
	jle	.L3669
	leaq	16(%r12), %rax
	cmpq	%rax, %rsi
	leaq	16(%rsi), %rax
	setnb	%dl
	cmpq	%rax, %r12
	setnb	%al
	orb	%al, %dl
	je	.L3670
	cmpl	$22, %ebx
	jbe	.L3670
	movq	%r12, %rdx
	leal	-1(%rbx), %ecx
	negq	%rdx
	andl	$15, %edx
	leal	15(%rdx), %eax
	cmpl	%eax, %ecx
	jb	.L3685
	testl	%edx, %edx
	je	.L3686
	movzbl	(%r12), %eax
	cmpl	$1, %edx
	movb	%al, (%rsi)
	je	.L3687
	movzbl	1(%r12), %eax
	cmpl	$2, %edx
	movb	%al, 1(%rsi)
	je	.L3688
	movzbl	2(%r12), %eax
	cmpl	$3, %edx
	movb	%al, 2(%rsi)
	je	.L3689
	movzbl	3(%r12), %eax
	cmpl	$4, %edx
	movb	%al, 3(%rsi)
	je	.L3690
	movzbl	4(%r12), %eax
	cmpl	$5, %edx
	movb	%al, 4(%rsi)
	je	.L3691
	movzbl	5(%r12), %eax
	cmpl	$6, %edx
	movb	%al, 5(%rsi)
	je	.L3692
	movzbl	6(%r12), %eax
	cmpl	$7, %edx
	movb	%al, 6(%rsi)
	je	.L3693
	movzbl	7(%r12), %eax
	cmpl	$8, %edx
	movb	%al, 7(%rsi)
	je	.L3694
	movzbl	8(%r12), %eax
	cmpl	$9, %edx
	movb	%al, 8(%rsi)
	je	.L3695
	movzbl	9(%r12), %eax
	cmpl	$10, %edx
	movb	%al, 9(%rsi)
	je	.L3696
	movzbl	10(%r12), %eax
	cmpl	$11, %edx
	movb	%al, 10(%rsi)
	je	.L3697
	movzbl	11(%r12), %eax
	cmpl	$12, %edx
	movb	%al, 11(%rsi)
	je	.L3698
	movzbl	12(%r12), %eax
	cmpl	$13, %edx
	movb	%al, 12(%rsi)
	je	.L3699
	movzbl	13(%r12), %eax
	cmpl	$15, %edx
	movb	%al, 13(%rsi)
	jne	.L3700
	movzbl	14(%r12), %eax
	movb	%al, 14(%rsi)
	movl	$15, %eax
	.p2align 4,,10
	.p2align 3
.L3672:
	movl	%ebx, %r10d
	movl	%edx, %edi
	xorl	%ecx, %ecx
	subl	%edx, %r10d
	leaq	(%r12,%rdi), %r8
	xorl	%edx, %edx
	movl	%r10d, %r9d
	addq	%rsi, %rdi
	shrl	$4, %r9d
	.p2align 4,,10
	.p2align 3
.L3674:
	movdqa	(%r8,%rdx), %xmm0
	addl	$1, %ecx
	movups	%xmm0, (%rdi,%rdx)
	addq	$16, %rdx
	cmpl	%ecx, %r9d
	ja	.L3674
	movl	%r10d, %edx
	andl	$-16, %edx
	addl	%edx, %eax
	cmpl	%edx, %r10d
	je	.L3669
.L3671:
	cltq
	.p2align 4,,10
	.p2align 3
.L3676:
	movzbl	(%r12,%rax), %edx
	movb	%dl, (%rsi,%rax)
	addq	$1, %rax
	cmpl	%eax, %r13d
	jg	.L3676
.L3669:
	movslq	%ebp, %rax
	movslq	%ebx, %rbx
	leaq	32(%rsp), %rdi
	movb	$32, (%rsi,%rbx)
	movl	%ebp, %edx
	movb	$0, (%rsi,%rax)
	call	strconv__parser
	movl	32(%rsp), %eax
	movdqu	40(%rsp), %xmm0
	testl	%eax, %eax
	movaps	%xmm0, 16(%rsp)
	je	.L3712
	cmpl	$1, %eax
	je	.L3713
	cmpl	$2, %eax
	je	.L3714
	cmpl	$3, %eax
	je	.L3715
	cmpl	$4, %eax
	pxor	%xmm0, %xmm0
	jne	.L3668
	pxor	%xmm0, %xmm0
	cvtsd2ss	_const_strconv__DOUBLE_MINUS_INFINITY(%rip), %xmm0
	jmp	.L3668
	.p2align 4,,10
	.p2align 3
.L3713:
	pxor	%xmm0, %xmm0
	cvtsd2ss	_const_strconv__DOUBLE_PLUS_ZERO(%rip), %xmm0
.L3668:
	movq	56(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L3716
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L3712:
	.cfi_restore_state
	leaq	16(%rsp), %rdi
	call	strconv__converter
	pxor	%xmm0, %xmm0
	movq	%rax, 8(%rsp)
	movsd	8(%rsp), %xmm1
	cvtsd2ss	%xmm1, %xmm0
	jmp	.L3668
	.p2align 4,,10
	.p2align 3
.L3687:
	movl	$1, %eax
	jmp	.L3672
	.p2align 4,,10
	.p2align 3
.L3670:
	leal	-1(%rbx), %ecx
	xorl	%eax, %eax
	addq	$1, %rcx
	.p2align 4,,10
	.p2align 3
.L3677:
	movzbl	(%r12,%rax), %edx
	movb	%dl, (%rsi,%rax)
	addq	$1, %rax
	cmpq	%rcx, %rax
	jne	.L3677
	jmp	.L3669
	.p2align 4,,10
	.p2align 3
.L3714:
	pxor	%xmm0, %xmm0
	cvtsd2ss	_const_strconv__DOUBLE_MINUS_ZERO(%rip), %xmm0
	jmp	.L3668
	.p2align 4,,10
	.p2align 3
.L3715:
	pxor	%xmm0, %xmm0
	cvtsd2ss	_const_strconv__DOUBLE_PLUS_INFINITY(%rip), %xmm0
	jmp	.L3668
	.p2align 4,,10
	.p2align 3
.L3688:
	movl	$2, %eax
	jmp	.L3672
	.p2align 4,,10
	.p2align 3
.L3685:
	xorl	%eax, %eax
	jmp	.L3671
	.p2align 4,,10
	.p2align 3
.L3689:
	movl	$3, %eax
	jmp	.L3672
.L3690:
	movl	$4, %eax
	jmp	.L3672
.L3693:
	movl	$7, %eax
	jmp	.L3672
.L3691:
	movl	$5, %eax
	jmp	.L3672
.L3692:
	movl	$6, %eax
	jmp	.L3672
.L3686:
	xorl	%eax, %eax
	jmp	.L3672
.L3694:
	movl	$8, %eax
	jmp	.L3672
.L3695:
	movl	$9, %eax
	jmp	.L3672
.L3696:
	movl	$10, %eax
	jmp	.L3672
.L3697:
	movl	$11, %eax
	jmp	.L3672
.L3698:
	movl	$12, %eax
	jmp	.L3672
.L3699:
	movl	$13, %eax
	jmp	.L3672
.L3700:
	movl	$14, %eax
	jmp	.L3672
.L3716:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE268:
	.size	string_f32, .-string_f32
	.section	.text.string_f64,"ax",@progbits
	.p2align 4,,15
	.globl	string_f64
	.type	string_f64, @function
string_f64:
.LFB269:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movq	%rdi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	leal	2(%rsi), %edi
	movq	%rsi, %rbx
	movl	%esi, %r13d
	leal	1(%rsi), %ebp
	subq	$72, %rsp
	.cfi_def_cfa_offset 112
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	movq	$0, 16(%rsp)
	movq	$0, 24(%rsp)
	call	v_malloc
	testl	%ebx, %ebx
	movq	%rax, %rsi
	jle	.L3718
	leaq	16(%r12), %rax
	cmpq	%rax, %rsi
	leaq	16(%rsi), %rax
	setnb	%dl
	cmpq	%rax, %r12
	setnb	%al
	orb	%al, %dl
	je	.L3719
	cmpl	$22, %ebx
	jbe	.L3719
	movq	%r12, %rdx
	leal	-1(%rbx), %ecx
	negq	%rdx
	andl	$15, %edx
	leal	15(%rdx), %eax
	cmpl	%eax, %ecx
	jb	.L3734
	testl	%edx, %edx
	je	.L3735
	movzbl	(%r12), %eax
	cmpl	$1, %edx
	movb	%al, (%rsi)
	je	.L3736
	movzbl	1(%r12), %eax
	cmpl	$2, %edx
	movb	%al, 1(%rsi)
	je	.L3737
	movzbl	2(%r12), %eax
	cmpl	$3, %edx
	movb	%al, 2(%rsi)
	je	.L3738
	movzbl	3(%r12), %eax
	cmpl	$4, %edx
	movb	%al, 3(%rsi)
	je	.L3739
	movzbl	4(%r12), %eax
	cmpl	$5, %edx
	movb	%al, 4(%rsi)
	je	.L3740
	movzbl	5(%r12), %eax
	cmpl	$6, %edx
	movb	%al, 5(%rsi)
	je	.L3741
	movzbl	6(%r12), %eax
	cmpl	$7, %edx
	movb	%al, 6(%rsi)
	je	.L3742
	movzbl	7(%r12), %eax
	cmpl	$8, %edx
	movb	%al, 7(%rsi)
	je	.L3743
	movzbl	8(%r12), %eax
	cmpl	$9, %edx
	movb	%al, 8(%rsi)
	je	.L3744
	movzbl	9(%r12), %eax
	cmpl	$10, %edx
	movb	%al, 9(%rsi)
	je	.L3745
	movzbl	10(%r12), %eax
	cmpl	$11, %edx
	movb	%al, 10(%rsi)
	je	.L3746
	movzbl	11(%r12), %eax
	cmpl	$12, %edx
	movb	%al, 11(%rsi)
	je	.L3747
	movzbl	12(%r12), %eax
	cmpl	$13, %edx
	movb	%al, 12(%rsi)
	je	.L3748
	movzbl	13(%r12), %eax
	cmpl	$15, %edx
	movb	%al, 13(%rsi)
	jne	.L3749
	movzbl	14(%r12), %eax
	movb	%al, 14(%rsi)
	movl	$15, %eax
	.p2align 4,,10
	.p2align 3
.L3721:
	movl	%ebx, %r10d
	movl	%edx, %edi
	xorl	%ecx, %ecx
	subl	%edx, %r10d
	leaq	(%r12,%rdi), %r8
	xorl	%edx, %edx
	movl	%r10d, %r9d
	addq	%rsi, %rdi
	shrl	$4, %r9d
	.p2align 4,,10
	.p2align 3
.L3723:
	movdqa	(%r8,%rdx), %xmm0
	addl	$1, %ecx
	movups	%xmm0, (%rdi,%rdx)
	addq	$16, %rdx
	cmpl	%ecx, %r9d
	ja	.L3723
	movl	%r10d, %edx
	andl	$-16, %edx
	addl	%edx, %eax
	cmpl	%edx, %r10d
	je	.L3718
.L3720:
	cltq
	.p2align 4,,10
	.p2align 3
.L3725:
	movzbl	(%r12,%rax), %edx
	movb	%dl, (%rsi,%rax)
	addq	$1, %rax
	cmpl	%eax, %r13d
	jg	.L3725
.L3718:
	movslq	%ebp, %rax
	movslq	%ebx, %rbx
	leaq	32(%rsp), %rdi
	movb	$32, (%rsi,%rbx)
	movl	%ebp, %edx
	movb	$0, (%rsi,%rax)
	call	strconv__parser
	movl	32(%rsp), %eax
	movdqu	40(%rsp), %xmm0
	testl	%eax, %eax
	movaps	%xmm0, 16(%rsp)
	je	.L3761
	cmpl	$1, %eax
	movsd	_const_strconv__DOUBLE_PLUS_ZERO(%rip), %xmm0
	je	.L3717
	cmpl	$2, %eax
	movsd	_const_strconv__DOUBLE_MINUS_ZERO(%rip), %xmm0
	je	.L3717
	cmpl	$3, %eax
	movsd	_const_strconv__DOUBLE_PLUS_INFINITY(%rip), %xmm0
	je	.L3717
	cmpl	$4, %eax
	pxor	%xmm0, %xmm0
	je	.L3762
	.p2align 4,,10
	.p2align 3
.L3717:
	movq	56(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L3763
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L3761:
	.cfi_restore_state
	leaq	16(%rsp), %rdi
	call	strconv__converter
	movq	%rax, 8(%rsp)
	movsd	8(%rsp), %xmm0
	jmp	.L3717
	.p2align 4,,10
	.p2align 3
.L3762:
	movsd	_const_strconv__DOUBLE_MINUS_INFINITY(%rip), %xmm0
	jmp	.L3717
	.p2align 4,,10
	.p2align 3
.L3736:
	movl	$1, %eax
	jmp	.L3721
	.p2align 4,,10
	.p2align 3
.L3719:
	leal	-1(%rbx), %ecx
	xorl	%eax, %eax
	addq	$1, %rcx
	.p2align 4,,10
	.p2align 3
.L3726:
	movzbl	(%r12,%rax), %edx
	movb	%dl, (%rsi,%rax)
	addq	$1, %rax
	cmpq	%rcx, %rax
	jne	.L3726
	jmp	.L3718
	.p2align 4,,10
	.p2align 3
.L3737:
	movl	$2, %eax
	jmp	.L3721
	.p2align 4,,10
	.p2align 3
.L3734:
	xorl	%eax, %eax
	jmp	.L3720
	.p2align 4,,10
	.p2align 3
.L3738:
	movl	$3, %eax
	jmp	.L3721
.L3739:
	movl	$4, %eax
	jmp	.L3721
.L3742:
	movl	$7, %eax
	jmp	.L3721
.L3740:
	movl	$5, %eax
	jmp	.L3721
.L3741:
	movl	$6, %eax
	jmp	.L3721
.L3735:
	xorl	%eax, %eax
	jmp	.L3721
.L3743:
	movl	$8, %eax
	jmp	.L3721
.L3744:
	movl	$9, %eax
	jmp	.L3721
.L3745:
	movl	$10, %eax
	jmp	.L3721
.L3746:
	movl	$11, %eax
	jmp	.L3721
.L3747:
	movl	$12, %eax
	jmp	.L3721
.L3748:
	movl	$13, %eax
	jmp	.L3721
.L3749:
	movl	$14, %eax
	jmp	.L3721
.L3763:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE269:
	.size	string_f64, .-string_f64
	.section	.text.strconv__atof64,"ax",@progbits
	.p2align 4,,15
	.globl	strconv__atof64
	.type	strconv__atof64, @function
strconv__atof64:
.LFB437:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movq	%rdi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	leal	2(%rsi), %edi
	movq	%rsi, %rbx
	movl	%esi, %r13d
	leal	1(%rsi), %ebp
	subq	$72, %rsp
	.cfi_def_cfa_offset 112
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	movq	$0, 16(%rsp)
	movq	$0, 24(%rsp)
	call	v_malloc
	testl	%ebx, %ebx
	movq	%rax, %rsi
	jle	.L3765
	leaq	16(%rax), %rax
	cmpq	%rax, %r12
	leaq	16(%r12), %rax
	setnb	%dl
	cmpq	%rax, %rsi
	setnb	%al
	orb	%al, %dl
	je	.L3766
	cmpl	$22, %ebx
	jbe	.L3766
	movq	%r12, %rdx
	leal	-1(%rbx), %ecx
	negq	%rdx
	andl	$15, %edx
	leal	15(%rdx), %eax
	cmpl	%eax, %ecx
	jb	.L3781
	testl	%edx, %edx
	je	.L3782
	movzbl	(%r12), %eax
	cmpl	$1, %edx
	movb	%al, (%rsi)
	je	.L3783
	movzbl	1(%r12), %eax
	cmpl	$2, %edx
	movb	%al, 1(%rsi)
	je	.L3784
	movzbl	2(%r12), %eax
	cmpl	$3, %edx
	movb	%al, 2(%rsi)
	je	.L3785
	movzbl	3(%r12), %eax
	cmpl	$4, %edx
	movb	%al, 3(%rsi)
	je	.L3786
	movzbl	4(%r12), %eax
	cmpl	$5, %edx
	movb	%al, 4(%rsi)
	je	.L3787
	movzbl	5(%r12), %eax
	cmpl	$6, %edx
	movb	%al, 5(%rsi)
	je	.L3788
	movzbl	6(%r12), %eax
	cmpl	$7, %edx
	movb	%al, 6(%rsi)
	je	.L3789
	movzbl	7(%r12), %eax
	cmpl	$8, %edx
	movb	%al, 7(%rsi)
	je	.L3790
	movzbl	8(%r12), %eax
	cmpl	$9, %edx
	movb	%al, 8(%rsi)
	je	.L3791
	movzbl	9(%r12), %eax
	cmpl	$10, %edx
	movb	%al, 9(%rsi)
	je	.L3792
	movzbl	10(%r12), %eax
	cmpl	$11, %edx
	movb	%al, 10(%rsi)
	je	.L3793
	movzbl	11(%r12), %eax
	cmpl	$12, %edx
	movb	%al, 11(%rsi)
	je	.L3794
	movzbl	12(%r12), %eax
	cmpl	$13, %edx
	movb	%al, 12(%rsi)
	je	.L3795
	movzbl	13(%r12), %eax
	cmpl	$15, %edx
	movb	%al, 13(%rsi)
	jne	.L3796
	movzbl	14(%r12), %eax
	movb	%al, 14(%rsi)
	movl	$15, %eax
	.p2align 4,,10
	.p2align 3
.L3768:
	movl	%ebx, %r10d
	movl	%edx, %edi
	xorl	%ecx, %ecx
	subl	%edx, %r10d
	leaq	(%r12,%rdi), %r8
	xorl	%edx, %edx
	movl	%r10d, %r9d
	addq	%rsi, %rdi
	shrl	$4, %r9d
	.p2align 4,,10
	.p2align 3
.L3770:
	movdqa	(%r8,%rdx), %xmm0
	addl	$1, %ecx
	movups	%xmm0, (%rdi,%rdx)
	addq	$16, %rdx
	cmpl	%ecx, %r9d
	ja	.L3770
	movl	%r10d, %edx
	andl	$-16, %edx
	addl	%edx, %eax
	cmpl	%edx, %r10d
	je	.L3765
.L3767:
	cltq
	.p2align 4,,10
	.p2align 3
.L3772:
	movzbl	(%r12,%rax), %edx
	movb	%dl, (%rsi,%rax)
	addq	$1, %rax
	cmpl	%eax, %r13d
	jg	.L3772
.L3765:
	movslq	%ebp, %rax
	movslq	%ebx, %rbx
	leaq	32(%rsp), %rdi
	movb	$32, (%rsi,%rbx)
	movl	%ebp, %edx
	movb	$0, (%rsi,%rax)
	call	strconv__parser
	movl	32(%rsp), %eax
	movdqu	40(%rsp), %xmm0
	testl	%eax, %eax
	movaps	%xmm0, 16(%rsp)
	je	.L3808
	cmpl	$1, %eax
	movsd	_const_strconv__DOUBLE_PLUS_ZERO(%rip), %xmm0
	je	.L3764
	cmpl	$2, %eax
	movsd	_const_strconv__DOUBLE_MINUS_ZERO(%rip), %xmm0
	je	.L3764
	cmpl	$3, %eax
	movsd	_const_strconv__DOUBLE_PLUS_INFINITY(%rip), %xmm0
	je	.L3764
	cmpl	$4, %eax
	pxor	%xmm0, %xmm0
	je	.L3809
	.p2align 4,,10
	.p2align 3
.L3764:
	movq	56(%rsp), %rax
	xorq	%fs:40, %rax
	jne	.L3810
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L3808:
	.cfi_restore_state
	leaq	16(%rsp), %rdi
	call	strconv__converter
	movq	%rax, 8(%rsp)
	movsd	8(%rsp), %xmm0
	jmp	.L3764
	.p2align 4,,10
	.p2align 3
.L3809:
	movsd	_const_strconv__DOUBLE_MINUS_INFINITY(%rip), %xmm0
	jmp	.L3764
	.p2align 4,,10
	.p2align 3
.L3783:
	movl	$1, %eax
	jmp	.L3768
	.p2align 4,,10
	.p2align 3
.L3766:
	leal	-1(%rbx), %ecx
	xorl	%eax, %eax
	addq	$1, %rcx
	.p2align 4,,10
	.p2align 3
.L3773:
	movzbl	(%r12,%rax), %edx
	movb	%dl, (%rsi,%rax)
	addq	$1, %rax
	cmpq	%rcx, %rax
	jne	.L3773
	jmp	.L3765
	.p2align 4,,10
	.p2align 3
.L3784:
	movl	$2, %eax
	jmp	.L3768
	.p2align 4,,10
	.p2align 3
.L3781:
	xorl	%eax, %eax
	jmp	.L3767
	.p2align 4,,10
	.p2align 3
.L3785:
	movl	$3, %eax
	jmp	.L3768
.L3786:
	movl	$4, %eax
	jmp	.L3768
.L3789:
	movl	$7, %eax
	jmp	.L3768
.L3787:
	movl	$5, %eax
	jmp	.L3768
.L3788:
	movl	$6, %eax
	jmp	.L3768
.L3782:
	xorl	%eax, %eax
	jmp	.L3768
.L3790:
	movl	$8, %eax
	jmp	.L3768
.L3791:
	movl	$9, %eax
	jmp	.L3768
.L3792:
	movl	$10, %eax
	jmp	.L3768
.L3793:
	movl	$11, %eax
	jmp	.L3768
.L3794:
	movl	$12, %eax
	jmp	.L3768
.L3795:
	movl	$13, %eax
	jmp	.L3768
.L3796:
	movl	$14, %eax
	jmp	.L3768
.L3810:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE437:
	.size	strconv__atof64, .-strconv__atof64
	.section	.text.strconv__byte_to_lower,"ax",@progbits
	.p2align 4,,15
	.globl	strconv__byte_to_lower
	.type	strconv__byte_to_lower, @function
strconv__byte_to_lower:
.LFB438:
	.cfi_startproc
	movl	%edi, %eax
	orl	$32, %eax
	ret
	.cfi_endproc
.LFE438:
	.size	strconv__byte_to_lower, .-strconv__byte_to_lower
	.section	.text.strconv__underscore_ok,"ax",@progbits
	.p2align 4,,15
	.globl	strconv__underscore_ok
	.type	strconv__underscore_ok, @function
strconv__underscore_ok:
.LFB444:
	.cfi_startproc
	testl	%esi, %esi
	movl	$1, %eax
	jg	.L3849
	rep ret
	.p2align 4,,10
	.p2align 3
.L3849:
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	xorl	%edx, %edx
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	%esi, %r15d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rsi, %rbp
	movq	%rsi, %r13
	movq	%rdi, %r12
	movl	$1, %ebx
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	call	string_at
	cmpb	$45, %al
	je	.L3814
	xorl	%edx, %edx
	movq	%r12, %rdi
	movq	%rbp, %rsi
	xorl	%ebx, %ebx
	call	string_at
	cmpb	$43, %al
	sete	%bl
.L3814:
	movl	%r15d, %eax
	subl	%ebx, %eax
	cmpl	$1, %eax
	jle	.L3831
	movl	%ebx, %edx
	movq	%r12, %rdi
	movq	%r13, %rsi
	call	string_at
	cmpb	$48, %al
	movl	%eax, %r14d
	je	.L3850
.L3831:
	movl	$0, 12(%rsp)
	movl	$94, %r14d
.L3815:
	cmpl	%r15d, %ebx
	jge	.L3844
	movl	%r15d, %eax
	movq	%rax, (%rsp)
	.p2align 4,,10
	.p2align 3
.L3827:
	movabsq	$-4294967296, %rax
	movl	%ebx, %edx
	movq	%r12, %rdi
	andq	%rax, %rbp
	orq	(%rsp), %rbp
	movq	%rbp, %rsi
	movq	%rbp, %r13
	call	string_at
	cmpb	$47, %al
	ja	.L3818
.L3821:
	movl	12(%rsp), %eax
	testl	%eax, %eax
	je	.L3820
	movl	%ebx, %edx
	movq	%r12, %rdi
	movq	%r13, %rsi
	call	string_at
	orl	$32, %eax
	cmpb	$96, %al
	ja	.L3851
.L3820:
	movl	%ebx, %edx
	movq	%r12, %rdi
	movq	%r13, %rsi
	call	string_at
	cmpb	$95, %al
	je	.L3852
	cmpb	$95, %r14b
	je	.L3833
	movl	$1, %eax
	movl	$33, %r14d
.L3822:
	addl	$1, %ebx
	cmpl	%r15d, %ebx
	jne	.L3827
.L3812:
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L3818:
	.cfi_restore_state
	movl	%ebx, %edx
	movq	%r12, %rdi
	movq	%rbp, %rsi
	call	string_at
	cmpb	$57, %al
	ja	.L3821
.L3825:
	movl	$1, %eax
	movl	$48, %r14d
	jmp	.L3822
	.p2align 4,,10
	.p2align 3
.L3852:
	cmpb	$48, %r14b
	je	.L3853
.L3833:
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L3853:
	.cfi_restore_state
	movl	$95, %r14d
	xorl	%eax, %eax
	jmp	.L3822
	.p2align 4,,10
	.p2align 3
.L3851:
	movl	%ebx, %edx
	movq	%r12, %rdi
	movq	%r13, %rsi
	call	string_at
	orl	$32, %eax
	cmpb	$102, %al
	ja	.L3820
	jmp	.L3825
	.p2align 4,,10
	.p2align 3
.L3850:
	leal	1(%rbx), %eax
	movq	%r12, %rdi
	movq	%r13, %rsi
	movl	%eax, %edx
	movl	%eax, (%rsp)
	call	string_at
	orl	$32, %eax
	cmpb	$98, %al
	je	.L3817
	movl	(%rsp), %edx
	movq	%r12, %rdi
	movq	%r13, %rsi
	call	string_at
	orl	$32, %eax
	cmpb	$111, %al
	jne	.L3854
.L3817:
	movl	(%rsp), %edx
	movq	%r12, %rdi
	movq	%r13, %rsi
	call	string_at
	orl	$32, %eax
	cmpb	$120, %al
	sete	%al
	addl	$2, %ebx
	movzbl	%al, %eax
	movl	%eax, 12(%rsp)
	jmp	.L3815
.L3854:
	movl	(%rsp), %edx
	movq	%r12, %rdi
	movq	%r13, %rsi
	call	string_at
	orl	$32, %eax
	cmpb	$120, %al
	jne	.L3831
	jmp	.L3817
.L3844:
	movl	$1, %eax
	jmp	.L3812
	.cfi_endproc
.LFE444:
	.size	strconv__underscore_ok, .-strconv__underscore_ok
	.section	.text.strconv__common_parse_uint,"ax",@progbits
	.p2align 4,,15
	.globl	strconv__common_parse_uint
	.type	strconv__common_parse_uint, @function
strconv__common_parse_uint:
.LFB439:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	testl	%esi, %esi
	movl	%r8d, 40(%rsp)
	movl	%r9d, 36(%rsp)
	movl	%esi, (%rsp)
	jle	.L3858
	movq	%rdi, %r12
	movq	%rsi, %r15
	movq	%rsi, %rbp
	movl	%edx, %ebx
	movl	%ecx, %r14d
	call	strconv__underscore_ok
	testl	%eax, %eax
	je	.L3858
	leal	-2(%rbx), %eax
	cmpl	$34, %eax
	ja	.L3908
	movl	%ebx, 4(%rsp)
	xorl	%r13d, %r13d
.L3859:
	testl	%r14d, %r14d
	jne	.L3863
	movslq	4(%rsp), %rax
	xorl	%edx, %edx
	movl	$4294967295, %ebp
	movq	%rax, %rcx
	movq	%rax, 24(%rsp)
	movq	_const_strconv__max_u64(%rip), %rax
	divq	%rcx
	addq	$1, %rax
	movq	%rax, 16(%rsp)
.L3865:
	movl	%r15d, %eax
	cmpl	%eax, %r13d
	jge	.L3858
	testl	%ebx, %ebx
	movq	%rbp, 8(%rsp)
	movl	$0, 44(%rsp)
	sete	35(%rsp)
	xorl	%r14d, %r14d
	movq	%r14, %rbp
	movl	%r13d, %r14d
	movq	%rax, %r13
	jmp	.L3874
	.p2align 4,,10
	.p2align 3
.L3910:
	cmpb	$0, 35(%rsp)
	je	.L3883
	movl	$1, 44(%rsp)
.L3866:
	addl	$1, %r14d
	cmpl	%r14d, (%rsp)
	je	.L3909
.L3874:
	movabsq	$-4294967296, %rbx
	movl	%r14d, %edx
	movq	%r12, %rdi
	andq	%r15, %rbx
	orq	%r13, %rbx
	movq	%rbx, %rsi
	movq	%rbx, %r15
	call	string_at
	cmpb	$95, %al
	je	.L3910
.L3883:
	leal	-48(%rax), %edx
	cmpb	$9, %dl
	jbe	.L3868
	orl	$32, %eax
	leal	-97(%rax), %edx
	cmpb	$25, %dl
	ja	.L3869
	leal	-87(%rax), %edx
.L3868:
	cmpb	4(%rsp), %dl
	jnb	.L3911
	cmpq	%rbp, 16(%rsp)
	jbe	.L3905
	movq	24(%rsp), %r9
	movzbl	%dl, %edx
	imulq	%rbp, %r9
	addq	%r9, %rdx
	movq	%rdx, %rbp
	jc	.L3905
	cmpq	%rdx, 8(%rsp)
	jnb	.L3866
.L3905:
	movq	8(%rsp), %rbp
	jmp	.L3855
	.p2align 4,,10
	.p2align 3
.L3909:
	movq	%rbp, %r14
.L3907:
	movl	44(%rsp), %eax
	movq	%r14, %rbp
	testl	%eax, %eax
	je	.L3855
	movq	%r12, %rdi
	movq	%rbx, %rsi
	call	strconv__underscore_ok
	testl	%eax, %eax
	jne	.L3855
	.p2align 4,,10
	.p2align 3
.L3858:
	xorl	%ebp, %ebp
.L3855:
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%rbp, %rax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L3908:
	.cfi_restore_state
	testl	%ebx, %ebx
	jne	.L3858
	xorl	%edx, %edx
	movq	%r12, %rdi
	movq	%r15, %rsi
	call	string_at
	xorl	%r13d, %r13d
	cmpb	$48, %al
	movl	$10, 4(%rsp)
	jne	.L3859
	cmpl	$2, (%rsp)
	jg	.L3912
	cmpl	$1, (%rsp)
	jne	.L3875
.L3862:
	movl	$1, %r13d
	movl	$8, 4(%rsp)
	jmp	.L3859
	.p2align 4,,10
	.p2align 3
.L3863:
	cmpl	$64, %r14d
	ja	.L3858
	movslq	4(%rsp), %rax
	movq	_const_strconv__max_u64(%rip), %rbp
	xorl	%edx, %edx
	movq	%rax, %rdi
	movq	%rax, 24(%rsp)
	movq	%rbp, %rax
	divq	%rdi
	addq	$1, %rax
	cmpl	$64, %r14d
	movq	%rax, 16(%rsp)
	je	.L3865
	movl	$1, %ebp
	movl	%r14d, %ecx
	salq	%cl, %rbp
	subq	$1, %rbp
	jmp	.L3865
	.p2align 4,,10
	.p2align 3
.L3911:
	movl	36(%rsp), %edx
	movq	%rbp, %r14
	testl	%edx, %edx
	je	.L3907
	jmp	.L3858
	.p2align 4,,10
	.p2align 3
.L3869:
	movl	40(%rsp), %ecx
	movq	%rbp, %r14
	testl	%ecx, %ecx
	je	.L3907
	jmp	.L3858
.L3875:
	movl	$1, %edx
	movq	%r12, %rdi
	movq	%rbp, %rsi
	call	string_at
	cmpb	$47, %al
	jbe	.L3862
	movl	$1, %edx
	movq	%r12, %rdi
	movq	%rbp, %rsi
	call	string_at
	cmpb	$57, %al
	ja	.L3862
	movl	$1, %r13d
	movl	$10, 4(%rsp)
	jmp	.L3859
.L3912:
	movl	$1, %edx
	movq	%r12, %rdi
	movq	%r15, %rsi
	call	string_at
	orl	$32, %eax
	cmpb	$98, %al
	je	.L3878
	movl	$1, %edx
	movq	%r12, %rdi
	movq	%r15, %rsi
	call	string_at
	orl	$32, %eax
	cmpb	$111, %al
	je	.L3913
	movl	$1, %edx
	movq	%r12, %rdi
	movq	%r15, %rsi
	call	string_at
	orl	$32, %eax
	cmpb	$120, %al
	jne	.L3875
	movl	$2, %r13d
	movl	$16, 4(%rsp)
	jmp	.L3859
.L3878:
	movl	$2, %r13d
	movl	$2, 4(%rsp)
	jmp	.L3859
.L3913:
	movl	$2, %r13d
	movl	$8, 4(%rsp)
	jmp	.L3859
	.cfi_endproc
.LFE439:
	.size	strconv__common_parse_uint, .-strconv__common_parse_uint
	.section	.text.string_u16,"ax",@progbits
	.p2align 4,,15
	.globl	string_u16
	.type	string_u16, @function
string_u16:
.LFB270:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$16, %ecx
	xorl	%edx, %edx
	call	strconv__common_parse_uint
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE270:
	.size	string_u16, .-string_u16
	.section	.text.string_u32,"ax",@progbits
	.p2align 4,,15
	.globl	string_u32
	.type	string_u32, @function
string_u32:
.LFB271:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$32, %ecx
	xorl	%edx, %edx
	call	strconv__common_parse_uint
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE271:
	.size	string_u32, .-string_u32
	.section	.text.string_u64,"ax",@progbits
	.p2align 4,,15
	.globl	string_u64
	.type	string_u64, @function
string_u64:
.LFB272:
	.cfi_startproc
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$64, %ecx
	xorl	%edx, %edx
	jmp	strconv__common_parse_uint
	.cfi_endproc
.LFE272:
	.size	string_u64, .-string_u64
	.section	.text.strconv__parse_uint,"ax",@progbits
	.p2align 4,,15
	.globl	strconv__parse_uint
	.type	strconv__parse_uint, @function
strconv__parse_uint:
.LFB440:
	.cfi_startproc
	movl	$1, %r9d
	movl	$1, %r8d
	jmp	strconv__common_parse_uint
	.cfi_endproc
.LFE440:
	.size	strconv__parse_uint, .-strconv__parse_uint
	.section	.text.strconv__common_parse_int,"ax",@progbits
	.p2align 4,,15
	.globl	strconv__common_parse_int
	.type	strconv__common_parse_int, @function
strconv__common_parse_int:
.LFB441:
	.cfi_startproc
	testl	%esi, %esi
	jle	.L3952
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	movq	%rdi, %r15
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	%r9d, %r14d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%esi, %ebp
	movq	%rsi, %r12
	movl	%r8d, %r13d
	movl	%ecx, %ebx
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movl	%edx, 4(%rsp)
	xorl	%edx, %edx
	call	string_at
	cmpb	$43, %al
	je	.L3953
	xorl	%edx, %edx
	movq	%r15, %rdi
	movq	%r12, %rsi
	call	string_at
	cmpb	$45, %al
	movb	$1, 11(%rsp)
	movl	$0, 12(%rsp)
	je	.L3954
.L3924:
	movabsq	$-4294967296, %rsi
	movl	4(%rsp), %edx
	movl	%r14d, %r9d
	andq	%r12, %rsi
	movl	%r13d, %r8d
	movl	%ebx, %ecx
	orq	%rbp, %rsi
	movq	%r15, %rdi
	call	strconv__common_parse_uint
	testq	%rax, %rax
	je	.L3925
	testl	%ebx, %ebx
	movl	$2147483648, %edx
	jne	.L3955
	cmpq	%rdx, %rax
	jb	.L3927
.L3956:
	cmpb	$0, 11(%rsp)
	je	.L3927
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	leaq	-1(%rdx), %rax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L3925:
	.cfi_restore_state
	xorl	%eax, %eax
.L3920:
	addq	$24, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L3952:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	.cfi_restore 15
	xorl	%eax, %eax
	ret
	.p2align 4,,10
	.p2align 3
.L3953:
	.cfi_def_cfa_offset 80
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	movl	%r12d, %ecx
	movq	%r15, %rdi
	movq	%r12, %rsi
	movl	$1, %edx
	call	string_substr
	movb	$1, 11(%rsp)
	movq	%rax, %r15
	movq	%rdx, %r12
	movl	%edx, %ebp
	movl	$0, 12(%rsp)
	jmp	.L3924
	.p2align 4,,10
	.p2align 3
.L3955:
	leal	-1(%rbx), %ecx
	movl	$1, %edx
	salq	%cl, %rdx
	cmpq	%rdx, %rax
	jnb	.L3956
.L3927:
	cmpq	%rdx, %rax
	jbe	.L3928
	movl	12(%rsp), %esi
	testl	%esi, %esi
	je	.L3928
	movq	%rdx, %rax
	negq	%rax
	jmp	.L3920
	.p2align 4,,10
	.p2align 3
.L3928:
	movl	12(%rsp), %ecx
	movq	%rax, %rdx
	negq	%rdx
	testl	%ecx, %ecx
	cmovne	%rdx, %rax
	jmp	.L3920
	.p2align 4,,10
	.p2align 3
.L3954:
	movl	%r12d, %ecx
	movq	%r15, %rdi
	movq	%r12, %rsi
	movl	$1, %edx
	call	string_substr
	movb	$0, 11(%rsp)
	movq	%rax, %r15
	movq	%rdx, %r12
	movl	%edx, %ebp
	movl	$1, 12(%rsp)
	jmp	.L3924
	.cfi_endproc
.LFE441:
	.size	strconv__common_parse_int, .-strconv__common_parse_int
	.section	.text.string_int,"ax",@progbits
	.p2align 4,,15
	.globl	string_int
	.type	string_int, @function
string_int:
.LFB264:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$32, %ecx
	xorl	%edx, %edx
	call	strconv__common_parse_int
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE264:
	.size	string_int, .-string_int
	.section	.text.string_i64,"ax",@progbits
	.p2align 4,,15
	.globl	string_i64
	.type	string_i64, @function
string_i64:
.LFB265:
	.cfi_startproc
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$64, %ecx
	xorl	%edx, %edx
	jmp	strconv__common_parse_int
	.cfi_endproc
.LFE265:
	.size	string_i64, .-string_i64
	.section	.text.string_i8,"ax",@progbits
	.p2align 4,,15
	.globl	string_i8
	.type	string_i8, @function
string_i8:
.LFB266:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$8, %ecx
	xorl	%edx, %edx
	call	strconv__common_parse_int
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE266:
	.size	string_i8, .-string_i8
	.section	.text.string_i16,"ax",@progbits
	.p2align 4,,15
	.globl	string_i16
	.type	string_i16, @function
string_i16:
.LFB267:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$16, %ecx
	xorl	%edx, %edx
	call	strconv__common_parse_int
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE267:
	.size	string_i16, .-string_i16
	.section	.text.strconv__parse_int,"ax",@progbits
	.p2align 4,,15
	.globl	strconv__parse_int
	.type	strconv__parse_int, @function
strconv__parse_int:
.LFB442:
	.cfi_startproc
	movl	$1, %r9d
	movl	$1, %r8d
	jmp	strconv__common_parse_int
	.cfi_endproc
.LFE442:
	.size	strconv__parse_int, .-strconv__parse_int
	.section	.text.strconv__atoi,"ax",@progbits
	.p2align 4,,15
	.globl	strconv__atoi
	.type	strconv__atoi, @function
strconv__atoi:
.LFB443:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	leal	-1(%rsi), %eax
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbp
	movq	%rsi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	cmpl	$8, %eax
	ja	.L3966
	xorl	%edx, %edx
	movl	%esi, %r12d
	call	string_at
	cmpb	$45, %al
	jne	.L3967
.L3970:
	cmpl	$1, %r12d
	movl	$1, %r13d
	je	.L3968
.L3969:
	xorl	%r15d, %r15d
	movl	%r12d, %r14d
	jmp	.L3972
	.p2align 4,,10
	.p2align 3
.L3982:
	leal	(%r15,%r15,4), %edx
	addl	$1, %r13d
	movzbl	%al, %eax
	cmpl	%r12d, %r13d
	leal	(%rax,%rdx,2), %r15d
	je	.L3981
.L3972:
	movabsq	$-4294967296, %rax
	movl	%r13d, %edx
	movq	%rbp, %rdi
	andq	%rax, %rbx
	orq	%r14, %rbx
	movq	%rbx, %rsi
	call	string_at
	subl	$48, %eax
	cmpb	$9, %al
	jbe	.L3982
.L3968:
	xorl	%r15d, %r15d
	jmp	.L3965
	.p2align 4,,10
	.p2align 3
.L3966:
	movl	$1, %r9d
	movl	$1, %r8d
	xorl	%ecx, %ecx
	movl	$10, %edx
	call	strconv__common_parse_int
	movl	%eax, %r15d
.L3965:
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	%r15d, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L3967:
	.cfi_restore_state
	xorl	%edx, %edx
	movq	%rbp, %rdi
	movq	%rbx, %rsi
	call	string_at
	xorl	%r13d, %r13d
	cmpb	$43, %al
	jne	.L3969
	jmp	.L3970
	.p2align 4,,10
	.p2align 3
.L3981:
	movabsq	$-4294967296, %rax
	xorl	%edx, %edx
	movq	%rbp, %rdi
	andq	%rax, %rbx
	movq	%rbx, %rsi
	orq	%r14, %rsi
	call	string_at
	movl	%r15d, %edx
	negl	%edx
	cmpb	$45, %al
	cmove	%edx, %r15d
	jmp	.L3965
	.cfi_endproc
.LFE443:
	.size	strconv__atoi, .-strconv__atoi
	.section	.text.rand__new_pcg32,"ax",@progbits
	.p2align 4,,15
	.globl	rand__new_pcg32
	.type	rand__new_pcg32, @function
rand__new_pcg32:
.LFB445:
	.cfi_startproc
	leaq	1(%rsi,%rsi), %rdx
	leaq	(%rdx,%rdi), %rax
	movabsq	$6364136223846793005, %rdi
	imulq	%rax, %rdi
	leaq	(%rdi,%rdx), %rax
	ret
	.cfi_endproc
.LFE445:
	.size	rand__new_pcg32, .-rand__new_pcg32
	.section	.text.rand__Pcg32_next,"ax",@progbits
	.p2align 4,,15
	.globl	rand__Pcg32_next
	.type	rand__Pcg32_next, @function
rand__Pcg32_next:
.LFB446:
	.cfi_startproc
	movq	(%rdi), %rcx
	movabsq	$6364136223846793005, %rax
	imulq	%rcx, %rax
	addq	8(%rdi), %rax
	movq	%rax, (%rdi)
	movq	%rcx, %rax
	shrq	$18, %rax
	xorq	%rcx, %rax
	shrq	$59, %rcx
	shrq	$27, %rax
	rorl	%cl, %eax
	ret
	.cfi_endproc
.LFE446:
	.size	rand__Pcg32_next, .-rand__Pcg32_next
	.section	.text.rand__Pcg32_bounded_next,"ax",@progbits
	.p2align 4,,15
	.globl	rand__Pcg32_bounded_next
	.type	rand__Pcg32_bounded_next, @function
rand__Pcg32_bounded_next:
.LFB447:
	.cfi_startproc
	movl	%esi, %eax
	xorl	%edx, %edx
	movq	(%rdi), %rcx
	negl	%eax
	movq	8(%rdi), %r10
	movabsq	$6364136223846793005, %r9
	divl	%esi
	.p2align 4,,10
	.p2align 3
.L3986:
	movq	%rcx, %rax
	movq	%rcx, %r8
	shrq	$18, %rax
	xorq	%rcx, %rax
	shrq	$59, %rcx
	shrq	$27, %rax
	rorl	%cl, %eax
	imulq	%r9, %r8
	cmpl	%eax, %edx
	leaq	(%r8,%r10), %rcx
	ja	.L3986
	xorl	%edx, %edx
	movq	%rcx, (%rdi)
	divl	%esi
	movl	%edx, %eax
	ret
	.cfi_endproc
.LFE447:
	.size	rand__Pcg32_bounded_next, .-rand__Pcg32_bounded_next
	.section	.text.rand__seed,"ax",@progbits
	.p2align 4,,15
	.globl	rand__seed
	.type	rand__seed, @function
rand__seed:
.LFB448:
	.cfi_startproc
	jmp	srand@PLT
	.cfi_endproc
.LFE448:
	.size	rand__seed, .-rand__seed
	.section	.text.rand__next,"ax",@progbits
	.p2align 4,,15
	.globl	rand__next
	.type	rand__next, @function
rand__next:
.LFB449:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	%edi, %ebx
	call	rand@PLT
	cltd
	idivl	%ebx
	popq	%rbx
	.cfi_def_cfa_offset 8
	movl	%edx, %eax
	ret
	.cfi_endproc
.LFE449:
	.size	rand__next, .-rand__next
	.section	.text.rand__rand_r,"ax",@progbits
	.p2align 4,,15
	.globl	rand__rand_r
	.type	rand__rand_r, @function
rand__rand_r:
.LFB450:
	.cfi_startproc
	imull	$1103515245, (%rdi), %eax
	addl	$12345, %eax
	movl	%eax, (%rdi)
	andl	$2147483647, %eax
	ret
	.cfi_endproc
.LFE450:
	.size	rand__rand_r, .-rand__rand_r
	.section	.text.rand__new_splitmix64,"ax",@progbits
	.p2align 4,,15
	.globl	rand__new_splitmix64
	.type	rand__new_splitmix64, @function
rand__new_splitmix64:
.LFB451:
	.cfi_startproc
	movq	%rdi, %rax
	ret
	.cfi_endproc
.LFE451:
	.size	rand__new_splitmix64, .-rand__new_splitmix64
	.section	.text.rand__Splitmix64_next,"ax",@progbits
	.p2align 4,,15
	.globl	rand__Splitmix64_next
	.type	rand__Splitmix64_next, @function
rand__Splitmix64_next:
.LFB452:
	.cfi_startproc
	movabsq	$-7046029254386353131, %rdx
	addq	(%rdi), %rdx
	movq	%rdx, %rax
	movq	%rdx, (%rdi)
	shrq	$30, %rax
	xorq	%rdx, %rax
	movabsq	$-4658895280553007687, %rdx
	imulq	%rax, %rdx
	movq	%rdx, %rax
	shrq	$27, %rax
	xorq	%rdx, %rax
	movabsq	$-7723592293110705685, %rdx
	imulq	%rdx, %rax
	movq	%rax, %rdx
	shrq	$31, %rdx
	xorq	%rdx, %rax
	ret
	.cfi_endproc
.LFE452:
	.size	rand__Splitmix64_next, .-rand__Splitmix64_next
	.section	.text.rand__Splitmix64_bounded_next,"ax",@progbits
	.p2align 4,,15
	.globl	rand__Splitmix64_bounded_next
	.type	rand__Splitmix64_bounded_next, @function
rand__Splitmix64_bounded_next:
.LFB453:
	.cfi_startproc
	movq	%rsi, %rax
	xorl	%edx, %edx
	movq	(%rdi), %r8
	negq	%rax
	movabsq	$-7046029254386353131, %r9
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	divq	%rsi
	addq	%r9, %r8
	movabsq	$-4658895280553007687, %rbx
	movabsq	$-7723592293110705685, %r10
	movq	%rdx, %r11
	jmp	.L3995
	.p2align 4,,10
	.p2align 3
.L3996:
	movq	%rdx, %r8
.L3995:
	movq	%r8, %rax
	shrq	$30, %rax
	xorq	%r8, %rax
	imulq	%rbx, %rax
	movq	%rax, %rcx
	shrq	$27, %rax
	xorq	%rcx, %rax
	imulq	%r10, %rax
	movq	%rax, %rdx
	shrq	$31, %rdx
	xorq	%rdx, %rax
	leaq	(%r8,%r9), %rdx
	cmpq	%rax, %r11
	ja	.L3996
	xorl	%edx, %edx
	movq	%r8, (%rdi)
	divq	%rsi
	popq	%rbx
	.cfi_def_cfa_offset 8
	movq	%rdx, %rax
	ret
	.cfi_endproc
.LFE453:
	.size	rand__Splitmix64_bounded_next, .-rand__Splitmix64_bounded_next
	.section	.rodata.str1.1
.LC118:
	.string	"%02d:%02d"
	.section	.text.time__Time_hhmm,"ax",@progbits
	.p2align 4,,15
	.globl	time__Time_hhmm
	.type	time__Time_hhmm, @function
time__Time_hhmm:
.LFB456:
	.cfi_startproc
	movl	24(%rsp), %edx
	movl	20(%rsp), %esi
	leaq	.LC118(%rip), %rdi
	xorl	%eax, %eax
	jmp	_STR
	.cfi_endproc
.LFE456:
	.size	time__Time_hhmm, .-time__Time_hhmm
	.section	.rodata.str1.1
.LC119:
	.string	"%02d:%02d:%02d"
	.section	.text.time__Time_hhmmss,"ax",@progbits
	.p2align 4,,15
	.globl	time__Time_hhmmss
	.type	time__Time_hhmmss, @function
time__Time_hhmmss:
.LFB457:
	.cfi_startproc
	movl	28(%rsp), %ecx
	movl	24(%rsp), %edx
	leaq	.LC119(%rip), %rdi
	movl	20(%rsp), %esi
	xorl	%eax, %eax
	jmp	_STR
	.cfi_endproc
.LFE457:
	.size	time__Time_hhmmss, .-time__Time_hhmmss
	.section	.rodata.str1.1
.LC120:
	.string	"p.m."
.LC121:
	.string	"a.m."
.LC122:
	.string	"%d:%02d %.*s"
	.section	.text.time__Time_hhmm12,"ax",@progbits
	.p2align 4,,15
	.globl	time__Time_hhmm12
	.type	time__Time_hhmm12, @function
time__Time_hhmm12:
.LFB458:
	.cfi_startproc
	movl	20(%rsp), %esi
	movl	24(%rsp), %edx
	cmpl	$11, %esi
	jle	.L4001
	cmpl	$12, %esi
	je	.L4003
	leaq	.LC120(%rip), %r8
	subl	$12, %esi
.L4002:
	leaq	.LC122(%rip), %rdi
	movl	$4, %ecx
	xorl	%eax, %eax
	jmp	_STR
	.p2align 4,,10
	.p2align 3
.L4001:
	testl	%esi, %esi
	leaq	.LC121(%rip), %r8
	jne	.L4002
	movl	$12, %esi
	jmp	.L4002
.L4003:
	leaq	.LC120(%rip), %r8
	jmp	.L4002
	.cfi_endproc
.LFE458:
	.size	time__Time_hhmm12, .-time__Time_hhmm12
	.section	.rodata.str1.1
.LC123:
	.string	"%d:%02d:%02d %.*s"
.LC124:
	.string	"unknown enumeration %.*s"
	.section	.text.time__Time_get_fmt_time_str,"ax",@progbits
	.p2align 4,,15
	.globl	time__Time_get_fmt_time_str
	.type	time__Time_get_fmt_time_str, @function
time__Time_get_fmt_time_str:
.LFB464:
	.cfi_startproc
	cmpl	$4, %edi
	je	.L4016
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	28(%rsp), %eax
	cmpl	$11, %eax
	jg	.L4020
	testl	%eax, %eax
	movl	$12, %esi
	leaq	.LC121(%rip), %r8
	cmovne	%eax, %esi
.L4009:
	testl	%edi, %edi
	movl	32(%rsp), %edx
	je	.L4021
.L4010:
	cmpl	$1, %edi
	je	.L4022
	cmpl	$2, %edi
	movl	36(%rsp), %ecx
	je	.L4023
	cmpl	$3, %edi
	je	.L4024
	movl	%edi, %ecx
	call	time__FormatTime_str
	movl	%ecx, %edi
	movq	%rax, %r8
	call	time__FormatTime_str
	leaq	.LC124(%rip), %rdi
	movq	%rdx, %rsi
	xorl	%eax, %eax
	movq	%r8, %rdx
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	jmp	_STR
	.p2align 4,,10
	.p2align 3
.L4020:
	.cfi_restore_state
	cmpl	$12, %eax
	je	.L4014
	testl	%edi, %edi
	leal	-12(%rax), %esi
	leaq	.LC120(%rip), %r8
	movl	32(%rsp), %edx
	jne	.L4010
.L4021:
	leaq	.LC122(%rip), %rdi
	movl	$4, %ecx
	xorl	%eax, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	jmp	_STR
	.p2align 4,,10
	.p2align 3
.L4016:
	leaq	.LC37(%rip), %rax
	xorl	%edx, %edx
	ret
	.p2align 4,,10
	.p2align 3
.L4024:
	.cfi_def_cfa_offset 16
	leaq	.LC119(%rip), %rdi
	movl	%eax, %esi
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	xorl	%eax, %eax
	jmp	_STR
	.p2align 4,,10
	.p2align 3
.L4022:
	.cfi_restore_state
	leaq	.LC118(%rip), %rdi
	movl	%eax, %esi
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	xorl	%eax, %eax
	jmp	_STR
	.p2align 4,,10
	.p2align 3
.L4023:
	.cfi_restore_state
	leaq	.LC123(%rip), %rdi
	movq	%r8, %r9
	xorl	%eax, %eax
	movl	$4, %r8d
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	jmp	_STR
.L4014:
	.cfi_restore_state
	movl	$12, %esi
	leaq	.LC120(%rip), %r8
	jmp	.L4009
	.cfi_endproc
.LFE464:
	.size	time__Time_get_fmt_time_str, .-time__Time_get_fmt_time_str
	.section	.rodata.str1.1
.LC125:
	.string	"%02d|%02d|%.*s"
.LC126:
	.string	"%02d|%02d|%d"
.LC127:
	.string	"%.*s|%d"
.LC128:
	.string	"%.*s|%02d"
.LC129:
	.string	"%.*s|%02d|%d"
.LC130:
	.string	"%d|%02d|%02d"
.LC131:
	.string	"."
.LC132:
	.string	"-"
.LC133:
	.string	"/"
.LC134:
	.string	"|"
	.section	.text.time__Time_get_fmt_date_str,"ax",@progbits
	.p2align 4,,15
	.globl	time__Time_get_fmt_date_str
	.type	time__Time_get_fmt_date_str, @function
time__Time_get_fmt_date_str:
.LFB465:
	.cfi_startproc
	cmpl	$7, %esi
	je	.L4044
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%edi, %ebp
	movl	%esi, %ebx
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	movq	_const_time__months_string(%rip), %rdi
	movq	8+_const_time__months_string(%rip), %rsi
	movl	84(%rsp), %r12d
	movl	88(%rsp), %eax
	movl	80(%rsp), %r13d
	leal	(%r12,%r12,2), %r15d
	movl	%eax, 12(%rsp)
	leal	-3(%r15), %r14d
	movl	%r15d, %ecx
	movl	%r14d, %edx
	call	string_substr
	movq	_const_time__months_string(%rip), %rdi
	movq	8+_const_time__months_string(%rip), %rsi
	movl	%r15d, %ecx
	movl	%r14d, %edx
	movq	%rax, (%rsp)
	call	string_substr
	movq	%rdx, %rsi
	movq	(%rsp), %rdx
	leaq	.LC25(%rip), %rdi
	xorl	%eax, %eax
	call	_STR
	testl	%r13d, %r13d
	movq	%rax, %r14
	movq	%rdx, %r15
	jne	.L4050
	leaq	.LC80(%rip), %rdi
	movl	$1, %ecx
	movl	$1, %esi
	movl	$2, %edx
	call	string_substr
	testl	%ebx, %ebx
	je	.L4051
.L4029:
	cmpl	$1, %ebx
	je	.L4052
	cmpl	$2, %ebx
	je	.L4053
	cmpl	$3, %ebx
	je	.L4054
	cmpl	$4, %ebx
	je	.L4055
	cmpl	$5, %ebx
	je	.L4056
	cmpl	$6, %ebx
	je	.L4057
	cmpl	$8, %ebx
	je	.L4058
	movl	%ebx, %edi
	call	time__FormatDate_str
	movl	%ebx, %edi
	movq	%rax, %rcx
	call	time__FormatDate_str
	leaq	.LC124(%rip), %rdi
	movq	%rdx, %rsi
	xorl	%eax, %eax
	movq	%rcx, %rdx
	call	_STR
	movq	%rax, %r12
	movq	%rdx, %rbx
	.p2align 4,,10
	.p2align 3
.L4030:
	testl	%ebp, %ebp
	leaq	.LC131(%rip), %r8
	movl	$1, %r9d
	je	.L4039
	cmpl	$1, %ebp
	leaq	.LC132(%rip), %r8
	movl	$1, %r9d
	je	.L4039
	cmpl	$2, %ebp
	leaq	.LC133(%rip), %r8
	movl	$1, %r9d
	je	.L4039
	cmpl	$3, %ebp
	leaq	.LC88(%rip), %r8
	movl	$1, %r9d
	je	.L4039
	movl	%ebp, %edi
	call	time__FormatDelimiter_str
	movq	%rax, %r8
	call	time__FormatDelimiter_str
	leaq	.LC124(%rip), %rdi
	movq	%rdx, %rsi
	xorl	%eax, %eax
	movq	%r8, %rdx
	call	_STR
	movq	%rax, %r8
	movq	%rdx, %r9
.L4039:
	addq	$24, %rsp
	.cfi_def_cfa_offset 56
	movq	%rbx, %rsi
	movq	%r12, %rdi
	popq	%rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_restore 12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_restore 13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_restore 14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_restore 15
	.cfi_def_cfa_offset 8
	leaq	.LC134(%rip), %rdx
	movl	$1, %ecx
	jmp	string_replace
	.p2align 4,,10
	.p2align 3
.L4044:
	leaq	.LC37(%rip), %rax
	xorl	%edx, %edx
	ret
	.p2align 4,,10
	.p2align 3
.L4050:
	.cfi_def_cfa_offset 80
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	movl	$12, %esi
	movl	%r13d, %edi
	call	int_str_l.part.15
	movl	$12, %esi
	movl	%r13d, %edi
	movl	%edx, (%rsp)
	call	int_str_l.part.15
	movl	(%rsp), %ecx
	movl	%edx, %esi
	movq	%rax, %rdi
	movl	$2, %edx
	call	string_substr
	testl	%ebx, %ebx
	jne	.L4029
.L4051:
	movl	12(%rsp), %esi
	movl	%edx, %ecx
	movq	%rax, %r8
	movl	%r12d, %edx
.L4048:
	leaq	.LC125(%rip), %rdi
	xorl	%eax, %eax
	call	_STR
	movq	%rax, %r12
	movq	%rdx, %rbx
	jmp	.L4030
	.p2align 4,,10
	.p2align 3
.L4052:
	movl	12(%rsp), %esi
	movl	%r13d, %ecx
	movl	%r12d, %edx
.L4049:
	leaq	.LC126(%rip), %rdi
	xorl	%eax, %eax
	call	_STR
	movq	%rax, %r12
	movq	%rdx, %rbx
	jmp	.L4030
	.p2align 4,,10
	.p2align 3
.L4053:
	movl	%edx, %ecx
	movq	%rax, %r8
	movl	12(%rsp), %edx
	movl	%r12d, %esi
	jmp	.L4048
	.p2align 4,,10
	.p2align 3
.L4054:
	movl	%r13d, %ecx
	movl	12(%rsp), %edx
	movl	%r12d, %esi
	jmp	.L4049
	.p2align 4,,10
	.p2align 3
.L4055:
	movl	12(%rsp), %ecx
	leaq	.LC127(%rip), %rdi
	movq	%r14, %rdx
	movl	%r15d, %esi
	xorl	%eax, %eax
	call	_STR
	movq	%rax, %r12
	movq	%rdx, %rbx
	jmp	.L4030
	.p2align 4,,10
	.p2align 3
.L4058:
	movl	12(%rsp), %ecx
	leaq	.LC130(%rip), %rdi
	movl	%r12d, %edx
	movl	%r13d, %esi
	xorl	%eax, %eax
	call	_STR
	movq	%rax, %r12
	movq	%rdx, %rbx
	jmp	.L4030
	.p2align 4,,10
	.p2align 3
.L4056:
	movl	12(%rsp), %ecx
	leaq	.LC128(%rip), %rdi
	movq	%r14, %rdx
	movl	%r15d, %esi
	xorl	%eax, %eax
	call	_STR
	movq	%rax, %r12
	movq	%rdx, %rbx
	jmp	.L4030
	.p2align 4,,10
	.p2align 3
.L4057:
	movl	12(%rsp), %ecx
	leaq	.LC129(%rip), %rdi
	movl	%r13d, %r8d
	movq	%r14, %rdx
	movl	%r15d, %esi
	xorl	%eax, %eax
	call	_STR
	movq	%rax, %r12
	movq	%rdx, %rbx
	jmp	.L4030
	.cfi_endproc
.LFE465:
	.size	time__Time_get_fmt_date_str, .-time__Time_get_fmt_date_str
	.section	.text.time__Time_ymmdd,"ax",@progbits
	.p2align 4,,15
	.globl	time__Time_ymmdd
	.type	time__Time_ymmdd, @function
time__Time_ymmdd:
.LFB459:
	.cfi_startproc
	movl	$8, %esi
	movl	$1, %edi
	jmp	time__Time_get_fmt_date_str
	.cfi_endproc
.LFE459:
	.size	time__Time_ymmdd, .-time__Time_ymmdd
	.section	.text.time__Time_ddmmy,"ax",@progbits
	.p2align 4,,15
	.globl	time__Time_ddmmy
	.type	time__Time_ddmmy, @function
time__Time_ddmmy:
.LFB460:
	.cfi_startproc
	movl	$1, %esi
	xorl	%edi, %edi
	jmp	time__Time_get_fmt_date_str
	.cfi_endproc
.LFE460:
	.size	time__Time_ddmmy, .-time__Time_ddmmy
	.section	.text.time__Time_md,"ax",@progbits
	.p2align 4,,15
	.globl	time__Time_md
	.type	time__Time_md, @function
time__Time_md:
.LFB461:
	.cfi_startproc
	movl	$4, %esi
	movl	$3, %edi
	jmp	time__Time_get_fmt_date_str
	.cfi_endproc
.LFE461:
	.size	time__Time_md, .-time__Time_md
	.section	.text.time__Time_format_ss,"ax",@progbits
	.p2align 4,,15
	.globl	time__Time_format_ss
	.type	time__Time_format_ss, @function
time__Time_format_ss:
.LFB455:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	leaq	.LC119(%rip), %rdi
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	xorl	%eax, %eax
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	movdqu	96(%rsp), %xmm0
	movaps	%xmm0, (%rsp)
	movl	12(%rsp), %esi
	movdqu	112(%rsp), %xmm0
	movaps	%xmm0, 16(%rsp)
	movl	20(%rsp), %ecx
	movl	16(%rsp), %edx
	call	_STR
	pushq	24(%rsp)
	.cfi_def_cfa_offset 104
	pushq	24(%rsp)
	.cfi_def_cfa_offset 112
	movl	$8, %esi
	pushq	24(%rsp)
	.cfi_def_cfa_offset 120
	pushq	24(%rsp)
	.cfi_def_cfa_offset 128
	movl	$1, %edi
	movq	%rax, %r13
	movq	%rdx, %r14
	call	time__Time_get_fmt_date_str
	leal	2(%rdx), %edi
	movq	%rdx, %rbx
	addq	$32, %rsp
	.cfi_def_cfa_offset 96
	movq	%rax, %r12
	movl	%edx, %r15d
	leal	1(%rdx), %ebp
	call	v_malloc
	testl	%ebx, %ebx
	movq	%rax, %rdi
	jle	.L4063
	leaq	16(%r12), %rax
	cmpq	%rax, %rdi
	leaq	16(%rdi), %rax
	setnb	%dl
	cmpq	%rax, %r12
	setnb	%al
	orb	%al, %dl
	je	.L4064
	cmpl	$22, %ebx
	jbe	.L4064
	movq	%r12, %rdx
	leal	-1(%rbx), %ecx
	negq	%rdx
	andl	$15, %edx
	leal	15(%rdx), %eax
	cmpl	%eax, %ecx
	jb	.L4073
	testl	%edx, %edx
	je	.L4074
	movzbl	(%r12), %eax
	cmpl	$1, %edx
	movb	%al, (%rdi)
	je	.L4075
	movzbl	1(%r12), %eax
	cmpl	$2, %edx
	movb	%al, 1(%rdi)
	je	.L4076
	movzbl	2(%r12), %eax
	cmpl	$3, %edx
	movb	%al, 2(%rdi)
	je	.L4077
	movzbl	3(%r12), %eax
	cmpl	$4, %edx
	movb	%al, 3(%rdi)
	je	.L4078
	movzbl	4(%r12), %eax
	cmpl	$5, %edx
	movb	%al, 4(%rdi)
	je	.L4079
	movzbl	5(%r12), %eax
	cmpl	$6, %edx
	movb	%al, 5(%rdi)
	je	.L4080
	movzbl	6(%r12), %eax
	cmpl	$7, %edx
	movb	%al, 6(%rdi)
	je	.L4081
	movzbl	7(%r12), %eax
	cmpl	$8, %edx
	movb	%al, 7(%rdi)
	je	.L4082
	movzbl	8(%r12), %eax
	cmpl	$9, %edx
	movb	%al, 8(%rdi)
	je	.L4083
	movzbl	9(%r12), %eax
	cmpl	$10, %edx
	movb	%al, 9(%rdi)
	je	.L4084
	movzbl	10(%r12), %eax
	cmpl	$11, %edx
	movb	%al, 10(%rdi)
	je	.L4085
	movzbl	11(%r12), %eax
	cmpl	$12, %edx
	movb	%al, 11(%rdi)
	je	.L4086
	movzbl	12(%r12), %eax
	cmpl	$13, %edx
	movb	%al, 12(%rdi)
	je	.L4087
	movzbl	13(%r12), %eax
	cmpl	$15, %edx
	movb	%al, 13(%rdi)
	jne	.L4088
	movzbl	14(%r12), %eax
	movb	%al, 14(%rdi)
	movl	$15, %eax
	.p2align 4,,10
	.p2align 3
.L4066:
	movl	%ebx, %r9d
	movl	%edx, %esi
	xorl	%ecx, %ecx
	subl	%edx, %r9d
	leaq	(%r12,%rsi), %r8
	xorl	%edx, %edx
	movl	%r9d, %r10d
	addq	%rdi, %rsi
	shrl	$4, %r10d
	.p2align 4,,10
	.p2align 3
.L4068:
	movdqa	(%r8,%rdx), %xmm0
	addl	$1, %ecx
	movups	%xmm0, (%rsi,%rdx)
	addq	$16, %rdx
	cmpl	%ecx, %r10d
	ja	.L4068
	movl	%r9d, %edx
	andl	$-16, %edx
	addl	%edx, %eax
	cmpl	%edx, %r9d
	je	.L4063
.L4065:
	cltq
	.p2align 4,,10
	.p2align 3
.L4070:
	movzbl	(%r12,%rax), %edx
	movb	%dl, (%rdi,%rax)
	addq	$1, %rax
	cmpl	%eax, %r15d
	jg	.L4070
.L4063:
	movslq	%ebx, %rbx
	movslq	%ebp, %rax
	movl	%ebp, %esi
	movb	$32, (%rdi,%rbx)
	movb	$0, (%rdi,%rax)
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	movq	%r13, %rdx
	movq	%r14, %rcx
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	string_add
	.p2align 4,,10
	.p2align 3
.L4075:
	.cfi_restore_state
	movl	$1, %eax
	jmp	.L4066
	.p2align 4,,10
	.p2align 3
.L4064:
	leal	-1(%rbx), %ecx
	xorl	%eax, %eax
	addq	$1, %rcx
	.p2align 4,,10
	.p2align 3
.L4071:
	movzbl	(%r12,%rax), %edx
	movb	%dl, (%rdi,%rax)
	addq	$1, %rax
	cmpq	%rcx, %rax
	jne	.L4071
	jmp	.L4063
	.p2align 4,,10
	.p2align 3
.L4076:
	movl	$2, %eax
	jmp	.L4066
	.p2align 4,,10
	.p2align 3
.L4073:
	xorl	%eax, %eax
	jmp	.L4065
	.p2align 4,,10
	.p2align 3
.L4077:
	movl	$3, %eax
	jmp	.L4066
.L4078:
	movl	$4, %eax
	jmp	.L4066
.L4081:
	movl	$7, %eax
	jmp	.L4066
.L4079:
	movl	$5, %eax
	jmp	.L4066
.L4080:
	movl	$6, %eax
	jmp	.L4066
.L4074:
	xorl	%eax, %eax
	jmp	.L4066
.L4082:
	movl	$8, %eax
	jmp	.L4066
.L4083:
	movl	$9, %eax
	jmp	.L4066
.L4084:
	movl	$10, %eax
	jmp	.L4066
.L4085:
	movl	$11, %eax
	jmp	.L4066
.L4086:
	movl	$12, %eax
	jmp	.L4066
.L4087:
	movl	$13, %eax
	jmp	.L4066
.L4088:
	movl	$14, %eax
	jmp	.L4066
	.cfi_endproc
.LFE455:
	.size	time__Time_format_ss, .-time__Time_format_ss
	.section	.text.time__Time_format,"ax",@progbits
	.p2align 4,,15
	.globl	time__Time_format
	.type	time__Time_format, @function
time__Time_format:
.LFB454:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	leaq	.LC118(%rip), %rdi
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	xorl	%eax, %eax
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	movdqu	96(%rsp), %xmm0
	movaps	%xmm0, (%rsp)
	movl	12(%rsp), %esi
	movdqu	112(%rsp), %xmm0
	movd	%xmm0, %edx
	movaps	%xmm0, 16(%rsp)
	call	_STR
	movl	$8, %esi
	movl	$1, %edi
	movq	%rax, %r13
	movq	%rdx, %r14
	pushq	24(%rsp)
	.cfi_def_cfa_offset 104
	pushq	24(%rsp)
	.cfi_def_cfa_offset 112
	pushq	24(%rsp)
	.cfi_def_cfa_offset 120
	pushq	24(%rsp)
	.cfi_def_cfa_offset 128
	call	time__Time_get_fmt_date_str
	leal	2(%rdx), %edi
	movq	%rdx, %rbx
	addq	$32, %rsp
	.cfi_def_cfa_offset 96
	movq	%rax, %r12
	movl	%edx, %r15d
	leal	1(%rdx), %ebp
	call	v_malloc
	testl	%ebx, %ebx
	movq	%rax, %rdi
	jle	.L4100
	leaq	16(%r12), %rax
	cmpq	%rax, %rdi
	leaq	16(%rdi), %rax
	setnb	%dl
	cmpq	%rax, %r12
	setnb	%al
	orb	%al, %dl
	je	.L4101
	cmpl	$22, %ebx
	jbe	.L4101
	movq	%r12, %rdx
	leal	-1(%rbx), %ecx
	negq	%rdx
	andl	$15, %edx
	leal	15(%rdx), %eax
	cmpl	%eax, %ecx
	jb	.L4110
	testl	%edx, %edx
	je	.L4111
	movzbl	(%r12), %eax
	cmpl	$1, %edx
	movb	%al, (%rdi)
	je	.L4112
	movzbl	1(%r12), %eax
	cmpl	$2, %edx
	movb	%al, 1(%rdi)
	je	.L4113
	movzbl	2(%r12), %eax
	cmpl	$3, %edx
	movb	%al, 2(%rdi)
	je	.L4114
	movzbl	3(%r12), %eax
	cmpl	$4, %edx
	movb	%al, 3(%rdi)
	je	.L4115
	movzbl	4(%r12), %eax
	cmpl	$5, %edx
	movb	%al, 4(%rdi)
	je	.L4116
	movzbl	5(%r12), %eax
	cmpl	$6, %edx
	movb	%al, 5(%rdi)
	je	.L4117
	movzbl	6(%r12), %eax
	cmpl	$7, %edx
	movb	%al, 6(%rdi)
	je	.L4118
	movzbl	7(%r12), %eax
	cmpl	$8, %edx
	movb	%al, 7(%rdi)
	je	.L4119
	movzbl	8(%r12), %eax
	cmpl	$9, %edx
	movb	%al, 8(%rdi)
	je	.L4120
	movzbl	9(%r12), %eax
	cmpl	$10, %edx
	movb	%al, 9(%rdi)
	je	.L4121
	movzbl	10(%r12), %eax
	cmpl	$11, %edx
	movb	%al, 10(%rdi)
	je	.L4122
	movzbl	11(%r12), %eax
	cmpl	$12, %edx
	movb	%al, 11(%rdi)
	je	.L4123
	movzbl	12(%r12), %eax
	cmpl	$13, %edx
	movb	%al, 12(%rdi)
	je	.L4124
	movzbl	13(%r12), %eax
	cmpl	$15, %edx
	movb	%al, 13(%rdi)
	jne	.L4125
	movzbl	14(%r12), %eax
	movb	%al, 14(%rdi)
	movl	$15, %eax
	.p2align 4,,10
	.p2align 3
.L4103:
	movl	%ebx, %r9d
	movl	%edx, %esi
	xorl	%ecx, %ecx
	subl	%edx, %r9d
	leaq	(%r12,%rsi), %r8
	xorl	%edx, %edx
	movl	%r9d, %r10d
	addq	%rdi, %rsi
	shrl	$4, %r10d
	.p2align 4,,10
	.p2align 3
.L4105:
	movdqa	(%r8,%rdx), %xmm0
	addl	$1, %ecx
	movups	%xmm0, (%rsi,%rdx)
	addq	$16, %rdx
	cmpl	%ecx, %r10d
	ja	.L4105
	movl	%r9d, %edx
	andl	$-16, %edx
	addl	%edx, %eax
	cmpl	%edx, %r9d
	je	.L4100
.L4102:
	cltq
	.p2align 4,,10
	.p2align 3
.L4107:
	movzbl	(%r12,%rax), %edx
	movb	%dl, (%rdi,%rax)
	addq	$1, %rax
	cmpl	%eax, %r15d
	jg	.L4107
.L4100:
	movslq	%ebx, %rbx
	movslq	%ebp, %rax
	movl	%ebp, %esi
	movb	$32, (%rdi,%rbx)
	movb	$0, (%rdi,%rax)
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	movq	%r13, %rdx
	movq	%r14, %rcx
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	string_add
	.p2align 4,,10
	.p2align 3
.L4112:
	.cfi_restore_state
	movl	$1, %eax
	jmp	.L4103
	.p2align 4,,10
	.p2align 3
.L4101:
	leal	-1(%rbx), %ecx
	xorl	%eax, %eax
	addq	$1, %rcx
	.p2align 4,,10
	.p2align 3
.L4108:
	movzbl	(%r12,%rax), %edx
	movb	%dl, (%rdi,%rax)
	addq	$1, %rax
	cmpq	%rcx, %rax
	jne	.L4108
	jmp	.L4100
	.p2align 4,,10
	.p2align 3
.L4113:
	movl	$2, %eax
	jmp	.L4103
	.p2align 4,,10
	.p2align 3
.L4110:
	xorl	%eax, %eax
	jmp	.L4102
	.p2align 4,,10
	.p2align 3
.L4114:
	movl	$3, %eax
	jmp	.L4103
.L4115:
	movl	$4, %eax
	jmp	.L4103
.L4118:
	movl	$7, %eax
	jmp	.L4103
.L4116:
	movl	$5, %eax
	jmp	.L4103
.L4117:
	movl	$6, %eax
	jmp	.L4103
.L4111:
	xorl	%eax, %eax
	jmp	.L4103
.L4119:
	movl	$8, %eax
	jmp	.L4103
.L4120:
	movl	$9, %eax
	jmp	.L4103
.L4121:
	movl	$10, %eax
	jmp	.L4103
.L4122:
	movl	$11, %eax
	jmp	.L4103
.L4123:
	movl	$12, %eax
	jmp	.L4103
.L4124:
	movl	$13, %eax
	jmp	.L4103
.L4125:
	movl	$14, %eax
	jmp	.L4103
	.cfi_endproc
.LFE454:
	.size	time__Time_format, .-time__Time_format
	.section	.text.time__Time_clean12,"ax",@progbits
	.p2align 4,,15
	.globl	time__Time_clean12
	.type	time__Time_clean12, @function
time__Time_clean12:
.LFB463:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	xorl	%edi, %edi
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$184, %rsp
	.cfi_def_cfa_offset 240
	movq	%fs:40, %rax
	movq	%rax, 168(%rsp)
	xorl	%eax, %eax
	movl	240(%rsp), %ebp
	movl	248(%rsp), %r12d
	call	time@PLT
	leaq	80(%rsp), %rdi
	movq	%rax, 80(%rsp)
	call	localtime@PLT
	movl	20(%rax), %ebx
	movl	16(%rax), %r13d
	leaq	112(%rsp), %rdi
	movl	32(%rax), %esi
	movq	40(%rax), %rcx
	movq	48(%rax), %rdx
	movl	12(%rax), %r14d
	movdqu	(%rax), %xmm1
	addl	$1900, %ebx
	addl	$1, %r13d
	movdqu	16(%rax), %xmm0
	movl	%esi, 144(%rsp)
	movq	%rcx, 152(%rsp)
	movaps	%xmm1, 112(%rsp)
	movq	%rdx, 160(%rsp)
	movaps	%xmm0, 128(%rsp)
	call	timegm@PLT
	movl	%ebx, 16(%rsp)
	movl	%r13d, 20(%rsp)
	movq	240(%rsp), %rax
	cmpq	%rax, 16(%rsp)
	jne	.L4137
	cmpl	%r12d, %r14d
	je	.L4222
.L4137:
	cmpl	%ebp, %ebx
	je	.L4223
	movl	252(%rsp), %r15d
	movl	256(%rsp), %ebx
	leaq	.LC118(%rip), %rdi
	movl	244(%rsp), %r9d
	movl	260(%rsp), %r8d
	xorl	%eax, %eax
	movq	264(%rsp), %rcx
	movl	%r15d, %esi
	movl	%ebx, %edx
	movl	%r9d, 12(%rsp)
	movl	%r8d, 8(%rsp)
	movq	%rcx, (%rsp)
	call	_STR
	movl	12(%rsp), %r9d
	movl	8(%rsp), %r8d
	movl	$8, %esi
	movq	(%rsp), %rcx
	movl	%ebp, 80(%rsp)
	movl	$1, %edi
	movl	%r12d, 88(%rsp)
	movl	%r15d, 92(%rsp)
	movq	%rax, %r13
	movl	%r9d, 84(%rsp)
	movl	%ebx, 96(%rsp)
	movq	%rdx, %r14
	movl	%r8d, 100(%rsp)
	movq	%rcx, 104(%rsp)
	pushq	104(%rsp)
	.cfi_def_cfa_offset 248
	pushq	104(%rsp)
	.cfi_def_cfa_offset 256
	pushq	104(%rsp)
	.cfi_def_cfa_offset 264
	pushq	104(%rsp)
	.cfi_def_cfa_offset 272
	call	time__Time_get_fmt_date_str
	leal	2(%rdx), %edi
	movq	%rdx, %rbx
	addq	$32, %rsp
	.cfi_def_cfa_offset 240
	movq	%rax, %r12
	movl	%edx, %r15d
	leal	1(%rdx), %ebp
	call	v_malloc
	testl	%ebx, %ebx
	movq	%rax, %rdi
	jle	.L4152
	leaq	16(%rax), %rax
	cmpq	%rax, %r12
	leaq	16(%r12), %rax
	setnb	%dl
	cmpq	%rax, %rdi
	setnb	%al
	orb	%al, %dl
	je	.L4153
	cmpl	$22, %ebx
	jbe	.L4153
	movq	%r12, %rdx
	leal	-1(%rbx), %ecx
	negq	%rdx
	andl	$15, %edx
	leal	15(%rdx), %eax
	cmpl	%eax, %ecx
	jb	.L4181
	testl	%edx, %edx
	je	.L4182
	movzbl	(%r12), %eax
	cmpl	$1, %edx
	movb	%al, (%rdi)
	je	.L4183
	movzbl	1(%r12), %eax
	cmpl	$2, %edx
	movb	%al, 1(%rdi)
	je	.L4184
	movzbl	2(%r12), %eax
	cmpl	$3, %edx
	movb	%al, 2(%rdi)
	je	.L4185
	movzbl	3(%r12), %eax
	cmpl	$4, %edx
	movb	%al, 3(%rdi)
	je	.L4186
	movzbl	4(%r12), %eax
	cmpl	$5, %edx
	movb	%al, 4(%rdi)
	je	.L4187
	movzbl	5(%r12), %eax
	cmpl	$6, %edx
	movb	%al, 5(%rdi)
	je	.L4188
	movzbl	6(%r12), %eax
	cmpl	$7, %edx
	movb	%al, 6(%rdi)
	je	.L4189
	movzbl	7(%r12), %eax
	cmpl	$8, %edx
	movb	%al, 7(%rdi)
	je	.L4190
	movzbl	8(%r12), %eax
	cmpl	$9, %edx
	movb	%al, 8(%rdi)
	je	.L4191
	movzbl	9(%r12), %eax
	cmpl	$10, %edx
	movb	%al, 9(%rdi)
	je	.L4192
	movzbl	10(%r12), %eax
	cmpl	$11, %edx
	movb	%al, 10(%rdi)
	je	.L4193
	movzbl	11(%r12), %eax
	cmpl	$12, %edx
	movb	%al, 11(%rdi)
	je	.L4194
	movzbl	12(%r12), %eax
	cmpl	$13, %edx
	movb	%al, 12(%rdi)
	je	.L4195
	movzbl	13(%r12), %eax
	cmpl	$15, %edx
	movb	%al, 13(%rdi)
	jne	.L4196
	movzbl	14(%r12), %eax
	movb	%al, 14(%rdi)
	movl	$15, %eax
	jmp	.L4155
	.p2align 4,,10
	.p2align 3
.L4153:
	leal	-1(%rbx), %ecx
	xorl	%eax, %eax
	addq	$1, %rcx
	.p2align 4,,10
	.p2align 3
.L4160:
	movzbl	(%r12,%rax), %edx
	movb	%dl, (%rdi,%rax)
	addq	$1, %rax
	cmpq	%rcx, %rax
	jne	.L4160
	.p2align 4,,10
	.p2align 3
.L4152:
	movslq	%ebp, %rax
	movslq	%ebx, %rbx
	movl	%ebp, %esi
	movb	$32, (%rdi,%rbx)
	movq	%r13, %rdx
	movb	$0, (%rdi,%rax)
	movq	%r14, %rcx
	call	string_add
	movl	%edx, %edx
.L4140:
	movq	168(%rsp), %rcx
	xorq	%fs:40, %rcx
	jne	.L4224
	addq	$184, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L4223:
	.cfi_restore_state
	movq	256(%rsp), %rcx
	movq	264(%rsp), %rbx
	xorl	%edi, %edi
	movq	240(%rsp), %rax
	movq	248(%rsp), %rdx
	movq	%rcx, 64(%rsp)
	movq	%rbx, 72(%rsp)
	movq	%rax, 48(%rsp)
	movq	%rdx, 56(%rsp)
	pushq	%rbx
	.cfi_def_cfa_offset 248
	pushq	%rcx
	.cfi_def_cfa_offset 256
	pushq	%rdx
	.cfi_def_cfa_offset 264
	pushq	%rax
	.cfi_def_cfa_offset 272
	call	time__Time_get_fmt_time_str
	addq	$32, %rsp
	.cfi_def_cfa_offset 240
	movl	$4, %esi
	movl	$3, %edi
	pushq	72(%rsp)
	.cfi_def_cfa_offset 248
	pushq	72(%rsp)
	.cfi_def_cfa_offset 256
	movq	%rax, %r13
	pushq	72(%rsp)
	.cfi_def_cfa_offset 264
	pushq	72(%rsp)
	.cfi_def_cfa_offset 272
	movq	%rdx, %r14
	call	time__Time_get_fmt_date_str
	leal	2(%rdx), %edi
	movq	%rdx, %rbx
	addq	$32, %rsp
	.cfi_def_cfa_offset 240
	movq	%rax, %r12
	movl	%edx, %r15d
	leal	1(%rdx), %ebp
	call	v_malloc
	testl	%ebx, %ebx
	movq	%rax, %rdi
	jle	.L4142
	leaq	16(%r12), %rax
	cmpq	%rax, %rdi
	leaq	16(%rdi), %rax
	setnb	%dl
	cmpq	%rax, %r12
	setnb	%al
	orb	%al, %dl
	je	.L4143
	cmpl	$22, %ebx
	jbe	.L4143
	movq	%r12, %rdx
	leal	-1(%rbx), %ecx
	negq	%rdx
	andl	$15, %edx
	leal	15(%rdx), %eax
	cmpl	%eax, %ecx
	jb	.L4165
	testl	%edx, %edx
	je	.L4166
	movzbl	(%r12), %eax
	cmpl	$1, %edx
	movb	%al, (%rdi)
	je	.L4167
	movzbl	1(%r12), %eax
	cmpl	$2, %edx
	movb	%al, 1(%rdi)
	je	.L4168
	movzbl	2(%r12), %eax
	cmpl	$3, %edx
	movb	%al, 2(%rdi)
	je	.L4169
	movzbl	3(%r12), %eax
	cmpl	$4, %edx
	movb	%al, 3(%rdi)
	je	.L4170
	movzbl	4(%r12), %eax
	cmpl	$5, %edx
	movb	%al, 4(%rdi)
	je	.L4171
	movzbl	5(%r12), %eax
	cmpl	$6, %edx
	movb	%al, 5(%rdi)
	je	.L4172
	movzbl	6(%r12), %eax
	cmpl	$7, %edx
	movb	%al, 6(%rdi)
	je	.L4173
	movzbl	7(%r12), %eax
	cmpl	$8, %edx
	movb	%al, 7(%rdi)
	je	.L4174
	movzbl	8(%r12), %eax
	cmpl	$9, %edx
	movb	%al, 8(%rdi)
	je	.L4175
	movzbl	9(%r12), %eax
	cmpl	$10, %edx
	movb	%al, 9(%rdi)
	je	.L4176
	movzbl	10(%r12), %eax
	cmpl	$11, %edx
	movb	%al, 10(%rdi)
	je	.L4177
	movzbl	11(%r12), %eax
	cmpl	$12, %edx
	movb	%al, 11(%rdi)
	je	.L4178
	movzbl	12(%r12), %eax
	cmpl	$13, %edx
	movb	%al, 12(%rdi)
	je	.L4179
	movzbl	13(%r12), %eax
	cmpl	$15, %edx
	movb	%al, 13(%rdi)
	jne	.L4180
	movzbl	14(%r12), %eax
	movb	%al, 14(%rdi)
	movl	$15, %eax
	.p2align 4,,10
	.p2align 3
.L4145:
	movl	%ebx, %r9d
	movl	%edx, %esi
	xorl	%ecx, %ecx
	subl	%edx, %r9d
	leaq	(%r12,%rsi), %r8
	xorl	%edx, %edx
	movl	%r9d, %r10d
	addq	%rdi, %rsi
	shrl	$4, %r10d
	.p2align 4,,10
	.p2align 3
.L4147:
	movdqa	(%r8,%rdx), %xmm0
	addl	$1, %ecx
	movups	%xmm0, (%rsi,%rdx)
	addq	$16, %rdx
	cmpl	%ecx, %r10d
	ja	.L4147
	movl	%r9d, %edx
	andl	$-16, %edx
	addl	%edx, %eax
	cmpl	%r9d, %edx
	je	.L4142
.L4144:
	cltq
	.p2align 4,,10
	.p2align 3
.L4149:
	movzbl	(%r12,%rax), %edx
	movb	%dl, (%rdi,%rax)
	addq	$1, %rax
	cmpl	%eax, %r15d
	jg	.L4149
.L4142:
	movslq	%ebx, %rbx
	movslq	%ebp, %rax
	movl	%ebp, %esi
	movb	$32, (%rdi,%rbx)
	movq	%r13, %rdx
	movb	$0, (%rdi,%rax)
	movq	%r14, %rcx
	call	string_add
	jmp	.L4140
	.p2align 4,,10
	.p2align 3
.L4222:
	movl	252(%rsp), %esi
	movl	256(%rsp), %edx
	cmpl	$11, %esi
	jle	.L4138
	cmpl	$12, %esi
	je	.L4163
	leaq	.LC120(%rip), %r8
	subl	$12, %esi
.L4139:
	leaq	.LC122(%rip), %rdi
	movl	$4, %ecx
	xorl	%eax, %eax
	call	_STR
	jmp	.L4140
	.p2align 4,,10
	.p2align 3
.L4183:
	movl	$1, %eax
	.p2align 4,,10
	.p2align 3
.L4155:
	movl	%ebx, %r9d
	movl	%edx, %esi
	xorl	%ecx, %ecx
	subl	%edx, %r9d
	leaq	(%r12,%rsi), %r8
	xorl	%edx, %edx
	movl	%r9d, %r10d
	addq	%rdi, %rsi
	shrl	$4, %r10d
	.p2align 4,,10
	.p2align 3
.L4157:
	movdqa	(%r8,%rdx), %xmm0
	addl	$1, %ecx
	movups	%xmm0, (%rsi,%rdx)
	addq	$16, %rdx
	cmpl	%ecx, %r10d
	ja	.L4157
	movl	%r9d, %edx
	andl	$-16, %edx
	addl	%edx, %eax
	cmpl	%edx, %r9d
	je	.L4152
.L4154:
	cltq
	.p2align 4,,10
	.p2align 3
.L4159:
	movzbl	(%r12,%rax), %edx
	movb	%dl, (%rdi,%rax)
	addq	$1, %rax
	cmpl	%eax, %r15d
	jg	.L4159
	jmp	.L4152
.L4186:
	movl	$4, %eax
	jmp	.L4155
.L4138:
	testl	%esi, %esi
	leaq	.LC121(%rip), %r8
	jne	.L4139
	movl	$12, %esi
	jmp	.L4139
	.p2align 4,,10
	.p2align 3
.L4143:
	leal	-1(%rbx), %ecx
	xorl	%eax, %eax
	addq	$1, %rcx
	.p2align 4,,10
	.p2align 3
.L4150:
	movzbl	(%r12,%rax), %edx
	movb	%dl, (%rdi,%rax)
	addq	$1, %rax
	cmpq	%rax, %rcx
	jne	.L4150
	jmp	.L4142
.L4174:
	movl	$8, %eax
	jmp	.L4145
.L4195:
	movl	$13, %eax
	jmp	.L4155
	.p2align 4,,10
	.p2align 3
.L4184:
	movl	$2, %eax
	jmp	.L4155
	.p2align 4,,10
	.p2align 3
.L4181:
	xorl	%eax, %eax
	jmp	.L4154
	.p2align 4,,10
	.p2align 3
.L4185:
	movl	$3, %eax
	jmp	.L4155
.L4187:
	movl	$5, %eax
	jmp	.L4155
.L4188:
	movl	$6, %eax
	jmp	.L4155
.L4182:
	xorl	%eax, %eax
	jmp	.L4155
.L4167:
	movl	$1, %eax
	jmp	.L4145
.L4189:
	movl	$7, %eax
	jmp	.L4155
.L4168:
	movl	$2, %eax
	jmp	.L4145
.L4165:
	xorl	%eax, %eax
	jmp	.L4144
.L4190:
	movl	$8, %eax
	jmp	.L4155
.L4169:
	movl	$3, %eax
	jmp	.L4145
.L4191:
	movl	$9, %eax
	jmp	.L4155
.L4170:
	movl	$4, %eax
	jmp	.L4145
.L4192:
	movl	$10, %eax
	jmp	.L4155
.L4171:
	movl	$5, %eax
	jmp	.L4145
.L4193:
	movl	$11, %eax
	jmp	.L4155
.L4166:
	xorl	%eax, %eax
	jmp	.L4145
.L4172:
	movl	$6, %eax
	jmp	.L4145
.L4194:
	movl	$12, %eax
	jmp	.L4155
.L4173:
	movl	$7, %eax
	jmp	.L4145
.L4175:
	movl	$9, %eax
	jmp	.L4145
.L4196:
	movl	$14, %eax
	jmp	.L4155
.L4176:
	movl	$10, %eax
	jmp	.L4145
.L4177:
	movl	$11, %eax
	jmp	.L4145
.L4178:
	movl	$12, %eax
	jmp	.L4145
.L4179:
	movl	$13, %eax
	jmp	.L4145
.L4180:
	movl	$14, %eax
	jmp	.L4145
.L4224:
	call	__stack_chk_fail@PLT
.L4163:
	leaq	.LC120(%rip), %r8
	jmp	.L4139
	.cfi_endproc
.LFE463:
	.size	time__Time_clean12, .-time__Time_clean12
	.section	.text.time__Time_clean,"ax",@progbits
	.p2align 4,,15
	.globl	time__Time_clean
	.type	time__Time_clean, @function
time__Time_clean:
.LFB462:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	xorl	%edi, %edi
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$184, %rsp
	.cfi_def_cfa_offset 240
	movq	%fs:40, %rax
	movq	%rax, 168(%rsp)
	xorl	%eax, %eax
	movl	240(%rsp), %ebp
	movl	248(%rsp), %r12d
	call	time@PLT
	leaq	80(%rsp), %rdi
	movq	%rax, 80(%rsp)
	call	localtime@PLT
	movl	20(%rax), %ebx
	movl	16(%rax), %r13d
	leaq	112(%rsp), %rdi
	movl	32(%rax), %esi
	movq	40(%rax), %rcx
	movq	48(%rax), %rdx
	movl	12(%rax), %r14d
	movdqu	(%rax), %xmm1
	addl	$1900, %ebx
	addl	$1, %r13d
	movdqu	16(%rax), %xmm0
	movl	%esi, 144(%rsp)
	movq	%rcx, 152(%rsp)
	movaps	%xmm1, 112(%rsp)
	movq	%rdx, 160(%rsp)
	movaps	%xmm0, 128(%rsp)
	call	timegm@PLT
	movl	%ebx, 16(%rsp)
	movl	%r13d, 20(%rsp)
	movq	240(%rsp), %rax
	cmpq	%rax, 16(%rsp)
	jne	.L4226
	cmpl	%r12d, %r14d
	je	.L4307
.L4226:
	cmpl	%ebp, %ebx
	je	.L4308
	movl	252(%rsp), %r15d
	movl	256(%rsp), %ebx
	leaq	.LC118(%rip), %rdi
	movl	244(%rsp), %r9d
	movl	260(%rsp), %r8d
	xorl	%eax, %eax
	movq	264(%rsp), %rcx
	movl	%r15d, %esi
	movl	%ebx, %edx
	movl	%r9d, 12(%rsp)
	movl	%r8d, 8(%rsp)
	movq	%rcx, (%rsp)
	call	_STR
	movl	12(%rsp), %r9d
	movl	8(%rsp), %r8d
	movl	$8, %esi
	movq	(%rsp), %rcx
	movl	%ebp, 80(%rsp)
	movl	$1, %edi
	movl	%r12d, 88(%rsp)
	movl	%r15d, 92(%rsp)
	movq	%rax, %r13
	movl	%r9d, 84(%rsp)
	movl	%ebx, 96(%rsp)
	movq	%rdx, %r14
	movl	%r8d, 100(%rsp)
	movq	%rcx, 104(%rsp)
	pushq	104(%rsp)
	.cfi_def_cfa_offset 248
	pushq	104(%rsp)
	.cfi_def_cfa_offset 256
	pushq	104(%rsp)
	.cfi_def_cfa_offset 264
	pushq	104(%rsp)
	.cfi_def_cfa_offset 272
	call	time__Time_get_fmt_date_str
	leal	2(%rdx), %edi
	movq	%rdx, %rbx
	addq	$32, %rsp
	.cfi_def_cfa_offset 240
	movq	%rax, %r12
	movl	%edx, %r15d
	leal	1(%rdx), %ebp
	call	v_malloc
	testl	%ebx, %ebx
	movq	%rax, %rdi
	jle	.L4239
	leaq	16(%rax), %rax
	cmpq	%rax, %r12
	leaq	16(%r12), %rax
	setnb	%dl
	cmpq	%rax, %rdi
	setnb	%al
	orb	%al, %dl
	je	.L4240
	cmpl	$22, %ebx
	jbe	.L4240
	movq	%r12, %rdx
	leal	-1(%rbx), %ecx
	negq	%rdx
	andl	$15, %edx
	leal	15(%rdx), %eax
	cmpl	%eax, %ecx
	jb	.L4266
	testl	%edx, %edx
	je	.L4267
	movzbl	(%r12), %eax
	cmpl	$1, %edx
	movb	%al, (%rdi)
	je	.L4268
	movzbl	1(%r12), %eax
	cmpl	$2, %edx
	movb	%al, 1(%rdi)
	je	.L4269
	movzbl	2(%r12), %eax
	cmpl	$3, %edx
	movb	%al, 2(%rdi)
	je	.L4270
	movzbl	3(%r12), %eax
	cmpl	$4, %edx
	movb	%al, 3(%rdi)
	je	.L4271
	movzbl	4(%r12), %eax
	cmpl	$5, %edx
	movb	%al, 4(%rdi)
	je	.L4272
	movzbl	5(%r12), %eax
	cmpl	$6, %edx
	movb	%al, 5(%rdi)
	je	.L4273
	movzbl	6(%r12), %eax
	cmpl	$7, %edx
	movb	%al, 6(%rdi)
	je	.L4274
	movzbl	7(%r12), %eax
	cmpl	$8, %edx
	movb	%al, 7(%rdi)
	je	.L4275
	movzbl	8(%r12), %eax
	cmpl	$9, %edx
	movb	%al, 8(%rdi)
	je	.L4276
	movzbl	9(%r12), %eax
	cmpl	$10, %edx
	movb	%al, 9(%rdi)
	je	.L4277
	movzbl	10(%r12), %eax
	cmpl	$11, %edx
	movb	%al, 10(%rdi)
	je	.L4278
	movzbl	11(%r12), %eax
	cmpl	$12, %edx
	movb	%al, 11(%rdi)
	je	.L4279
	movzbl	12(%r12), %eax
	cmpl	$13, %edx
	movb	%al, 12(%rdi)
	je	.L4280
	movzbl	13(%r12), %eax
	cmpl	$15, %edx
	movb	%al, 13(%rdi)
	jne	.L4281
	movzbl	14(%r12), %eax
	movb	%al, 14(%rdi)
	movl	$15, %eax
	jmp	.L4242
	.p2align 4,,10
	.p2align 3
.L4240:
	leal	-1(%rbx), %ecx
	xorl	%eax, %eax
	addq	$1, %rcx
	.p2align 4,,10
	.p2align 3
.L4247:
	movzbl	(%r12,%rax), %edx
	movb	%dl, (%rdi,%rax)
	addq	$1, %rax
	cmpq	%rcx, %rax
	jne	.L4247
	.p2align 4,,10
	.p2align 3
.L4239:
	movslq	%ebp, %rax
	movslq	%ebx, %rbx
	movl	%ebp, %esi
	movb	$32, (%rdi,%rbx)
	movq	%r13, %rdx
	movb	$0, (%rdi,%rax)
	movq	%r14, %rcx
	call	string_add
	movl	%edx, %edx
.L4227:
	movq	168(%rsp), %rcx
	xorq	%fs:40, %rcx
	jne	.L4309
	addq	$184, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L4308:
	.cfi_restore_state
	movdqu	240(%rsp), %xmm0
	leaq	.LC118(%rip), %rdi
	xorl	%eax, %eax
	movaps	%xmm0, 48(%rsp)
	movl	60(%rsp), %esi
	movdqu	256(%rsp), %xmm0
	movd	%xmm0, %edx
	movaps	%xmm0, 64(%rsp)
	call	_STR
	movl	$4, %esi
	movl	$3, %edi
	movq	%rax, %r13
	movq	%rdx, %r14
	pushq	72(%rsp)
	.cfi_def_cfa_offset 248
	pushq	72(%rsp)
	.cfi_def_cfa_offset 256
	pushq	72(%rsp)
	.cfi_def_cfa_offset 264
	pushq	72(%rsp)
	.cfi_def_cfa_offset 272
	call	time__Time_get_fmt_date_str
	leal	2(%rdx), %edi
	movq	%rdx, %rbx
	addq	$32, %rsp
	.cfi_def_cfa_offset 240
	movq	%rax, %r12
	movl	%edx, %r15d
	leal	1(%rdx), %ebp
	call	v_malloc
	testl	%ebx, %ebx
	movq	%rax, %rdi
	jle	.L4229
	leaq	16(%r12), %rax
	cmpq	%rax, %rdi
	leaq	16(%rdi), %rax
	setnb	%dl
	cmpq	%rax, %r12
	setnb	%al
	orb	%al, %dl
	je	.L4230
	cmpl	$22, %ebx
	jbe	.L4230
	movq	%r12, %rdx
	leal	-1(%rbx), %ecx
	negq	%rdx
	andl	$15, %edx
	leal	15(%rdx), %eax
	cmpl	%eax, %ecx
	jb	.L4250
	testl	%edx, %edx
	je	.L4251
	movzbl	(%r12), %eax
	cmpl	$1, %edx
	movb	%al, (%rdi)
	je	.L4252
	movzbl	1(%r12), %eax
	cmpl	$2, %edx
	movb	%al, 1(%rdi)
	je	.L4253
	movzbl	2(%r12), %eax
	cmpl	$3, %edx
	movb	%al, 2(%rdi)
	je	.L4254
	movzbl	3(%r12), %eax
	cmpl	$4, %edx
	movb	%al, 3(%rdi)
	je	.L4255
	movzbl	4(%r12), %eax
	cmpl	$5, %edx
	movb	%al, 4(%rdi)
	je	.L4256
	movzbl	5(%r12), %eax
	cmpl	$6, %edx
	movb	%al, 5(%rdi)
	je	.L4257
	movzbl	6(%r12), %eax
	cmpl	$7, %edx
	movb	%al, 6(%rdi)
	je	.L4258
	movzbl	7(%r12), %eax
	cmpl	$8, %edx
	movb	%al, 7(%rdi)
	je	.L4259
	movzbl	8(%r12), %eax
	cmpl	$9, %edx
	movb	%al, 8(%rdi)
	je	.L4260
	movzbl	9(%r12), %eax
	cmpl	$10, %edx
	movb	%al, 9(%rdi)
	je	.L4261
	movzbl	10(%r12), %eax
	cmpl	$11, %edx
	movb	%al, 10(%rdi)
	je	.L4262
	movzbl	11(%r12), %eax
	cmpl	$12, %edx
	movb	%al, 11(%rdi)
	je	.L4263
	movzbl	12(%r12), %eax
	cmpl	$13, %edx
	movb	%al, 12(%rdi)
	je	.L4264
	movzbl	13(%r12), %eax
	cmpl	$15, %edx
	movb	%al, 13(%rdi)
	jne	.L4265
	movzbl	14(%r12), %eax
	movb	%al, 14(%rdi)
	movl	$15, %eax
	.p2align 4,,10
	.p2align 3
.L4232:
	movl	%ebx, %r9d
	movl	%edx, %esi
	xorl	%ecx, %ecx
	subl	%edx, %r9d
	leaq	(%r12,%rsi), %r8
	xorl	%edx, %edx
	movl	%r9d, %r10d
	addq	%rdi, %rsi
	shrl	$4, %r10d
	.p2align 4,,10
	.p2align 3
.L4234:
	movdqa	(%r8,%rdx), %xmm0
	addl	$1, %ecx
	movups	%xmm0, (%rsi,%rdx)
	addq	$16, %rdx
	cmpl	%ecx, %r10d
	ja	.L4234
	movl	%r9d, %edx
	andl	$-16, %edx
	addl	%edx, %eax
	cmpl	%edx, %r9d
	je	.L4229
.L4231:
	cltq
	.p2align 4,,10
	.p2align 3
.L4236:
	movzbl	(%r12,%rax), %edx
	movb	%dl, (%rdi,%rax)
	addq	$1, %rax
	cmpl	%eax, %r15d
	jg	.L4236
.L4229:
	movslq	%ebx, %rbx
	movslq	%ebp, %rax
	movl	%ebp, %esi
	movb	$32, (%rdi,%rbx)
	movq	%r13, %rdx
	movb	$0, (%rdi,%rax)
	movq	%r14, %rcx
	call	string_add
	jmp	.L4227
	.p2align 4,,10
	.p2align 3
.L4307:
	movl	256(%rsp), %edx
	movl	252(%rsp), %esi
	leaq	.LC118(%rip), %rdi
	xorl	%eax, %eax
	call	_STR
	jmp	.L4227
	.p2align 4,,10
	.p2align 3
.L4268:
	movl	$1, %eax
	.p2align 4,,10
	.p2align 3
.L4242:
	movl	%ebx, %r9d
	movl	%edx, %esi
	xorl	%ecx, %ecx
	subl	%edx, %r9d
	leaq	(%r12,%rsi), %r8
	xorl	%edx, %edx
	movl	%r9d, %r10d
	addq	%rdi, %rsi
	shrl	$4, %r10d
	.p2align 4,,10
	.p2align 3
.L4244:
	movdqa	(%r8,%rdx), %xmm0
	addl	$1, %ecx
	movups	%xmm0, (%rsi,%rdx)
	addq	$16, %rdx
	cmpl	%ecx, %r10d
	ja	.L4244
	movl	%r9d, %edx
	andl	$-16, %edx
	addl	%edx, %eax
	cmpl	%edx, %r9d
	je	.L4239
.L4241:
	cltq
	.p2align 4,,10
	.p2align 3
.L4246:
	movzbl	(%r12,%rax), %edx
	movb	%dl, (%rdi,%rax)
	addq	$1, %rax
	cmpl	%eax, %r15d
	jg	.L4246
	jmp	.L4239
.L4271:
	movl	$4, %eax
	jmp	.L4242
	.p2align 4,,10
	.p2align 3
.L4230:
	leal	-1(%rbx), %ecx
	xorl	%eax, %eax
	addq	$1, %rcx
	.p2align 4,,10
	.p2align 3
.L4237:
	movzbl	(%r12,%rax), %edx
	movb	%dl, (%rdi,%rax)
	addq	$1, %rax
	cmpq	%rcx, %rax
	jne	.L4237
	jmp	.L4229
.L4259:
	movl	$8, %eax
	jmp	.L4232
.L4280:
	movl	$13, %eax
	jmp	.L4242
	.p2align 4,,10
	.p2align 3
.L4269:
	movl	$2, %eax
	jmp	.L4242
	.p2align 4,,10
	.p2align 3
.L4266:
	xorl	%eax, %eax
	jmp	.L4241
	.p2align 4,,10
	.p2align 3
.L4270:
	movl	$3, %eax
	jmp	.L4242
.L4272:
	movl	$5, %eax
	jmp	.L4242
.L4273:
	movl	$6, %eax
	jmp	.L4242
.L4267:
	xorl	%eax, %eax
	jmp	.L4242
.L4252:
	movl	$1, %eax
	jmp	.L4232
.L4274:
	movl	$7, %eax
	jmp	.L4242
.L4253:
	movl	$2, %eax
	jmp	.L4232
.L4250:
	xorl	%eax, %eax
	jmp	.L4231
.L4275:
	movl	$8, %eax
	jmp	.L4242
.L4254:
	movl	$3, %eax
	jmp	.L4232
.L4255:
	movl	$4, %eax
	jmp	.L4232
.L4276:
	movl	$9, %eax
	jmp	.L4242
.L4277:
	movl	$10, %eax
	jmp	.L4242
.L4256:
	movl	$5, %eax
	jmp	.L4232
.L4278:
	movl	$11, %eax
	jmp	.L4242
.L4251:
	xorl	%eax, %eax
	jmp	.L4232
.L4257:
	movl	$6, %eax
	jmp	.L4232
.L4279:
	movl	$12, %eax
	jmp	.L4242
.L4258:
	movl	$7, %eax
	jmp	.L4232
.L4260:
	movl	$9, %eax
	jmp	.L4232
.L4281:
	movl	$14, %eax
	jmp	.L4242
.L4261:
	movl	$10, %eax
	jmp	.L4232
.L4262:
	movl	$11, %eax
	jmp	.L4232
.L4263:
	movl	$12, %eax
	jmp	.L4232
.L4264:
	movl	$13, %eax
	jmp	.L4232
.L4265:
	movl	$14, %eax
	jmp	.L4232
.L4309:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE462:
	.size	time__Time_clean, .-time__Time_clean
	.section	.text.time__Time_get_fmt_str,"ax",@progbits
	.p2align 4,,15
	.globl	time__Time_get_fmt_str
	.type	time__Time_get_fmt_str, @function
time__Time_get_fmt_str:
.LFB466:
	.cfi_startproc
	cmpl	$7, %edx
	je	.L4354
	cmpl	$4, %esi
	je	.L4314
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%edi, %ebp
	movl	%esi, %edi
	movl	%edx, %ebx
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	pushq	88(%rsp)
	.cfi_def_cfa_offset 72
	pushq	88(%rsp)
	.cfi_def_cfa_offset 80
	pushq	88(%rsp)
	.cfi_def_cfa_offset 88
	pushq	88(%rsp)
	.cfi_def_cfa_offset 96
	call	time__Time_get_fmt_time_str
	addq	$32, %rsp
	.cfi_def_cfa_offset 64
	movl	%ebx, %esi
	movl	%ebp, %edi
	pushq	88(%rsp)
	.cfi_def_cfa_offset 72
	pushq	88(%rsp)
	.cfi_def_cfa_offset 80
	movq	%rax, %r13
	pushq	88(%rsp)
	.cfi_def_cfa_offset 88
	pushq	88(%rsp)
	.cfi_def_cfa_offset 96
	movq	%rdx, %r14
	call	time__Time_get_fmt_date_str
	leal	2(%rdx), %edi
	movq	%rdx, %rbx
	addq	$32, %rsp
	.cfi_def_cfa_offset 64
	movq	%rax, %r12
	movl	%edx, %r15d
	leal	1(%rdx), %ebp
	call	v_malloc
	testl	%ebx, %ebx
	movq	%rax, %rdi
	jle	.L4315
	leaq	16(%r12), %rax
	cmpq	%rax, %rdi
	leaq	16(%rdi), %rax
	setnb	%dl
	cmpq	%rax, %r12
	setnb	%al
	orb	%al, %dl
	je	.L4316
	cmpl	$22, %ebx
	jbe	.L4316
	movq	%r12, %rdx
	leal	-1(%rbx), %ecx
	negq	%rdx
	andl	$15, %edx
	leal	15(%rdx), %eax
	cmpl	%eax, %ecx
	jb	.L4325
	testl	%edx, %edx
	je	.L4326
	movzbl	(%r12), %eax
	cmpl	$1, %edx
	movb	%al, (%rdi)
	je	.L4327
	movzbl	1(%r12), %eax
	cmpl	$2, %edx
	movb	%al, 1(%rdi)
	je	.L4328
	movzbl	2(%r12), %eax
	cmpl	$3, %edx
	movb	%al, 2(%rdi)
	je	.L4329
	movzbl	3(%r12), %eax
	cmpl	$4, %edx
	movb	%al, 3(%rdi)
	je	.L4330
	movzbl	4(%r12), %eax
	cmpl	$5, %edx
	movb	%al, 4(%rdi)
	je	.L4331
	movzbl	5(%r12), %eax
	cmpl	$6, %edx
	movb	%al, 5(%rdi)
	je	.L4332
	movzbl	6(%r12), %eax
	cmpl	$7, %edx
	movb	%al, 6(%rdi)
	je	.L4333
	movzbl	7(%r12), %eax
	cmpl	$8, %edx
	movb	%al, 7(%rdi)
	je	.L4334
	movzbl	8(%r12), %eax
	cmpl	$9, %edx
	movb	%al, 8(%rdi)
	je	.L4335
	movzbl	9(%r12), %eax
	cmpl	$10, %edx
	movb	%al, 9(%rdi)
	je	.L4336
	movzbl	10(%r12), %eax
	cmpl	$11, %edx
	movb	%al, 10(%rdi)
	je	.L4337
	movzbl	11(%r12), %eax
	cmpl	$12, %edx
	movb	%al, 11(%rdi)
	je	.L4338
	movzbl	12(%r12), %eax
	cmpl	$13, %edx
	movb	%al, 12(%rdi)
	je	.L4339
	movzbl	13(%r12), %eax
	cmpl	$15, %edx
	movb	%al, 13(%rdi)
	jne	.L4340
	movzbl	14(%r12), %eax
	movb	%al, 14(%rdi)
	movl	$15, %eax
	.p2align 4,,10
	.p2align 3
.L4318:
	movl	%ebx, %r9d
	movl	%edx, %esi
	xorl	%ecx, %ecx
	subl	%edx, %r9d
	leaq	(%r12,%rsi), %r8
	xorl	%edx, %edx
	movl	%r9d, %r10d
	addq	%rdi, %rsi
	shrl	$4, %r10d
	.p2align 4,,10
	.p2align 3
.L4320:
	movdqa	(%r8,%rdx), %xmm0
	addl	$1, %ecx
	movups	%xmm0, (%rsi,%rdx)
	addq	$16, %rdx
	cmpl	%ecx, %r10d
	ja	.L4320
	movl	%r9d, %edx
	andl	$-16, %edx
	addl	%edx, %eax
	cmpl	%edx, %r9d
	je	.L4315
.L4317:
	cltq
	.p2align 4,,10
	.p2align 3
.L4322:
	movzbl	(%r12,%rax), %edx
	movb	%dl, (%rdi,%rax)
	addq	$1, %rax
	cmpl	%eax, %r15d
	jg	.L4322
.L4315:
	movslq	%ebx, %rbx
	movslq	%ebp, %rax
	movl	%ebp, %esi
	movb	$32, (%rdi,%rbx)
	movb	$0, (%rdi,%rax)
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_restore 3
	.cfi_def_cfa_offset 48
	movq	%r13, %rdx
	movq	%r14, %rcx
	popq	%rbp
	.cfi_restore 6
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_restore 12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_restore 13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_restore 14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_restore 15
	.cfi_def_cfa_offset 8
	jmp	string_add
	.p2align 4,,10
	.p2align 3
.L4314:
	movl	%edx, %esi
	jmp	time__Time_get_fmt_date_str
	.p2align 4,,10
	.p2align 3
.L4354:
	cmpl	$4, %esi
	jne	.L4355
	leaq	.LC37(%rip), %rax
	xorl	%edx, %edx
	ret
	.p2align 4,,10
	.p2align 3
.L4355:
	movl	%esi, %edi
	jmp	time__Time_get_fmt_time_str
	.p2align 4,,10
	.p2align 3
.L4316:
	.cfi_def_cfa_offset 64
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	leal	-1(%rbx), %ecx
	xorl	%eax, %eax
	addq	$1, %rcx
	.p2align 4,,10
	.p2align 3
.L4323:
	movzbl	(%r12,%rax), %edx
	movb	%dl, (%rdi,%rax)
	addq	$1, %rax
	cmpq	%rcx, %rax
	jne	.L4323
	jmp	.L4315
	.p2align 4,,10
	.p2align 3
.L4328:
	movl	$2, %eax
	jmp	.L4318
.L4336:
	movl	$10, %eax
	jmp	.L4318
	.p2align 4,,10
	.p2align 3
.L4327:
	movl	$1, %eax
	jmp	.L4318
	.p2align 4,,10
	.p2align 3
.L4325:
	xorl	%eax, %eax
	jmp	.L4317
	.p2align 4,,10
	.p2align 3
.L4329:
	movl	$3, %eax
	jmp	.L4318
.L4330:
	movl	$4, %eax
	jmp	.L4318
.L4331:
	movl	$5, %eax
	jmp	.L4318
.L4332:
	movl	$6, %eax
	jmp	.L4318
.L4326:
	xorl	%eax, %eax
	jmp	.L4318
.L4333:
	movl	$7, %eax
	jmp	.L4318
.L4334:
	movl	$8, %eax
	jmp	.L4318
.L4335:
	movl	$9, %eax
	jmp	.L4318
.L4337:
	movl	$11, %eax
	jmp	.L4318
.L4338:
	movl	$12, %eax
	jmp	.L4318
.L4339:
	movl	$13, %eax
	jmp	.L4318
.L4340:
	movl	$14, %eax
	jmp	.L4318
	.cfi_endproc
.LFE466:
	.size	time__Time_get_fmt_str, .-time__Time_get_fmt_str
	.section	.rodata.str1.1
.LC135:
	.string	"Invalid time format: %.*s"
	.section	.text.time__parse,"ax",@progbits
	.p2align 4,,15
	.globl	time__parse
	.type	time__parse, @function
time__parse:
.LFB467:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdx, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rsi, %rbp
	movq	%rdi, %rbx
	subq	$648, %rsp
	.cfi_def_cfa_offset 704
	movq	%fs:40, %rax
	movq	%rax, 632(%rsp)
	xorl	%eax, %eax
	testl	%edx, %edx
	jle	.L4369
	leal	-1(%rdx), %edx
	addq	$1, %rdx
.L4363:
	cmpb	$32, 0(%rbp,%rax)
	jne	.L4370
	leaq	192(%rsp), %rdi
	leaq	156(%rsp), %rsi
	movl	$4, %edx
	movl	%eax, 156(%rsp)
	call	opt_ok
	movl	612(%rsp), %eax
	testl	%eax, %eax
	je	.L4369
	movl	192(%rsp), %r13d
	xorl	%edx, %edx
	movq	%rbp, %rdi
	movq	%r12, %rsi
	movl	%r13d, %ecx
	call	string_substr
	leaq	32(%rsp), %rdi
	leaq	.LC132(%rip), %rcx
	movl	$1, %r8d
	movq	%rax, %rsi
	call	string_split_nth.constprop.37
	cmpl	$3, 40(%rsp)
	je	.L4361
.L4369:
	leaq	.LC135(%rip), %rdi
	movl	%r12d, %esi
	movq	%rbp, %rdx
	xorl	%eax, %eax
	call	_STR
	movl	$54, %ecx
	movq	%rax, %rsi
	movq	%rbx, %rdi
	xorl	%eax, %eax
	rep stosq
	movq	%rsi, 400(%rbx)
	movl	%edx, 408(%rbx)
.L4356:
	movq	632(%rsp), %rcx
	xorq	%fs:40, %rcx
	movq	%rbx, %rax
	jne	.L4371
	addq	$648, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L4370:
	.cfi_restore_state
	addq	$1, %rax
	cmpq	%rdx, %rax
	jne	.L4363
	jmp	.L4369
	.p2align 4,,10
	.p2align 3
.L4361:
	movl	%r12d, %ecx
	movq	%rbp, %rdi
	movq	%r12, %rsi
	movl	%r13d, %edx
	call	string_substr
	leaq	64(%rsp), %rdi
	leaq	.LC44(%rip), %rcx
	movl	$1, %r8d
	movq	%rax, %rsi
	call	string_split_nth.constprop.37
	subq	$8, %rsp
	.cfi_def_cfa_offset 712
	pushq	88(%rsp)
	.cfi_def_cfa_offset 720
	pushq	88(%rsp)
	.cfi_def_cfa_offset 728
	pushq	88(%rsp)
	.cfi_def_cfa_offset 736
	call	array_get.constprop.46
	addq	$24, %rsp
	.cfi_def_cfa_offset 712
	movl	8(%rax), %ebp
	pushq	88(%rsp)
	.cfi_def_cfa_offset 720
	pushq	88(%rsp)
	.cfi_def_cfa_offset 728
	pushq	88(%rsp)
	.cfi_def_cfa_offset 736
	call	array_get.constprop.46
	movq	8(%rax), %rsi
	movq	(%rax), %rdi
	movl	%ebp, %ecx
	addq	$32, %rsp
	.cfi_def_cfa_offset 704
	movl	$1, %edx
	call	string_substr
	subq	$8, %rsp
	.cfi_def_cfa_offset 712
	movl	$1, %edi
	movq	%rdx, %r13
	pushq	88(%rsp)
	.cfi_def_cfa_offset 720
	pushq	88(%rsp)
	.cfi_def_cfa_offset 728
	movq	%rax, %r15
	pushq	88(%rsp)
	.cfi_def_cfa_offset 736
	call	array_get
	addq	$24, %rsp
	.cfi_def_cfa_offset 712
	movq	(%rax), %r14
	movl	8(%rax), %r12d
	pushq	88(%rsp)
	.cfi_def_cfa_offset 720
	pushq	88(%rsp)
	.cfi_def_cfa_offset 728
	movl	$2, %edi
	pushq	88(%rsp)
	.cfi_def_cfa_offset 736
	call	array_get
	movq	(%rax), %rcx
	movl	8(%rax), %ebp
	movq	%rcx, 40(%rsp)
	addq	$24, %rsp
	.cfi_def_cfa_offset 712
	pushq	56(%rsp)
	.cfi_def_cfa_offset 720
	pushq	56(%rsp)
	.cfi_def_cfa_offset 728
	pushq	56(%rsp)
	.cfi_def_cfa_offset 736
	call	array_get.constprop.46
	movq	8(%rax), %rsi
	movq	(%rax), %rdi
	addq	$32, %rsp
	.cfi_def_cfa_offset 704
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$32, %ecx
	call	strconv__common_parse_int
	movq	%rax, 24(%rsp)
	subq	$8, %rsp
	.cfi_def_cfa_offset 712
	movl	$1, %edi
	pushq	56(%rsp)
	.cfi_def_cfa_offset 720
	pushq	56(%rsp)
	.cfi_def_cfa_offset 728
	pushq	56(%rsp)
	.cfi_def_cfa_offset 736
	call	array_get
	movq	8(%rax), %rsi
	movq	(%rax), %rdi
	addq	$32, %rsp
	.cfi_def_cfa_offset 704
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movl	$32, %ecx
	call	strconv__common_parse_int
	movq	%rax, (%rsp)
	subq	$8, %rsp
	.cfi_def_cfa_offset 712
	movl	$2, %edi
	pushq	56(%rsp)
	.cfi_def_cfa_offset 720
	pushq	56(%rsp)
	.cfi_def_cfa_offset 728
	pushq	56(%rsp)
	.cfi_def_cfa_offset 736
	call	array_get
	movq	(%rax), %rdi
	movq	8(%rax), %rsi
	addq	$32, %rsp
	.cfi_def_cfa_offset 704
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$32, %ecx
	xorl	%edx, %edx
	call	strconv__common_parse_int
	movq	%r13, %rsi
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movq	%r15, %rdi
	movl	$32, %ecx
	movq	%rax, 16(%rsp)
	call	strconv__common_parse_int
	movl	%r12d, %esi
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	xorl	%edx, %edx
	movq	%r14, %rdi
	movl	$32, %ecx
	movq	%rax, %r13
	call	strconv__common_parse_int
	movq	8(%rsp), %rdi
	movl	%ebp, %esi
	xorl	%edx, %edx
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$32, %ecx
	movq	%rax, %r12
	call	strconv__common_parse_int
	movl	(%rsp), %ecx
	movq	24(%rsp), %r14
	movq	%rax, %rbp
	movl	%eax, 96(%rsp)
	movq	16(%rsp), %r15
	leaq	96(%rsp), %rdi
	movl	%r12d, 100(%rsp)
	movl	%r13d, 104(%rsp)
	leal	-1(%rcx), %eax
	movq	$0, 120(%rsp)
	movl	$0, 128(%rsp)
	movl	%r15d, 108(%rsp)
	movq	$0, 136(%rsp)
	movl	%eax, 112(%rsp)
	movl	%r14d, %eax
	movq	$0, 144(%rsp)
	subl	$1900, %eax
	movl	%eax, 116(%rsp)
	call	timegm@PLT
	movl	%r15d, 8(%rsp)
	movd	(%rsp), %xmm3
	leaq	160(%rsp), %rsi
	movd	8(%rsp), %xmm1
	movl	%r13d, 8(%rsp)
	cltq
	movd	8(%rsp), %xmm2
	movl	%r14d, 8(%rsp)
	movl	$32, %edx
	movd	8(%rsp), %xmm0
	movq	%rbx, %rdi
	movl	%r12d, 176(%rsp)
	punpckldq	%xmm2, %xmm1
	movl	%ebp, 180(%rsp)
	punpckldq	%xmm3, %xmm0
	movq	%rax, 184(%rsp)
	punpcklqdq	%xmm1, %xmm0
	movaps	%xmm0, 160(%rsp)
	call	opt_ok
	jmp	.L4356
.L4371:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE467:
	.size	time__parse, .-time__parse
	.section	.rodata.str1.1
.LC136:
	.string	"%s-%02d-%s %s"
	.section	.text.time__parse_rfc2822,"ax",@progbits
	.p2align 4,,15
	.globl	time__parse_rfc2822
	.type	time__parse_rfc2822, @function
time__parse_rfc2822:
.LFB468:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	leaq	.LC88(%rip), %rcx
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	$1, %r8d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	movq	%rsi, %r12
	movq	%rdx, %rbp
	subq	$968, %rsp
	.cfi_def_cfa_offset 1024
	leaq	16(%rsp), %rdi
	movq	%fs:40, %rax
	movq	%rax, 952(%rsp)
	xorl	%eax, %eax
	call	string_split_nth.constprop.37
	cmpl	$4, 24(%rsp)
	jle	.L4380
	subq	$8, %rsp
	.cfi_def_cfa_offset 1032
	movl	$2, %edi
	pushq	40(%rsp)
	.cfi_def_cfa_offset 1040
	pushq	40(%rsp)
	.cfi_def_cfa_offset 1048
	pushq	40(%rsp)
	.cfi_def_cfa_offset 1056
	call	array_get
	movq	8+_const_time__months_string(%rip), %rdx
	movq	(%rax), %rcx
	leaq	112(%rsp), %rdi
	movq	8(%rax), %r8
	movq	_const_time__months_string(%rip), %rsi
	addq	$32, %rsp
	.cfi_def_cfa_offset 1024
	call	string_index
	movl	500(%rsp), %edx
	testl	%edx, %edx
	je	.L4380
	movl	80(%rsp), %ecx
	movl	$1431655766, %edx
	leal	(%rbp,%rbp), %r14d
	movl	%r14d, %edi
	movl	%ecx, %eax
	sarl	$31, %ecx
	imull	%edx
	subl	%ecx, %edx
	leal	1(%rdx), %eax
	movl	%eax, 4(%rsp)
	call	v_malloc
	subq	$8, %rsp
	.cfi_def_cfa_offset 1032
	movl	$4, %edi
	movq	%rax, %r15
	pushq	40(%rsp)
	.cfi_def_cfa_offset 1040
	pushq	40(%rsp)
	.cfi_def_cfa_offset 1048
	pushq	40(%rsp)
	.cfi_def_cfa_offset 1056
	call	array_get
	movq	(%rax), %rcx
	movl	$1, %edi
	movq	%rcx, 40(%rsp)
	addq	$24, %rsp
	.cfi_def_cfa_offset 1032
	pushq	40(%rsp)
	.cfi_def_cfa_offset 1040
	pushq	40(%rsp)
	.cfi_def_cfa_offset 1048
	pushq	40(%rsp)
	.cfi_def_cfa_offset 1056
	call	array_get
	addq	$24, %rsp
	.cfi_def_cfa_offset 1032
	movq	(%rax), %r13
	movl	$3, %edi
	pushq	40(%rsp)
	.cfi_def_cfa_offset 1040
	pushq	40(%rsp)
	.cfi_def_cfa_offset 1048
	pushq	40(%rsp)
	.cfi_def_cfa_offset 1056
	call	array_get
	addq	$24, %rsp
	.cfi_def_cfa_offset 1032
	movq	16(%rsp), %rcx
	leaq	.LC136(%rip), %r8
	movslq	%r14d, %rsi
	movl	$1, %edx
	movq	%r15, %rdi
	pushq	%rcx
	.cfi_def_cfa_offset 1040
	pushq	%r13
	.cfi_def_cfa_offset 1048
	movl	28(%rsp), %ecx
	movq	(%rax), %r9
	xorl	%eax, %eax
	pushq	%rcx
	.cfi_def_cfa_offset 1056
	movq	$-1, %rcx
	call	__snprintf_chk@PLT
	addq	$32, %rsp
	.cfi_def_cfa_offset 1024
	testq	%r15, %r15
	je	.L4381
	leaq	512(%rsp), %rdi
	movl	%eax, %edx
	movq	%r15, %rsi
	call	time__parse
	movl	932(%rsp), %eax
	testl	%eax, %eax
	je	.L4380
	movdqa	512(%rsp), %xmm0
	leaq	48(%rsp), %rsi
	movl	$32, %edx
	movq	%rbx, %rdi
	movaps	%xmm0, 48(%rsp)
	movdqa	528(%rsp), %xmm0
	movaps	%xmm0, 64(%rsp)
	call	opt_ok
	jmp	.L4372
	.p2align 4,,10
	.p2align 3
.L4380:
	leaq	.LC135(%rip), %rdi
	movl	%ebp, %esi
	movq	%r12, %rdx
	xorl	%eax, %eax
	call	_STR
	movl	$54, %ecx
	movq	%rax, %rsi
	movq	%rbx, %rdi
	xorl	%eax, %eax
	rep stosq
	movq	%rsi, 400(%rbx)
	movl	%edx, 408(%rbx)
.L4372:
	movq	%rbx, %rax
	movq	952(%rsp), %rbx
	xorq	%fs:40, %rbx
	jne	.L4382
	addq	$968, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L4382:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
.L4381:
	call	tos.part.7
	.cfi_endproc
.LFE468:
	.size	time__parse_rfc2822, .-time__parse_rfc2822
	.section	.text.time__now,"ax",@progbits
	.p2align 4,,15
	.globl	time__now
	.type	time__now, @function
time__now:
.LFB469:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	xorl	%edi, %edi
	subq	$104, %rsp
	.cfi_def_cfa_offset 160
	movq	%fs:40, %rax
	movq	%rax, 88(%rsp)
	xorl	%eax, %eax
	call	time@PLT
	leaq	24(%rsp), %rdi
	movq	%rax, 24(%rsp)
	call	localtime@PLT
	movl	12(%rax), %edx
	movl	32(%rax), %edi
	movq	40(%rax), %rsi
	movq	48(%rax), %rcx
	movl	(%rax), %r13d
	movl	4(%rax), %r14d
	movl	%edx, 12(%rsp)
	movl	20(%rax), %edx
	movl	8(%rax), %r15d
	movl	16(%rax), %ebp
	movdqu	(%rax), %xmm1
	leal	1900(%rdx), %r12d
	movdqu	16(%rax), %xmm0
	addl	$1, %ebp
	movl	%edi, 64(%rsp)
	leaq	32(%rsp), %rdi
	movq	%rcx, 80(%rsp)
	movaps	%xmm1, 32(%rsp)
	movq	%rsi, 72(%rsp)
	movaps	%xmm0, 48(%rsp)
	call	timegm@PLT
	movq	88(%rsp), %rcx
	xorq	%fs:40, %rcx
	cltq
	movl	12(%rsp), %edx
	movl	%r12d, (%rbx)
	movl	%ebp, 4(%rbx)
	movl	%r15d, 12(%rbx)
	movl	%r14d, 16(%rbx)
	movl	%r13d, 20(%rbx)
	movl	%edx, 8(%rbx)
	movq	%rax, 24(%rbx)
	jne	.L4386
	addq	$104, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%rbx, %rax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L4386:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE469:
	.size	time__now, .-time__now
	.section	.text.time__Time_smonth,"ax",@progbits
	.p2align 4,,15
	.globl	time__Time_smonth
	.type	time__Time_smonth, @function
time__Time_smonth:
.LFB470:
	.cfi_startproc
	movl	12(%rsp), %eax
	movq	_const_time__months_string(%rip), %rdi
	movq	8+_const_time__months_string(%rip), %rsi
	leal	(%rax,%rax,2), %ecx
	leal	-3(%rcx), %edx
	jmp	string_substr
	.cfi_endproc
.LFE470:
	.size	time__Time_smonth, .-time__Time_smonth
	.section	.text.time__new_time,"ax",@progbits
	.p2align 4,,15
	.globl	time__new_time
	.type	time__new_time, @function
time__new_time:
.LFB471:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	subq	$88, %rsp
	.cfi_def_cfa_offset 144
	movq	%fs:40, %rax
	movq	%rax, 72(%rsp)
	xorl	%eax, %eax
	movq	168(%rsp), %rax
	movl	144(%rsp), %edx
	movl	148(%rsp), %r15d
	movl	152(%rsp), %r14d
	movl	156(%rsp), %r13d
	movl	160(%rsp), %r12d
	testq	%rax, %rax
	movl	164(%rsp), %ebp
	jne	.L4390
	movl	%ebp, 12(%rsp)
	leal	-1(%r15), %eax
	leaq	16(%rsp), %rdi
	movd	12(%rsp), %xmm0
	movl	%r12d, 12(%rsp)
	movd	12(%rsp), %xmm2
	movl	%r13d, 12(%rsp)
	movd	12(%rsp), %xmm1
	movl	%r14d, 12(%rsp)
	movd	12(%rsp), %xmm3
	punpckldq	%xmm2, %xmm0
	movl	%eax, 32(%rsp)
	leal	-1900(%rdx), %eax
	movl	%edx, 12(%rsp)
	punpckldq	%xmm3, %xmm1
	movq	$0, 40(%rsp)
	movl	%eax, 36(%rsp)
	movl	$0, 48(%rsp)
	movq	$0, 56(%rsp)
	movq	$0, 64(%rsp)
	punpcklqdq	%xmm1, %xmm0
	movaps	%xmm0, 16(%rsp)
	call	timegm@PLT
	movl	12(%rsp), %edx
.L4390:
	movq	72(%rsp), %rcx
	xorq	%fs:40, %rcx
	cltq
	movl	%edx, (%rbx)
	movl	%r15d, 4(%rbx)
	movq	%rax, 24(%rbx)
	movl	%r14d, 8(%rbx)
	movq	%rbx, %rax
	movl	%r13d, 12(%rbx)
	movl	%r12d, 16(%rbx)
	movl	%ebp, 20(%rbx)
	jne	.L4393
	addq	$88, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L4393:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE471:
	.size	time__new_time, .-time__new_time
	.section	.text.time__Time_unix_time,"ax",@progbits
	.p2align 4,,15
	.globl	time__Time_unix_time
	.type	time__Time_unix_time, @function
time__Time_unix_time:
.LFB472:
	.cfi_startproc
	subq	$72, %rsp
	.cfi_def_cfa_offset 80
	movq	%fs:40, %rax
	movq	%rax, 56(%rsp)
	xorl	%eax, %eax
	movq	104(%rsp), %rax
	testq	%rax, %rax
	jne	.L4394
	movl	100(%rsp), %ecx
	movl	84(%rsp), %eax
	movq	%rsp, %rdi
	movq	$0, 24(%rsp)
	movl	$0, 32(%rsp)
	movq	$0, 40(%rsp)
	movq	$0, 48(%rsp)
	movl	%ecx, (%rsp)
	movl	96(%rsp), %ecx
	leal	-1(%rax), %edx
	movl	80(%rsp), %eax
	movl	%edx, 16(%rsp)
	movl	%ecx, 4(%rsp)
	movl	92(%rsp), %ecx
	subl	$1900, %eax
	movl	%eax, 20(%rsp)
	movl	%ecx, 8(%rsp)
	movl	88(%rsp), %ecx
	movl	%ecx, 12(%rsp)
	call	timegm@PLT
.L4394:
	movq	56(%rsp), %rsi
	xorq	%fs:40, %rsi
	jne	.L4399
	addq	$72, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L4399:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE472:
	.size	time__Time_unix_time, .-time__Time_unix_time
	.section	.text.time__Time_add_seconds,"ax",@progbits
	.p2align 4,,15
	.globl	time__Time_add_seconds
	.type	time__Time_add_seconds, @function
time__Time_add_seconds:
.LFB473:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movq	%rdi, %r13
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	addl	72(%rsp), %esi
	movl	_const_time__seconds_per_day(%rip), %edi
	movl	_const_time__days_per_100_years(%rip), %ebp
	movslq	%esi, %r14
	movl	%r14d, %eax
	cltd
	idivl	%edi
	movl	%edx, %ecx
	sarl	$31, %edx
	leal	-11323(%rdx,%rax), %eax
	cltd
	idivl	_const_time__days_per_400_years(%rip)
	imull	$400, %eax, %r12d
	leal	0(,%rbp,4), %eax
	cmpl	%eax, %edx
	je	.L4435
	movl	%edx, %eax
	cltd
	idivl	%ebp
	imull	$100, %eax, %eax
	leal	2001(%r12,%rax), %r12d
	movl	%edx, %eax
.L4403:
	movl	_const_time__days_per_4_years(%rip), %esi
	leal	0(,%rsi,4), %r8d
	leal	(%r8,%rsi), %edx
	leal	(%rdx,%rdx,4), %edx
	cmpl	%eax, %edx
	je	.L4436
	cltd
	idivl	%esi
	leal	(%r12,%rax,4), %r12d
	movl	%edx, %ebp
.L4405:
	cmpl	$1460, %ebp
	je	.L4437
	movl	%ebp, %eax
	movl	$-1282606671, %esi
	imull	%esi
	leal	(%rdx,%rbp), %eax
	movl	%ebp, %edx
	sarl	$31, %edx
	sarl	$8, %eax
	subl	%edx, %eax
	addl	%eax, %r12d
	imull	$365, %eax, %eax
	subl	%eax, %ebp
	jns	.L4408
	subl	$1, %r12d
	movl	%r12d, %esi
	andl	$3, %esi
	je	.L4438
.L4409:
	addl	$365, %ebp
.L4407:
	testl	%esi, %esi
	je	.L4439
.L4412:
	movl	%ebp, %eax
	movl	$138547333, %edx
	movl	%ebp, %ebx
	mull	%edx
	movslq	16+_const_time__days_before(%rip), %rdi
	movq	_const_time__days_before(%rip), %rsi
	subl	%edx, %ebx
	shrl	%ebx
	movq	%rdi, %r9
	movq	%rdi, %r8
	addl	%edx, %ebx
	negq	%r9
	movl	8+_const_time__days_before(%rip), %edx
	shrl	$4, %ebx
	leal	1(%rbx), %eax
	movl	%eax, %ecx
	imull	%edi, %ecx
	movslq	%ecx, %rcx
	addq	%rsi, %rcx
	jmp	.L4417
	.p2align 4,,10
	.p2align 3
.L4425:
	movl	%eax, %ebx
	addl	$1, %eax
.L4417:
	cmpl	%edx, %eax
	jge	.L4440
	addq	%rdi, %rcx
	cmpl	(%rcx,%r9), %ebp
	jge	.L4425
	cmpl	%edx, %ebx
	movl	%ebx, %edi
	jge	.L4418
	imull	%r8d, %edi
	movslq	%edi, %rcx
	cmpl	(%rsi,%rcx), %ebp
	jge	.L4427
	testl	%ebx, %ebx
	je	.L4428
	movl	%r8d, %ecx
	subl	%r8d, %edi
	negl	%ecx
	movslq	%edi, %rax
	movslq	%ecx, %rcx
	addq	%rsi, %rax
	jmp	.L4420
	.p2align 4,,10
	.p2align 3
.L4422:
	addq	%rcx, %rax
	testl	%edi, %edi
	movl	%edi, %ebx
	je	.L4429
.L4420:
	leal	-1(%rbx), %edi
	cmpl	%edx, %edi
	jge	.L4418
	cmpl	(%rax), %ebp
	jl	.L4422
.L4419:
	subq	$8, %rsp
	.cfi_def_cfa_offset 56
	pushq	16+_const_time__days_before(%rip)
	.cfi_def_cfa_offset 64
	pushq	8+_const_time__days_before(%rip)
	.cfi_def_cfa_offset 72
	pushq	_const_time__days_before(%rip)
	.cfi_def_cfa_offset 80
	call	array_get
	movl	_const_time__seconds_per_day(%rip), %edi
	subl	(%rax), %ebp
	movl	%r14d, %eax
	cltd
	addq	$32, %rsp
	.cfi_def_cfa_offset 48
	idivl	%edi
	addl	$1, %ebp
	movl	%edx, %ecx
.L4415:
	addl	%ecx, %edi
	testl	%ecx, %ecx
	movl	%r12d, 0(%r13)
	cmovs	%edi, %ecx
	movl	%ebx, 4(%r13)
	movl	%ebp, 8(%r13)
	movl	%ecx, %eax
	movq	%r14, 24(%r13)
	cltd
	idivl	_const_time__seconds_per_hour(%rip)
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	movl	%edx, %ecx
	movl	%eax, 12(%r13)
	movl	$-2004318071, %edx
	movl	%ecx, %eax
	imull	%edx
	movl	%ecx, %eax
	sarl	$31, %eax
	addl	%ecx, %edx
	sarl	$5, %edx
	subl	%eax, %edx
	movq	%r13, %rax
	movl	%edx, 16(%r13)
	imull	$60, %edx, %edx
	subl	%edx, %ecx
	movl	%ecx, 20(%r13)
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L4429:
	.cfi_restore_state
	movl	$1, %ebx
	jmp	.L4419
	.p2align 4,,10
	.p2align 3
.L4439:
	movl	%r12d, %eax
	movl	$1374389535, %edx
	movl	%r12d, %esi
	imull	%edx
	movl	%r12d, %eax
	sarl	$31, %eax
	sarl	$5, %edx
	subl	%eax, %edx
	imull	$100, %edx, %eax
	subl	%eax, %esi
	movl	%esi, %eax
.L4411:
	testl	%eax, %eax
	jne	.L4413
	movl	%r12d, %eax
	movl	$1374389535, %edx
	imull	%edx
	movl	%r12d, %eax
	sarl	$31, %eax
	sarl	$7, %edx
	subl	%eax, %edx
	imull	$400, %edx, %eax
	cmpl	%eax, %r12d
	jne	.L4412
.L4413:
	cmpl	$59, %ebp
	jg	.L4441
	jne	.L4412
	movl	$29, %ebp
	movl	$2, %ebx
	jmp	.L4415
	.p2align 4,,10
	.p2align 3
.L4435:
	addl	$2301, %r12d
	movl	%ebp, %eax
	jmp	.L4403
	.p2align 4,,10
	.p2align 3
.L4437:
	addl	$3, %r12d
	movl	$365, %ebp
	movl	%r12d, %esi
	andl	$3, %esi
	jmp	.L4407
	.p2align 4,,10
	.p2align 3
.L4436:
	subl	%r8d, %esi
	addl	$96, %r12d
	leal	(%rax,%rsi,8), %ebp
	jmp	.L4405
	.p2align 4,,10
	.p2align 3
.L4441:
	subl	$1, %ebp
	jmp	.L4412
	.p2align 4,,10
	.p2align 3
.L4438:
	movl	%r12d, %eax
	movl	$1374389535, %edx
	movl	%r12d, %r8d
	imull	%edx
	sarl	$31, %r8d
	movl	%r12d, %ebx
	movl	%edx, %eax
	sarl	$5, %eax
	subl	%r8d, %eax
	imull	$100, %eax, %eax
	subl	%eax, %ebx
	movl	%ebx, %eax
	jne	.L4410
	sarl	$7, %edx
	subl	%r8d, %edx
	imull	$400, %edx, %edx
	cmpl	%edx, %r12d
	jne	.L4409
.L4410:
	addl	$366, %ebp
	jmp	.L4411
	.p2align 4,,10
	.p2align 3
.L4408:
	movl	%r12d, %esi
	andl	$3, %esi
	jmp	.L4407
	.p2align 4,,10
	.p2align 3
.L4427:
	movl	%ebx, %edi
	movl	%eax, %ebx
	jmp	.L4419
	.p2align 4,,10
	.p2align 3
.L4428:
	xorl	%edi, %edi
	movl	$1, %ebx
	jmp	.L4419
.L4418:
	movl	%edi, %esi
.L4434:
	leaq	.LC68(%rip), %rdi
	xorl	%eax, %eax
	call	_STR
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	v_panic
.L4440:
	movl	%eax, %esi
	jmp	.L4434
	.cfi_endproc
.LFE473:
	.size	time__Time_add_seconds, .-time__Time_add_seconds
	.section	.text.time__since,"ax",@progbits
	.p2align 4,,15
	.globl	time__since
	.type	time__since, @function
time__since:
.LFB475:
	.cfi_startproc
	xorl	%eax, %eax
	ret
	.cfi_endproc
.LFE475:
	.size	time__since, .-time__since
	.section	.rodata.str1.1
.LC137:
	.string	"now"
.LC138:
	.string	"1m"
.LC139:
	.string	"%dm"
.LC140:
	.string	"%dh"
.LC141:
	.string	"%dd"
	.section	.text.time__Time_relative,"ax",@progbits
	.p2align 4,,15
	.globl	time__Time_relative
	.type	time__Time_relative, @function
time__Time_relative:
.LFB476:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	xorl	%edi, %edi
	subq	$96, %rsp
	.cfi_def_cfa_offset 112
	movq	%fs:40, %rax
	movq	%rax, 88(%rsp)
	xorl	%eax, %eax
	movq	136(%rsp), %rbx
	call	time@PLT
	movq	%rsp, %rdi
	movq	%rax, (%rsp)
	call	localtime@PLT
	movdqu	(%rax), %xmm1
	leaq	32(%rsp), %rdi
	movl	32(%rax), %ecx
	movq	40(%rax), %rdx
	movdqu	16(%rax), %xmm0
	movq	48(%rax), %rax
	movaps	%xmm1, 32(%rsp)
	movl	%ecx, 64(%rsp)
	movq	%rdx, 72(%rsp)
	movaps	%xmm0, 48(%rsp)
	movq	%rax, 80(%rsp)
	call	timegm@PLT
	cltq
	subq	%rbx, %rax
	cmpq	$30, %rax
	jbe	.L4453
	cmpq	$59, %rax
	jbe	.L4454
	cmpq	$3599, %rax
	jbe	.L4455
	cmpq	$86399, %rax
	jbe	.L4456
	cmpq	$431999, %rax
	jbe	.L4457
	cmpq	$864000000, %rax
	jbe	.L4450
	leaq	.LC37(%rip), %rax
	xorl	%edx, %edx
	jmp	.L4445
	.p2align 4,,10
	.p2align 3
.L4454:
	leaq	.LC138(%rip), %rax
	movl	$2, %edx
.L4445:
	movq	88(%rsp), %rsi
	xorq	%fs:40, %rsi
	jne	.L4458
	addq	$96, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L4453:
	.cfi_restore_state
	leaq	.LC137(%rip), %rax
	movl	$3, %edx
	jmp	.L4445
	.p2align 4,,10
	.p2align 3
.L4456:
	shrq	$4, %rax
	movabsq	$655884233731895169, %rdx
	leaq	.LC140(%rip), %rdi
	mulq	%rdx
	xorl	%eax, %eax
	movq	%rdx, %rsi
	shrq	$3, %rsi
	call	_STR
	jmp	.L4445
	.p2align 4,,10
	.p2align 3
.L4455:
	movabsq	$-8608480567731124087, %rdx
	leaq	.LC139(%rip), %rdi
	mulq	%rdx
	xorl	%eax, %eax
	movq	%rdx, %rsi
	shrq	$5, %rsi
	call	_STR
	jmp	.L4445
	.p2align 4,,10
	.p2align 3
.L4457:
	movabsq	$-4454547087429121353, %rdx
	leaq	.LC141(%rip), %rdi
	mulq	%rdx
	xorl	%eax, %eax
	movq	%rdx, %rsi
	shrq	$16, %rsi
	call	_STR
	jmp	.L4445
	.p2align 4,,10
	.p2align 3
.L4450:
	movq	112(%rsp), %rax
	movq	120(%rsp), %rdx
	movl	$4, %esi
	movq	128(%rsp), %rcx
	movq	136(%rsp), %rbx
	movl	$3, %edi
	movq	%rax, (%rsp)
	movq	%rdx, 8(%rsp)
	movq	%rcx, 16(%rsp)
	movq	%rbx, 24(%rsp)
	pushq	%rbx
	.cfi_def_cfa_offset 120
	pushq	%rcx
	.cfi_def_cfa_offset 128
	pushq	%rdx
	.cfi_def_cfa_offset 136
	pushq	%rax
	.cfi_def_cfa_offset 144
	call	time__Time_get_fmt_date_str
	addq	$32, %rsp
	.cfi_def_cfa_offset 112
	jmp	.L4445
.L4458:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE476:
	.size	time__Time_relative, .-time__Time_relative
	.section	.text.time__day_of_week,"ax",@progbits
	.p2align 4,,15
	.globl	time__day_of_week
	.type	time__day_of_week, @function
time__day_of_week:
.LFB477:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movl	%esi, %r13d
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movl	$12, %esi
	movl	%edi, %ebp
	movl	%edx, %r12d
	movl	$4, %ecx
	subq	$104, %rsp
	.cfi_def_cfa_offset 144
	movl	$12, %edx
	movdqa	.LC142(%rip), %xmm0
	leaq	32(%rsp), %r8
	movq	%rsp, %rdi
	movq	%fs:40, %rax
	movq	%rax, 88(%rsp)
	xorl	%eax, %eax
	movaps	%xmm0, 32(%rsp)
	movdqa	.LC143(%rip), %xmm0
	movaps	%xmm0, 48(%rsp)
	movdqa	.LC144(%rip), %xmm0
	movaps	%xmm0, 64(%rsp)
	call	new_array_from_c_array
	xorl	%eax, %eax
	cmpl	$3, %r13d
	movl	$1374389535, %edx
	setl	%al
	leal	-1(%r13), %edi
	subl	%eax, %ebp
	leal	3(%rbp), %ecx
	testl	%ebp, %ebp
	movl	%ebp, %eax
	cmovns	%ebp, %ecx
	subq	$8, %rsp
	.cfi_def_cfa_offset 152
	imull	%edx
	sarl	$2, %ecx
	pushq	24(%rsp)
	.cfi_def_cfa_offset 160
	addl	%ebp, %ecx
	sarl	$31, %ebp
	pushq	24(%rsp)
	.cfi_def_cfa_offset 168
	movl	%ebp, %ebx
	pushq	24(%rsp)
	.cfi_def_cfa_offset 176
	movl	%edx, %eax
	sarl	$7, %edx
	sarl	$5, %eax
	subl	%ebp, %edx
	subl	%eax, %ebx
	addl	%ebx, %ecx
	leal	(%rcx,%rdx), %ebx
	call	array_get
	addl	(%rax), %ebx
	movl	$-1840700269, %edx
	addq	$32, %rsp
	.cfi_def_cfa_offset 144
	leal	-1(%r12,%rbx), %ecx
	movl	%ecx, %eax
	imull	%edx
	movl	%ecx, %eax
	sarl	$31, %eax
	addl	%ecx, %edx
	sarl	$2, %edx
	subl	%eax, %edx
	leal	0(,%rdx,8), %eax
	subl	%edx, %eax
	subl	%eax, %ecx
	movq	88(%rsp), %rsi
	xorq	%fs:40, %rsi
	jne	.L4463
	addq	$104, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	leal	1(%rcx), %eax
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L4463:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE477:
	.size	time__day_of_week, .-time__day_of_week
	.section	.text.time__Time_day_of_week,"ax",@progbits
	.p2align 4,,15
	.globl	time__Time_day_of_week
	.type	time__Time_day_of_week, @function
time__Time_day_of_week:
.LFB478:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movl	$12, %esi
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movl	$4, %ecx
	movl	$12, %edx
	subq	$104, %rsp
	.cfi_def_cfa_offset 144
	movdqa	.LC142(%rip), %xmm0
	leaq	32(%rsp), %r8
	movq	%rsp, %rdi
	movl	148(%rsp), %r13d
	movl	144(%rsp), %ebp
	movaps	%xmm0, 32(%rsp)
	movq	%fs:40, %rax
	movq	%rax, 88(%rsp)
	xorl	%eax, %eax
	movdqa	.LC143(%rip), %xmm0
	movl	152(%rsp), %r12d
	movaps	%xmm0, 48(%rsp)
	movdqa	.LC144(%rip), %xmm0
	movaps	%xmm0, 64(%rsp)
	call	new_array_from_c_array
	xorl	%eax, %eax
	cmpl	$3, %r13d
	movl	$1374389535, %edx
	setl	%al
	leal	-1(%r13), %edi
	subl	%eax, %ebp
	leal	3(%rbp), %ecx
	testl	%ebp, %ebp
	movl	%ebp, %eax
	cmovns	%ebp, %ecx
	subq	$8, %rsp
	.cfi_def_cfa_offset 152
	imull	%edx
	sarl	$2, %ecx
	pushq	24(%rsp)
	.cfi_def_cfa_offset 160
	addl	%ebp, %ecx
	sarl	$31, %ebp
	pushq	24(%rsp)
	.cfi_def_cfa_offset 168
	movl	%ebp, %ebx
	pushq	24(%rsp)
	.cfi_def_cfa_offset 176
	movl	%edx, %eax
	sarl	$7, %edx
	sarl	$5, %eax
	subl	%ebp, %edx
	subl	%eax, %ebx
	addl	%ebx, %ecx
	leal	(%rcx,%rdx), %ebx
	call	array_get
	addl	(%rax), %ebx
	movl	$-1840700269, %edx
	addq	$32, %rsp
	.cfi_def_cfa_offset 144
	leal	-1(%r12,%rbx), %ecx
	movl	%ecx, %eax
	imull	%edx
	movl	%ecx, %eax
	sarl	$31, %eax
	addl	%ecx, %edx
	sarl	$2, %edx
	subl	%eax, %edx
	leal	0(,%rdx,8), %eax
	subl	%edx, %eax
	subl	%eax, %ecx
	movq	88(%rsp), %rsi
	xorq	%fs:40, %rsi
	jne	.L4468
	addq	$104, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	leal	1(%rcx), %eax
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L4468:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE478:
	.size	time__Time_day_of_week, .-time__Time_day_of_week
	.section	.text.time__Time_weekday_str,"ax",@progbits
	.p2align 4,,15
	.globl	time__Time_weekday_str
	.type	time__Time_weekday_str, @function
time__Time_weekday_str:
.LFB479:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	movl	$12, %esi
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	movl	$4, %ecx
	movl	$12, %edx
	subq	$104, %rsp
	.cfi_def_cfa_offset 144
	movdqa	.LC142(%rip), %xmm0
	leaq	32(%rsp), %r8
	movq	%rsp, %rdi
	movl	148(%rsp), %r13d
	movl	144(%rsp), %ebp
	movaps	%xmm0, 32(%rsp)
	movq	%fs:40, %rax
	movq	%rax, 88(%rsp)
	xorl	%eax, %eax
	movdqa	.LC143(%rip), %xmm0
	movl	152(%rsp), %r12d
	movaps	%xmm0, 48(%rsp)
	movdqa	.LC144(%rip), %xmm0
	movaps	%xmm0, 64(%rsp)
	call	new_array_from_c_array
	xorl	%eax, %eax
	cmpl	$3, %r13d
	movl	$1374389535, %edx
	setl	%al
	leal	-1(%r13), %edi
	subl	%eax, %ebp
	leal	3(%rbp), %ecx
	testl	%ebp, %ebp
	movl	%ebp, %eax
	cmovns	%ebp, %ecx
	subq	$8, %rsp
	.cfi_def_cfa_offset 152
	imull	%edx
	sarl	$2, %ecx
	pushq	24(%rsp)
	.cfi_def_cfa_offset 160
	addl	%ebp, %ecx
	sarl	$31, %ebp
	pushq	24(%rsp)
	.cfi_def_cfa_offset 168
	movl	%ebp, %ebx
	pushq	24(%rsp)
	.cfi_def_cfa_offset 176
	movl	%edx, %eax
	sarl	$7, %edx
	sarl	$5, %eax
	subl	%ebp, %edx
	subl	%eax, %ebx
	addl	%ebx, %ecx
	leal	(%rcx,%rdx), %ebx
	call	array_get
	addl	(%rax), %ebx
	movl	$-1840700269, %edx
	movq	8+_const_time__days_string(%rip), %rsi
	movq	_const_time__days_string(%rip), %rdi
	addq	$32, %rsp
	.cfi_def_cfa_offset 144
	leal	-1(%r12,%rbx), %ecx
	movl	%ecx, %eax
	imull	%edx
	movl	%ecx, %eax
	sarl	$31, %eax
	addl	%ecx, %edx
	sarl	$2, %edx
	subl	%eax, %edx
	leal	0(,%rdx,8), %eax
	subl	%edx, %eax
	subl	%eax, %ecx
	leal	3(%rcx,%rcx,2), %ecx
	leal	-3(%rcx), %edx
	call	string_substr
	movq	88(%rsp), %rsi
	xorq	%fs:40, %rsi
	jne	.L4473
	addq	$104, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L4473:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE479:
	.size	time__Time_weekday_str, .-time__Time_weekday_str
	.section	.text.time__ticks,"ax",@progbits
	.p2align 4,,15
	.globl	time__ticks
	.type	time__ticks, @function
time__ticks:
.LFB480:
	.cfi_startproc
	pxor	%xmm0, %xmm0
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	xorl	%esi, %esi
	movq	%rsp, %rdi
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	movaps	%xmm0, (%rsp)
	call	gettimeofday@PLT
	movabsq	$2361183241434822607, %rsi
	movq	8(%rsp), %rdx
	imulq	$1000, (%rsp), %rcx
	shrq	$3, %rdx
	movq	%rdx, %rax
	mulq	%rsi
	shrq	$4, %rdx
	leaq	(%rcx,%rdx), %rax
	movq	24(%rsp), %rcx
	xorq	%fs:40, %rcx
	jne	.L4477
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L4477:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE480:
	.size	time__ticks, .-time__ticks
	.section	.text.time__sleep,"ax",@progbits
	.p2align 4,,15
	.globl	time__sleep
	.type	time__sleep, @function
time__sleep:
.LFB481:
	.cfi_startproc
	jmp	sleep@PLT
	.cfi_endproc
.LFE481:
	.size	time__sleep, .-time__sleep
	.section	.text.time__sleep_ms,"ax",@progbits
	.p2align 4,,15
	.globl	time__sleep_ms
	.type	time__sleep_ms, @function
time__sleep_ms:
.LFB482:
	.cfi_startproc
	imull	$1000, %edi, %edi
	jmp	usleep@PLT
	.cfi_endproc
.LFE482:
	.size	time__sleep_ms, .-time__sleep_ms
	.section	.text.time__usleep,"ax",@progbits
	.p2align 4,,15
	.globl	time__usleep
	.type	time__usleep, @function
time__usleep:
.LFB483:
	.cfi_startproc
	jmp	usleep@PLT
	.cfi_endproc
.LFE483:
	.size	time__usleep, .-time__usleep
	.section	.text.time__is_leap_year,"ax",@progbits
	.p2align 4,,15
	.globl	time__is_leap_year
	.type	time__is_leap_year, @function
time__is_leap_year:
.LFB484:
	.cfi_startproc
	xorl	%eax, %eax
	testb	$3, %dil
	jne	.L4481
	movl	%edi, %eax
	movl	$1374389535, %edx
	movl	%edi, %esi
	imull	%edx
	sarl	$31, %esi
	movl	$1, %eax
	movl	%edx, %ecx
	sarl	$5, %ecx
	subl	%esi, %ecx
	imull	$100, %ecx, %ecx
	cmpl	%ecx, %edi
	jne	.L4481
	sarl	$7, %edx
	xorl	%eax, %eax
	subl	%esi, %edx
	imull	$400, %edx, %edx
	cmpl	%edx, %edi
	sete	%al
.L4481:
	rep ret
	.cfi_endproc
.LFE484:
	.size	time__is_leap_year, .-time__is_leap_year
	.section	.rodata.str1.1
.LC145:
	.string	"Invalid month: %d"
	.section	.text.time__days_in_month,"ax",@progbits
	.p2align 4,,15
	.globl	time__days_in_month
	.type	time__days_in_month, @function
time__days_in_month:
.LFB485:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbx
	leal	-1(%rsi), %edi
	subq	$24, %rsp
	.cfi_def_cfa_offset 48
	movq	%fs:40, %rax
	movq	%rax, 8(%rsp)
	xorl	%eax, %eax
	cmpl	$11, %edi
	ja	.L4494
	xorl	%ebp, %ebp
	cmpl	$2, %esi
	je	.L4495
.L4488:
	subq	$8, %rsp
	.cfi_def_cfa_offset 56
	pushq	16+_const_time__month_days(%rip)
	.cfi_def_cfa_offset 64
	pushq	8+_const_time__month_days(%rip)
	.cfi_def_cfa_offset 72
	pushq	_const_time__month_days(%rip)
	.cfi_def_cfa_offset 80
	call	array_get
	addl	(%rax), %ebp
	movl	$4, %edx
	movq	%rbx, %rdi
	movl	%ebp, 36(%rsp)
	addq	$32, %rsp
	.cfi_def_cfa_offset 48
	leaq	4(%rsp), %rsi
	call	opt_ok
.L4485:
	movq	8(%rsp), %rcx
	xorq	%fs:40, %rcx
	movq	%rbx, %rax
	jne	.L4496
	addq	$24, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L4495:
	.cfi_restore_state
	testb	$3, %dl
	movl	%edx, %ecx
	jne	.L4488
	movl	%ecx, %eax
	movl	$1374389535, %edx
	movl	%ecx, %esi
	imull	%edx
	sarl	$31, %esi
	movl	$1, %ebp
	movl	%edx, %eax
	sarl	$5, %eax
	subl	%esi, %eax
	imull	$100, %eax, %eax
	cmpl	%eax, %ecx
	jne	.L4488
	sarl	$7, %edx
	xorl	%ebp, %ebp
	subl	%esi, %edx
	imull	$400, %edx, %eax
	cmpl	%eax, %ecx
	sete	%bpl
	jmp	.L4488
	.p2align 4,,10
	.p2align 3
.L4494:
	leaq	.LC145(%rip), %rdi
	call	_STR
	movl	$54, %ecx
	movq	%rax, %rsi
	movq	%rbx, %rdi
	xorl	%eax, %eax
	rep stosq
	movq	%rsi, 400(%rbx)
	movl	%edx, 408(%rbx)
	jmp	.L4485
.L4496:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE485:
	.size	time__days_in_month, .-time__days_in_month
	.section	.text.time__Time_str,"ax",@progbits
	.p2align 4,,15
	.globl	time__Time_str
	.type	time__Time_str, @function
time__Time_str:
.LFB486:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	leaq	.LC119(%rip), %rdi
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	xorl	%eax, %eax
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	movl	124(%rsp), %r12d
	movl	128(%rsp), %ebp
	movl	132(%rsp), %ebx
	movl	112(%rsp), %r10d
	movl	116(%rsp), %r9d
	movl	120(%rsp), %r8d
	movl	%r12d, %esi
	movl	%ebp, %edx
	movq	136(%rsp), %r15
	movl	%ebx, %ecx
	movl	%r10d, 12(%rsp)
	movl	%r9d, 8(%rsp)
	movl	%r8d, 4(%rsp)
	call	_STR
	movl	12(%rsp), %r10d
	movl	8(%rsp), %r9d
	movl	$8, %esi
	movl	4(%rsp), %r8d
	movl	%r12d, 28(%rsp)
	movl	$1, %edi
	movl	%ebp, 32(%rsp)
	movl	%ebx, 36(%rsp)
	movq	%rax, %r13
	movl	%r10d, 16(%rsp)
	movl	%r9d, 20(%rsp)
	movq	%rdx, %r14
	movl	%r8d, 24(%rsp)
	movq	%r15, 40(%rsp)
	pushq	40(%rsp)
	.cfi_def_cfa_offset 120
	pushq	40(%rsp)
	.cfi_def_cfa_offset 128
	pushq	40(%rsp)
	.cfi_def_cfa_offset 136
	pushq	40(%rsp)
	.cfi_def_cfa_offset 144
	call	time__Time_get_fmt_date_str
	leal	2(%rdx), %edi
	movq	%rdx, %rbx
	addq	$32, %rsp
	.cfi_def_cfa_offset 112
	movq	%rax, %r12
	movl	%edx, %r15d
	leal	1(%rdx), %ebp
	call	v_malloc
	testl	%ebx, %ebx
	movq	%rax, %rdi
	jle	.L4498
	leaq	16(%r12), %rax
	cmpq	%rax, %rdi
	leaq	16(%rdi), %rax
	setnb	%dl
	cmpq	%rax, %r12
	setnb	%al
	orb	%al, %dl
	je	.L4499
	cmpl	$22, %ebx
	jbe	.L4499
	movq	%r12, %rdx
	leal	-1(%rbx), %ecx
	negq	%rdx
	andl	$15, %edx
	leal	15(%rdx), %eax
	cmpl	%eax, %ecx
	jb	.L4508
	testl	%edx, %edx
	je	.L4509
	movzbl	(%r12), %eax
	cmpl	$1, %edx
	movb	%al, (%rdi)
	je	.L4510
	movzbl	1(%r12), %eax
	cmpl	$2, %edx
	movb	%al, 1(%rdi)
	je	.L4511
	movzbl	2(%r12), %eax
	cmpl	$3, %edx
	movb	%al, 2(%rdi)
	je	.L4512
	movzbl	3(%r12), %eax
	cmpl	$4, %edx
	movb	%al, 3(%rdi)
	je	.L4513
	movzbl	4(%r12), %eax
	cmpl	$5, %edx
	movb	%al, 4(%rdi)
	je	.L4514
	movzbl	5(%r12), %eax
	cmpl	$6, %edx
	movb	%al, 5(%rdi)
	je	.L4515
	movzbl	6(%r12), %eax
	cmpl	$7, %edx
	movb	%al, 6(%rdi)
	je	.L4516
	movzbl	7(%r12), %eax
	cmpl	$8, %edx
	movb	%al, 7(%rdi)
	je	.L4517
	movzbl	8(%r12), %eax
	cmpl	$9, %edx
	movb	%al, 8(%rdi)
	je	.L4518
	movzbl	9(%r12), %eax
	cmpl	$10, %edx
	movb	%al, 9(%rdi)
	je	.L4519
	movzbl	10(%r12), %eax
	cmpl	$11, %edx
	movb	%al, 10(%rdi)
	je	.L4520
	movzbl	11(%r12), %eax
	cmpl	$12, %edx
	movb	%al, 11(%rdi)
	je	.L4521
	movzbl	12(%r12), %eax
	cmpl	$13, %edx
	movb	%al, 12(%rdi)
	je	.L4522
	movzbl	13(%r12), %eax
	cmpl	$15, %edx
	movb	%al, 13(%rdi)
	jne	.L4523
	movzbl	14(%r12), %eax
	movb	%al, 14(%rdi)
	movl	$15, %eax
	.p2align 4,,10
	.p2align 3
.L4501:
	movl	%ebx, %r9d
	movl	%edx, %esi
	xorl	%ecx, %ecx
	subl	%edx, %r9d
	leaq	(%r12,%rsi), %r8
	xorl	%edx, %edx
	movl	%r9d, %r10d
	addq	%rdi, %rsi
	shrl	$4, %r10d
	.p2align 4,,10
	.p2align 3
.L4503:
	movdqa	(%r8,%rdx), %xmm0
	addl	$1, %ecx
	movups	%xmm0, (%rsi,%rdx)
	addq	$16, %rdx
	cmpl	%ecx, %r10d
	ja	.L4503
	movl	%r9d, %edx
	andl	$-16, %edx
	addl	%edx, %eax
	cmpl	%edx, %r9d
	je	.L4498
.L4500:
	cltq
	.p2align 4,,10
	.p2align 3
.L4505:
	movzbl	(%r12,%rax), %edx
	movb	%dl, (%rdi,%rax)
	addq	$1, %rax
	cmpl	%eax, %r15d
	jg	.L4505
.L4498:
	movslq	%ebp, %rax
	movslq	%ebx, %rbx
	movl	%ebp, %esi
	movb	$32, (%rdi,%rbx)
	movq	%r13, %rdx
	movq	%r14, %rcx
	movb	$0, (%rdi,%rax)
	call	string_add
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movl	%edx, %edx
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L4510:
	.cfi_restore_state
	movl	$1, %eax
	jmp	.L4501
	.p2align 4,,10
	.p2align 3
.L4499:
	leal	-1(%rbx), %ecx
	xorl	%eax, %eax
	addq	$1, %rcx
	.p2align 4,,10
	.p2align 3
.L4506:
	movzbl	(%r12,%rax), %edx
	movb	%dl, (%rdi,%rax)
	addq	$1, %rax
	cmpq	%rcx, %rax
	jne	.L4506
	jmp	.L4498
	.p2align 4,,10
	.p2align 3
.L4511:
	movl	$2, %eax
	jmp	.L4501
	.p2align 4,,10
	.p2align 3
.L4508:
	xorl	%eax, %eax
	jmp	.L4500
	.p2align 4,,10
	.p2align 3
.L4512:
	movl	$3, %eax
	jmp	.L4501
.L4513:
	movl	$4, %eax
	jmp	.L4501
.L4516:
	movl	$7, %eax
	jmp	.L4501
.L4514:
	movl	$5, %eax
	jmp	.L4501
.L4515:
	movl	$6, %eax
	jmp	.L4501
.L4509:
	xorl	%eax, %eax
	jmp	.L4501
.L4517:
	movl	$8, %eax
	jmp	.L4501
.L4518:
	movl	$9, %eax
	jmp	.L4501
.L4519:
	movl	$10, %eax
	jmp	.L4501
.L4520:
	movl	$11, %eax
	jmp	.L4501
.L4521:
	movl	$12, %eax
	jmp	.L4501
.L4522:
	movl	$13, %eax
	jmp	.L4501
.L4523:
	movl	$14, %eax
	jmp	.L4501
	.cfi_endproc
.LFE486:
	.size	time__Time_str, .-time__Time_str
	.section	.text.time__convert_ctime,"ax",@progbits
	.p2align 4,,15
	.globl	time__convert_ctime
	.type	time__convert_ctime, @function
time__convert_ctime:
.LFB487:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rdi, %rbx
	subq	$88, %rsp
	.cfi_def_cfa_offset 144
	movq	%fs:40, %rax
	movq	%rax, 72(%rsp)
	xorl	%eax, %eax
	movl	164(%rsp), %eax
	movl	156(%rsp), %edx
	leaq	16(%rsp), %rdi
	movdqu	144(%rsp), %xmm0
	movl	152(%rsp), %r15d
	movl	148(%rsp), %r14d
	leal	1900(%rax), %r12d
	movl	160(%rsp), %eax
	movl	%edx, 12(%rsp)
	movaps	%xmm0, 16(%rsp)
	movl	144(%rsp), %r13d
	leal	1(%rax), %ebp
	movdqu	160(%rsp), %xmm0
	movq	192(%rsp), %rax
	movaps	%xmm0, 32(%rsp)
	movdqu	176(%rsp), %xmm0
	movq	%rax, 64(%rsp)
	movaps	%xmm0, 48(%rsp)
	call	timegm@PLT
	movq	72(%rsp), %rcx
	xorq	%fs:40, %rcx
	cltq
	movl	12(%rsp), %edx
	movl	%r12d, (%rbx)
	movl	%ebp, 4(%rbx)
	movl	%r15d, 12(%rbx)
	movl	%r14d, 16(%rbx)
	movl	%r13d, 20(%rbx)
	movl	%edx, 8(%rbx)
	movq	%rax, 24(%rbx)
	jne	.L4537
	addq	$88, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%rbx, %rax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L4537:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE487:
	.size	time__convert_ctime, .-time__convert_ctime
	.section	.text.time__make_unix_time,"ax",@progbits
	.p2align 4,,15
	.globl	time__make_unix_time
	.type	time__make_unix_time, @function
time__make_unix_time:
.LFB488:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	leaq	16(%rsp), %rdi
	call	timegm@PLT
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE488:
	.size	time__make_unix_time, .-time__make_unix_time
	.section	.text.time__calculate_date_from_offset,"ax",@progbits
	.p2align 4,,15
	.globl	time__calculate_date_from_offset
	.type	time__calculate_date_from_offset, @function
time__calculate_date_from_offset:
.LFB490:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	leal	-11323(%rdi), %eax
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	cltd
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	movl	_const_time__days_per_100_years(%rip), %ecx
	idivl	_const_time__days_per_400_years(%rip)
	imull	$400, %eax, %r12d
	leal	0(,%rcx,4), %eax
	cmpl	%edx, %eax
	je	.L4565
	movl	%edx, %eax
	cltd
	idivl	%ecx
	imull	$100, %eax, %eax
	leal	2001(%r12,%rax), %r12d
	movl	%edx, %eax
.L4542:
	movl	_const_time__days_per_4_years(%rip), %edi
	leal	0(,%rdi,4), %esi
	leal	(%rsi,%rdi), %ecx
	leal	(%rcx,%rcx,4), %ecx
	cmpl	%eax, %ecx
	je	.L4566
	cltd
	idivl	%edi
	leal	(%r12,%rax,4), %r12d
	movl	%edx, %ebp
.L4544:
	cmpl	$1460, %ebp
	je	.L4567
	movl	%ebp, %eax
	movl	$-1282606671, %ecx
	imull	%ecx
	leal	(%rdx,%rbp), %eax
	movl	%ebp, %edx
	sarl	$31, %edx
	sarl	$8, %eax
	subl	%edx, %eax
	addl	%eax, %r12d
	imull	$365, %eax, %eax
	subl	%eax, %ebp
	jns	.L4547
	subl	$1, %r12d
	movl	%r12d, %ecx
	andl	$3, %ecx
	je	.L4568
.L4548:
	addl	$365, %ebp
.L4546:
	testl	%ecx, %ecx
	je	.L4569
.L4551:
	movl	$138547333, %edx
	movl	%ebp, %eax
	movl	%ebp, %ebx
	mull	%edx
	leaq	8+_const_time__days_before(%rip), %r15
	leaq	-8(%r15), %r14
	subl	%edx, %ebx
	shrl	%ebx
	addl	%edx, %ebx
	shrl	$4, %ebx
	jmp	.L4555
	.p2align 4,,10
	.p2align 3
.L4559:
	movl	%r13d, %ebx
.L4555:
	leal	1(%rbx), %r13d
	subq	$8, %rsp
	.cfi_def_cfa_offset 104
	pushq	8(%r15)
	.cfi_def_cfa_offset 112
	pushq	(%r15)
	.cfi_def_cfa_offset 120
	pushq	(%r14)
	.cfi_def_cfa_offset 128
	movl	%r13d, %edi
	call	array_get
	addq	$32, %rsp
	.cfi_def_cfa_offset 96
	cmpl	%ebp, (%rax)
	jle	.L4559
	jmp	.L4556
	.p2align 4,,10
	.p2align 3
.L4558:
	testl	%ebx, %ebx
	je	.L4560
	subl	$1, %ebx
.L4556:
	subq	$8, %rsp
	.cfi_def_cfa_offset 104
	pushq	8(%r15)
	.cfi_def_cfa_offset 112
	pushq	(%r15)
	.cfi_def_cfa_offset 120
	pushq	(%r14)
	.cfi_def_cfa_offset 128
	movl	%ebx, %edi
	call	array_get
	addq	$32, %rsp
	.cfi_def_cfa_offset 96
	cmpl	%ebp, (%rax)
	jg	.L4558
	leal	1(%rbx), %r13d
.L4557:
	subq	$8, %rsp
	.cfi_def_cfa_offset 104
	pushq	16+_const_time__days_before(%rip)
	.cfi_def_cfa_offset 112
	pushq	8+_const_time__days_before(%rip)
	.cfi_def_cfa_offset 120
	pushq	_const_time__days_before(%rip)
	.cfi_def_cfa_offset 128
	movl	%ebx, %edi
	call	array_get
	subl	(%rax), %ebp
	movl	%r12d, 52(%rsp)
	movl	%r13d, 56(%rsp)
	addl	$1, %ebp
	movl	%ebp, 60(%rsp)
	addq	$32, %rsp
	.cfi_def_cfa_offset 96
.L4554:
	movl	28(%rsp), %edx
	movq	20(%rsp), %rax
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L4560:
	.cfi_restore_state
	movl	$1, %r13d
	jmp	.L4557
	.p2align 4,,10
	.p2align 3
.L4569:
	movl	%r12d, %eax
	movl	$1374389535, %edx
	movl	%r12d, %esi
	imull	%edx
	movl	%r12d, %eax
	sarl	$31, %eax
	sarl	$5, %edx
	subl	%eax, %edx
	imull	$100, %edx, %eax
	subl	%eax, %esi
	movl	%esi, %eax
.L4550:
	testl	%eax, %eax
	jne	.L4552
	movl	%r12d, %eax
	movl	$1374389535, %edx
	imull	%edx
	movl	%r12d, %eax
	sarl	$31, %eax
	sarl	$7, %edx
	subl	%eax, %edx
	imull	$400, %edx, %eax
	cmpl	%eax, %r12d
	jne	.L4551
.L4552:
	cmpl	$59, %ebp
	jg	.L4570
	jne	.L4551
	movabsq	$124554051586, %rax
	movl	%r12d, 20(%rsp)
	movq	%rax, 24(%rsp)
	jmp	.L4554
	.p2align 4,,10
	.p2align 3
.L4565:
	addl	$2301, %r12d
	movl	%ecx, %eax
	jmp	.L4542
	.p2align 4,,10
	.p2align 3
.L4567:
	addl	$3, %r12d
	movl	$365, %ebp
	movl	%r12d, %ecx
	andl	$3, %ecx
	jmp	.L4546
	.p2align 4,,10
	.p2align 3
.L4566:
	subl	%esi, %edi
	addl	$96, %r12d
	leal	(%rax,%rdi,8), %ebp
	jmp	.L4544
	.p2align 4,,10
	.p2align 3
.L4570:
	subl	$1, %ebp
	jmp	.L4551
	.p2align 4,,10
	.p2align 3
.L4568:
	movl	%r12d, %eax
	movl	$1374389535, %edx
	movl	%r12d, %esi
	imull	%edx
	sarl	$31, %esi
	movl	%r12d, %edi
	movl	%edx, %eax
	sarl	$5, %eax
	subl	%esi, %eax
	imull	$100, %eax, %eax
	subl	%eax, %edi
	movl	%edi, %eax
	jne	.L4549
	sarl	$7, %edx
	subl	%esi, %edx
	imull	$400, %edx, %edx
	cmpl	%edx, %r12d
	jne	.L4548
.L4549:
	addl	$366, %ebp
	jmp	.L4550
	.p2align 4,,10
	.p2align 3
.L4547:
	movl	%r12d, %ecx
	andl	$3, %ecx
	jmp	.L4546
	.cfi_endproc
.LFE490:
	.size	time__calculate_date_from_offset, .-time__calculate_date_from_offset
	.section	.text.time__unix,"ax",@progbits
	.p2align 4,,15
	.globl	time__unix
	.type	time__unix, @function
time__unix:
.LFB489:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movslq	%esi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movl	%ebp, %eax
	movq	%rdi, %rbx
	subq	$24, %rsp
	.cfi_def_cfa_offset 48
	cltd
	idivl	_const_time__seconds_per_day(%rip)
	cmpl	$-2147483648, %edx
	adcl	$-1, %eax
	movl	%eax, %edi
	call	time__calculate_date_from_offset
	movl	_const_time__seconds_per_day(%rip), %ecx
	movq	%rax, %rsi
	shrq	$32, %rax
	movq	%rax, %r8
	movl	%ebp, %eax
	movq	%rdx, %rdi
	cltd
	movq	%rbp, 24(%rbx)
	movl	%esi, (%rbx)
	idivl	%ecx
	movl	%r8d, 4(%rbx)
	movl	%edi, 8(%rbx)
	leal	(%rdx,%rcx), %eax
	testl	%edx, %edx
	cmovns	%edx, %eax
	cltd
	idivl	_const_time__seconds_per_hour(%rip)
	movl	%edx, %ecx
	movl	%eax, 12(%rbx)
	movl	$-2004318071, %edx
	movl	%ecx, %eax
	imull	%edx
	movl	%ecx, %eax
	sarl	$31, %eax
	addl	%ecx, %edx
	sarl	$5, %edx
	subl	%eax, %edx
	movl	%ecx, %eax
	movl	%edx, 16(%rbx)
	imull	$60, %edx, %edx
	subl	%edx, %eax
	movl	%eax, 20(%rbx)
	addq	$24, %rsp
	.cfi_def_cfa_offset 24
	movq	%rbx, %rax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE489:
	.size	time__unix, .-time__unix
	.section	.text.time__Time_add_days,"ax",@progbits
	.p2align 4,,15
	.globl	time__Time_add_days
	.type	time__Time_add_days, @function
time__Time_add_days:
.LFB474:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movq	%rdi, %rbp
	imull	$86400, %esi, %ebx
	subq	$24, %rsp
	.cfi_def_cfa_offset 48
	addl	72(%rsp), %ebx
	movl	%ebx, %eax
	cltd
	idivl	_const_time__seconds_per_day(%rip)
	cmpl	$-2147483648, %edx
	adcl	$-1, %eax
	movl	%eax, %edi
	call	time__calculate_date_from_offset
	movl	_const_time__seconds_per_day(%rip), %ecx
	movq	%rax, %rsi
	shrq	$32, %rax
	movq	%rax, %r8
	movl	%ebx, %eax
	movq	%rdx, %rdi
	cltd
	movslq	%ebx, %rbx
	movl	%esi, 0(%rbp)
	idivl	%ecx
	movl	%r8d, 4(%rbp)
	movl	%edi, 8(%rbp)
	movq	%rbx, 24(%rbp)
	leal	(%rdx,%rcx), %eax
	testl	%edx, %edx
	cmovns	%edx, %eax
	cltd
	idivl	_const_time__seconds_per_hour(%rip)
	movl	%edx, %ecx
	movl	%eax, 12(%rbp)
	movl	$-2004318071, %edx
	movl	%ecx, %eax
	imull	%edx
	movl	%ecx, %eax
	sarl	$31, %eax
	addl	%ecx, %edx
	sarl	$5, %edx
	subl	%eax, %edx
	movl	%ecx, %eax
	movl	%edx, 16(%rbp)
	imull	$60, %edx, %edx
	subl	%edx, %eax
	movl	%eax, 20(%rbp)
	addq	$24, %rsp
	.cfi_def_cfa_offset 24
	movq	%rbp, %rax
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE474:
	.size	time__Time_add_days, .-time__Time_add_days
	.section	.text.time__calculate_time_from_offset,"ax",@progbits
	.p2align 4,,15
	.globl	time__calculate_time_from_offset
	.type	time__calculate_time_from_offset, @function
time__calculate_time_from_offset:
.LFB491:
	.cfi_startproc
	testl	%edi, %edi
	movl	%edi, %eax
	jns	.L4580
	addl	_const_time__seconds_per_day(%rip), %eax
.L4580:
	cltd
	movl	$-2004318071, %ecx
	idivl	_const_time__seconds_per_hour(%rip)
	movl	%eax, -20(%rsp)
	movl	%edx, %eax
	movl	%edx, %esi
	imull	%ecx
	movl	%esi, %eax
	sarl	$31, %eax
	leal	(%rdx,%rsi), %ecx
	movl	%esi, %edx
	sarl	$5, %ecx
	subl	%eax, %ecx
	movl	%ecx, -16(%rsp)
	movq	-20(%rsp), %rax
	imull	$60, %ecx, %ecx
	subl	%ecx, %edx
	ret
	.cfi_endproc
.LFE491:
	.size	time__calculate_time_from_offset, .-time__calculate_time_from_offset
	.section	.text.math__bits__leading_zeros_8,"ax",@progbits
	.p2align 4,,15
	.globl	math__bits__leading_zeros_8
	.type	math__bits__leading_zeros_8, @function
math__bits__leading_zeros_8:
.LFB492:
	.cfi_startproc
	subq	$16, %rsp
	.cfi_def_cfa_offset 24
	pushq	16+_const_math__bits__len_8_tab(%rip)
	.cfi_def_cfa_offset 32
	pushq	8+_const_math__bits__len_8_tab(%rip)
	.cfi_def_cfa_offset 40
	pushq	_const_math__bits__len_8_tab(%rip)
	.cfi_def_cfa_offset 48
	movzbl	%dil, %edi
	call	array_get
	movzbl	(%rax), %edx
	movl	$8, %eax
	addq	$40, %rsp
	.cfi_def_cfa_offset 8
	subl	%edx, %eax
	ret
	.cfi_endproc
.LFE492:
	.size	math__bits__leading_zeros_8, .-math__bits__leading_zeros_8
	.section	.text.math__bits__leading_zeros_16,"ax",@progbits
	.p2align 4,,15
	.globl	math__bits__leading_zeros_16
	.type	math__bits__leading_zeros_16, @function
math__bits__leading_zeros_16:
.LFB493:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	xorl	%ebx, %ebx
	cmpw	$255, %di
	movl	%edi, %eax
	jbe	.L4584
	shrw	$8, %ax
	movl	$8, %ebx
.L4584:
	subq	$8, %rsp
	.cfi_def_cfa_offset 24
	pushq	16+_const_math__bits__len_8_tab(%rip)
	.cfi_def_cfa_offset 32
	pushq	8+_const_math__bits__len_8_tab(%rip)
	.cfi_def_cfa_offset 40
	pushq	_const_math__bits__len_8_tab(%rip)
	.cfi_def_cfa_offset 48
	movzwl	%ax, %edi
	call	array_get
	movzbl	(%rax), %edx
	addq	$32, %rsp
	.cfi_def_cfa_offset 16
	movl	$16, %eax
	addl	%ebx, %edx
	subl	%edx, %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE493:
	.size	math__bits__leading_zeros_16, .-math__bits__leading_zeros_16
	.section	.text.math__bits__leading_zeros_32,"ax",@progbits
	.p2align 4,,15
	.globl	math__bits__leading_zeros_32
	.type	math__bits__leading_zeros_32, @function
math__bits__leading_zeros_32:
.LFB494:
	.cfi_startproc
	cmpl	$65535, %edi
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	jbe	.L4591
	shrl	$16, %edi
	movl	$24, %eax
	movl	$16, %ebx
.L4589:
	cmpl	$255, %edi
	jbe	.L4590
	shrl	$8, %edi
	movl	%eax, %ebx
.L4590:
	subq	$8, %rsp
	.cfi_def_cfa_offset 24
	pushq	16+_const_math__bits__len_8_tab(%rip)
	.cfi_def_cfa_offset 32
	pushq	8+_const_math__bits__len_8_tab(%rip)
	.cfi_def_cfa_offset 40
	pushq	_const_math__bits__len_8_tab(%rip)
	.cfi_def_cfa_offset 48
	call	array_get
	movzbl	(%rax), %edx
	addq	$32, %rsp
	.cfi_def_cfa_offset 16
	movl	$32, %eax
	addl	%ebx, %edx
	subl	%edx, %eax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L4591:
	.cfi_restore_state
	movl	$8, %eax
	xorl	%ebx, %ebx
	jmp	.L4589
	.cfi_endproc
.LFE494:
	.size	math__bits__leading_zeros_32, .-math__bits__leading_zeros_32
	.section	.text.math__bits__leading_zeros_64,"ax",@progbits
	.p2align 4,,15
	.globl	math__bits__leading_zeros_64
	.type	math__bits__leading_zeros_64, @function
math__bits__leading_zeros_64:
.LFB495:
	.cfi_startproc
	movl	$4294967295, %eax
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	cmpq	%rax, %rdi
	jbe	.L4597
	shrq	$32, %rdi
	movl	$48, %eax
	movl	$32, %ebx
.L4594:
	cmpq	$65535, %rdi
	jbe	.L4595
	shrq	$16, %rdi
	movl	%eax, %ebx
.L4595:
	cmpq	$255, %rdi
	jbe	.L4596
	shrq	$8, %rdi
	addl	$8, %ebx
.L4596:
	subq	$8, %rsp
	.cfi_def_cfa_offset 24
	pushq	16+_const_math__bits__len_8_tab(%rip)
	.cfi_def_cfa_offset 32
	pushq	8+_const_math__bits__len_8_tab(%rip)
	.cfi_def_cfa_offset 40
	pushq	_const_math__bits__len_8_tab(%rip)
	.cfi_def_cfa_offset 48
	call	array_get
	movzbl	(%rax), %edx
	addq	$32, %rsp
	.cfi_def_cfa_offset 16
	movl	$64, %eax
	addl	%ebx, %edx
	subl	%edx, %eax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L4597:
	.cfi_restore_state
	movl	$16, %eax
	xorl	%ebx, %ebx
	jmp	.L4594
	.cfi_endproc
.LFE495:
	.size	math__bits__leading_zeros_64, .-math__bits__leading_zeros_64
	.section	.text.math__bits__trailing_zeros_8,"ax",@progbits
	.p2align 4,,15
	.globl	math__bits__trailing_zeros_8
	.type	math__bits__trailing_zeros_8, @function
math__bits__trailing_zeros_8:
.LFB496:
	.cfi_startproc
	subq	$16, %rsp
	.cfi_def_cfa_offset 24
	pushq	16+_const_math__bits__ntz_8_tab(%rip)
	.cfi_def_cfa_offset 32
	pushq	8+_const_math__bits__ntz_8_tab(%rip)
	.cfi_def_cfa_offset 40
	pushq	_const_math__bits__ntz_8_tab(%rip)
	.cfi_def_cfa_offset 48
	movzbl	%dil, %edi
	call	array_get
	movzbl	(%rax), %eax
	addq	$40, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE496:
	.size	math__bits__trailing_zeros_8, .-math__bits__trailing_zeros_8
	.section	.text.math__bits__trailing_zeros_16,"ax",@progbits
	.p2align 4,,15
	.globl	math__bits__trailing_zeros_16
	.type	math__bits__trailing_zeros_16, @function
math__bits__trailing_zeros_16:
.LFB497:
	.cfi_startproc
	testw	%di, %di
	je	.L4604
	movzwl	%di, %edi
	subq	$16, %rsp
	.cfi_def_cfa_offset 24
	pushq	16+_const_math__bits__de_bruijn32tab(%rip)
	.cfi_def_cfa_offset 32
	movl	%edi, %eax
	pushq	8+_const_math__bits__de_bruijn32tab(%rip)
	.cfi_def_cfa_offset 40
	pushq	_const_math__bits__de_bruijn32tab(%rip)
	.cfi_def_cfa_offset 48
	negl	%eax
	andl	%eax, %edi
	imull	_const_math__bits__de_bruijn32(%rip), %edi
	shrl	$27, %edi
	call	array_get
	movzbl	(%rax), %eax
	addq	$40, %rsp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L4604:
	movl	$16, %eax
	ret
	.cfi_endproc
.LFE497:
	.size	math__bits__trailing_zeros_16, .-math__bits__trailing_zeros_16
	.section	.text.math__bits__trailing_zeros_32,"ax",@progbits
	.p2align 4,,15
	.globl	math__bits__trailing_zeros_32
	.type	math__bits__trailing_zeros_32, @function
math__bits__trailing_zeros_32:
.LFB498:
	.cfi_startproc
	testl	%edi, %edi
	je	.L4613
	movl	%edi, %eax
	negl	%edi
	subq	$16, %rsp
	.cfi_def_cfa_offset 24
	andl	%eax, %edi
	pushq	16+_const_math__bits__de_bruijn32tab(%rip)
	.cfi_def_cfa_offset 32
	pushq	8+_const_math__bits__de_bruijn32tab(%rip)
	.cfi_def_cfa_offset 40
	imull	_const_math__bits__de_bruijn32(%rip), %edi
	pushq	_const_math__bits__de_bruijn32tab(%rip)
	.cfi_def_cfa_offset 48
	shrl	$27, %edi
	call	array_get
	movzbl	(%rax), %eax
	addq	$40, %rsp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L4613:
	movl	$32, %eax
	ret
	.cfi_endproc
.LFE498:
	.size	math__bits__trailing_zeros_32, .-math__bits__trailing_zeros_32
	.section	.text.math__bits__trailing_zeros_64,"ax",@progbits
	.p2align 4,,15
	.globl	math__bits__trailing_zeros_64
	.type	math__bits__trailing_zeros_64, @function
math__bits__trailing_zeros_64:
.LFB499:
	.cfi_startproc
	testq	%rdi, %rdi
	je	.L4622
	movq	%rdi, %rax
	negq	%rdi
	subq	$16, %rsp
	.cfi_def_cfa_offset 24
	andq	%rax, %rdi
	pushq	16+_const_math__bits__de_bruijn64tab(%rip)
	.cfi_def_cfa_offset 32
	pushq	8+_const_math__bits__de_bruijn64tab(%rip)
	.cfi_def_cfa_offset 40
	imulq	_const_math__bits__de_bruijn64(%rip), %rdi
	pushq	_const_math__bits__de_bruijn64tab(%rip)
	.cfi_def_cfa_offset 48
	shrq	$58, %rdi
	call	array_get
	movzbl	(%rax), %eax
	addq	$40, %rsp
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L4622:
	movl	$64, %eax
	ret
	.cfi_endproc
.LFE499:
	.size	math__bits__trailing_zeros_64, .-math__bits__trailing_zeros_64
	.section	.text.math__bits__ones_count_8,"ax",@progbits
	.p2align 4,,15
	.globl	math__bits__ones_count_8
	.type	math__bits__ones_count_8, @function
math__bits__ones_count_8:
.LFB500:
	.cfi_startproc
	subq	$16, %rsp
	.cfi_def_cfa_offset 24
	pushq	16+_const_math__bits__pop_8_tab(%rip)
	.cfi_def_cfa_offset 32
	pushq	8+_const_math__bits__pop_8_tab(%rip)
	.cfi_def_cfa_offset 40
	pushq	_const_math__bits__pop_8_tab(%rip)
	.cfi_def_cfa_offset 48
	movzbl	%dil, %edi
	call	array_get
	movzbl	(%rax), %eax
	addq	$40, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE500:
	.size	math__bits__ones_count_8, .-math__bits__ones_count_8
	.section	.text.math__bits__ones_count_16,"ax",@progbits
	.p2align 4,,15
	.globl	math__bits__ones_count_16
	.type	math__bits__ones_count_16, @function
math__bits__ones_count_16:
.LFB501:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movl	%edi, %ebx
	movzbl	%bh, %edi
	subq	$16, %rsp
	.cfi_def_cfa_offset 40
	pushq	16+_const_math__bits__pop_8_tab(%rip)
	.cfi_def_cfa_offset 48
	pushq	8+_const_math__bits__pop_8_tab(%rip)
	.cfi_def_cfa_offset 56
	pushq	_const_math__bits__pop_8_tab(%rip)
	.cfi_def_cfa_offset 64
	call	array_get
	addq	$24, %rsp
	.cfi_def_cfa_offset 40
	movzbl	(%rax), %ebp
	pushq	16+_const_math__bits__pop_8_tab(%rip)
	.cfi_def_cfa_offset 48
	pushq	8+_const_math__bits__pop_8_tab(%rip)
	.cfi_def_cfa_offset 56
	pushq	_const_math__bits__pop_8_tab(%rip)
	.cfi_def_cfa_offset 64
	movzbl	%bl, %edi
	call	array_get
	movzbl	(%rax), %eax
	addq	$40, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	addl	%ebp, %eax
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE501:
	.size	math__bits__ones_count_16, .-math__bits__ones_count_16
	.section	.text.math__bits__ones_count_32,"ax",@progbits
	.p2align 4,,15
	.globl	math__bits__ones_count_32
	.type	math__bits__ones_count_32, @function
math__bits__ones_count_32:
.LFB502:
	.cfi_startproc
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movl	%edi, %ebx
	shrl	$24, %edi
	subq	$8, %rsp
	.cfi_def_cfa_offset 40
	pushq	16+_const_math__bits__pop_8_tab(%rip)
	.cfi_def_cfa_offset 48
	pushq	8+_const_math__bits__pop_8_tab(%rip)
	.cfi_def_cfa_offset 56
	pushq	_const_math__bits__pop_8_tab(%rip)
	.cfi_def_cfa_offset 64
	call	array_get
	movl	%ebx, %edi
	movzbl	(%rax), %r12d
	addq	$24, %rsp
	.cfi_def_cfa_offset 40
	shrl	$16, %edi
	pushq	16+_const_math__bits__pop_8_tab(%rip)
	.cfi_def_cfa_offset 48
	pushq	8+_const_math__bits__pop_8_tab(%rip)
	.cfi_def_cfa_offset 56
	pushq	_const_math__bits__pop_8_tab(%rip)
	.cfi_def_cfa_offset 64
	movzbl	%dil, %edi
	call	array_get
	addq	$24, %rsp
	.cfi_def_cfa_offset 40
	movzbl	(%rax), %ebp
	pushq	16+_const_math__bits__pop_8_tab(%rip)
	.cfi_def_cfa_offset 48
	pushq	8+_const_math__bits__pop_8_tab(%rip)
	.cfi_def_cfa_offset 56
	pushq	_const_math__bits__pop_8_tab(%rip)
	.cfi_def_cfa_offset 64
	movzbl	%bh, %edi
	call	array_get
	movzbl	(%rax), %eax
	addq	$24, %rsp
	.cfi_def_cfa_offset 40
	pushq	16+_const_math__bits__pop_8_tab(%rip)
	.cfi_def_cfa_offset 48
	pushq	8+_const_math__bits__pop_8_tab(%rip)
	.cfi_def_cfa_offset 56
	pushq	_const_math__bits__pop_8_tab(%rip)
	.cfi_def_cfa_offset 64
	addl	%r12d, %ebp
	movzbl	%bl, %edi
	addl	%eax, %ebp
	call	array_get
	movzbl	(%rax), %eax
	addq	$32, %rsp
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	addl	%ebp, %eax
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE502:
	.size	math__bits__ones_count_32, .-math__bits__ones_count_32
	.section	.text.math__bits__ones_count_64,"ax",@progbits
	.p2align 4,,15
	.globl	math__bits__ones_count_64
	.type	math__bits__ones_count_64, @function
math__bits__ones_count_64:
.LFB503:
	.cfi_startproc
	movq	_const_math__bits__max_u64(%rip), %rax
	movq	_const_math__bits__m0(%rip), %rdx
	movq	%rdi, %rcx
	shrq	%rcx
	andq	%rax, %rdx
	andq	%rdx, %rcx
	andq	%rdi, %rdx
	leaq	(%rcx,%rdx), %rdi
	movq	_const_math__bits__m1(%rip), %rdx
	movq	%rdi, %rcx
	andq	%rax, %rdx
	shrq	$2, %rcx
	andq	_const_math__bits__m2(%rip), %rax
	andq	%rdx, %rcx
	andq	%rdi, %rdx
	addq	%rcx, %rdx
	movq	%rdx, %rcx
	shrq	$4, %rcx
	addq	%rcx, %rdx
	andq	%rdx, %rax
	movq	%rax, %rdx
	shrq	$8, %rdx
	addq	%rax, %rdx
	movq	%rdx, %rax
	shrq	$16, %rax
	addq	%rax, %rdx
	movq	%rdx, %rax
	shrq	$32, %rax
	addq	%rdx, %rax
	andl	$127, %eax
	ret
	.cfi_endproc
.LFE503:
	.size	math__bits__ones_count_64, .-math__bits__ones_count_64
	.section	.text.math__bits__rotate_left_8,"ax",@progbits
	.p2align 4,,15
	.globl	math__bits__rotate_left_8
	.type	math__bits__rotate_left_8, @function
math__bits__rotate_left_8:
.LFB504:
	.cfi_startproc
	movl	%esi, %ecx
	movl	%edi, %eax
	andl	$7, %ecx
	rolb	%cl, %al
	ret
	.cfi_endproc
.LFE504:
	.size	math__bits__rotate_left_8, .-math__bits__rotate_left_8
	.section	.text.math__bits__rotate_left_16,"ax",@progbits
	.p2align 4,,15
	.globl	math__bits__rotate_left_16
	.type	math__bits__rotate_left_16, @function
math__bits__rotate_left_16:
.LFB505:
	.cfi_startproc
	movl	%esi, %ecx
	movl	%edi, %eax
	andl	$15, %ecx
	rolw	%cl, %ax
	ret
	.cfi_endproc
.LFE505:
	.size	math__bits__rotate_left_16, .-math__bits__rotate_left_16
	.section	.text.math__bits__rotate_left_32,"ax",@progbits
	.p2align 4,,15
	.globl	math__bits__rotate_left_32
	.type	math__bits__rotate_left_32, @function
math__bits__rotate_left_32:
.LFB506:
	.cfi_startproc
	movl	%edi, %eax
	movl	%esi, %ecx
	roll	%cl, %eax
	ret
	.cfi_endproc
.LFE506:
	.size	math__bits__rotate_left_32, .-math__bits__rotate_left_32
	.section	.text.math__bits__rotate_left_64,"ax",@progbits
	.p2align 4,,15
	.globl	math__bits__rotate_left_64
	.type	math__bits__rotate_left_64, @function
math__bits__rotate_left_64:
.LFB507:
	.cfi_startproc
	movq	%rdi, %rax
	movl	%esi, %ecx
	rolq	%cl, %rax
	ret
	.cfi_endproc
.LFE507:
	.size	math__bits__rotate_left_64, .-math__bits__rotate_left_64
	.section	.text.math__bits__reverse_8,"ax",@progbits
	.p2align 4,,15
	.globl	math__bits__reverse_8
	.type	math__bits__reverse_8, @function
math__bits__reverse_8:
.LFB508:
	.cfi_startproc
	subq	$16, %rsp
	.cfi_def_cfa_offset 24
	pushq	16+_const_math__bits__rev_8_tab(%rip)
	.cfi_def_cfa_offset 32
	pushq	8+_const_math__bits__rev_8_tab(%rip)
	.cfi_def_cfa_offset 40
	pushq	_const_math__bits__rev_8_tab(%rip)
	.cfi_def_cfa_offset 48
	movzbl	%dil, %edi
	call	array_get
	movzbl	(%rax), %eax
	addq	$40, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE508:
	.size	math__bits__reverse_8, .-math__bits__reverse_8
	.section	.text.math__bits__reverse_16,"ax",@progbits
	.p2align 4,,15
	.globl	math__bits__reverse_16
	.type	math__bits__reverse_16, @function
math__bits__reverse_16:
.LFB509:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movl	%edi, %ebx
	movzbl	%bh, %edi
	subq	$16, %rsp
	.cfi_def_cfa_offset 40
	pushq	16+_const_math__bits__rev_8_tab(%rip)
	.cfi_def_cfa_offset 48
	pushq	8+_const_math__bits__rev_8_tab(%rip)
	.cfi_def_cfa_offset 56
	pushq	_const_math__bits__rev_8_tab(%rip)
	.cfi_def_cfa_offset 64
	call	array_get
	addq	$24, %rsp
	.cfi_def_cfa_offset 40
	movzbl	(%rax), %ebp
	pushq	16+_const_math__bits__rev_8_tab(%rip)
	.cfi_def_cfa_offset 48
	pushq	8+_const_math__bits__rev_8_tab(%rip)
	.cfi_def_cfa_offset 56
	pushq	_const_math__bits__rev_8_tab(%rip)
	.cfi_def_cfa_offset 64
	movzbl	%bl, %edi
	call	array_get
	movzbl	(%rax), %eax
	addq	$40, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	sall	$8, %eax
	orl	%ebp, %eax
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE509:
	.size	math__bits__reverse_16, .-math__bits__reverse_16
	.section	.text.math__bits__reverse_32,"ax",@progbits
	.p2align 4,,15
	.globl	math__bits__reverse_32
	.type	math__bits__reverse_32, @function
math__bits__reverse_32:
.LFB510:
	.cfi_startproc
	movl	_const_math__bits__max_u32(%rip), %ecx
	movl	_const_math__bits__m0(%rip), %eax
	movl	%edi, %esi
	shrl	%esi
	andl	%ecx, %eax
	andl	%eax, %esi
	andl	%edi, %eax
	leal	(%rax,%rax), %edi
	orl	%esi, %edi
	movl	_const_math__bits__m1(%rip), %esi
	movl	%edi, %edx
	shrl	$2, %edx
	andl	%ecx, %esi
	andl	%esi, %edx
	andl	%edi, %esi
	sall	$2, %esi
	orl	%edx, %esi
	movl	_const_math__bits__m2(%rip), %edx
	movl	%esi, %eax
	shrl	$4, %eax
	andl	%ecx, %edx
	andl	_const_math__bits__m3(%rip), %ecx
	andl	%edx, %eax
	andl	%esi, %edx
	sall	$4, %edx
	orl	%eax, %edx
	movl	%edx, %eax
	andl	%ecx, %edx
	shrl	$8, %eax
	sall	$8, %edx
	andl	%ecx, %eax
	orl	%eax, %edx
	movl	%edx, %eax
	roll	$16, %eax
	ret
	.cfi_endproc
.LFE510:
	.size	math__bits__reverse_32, .-math__bits__reverse_32
	.section	.text.math__bits__reverse_64,"ax",@progbits
	.p2align 4,,15
	.globl	math__bits__reverse_64
	.type	math__bits__reverse_64, @function
math__bits__reverse_64:
.LFB511:
	.cfi_startproc
	movq	_const_math__bits__max_u64(%rip), %rsi
	movq	_const_math__bits__m0(%rip), %rdx
	movq	%rdi, %rax
	shrq	%rax
	andq	%rsi, %rdx
	andq	%rdx, %rax
	andq	%rdi, %rdx
	leaq	(%rdx,%rdx), %rdi
	orq	%rax, %rdi
	movq	_const_math__bits__m1(%rip), %rax
	movq	%rdi, %rdx
	shrq	$2, %rdx
	andq	%rsi, %rax
	andq	%rax, %rdx
	andq	%rdi, %rax
	salq	$2, %rax
	orq	%rdx, %rax
	movq	_const_math__bits__m2(%rip), %rdx
	movq	%rax, %rcx
	shrq	$4, %rcx
	andq	%rsi, %rdx
	andq	%rdx, %rcx
	andq	%rax, %rdx
	salq	$4, %rdx
	orq	%rdx, %rcx
	movq	_const_math__bits__m3(%rip), %rdx
	movq	%rcx, %rax
	shrq	$8, %rax
	andq	%rsi, %rdx
	andq	_const_math__bits__m4(%rip), %rsi
	andq	%rdx, %rcx
	andq	%rdx, %rax
	salq	$8, %rcx
	orq	%rcx, %rax
	movq	%rax, %rdx
	shrq	$16, %rax
	andq	%rsi, %rdx
	andq	%rsi, %rax
	salq	$16, %rdx
	orq	%rax, %rdx
	movq	%rdx, %rax
	rolq	$32, %rax
	ret
	.cfi_endproc
.LFE511:
	.size	math__bits__reverse_64, .-math__bits__reverse_64
	.section	.text.math__bits__reverse_bytes_16,"ax",@progbits
	.p2align 4,,15
	.globl	math__bits__reverse_bytes_16
	.type	math__bits__reverse_bytes_16, @function
math__bits__reverse_bytes_16:
.LFB512:
	.cfi_startproc
	movl	%edi, %eax
	rolw	$8, %ax
	ret
	.cfi_endproc
.LFE512:
	.size	math__bits__reverse_bytes_16, .-math__bits__reverse_bytes_16
	.section	.text.math__bits__reverse_bytes_32,"ax",@progbits
	.p2align 4,,15
	.globl	math__bits__reverse_bytes_32
	.type	math__bits__reverse_bytes_32, @function
math__bits__reverse_bytes_32:
.LFB513:
	.cfi_startproc
	movq	_const_math__bits__m3(%rip), %rdx
	andl	_const_math__bits__max_u32(%rip), %edx
	movl	%edi, %eax
	shrl	$8, %eax
	andl	%edx, %eax
	andl	%edi, %edx
	sall	$8, %edx
	orl	%eax, %edx
	movl	%edx, %eax
	roll	$16, %eax
	ret
	.cfi_endproc
.LFE513:
	.size	math__bits__reverse_bytes_32, .-math__bits__reverse_bytes_32
	.section	.text.math__bits__reverse_bytes_64,"ax",@progbits
	.p2align 4,,15
	.globl	math__bits__reverse_bytes_64
	.type	math__bits__reverse_bytes_64, @function
math__bits__reverse_bytes_64:
.LFB514:
	.cfi_startproc
	movq	_const_math__bits__max_u64(%rip), %rdx
	movq	_const_math__bits__m3(%rip), %rcx
	movq	%rdi, %rax
	shrq	$8, %rax
	andq	%rdx, %rcx
	andq	_const_math__bits__m4(%rip), %rdx
	andq	%rcx, %rdi
	andq	%rcx, %rax
	salq	$8, %rdi
	orq	%rax, %rdi
	movq	%rdi, %rax
	shrq	$16, %rax
	andq	%rdx, %rax
	andq	%rdi, %rdx
	salq	$16, %rdx
	orq	%rax, %rdx
	movq	%rdx, %rax
	rolq	$32, %rax
	ret
	.cfi_endproc
.LFE514:
	.size	math__bits__reverse_bytes_64, .-math__bits__reverse_bytes_64
	.section	.text.math__bits__len_8,"ax",@progbits
	.p2align 4,,15
	.globl	math__bits__len_8
	.type	math__bits__len_8, @function
math__bits__len_8:
.LFB515:
	.cfi_startproc
	subq	$16, %rsp
	.cfi_def_cfa_offset 24
	pushq	16+_const_math__bits__len_8_tab(%rip)
	.cfi_def_cfa_offset 32
	pushq	8+_const_math__bits__len_8_tab(%rip)
	.cfi_def_cfa_offset 40
	pushq	_const_math__bits__len_8_tab(%rip)
	.cfi_def_cfa_offset 48
	movzbl	%dil, %edi
	call	array_get
	movzbl	(%rax), %eax
	addq	$40, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE515:
	.size	math__bits__len_8, .-math__bits__len_8
	.section	.text.math__bits__len_16,"ax",@progbits
	.p2align 4,,15
	.globl	math__bits__len_16
	.type	math__bits__len_16, @function
math__bits__len_16:
.LFB516:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	xorl	%ebx, %ebx
	cmpw	$255, %di
	movl	%edi, %edx
	jbe	.L4650
	shrw	$8, %dx
	movl	$8, %ebx
.L4650:
	subq	$8, %rsp
	.cfi_def_cfa_offset 24
	pushq	16+_const_math__bits__len_8_tab(%rip)
	.cfi_def_cfa_offset 32
	pushq	8+_const_math__bits__len_8_tab(%rip)
	.cfi_def_cfa_offset 40
	pushq	_const_math__bits__len_8_tab(%rip)
	.cfi_def_cfa_offset 48
	movzwl	%dx, %edi
	call	array_get
	movzbl	(%rax), %eax
	addq	$32, %rsp
	.cfi_def_cfa_offset 16
	addl	%ebx, %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE516:
	.size	math__bits__len_16, .-math__bits__len_16
	.section	.text.math__bits__len_32,"ax",@progbits
	.p2align 4,,15
	.globl	math__bits__len_32
	.type	math__bits__len_32, @function
math__bits__len_32:
.LFB517:
	.cfi_startproc
	cmpl	$65535, %edi
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	jbe	.L4657
	shrl	$16, %edi
	movl	$24, %eax
	movl	$16, %ebx
.L4655:
	cmpl	$255, %edi
	jbe	.L4656
	shrl	$8, %edi
	movl	%eax, %ebx
.L4656:
	subq	$8, %rsp
	.cfi_def_cfa_offset 24
	pushq	16+_const_math__bits__len_8_tab(%rip)
	.cfi_def_cfa_offset 32
	pushq	8+_const_math__bits__len_8_tab(%rip)
	.cfi_def_cfa_offset 40
	pushq	_const_math__bits__len_8_tab(%rip)
	.cfi_def_cfa_offset 48
	call	array_get
	movzbl	(%rax), %eax
	addq	$32, %rsp
	.cfi_def_cfa_offset 16
	addl	%ebx, %eax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L4657:
	.cfi_restore_state
	movl	$8, %eax
	xorl	%ebx, %ebx
	jmp	.L4655
	.cfi_endproc
.LFE517:
	.size	math__bits__len_32, .-math__bits__len_32
	.section	.text.math__bits__len_64,"ax",@progbits
	.p2align 4,,15
	.globl	math__bits__len_64
	.type	math__bits__len_64, @function
math__bits__len_64:
.LFB518:
	.cfi_startproc
	movl	$4294967295, %eax
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	cmpq	%rax, %rdi
	jbe	.L4663
	shrq	$32, %rdi
	movl	$48, %eax
	movl	$32, %ebx
.L4660:
	cmpq	$65535, %rdi
	jbe	.L4661
	shrq	$16, %rdi
	movl	%eax, %ebx
.L4661:
	cmpq	$255, %rdi
	jbe	.L4662
	shrq	$8, %rdi
	addl	$8, %ebx
.L4662:
	subq	$8, %rsp
	.cfi_def_cfa_offset 24
	pushq	16+_const_math__bits__len_8_tab(%rip)
	.cfi_def_cfa_offset 32
	pushq	8+_const_math__bits__len_8_tab(%rip)
	.cfi_def_cfa_offset 40
	pushq	_const_math__bits__len_8_tab(%rip)
	.cfi_def_cfa_offset 48
	call	array_get
	movzbl	(%rax), %eax
	addq	$32, %rsp
	.cfi_def_cfa_offset 16
	addl	%ebx, %eax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L4663:
	.cfi_restore_state
	movl	$16, %eax
	xorl	%ebx, %ebx
	jmp	.L4660
	.cfi_endproc
.LFE518:
	.size	math__bits__len_64, .-math__bits__len_64
	.section	.text.math__bits__add_32,"ax",@progbits
	.p2align 4,,15
	.globl	math__bits__add_32
	.type	math__bits__add_32, @function
math__bits__add_32:
.LFB519:
	.cfi_startproc
	movl	%edx, %edx
	movl	%esi, %esi
	movl	%edi, %edi
	addq	%rdx, %rsi
	leaq	(%rsi,%rdi), %rax
	ret
	.cfi_endproc
.LFE519:
	.size	math__bits__add_32, .-math__bits__add_32
	.section	.text.math__bits__add_64,"ax",@progbits
	.p2align 4,,15
	.globl	math__bits__add_64
	.type	math__bits__add_64, @function
math__bits__add_64:
.LFB520:
	.cfi_startproc
	leaq	(%rsi,%rdx), %rax
	movq	%rdi, %rdx
	orq	%rsi, %rdx
	addq	%rdi, %rax
	andq	%rsi, %rdi
	movq	%rax, %rcx
	notq	%rcx
	andq	%rcx, %rdx
	orq	%rdi, %rdx
	shrq	$63, %rdx
	ret
	.cfi_endproc
.LFE520:
	.size	math__bits__add_64, .-math__bits__add_64
	.section	.text.math__bits__sub_32,"ax",@progbits
	.p2align 4,,15
	.globl	math__bits__sub_32
	.type	math__bits__sub_32, @function
math__bits__sub_32:
.LFB521:
	.cfi_startproc
	movl	%edi, %ecx
	movl	%edi, %eax
	notl	%edi
	subl	%esi, %ecx
	xorl	%esi, %eax
	andl	%edi, %esi
	subl	%edx, %ecx
	notl	%eax
	movl	%ecx, %edx
	andl	%edx, %eax
	orl	%esi, %eax
	shrl	$31, %eax
	salq	$32, %rax
	orq	%rdx, %rax
	ret
	.cfi_endproc
.LFE521:
	.size	math__bits__sub_32, .-math__bits__sub_32
	.section	.text.math__bits__sub_64,"ax",@progbits
	.p2align 4,,15
	.globl	math__bits__sub_64
	.type	math__bits__sub_64, @function
math__bits__sub_64:
.LFB522:
	.cfi_startproc
	movq	%rdi, %rax
	subq	%rsi, %rax
	subq	%rdx, %rax
	movq	%rdi, %rdx
	notq	%rdi
	xorq	%rsi, %rdx
	andq	%rdi, %rsi
	notq	%rdx
	andq	%rax, %rdx
	orq	%rsi, %rdx
	shrq	$63, %rdx
	ret
	.cfi_endproc
.LFE522:
	.size	math__bits__sub_64, .-math__bits__sub_64
	.section	.text.math__bits__mul_32,"ax",@progbits
	.p2align 4,,15
	.globl	math__bits__mul_32
	.type	math__bits__mul_32, @function
math__bits__mul_32:
.LFB523:
	.cfi_startproc
	movl	%edi, %eax
	movl	%esi, %edi
	imulq	%rdi, %rax
	rolq	$32, %rax
	ret
	.cfi_endproc
.LFE523:
	.size	math__bits__mul_32, .-math__bits__mul_32
	.section	.text.math__bits__mul_64,"ax",@progbits
	.p2align 4,,15
	.globl	math__bits__mul_64
	.type	math__bits__mul_64, @function
math__bits__mul_64:
.LFB524:
	.cfi_startproc
	movq	_const_math__bits__mask32(%rip), %r10
	movq	%rdi, %rax
	movq	%rsi, %r11
	shrq	$32, %rax
	shrq	$32, %r11
	movq	%r10, %r8
	movq	%r10, %rdx
	andq	%rdi, %r8
	andq	%rsi, %rdx
	movq	%r8, %rcx
	imulq	%rdx, %rcx
	imulq	%rax, %rdx
	imulq	%r11, %r8
	shrq	$32, %rcx
	leaq	(%rcx,%rdx), %rcx
	imulq	%r11, %rax
	andq	%rcx, %r10
	shrq	$32, %rcx
	imulq	%rsi, %rdi
	addq	%rax, %rcx
	leaq	(%r8,%r10), %rax
	shrq	$32, %rax
	movq	%rdi, %rdx
	addq	%rcx, %rax
	ret
	.cfi_endproc
.LFE524:
	.size	math__bits__mul_64, .-math__bits__mul_64
	.section	.text.math__bits__div_32,"ax",@progbits
	.p2align 4,,15
	.globl	math__bits__div_32
	.type	math__bits__div_32, @function
math__bits__div_32:
.LFB525:
	.cfi_startproc
	testl	%edx, %edx
	je	.L4672
	cmpl	%edi, %edx
	jbe	.L4682
.L4672:
	movq	%rdi, %rax
	movl	%esi, %esi
	movl	%edx, %ecx
	salq	$32, %rax
	xorl	%edx, %edx
	orq	%rsi, %rax
	divq	%rcx
	salq	$32, %rdx
	movl	%eax, %eax
	orq	%rdx, %rax
	ret
.L4682:
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movq	_const_math__bits__overflow_error(%rip), %rdi
	movq	8+_const_math__bits__overflow_error(%rip), %rsi
	call	v_panic
	.cfi_endproc
.LFE525:
	.size	math__bits__div_32, .-math__bits__div_32
	.section	.text.math__bits__div_64,"ax",@progbits
	.p2align 4,,15
	.globl	math__bits__div_64
	.type	math__bits__div_64, @function
math__bits__div_64:
.LFB526:
	.cfi_startproc
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$8, %rsp
	.cfi_def_cfa_offset 48
	testq	%rdx, %rdx
	je	.L4685
	cmpq	%rdi, %rdx
	movq	%rdi, %r13
	movq	%rdx, %rbx
	jbe	.L4685
	movl	$4294967295, %eax
	movq	%rsi, %r12
	movq	%rdx, %rdi
	cmpq	%rax, %rdx
	jbe	.L4695
	shrq	$32, %rdi
	movl	$48, %eax
	movl	$32, %ebp
.L4686:
	cmpq	$65535, %rdi
	jbe	.L4687
	shrq	$16, %rdi
	movl	%eax, %ebp
.L4687:
	cmpq	$255, %rdi
	jbe	.L4688
	shrq	$8, %rdi
	addl	$8, %ebp
.L4688:
	subq	$8, %rsp
	.cfi_def_cfa_offset 56
	pushq	16+_const_math__bits__len_8_tab(%rip)
	.cfi_def_cfa_offset 64
	pushq	8+_const_math__bits__len_8_tab(%rip)
	.cfi_def_cfa_offset 72
	pushq	_const_math__bits__len_8_tab(%rip)
	.cfi_def_cfa_offset 80
	call	array_get
	movzbl	(%rax), %edx
	movl	$64, %eax
	addq	$32, %rsp
	.cfi_def_cfa_offset 48
	movl	%eax, %r9d
	addl	%ebp, %edx
	movq	%r12, %rbp
	subl	%edx, %r9d
	movq	_const_math__bits__mask32(%rip), %rdx
	movl	%r9d, %ecx
	subl	%r9d, %eax
	salq	%cl, %rbx
	movl	%eax, %ecx
	shrq	%cl, %rbp
	movl	%r9d, %ecx
	movq	%rbx, %r11
	salq	%cl, %r13
	movq	%rbx, %r10
	shrq	$32, %r11
	orq	%r13, %rbp
	movq	%rdx, %rbx
	movq	%rdx, %rsi
	movq	%rbp, %rax
	xorl	%edx, %edx
	salq	%cl, %r12
	divq	%r11
	movq	_const_math__bits__two32(%rip), %rcx
	andq	%r10, %rbx
	movq	%r12, %rdi
	movq	%rbx, %r13
	andq	%r12, %rsi
	shrq	$32, %rdi
	movq	%rcx, %r12
	movq	%rax, %r8
	imulq	%rax, %r13
	movq	%rcx, %rax
	imulq	%rdx, %rax
	imulq	%r11, %r12
	addq	%rdi, %rax
	.p2align 4,,10
	.p2align 3
.L4689:
	cmpq	%r8, %rcx
	jbe	.L4691
	cmpq	%r13, %rax
	jnb	.L4690
.L4691:
	addq	%r11, %rdx
	subq	$1, %r8
	subq	%rbx, %r13
	addq	%r12, %rax
	cmpq	%rdx, %rcx
	ja	.L4689
.L4690:
	imulq	%rcx, %rbp
	movq	%r8, %rax
	xorl	%edx, %edx
	imulq	%r10, %rax
	movq	%rbx, %r13
	addq	%rdi, %rbp
	movq	%rcx, %rdi
	subq	%rax, %rbp
	movq	%rbp, %rax
	divq	%r11
	imulq	%rdx, %rdi
	imulq	%rax, %r13
	addq	%rsi, %rdi
	.p2align 4,,10
	.p2align 3
.L4692:
	cmpq	%rax, %rcx
	jbe	.L4694
	cmpq	%r13, %rdi
	jnb	.L4693
.L4694:
	addq	%r11, %rdx
	subq	$1, %rax
	subq	%rbx, %r13
	addq	%r12, %rdi
	cmpq	%rdx, %rcx
	ja	.L4692
.L4693:
	imulq	%rcx, %r8
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	imulq	%rbp, %rcx
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	addq	%rax, %r8
	imulq	%r10, %rax
	leaq	(%rcx,%rsi), %rdx
	movl	%r9d, %ecx
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	subq	%rax, %rdx
	movq	%r8, %rax
	shrq	%cl, %rdx
	ret
	.p2align 4,,10
	.p2align 3
.L4695:
	.cfi_restore_state
	movl	$16, %eax
	xorl	%ebp, %ebp
	jmp	.L4686
.L4685:
	movq	_const_math__bits__overflow_error(%rip), %rdi
	movq	8+_const_math__bits__overflow_error(%rip), %rsi
	call	v_panic
	.cfi_endproc
.LFE526:
	.size	math__bits__div_64, .-math__bits__div_64
	.section	.text.math__bits__rem_32,"ax",@progbits
	.p2align 4,,15
	.globl	math__bits__rem_32
	.type	math__bits__rem_32, @function
math__bits__rem_32:
.LFB527:
	.cfi_startproc
	movq	%rdi, %rax
	movl	%esi, %esi
	movl	%edx, %ecx
	salq	$32, %rax
	xorl	%edx, %edx
	orq	%rsi, %rax
	divq	%rcx
	movl	%edx, %eax
	ret
	.cfi_endproc
.LFE527:
	.size	math__bits__rem_32, .-math__bits__rem_32
	.section	.text.math__bits__rem_64,"ax",@progbits
	.p2align 4,,15
	.globl	math__bits__rem_64
	.type	math__bits__rem_64, @function
math__bits__rem_64:
.LFB528:
	.cfi_startproc
	movq	%rdx, %rcx
	movq	%rdi, %rax
	xorl	%edx, %edx
	divq	%rcx
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movq	%rdx, %rdi
	movq	%rcx, %rdx
	call	math__bits__div_64
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	movq	%rdx, %rax
	ret
	.cfi_endproc
.LFE528:
	.size	math__bits__rem_64, .-math__bits__rem_64
	.section	.rodata
	.align 32
.LC0:
	.quad	1152921504606846976
	.quad	1441151880758558720
	.quad	1801439850948198400
	.quad	2251799813685248000
	.quad	1407374883553280000
	.quad	1759218604441600000
	.quad	2199023255552000000
	.quad	1374389534720000000
	.quad	1717986918400000000
	.quad	2147483648000000000
	.quad	1342177280000000000
	.quad	1677721600000000000
	.quad	2097152000000000000
	.quad	1310720000000000000
	.quad	1638400000000000000
	.quad	2048000000000000000
	.quad	1280000000000000000
	.quad	1600000000000000000
	.quad	2000000000000000000
	.quad	1250000000000000000
	.quad	1562500000000000000
	.quad	1953125000000000000
	.quad	1220703125000000000
	.quad	1525878906250000000
	.quad	1907348632812500000
	.quad	1192092895507812500
	.quad	1490116119384765625
	.quad	1862645149230957031
	.quad	1164153218269348144
	.quad	1455191522836685180
	.quad	1818989403545856475
	.quad	2273736754432320594
	.quad	1421085471520200371
	.quad	1776356839400250464
	.quad	2220446049250313080
	.quad	1387778780781445675
	.quad	1734723475976807094
	.quad	2168404344971008868
	.quad	1355252715606880542
	.quad	1694065894508600678
	.quad	2117582368135750847
	.quad	1323488980084844279
	.quad	1654361225106055349
	.quad	2067951531382569187
	.quad	1292469707114105741
	.quad	1615587133892632177
	.quad	2019483917365790221
	.section	.text._vinit,"ax",@progbits
	.p2align 4,,15
	.globl	_vinit
	.type	_vinit, @function
_vinit:
.LFB529:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movl	$4, %ecx
	movl	$12, %edx
	movl	$12, %esi
	movq	$-1, %rbp
	subq	$12312, %rsp
	.cfi_def_cfa_offset 12336
	movl	$200, 8+_const_digit_pairs(%rip)
	movl	$21, 8+_const_time__days_string(%rip)
	movq	%fs:40, %rax
	movq	%rax, 12296(%rsp)
	xorl	%eax, %eax
	leaq	.LC20(%rip), %rax
	movdqa	.LC147(%rip), %xmm0
	leaq	144(%rsp), %rbx
	leaq	176(%rsp), %r8
	movl	$36, 8+_const_time__months_string(%rip)
	movq	%rax, _const_digit_pairs(%rip)
	leaq	.LC21(%rip), %rax
	movl	$14, 8+_const_math__bits__overflow_error(%rip)
	movaps	%xmm0, 176(%rsp)
	movq	%rax, _const_time__days_string(%rip)
	leaq	.LC22(%rip), %rax
	movq	%rbx, %rdi
	movq	%rax, _const_time__months_string(%rip)
	leaq	.LC23(%rip), %rax
	movl	$12, 8+_const_math__bits__divide_error(%rip)
	movdqa	.LC148(%rip), %xmm0
	movq	%rax, _const_math__bits__overflow_error(%rip)
	leaq	.LC24(%rip), %rax
	movl	$32, _const_init_capicity(%rip)
	movaps	%xmm0, 192(%rsp)
	movq	%rax, _const_math__bits__divide_error(%rip)
	movq	.LC146(%rip), %rax
	movdqa	.LC149(%rip), %xmm0
	movq	%rax, _const_max_load_factor(%rip)
	movl	$30, _const_init_cap(%rip)
	movaps	%xmm0, 208(%rsp)
	movl	$16777215, _const_hash_mask(%rip)
	movl	$16777216, _const_probe_inc(%rip)
	movl	$5, _const_mid_index(%rip)
	movl	$11, _const_max_size(%rip)
	movl	$96, _const_children_bytes(%rip)
	call	new_array_from_c_array
	movdqu	144(%rsp), %xmm0
	leaq	480(%rsp), %r8
	movq	160(%rsp), %rax
	movl	$23, _const_strconv__ftoa__mantbits32(%rip)
	movq	%rbx, %rdi
	movdqa	.LC150(%rip), %xmm8
	movl	$8, %ecx
	movl	$8, _const_strconv__ftoa__expbits32(%rip)
	movl	$127, _const_strconv__ftoa__bias32(%rip)
	movl	$20, %edx
	movdqa	.LC151(%rip), %xmm7
	movl	$20, %esi
	movq	%rax, 16+_const_strconv__ftoa__ten_pow_table_32(%rip)
	movdqa	.LC152(%rip), %xmm6
	movdqa	.LC153(%rip), %xmm5
	movdqa	.LC154(%rip), %xmm4
	movdqa	.LC155(%rip), %xmm3
	movdqa	.LC156(%rip), %xmm2
	movdqa	.LC157(%rip), %xmm1
	movups	%xmm0, _const_strconv__ftoa__ten_pow_table_32(%rip)
	movaps	%xmm8, 480(%rsp)
	movaps	%xmm8, 128(%rsp)
	movaps	%xmm7, 496(%rsp)
	movaps	%xmm7, 112(%rsp)
	movaps	%xmm6, 512(%rsp)
	movaps	%xmm6, 96(%rsp)
	movaps	%xmm5, 528(%rsp)
	movaps	%xmm5, 80(%rsp)
	movaps	%xmm4, 544(%rsp)
	movaps	%xmm4, 64(%rsp)
	movaps	%xmm3, 560(%rsp)
	movaps	%xmm3, 48(%rsp)
	movaps	%xmm2, 576(%rsp)
	movaps	%xmm2, 32(%rsp)
	movaps	%xmm1, 592(%rsp)
	movaps	%xmm1, 16(%rsp)
	movdqa	.LC158(%rip), %xmm0
	movaps	%xmm0, 608(%rsp)
	movaps	%xmm0, (%rsp)
	movdqa	.LC159(%rip), %xmm9
	movaps	%xmm9, 624(%rsp)
	call	new_array_from_c_array
	leaq	336(%rsp), %r8
	movq	%rbx, %rdi
	movl	$8, %ecx
	movl	$18, %edx
	movl	$18, %esi
	movq	160(%rsp), %rax
	movl	$52, _const_strconv__ftoa__mantbits64(%rip)
	movdqu	144(%rsp), %xmm9
	movl	$11, _const_strconv__ftoa__expbits64(%rip)
	movl	$1023, _const_strconv__ftoa__bias64(%rip)
	movdqa	128(%rsp), %xmm8
	movq	%rax, 16+_const_strconv__ftoa__ten_pow_table_64(%rip)
	movdqa	112(%rsp), %xmm7
	movdqa	96(%rsp), %xmm6
	movdqa	80(%rsp), %xmm5
	movdqa	64(%rsp), %xmm4
	movdqa	48(%rsp), %xmm3
	movdqa	32(%rsp), %xmm2
	movdqa	16(%rsp), %xmm1
	movdqa	(%rsp), %xmm0
	movups	%xmm9, _const_strconv__ftoa__ten_pow_table_64(%rip)
	movaps	%xmm8, 336(%rsp)
	movaps	%xmm7, 352(%rsp)
	movaps	%xmm6, 368(%rsp)
	movaps	%xmm5, 384(%rsp)
	movaps	%xmm4, 400(%rsp)
	movaps	%xmm3, 416(%rsp)
	movaps	%xmm2, 432(%rsp)
	movaps	%xmm1, 448(%rsp)
	movaps	%xmm0, 464(%rsp)
	call	new_array_from_c_array
	leaq	896(%rsp), %r8
	movl	$47, %edx
	leaq	896(%rsp), %rdi
	leaq	.LC0(%rip), %rsi
	movl	$47, %ecx
	movq	160(%rsp), %rax
	movdqu	144(%rsp), %xmm0
	rep movsq
	movq	%rbx, %rdi
	movl	$8, %ecx
	movl	$47, %esi
	movups	%xmm0, _const_strconv__ftoa__powers_of_10(%rip)
	movq	%rax, 16+_const_strconv__ftoa__powers_of_10(%rip)
	call	new_array_from_c_array
	leaq	640(%rsp), %r8
	movq	%rbx, %rdi
	movl	$8, %ecx
	movdqu	144(%rsp), %xmm0
	movl	$31, %edx
	movq	160(%rsp), %rax
	movl	$31, %esi
	movups	%xmm0, _const_strconv__ftoa__pow5_split_32(%rip)
	movdqa	.LC160(%rip), %xmm0
	movq	%rax, 16+_const_strconv__ftoa__pow5_split_32(%rip)
	movabsq	$365375409332725730, %rax
	movaps	%xmm0, 640(%rsp)
	movdqa	.LC161(%rip), %xmm0
	movaps	%xmm0, 656(%rsp)
	movdqa	.LC162(%rip), %xmm0
	movaps	%xmm0, 672(%rsp)
	movdqa	.LC163(%rip), %xmm0
	movaps	%xmm0, 688(%rsp)
	movdqa	.LC164(%rip), %xmm0
	movaps	%xmm0, 704(%rsp)
	movdqa	.LC165(%rip), %xmm0
	movaps	%xmm0, 720(%rsp)
	movdqa	.LC166(%rip), %xmm0
	movaps	%xmm0, 736(%rsp)
	movdqa	.LC167(%rip), %xmm0
	movaps	%xmm0, 752(%rsp)
	movdqa	.LC168(%rip), %xmm0
	movaps	%xmm0, 768(%rsp)
	movdqa	.LC169(%rip), %xmm0
	movaps	%xmm0, 784(%rsp)
	movdqa	.LC170(%rip), %xmm0
	movaps	%xmm0, 800(%rsp)
	movdqa	.LC171(%rip), %xmm0
	movaps	%xmm0, 816(%rsp)
	movdqa	.LC172(%rip), %xmm0
	movaps	%xmm0, 832(%rsp)
	movdqa	.LC173(%rip), %xmm0
	movaps	%xmm0, 848(%rsp)
	movdqa	.LC174(%rip), %xmm0
	movq	%rax, 880(%rsp)
	movaps	%xmm0, 864(%rsp)
	call	new_array_from_c_array
	leaq	5952(%rsp), %r8
	movq	%rbx, %rdi
	movl	$16, %ecx
	movl	$326, %edx
	movl	$326, %esi
	leaq	144(%rsp), %rbx
	movdqu	144(%rsp), %xmm0
	movq	160(%rsp), %rax
	movups	%xmm0, _const_strconv__ftoa__pow5_inv_split_32(%rip)
	movdqa	.LC175(%rip), %xmm0
	movq	%rax, 16+_const_strconv__ftoa__pow5_inv_split_32(%rip)
	movaps	%xmm0, 5952(%rsp)
	movdqa	.LC176(%rip), %xmm0
	movaps	%xmm0, 5968(%rsp)
	movdqa	.LC177(%rip), %xmm0
	movaps	%xmm0, 5984(%rsp)
	movdqa	.LC178(%rip), %xmm0
	movaps	%xmm0, 6000(%rsp)
	movdqa	.LC179(%rip), %xmm0
	movaps	%xmm0, 6016(%rsp)
	movdqa	.LC180(%rip), %xmm0
	movaps	%xmm0, 6032(%rsp)
	movdqa	.LC181(%rip), %xmm0
	movaps	%xmm0, 6048(%rsp)
	movdqa	.LC182(%rip), %xmm0
	movaps	%xmm0, 6064(%rsp)
	movdqa	.LC183(%rip), %xmm0
	movaps	%xmm0, 6080(%rsp)
	movdqa	.LC184(%rip), %xmm0
	movaps	%xmm0, 6096(%rsp)
	movdqa	.LC185(%rip), %xmm0
	movaps	%xmm0, 6112(%rsp)
	movdqa	.LC186(%rip), %xmm0
	movaps	%xmm0, 6128(%rsp)
	movdqa	.LC187(%rip), %xmm0
	movaps	%xmm0, 6144(%rsp)
	movdqa	.LC188(%rip), %xmm0
	movaps	%xmm0, 6160(%rsp)
	movdqa	.LC189(%rip), %xmm0
	movaps	%xmm0, 6176(%rsp)
	movdqa	.LC190(%rip), %xmm0
	movaps	%xmm0, 6192(%rsp)
	movdqa	.LC191(%rip), %xmm0
	movaps	%xmm0, 6208(%rsp)
	movdqa	.LC192(%rip), %xmm0
	movaps	%xmm0, 6224(%rsp)
	movdqa	.LC193(%rip), %xmm0
	movaps	%xmm0, 6240(%rsp)
	movdqa	.LC194(%rip), %xmm0
	movaps	%xmm0, 6256(%rsp)
	movdqa	.LC195(%rip), %xmm0
	movaps	%xmm0, 6272(%rsp)
	movdqa	.LC196(%rip), %xmm0
	movaps	%xmm0, 6288(%rsp)
	movdqa	.LC197(%rip), %xmm0
	movaps	%xmm0, 6304(%rsp)
	movdqa	.LC198(%rip), %xmm0
	movaps	%xmm0, 6320(%rsp)
	movdqa	.LC199(%rip), %xmm0
	movaps	%xmm0, 6336(%rsp)
	movdqa	.LC200(%rip), %xmm0
	movaps	%xmm0, 6352(%rsp)
	movdqa	.LC201(%rip), %xmm0
	movaps	%xmm0, 6368(%rsp)
	movdqa	.LC202(%rip), %xmm0
	movaps	%xmm0, 6384(%rsp)
	movdqa	.LC203(%rip), %xmm0
	movaps	%xmm0, 6400(%rsp)
	movdqa	.LC204(%rip), %xmm0
	movaps	%xmm0, 6416(%rsp)
	movdqa	.LC205(%rip), %xmm0
	movaps	%xmm0, 6432(%rsp)
	movdqa	.LC206(%rip), %xmm0
	movaps	%xmm0, 6448(%rsp)
	movdqa	.LC207(%rip), %xmm0
	movaps	%xmm0, 6464(%rsp)
	movdqa	.LC208(%rip), %xmm0
	movaps	%xmm0, 6480(%rsp)
	movdqa	.LC209(%rip), %xmm0
	movaps	%xmm0, 6496(%rsp)
	movdqa	.LC210(%rip), %xmm0
	movaps	%xmm0, 6512(%rsp)
	movdqa	.LC211(%rip), %xmm0
	movaps	%xmm0, 6528(%rsp)
	movdqa	.LC212(%rip), %xmm0
	movaps	%xmm0, 6544(%rsp)
	movdqa	.LC213(%rip), %xmm0
	movaps	%xmm0, 6560(%rsp)
	movdqa	.LC214(%rip), %xmm0
	movaps	%xmm0, 6576(%rsp)
	movdqa	.LC215(%rip), %xmm0
	movaps	%xmm0, 6592(%rsp)
	movdqa	.LC216(%rip), %xmm0
	movaps	%xmm0, 6608(%rsp)
	movdqa	.LC217(%rip), %xmm0
	movaps	%xmm0, 6624(%rsp)
	movdqa	.LC218(%rip), %xmm0
	movaps	%xmm0, 6640(%rsp)
	movdqa	.LC219(%rip), %xmm0
	movaps	%xmm0, 6656(%rsp)
	movdqa	.LC220(%rip), %xmm0
	movaps	%xmm0, 6672(%rsp)
	movdqa	.LC221(%rip), %xmm0
	movaps	%xmm0, 6688(%rsp)
	movdqa	.LC222(%rip), %xmm0
	movaps	%xmm0, 6704(%rsp)
	movdqa	.LC223(%rip), %xmm0
	movaps	%xmm0, 6720(%rsp)
	movdqa	.LC224(%rip), %xmm0
	movaps	%xmm0, 6736(%rsp)
	movdqa	.LC225(%rip), %xmm0
	movaps	%xmm0, 6752(%rsp)
	movdqa	.LC226(%rip), %xmm0
	movaps	%xmm0, 6768(%rsp)
	movdqa	.LC227(%rip), %xmm0
	movaps	%xmm0, 6784(%rsp)
	movdqa	.LC228(%rip), %xmm0
	movaps	%xmm0, 6800(%rsp)
	movdqa	.LC229(%rip), %xmm0
	movaps	%xmm0, 6816(%rsp)
	movdqa	.LC230(%rip), %xmm0
	movaps	%xmm0, 6832(%rsp)
	movdqa	.LC231(%rip), %xmm0
	movaps	%xmm0, 6848(%rsp)
	movdqa	.LC232(%rip), %xmm0
	movaps	%xmm0, 6864(%rsp)
	movdqa	.LC233(%rip), %xmm0
	movaps	%xmm0, 6880(%rsp)
	movdqa	.LC234(%rip), %xmm0
	movaps	%xmm0, 6896(%rsp)
	movdqa	.LC235(%rip), %xmm0
	movaps	%xmm0, 6912(%rsp)
	movdqa	.LC236(%rip), %xmm0
	movaps	%xmm0, 6928(%rsp)
	movdqa	.LC237(%rip), %xmm0
	movaps	%xmm0, 6944(%rsp)
	movdqa	.LC238(%rip), %xmm0
	movaps	%xmm0, 6960(%rsp)
	movdqa	.LC239(%rip), %xmm0
	movaps	%xmm0, 6976(%rsp)
	movdqa	.LC240(%rip), %xmm0
	movaps	%xmm0, 6992(%rsp)
	movdqa	.LC241(%rip), %xmm0
	movaps	%xmm0, 7008(%rsp)
	movdqa	.LC242(%rip), %xmm0
	movaps	%xmm0, 7024(%rsp)
	movdqa	.LC243(%rip), %xmm0
	movaps	%xmm0, 7040(%rsp)
	movdqa	.LC244(%rip), %xmm0
	movaps	%xmm0, 7056(%rsp)
	movdqa	.LC245(%rip), %xmm0
	movaps	%xmm0, 7072(%rsp)
	movdqa	.LC246(%rip), %xmm0
	movaps	%xmm0, 7088(%rsp)
	movdqa	.LC247(%rip), %xmm0
	movaps	%xmm0, 7104(%rsp)
	movdqa	.LC248(%rip), %xmm0
	movaps	%xmm0, 7120(%rsp)
	movdqa	.LC249(%rip), %xmm0
	movaps	%xmm0, 7136(%rsp)
	movdqa	.LC250(%rip), %xmm0
	movaps	%xmm0, 7152(%rsp)
	movdqa	.LC251(%rip), %xmm0
	movaps	%xmm0, 7168(%rsp)
	movdqa	.LC252(%rip), %xmm0
	movaps	%xmm0, 7184(%rsp)
	movdqa	.LC253(%rip), %xmm0
	movaps	%xmm0, 7200(%rsp)
	movdqa	.LC254(%rip), %xmm0
	movaps	%xmm0, 7216(%rsp)
	movdqa	.LC255(%rip), %xmm0
	movaps	%xmm0, 7232(%rsp)
	movdqa	.LC256(%rip), %xmm0
	movaps	%xmm0, 7248(%rsp)
	movdqa	.LC257(%rip), %xmm0
	movaps	%xmm0, 7264(%rsp)
	movdqa	.LC258(%rip), %xmm0
	movaps	%xmm0, 7280(%rsp)
	movdqa	.LC259(%rip), %xmm0
	movaps	%xmm0, 7296(%rsp)
	movdqa	.LC260(%rip), %xmm0
	movaps	%xmm0, 7312(%rsp)
	movdqa	.LC261(%rip), %xmm0
	movaps	%xmm0, 7328(%rsp)
	movdqa	.LC262(%rip), %xmm0
	movaps	%xmm0, 7344(%rsp)
	movdqa	.LC263(%rip), %xmm0
	movaps	%xmm0, 7360(%rsp)
	movdqa	.LC264(%rip), %xmm0
	movaps	%xmm0, 7376(%rsp)
	movdqa	.LC265(%rip), %xmm0
	movaps	%xmm0, 7392(%rsp)
	movdqa	.LC266(%rip), %xmm0
	movaps	%xmm0, 7408(%rsp)
	movdqa	.LC267(%rip), %xmm0
	movaps	%xmm0, 7424(%rsp)
	movdqa	.LC268(%rip), %xmm0
	movaps	%xmm0, 7440(%rsp)
	movdqa	.LC269(%rip), %xmm0
	movaps	%xmm0, 7456(%rsp)
	movdqa	.LC270(%rip), %xmm0
	movaps	%xmm0, 7472(%rsp)
	movdqa	.LC271(%rip), %xmm0
	movaps	%xmm0, 7488(%rsp)
	movdqa	.LC272(%rip), %xmm0
	movaps	%xmm0, 7504(%rsp)
	movdqa	.LC273(%rip), %xmm0
	movaps	%xmm0, 7520(%rsp)
	movdqa	.LC274(%rip), %xmm0
	movaps	%xmm0, 7536(%rsp)
	movdqa	.LC275(%rip), %xmm0
	movaps	%xmm0, 7552(%rsp)
	movdqa	.LC276(%rip), %xmm0
	movaps	%xmm0, 7568(%rsp)
	movdqa	.LC277(%rip), %xmm0
	movaps	%xmm0, 7584(%rsp)
	movdqa	.LC278(%rip), %xmm0
	movaps	%xmm0, 7600(%rsp)
	movdqa	.LC279(%rip), %xmm0
	movaps	%xmm0, 7616(%rsp)
	movdqa	.LC280(%rip), %xmm0
	movaps	%xmm0, 7632(%rsp)
	movdqa	.LC281(%rip), %xmm0
	movaps	%xmm0, 7648(%rsp)
	movdqa	.LC282(%rip), %xmm0
	movaps	%xmm0, 7664(%rsp)
	movdqa	.LC283(%rip), %xmm0
	movaps	%xmm0, 7680(%rsp)
	movdqa	.LC284(%rip), %xmm0
	movaps	%xmm0, 7696(%rsp)
	movdqa	.LC285(%rip), %xmm0
	movaps	%xmm0, 7712(%rsp)
	movdqa	.LC286(%rip), %xmm0
	movaps	%xmm0, 7728(%rsp)
	movdqa	.LC287(%rip), %xmm0
	movaps	%xmm0, 7744(%rsp)
	movdqa	.LC288(%rip), %xmm0
	movaps	%xmm0, 7760(%rsp)
	movdqa	.LC289(%rip), %xmm0
	movaps	%xmm0, 7776(%rsp)
	movdqa	.LC290(%rip), %xmm0
	movaps	%xmm0, 7792(%rsp)
	movdqa	.LC291(%rip), %xmm0
	movaps	%xmm0, 7808(%rsp)
	movdqa	.LC292(%rip), %xmm0
	movaps	%xmm0, 7824(%rsp)
	movdqa	.LC293(%rip), %xmm0
	movaps	%xmm0, 7840(%rsp)
	movdqa	.LC294(%rip), %xmm0
	movaps	%xmm0, 7856(%rsp)
	movdqa	.LC295(%rip), %xmm0
	movaps	%xmm0, 7872(%rsp)
	movdqa	.LC296(%rip), %xmm0
	movaps	%xmm0, 7888(%rsp)
	movdqa	.LC297(%rip), %xmm0
	movaps	%xmm0, 7904(%rsp)
	movdqa	.LC298(%rip), %xmm0
	movaps	%xmm0, 7920(%rsp)
	movdqa	.LC299(%rip), %xmm0
	movaps	%xmm0, 7936(%rsp)
	movdqa	.LC300(%rip), %xmm0
	movaps	%xmm0, 7952(%rsp)
	movdqa	.LC301(%rip), %xmm0
	movaps	%xmm0, 7968(%rsp)
	movdqa	.LC302(%rip), %xmm0
	movaps	%xmm0, 7984(%rsp)
	movdqa	.LC303(%rip), %xmm0
	movaps	%xmm0, 8000(%rsp)
	movdqa	.LC304(%rip), %xmm0
	movaps	%xmm0, 8016(%rsp)
	movdqa	.LC305(%rip), %xmm0
	movaps	%xmm0, 8032(%rsp)
	movdqa	.LC306(%rip), %xmm0
	movaps	%xmm0, 8048(%rsp)
	movdqa	.LC307(%rip), %xmm0
	movaps	%xmm0, 8064(%rsp)
	movdqa	.LC308(%rip), %xmm0
	movaps	%xmm0, 8080(%rsp)
	movdqa	.LC309(%rip), %xmm0
	movaps	%xmm0, 8096(%rsp)
	movdqa	.LC310(%rip), %xmm0
	movaps	%xmm0, 8112(%rsp)
	movdqa	.LC311(%rip), %xmm0
	movaps	%xmm0, 8128(%rsp)
	movdqa	.LC312(%rip), %xmm0
	movaps	%xmm0, 8144(%rsp)
	movdqa	.LC313(%rip), %xmm0
	movaps	%xmm0, 8160(%rsp)
	movdqa	.LC314(%rip), %xmm0
	movaps	%xmm0, 8176(%rsp)
	movdqa	.LC315(%rip), %xmm0
	movaps	%xmm0, 8192(%rsp)
	movdqa	.LC316(%rip), %xmm0
	movaps	%xmm0, 8208(%rsp)
	movdqa	.LC317(%rip), %xmm0
	movaps	%xmm0, 8224(%rsp)
	movdqa	.LC318(%rip), %xmm0
	movaps	%xmm0, 8240(%rsp)
	movdqa	.LC319(%rip), %xmm0
	movaps	%xmm0, 8256(%rsp)
	movdqa	.LC320(%rip), %xmm0
	movaps	%xmm0, 8272(%rsp)
	movdqa	.LC321(%rip), %xmm0
	movaps	%xmm0, 8288(%rsp)
	movdqa	.LC322(%rip), %xmm0
	movaps	%xmm0, 8304(%rsp)
	movdqa	.LC323(%rip), %xmm0
	movaps	%xmm0, 8320(%rsp)
	movdqa	.LC324(%rip), %xmm0
	movaps	%xmm0, 8336(%rsp)
	movdqa	.LC325(%rip), %xmm0
	movaps	%xmm0, 8352(%rsp)
	movdqa	.LC326(%rip), %xmm0
	movaps	%xmm0, 8368(%rsp)
	movdqa	.LC327(%rip), %xmm0
	movaps	%xmm0, 8384(%rsp)
	movdqa	.LC328(%rip), %xmm0
	movaps	%xmm0, 8400(%rsp)
	movdqa	.LC329(%rip), %xmm0
	movaps	%xmm0, 8416(%rsp)
	movdqa	.LC330(%rip), %xmm0
	movaps	%xmm0, 8432(%rsp)
	movdqa	.LC331(%rip), %xmm0
	movaps	%xmm0, 8448(%rsp)
	movdqa	.LC332(%rip), %xmm0
	movaps	%xmm0, 8464(%rsp)
	movdqa	.LC333(%rip), %xmm0
	movaps	%xmm0, 8480(%rsp)
	movdqa	.LC334(%rip), %xmm0
	movaps	%xmm0, 8496(%rsp)
	movdqa	.LC335(%rip), %xmm0
	movaps	%xmm0, 8512(%rsp)
	movdqa	.LC336(%rip), %xmm0
	movaps	%xmm0, 8528(%rsp)
	movdqa	.LC337(%rip), %xmm0
	movaps	%xmm0, 8544(%rsp)
	movdqa	.LC338(%rip), %xmm0
	movaps	%xmm0, 8560(%rsp)
	movdqa	.LC339(%rip), %xmm0
	movaps	%xmm0, 8576(%rsp)
	movdqa	.LC340(%rip), %xmm0
	movaps	%xmm0, 8592(%rsp)
	movdqa	.LC341(%rip), %xmm0
	movaps	%xmm0, 8608(%rsp)
	movdqa	.LC342(%rip), %xmm0
	movaps	%xmm0, 8624(%rsp)
	movdqa	.LC343(%rip), %xmm0
	movaps	%xmm0, 8640(%rsp)
	movdqa	.LC344(%rip), %xmm0
	movaps	%xmm0, 8656(%rsp)
	movdqa	.LC345(%rip), %xmm0
	movaps	%xmm0, 8672(%rsp)
	movdqa	.LC346(%rip), %xmm0
	movaps	%xmm0, 8688(%rsp)
	movdqa	.LC347(%rip), %xmm0
	movaps	%xmm0, 8704(%rsp)
	movdqa	.LC348(%rip), %xmm0
	movaps	%xmm0, 8720(%rsp)
	movdqa	.LC349(%rip), %xmm0
	movaps	%xmm0, 8736(%rsp)
	movdqa	.LC350(%rip), %xmm0
	movaps	%xmm0, 8752(%rsp)
	movdqa	.LC351(%rip), %xmm0
	movaps	%xmm0, 8768(%rsp)
	movdqa	.LC352(%rip), %xmm0
	movaps	%xmm0, 8784(%rsp)
	movdqa	.LC353(%rip), %xmm0
	movaps	%xmm0, 8800(%rsp)
	movdqa	.LC354(%rip), %xmm0
	movaps	%xmm0, 8816(%rsp)
	movdqa	.LC355(%rip), %xmm0
	movaps	%xmm0, 8832(%rsp)
	movdqa	.LC356(%rip), %xmm0
	movaps	%xmm0, 8848(%rsp)
	movdqa	.LC357(%rip), %xmm0
	movaps	%xmm0, 8864(%rsp)
	movdqa	.LC358(%rip), %xmm0
	movaps	%xmm0, 8880(%rsp)
	movdqa	.LC359(%rip), %xmm0
	movaps	%xmm0, 8896(%rsp)
	movdqa	.LC360(%rip), %xmm0
	movaps	%xmm0, 8912(%rsp)
	movdqa	.LC361(%rip), %xmm0
	movaps	%xmm0, 8928(%rsp)
	movdqa	.LC362(%rip), %xmm0
	movaps	%xmm0, 8944(%rsp)
	movdqa	.LC363(%rip), %xmm0
	movaps	%xmm0, 8960(%rsp)
	movdqa	.LC364(%rip), %xmm0
	movaps	%xmm0, 8976(%rsp)
	movdqa	.LC365(%rip), %xmm0
	movaps	%xmm0, 8992(%rsp)
	movdqa	.LC366(%rip), %xmm0
	movaps	%xmm0, 9008(%rsp)
	movdqa	.LC367(%rip), %xmm0
	movaps	%xmm0, 9024(%rsp)
	movdqa	.LC368(%rip), %xmm0
	movaps	%xmm0, 9040(%rsp)
	movdqa	.LC369(%rip), %xmm0
	movaps	%xmm0, 9056(%rsp)
	movdqa	.LC370(%rip), %xmm0
	movaps	%xmm0, 9072(%rsp)
	movdqa	.LC371(%rip), %xmm0
	movaps	%xmm0, 9088(%rsp)
	movdqa	.LC372(%rip), %xmm0
	movaps	%xmm0, 9104(%rsp)
	movdqa	.LC373(%rip), %xmm0
	movaps	%xmm0, 9120(%rsp)
	movdqa	.LC374(%rip), %xmm0
	movaps	%xmm0, 9136(%rsp)
	movdqa	.LC375(%rip), %xmm0
	movaps	%xmm0, 9152(%rsp)
	movdqa	.LC376(%rip), %xmm0
	movaps	%xmm0, 9168(%rsp)
	movdqa	.LC377(%rip), %xmm0
	movaps	%xmm0, 9184(%rsp)
	movdqa	.LC378(%rip), %xmm0
	movaps	%xmm0, 9200(%rsp)
	movdqa	.LC379(%rip), %xmm0
	movaps	%xmm0, 9216(%rsp)
	movdqa	.LC380(%rip), %xmm0
	movaps	%xmm0, 9232(%rsp)
	movdqa	.LC381(%rip), %xmm0
	movaps	%xmm0, 9248(%rsp)
	movdqa	.LC382(%rip), %xmm0
	movaps	%xmm0, 9264(%rsp)
	movdqa	.LC383(%rip), %xmm0
	movaps	%xmm0, 9280(%rsp)
	movdqa	.LC384(%rip), %xmm0
	movaps	%xmm0, 9296(%rsp)
	movdqa	.LC385(%rip), %xmm0
	movaps	%xmm0, 9312(%rsp)
	movdqa	.LC386(%rip), %xmm0
	movaps	%xmm0, 9328(%rsp)
	movdqa	.LC387(%rip), %xmm0
	movaps	%xmm0, 9344(%rsp)
	movdqa	.LC388(%rip), %xmm0
	movaps	%xmm0, 9360(%rsp)
	movdqa	.LC389(%rip), %xmm0
	movaps	%xmm0, 9376(%rsp)
	movdqa	.LC390(%rip), %xmm0
	movaps	%xmm0, 9392(%rsp)
	movdqa	.LC391(%rip), %xmm0
	movaps	%xmm0, 9408(%rsp)
	movdqa	.LC392(%rip), %xmm0
	movaps	%xmm0, 9424(%rsp)
	movdqa	.LC393(%rip), %xmm0
	movaps	%xmm0, 9440(%rsp)
	movdqa	.LC394(%rip), %xmm0
	movaps	%xmm0, 9456(%rsp)
	movdqa	.LC395(%rip), %xmm0
	movaps	%xmm0, 9472(%rsp)
	movdqa	.LC396(%rip), %xmm0
	movaps	%xmm0, 9488(%rsp)
	movdqa	.LC397(%rip), %xmm0
	movaps	%xmm0, 9504(%rsp)
	movdqa	.LC398(%rip), %xmm0
	movaps	%xmm0, 9520(%rsp)
	movdqa	.LC399(%rip), %xmm0
	movaps	%xmm0, 9536(%rsp)
	movdqa	.LC400(%rip), %xmm0
	movaps	%xmm0, 9552(%rsp)
	movdqa	.LC401(%rip), %xmm0
	movaps	%xmm0, 9568(%rsp)
	movdqa	.LC402(%rip), %xmm0
	movaps	%xmm0, 9584(%rsp)
	movdqa	.LC403(%rip), %xmm0
	movaps	%xmm0, 9600(%rsp)
	movdqa	.LC404(%rip), %xmm0
	movaps	%xmm0, 9616(%rsp)
	movdqa	.LC405(%rip), %xmm0
	movaps	%xmm0, 9632(%rsp)
	movdqa	.LC406(%rip), %xmm0
	movaps	%xmm0, 9648(%rsp)
	movdqa	.LC407(%rip), %xmm0
	movaps	%xmm0, 9664(%rsp)
	movdqa	.LC408(%rip), %xmm0
	movaps	%xmm0, 9680(%rsp)
	movdqa	.LC409(%rip), %xmm0
	movaps	%xmm0, 9696(%rsp)
	movdqa	.LC410(%rip), %xmm0
	movaps	%xmm0, 9712(%rsp)
	movdqa	.LC411(%rip), %xmm0
	movaps	%xmm0, 9728(%rsp)
	movdqa	.LC412(%rip), %xmm0
	movaps	%xmm0, 9744(%rsp)
	movdqa	.LC413(%rip), %xmm0
	movaps	%xmm0, 9760(%rsp)
	movdqa	.LC414(%rip), %xmm0
	movaps	%xmm0, 9776(%rsp)
	movdqa	.LC415(%rip), %xmm0
	movaps	%xmm0, 9792(%rsp)
	movdqa	.LC416(%rip), %xmm0
	movaps	%xmm0, 9808(%rsp)
	movdqa	.LC417(%rip), %xmm0
	movaps	%xmm0, 9824(%rsp)
	movdqa	.LC418(%rip), %xmm0
	movaps	%xmm0, 9840(%rsp)
	movdqa	.LC419(%rip), %xmm0
	movaps	%xmm0, 9856(%rsp)
	movdqa	.LC420(%rip), %xmm0
	movaps	%xmm0, 9872(%rsp)
	movdqa	.LC421(%rip), %xmm0
	movaps	%xmm0, 9888(%rsp)
	movdqa	.LC422(%rip), %xmm0
	movaps	%xmm0, 9904(%rsp)
	movdqa	.LC423(%rip), %xmm0
	movaps	%xmm0, 9920(%rsp)
	movdqa	.LC424(%rip), %xmm0
	movaps	%xmm0, 9936(%rsp)
	movdqa	.LC425(%rip), %xmm0
	movaps	%xmm0, 9952(%rsp)
	movdqa	.LC426(%rip), %xmm0
	movaps	%xmm0, 9968(%rsp)
	movdqa	.LC427(%rip), %xmm0
	movaps	%xmm0, 9984(%rsp)
	movdqa	.LC428(%rip), %xmm0
	movaps	%xmm0, 10000(%rsp)
	movdqa	.LC429(%rip), %xmm0
	movaps	%xmm0, 10016(%rsp)
	movdqa	.LC430(%rip), %xmm0
	movaps	%xmm0, 10032(%rsp)
	movdqa	.LC431(%rip), %xmm0
	movaps	%xmm0, 10048(%rsp)
	movdqa	.LC432(%rip), %xmm0
	movaps	%xmm0, 10064(%rsp)
	movdqa	.LC433(%rip), %xmm0
	movaps	%xmm0, 10080(%rsp)
	movdqa	.LC434(%rip), %xmm0
	movaps	%xmm0, 10096(%rsp)
	movdqa	.LC435(%rip), %xmm0
	movaps	%xmm0, 10112(%rsp)
	movdqa	.LC436(%rip), %xmm0
	movaps	%xmm0, 10128(%rsp)
	movdqa	.LC437(%rip), %xmm0
	movaps	%xmm0, 10144(%rsp)
	movdqa	.LC438(%rip), %xmm0
	movaps	%xmm0, 10160(%rsp)
	movdqa	.LC439(%rip), %xmm0
	movaps	%xmm0, 10176(%rsp)
	movdqa	.LC440(%rip), %xmm0
	movaps	%xmm0, 10192(%rsp)
	movdqa	.LC441(%rip), %xmm0
	movaps	%xmm0, 10208(%rsp)
	movdqa	.LC442(%rip), %xmm0
	movaps	%xmm0, 10224(%rsp)
	movdqa	.LC443(%rip), %xmm0
	movaps	%xmm0, 10240(%rsp)
	movdqa	.LC444(%rip), %xmm0
	movaps	%xmm0, 10256(%rsp)
	movdqa	.LC445(%rip), %xmm0
	movaps	%xmm0, 10272(%rsp)
	movdqa	.LC446(%rip), %xmm0
	movaps	%xmm0, 10288(%rsp)
	movdqa	.LC447(%rip), %xmm0
	movaps	%xmm0, 10304(%rsp)
	movdqa	.LC448(%rip), %xmm0
	movaps	%xmm0, 10320(%rsp)
	movdqa	.LC449(%rip), %xmm0
	movaps	%xmm0, 10336(%rsp)
	movdqa	.LC450(%rip), %xmm0
	movaps	%xmm0, 10352(%rsp)
	movdqa	.LC451(%rip), %xmm0
	movaps	%xmm0, 10368(%rsp)
	movdqa	.LC452(%rip), %xmm0
	movaps	%xmm0, 10384(%rsp)
	movdqa	.LC453(%rip), %xmm0
	movaps	%xmm0, 10400(%rsp)
	movdqa	.LC454(%rip), %xmm0
	movaps	%xmm0, 10416(%rsp)
	movdqa	.LC455(%rip), %xmm0
	movaps	%xmm0, 10432(%rsp)
	movdqa	.LC456(%rip), %xmm0
	movaps	%xmm0, 10448(%rsp)
	movdqa	.LC457(%rip), %xmm0
	movaps	%xmm0, 10464(%rsp)
	movdqa	.LC458(%rip), %xmm0
	movaps	%xmm0, 10480(%rsp)
	movdqa	.LC459(%rip), %xmm0
	movaps	%xmm0, 10496(%rsp)
	movdqa	.LC460(%rip), %xmm0
	movaps	%xmm0, 10512(%rsp)
	movdqa	.LC461(%rip), %xmm0
	movaps	%xmm0, 10528(%rsp)
	movdqa	.LC462(%rip), %xmm0
	movaps	%xmm0, 10544(%rsp)
	movdqa	.LC463(%rip), %xmm0
	movaps	%xmm0, 10560(%rsp)
	movdqa	.LC464(%rip), %xmm0
	movaps	%xmm0, 10576(%rsp)
	movdqa	.LC465(%rip), %xmm0
	movaps	%xmm0, 10592(%rsp)
	movdqa	.LC466(%rip), %xmm0
	movaps	%xmm0, 10608(%rsp)
	movdqa	.LC467(%rip), %xmm0
	movaps	%xmm0, 10624(%rsp)
	movdqa	.LC468(%rip), %xmm0
	movaps	%xmm0, 10640(%rsp)
	movdqa	.LC469(%rip), %xmm0
	movaps	%xmm0, 10656(%rsp)
	movdqa	.LC470(%rip), %xmm0
	movaps	%xmm0, 10672(%rsp)
	movdqa	.LC471(%rip), %xmm0
	movaps	%xmm0, 10688(%rsp)
	movdqa	.LC472(%rip), %xmm0
	movaps	%xmm0, 10704(%rsp)
	movdqa	.LC473(%rip), %xmm0
	movaps	%xmm0, 10720(%rsp)
	movdqa	.LC474(%rip), %xmm0
	movaps	%xmm0, 10736(%rsp)
	movdqa	.LC475(%rip), %xmm0
	movaps	%xmm0, 10752(%rsp)
	movdqa	.LC476(%rip), %xmm0
	movaps	%xmm0, 10768(%rsp)
	movdqa	.LC477(%rip), %xmm0
	movaps	%xmm0, 10784(%rsp)
	movdqa	.LC478(%rip), %xmm0
	movaps	%xmm0, 10800(%rsp)
	movdqa	.LC479(%rip), %xmm0
	movaps	%xmm0, 10816(%rsp)
	movdqa	.LC480(%rip), %xmm0
	movaps	%xmm0, 10832(%rsp)
	movdqa	.LC481(%rip), %xmm0
	movaps	%xmm0, 10848(%rsp)
	movdqa	.LC482(%rip), %xmm0
	movaps	%xmm0, 10864(%rsp)
	movdqa	.LC483(%rip), %xmm0
	movaps	%xmm0, 10880(%rsp)
	movdqa	.LC484(%rip), %xmm0
	movaps	%xmm0, 10896(%rsp)
	movdqa	.LC485(%rip), %xmm0
	movaps	%xmm0, 10912(%rsp)
	movdqa	.LC486(%rip), %xmm0
	movaps	%xmm0, 10928(%rsp)
	movdqa	.LC487(%rip), %xmm0
	movaps	%xmm0, 10944(%rsp)
	movdqa	.LC488(%rip), %xmm0
	movaps	%xmm0, 10960(%rsp)
	movdqa	.LC489(%rip), %xmm0
	movaps	%xmm0, 10976(%rsp)
	movdqa	.LC490(%rip), %xmm0
	movaps	%xmm0, 10992(%rsp)
	movdqa	.LC491(%rip), %xmm0
	movaps	%xmm0, 11008(%rsp)
	movdqa	.LC492(%rip), %xmm0
	movaps	%xmm0, 11024(%rsp)
	movdqa	.LC493(%rip), %xmm0
	movaps	%xmm0, 11040(%rsp)
	movdqa	.LC494(%rip), %xmm0
	movaps	%xmm0, 11056(%rsp)
	movdqa	.LC495(%rip), %xmm0
	movaps	%xmm0, 11072(%rsp)
	movdqa	.LC496(%rip), %xmm0
	movaps	%xmm0, 11088(%rsp)
	movdqa	.LC497(%rip), %xmm0
	movaps	%xmm0, 11104(%rsp)
	movdqa	.LC498(%rip), %xmm0
	movaps	%xmm0, 11120(%rsp)
	movdqa	.LC499(%rip), %xmm0
	movaps	%xmm0, 11136(%rsp)
	movdqa	.LC500(%rip), %xmm0
	movaps	%xmm0, 11152(%rsp)
	call	new_array_from_c_array
	leaq	1280(%rsp), %r8
	movl	$16, %ecx
	movl	$292, %edx
	movl	$292, %esi
	movq	%rbx, %rdi
	movdqu	144(%rsp), %xmm0
	movq	160(%rsp), %rax
	movups	%xmm0, _const_strconv__ftoa__pow5_split_64(%rip)
	movdqa	.LC501(%rip), %xmm0
	movq	%rax, 16+_const_strconv__ftoa__pow5_split_64(%rip)
	movaps	%xmm0, 1280(%rsp)
	movdqa	.LC502(%rip), %xmm0
	movaps	%xmm0, 1296(%rsp)
	movdqa	.LC503(%rip), %xmm0
	movaps	%xmm0, 1312(%rsp)
	movdqa	.LC504(%rip), %xmm0
	movaps	%xmm0, 1328(%rsp)
	movdqa	.LC505(%rip), %xmm0
	movaps	%xmm0, 1344(%rsp)
	movdqa	.LC506(%rip), %xmm0
	movaps	%xmm0, 1360(%rsp)
	movdqa	.LC507(%rip), %xmm0
	movaps	%xmm0, 1376(%rsp)
	movdqa	.LC508(%rip), %xmm0
	movaps	%xmm0, 1392(%rsp)
	movdqa	.LC509(%rip), %xmm0
	movaps	%xmm0, 1408(%rsp)
	movdqa	.LC510(%rip), %xmm0
	movaps	%xmm0, 1424(%rsp)
	movdqa	.LC511(%rip), %xmm0
	movaps	%xmm0, 1440(%rsp)
	movdqa	.LC512(%rip), %xmm0
	movaps	%xmm0, 1456(%rsp)
	movdqa	.LC513(%rip), %xmm0
	movaps	%xmm0, 1472(%rsp)
	movdqa	.LC514(%rip), %xmm0
	movaps	%xmm0, 1488(%rsp)
	movdqa	.LC515(%rip), %xmm0
	movaps	%xmm0, 1504(%rsp)
	movdqa	.LC516(%rip), %xmm0
	movaps	%xmm0, 1520(%rsp)
	movdqa	.LC517(%rip), %xmm0
	movaps	%xmm0, 1536(%rsp)
	movdqa	.LC518(%rip), %xmm0
	movaps	%xmm0, 1552(%rsp)
	movdqa	.LC519(%rip), %xmm0
	movaps	%xmm0, 1568(%rsp)
	movdqa	.LC520(%rip), %xmm0
	movaps	%xmm0, 1584(%rsp)
	movdqa	.LC521(%rip), %xmm0
	movaps	%xmm0, 1600(%rsp)
	movdqa	.LC522(%rip), %xmm0
	movaps	%xmm0, 1616(%rsp)
	movdqa	.LC523(%rip), %xmm0
	movaps	%xmm0, 1632(%rsp)
	movdqa	.LC524(%rip), %xmm0
	movaps	%xmm0, 1648(%rsp)
	movdqa	.LC525(%rip), %xmm0
	movaps	%xmm0, 1664(%rsp)
	movdqa	.LC526(%rip), %xmm0
	movaps	%xmm0, 1680(%rsp)
	movdqa	.LC527(%rip), %xmm0
	movaps	%xmm0, 1696(%rsp)
	movdqa	.LC528(%rip), %xmm0
	movaps	%xmm0, 1712(%rsp)
	movdqa	.LC529(%rip), %xmm0
	movaps	%xmm0, 1728(%rsp)
	movdqa	.LC530(%rip), %xmm0
	movaps	%xmm0, 1744(%rsp)
	movdqa	.LC531(%rip), %xmm0
	movaps	%xmm0, 1760(%rsp)
	movdqa	.LC532(%rip), %xmm0
	movaps	%xmm0, 1776(%rsp)
	movdqa	.LC533(%rip), %xmm0
	movaps	%xmm0, 1792(%rsp)
	movdqa	.LC534(%rip), %xmm0
	movaps	%xmm0, 1808(%rsp)
	movdqa	.LC535(%rip), %xmm0
	movaps	%xmm0, 1824(%rsp)
	movdqa	.LC536(%rip), %xmm0
	movaps	%xmm0, 1840(%rsp)
	movdqa	.LC537(%rip), %xmm0
	movaps	%xmm0, 1856(%rsp)
	movdqa	.LC538(%rip), %xmm0
	movaps	%xmm0, 1872(%rsp)
	movdqa	.LC539(%rip), %xmm0
	movaps	%xmm0, 1888(%rsp)
	movdqa	.LC540(%rip), %xmm0
	movaps	%xmm0, 1904(%rsp)
	movdqa	.LC541(%rip), %xmm0
	movaps	%xmm0, 1920(%rsp)
	movdqa	.LC542(%rip), %xmm0
	movaps	%xmm0, 1936(%rsp)
	movdqa	.LC543(%rip), %xmm0
	movaps	%xmm0, 1952(%rsp)
	movdqa	.LC544(%rip), %xmm0
	movaps	%xmm0, 1968(%rsp)
	movdqa	.LC545(%rip), %xmm0
	movaps	%xmm0, 1984(%rsp)
	movdqa	.LC546(%rip), %xmm0
	movaps	%xmm0, 2000(%rsp)
	movdqa	.LC547(%rip), %xmm0
	movaps	%xmm0, 2016(%rsp)
	movdqa	.LC548(%rip), %xmm0
	movaps	%xmm0, 2032(%rsp)
	movdqa	.LC549(%rip), %xmm0
	movaps	%xmm0, 2048(%rsp)
	movdqa	.LC550(%rip), %xmm0
	movaps	%xmm0, 2064(%rsp)
	movdqa	.LC551(%rip), %xmm0
	movaps	%xmm0, 2080(%rsp)
	movdqa	.LC552(%rip), %xmm0
	movaps	%xmm0, 2096(%rsp)
	movdqa	.LC553(%rip), %xmm0
	movaps	%xmm0, 2112(%rsp)
	movdqa	.LC554(%rip), %xmm0
	movaps	%xmm0, 2128(%rsp)
	movdqa	.LC555(%rip), %xmm0
	movaps	%xmm0, 2144(%rsp)
	movdqa	.LC556(%rip), %xmm0
	movaps	%xmm0, 2160(%rsp)
	movdqa	.LC557(%rip), %xmm0
	movaps	%xmm0, 2176(%rsp)
	movdqa	.LC558(%rip), %xmm0
	movaps	%xmm0, 2192(%rsp)
	movdqa	.LC559(%rip), %xmm0
	movaps	%xmm0, 2208(%rsp)
	movdqa	.LC560(%rip), %xmm0
	movaps	%xmm0, 2224(%rsp)
	movdqa	.LC561(%rip), %xmm0
	movaps	%xmm0, 2240(%rsp)
	movdqa	.LC562(%rip), %xmm0
	movaps	%xmm0, 2256(%rsp)
	movdqa	.LC563(%rip), %xmm0
	movaps	%xmm0, 2272(%rsp)
	movdqa	.LC564(%rip), %xmm0
	movaps	%xmm0, 2288(%rsp)
	movdqa	.LC565(%rip), %xmm0
	movaps	%xmm0, 2304(%rsp)
	movdqa	.LC566(%rip), %xmm0
	movaps	%xmm0, 2320(%rsp)
	movdqa	.LC567(%rip), %xmm0
	movaps	%xmm0, 2336(%rsp)
	movdqa	.LC568(%rip), %xmm0
	movaps	%xmm0, 2352(%rsp)
	movdqa	.LC569(%rip), %xmm0
	movaps	%xmm0, 2368(%rsp)
	movdqa	.LC570(%rip), %xmm0
	movaps	%xmm0, 2384(%rsp)
	movdqa	.LC571(%rip), %xmm0
	movaps	%xmm0, 2400(%rsp)
	movdqa	.LC572(%rip), %xmm0
	movaps	%xmm0, 2416(%rsp)
	movdqa	.LC573(%rip), %xmm0
	movaps	%xmm0, 2432(%rsp)
	movdqa	.LC574(%rip), %xmm0
	movaps	%xmm0, 2448(%rsp)
	movdqa	.LC575(%rip), %xmm0
	movaps	%xmm0, 2464(%rsp)
	movdqa	.LC576(%rip), %xmm0
	movaps	%xmm0, 2480(%rsp)
	movdqa	.LC577(%rip), %xmm0
	movaps	%xmm0, 2496(%rsp)
	movdqa	.LC578(%rip), %xmm0
	movaps	%xmm0, 2512(%rsp)
	movdqa	.LC579(%rip), %xmm0
	movaps	%xmm0, 2528(%rsp)
	movdqa	.LC580(%rip), %xmm0
	movaps	%xmm0, 2544(%rsp)
	movdqa	.LC581(%rip), %xmm0
	movaps	%xmm0, 2560(%rsp)
	movdqa	.LC582(%rip), %xmm0
	movaps	%xmm0, 2576(%rsp)
	movdqa	.LC583(%rip), %xmm0
	movaps	%xmm0, 2592(%rsp)
	movdqa	.LC584(%rip), %xmm0
	movaps	%xmm0, 2608(%rsp)
	movdqa	.LC585(%rip), %xmm0
	movaps	%xmm0, 2624(%rsp)
	movdqa	.LC586(%rip), %xmm0
	movaps	%xmm0, 2640(%rsp)
	movdqa	.LC587(%rip), %xmm0
	movaps	%xmm0, 2656(%rsp)
	movdqa	.LC588(%rip), %xmm0
	movaps	%xmm0, 2672(%rsp)
	movdqa	.LC589(%rip), %xmm0
	movaps	%xmm0, 2688(%rsp)
	movdqa	.LC590(%rip), %xmm0
	movaps	%xmm0, 2704(%rsp)
	movdqa	.LC591(%rip), %xmm0
	movaps	%xmm0, 2720(%rsp)
	movdqa	.LC592(%rip), %xmm0
	movaps	%xmm0, 2736(%rsp)
	movdqa	.LC593(%rip), %xmm0
	movaps	%xmm0, 2752(%rsp)
	movdqa	.LC594(%rip), %xmm0
	movaps	%xmm0, 2768(%rsp)
	movdqa	.LC595(%rip), %xmm0
	movaps	%xmm0, 2784(%rsp)
	movdqa	.LC596(%rip), %xmm0
	movaps	%xmm0, 2800(%rsp)
	movdqa	.LC597(%rip), %xmm0
	movaps	%xmm0, 2816(%rsp)
	movdqa	.LC598(%rip), %xmm0
	movaps	%xmm0, 2832(%rsp)
	movdqa	.LC599(%rip), %xmm0
	movaps	%xmm0, 2848(%rsp)
	movdqa	.LC600(%rip), %xmm0
	movaps	%xmm0, 2864(%rsp)
	movdqa	.LC601(%rip), %xmm0
	movaps	%xmm0, 2880(%rsp)
	movdqa	.LC602(%rip), %xmm0
	movaps	%xmm0, 2896(%rsp)
	movdqa	.LC603(%rip), %xmm0
	movaps	%xmm0, 2912(%rsp)
	movdqa	.LC604(%rip), %xmm0
	movaps	%xmm0, 2928(%rsp)
	movdqa	.LC605(%rip), %xmm0
	movaps	%xmm0, 2944(%rsp)
	movdqa	.LC606(%rip), %xmm0
	movaps	%xmm0, 2960(%rsp)
	movdqa	.LC607(%rip), %xmm0
	movaps	%xmm0, 2976(%rsp)
	movdqa	.LC608(%rip), %xmm0
	movaps	%xmm0, 2992(%rsp)
	movdqa	.LC609(%rip), %xmm0
	movaps	%xmm0, 3008(%rsp)
	movdqa	.LC610(%rip), %xmm0
	movaps	%xmm0, 3024(%rsp)
	movdqa	.LC611(%rip), %xmm0
	movaps	%xmm0, 3040(%rsp)
	movdqa	.LC612(%rip), %xmm0
	movaps	%xmm0, 3056(%rsp)
	movdqa	.LC613(%rip), %xmm0
	movaps	%xmm0, 3072(%rsp)
	movdqa	.LC614(%rip), %xmm0
	movaps	%xmm0, 3088(%rsp)
	movdqa	.LC615(%rip), %xmm0
	movaps	%xmm0, 3104(%rsp)
	movdqa	.LC616(%rip), %xmm0
	movaps	%xmm0, 3120(%rsp)
	movdqa	.LC617(%rip), %xmm0
	movaps	%xmm0, 3136(%rsp)
	movdqa	.LC618(%rip), %xmm0
	movaps	%xmm0, 3152(%rsp)
	movdqa	.LC619(%rip), %xmm0
	movaps	%xmm0, 3168(%rsp)
	movdqa	.LC620(%rip), %xmm0
	movaps	%xmm0, 3184(%rsp)
	movdqa	.LC621(%rip), %xmm0
	movaps	%xmm0, 3200(%rsp)
	movdqa	.LC622(%rip), %xmm0
	movaps	%xmm0, 3216(%rsp)
	movdqa	.LC623(%rip), %xmm0
	movaps	%xmm0, 3232(%rsp)
	movdqa	.LC624(%rip), %xmm0
	movaps	%xmm0, 3248(%rsp)
	movdqa	.LC625(%rip), %xmm0
	movaps	%xmm0, 3264(%rsp)
	movdqa	.LC626(%rip), %xmm0
	movaps	%xmm0, 3280(%rsp)
	movdqa	.LC627(%rip), %xmm0
	movaps	%xmm0, 3296(%rsp)
	movdqa	.LC628(%rip), %xmm0
	movaps	%xmm0, 3312(%rsp)
	movdqa	.LC629(%rip), %xmm0
	movaps	%xmm0, 3328(%rsp)
	movdqa	.LC630(%rip), %xmm0
	movaps	%xmm0, 3344(%rsp)
	movdqa	.LC631(%rip), %xmm0
	movaps	%xmm0, 3360(%rsp)
	movdqa	.LC632(%rip), %xmm0
	movaps	%xmm0, 3376(%rsp)
	movdqa	.LC633(%rip), %xmm0
	movaps	%xmm0, 3392(%rsp)
	movdqa	.LC634(%rip), %xmm0
	movaps	%xmm0, 3408(%rsp)
	movdqa	.LC635(%rip), %xmm0
	movaps	%xmm0, 3424(%rsp)
	movdqa	.LC636(%rip), %xmm0
	movaps	%xmm0, 3440(%rsp)
	movdqa	.LC637(%rip), %xmm0
	movaps	%xmm0, 3456(%rsp)
	movdqa	.LC638(%rip), %xmm0
	movaps	%xmm0, 3472(%rsp)
	movdqa	.LC639(%rip), %xmm0
	movaps	%xmm0, 3488(%rsp)
	movdqa	.LC640(%rip), %xmm0
	movaps	%xmm0, 3504(%rsp)
	movdqa	.LC641(%rip), %xmm0
	movaps	%xmm0, 3520(%rsp)
	movdqa	.LC642(%rip), %xmm0
	movaps	%xmm0, 3536(%rsp)
	movdqa	.LC643(%rip), %xmm0
	movaps	%xmm0, 3552(%rsp)
	movdqa	.LC644(%rip), %xmm0
	movaps	%xmm0, 3568(%rsp)
	movdqa	.LC645(%rip), %xmm0
	movaps	%xmm0, 3584(%rsp)
	movdqa	.LC646(%rip), %xmm0
	movaps	%xmm0, 3600(%rsp)
	movdqa	.LC647(%rip), %xmm0
	movaps	%xmm0, 3616(%rsp)
	movdqa	.LC648(%rip), %xmm0
	movaps	%xmm0, 3632(%rsp)
	movdqa	.LC649(%rip), %xmm0
	movaps	%xmm0, 3648(%rsp)
	movdqa	.LC650(%rip), %xmm0
	movaps	%xmm0, 3664(%rsp)
	movdqa	.LC651(%rip), %xmm0
	movaps	%xmm0, 3680(%rsp)
	movdqa	.LC652(%rip), %xmm0
	movaps	%xmm0, 3696(%rsp)
	movdqa	.LC653(%rip), %xmm0
	movaps	%xmm0, 3712(%rsp)
	movdqa	.LC654(%rip), %xmm0
	movaps	%xmm0, 3728(%rsp)
	movdqa	.LC655(%rip), %xmm0
	movaps	%xmm0, 3744(%rsp)
	movdqa	.LC656(%rip), %xmm0
	movaps	%xmm0, 3760(%rsp)
	movdqa	.LC657(%rip), %xmm0
	movaps	%xmm0, 3776(%rsp)
	movdqa	.LC658(%rip), %xmm0
	movaps	%xmm0, 3792(%rsp)
	movdqa	.LC659(%rip), %xmm0
	movaps	%xmm0, 3808(%rsp)
	movdqa	.LC660(%rip), %xmm0
	movaps	%xmm0, 3824(%rsp)
	movdqa	.LC661(%rip), %xmm0
	movaps	%xmm0, 3840(%rsp)
	movdqa	.LC662(%rip), %xmm0
	movaps	%xmm0, 3856(%rsp)
	movdqa	.LC663(%rip), %xmm0
	movaps	%xmm0, 3872(%rsp)
	movdqa	.LC664(%rip), %xmm0
	movaps	%xmm0, 3888(%rsp)
	movdqa	.LC665(%rip), %xmm0
	movaps	%xmm0, 3904(%rsp)
	movdqa	.LC666(%rip), %xmm0
	movaps	%xmm0, 3920(%rsp)
	movdqa	.LC667(%rip), %xmm0
	movaps	%xmm0, 3936(%rsp)
	movdqa	.LC668(%rip), %xmm0
	movaps	%xmm0, 3952(%rsp)
	movdqa	.LC669(%rip), %xmm0
	movaps	%xmm0, 3968(%rsp)
	movdqa	.LC670(%rip), %xmm0
	movaps	%xmm0, 3984(%rsp)
	movdqa	.LC671(%rip), %xmm0
	movaps	%xmm0, 4000(%rsp)
	movdqa	.LC672(%rip), %xmm0
	movaps	%xmm0, 4016(%rsp)
	movdqa	.LC673(%rip), %xmm0
	movaps	%xmm0, 4032(%rsp)
	movdqa	.LC674(%rip), %xmm0
	movaps	%xmm0, 4048(%rsp)
	movdqa	.LC675(%rip), %xmm0
	movaps	%xmm0, 4064(%rsp)
	movdqa	.LC676(%rip), %xmm0
	movaps	%xmm0, 4080(%rsp)
	movdqa	.LC677(%rip), %xmm0
	movaps	%xmm0, 4096(%rsp)
	movdqa	.LC678(%rip), %xmm0
	movaps	%xmm0, 4112(%rsp)
	movdqa	.LC679(%rip), %xmm0
	movaps	%xmm0, 4128(%rsp)
	movdqa	.LC680(%rip), %xmm0
	movaps	%xmm0, 4144(%rsp)
	movdqa	.LC681(%rip), %xmm0
	movaps	%xmm0, 4160(%rsp)
	movdqa	.LC682(%rip), %xmm0
	movaps	%xmm0, 4176(%rsp)
	movdqa	.LC683(%rip), %xmm0
	movaps	%xmm0, 4192(%rsp)
	movdqa	.LC684(%rip), %xmm0
	movaps	%xmm0, 4208(%rsp)
	movdqa	.LC685(%rip), %xmm0
	movaps	%xmm0, 4224(%rsp)
	movdqa	.LC686(%rip), %xmm0
	movaps	%xmm0, 4240(%rsp)
	movdqa	.LC687(%rip), %xmm0
	movaps	%xmm0, 4256(%rsp)
	movdqa	.LC688(%rip), %xmm0
	movaps	%xmm0, 4272(%rsp)
	movdqa	.LC689(%rip), %xmm0
	movaps	%xmm0, 4288(%rsp)
	movdqa	.LC690(%rip), %xmm0
	movaps	%xmm0, 4304(%rsp)
	movdqa	.LC691(%rip), %xmm0
	movaps	%xmm0, 4320(%rsp)
	movdqa	.LC692(%rip), %xmm0
	movaps	%xmm0, 4336(%rsp)
	movdqa	.LC693(%rip), %xmm0
	movaps	%xmm0, 4352(%rsp)
	movdqa	.LC694(%rip), %xmm0
	movaps	%xmm0, 4368(%rsp)
	movdqa	.LC695(%rip), %xmm0
	movaps	%xmm0, 4384(%rsp)
	movdqa	.LC696(%rip), %xmm0
	movaps	%xmm0, 4400(%rsp)
	movdqa	.LC697(%rip), %xmm0
	movaps	%xmm0, 4416(%rsp)
	movdqa	.LC698(%rip), %xmm0
	movaps	%xmm0, 4432(%rsp)
	movdqa	.LC699(%rip), %xmm0
	movaps	%xmm0, 4448(%rsp)
	movdqa	.LC700(%rip), %xmm0
	movaps	%xmm0, 4464(%rsp)
	movdqa	.LC701(%rip), %xmm0
	movaps	%xmm0, 4480(%rsp)
	movdqa	.LC702(%rip), %xmm0
	movaps	%xmm0, 4496(%rsp)
	movdqa	.LC703(%rip), %xmm0
	movaps	%xmm0, 4512(%rsp)
	movdqa	.LC704(%rip), %xmm0
	movaps	%xmm0, 4528(%rsp)
	movdqa	.LC705(%rip), %xmm0
	movaps	%xmm0, 4544(%rsp)
	movdqa	.LC706(%rip), %xmm0
	movaps	%xmm0, 4560(%rsp)
	movdqa	.LC707(%rip), %xmm0
	movaps	%xmm0, 4576(%rsp)
	movdqa	.LC708(%rip), %xmm0
	movaps	%xmm0, 4592(%rsp)
	movdqa	.LC709(%rip), %xmm0
	movaps	%xmm0, 4608(%rsp)
	movdqa	.LC710(%rip), %xmm0
	movaps	%xmm0, 4624(%rsp)
	movdqa	.LC711(%rip), %xmm0
	movaps	%xmm0, 4640(%rsp)
	movdqa	.LC712(%rip), %xmm0
	movaps	%xmm0, 4656(%rsp)
	movdqa	.LC713(%rip), %xmm0
	movaps	%xmm0, 4672(%rsp)
	movdqa	.LC714(%rip), %xmm0
	movaps	%xmm0, 4688(%rsp)
	movdqa	.LC715(%rip), %xmm0
	movaps	%xmm0, 4704(%rsp)
	movdqa	.LC716(%rip), %xmm0
	movaps	%xmm0, 4720(%rsp)
	movdqa	.LC717(%rip), %xmm0
	movaps	%xmm0, 4736(%rsp)
	movdqa	.LC718(%rip), %xmm0
	movaps	%xmm0, 4752(%rsp)
	movdqa	.LC719(%rip), %xmm0
	movaps	%xmm0, 4768(%rsp)
	movdqa	.LC720(%rip), %xmm0
	movaps	%xmm0, 4784(%rsp)
	movdqa	.LC721(%rip), %xmm0
	movaps	%xmm0, 4800(%rsp)
	movdqa	.LC722(%rip), %xmm0
	movaps	%xmm0, 4816(%rsp)
	movdqa	.LC723(%rip), %xmm0
	movaps	%xmm0, 4832(%rsp)
	movdqa	.LC724(%rip), %xmm0
	movaps	%xmm0, 4848(%rsp)
	movdqa	.LC725(%rip), %xmm0
	movaps	%xmm0, 4864(%rsp)
	movdqa	.LC726(%rip), %xmm0
	movaps	%xmm0, 4880(%rsp)
	movdqa	.LC727(%rip), %xmm0
	movaps	%xmm0, 4896(%rsp)
	movdqa	.LC728(%rip), %xmm0
	movaps	%xmm0, 4912(%rsp)
	movdqa	.LC729(%rip), %xmm0
	movaps	%xmm0, 4928(%rsp)
	movdqa	.LC730(%rip), %xmm0
	movaps	%xmm0, 4944(%rsp)
	movdqa	.LC731(%rip), %xmm0
	movaps	%xmm0, 4960(%rsp)
	movdqa	.LC732(%rip), %xmm0
	movaps	%xmm0, 4976(%rsp)
	movdqa	.LC733(%rip), %xmm0
	movaps	%xmm0, 4992(%rsp)
	movdqa	.LC734(%rip), %xmm0
	movaps	%xmm0, 5008(%rsp)
	movdqa	.LC735(%rip), %xmm0
	movaps	%xmm0, 5024(%rsp)
	movdqa	.LC736(%rip), %xmm0
	movaps	%xmm0, 5040(%rsp)
	movdqa	.LC737(%rip), %xmm0
	movaps	%xmm0, 5056(%rsp)
	movdqa	.LC738(%rip), %xmm0
	movaps	%xmm0, 5072(%rsp)
	movdqa	.LC739(%rip), %xmm0
	movaps	%xmm0, 5088(%rsp)
	movdqa	.LC740(%rip), %xmm0
	movaps	%xmm0, 5104(%rsp)
	movdqa	.LC741(%rip), %xmm0
	movaps	%xmm0, 5120(%rsp)
	movdqa	.LC742(%rip), %xmm0
	movaps	%xmm0, 5136(%rsp)
	movdqa	.LC743(%rip), %xmm0
	movaps	%xmm0, 5152(%rsp)
	movdqa	.LC744(%rip), %xmm0
	movaps	%xmm0, 5168(%rsp)
	movdqa	.LC745(%rip), %xmm0
	movaps	%xmm0, 5184(%rsp)
	movdqa	.LC746(%rip), %xmm0
	movaps	%xmm0, 5200(%rsp)
	movdqa	.LC747(%rip), %xmm0
	movaps	%xmm0, 5216(%rsp)
	movdqa	.LC748(%rip), %xmm0
	movaps	%xmm0, 5232(%rsp)
	movdqa	.LC749(%rip), %xmm0
	movaps	%xmm0, 5248(%rsp)
	movdqa	.LC750(%rip), %xmm0
	movaps	%xmm0, 5264(%rsp)
	movdqa	.LC751(%rip), %xmm0
	movaps	%xmm0, 5280(%rsp)
	movdqa	.LC752(%rip), %xmm0
	movaps	%xmm0, 5296(%rsp)
	movdqa	.LC753(%rip), %xmm0
	movaps	%xmm0, 5312(%rsp)
	movdqa	.LC754(%rip), %xmm0
	movaps	%xmm0, 5328(%rsp)
	movdqa	.LC755(%rip), %xmm0
	movaps	%xmm0, 5344(%rsp)
	movdqa	.LC756(%rip), %xmm0
	movaps	%xmm0, 5360(%rsp)
	movdqa	.LC757(%rip), %xmm0
	movaps	%xmm0, 5376(%rsp)
	movdqa	.LC758(%rip), %xmm0
	movaps	%xmm0, 5392(%rsp)
	movdqa	.LC759(%rip), %xmm0
	movaps	%xmm0, 5408(%rsp)
	movdqa	.LC760(%rip), %xmm0
	movaps	%xmm0, 5424(%rsp)
	movdqa	.LC761(%rip), %xmm0
	movaps	%xmm0, 5440(%rsp)
	movdqa	.LC762(%rip), %xmm0
	movaps	%xmm0, 5456(%rsp)
	movdqa	.LC763(%rip), %xmm0
	movaps	%xmm0, 5472(%rsp)
	movdqa	.LC764(%rip), %xmm0
	movaps	%xmm0, 5488(%rsp)
	movdqa	.LC765(%rip), %xmm0
	movaps	%xmm0, 5504(%rsp)
	movdqa	.LC766(%rip), %xmm0
	movaps	%xmm0, 5520(%rsp)
	movdqa	.LC767(%rip), %xmm0
	movaps	%xmm0, 5536(%rsp)
	movdqa	.LC768(%rip), %xmm0
	movaps	%xmm0, 5552(%rsp)
	movdqa	.LC769(%rip), %xmm0
	movaps	%xmm0, 5568(%rsp)
	movdqa	.LC770(%rip), %xmm0
	movaps	%xmm0, 5584(%rsp)
	movdqa	.LC771(%rip), %xmm0
	movaps	%xmm0, 5600(%rsp)
	movdqa	.LC772(%rip), %xmm0
	movaps	%xmm0, 5616(%rsp)
	movdqa	.LC773(%rip), %xmm0
	movaps	%xmm0, 5632(%rsp)
	movdqa	.LC774(%rip), %xmm0
	movaps	%xmm0, 5648(%rsp)
	movdqa	.LC775(%rip), %xmm0
	movaps	%xmm0, 5664(%rsp)
	movdqa	.LC776(%rip), %xmm0
	movaps	%xmm0, 5680(%rsp)
	movdqa	.LC777(%rip), %xmm0
	movaps	%xmm0, 5696(%rsp)
	movdqa	.LC778(%rip), %xmm0
	movaps	%xmm0, 5712(%rsp)
	movdqa	.LC779(%rip), %xmm0
	movaps	%xmm0, 5728(%rsp)
	movdqa	.LC780(%rip), %xmm0
	movaps	%xmm0, 5744(%rsp)
	movdqa	.LC781(%rip), %xmm0
	movaps	%xmm0, 5760(%rsp)
	movdqa	.LC782(%rip), %xmm0
	movaps	%xmm0, 5776(%rsp)
	movdqa	.LC783(%rip), %xmm0
	movaps	%xmm0, 5792(%rsp)
	movdqa	.LC784(%rip), %xmm0
	movaps	%xmm0, 5808(%rsp)
	movdqa	.LC785(%rip), %xmm0
	movaps	%xmm0, 5824(%rsp)
	movdqa	.LC786(%rip), %xmm0
	movaps	%xmm0, 5840(%rsp)
	movdqa	.LC787(%rip), %xmm0
	movaps	%xmm0, 5856(%rsp)
	movdqa	.LC788(%rip), %xmm0
	movaps	%xmm0, 5872(%rsp)
	movdqa	.LC789(%rip), %xmm0
	movaps	%xmm0, 5888(%rsp)
	movdqa	.LC790(%rip), %xmm0
	movaps	%xmm0, 5904(%rsp)
	movdqa	.LC791(%rip), %xmm0
	movaps	%xmm0, 5920(%rsp)
	movdqa	.LC792(%rip), %xmm0
	movaps	%xmm0, 5936(%rsp)
	call	new_array_from_c_array
	leaq	224(%rsp), %r8
	movl	$4, %ecx
	movl	$12, %edx
	movl	$12, %esi
	movq	%rbx, %rdi
	movq	160(%rsp), %rax
	movq	$0, _const_strconv__DOUBLE_PLUS_ZERO(%rip)
	movdqu	144(%rsp), %xmm0
	movl	$10, _const_strconv__TEN(%rip)
	movq	%rbp, _const_strconv__max_u64(%rip)
	movq	%rax, 16+_const_strconv__ftoa__pow5_inv_split_64(%rip)
	movabsq	$-6884282663029611473, %rax
	movq	%rax, _const_hash__wyhash__wyp0(%rip)
	movabsq	$-1800455987208640293, %rax
	movups	%xmm0, _const_strconv__ftoa__pow5_inv_split_64(%rip)
	movq	%rax, _const_hash__wyhash__wyp1(%rip)
	movabsq	$-8161530843051276573, %rax
	movdqa	.LC793(%rip), %xmm0
	movq	%rax, _const_hash__wyhash__wyp2(%rip)
	movabsq	$6384245875588680899, %rax
	movq	%rax, _const_hash__wyhash__wyp3(%rip)
	movabsq	$2129725606500045391, %rax
	movaps	%xmm0, 224(%rsp)
	movq	%rax, _const_hash__wyhash__wyp4(%rip)
	movabsq	$-9223372036854775808, %rax
	movdqa	.LC794(%rip), %xmm0
	movq	%rax, _const_strconv__DOUBLE_MINUS_ZERO(%rip)
	movabsq	$9218868437227405312, %rax
	movaps	%xmm0, 240(%rsp)
	movq	%rax, _const_strconv__DOUBLE_PLUS_INFINITY(%rip)
	movabsq	$-4503599627370496, %rax
	movdqa	.LC795(%rip), %xmm0
	movq	%rax, _const_strconv__DOUBLE_MINUS_INFINITY(%rip)
	movaps	%xmm0, 256(%rsp)
	call	new_array_from_c_array
	leaq	272(%rsp), %r8
	movl	$4, %ecx
	movl	$13, %edx
	movl	$13, %esi
	movq	%rbx, %rdi
	movdqu	144(%rsp), %xmm0
	movq	160(%rsp), %rax
	movl	$3600, _const_time__seconds_per_hour(%rip)
	movups	%xmm0, _const_time__month_days(%rip)
	movl	$86400, _const_time__seconds_per_day(%rip)
	movl	$604800, _const_time__seconds_per_week(%rip)
	movdqa	.LC796(%rip), %xmm0
	movq	%rax, 16+_const_time__month_days(%rip)
	movabsq	$-292277022399, %rax
	movl	$146097, _const_time__days_per_400_years(%rip)
	movaps	%xmm0, 272(%rsp)
	movq	%rax, _const_time__absolute_zero_year(%rip)
	movl	$36524, _const_time__days_per_100_years(%rip)
	movdqa	.LC797(%rip), %xmm0
	movl	$1461, _const_time__days_per_4_years(%rip)
	movl	$365, 320(%rsp)
	movaps	%xmm0, 288(%rsp)
	movdqa	.LC798(%rip), %xmm0
	movaps	%xmm0, 304(%rsp)
	call	new_array_from_c_array
	leaq	11168(%rsp), %r8
	movl	$1, %ecx
	movl	$32, %edx
	movl	$32, %esi
	movq	%rbx, %rdi
	movdqu	144(%rsp), %xmm0
	movq	160(%rsp), %rax
	movl	$125613361, _const_math__bits__de_bruijn32(%rip)
	movups	%xmm0, _const_time__days_before(%rip)
	movdqa	.LC799(%rip), %xmm0
	movq	%rax, 16+_const_time__days_before(%rip)
	movaps	%xmm0, 11168(%rsp)
	movdqa	.LC800(%rip), %xmm0
	movaps	%xmm0, 11184(%rsp)
	call	new_array_from_c_array
	leaq	11200(%rsp), %r8
	movl	$1, %ecx
	movl	$64, %edx
	movl	$64, %esi
	movq	%rbx, %rdi
	movdqu	144(%rsp), %xmm0
	movq	160(%rsp), %rax
	movups	%xmm0, _const_math__bits__de_bruijn32tab(%rip)
	movdqa	.LC801(%rip), %xmm0
	movq	%rax, 16+_const_math__bits__de_bruijn32tab(%rip)
	movabsq	$285870213051353865, %rax
	movaps	%xmm0, 11200(%rsp)
	movq	%rax, _const_math__bits__de_bruijn64(%rip)
	movdqa	.LC802(%rip), %xmm0
	movaps	%xmm0, 11216(%rsp)
	movdqa	.LC803(%rip), %xmm0
	movaps	%xmm0, 11232(%rsp)
	movdqa	.LC804(%rip), %xmm0
	movaps	%xmm0, 11248(%rsp)
	call	new_array_from_c_array
	leaq	11264(%rsp), %r8
	movl	$1, %ecx
	movl	$256, %edx
	movl	$256, %esi
	movq	%rbx, %rdi
	movq	160(%rsp), %rax
	movl	%ebp, _const_math__bits__max_u32(%rip)
	movdqu	144(%rsp), %xmm0
	movq	%rbp, _const_math__bits__max_u64(%rip)
	movq	%rax, 16+_const_math__bits__de_bruijn64tab(%rip)
	movabsq	$6148914691236517205, %rax
	movq	%rax, _const_math__bits__m0(%rip)
	movabsq	$3689348814741910323, %rax
	movq	%rax, _const_math__bits__m1(%rip)
	movabsq	$1085102592571150095, %rax
	movups	%xmm0, _const_math__bits__de_bruijn64tab(%rip)
	movq	%rax, _const_math__bits__m2(%rip)
	movabsq	$71777214294589695, %rax
	movdqa	.LC805(%rip), %xmm0
	movq	%rax, _const_math__bits__m3(%rip)
	movabsq	$281470681808895, %rax
	movdqa	.LC807(%rip), %xmm1
	movq	%rax, _const_math__bits__m4(%rip)
	movabsq	$4294967296, %rax
	movdqa	.LC809(%rip), %xmm3
	movq	%rax, _const_math__bits__two32(%rip)
	subq	$1, %rax
	movdqa	.LC808(%rip), %xmm2
	movq	%rax, _const_math__bits__mask32(%rip)
	movaps	%xmm0, 11264(%rsp)
	movaps	%xmm3, 11392(%rsp)
	movaps	%xmm1, 11296(%rsp)
	movaps	%xmm2, 11328(%rsp)
	movaps	%xmm1, 11360(%rsp)
	movaps	%xmm1, 11424(%rsp)
	movaps	%xmm2, 11456(%rsp)
	movdqa	.LC806(%rip), %xmm0
	movaps	%xmm0, 11280(%rsp)
	movaps	%xmm0, 11312(%rsp)
	movaps	%xmm0, 11344(%rsp)
	movaps	%xmm0, 11376(%rsp)
	movaps	%xmm0, 11408(%rsp)
	movaps	%xmm0, 11440(%rsp)
	movaps	%xmm0, 11472(%rsp)
	movaps	%xmm1, 11488(%rsp)
	movaps	%xmm0, 11504(%rsp)
	call	new_array_from_c_array
	leaq	11520(%rsp), %r8
	movl	$1, %ecx
	movl	$256, %edx
	movl	$256, %esi
	movq	%rbx, %rdi
	movdqu	144(%rsp), %xmm0
	movq	160(%rsp), %rax
	movups	%xmm0, _const_math__bits__ntz_8_tab(%rip)
	movdqa	.LC810(%rip), %xmm0
	movq	%rax, 16+_const_math__bits__ntz_8_tab(%rip)
	movaps	%xmm0, 11520(%rsp)
	movdqa	.LC812(%rip), %xmm0
	movdqa	.LC811(%rip), %xmm2
	movdqa	.LC813(%rip), %xmm1
	movaps	%xmm0, 11568(%rsp)
	movaps	%xmm0, 11600(%rsp)
	movaps	%xmm0, 11616(%rsp)
	movaps	%xmm0, 11664(%rsp)
	movaps	%xmm0, 11680(%rsp)
	movaps	%xmm0, 11712(%rsp)
	movaps	%xmm2, 11536(%rsp)
	movaps	%xmm2, 11552(%rsp)
	movaps	%xmm2, 11584(%rsp)
	movaps	%xmm1, 11632(%rsp)
	movaps	%xmm2, 11648(%rsp)
	movaps	%xmm1, 11696(%rsp)
	movaps	%xmm1, 11728(%rsp)
	movaps	%xmm1, 11744(%rsp)
	movdqa	.LC814(%rip), %xmm0
	movaps	%xmm0, 11760(%rsp)
	call	new_array_from_c_array
	leaq	11776(%rsp), %r8
	movl	$1, %ecx
	movl	$256, %edx
	movl	$256, %esi
	movq	%rbx, %rdi
	movdqu	144(%rsp), %xmm0
	movq	160(%rsp), %rax
	movups	%xmm0, _const_math__bits__pop_8_tab(%rip)
	movdqa	.LC815(%rip), %xmm0
	movq	%rax, 16+_const_math__bits__pop_8_tab(%rip)
	movaps	%xmm0, 11776(%rsp)
	movdqa	.LC816(%rip), %xmm0
	movaps	%xmm0, 11792(%rsp)
	movdqa	.LC817(%rip), %xmm0
	movaps	%xmm0, 11808(%rsp)
	movdqa	.LC818(%rip), %xmm0
	movaps	%xmm0, 11824(%rsp)
	movdqa	.LC819(%rip), %xmm0
	movaps	%xmm0, 11840(%rsp)
	movdqa	.LC820(%rip), %xmm0
	movaps	%xmm0, 11856(%rsp)
	movdqa	.LC821(%rip), %xmm0
	movaps	%xmm0, 11872(%rsp)
	movdqa	.LC822(%rip), %xmm0
	movaps	%xmm0, 11888(%rsp)
	movdqa	.LC823(%rip), %xmm0
	movaps	%xmm0, 11904(%rsp)
	movdqa	.LC824(%rip), %xmm0
	movaps	%xmm0, 11920(%rsp)
	movdqa	.LC825(%rip), %xmm0
	movaps	%xmm0, 11936(%rsp)
	movdqa	.LC826(%rip), %xmm0
	movaps	%xmm0, 11952(%rsp)
	movdqa	.LC827(%rip), %xmm0
	movaps	%xmm0, 11968(%rsp)
	movdqa	.LC828(%rip), %xmm0
	movaps	%xmm0, 11984(%rsp)
	movdqa	.LC829(%rip), %xmm0
	movaps	%xmm0, 12000(%rsp)
	movdqa	.LC830(%rip), %xmm0
	movaps	%xmm0, 12016(%rsp)
	call	new_array_from_c_array
	leaq	12032(%rsp), %r8
	movl	$1, %ecx
	movl	$256, %edx
	movl	$256, %esi
	movq	%rbx, %rdi
	movdqu	144(%rsp), %xmm0
	movq	160(%rsp), %rax
	movups	%xmm0, _const_math__bits__rev_8_tab(%rip)
	movdqa	.LC831(%rip), %xmm0
	movq	%rax, 16+_const_math__bits__rev_8_tab(%rip)
	movaps	%xmm0, 12032(%rsp)
	movdqa	.LC832(%rip), %xmm0
	movaps	%xmm0, 12048(%rsp)
	movdqa	.LC833(%rip), %xmm0
	movaps	%xmm0, 12064(%rsp)
	movaps	%xmm0, 12080(%rsp)
	movdqa	.LC834(%rip), %xmm0
	movaps	%xmm0, 12096(%rsp)
	movaps	%xmm0, 12112(%rsp)
	movaps	%xmm0, 12128(%rsp)
	movaps	%xmm0, 12144(%rsp)
	movdqa	.LC835(%rip), %xmm0
	movaps	%xmm0, 12160(%rsp)
	movaps	%xmm0, 12176(%rsp)
	movaps	%xmm0, 12192(%rsp)
	movaps	%xmm0, 12208(%rsp)
	movaps	%xmm0, 12224(%rsp)
	movaps	%xmm0, 12240(%rsp)
	movaps	%xmm0, 12256(%rsp)
	movaps	%xmm0, 12272(%rsp)
	call	new_array_from_c_array
	movq	160(%rsp), %rax
	movdqu	144(%rsp), %xmm0
	movq	%rax, 16+_const_math__bits__len_8_tab(%rip)
	movq	12296(%rsp), %rax
	xorq	%fs:40, %rax
	movups	%xmm0, _const_math__bits__len_8_tab(%rip)
	jne	.L4703
	addq	$12312, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
.L4703:
	.cfi_restore_state
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE529:
	.size	_vinit, .-_vinit
	.section	.text.startup.main,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB367:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	xorl	%eax, %eax
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	$100, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	xorl	%ebp, %ebp
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	call	_vinit
	movl	$10000000, %esi
	movl	$40, %edi
	call	generate_strings
	movq	%rax, %r13
	xorl	%eax, %eax
	leaq	160000000(%r13), %r15
	call	time__ticks
	movq	%rax, %r14
	.p2align 4,,10
	.p2align 3
.L4705:
	movq	%r13, %rbx
	.p2align 4,,10
	.p2align 3
.L4707:
	movslq	8(%rbx), %rdx
	cmpl	24(%rbx), %edx
	jne	.L4706
	movq	16(%rbx), %rsi
	movq	(%rbx), %rdi
	call	memcmp@PLT
	cmpl	$1, %eax
	adcl	$0, %ebp
.L4706:
	addq	$32, %rbx
	cmpq	%r15, %rbx
	jne	.L4707
	subl	$1, %r12d
	jne	.L4705
	xorl	%eax, %eax
	call	time__ticks
	movl	%ebp, %edi
	subq	%r14, %rax
	movq	%rax, %rbx
	call	int_str
	leaq	.LC26(%rip), %rsi
	movq	%rax, %rcx
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	testq	%rbx, %rbx
	movl	$1, %edx
	leaq	.LC80(%rip), %rcx
	jne	.L4714
.L4709:
	leaq	.LC26(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L4714:
	.cfi_restore_state
	movq	%rbx, %rdi
	call	i64_str.part.21
	movq	%rax, %rcx
	jmp	.L4709
	.cfi_endproc
.LFE367:
	.size	main, .-main
	.comm	_const_math__bits__len_8_tab,24,16
	.comm	_const_math__bits__rev_8_tab,24,16
	.comm	_const_math__bits__pop_8_tab,24,16
	.comm	_const_math__bits__ntz_8_tab,24,16
	.comm	_const_math__bits__divide_error,16,16
	.comm	_const_math__bits__overflow_error,16,16
	.comm	_const_math__bits__mask32,8,8
	.comm	_const_math__bits__two32,8,8
	.comm	_const_math__bits__max_u64,8,8
	.comm	_const_math__bits__max_u32,4,4
	.comm	_const_math__bits__m4,8,8
	.comm	_const_math__bits__m3,8,8
	.comm	_const_math__bits__m2,8,8
	.comm	_const_math__bits__m1,8,8
	.comm	_const_math__bits__m0,8,8
	.comm	_const_math__bits__de_bruijn64tab,24,16
	.comm	_const_math__bits__de_bruijn64,8,8
	.comm	_const_math__bits__de_bruijn32tab,24,16
	.comm	_const_math__bits__de_bruijn32,4,4
	.comm	_const_time__days_before,24,16
	.comm	_const_time__days_per_4_years,4,4
	.comm	_const_time__days_per_100_years,4,4
	.comm	_const_time__days_per_400_years,4,4
	.comm	_const_time__seconds_per_week,4,4
	.comm	_const_time__seconds_per_day,4,4
	.comm	_const_time__seconds_per_hour,4,4
	.comm	_const_time__absolute_zero_year,8,8
	.comm	_const_time__months_string,16,16
	.comm	_const_time__month_days,24,16
	.comm	_const_time__days_string,16,16
	.comm	_const_strconv__max_u64,8,8
	.comm	_const_strconv__TEN,4,4
	.comm	_const_strconv__DOUBLE_MINUS_INFINITY,8,8
	.comm	_const_strconv__DOUBLE_PLUS_INFINITY,8,8
	.comm	_const_strconv__DOUBLE_MINUS_ZERO,8,8
	.comm	_const_strconv__DOUBLE_PLUS_ZERO,8,8
	.comm	_const_hash__wyhash__wyp4,8,8
	.comm	_const_hash__wyhash__wyp3,8,8
	.comm	_const_hash__wyhash__wyp2,8,8
	.comm	_const_hash__wyhash__wyp1,8,8
	.comm	_const_hash__wyhash__wyp0,8,8
	.comm	_const_strconv__ftoa__pow5_inv_split_64,24,16
	.comm	_const_strconv__ftoa__pow5_split_64,24,16
	.comm	_const_strconv__ftoa__pow5_inv_split_32,24,16
	.comm	_const_strconv__ftoa__pow5_split_32,24,16
	.comm	_const_strconv__ftoa__powers_of_10,24,16
	.comm	_const_strconv__ftoa__bias64,4,4
	.comm	_const_strconv__ftoa__expbits64,4,4
	.comm	_const_strconv__ftoa__mantbits64,4,4
	.comm	_const_strconv__ftoa__ten_pow_table_64,24,16
	.comm	_const_strconv__ftoa__bias32,4,4
	.comm	_const_strconv__ftoa__expbits32,4,4
	.comm	_const_strconv__ftoa__mantbits32,4,4
	.comm	_const_strconv__ftoa__ten_pow_table_32,24,16
	.comm	g_ustring_runes,24,16
	.comm	_const_children_bytes,4,4
	.comm	_const_max_size,4,4
	.comm	_const_mid_index,4,4
	.comm	_const_probe_inc,4,4
	.comm	_const_hash_mask,4,4
	.comm	_const_init_cap,4,4
	.comm	_const_max_load_factor,8,8
	.comm	_const_init_capicity,4,4
	.comm	_const_digit_pairs,16,16
	.comm	nr_mallocs,4,4
	.comm	total_m,8,8
	.comm	g_m2_ptr,8,8
	.comm	g_m2_buf,8,8
	.comm	g_str_buf,1024,32
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC29:
	.long	2147483648
	.long	0
	.long	0
	.long	0
	.align 16
.LC31:
	.long	0
	.long	-2147483648
	.long	0
	.long	0
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC32:
	.long	0
	.long	1018167296
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC33:
	.long	872415232
	.section	.rodata.cst16
	.align 16
.LC75:
	.value	255
	.value	255
	.value	255
	.value	255
	.value	255
	.value	255
	.value	255
	.value	255
	.align 16
.LC76:
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.byte	9
	.align 16
.LC77:
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.align 16
.LC78:
	.byte	87
	.byte	87
	.byte	87
	.byte	87
	.byte	87
	.byte	87
	.byte	87
	.byte	87
	.byte	87
	.byte	87
	.byte	87
	.byte	87
	.byte	87
	.byte	87
	.byte	87
	.byte	87
	.align 16
.LC79:
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.byte	15
	.section	.rodata.cst8
	.align 8
.LC101:
	.long	0
	.long	1072693248
	.align 8
.LC102:
	.long	0
	.long	1079574528
	.section	.rodata.cst4
	.align 4
.LC103:
	.long	1065353216
	.align 4
.LC104:
	.long	1073741824
	.section	.rodata.cst16
	.align 16
.LC142:
	.long	0
	.long	3
	.long	2
	.long	5
	.align 16
.LC143:
	.long	0
	.long	3
	.long	5
	.long	1
	.align 16
.LC144:
	.long	4
	.long	6
	.long	2
	.long	4
	.section	.rodata.cst8
	.align 8
.LC146:
	.long	2576980378
	.long	1072273817
	.section	.rodata.cst16
	.align 16
.LC147:
	.long	1
	.long	10
	.long	100
	.long	1000
	.align 16
.LC148:
	.long	10000
	.long	100000
	.long	1000000
	.long	10000000
	.align 16
.LC149:
	.long	100000000
	.long	1000000000
	.long	1410065408
	.long	1215752192
	.align 16
.LC150:
	.quad	1
	.quad	10
	.align 16
.LC151:
	.quad	100
	.quad	1000
	.align 16
.LC152:
	.quad	10000
	.quad	100000
	.align 16
.LC153:
	.quad	1000000
	.quad	10000000
	.align 16
.LC154:
	.quad	100000000
	.quad	1000000000
	.align 16
.LC155:
	.quad	10000000000
	.quad	100000000000
	.align 16
.LC156:
	.quad	1000000000000
	.quad	10000000000000
	.align 16
.LC157:
	.quad	100000000000000
	.quad	1000000000000000
	.align 16
.LC158:
	.quad	10000000000000000
	.quad	100000000000000000
	.align 16
.LC159:
	.quad	1000000000000000000
	.quad	-8446744073709551616
	.align 16
.LC160:
	.quad	576460752303423489
	.quad	461168601842738791
	.align 16
.LC161:
	.quad	368934881474191033
	.quad	295147905179352826
	.align 16
.LC162:
	.quad	472236648286964522
	.quad	377789318629571618
	.align 16
.LC163:
	.quad	302231454903657294
	.quad	483570327845851670
	.align 16
.LC164:
	.quad	386856262276681336
	.quad	309485009821345069
	.align 16
.LC165:
	.quad	495176015714152110
	.quad	396140812571321688
	.align 16
.LC166:
	.quad	316912650057057351
	.quad	507060240091291761
	.align 16
.LC167:
	.quad	405648192073033409
	.quad	324518553658426727
	.align 16
.LC168:
	.quad	519229685853482763
	.quad	415383748682786211
	.align 16
.LC169:
	.quad	332306998946228969
	.quad	531691198313966350
	.align 16
.LC170:
	.quad	425352958651173080
	.quad	340282366920938464
	.align 16
.LC171:
	.quad	544451787073501542
	.quad	435561429658801234
	.align 16
.LC172:
	.quad	348449143727040987
	.quad	557518629963265579
	.align 16
.LC173:
	.quad	446014903970612463
	.quad	356811923176489971
	.align 16
.LC174:
	.quad	570899077082383953
	.quad	456719261665907162
	.align 16
.LC175:
	.quad	0
	.quad	72057594037927936
	.align 16
.LC176:
	.quad	0
	.quad	90071992547409920
	.align 16
.LC177:
	.quad	0
	.quad	112589990684262400
	.align 16
.LC178:
	.quad	0
	.quad	140737488355328000
	.align 16
.LC179:
	.quad	0
	.quad	87960930222080000
	.align 16
.LC180:
	.quad	0
	.quad	109951162777600000
	.align 16
.LC181:
	.quad	0
	.quad	137438953472000000
	.align 16
.LC182:
	.quad	0
	.quad	85899345920000000
	.align 16
.LC183:
	.quad	0
	.quad	107374182400000000
	.align 16
.LC184:
	.quad	0
	.quad	134217728000000000
	.align 16
.LC185:
	.quad	0
	.quad	83886080000000000
	.align 16
.LC186:
	.quad	0
	.quad	104857600000000000
	.align 16
.LC187:
	.quad	0
	.quad	131072000000000000
	.align 16
.LC188:
	.quad	0
	.quad	81920000000000000
	.align 16
.LC189:
	.quad	0
	.quad	102400000000000000
	.align 16
.LC190:
	.quad	0
	.quad	128000000000000000
	.align 16
.LC191:
	.quad	0
	.quad	80000000000000000
	.align 16
.LC192:
	.quad	0
	.quad	100000000000000000
	.align 16
.LC193:
	.quad	0
	.quad	125000000000000000
	.align 16
.LC194:
	.quad	0
	.quad	78125000000000000
	.align 16
.LC195:
	.quad	0
	.quad	97656250000000000
	.align 16
.LC196:
	.quad	0
	.quad	122070312500000000
	.align 16
.LC197:
	.quad	0
	.quad	76293945312500000
	.align 16
.LC198:
	.quad	0
	.quad	95367431640625000
	.align 16
.LC199:
	.quad	0
	.quad	119209289550781250
	.align 16
.LC200:
	.quad	4611686018427387904
	.quad	74505805969238281
	.align 16
.LC201:
	.quad	-8070450532247928832
	.quad	93132257461547851
	.align 16
.LC202:
	.quad	8358680908399640576
	.quad	116415321826934814
	.align 16
.LC203:
	.quad	612489549322387456
	.quad	72759576141834259
	.align 16
.LC204:
	.quad	-3846074081774403584
	.quad	90949470177292823
	.align 16
.LC205:
	.quad	-4807592602218004480
	.quad	113686837721616029
	.align 16
.LC206:
	.quad	3213881284082270208
	.quad	142108547152020037
	.align 16
.LC207:
	.quad	4314518811765112832
	.quad	88817841970012523
	.align 16
.LC208:
	.quad	781462496279003136
	.quad	111022302462515654
	.align 16
.LC209:
	.quad	-8246543916506021888
	.quad	138777878078144567
	.align 16
.LC210:
	.quad	-5154089947816263680
	.quad	86736173798840354
	.align 16
.LC211:
	.quad	7392445620511834112
	.quad	108420217248550443
	.align 16
.LC212:
	.quad	4628871007212404736
	.quad	135525271560688054
	.align 16
.LC213:
	.quad	-1718641638919634944
	.quad	84703294725430033
	.align 16
.LC214:
	.quad	7075069988205232128
	.quad	105879118406787542
	.align 16
.LC215:
	.quad	-379534551598235648
	.quad	132348898008484427
	.align 16
.LC216:
	.quad	8986162942105878528
	.quad	82718061255302767
	.align 16
.LC217:
	.quad	6621017659204960256
	.quad	103397576569128459
	.align 16
.LC218:
	.quad	3664586055578812416
	.quad	129246970711410574
	.align 16
.LC219:
	.quad	-2321319733690630144
	.quad	80779356694631608
	.align 16
.LC220:
	.quad	1710036351314100224
	.quad	100974195868289511
	.align 16
.LC221:
	.quad	-2474140579284762624
	.quad	126217744835361888
	.align 16
.LC222:
	.quad	-8463866889694058496
	.quad	78886090522101180
	.align 16
.LC223:
	.quad	-5968147593690185216
	.quad	98607613152626475
	.align 16
.LC224:
	.quad	-7460184492112731520
	.quad	123259516440783094
	.align 16
.LC225:
	.quad	2254913720070624656
	.quad	77037197775489434
	.align 16
.LC226:
	.quad	-6404729886766494988
	.quad	96296497219361792
	.align 16
.LC227:
	.quad	-3394226340030730831
	.quad	120370621524202240
	.align 16
.LC228:
	.quad	-9038920490160288626
	.quad	75231638452626400
	.align 16
.LC229:
	.quad	-6686964594272972878
	.quad	94039548065783000
	.align 16
.LC230:
	.quad	-3747019724413828194
	.quad	117549435082228750
	.align 16
.LC231:
	.quad	4575641699882439235
	.quad	73468396926392969
	.align 16
.LC232:
	.quad	-8115505930429114668
	.quad	91835496157991211
	.align 16
.LC233:
	.quad	8302361660673158281
	.quad	114794370197489014
	.align 16
.LC234:
	.quad	1154580038986672043
	.quad	143492962746861268
	.align 16
.LC235:
	.quad	-8501759512488105781
	.quad	89683101716788292
	.align 16
.LC236:
	.quad	-6015513372182744323
	.quad	112103877145985365
	.align 16
.LC237:
	.quad	1703980321626345405
	.quad	140129846432481707
	.align 16
.LC238:
	.quad	-1240855308197228074
	.quad	87581154020301066
	.align 16
.LC239:
	.quad	-6162755153673922997
	.quad	109476442525376333
	.align 16
.LC240:
	.quad	1519928094762372062
	.quad	136845553156720417
	.align 16
.LC241:
	.quad	-5967573968414599317
	.quad	85528470722950260
	.align 16
.LC242:
	.quad	-2847781442090861242
	.quad	106910588403687825
	.align 16
.LC243:
	.quad	5663645234241199255
	.quad	133638235504609782
	.align 16
.LC244:
	.quad	-1071907747026638370
	.quad	83523897190381113
	.align 16
.LC245:
	.quad	7883487353071477846
	.quad	104404871487976392
	.align 16
.LC246:
	.quad	-8592384882370204308
	.quad	130506089359970490
	.align 16
.LC247:
	.quad	-7676083560695071645
	.quad	81566305849981556
	.align 16
.LC248:
	.quad	-4983418432441451652
	.quad	101957882312476945
	.align 16
.LC249:
	.quad	2994098996302961243
	.quad	127447352890596182
	.align 16
.LC250:
	.quad	-2740374145738037127
	.quad	79654595556622613
	.align 16
.LC251:
	.quad	5797904354682229399
	.quad	99568244445778267
	.align 16
.LC252:
	.quad	2635694424925398845
	.quad	124460305557222834
	.align 16
.LC253:
	.quad	6258995034005762182
	.quad	77787690973264271
	.align 16
.LC254:
	.quad	3212057774079814824
	.quad	97234613716580339
	.align 16
.LC255:
	.quad	-596613800827619374
	.quad	121543267145725423
	.align 16
.LC256:
	.quad	-372883625517262109
	.quad	75964541966078389
	.align 16
.LC257:
	.quad	8757267504958198172
	.quad	94955677457597987
	.align 16
.LC258:
	.quad	6334898362770359811
	.quad	118694596821997484
	.align 16
.LC259:
	.quad	-5264060560123300927
	.quad	74184123013748427
	.align 16
.LC260:
	.quad	-6580075700154126158
	.quad	92730153767185534
	.align 16
.LC261:
	.quad	5609963430089506015
	.quad	115912692208981918
	.align 16
.LC262:
	.quad	-1105458874621446645
	.quad	72445432630613698
	.align 16
.LC263:
	.quad	-5993509611704196210
	.quad	90556790788267123
	.align 16
.LC264:
	.quad	-7491887014630245263
	.quad	113195988485333904
	.align 16
.LC265:
	.quad	-4753172749860418674
	.quad	141494985606667380
	.align 16
.LC266:
	.quad	-664889959449067720
	.quad	88434366004167112
	.align 16
.LC267:
	.quad	3780573569116053255
	.quad	110542957505208891
	.align 16
.LC268:
	.quad	114030942967678664
	.quad	138178696881511114
	.align 16
.LC269:
	.quad	4682955357782187069
	.quad	86361685550944446
	.align 16
.LC270:
	.quad	-3369677839627041972
	.quad	107952106938680557
	.align 16
.LC271:
	.quad	5011274737320973344
	.quad	134940133673350697
	.align 16
.LC272:
	.quad	-3785482316815473516
	.quad	84337583545844185
	.align 16
.LC273:
	.quad	4491519140835433913
	.quad	105421979432305232
	.align 16
.LC274:
	.quad	5614398926044292391
	.quad	131777474290381540
	.align 16
.LC275:
	.quad	-5714372708077093064
	.quad	82360921431488462
	.align 16
.LC276:
	.quad	6692092170185797382
	.quad	102951151789360578
	.align 16
.LC277:
	.quad	-858256824122529080
	.quad	128688939736700722
	.align 16
.LC278:
	.quad	-2842253524290274627
	.quad	80430587335437951
	.align 16
.LC279:
	.quad	-3552816905362843284
	.quad	100538234169297439
	.align 16
.LC280:
	.quad	-4441021131703554105
	.quad	125672792711621799
	.align 16
.LC281:
	.quad	-2775638207314721316
	.quad	78545495444763624
	.align 16
.LC282:
	.quad	1142138259283986260
	.quad	98181869305954531
	.align 16
.LC283:
	.quad	-3184013194322405079
	.quad	122727336632443163
	.align 16
.LC284:
	.quad	7233363790403272633
	.quad	76704585395276977
	.align 16
.LC285:
	.quad	-4793353317278072920
	.quad	95880731744096221
	.align 16
.LC286:
	.quad	3231680390257184658
	.quad	119850914680120277
	.align 16
.LC287:
	.quad	4325643253124434363
	.quad	74906821675075173
	.align 16
.LC288:
	.quad	-8428003988876620758
	.quad	93633527093843966
	.align 16
.LC289:
	.quad	3300053069186387764
	.quad	117041908867304958
	.align 16
.LC290:
	.quad	-2549152850185895552
	.quad	73151193042065598
	.align 16
.LC291:
	.quad	-7798127081159757343
	.quad	91438991302581998
	.align 16
.LC292:
	.quad	4087399203832467033
	.quad	114298739128227498
	.align 16
.LC293:
	.quad	-4114123032064192017
	.quad	142873423910284372
	.align 16
.LC294:
	.quad	-265483885826426059
	.quad	89295889943927732
	.align 16
.LC295:
	.quad	4279831161144355331
	.quad	111619862429909666
	.align 16
.LC296:
	.quad	-3873583085424331644
	.quad	139524828037387082
	.align 16
.LC297:
	.quad	-4726832437603901230
	.quad	87203017523366926
	.align 16
.LC298:
	.quad	7926517508277287175
	.quad	109003771904208658
	.align 16
.LC299:
	.quad	684774848491833161
	.quad	136254714880260823
	.align 16
.LC300:
	.quad	7345513307948477581
	.quad	85159196800163014
	.align 16
.LC301:
	.quad	-41480401919178831
	.quad	106448996000203767
	.align 16
.LC302:
	.quad	-51850502398973539
	.quad	133061245000254709
	.align 16
.LC303:
	.quad	-4644092582426746366
	.quad	83163278125159193
	.align 16
.LC304:
	.quad	3418256308821342851
	.quad	103954097656448992
	.align 16
.LC305:
	.quad	4272820386026678563
	.quad	129942622070561240
	.align 16
.LC306:
	.quad	2670512741266674102
	.quad	81214138794100775
	.align 16
.LC307:
	.quad	-1273545091844045277
	.quad	101517673492625968
	.align 16
.LC308:
	.quad	3019754653622331308
	.quad	126897091865782461
	.align 16
.LC309:
	.quad	4193189667727651020
	.quad	79310682416114038
	.align 16
.LC310:
	.quad	-3981884952195212033
	.quad	99138353020142547
	.align 16
.LC311:
	.quad	-4977356190244015042
	.quad	123922941275178184
	.align 16
.LC312:
	.quad	8418367427165960359
	.quad	77451838296986365
	.align 16
.LC313:
	.quad	-3312098771324713263
	.quad	96814797871232956
	.align 16
.LC314:
	.quad	471562554271496325
	.quad	121018497339041196
	.align 16
.LC315:
	.quad	-8928645440435090605
	.quad	75636560836900747
	.align 16
.LC316:
	.quad	7285937273165688360
	.quad	94545701046125934
	.align 16
.LC317:
	.quad	-115950445397665358
	.quad	118182126307657417
	.align 16
.LC318:
	.quad	4539216990053847055
	.quad	73863828942285886
	.align 16
.LC319:
	.quad	-3549350799287466989
	.quad	92329786177857357
	.align 16
.LC320:
	.quad	4786683537745442072
	.quad	115412232722321697
	.align 16
.LC321:
	.quad	-3925851816550180561
	.quad	72132645451451060
	.align 16
.LC322:
	.quad	-295628752260337798
	.quad	90165806814313825
	.align 16
.LC323:
	.quad	8853836096529353561
	.quad	112707258517892282
	.align 16
.LC324:
	.quad	1843923083806916143
	.quad	140884073147365353
	.align 16
.LC325:
	.quad	-5765077100261759267
	.quad	88052545717103345
	.align 16
.LC326:
	.quad	2017025661527576725
	.quad	110065682146379182
	.align 16
.LC327:
	.quad	-6702089959945304902
	.quad	137582102682973977
	.align 16
.LC328:
	.quad	422879793461572340
	.quad	85988814176858736
	.align 16
.LC329:
	.quad	528599741826965425
	.quad	107486017721073420
	.align 16
.LC330:
	.quad	660749677283706782
	.quad	134357522151341775
	.align 16
.LC331:
	.quad	7330497575943398595
	.quad	83973451344588609
	.align 16
.LC332:
	.quad	-4671936085352915469
	.quad	104966814180735761
	.align 16
.LC333:
	.quad	3383451930163631472
	.quad	131208517725919702
	.align 16
.LC334:
	.quad	-2497028562075118234
	.quad	82005323578699813
	.align 16
.LC335:
	.quad	6102086334260878016
	.quad	102506654473374767
	.align 16
.LC336:
	.quad	3015921899398709616
	.quad	128133318091718459
	.align 16
.LC337:
	.quad	-420891822089500442
	.quad	80083323807324036
	.align 16
.LC338:
	.quad	4085571240815512351
	.quad	100104154759155046
	.align 16
.LC339:
	.quad	-4116407985835385369
	.quad	125130193448943807
	.align 16
.LC340:
	.quad	-2572754991147115856
	.quad	78206370905589879
	.align 16
.LC341:
	.quad	-3215943738933894820
	.quad	97757963631987349
	.align 16
.LC342:
	.quad	5203442363187407284
	.quad	122197454539984187
	.align 16
.LC343:
	.quad	946308467778435600
	.quad	76373409087490117
	.align 16
.LC344:
	.quad	5794571603150432404
	.quad	95466761359362646
	.align 16
.LC345:
	.quad	-1980157532916735303
	.quad	119333451699203307
	.align 16
.LC346:
	.quad	7985773578781816244
	.quad	74583407312002067
	.align 16
.LC347:
	.quad	5370530955049882401
	.quad	93229259140002584
	.align 16
.LC348:
	.quad	6713163693812353001
	.quad	116536573925003230
	.align 16
.LC349:
	.quad	-415958709794667279
	.quad	72835358703127018
	.align 16
.LC350:
	.quad	-5131634405670722002
	.quad	91044198378908773
	.align 16
.LC351:
	.quad	2808829029766373305
	.quad	113805247973635967
	.align 16
.LC352:
	.quad	-1100649731219421272
	.quad	142256559967044958
	.align 16
.LC353:
	.quad	6229622945628943561
	.quad	88910349979403099
	.align 16
.LC354:
	.quad	3175342663608791547
	.quad	111137937474253874
	.align 16
.LC355:
	.quad	-5254193707343786374
	.quad	138922421842817342
	.align 16
.LC356:
	.quad	3633657960551215372
	.quad	86826513651760839
	.align 16
.LC357:
	.quad	-69613567738368689
	.quad	108533142064701048
	.align 16
.LC358:
	.quad	4524669058754427043
	.quad	135666427580876311
	.align 16
.LC359:
	.quad	-8701296884346952858
	.quad	84791517238047694
	.align 16
.LC360:
	.quad	2958436949848472639
	.quad	105989396547559618
	.align 16
.LC361:
	.quad	-5525325849544185009
	.quad	132486745684449522
	.align 16
.LC362:
	.quad	-5759171665178809583
	.quad	82804216052780951
	.align 16
.LC363:
	.quad	-7198964581473511978
	.quad	103505270065976189
	.align 16
.LC364:
	.quad	224666310012885835
	.quad	129381587582470237
	.align 16
.LC365:
	.quad	2446259452971747599
	.quad	80863492239043898
	.align 16
.LC366:
	.quad	-6165547720640091309
	.quad	101079365298804872
	.align 16
.LC367:
	.quad	-3095248632372726232
	.quad	126349206623506090
	.align 16
.LC368:
	.quad	-4240373404446647847
	.quad	78968254139691306
	.align 16
.LC369:
	.quad	8534591299723853903
	.quad	98710317674614133
	.align 16
.LC370:
	.quad	-3166818930627346333
	.quad	123387897093267666
	.align 16
.LC371:
	.quad	-4285104840855785410
	.quad	77117435683292291
	.align 16
.LC372:
	.quad	-5356381051069731763
	.quad	96396794604115364
	.align 16
.LC373:
	.quad	-2083790295409776800
	.quad	120495993255144205
	.align 16
.LC374:
	.quad	-5914054953058498404
	.quad	75309995784465128
	.align 16
.LC375:
	.quad	-2780882672895735101
	.quad	94137494730581410
	.align 16
.LC376:
	.quad	-8087789359547056780
	.quad	117671868413226763
	.align 16
.LC377:
	.quad	4168503687137865320
	.quad	73544917758266727
	.align 16
.LC378:
	.quad	598943590494943747
	.quad	91931147197833409
	.align 16
.LC379:
	.quad	5360365506546067587
	.quad	114913933997291761
	.align 16
.LC380:
	.quad	-7134601172099579228
	.quad	143642417496614701
	.align 16
.LC381:
	.quad	-9070811750989624921
	.quad	89776510935384188
	.align 16
.LC382:
	.quad	-6726828670309643248
	.quad	112220638669230235
	.align 16
.LC383:
	.quad	-8408535837887054059
	.quad	140275798336537794
	.align 16
.LC384:
	.quad	-7561177907893102739
	.quad	87672373960336121
	.align 16
.LC385:
	.quad	-228100348011602616
	.quad	109590467450420151
	.align 16
.LC386:
	.quad	-285125435014503270
	.quad	136988084313025189
	.align 16
.LC387:
	.quad	-4789889415311452448
	.quad	85617552695640743
	.align 16
.LC388:
	.quad	-5987361769139315560
	.quad	107021940869550929
	.align 16
.LC389:
	.quad	1739169825430631358
	.quad	133777426086938662
	.align 16
.LC390:
	.quad	-3524704877533243305
	.quad	83610891304336663
	.align 16
.LC391:
	.quad	-4405881096916554131
	.quad	104513614130420829
	.align 16
.LC392:
	.quad	3716020665709083144
	.quad	130642017663026037
	.align 16
.LC393:
	.quad	4628355925281870917
	.quad	81651261039391273
	.align 16
.LC394:
	.quad	-8049613148679825066
	.quad	102064076299239091
	.align 16
.LC395:
	.quad	8384727637859770284
	.quad	127580095374048864
	.align 16
.LC396:
	.quad	5240454773662356427
	.quad	79737559608780540
	.align 16
.LC397:
	.quad	6550568467077945534
	.quad	99671949510975675
	.align 16
.LC398:
	.quad	3576524565420044014
	.quad	124589936888719594
	.align 16
.LC399:
	.quad	6847013871814915412
	.quad	77868710555449746
	.align 16
.LC400:
	.quad	-664604697086131542
	.quad	97335888194312182
	.align 16
.LC401:
	.quad	-5442441889785052332
	.quad	121669860242890228
	.align 16
.LC402:
	.quad	-1095683171901963756
	.quad	76043662651806392
	.align 16
.LC403:
	.quad	3242082053549933210
	.quad	95054578314757991
	.align 16
.LC404:
	.quad	-559083451489971392
	.quad	118818222893447488
	.align 16
.LC405:
	.quad	-7266956184822313976
	.quad	74261389308404680
	.align 16
.LC406:
	.quad	-4472009212600504566
	.quad	92826736635505850
	.align 16
.LC407:
	.quad	8245046539531533005
	.quad	116033420794382313
	.align 16
.LC408:
	.quad	-1764374940433873728
	.quad	72520887996488945
	.align 16
.LC409:
	.quad	7017903361312433648
	.quad	90651109995611182
	.align 16
.LC410:
	.quad	-450992835214233748
	.quad	113313887494513977
	.align 16
.LC411:
	.quad	8659630992836983623
	.quad	141642359368142472
	.align 16
.LC412:
	.quad	5412269370523114764
	.quad	88526474605089045
	.align 16
.LC413:
	.quad	-7069721342128270257
	.quad	110658093256361306
	.align 16
.LC414:
	.quad	4997906377621825891
	.quad	138322616570451633
	.align 16
.LC415:
	.quad	-3793837541627440674
	.quad	86451635356532270
	.align 16
.LC416:
	.quad	9092761128247862869
	.quad	108064544195665338
	.align 16
.LC417:
	.quad	2142579373455052779
	.quad	135080680244581673
	.align 16
.LC418:
	.quad	-5578416919231673869
	.quad	84425425152863545
	.align 16
.LC419:
	.quad	2250350887815183471
	.quad	105531781441079432
	.align 16
.LC420:
	.quad	2812938609768979339
	.quad	131914726801349290
	.align 16
.LC421:
	.quad	6369772649532999991
	.quad	82446704250843306
	.align 16
.LC422:
	.quad	-1261156224938525819
	.quad	103058380313554132
	.align 16
.LC423:
	.quad	3035240737254230630
	.quad	128822975391942666
	.align 16
.LC424:
	.quad	6508711479211282048
	.quad	80514359619964166
	.align 16
.LC425:
	.quad	-1087482687840673248
	.quad	100642949524955207
	.align 16
.LC426:
	.quad	-1359353359800841560
	.quad	125803686906194009
	.align 16
.LC427:
	.quad	3762090168551861929
	.quad	78627304316371256
	.align 16
.LC428:
	.quad	4702612710689827411
	.quad	98284130395464070
	.align 16
.LC429:
	.quad	-3345106148492491544
	.quad	122855162994330087
	.align 16
.LC430:
	.quad	-2090691342807807215
	.quad	76784476871456304
	.align 16
.LC431:
	.quad	1998321839917628885
	.quad	95980596089320381
	.align 16
.LC432:
	.quad	7109588318324424010
	.quad	119975745111650476
	.align 16
.LC433:
	.quad	-4779879337902010802
	.quad	74984840694781547
	.align 16
.LC434:
	.quad	-5974849172377513502
	.quad	93731050868476934
	.align 16
.LC435:
	.quad	6366496589810271835
	.quad	117163813585596168
	.align 16
.LC436:
	.quad	3979060368631419896
	.quad	73227383490997605
	.align 16
.LC437:
	.quad	-8861232594492888841
	.quad	91534229363747006
	.align 16
.LC438:
	.quad	2758517312166052660
	.quad	114417786704683758
	.align 16
.LC439:
	.quad	-5775225396647209982
	.quad	143022233380854697
	.align 16
.LC440:
	.quad	1002170145522881665
	.quad	89388895863034186
	.align 16
.LC441:
	.quad	-7970659354951173727
	.quad	111736119828792732
	.align 16
.LC442:
	.quad	-5351638175261579254
	.quad	139670149785990915
	.align 16
.LC443:
	.quad	5878598177316288774
	.quad	87293843616244322
	.align 16
.LC444:
	.quad	-1875124315209414841
	.quad	109117304520305402
	.align 16
.LC445:
	.quad	-6955591412439156455
	.quad	136396630650381753
	.align 16
.LC446:
	.quad	264441385652915120
	.quad	85247894156488596
	.align 16
.LC447:
	.quad	330551732066143900
	.quad	106559867695610745
	.align 16
.LC448:
	.quad	5024875683510067779
	.quad	133199834619513431
	.align 16
.LC449:
	.quad	-8388667743874677398
	.quad	83249896637195894
	.align 16
.LC450:
	.quad	3349223375438816964
	.quad	104062370796494868
	.align 16
.LC451:
	.quad	4186529219298521205
	.quad	130077963495618585
	.align 16
.LC452:
	.quad	-4300948265579506103
	.quad	81298727184761615
	.align 16
.LC453:
	.quad	-5376185331974382629
	.quad	101623408980952019
	.align 16
.LC454:
	.quad	-6720231664967978286
	.quad	127029261226190024
	.align 16
.LC455:
	.quad	7329070255463483331
	.quad	79393288266368765
	.align 16
.LC456:
	.quad	-4673720235952809548
	.quad	99241610332960956
	.align 16
.LC457:
	.quad	-1230464276513624031
	.quad	124052012916201195
	.align 16
.LC458:
	.quad	8454331864033760789
	.quad	77532508072625747
	.align 16
.LC459:
	.quad	5956228811614813082
	.quad	96915635090782184
	.align 16
.LC460:
	.quad	7445286014518516353
	.quad	121144543863477730
	.align 16
.LC461:
	.quad	-9181754296208090992
	.quad	75715339914673581
	.align 16
.LC462:
	.quad	-2253820833405337932
	.quad	94644174893341976
	.align 16
.LC463:
	.quad	1794409976670715490
	.quad	118305218616677471
	.align 16
.LC464:
	.quad	8039035263060279037
	.quad	73940761635423419
	.align 16
.LC465:
	.quad	5437108060397960892
	.quad	92425952044279274
	.align 16
.LC466:
	.quad	-2426986961357324693
	.quad	115532440055349092
	.align 16
.LC467:
	.quad	788976158365366019
	.quad	72207775034593183
	.align 16
.LC468:
	.quad	-3625465820470680380
	.quad	90259718793241478
	.align 16
.LC469:
	.quad	-9143518294015738379
	.quad	112824648491551848
	.align 16
.LC470:
	.quad	-6817711849092285070
	.quad	141030810614439810
	.align 16
.LC471:
	.quad	-6566912914896372121
	.quad	88144256634024881
	.align 16
.LC472:
	.quad	1014730893234310657
	.quad	110180320792531102
	.align 16
.LC473:
	.quad	-7954958420311887487
	.quad	137725400990663877
	.align 16
.LC474:
	.quad	8863209042587234033
	.quad	86078375619164923
	.align 16
.LC475:
	.quad	6467325284806654637
	.quad	107597969523956154
	.align 16
.LC476:
	.quad	-1139215430846457512
	.quad	134497461904945192
	.align 16
.LC477:
	.quad	-7629538671920117801
	.quad	84060913690590745
	.align 16
.LC478:
	.quad	-313551303045371443
	.quad	105076142113238431
	.align 16
.LC479:
	.quad	-391939128806714304
	.quad	131345177641548039
	.align 16
.LC480:
	.quad	-244961955504196440
	.quad	82090736025967524
	.align 16
.LC481:
	.quad	4305483574047142354
	.quad	102613420032459406
	.align 16
.LC482:
	.quad	-3841517569295847865
	.quad	128266775040574257
	.align 16
.LC483:
	.quad	2210737537617482988
	.quad	80166734400358911
	.align 16
.LC484:
	.quad	-1848264096405534169
	.quad	100208418000448638
	.align 16
.LC485:
	.quad	-6922016138934305615
	.quad	125260522500560798
	.align 16
.LC486:
	.quad	2591268940807140847
	.quad	78287826562850499
	.align 16
.LC487:
	.quad	-1372599842418461846
	.quad	97859783203563123
	.align 16
.LC488:
	.quad	-1715749803023077307
	.quad	122324729004453904
	.align 16
.LC489:
	.quad	-7989872654530505173
	.quad	76452955627783690
	.align 16
.LC490:
	.quad	3847717237119032246
	.quad	95566194534729613
	.align 16
.LC491:
	.quad	-9025411508883373405
	.quad	119457743168412016
	.align 16
.LC492:
	.quad	5888332853016361382
	.quad	74661089480257510
	.align 16
.LC493:
	.quad	-1862955970584324080
	.quad	93326361850321887
	.align 16
.LC494:
	.quad	-2328694963230405100
	.quad	116657952312902359
	.align 16
.LC495:
	.quad	-1455434352019003188
	.quad	72911220195563974
	.align 16
.LC496:
	.quad	-6430978958451141889
	.quad	91139025244454968
	.align 16
.LC497:
	.quad	-3427037679636539457
	.quad	113923781555568710
	.align 16
.LC498:
	.quad	-8895483117973062225
	.quad	142404726944460888
	.align 16
.LC499:
	.quad	5969538097335305869
	.quad	89002954340288055
	.align 16
.LC500:
	.quad	2850236603241744433
	.quad	111253692925360069
	.align 16
.LC501:
	.quad	1
	.quad	288230376151711744
	.align 16
.LC502:
	.quad	3689348814741910324
	.quad	230584300921369395
	.align 16
.LC503:
	.quad	2951479051793528259
	.quad	184467440737095516
	.align 16
.LC504:
	.quad	-1328165573307087716
	.quad	147573952589676412
	.align 16
.LC505:
	.quad	-5814413732033250669
	.quad	236118324143482260
	.align 16
.LC506:
	.quad	-8340879800368510858
	.quad	188894659314785808
	.align 16
.LC507:
	.quad	-2983355025552898363
	.quad	151115727451828646
	.align 16
.LC508:
	.quad	-1084019226142727058
	.quad	241785163922925834
	.align 16
.LC509:
	.quad	-867215380914181647
	.quad	193428131138340667
	.align 16
.LC510:
	.quad	6684925324752475329
	.quad	154742504910672534
	.align 16
.LC511:
	.quad	-372165924621770443
	.quad	247588007857076054
	.align 16
.LC512:
	.quad	-297732739697416354
	.quad	198070406285660843
	.align 16
.LC513:
	.quad	3451162622983977240
	.quad	158456325028528675
	.align 16
.LC514:
	.quad	5521860196774363583
	.quad	253530120045645880
	.align 16
.LC515:
	.quad	4417488157419490867
	.quad	202824096036516704
	.align 16
.LC516:
	.quad	7223339340677503017
	.quad	162259276829213363
	.align 16
.LC517:
	.quad	7867994130342094503
	.quad	259614842926741381
	.align 16
.LC518:
	.quad	2605046489531765280
	.quad	207691874341393105
	.align 16
.LC519:
	.quad	2084037191625412224
	.quad	166153499473114484
	.align 16
.LC520:
	.quad	-7733586937625071412
	.quad	265845599156983174
	.align 16
.LC521:
	.quad	-6186869550100057129
	.quad	212676479325586539
	.align 16
.LC522:
	.quad	-4949495640080045703
	.quad	170141183460469231
	.align 16
.LC523:
	.quad	-4229844209386162803
	.quad	272225893536750770
	.align 16
.LC524:
	.quad	-7073224182250840565
	.quad	217780714829400616
	.align 16
.LC525:
	.quad	5409467098425058518
	.quad	174224571863520493
	.align 16
.LC526:
	.quad	4965798542738183305
	.quad	278759314981632789
	.align 16
.LC527:
	.quad	7661987648932456967
	.quad	223007451985306231
	.align 16
.LC528:
	.quad	2440241304404055250
	.quad	178405961588244985
	.align 16
.LC529:
	.quad	3904386087046488400
	.quad	285449538541191976
	.align 16
.LC530:
	.quad	-565839945104719603
	.quad	228359630832953580
	.align 16
.LC531:
	.quad	-4142020770825686005
	.quad	182687704666362864
	.align 16
.LC532:
	.quad	-3313616616660548804
	.quad	146150163733090291
	.align 16
.LC533:
	.quad	-1612437771914967764
	.quad	233840261972944466
	.align 16
.LC534:
	.quad	-8668647847015794857
	.quad	187072209578355573
	.align 16
.LC535:
	.quad	-3245569462870725563
	.quad	149657767662684458
	.align 16
.LC536:
	.quad	2185786488890659746
	.quad	239452428260295134
	.align 16
.LC537:
	.quad	5437978005854438120
	.quad	191561942608236107
	.align 16
.LC538:
	.quad	-3028315224800270150
	.quad	153249554086588885
	.align 16
.LC539:
	.quad	6222742084545298729
	.quad	245199286538542217
	.align 16
.LC540:
	.quad	-2400503961847581663
	.quad	196159429230833773
	.align 16
.LC541:
	.quad	1768945645263844993
	.quad	156927543384667019
	.align 16
.LC542:
	.quad	-8237733411803578981
	.quad	251084069415467230
	.align 16
.LC543:
	.quad	8167208529524778108
	.quad	200867255532373784
	.align 16
.LC544:
	.quad	-8223628435347818806
	.quad	160693804425899027
	.align 16
.LC545:
	.quad	1599589762411131202
	.quad	257110087081438444
	.align 16
.LC546:
	.quad	4969020624670815285
	.quad	205688069665150755
	.align 16
.LC547:
	.quad	3975216499736652228
	.quad	164550455732120604
	.align 16
.LC548:
	.quad	-4707700044647087405
	.quad	263280729171392966
	.align 16
.LC549:
	.quad	7301886408508061046
	.quad	210624583337114373
	.align 16
.LC550:
	.quad	-5226537317419282133
	.quad	168499666669691498
	.align 16
.LC551:
	.quad	-983762078387030766
	.quad	269599466671506397
	.align 16
.LC552:
	.quad	6591687966774196033
	.quad	215679573337205118
	.align 16
.LC553:
	.quad	-5794696070806374143
	.quad	172543658669764094
	.align 16
.LC554:
	.quad	9175230360419352987
	.quad	276069853871622551
	.align 16
.LC555:
	.quad	3650835473593572067
	.quad	220855883097298041
	.align 16
.LC556:
	.quad	-768680435867052670
	.quad	176684706477838432
	.align 16
.LC557:
	.quad	-4919237512129194595
	.quad	282695530364541492
	.align 16
.LC558:
	.quad	3443307619780464970
	.quad	226156424291633194
	.align 16
.LC559:
	.quad	6443994910566282300
	.quad	180925139433306555
	.align 16
.LC560:
	.quad	5155195928453025840
	.quad	144740111546645244
	.align 16
.LC561:
	.quad	-2819732958700889626
	.quad	231584178474632390
	.align 16
.LC562:
	.quad	-5945135181702622024
	.quad	185267342779705912
	.align 16
.LC563:
	.quad	2622589484121723027
	.quad	148213874223764730
	.align 16
.LC564:
	.quad	4196143174594756843
	.quad	237142198758023568
	.align 16
.LC565:
	.quad	-7711131904549925495
	.quad	189713759006418854
	.align 16
.LC566:
	.quad	-6168905523639940396
	.quad	151771007205135083
	.align 16
.LC567:
	.quad	-2491551208340083987
	.quad	242833611528216133
	.align 16
.LC568:
	.quad	1696107848069843133
	.quad	194266889222572907
	.align 16
.LC569:
	.quad	-6021811351027946140
	.quad	155413511378058325
	.align 16
.LC570:
	.quad	1433148282581017146
	.quad	248661618204893321
	.align 16
.LC571:
	.quad	-2542830188677096606
	.quad	198929294563914656
	.align 16
.LC572:
	.quad	9033782293284053685
	.quad	159143435651131725
	.align 16
.LC573:
	.quad	-3992692404455065721
	.quad	254629497041810760
	.align 16
.LC574:
	.quad	-6883502738305962900
	.quad	203703597633448608
	.align 16
.LC575:
	.quad	-1817453375902859996
	.quad	162962878106758886
	.align 16
.LC576:
	.quad	781423413297334329
	.quad	260740604970814219
	.align 16
.LC577:
	.quad	4314487545379777786
	.quad	208592483976651375
	.align 16
.LC578:
	.quad	3451590036303822229
	.quad	166873987181321100
	.align 16
.LC579:
	.quad	5522544058086115566
	.quad	266998379490113760
	.align 16
.LC580:
	.quad	4418035246468892453
	.quad	213598703592091008
	.align 16
.LC581:
	.quad	-7533618247050617007
	.quad	170878962873672806
	.align 16
.LC582:
	.quad	-8364440380539076888
	.quad	273406340597876490
	.align 16
.LC583:
	.quad	8065842954536379782
	.quad	218725072478301192
	.align 16
.LC584:
	.quad	-926023265854716821
	.quad	174980057982640953
	.align 16
.LC585:
	.quad	5897060404116273733
	.quad	279968092772225526
	.align 16
.LC586:
	.quad	1028299508551108663
	.quad	223974474217780421
	.align 16
.LC587:
	.quad	-2866709207901023392
	.quad	179179579374224336
	.align 16
.LC588:
	.quad	-897385917899727105
	.quad	286687326998758938
	.align 16
.LC589:
	.quad	2971440080422128639
	.quad	229349861599007151
	.align 16
.LC590:
	.quad	-1312196750404207412
	.quad	183479889279205720
	.align 16
.LC591:
	.quad	-4739106215065276252
	.quad	146783911423364576
	.align 16
.LC592:
	.quad	-3893221129362531681
	.quad	234854258277383322
	.align 16
.LC593:
	.quad	4264120725993795302
	.quad	187883406621906658
	.align 16
.LC594:
	.quad	-7656749863430694728
	.quad	150306725297525326
	.align 16
.LC595:
	.quad	-8561450966747201242
	.quad	240490760476040522
	.align 16
.LC596:
	.quad	529536856086059653
	.quad	192392608380832418
	.align 16
.LC597:
	.quad	7802327114352668369
	.quad	153914086704665934
	.align 16
.LC598:
	.quad	1415676938738538420
	.quad	246262538727465495
	.align 16
.LC599:
	.quad	1132541550990830736
	.quad	197010030981972396
	.align 16
.LC600:
	.quad	-2783315573949245734
	.quad	157608024785577916
	.align 16
.LC601:
	.quad	-763956103576882852
	.quad	252172839656924666
	.align 16
.LC602:
	.quad	-7989862512345326928
	.quad	201738271725539733
	.align 16
.LC603:
	.quad	-2702541195134351219
	.quad	161390617380431786
	.align 16
.LC604:
	.quad	-634717097473051627
	.quad	258224987808690858
	.align 16
.LC605:
	.quad	3181575136763469022
	.quad	206579990246952687
	.align 16
.LC606:
	.quad	-4833437520073045429
	.quad	165263992197562149
	.align 16
.LC607:
	.quad	-7733500032116872687
	.quad	264422387516099439
	.align 16
.LC608:
	.quad	-6186800025693498149
	.quad	211537910012879551
	.align 16
.LC609:
	.quad	6118606423670932450
	.quad	169230328010303641
	.align 16
.LC610:
	.quad	2411072648389671274
	.quad	270768524816485826
	.align 16
.LC611:
	.quad	-1760490696030173304
	.quad	216614819853188660
	.align 16
.LC612:
	.quad	-5097741371566048966
	.quad	173291855882550928
	.align 16
.LC613:
	.quad	-777688565021857700
	.quad	277266969412081485
	.align 16
.LC614:
	.quad	-4311499666759396483
	.quad	221813575529665188
	.align 16
.LC615:
	.quad	240149081334393137
	.quad	177450860423732151
	.align 16
.LC616:
	.quad	-6994459099348791628
	.quad	283921376677971441
	.align 16
.LC617:
	.quad	5472479164746697667
	.quad	227137101342377153
	.align 16
.LC618:
	.quad	-6690063112428372836
	.quad	181709681073901722
	.align 16
.LC619:
	.quad	2026647139541122378
	.quad	145367744859121378
	.align 16
.LC620:
	.quad	-446713391476114519
	.quad	232588391774594204
	.align 16
.LC621:
	.quad	-357370713180891615
	.quad	186070713419675363
	.align 16
.LC622:
	.quad	3403452244197197031
	.quad	148856570735740291
	.align 16
.LC623:
	.quad	-1933174038768305396
	.quad	238170513177184465
	.align 16
.LC624:
	.quad	-5235888045756554640
	.quad	190536410541747572
	.align 16
.LC625:
	.quad	3189987192878576934
	.quad	152429128433398058
	.align 16
.LC626:
	.quad	1414630693863812771
	.quad	243886605493436893
	.align 16
.LC627:
	.quad	8510402184574870864
	.quad	195109284394749514
	.align 16
.LC628:
	.quad	-7949073511307744602
	.quad	156087427515799611
	.align 16
.LC629:
	.quad	-9029168803350481040
	.quad	249739884025279378
	.align 16
.LC630:
	.quad	-3533986227938474509
	.quad	199791907220223502
	.align 16
.LC631:
	.quad	4551508647133041040
	.quad	159833525776178802
	.align 16
.LC632:
	.quad	-7474981423554775630
	.quad	255733641241886083
	.align 16
.LC633:
	.quad	-2290636324101910181
	.quad	204586912993508866
	.align 16
.LC634:
	.quad	-9211206688765348791
	.quad	163669530394807093
	.align 16
.LC635:
	.quad	-7359233072540737419
	.quad	261871248631691349
	.align 16
.LC636:
	.quad	-5887386458032589935
	.quad	209496998905353079
	.align 16
.LC637:
	.quad	-4709909166426071948
	.quad	167597599124282463
	.align 16
.LC638:
	.quad	-157157036797894471
	.quad	268156158598851941
	.align 16
.LC639:
	.quad	-7504423258922136223
	.quad	214524926879081553
	.align 16
.LC640:
	.quad	-2314189792395798655
	.quad	171619941503265242
	.align 16
.LC641:
	.quad	-7392052482575188172
	.quad	274591906405224388
	.align 16
.LC642:
	.quad	-2224293171318240214
	.quad	219673525124179510
	.align 16
.LC643:
	.quad	-5468783351796502494
	.quad	175738820099343608
	.align 16
.LC644:
	.quad	-1371355733390583345
	.quad	281182112158949773
	.align 16
.LC645:
	.quad	2592264228029443648
	.quad	224945689727159819
	.align 16
.LC646:
	.quad	5763160197165465241
	.quad	179956551781727855
	.align 16
.LC647:
	.quad	9221056315464744386
	.quad	287930482850764568
	.align 16
.LC648:
	.quad	-3691201391853935461
	.quad	230344386280611654
	.align 16
.LC649:
	.quad	-2952961113483148369
	.quad	184275509024489323
	.align 16
.LC650:
	.quad	1326979923955391628
	.quad	147420407219591459
	.align 16
.LC651:
	.quad	-8944878565897104364
	.quad	235872651551346334
	.align 16
.LC652:
	.quad	-7155902852717683491
	.quad	188698121241077067
	.align 16
.LC653:
	.quad	1653975347309673853
	.quad	150958496992861654
	.align 16
.LC654:
	.quad	-8421685888530252805
	.quad	241533595188578646
	.align 16
.LC655:
	.quad	4330697733401528726
	.quad	193226876150862917
	.align 16
.LC656:
	.quad	-3914139442762597665
	.quad	154581500920690333
	.align 16
.LC657:
	.quad	1116074521063664381
	.quad	247330401473104534
	.align 16
.LC658:
	.quad	4582208431592841828
	.quad	197864321178483627
	.align 16
.LC659:
	.quad	-3712930884209547184
	.quad	158291456942786901
	.align 16
.LC660:
	.quad	-2251340599993365171
	.quad	253266331108459042
	.align 16
.LC661:
	.quad	5577625149489128510
	.quad	202613064886767234
	.align 16
.LC662:
	.quad	8151448934333213131
	.quad	162090451909413787
	.align 16
.LC663:
	.quad	-1715076964034500283
	.quad	259344723055062059
	.align 16
.LC664:
	.quad	-1372061571227600226
	.quad	207475778444049647
	.align 16
.LC665:
	.quad	6281048372501740465
	.quad	165980622755239718
	.align 16
.LC666:
	.quad	6360328581260874421
	.quad	265568996408383549
	.align 16
.LC667:
	.quad	8777611679750609860
	.quad	212455197126706839
	.align 16
.LC668:
	.quad	-7735305915167153405
	.quad	169964157701365471
	.align 16
.LC669:
	.quad	-8687140649525535124
	.quad	271942652322184754
	.align 16
.LC670:
	.quad	-6949712519620428099
	.quad	217554121857747803
	.align 16
.LC671:
	.quad	-1870421200954432156
	.quad	174043297486198242
	.align 16
.LC672:
	.quad	-6682022736269001774
	.quad	278469275977917188
	.align 16
.LC673:
	.quad	-1656269374273291096
	.quad	222775420782333750
	.align 16
.LC674:
	.quad	-5014364314160543200
	.quad	178220336625867000
	.align 16
.LC675:
	.quad	3045063541568861850
	.quad	285152538601387201
	.align 16
.LC676:
	.quad	-1253297981486820843
	.quad	228122030881109760
	.align 16
.LC677:
	.quad	-4691987199931366998
	.quad	182497624704887808
	.align 16
.LC678:
	.quad	-64240945203183275
	.quad	145998099763910246
	.align 16
.LC679:
	.quad	3586563302416817083
	.quad	233596959622256395
	.align 16
.LC680:
	.quad	2869250641933453667
	.quad	186877567697805116
	.align 16
.LC681:
	.quad	-1393948301195147390
	.quad	149502054158244092
	.align 16
.LC682:
	.quad	-5919666096654146147
	.quad	239203286653190548
	.align 16
.LC683:
	.quad	-1046384062581406594
	.quad	191362629322552438
	.align 16
.LC684:
	.quad	2852241564676785048
	.quad	153090103458041951
	.align 16
.LC685:
	.quad	-2815111126000964570
	.quad	244944165532867121
	.align 16
.LC686:
	.quad	8815957543424959314
	.quad	195955332426293697
	.align 16
.LC687:
	.quad	-325931594743853195
	.quad	156764265941034957
	.align 16
.LC688:
	.quad	-4210839366332075436
	.quad	250822825505655932
	.align 16
.LC689:
	.quad	4010026136418160298
	.quad	200658260404524746
	.align 16
.LC690:
	.quad	-481327905607382085
	.quad	160526608323619796
	.align 16
.LC691:
	.quad	2919224165770098987
	.quad	256842573317791675
	.align 16
.LC692:
	.quad	2335379332616079190
	.quad	205474058654233340
	.align 16
.LC693:
	.quad	1868303466092863352
	.quad	164379246923386672
	.align 16
.LC694:
	.quad	6678634360490491686
	.quad	263006795077418675
	.align 16
.LC695:
	.quad	5342907488392393349
	.quad	210405436061934940
	.align 16
.LC696:
	.quad	4274325990713914679
	.quad	168324348849547952
	.align 16
.LC697:
	.quad	-7918473673825377807
	.quad	269318958159276723
	.align 16
.LC698:
	.quad	-2645430124318391922
	.quad	215455166527421378
	.align 16
.LC699:
	.quad	1573004715287196786
	.quad	172364133221937103
	.align 16
.LC700:
	.quad	-1172541270282395466
	.quad	275782613155099364
	.align 16
.LC701:
	.quad	-938033016225916373
	.quad	220626090524079491
	.align 16
.LC702:
	.quad	-8129124042464553745
	.quad	176500872419263593
	.align 16
.LC703:
	.quad	-5627900838459465345
	.quad	282401395870821749
	.align 16
.LC704:
	.quad	-4502320670767572276
	.quad	225921116696657399
	.align 16
.LC705:
	.quad	-3601856536614057821
	.quad	180736893357325919
	.align 16
.LC706:
	.quad	-2881485229291246257
	.quad	144589514685860735
	.align 16
.LC707:
	.quad	6457670077359736959
	.quad	231343223497377177
	.align 16
.LC708:
	.quad	-2212561567596031079
	.quad	185074578797901741
	.align 16
.LC709:
	.quad	-9148746883560645510
	.quad	148059663038321393
	.align 16
.LC710:
	.quad	-7259297384213212170
	.quad	236895460861314229
	.align 16
.LC711:
	.quad	-5807437907370569736
	.quad	189516368689051383
	.align 16
.LC712:
	.quad	-956601511154545465
	.quad	151613094951241106
	.align 16
.LC713:
	.quad	2158786396894637579
	.quad	242580951921985771
	.align 16
.LC714:
	.quad	-1962319697226200260
	.quad	194064761537588616
	.align 16
.LC715:
	.quad	-8948553387264780854
	.quad	155251809230070893
	.align 16
.LC716:
	.quad	-6938987790139828721
	.quad	248402894768113429
	.align 16
.LC717:
	.quad	-5551190232111862977
	.quad	198722315814490743
	.align 16
.LC718:
	.quad	-751603370947580058
	.quad	158977852651592594
	.align 16
.LC719:
	.quad	-1202565393516128093
	.quad	254364564242548151
	.align 16
.LC720:
	.quad	-8340749944296723121
	.quad	203491651394038521
	.align 16
.LC721:
	.quad	4395446488788352473
	.quad	162793321115230817
	.align 16
.LC722:
	.quad	-7724680876906277336
	.quad	260469313784369307
	.align 16
.LC723:
	.quad	1198952927958798777
	.quad	208375451027495446
	.align 16
.LC724:
	.quad	-2730186472374871301
	.quad	166700360821996356
	.align 16
.LC725:
	.quad	-678949541057883759
	.quad	266720577315194170
	.align 16
.LC726:
	.quad	-4232508447588217330
	.quad	213376461852155336
	.align 16
.LC727:
	.quad	7682039686155157106
	.quad	170701169481724269
	.align 16
.LC728:
	.quad	1223217053622520399
	.quad	273121871170758831
	.align 16
.LC729:
	.quad	-2710775171843894004
	.quad	218497496936607064
	.align 16
.LC730:
	.quad	-2168620137475115203
	.quad	174797997549285651
	.align 16
.LC731:
	.quad	219556594781725998
	.quad	279676796078857043
	.align 16
.LC732:
	.quad	7554342905309201445
	.quad	223741436863085634
	.align 16
.LC733:
	.quad	-8713920934720280137
	.quad	178993149490468507
	.align 16
.LC734:
	.quad	815121763415193074
	.quad	286389039184749612
	.align 16
.LC735:
	.quad	-6726600218751666187
	.quad	229111231347799689
	.align 16
.LC736:
	.quad	-5381280175001332950
	.quad	183288985078239751
	.align 16
.LC737:
	.quad	6763022304224664610
	.quad	146631188062591801
	.align 16
.LC738:
	.quad	3442138057275642729
	.quad	234609900900146882
	.align 16
.LC739:
	.quad	-4624987183663306463
	.quad	187687920720117505
	.align 16
.LC740:
	.quad	-7389338561672555494
	.quad	150150336576094004
	.align 16
.LC741:
	.quad	6623802375033462826
	.quad	240240538521750407
	.align 16
.LC742:
	.quad	-2079655729457050385
	.quad	192192430817400325
	.align 16
.LC743:
	.quad	-5353073398307550631
	.quad	153753944653920260
	.align 16
.LC744:
	.quad	2503129006933649959
	.quad	246006311446272417
	.align 16
.LC745:
	.quad	-5376194423936900679
	.quad	196805049157017933
	.align 16
.LC746:
	.quad	-611606724407610220
	.quad	157444039325614346
	.align 16
.LC747:
	.quad	2710778055689733971
	.quad	251910462920982955
	.align 16
.LC748:
	.quad	2168622444551787177
	.quad	201528370336786364
	.align 16
.LC749:
	.quad	5424246770383340065
	.quad	161222696269429091
	.align 16
.LC750:
	.quad	1300097203129523457
	.quad	257956314031086546
	.align 16
.LC751:
	.quad	-2649271052238291558
	.quad	206365051224869236
	.align 16
.LC752:
	.quad	8948629602435097724
	.quad	165092040979895389
	.align 16
.LC753:
	.quad	3249760919670425388
	.quad	264147265567832623
	.align 16
.LC754:
	.quad	-8468237708489390659
	.quad	211317812454266098
	.align 16
.LC755:
	.quad	-3085241352049602204
	.quad	169054249963412878
	.align 16
.LC756:
	.quad	2442311466204457120
	.quad	270486799941460606
	.align 16
.LC757:
	.quad	-1735499641778344627
	.quad	216389439953168484
	.align 16
.LC758:
	.quad	-1388399713422675702
	.quad	173111551962534787
	.align 16
.LC759:
	.quad	-5910788356218191446
	.quad	276978483140055660
	.align 16
.LC760:
	.quad	-8417979499716463480
	.quad	221582786512044528
	.align 16
.LC761:
	.quad	-3045034785031260461
	.quad	177266229209635622
	.align 16
.LC762:
	.quad	-8561404470791927061
	.quad	283625966735416996
	.align 16
.LC763:
	.quad	4218922867592189321
	.quad	226900773388333597
	.align 16
.LC764:
	.quad	-4003559335410069189
	.quad	181520618710666877
	.align 16
.LC765:
	.quad	4175850161155765295
	.quad	145216494968533502
	.align 16
.LC766:
	.quad	-8076035001118416821
	.quad	232346391949653603
	.align 16
.LC767:
	.quad	-2771479186152823134
	.quad	185877113559722882
	.align 16
.LC768:
	.quad	5161514280561562140
	.quad	148701690847778306
	.align 16
.LC769:
	.quad	879725219414678777
	.quad	237922705356445290
	.align 16
.LC770:
	.quad	703780175531743021
	.quad	190338164285156232
	.align 16
.LC771:
	.quad	-6815673489058426229
	.quad	152270531428124985
	.align 16
.LC772:
	.quad	162968861732249003
	.quad	243632850284999977
	.align 16
.LC773:
	.quad	-7248322540098021444
	.quad	194906280227999981
	.align 16
.LC774:
	.quad	5269388412147313814
	.quad	155925024182399985
	.align 16
.LC775:
	.quad	8431021459435702103
	.quad	249480038691839976
	.align 16
.LC776:
	.quad	3055468352806651359
	.quad	199584030953471981
	.align 16
.LC777:
	.quad	-1244974132496589236
	.quad	159667224762777584
	.align 16
.LC778:
	.quad	-1991958611994542778
	.quad	255467559620444135
	.align 16
.LC779:
	.quad	-5282915704337544545
	.quad	204374047696355308
	.align 16
.LC780:
	.quad	-536983748728125313
	.quad	163499238157084246
	.align 16
.LC781:
	.quad	2830174816776909822
	.quad	261598781051334795
	.align 16
.LC782:
	.quad	2264139853421527858
	.quad	209279024841067836
	.align 16
.LC783:
	.quad	-1878036932004688037
	.quad	167423219872854268
	.align 16
.LC784:
	.quad	4373838538276319787
	.quad	267877151796566830
	.align 16
.LC785:
	.quad	3499070830621055830
	.quad	214301721437253464
	.align 16
.LC786:
	.quad	6488605479238754987
	.quad	171441377149802771
	.align 16
.LC787:
	.quad	3003071137298187333
	.quad	274306203439684434
	.align 16
.LC788:
	.quad	6091805724580460189
	.quad	219444962751747547
	.align 16
.LC789:
	.quad	-2505253049819452495
	.quad	175555970201398037
	.align 16
.LC790:
	.quad	-7697753694453034315
	.quad	280889552322236860
	.align 16
.LC791:
	.quad	8599192303405213841
	.quad	224711641857789488
	.align 16
.LC792:
	.quad	-4188692601501559897
	.quad	179769313486231590
	.align 16
.LC793:
	.long	31
	.long	28
	.long	31
	.long	30
	.align 16
.LC794:
	.long	31
	.long	30
	.long	31
	.long	31
	.align 16
.LC795:
	.long	30
	.long	31
	.long	30
	.long	31
	.align 16
.LC796:
	.long	0
	.long	31
	.long	59
	.long	90
	.align 16
.LC797:
	.long	120
	.long	151
	.long	181
	.long	212
	.align 16
.LC798:
	.long	243
	.long	273
	.long	304
	.long	334
	.align 16
.LC799:
	.byte	0
	.byte	1
	.byte	28
	.byte	2
	.byte	29
	.byte	14
	.byte	24
	.byte	3
	.byte	30
	.byte	22
	.byte	20
	.byte	15
	.byte	25
	.byte	17
	.byte	4
	.byte	8
	.align 16
.LC800:
	.byte	31
	.byte	27
	.byte	13
	.byte	23
	.byte	21
	.byte	19
	.byte	16
	.byte	7
	.byte	26
	.byte	12
	.byte	18
	.byte	6
	.byte	11
	.byte	5
	.byte	10
	.byte	9
	.align 16
.LC801:
	.byte	0
	.byte	1
	.byte	56
	.byte	2
	.byte	57
	.byte	49
	.byte	28
	.byte	3
	.byte	61
	.byte	58
	.byte	42
	.byte	50
	.byte	38
	.byte	29
	.byte	17
	.byte	4
	.align 16
.LC802:
	.byte	62
	.byte	47
	.byte	59
	.byte	36
	.byte	45
	.byte	43
	.byte	51
	.byte	22
	.byte	53
	.byte	39
	.byte	33
	.byte	30
	.byte	24
	.byte	18
	.byte	12
	.byte	5
	.align 16
.LC803:
	.byte	63
	.byte	55
	.byte	48
	.byte	27
	.byte	60
	.byte	41
	.byte	37
	.byte	16
	.byte	46
	.byte	35
	.byte	44
	.byte	21
	.byte	52
	.byte	32
	.byte	23
	.byte	11
	.align 16
.LC804:
	.byte	54
	.byte	26
	.byte	40
	.byte	15
	.byte	34
	.byte	20
	.byte	31
	.byte	10
	.byte	25
	.byte	14
	.byte	19
	.byte	9
	.byte	13
	.byte	8
	.byte	7
	.byte	6
	.align 16
.LC805:
	.byte	8
	.byte	0
	.byte	1
	.byte	0
	.byte	2
	.byte	0
	.byte	1
	.byte	0
	.byte	3
	.byte	0
	.byte	1
	.byte	0
	.byte	2
	.byte	0
	.byte	1
	.byte	0
	.align 16
.LC806:
	.byte	4
	.byte	0
	.byte	1
	.byte	0
	.byte	2
	.byte	0
	.byte	1
	.byte	0
	.byte	3
	.byte	0
	.byte	1
	.byte	0
	.byte	2
	.byte	0
	.byte	1
	.byte	0
	.align 16
.LC807:
	.byte	5
	.byte	0
	.byte	1
	.byte	0
	.byte	2
	.byte	0
	.byte	1
	.byte	0
	.byte	3
	.byte	0
	.byte	1
	.byte	0
	.byte	2
	.byte	0
	.byte	1
	.byte	0
	.align 16
.LC808:
	.byte	6
	.byte	0
	.byte	1
	.byte	0
	.byte	2
	.byte	0
	.byte	1
	.byte	0
	.byte	3
	.byte	0
	.byte	1
	.byte	0
	.byte	2
	.byte	0
	.byte	1
	.byte	0
	.align 16
.LC809:
	.byte	7
	.byte	0
	.byte	1
	.byte	0
	.byte	2
	.byte	0
	.byte	1
	.byte	0
	.byte	3
	.byte	0
	.byte	1
	.byte	0
	.byte	2
	.byte	0
	.byte	1
	.byte	0
	.align 16
.LC810:
	.byte	0
	.byte	1
	.byte	1
	.byte	2
	.byte	1
	.byte	2
	.byte	2
	.byte	3
	.byte	1
	.byte	2
	.byte	2
	.byte	3
	.byte	2
	.byte	3
	.byte	3
	.byte	4
	.align 16
.LC811:
	.byte	1
	.byte	2
	.byte	2
	.byte	3
	.byte	2
	.byte	3
	.byte	3
	.byte	4
	.byte	2
	.byte	3
	.byte	3
	.byte	4
	.byte	3
	.byte	4
	.byte	4
	.byte	5
	.align 16
.LC812:
	.byte	2
	.byte	3
	.byte	3
	.byte	4
	.byte	3
	.byte	4
	.byte	4
	.byte	5
	.byte	3
	.byte	4
	.byte	4
	.byte	5
	.byte	4
	.byte	5
	.byte	5
	.byte	6
	.align 16
.LC813:
	.byte	3
	.byte	4
	.byte	4
	.byte	5
	.byte	4
	.byte	5
	.byte	5
	.byte	6
	.byte	4
	.byte	5
	.byte	5
	.byte	6
	.byte	5
	.byte	6
	.byte	6
	.byte	7
	.align 16
.LC814:
	.byte	4
	.byte	5
	.byte	5
	.byte	6
	.byte	5
	.byte	6
	.byte	6
	.byte	7
	.byte	5
	.byte	6
	.byte	6
	.byte	7
	.byte	6
	.byte	7
	.byte	7
	.byte	8
	.align 16
.LC815:
	.byte	0
	.byte	-128
	.byte	64
	.byte	-64
	.byte	32
	.byte	-96
	.byte	96
	.byte	-32
	.byte	16
	.byte	-112
	.byte	80
	.byte	-48
	.byte	48
	.byte	-80
	.byte	112
	.byte	-16
	.align 16
.LC816:
	.byte	8
	.byte	-120
	.byte	72
	.byte	-56
	.byte	40
	.byte	-88
	.byte	104
	.byte	-24
	.byte	24
	.byte	-104
	.byte	88
	.byte	-40
	.byte	56
	.byte	-72
	.byte	120
	.byte	-8
	.align 16
.LC817:
	.byte	4
	.byte	-124
	.byte	68
	.byte	-60
	.byte	36
	.byte	-92
	.byte	100
	.byte	-28
	.byte	20
	.byte	-108
	.byte	84
	.byte	-44
	.byte	52
	.byte	-76
	.byte	116
	.byte	-12
	.align 16
.LC818:
	.byte	12
	.byte	-116
	.byte	76
	.byte	-52
	.byte	44
	.byte	-84
	.byte	108
	.byte	-20
	.byte	28
	.byte	-100
	.byte	92
	.byte	-36
	.byte	60
	.byte	-68
	.byte	124
	.byte	-4
	.align 16
.LC819:
	.byte	2
	.byte	-126
	.byte	66
	.byte	-62
	.byte	34
	.byte	-94
	.byte	98
	.byte	-30
	.byte	18
	.byte	-110
	.byte	82
	.byte	-46
	.byte	50
	.byte	-78
	.byte	114
	.byte	-14
	.align 16
.LC820:
	.byte	10
	.byte	-118
	.byte	74
	.byte	-54
	.byte	42
	.byte	-86
	.byte	106
	.byte	-22
	.byte	26
	.byte	-102
	.byte	90
	.byte	-38
	.byte	58
	.byte	-70
	.byte	122
	.byte	-6
	.align 16
.LC821:
	.byte	6
	.byte	-122
	.byte	70
	.byte	-58
	.byte	38
	.byte	-90
	.byte	102
	.byte	-26
	.byte	22
	.byte	-106
	.byte	86
	.byte	-42
	.byte	54
	.byte	-74
	.byte	118
	.byte	-10
	.align 16
.LC822:
	.byte	14
	.byte	-114
	.byte	78
	.byte	-50
	.byte	46
	.byte	-82
	.byte	110
	.byte	-18
	.byte	30
	.byte	-98
	.byte	94
	.byte	-34
	.byte	62
	.byte	-66
	.byte	126
	.byte	-2
	.align 16
.LC823:
	.byte	1
	.byte	-127
	.byte	65
	.byte	-63
	.byte	33
	.byte	-95
	.byte	97
	.byte	-31
	.byte	17
	.byte	-111
	.byte	81
	.byte	-47
	.byte	49
	.byte	-79
	.byte	113
	.byte	-15
	.align 16
.LC824:
	.byte	9
	.byte	-119
	.byte	73
	.byte	-55
	.byte	41
	.byte	-87
	.byte	105
	.byte	-23
	.byte	25
	.byte	-103
	.byte	89
	.byte	-39
	.byte	57
	.byte	-71
	.byte	121
	.byte	-7
	.align 16
.LC825:
	.byte	5
	.byte	-123
	.byte	69
	.byte	-59
	.byte	37
	.byte	-91
	.byte	101
	.byte	-27
	.byte	21
	.byte	-107
	.byte	85
	.byte	-43
	.byte	53
	.byte	-75
	.byte	117
	.byte	-11
	.align 16
.LC826:
	.byte	13
	.byte	-115
	.byte	77
	.byte	-51
	.byte	45
	.byte	-83
	.byte	109
	.byte	-19
	.byte	29
	.byte	-99
	.byte	93
	.byte	-35
	.byte	61
	.byte	-67
	.byte	125
	.byte	-3
	.align 16
.LC827:
	.byte	3
	.byte	-125
	.byte	67
	.byte	-61
	.byte	35
	.byte	-93
	.byte	99
	.byte	-29
	.byte	19
	.byte	-109
	.byte	83
	.byte	-45
	.byte	51
	.byte	-77
	.byte	115
	.byte	-13
	.align 16
.LC828:
	.byte	11
	.byte	-117
	.byte	75
	.byte	-53
	.byte	43
	.byte	-85
	.byte	107
	.byte	-21
	.byte	27
	.byte	-101
	.byte	91
	.byte	-37
	.byte	59
	.byte	-69
	.byte	123
	.byte	-5
	.align 16
.LC829:
	.byte	7
	.byte	-121
	.byte	71
	.byte	-57
	.byte	39
	.byte	-89
	.byte	103
	.byte	-25
	.byte	23
	.byte	-105
	.byte	87
	.byte	-41
	.byte	55
	.byte	-73
	.byte	119
	.byte	-9
	.align 16
.LC830:
	.byte	15
	.byte	-113
	.byte	79
	.byte	-49
	.byte	47
	.byte	-81
	.byte	111
	.byte	-17
	.byte	31
	.byte	-97
	.byte	95
	.byte	-33
	.byte	63
	.byte	-65
	.byte	127
	.byte	-1
	.align 16
.LC831:
	.byte	0
	.byte	1
	.byte	2
	.byte	2
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.byte	4
	.align 16
.LC832:
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.byte	5
	.align 16
.LC833:
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.byte	6
	.align 16
.LC834:
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.byte	7
	.align 16
.LC835:
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.byte	8
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
