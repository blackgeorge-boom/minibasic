	.text
	.file	"minibasic program"
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:                                 # %entry
	pushq	%rbx
.Lcfi0:
	.cfi_def_cfa_offset 16
.Lcfi1:
	.cfi_offset %rbx, -16
	movl	$0, .Lvars+92(%rip)
	movl	$42, %ebx
	testl	%ebx, %ebx
	jle	.LBB0_3
	.p2align	4, 0x90
.LBB0_2:                                # %inside
                                        # =>This Inner Loop Header: Depth=1
	decl	%ebx
	movl	.Lvars+92(%rip), %edi
	incl	%edi
	movl	%edi, .Lvars+92(%rip)
	callq	writeInteger
	movl	$.Lnl, %edi
	callq	writeString
	testl	%ebx, %ebx
	jg	.LBB0_2
.LBB0_3:                                # %after
	xorl	%eax, %eax
	popq	%rbx
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.type	.Lvars,@object          # @vars
	.local	.Lvars
	.comm	.Lvars,104,16
	.type	.Lnl,@object            # @nl
	.section	.rodata,"a",@progbits
.Lnl:
	.asciz	"\n"
	.size	.Lnl, 2


	.section	".note.GNU-stack","",@progbits
