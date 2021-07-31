	.file	"odev3.c"
	.comm	page_table,400,32
	.globl	toplam_hit
	.bss
	.align 4
	.type	toplam_hit, @object
	.size	toplam_hit, 4
toplam_hit:
	.zero	4
	.globl	toplam_miss
	.align 4
	.type	toplam_miss, @object
	.size	toplam_miss, 4
toplam_miss:
	.zero	4
	.text
	.globl	TLBde_var_mi
	.type	TLBde_var_mi, @function
TLBde_var_mi:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L2
.L5:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	cmpq	-32(%rbp), %rax
	jne	.L3
	movl	$1, %eax
	jmp	.L4
.L3:
	addl	$1, -4(%rbp)
.L2:
	cmpl	$9, -4(%rbp)
	jle	.L5
	movl	$0, %eax
.L4:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	TLBde_var_mi, .-TLBde_var_mi
	.globl	deger_dondur
	.type	deger_dondur, @function
deger_dondur:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	%edx, -36(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L7
.L10:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	cmpq	-32(%rbp), %rax
	jne	.L8
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movl	-36(%rbp), %eax
	cltq
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	jmp	.L9
.L8:
	addl	$1, -4(%rbp)
.L7:
	cmpl	$9, -4(%rbp)
	jle	.L10
	movl	$-1, %eax
.L9:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	deger_dondur, .-deger_dondur
	.globl	index_dondur
	.type	index_dondur, @function
index_dondur:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L12
.L15:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	cmpq	-32(%rbp), %rax
	jne	.L13
	movl	-4(%rbp), %eax
	jmp	.L14
.L13:
	addl	$1, -4(%rbp)
.L12:
	cmpl	$9, -4(%rbp)
	jle	.L15
	movl	$-1, %eax
.L14:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	index_dondur, .-index_dondur
	.section	.rodata
	.align 8
.LC0:
	.string	"OKUMA yapacag\304\261n\304\261z dosyay\304\261 OKU.txt gibi giriniz "
.LC1:
	.string	"%s"
	.align 8
.LC2:
	.string	"adres dosyas\304\261n\304\261 adres.txt seklinde giriniz "
.LC3:
	.string	"r"
.LC4:
	.string	"Error! File Could not open !"
	.align 8
.LC5:
	.string	"%d. page ---- karsilik geldigi frame %d \n"
	.align 8
.LC6:
	.string	"******* Random 100 swaptan sonra ******* "
.LC7:
	.string	"TLB MISS !!!"
	.align 8
.LC8:
	.string	"Adress : %d  bellekteki deger : %c \n"
.LC9:
	.string	"TLB 'nin anl\304\261k durumu "
	.align 8
.LC10:
	.string	"TLB_index    LRU_level    page_no     frame_no  "
	.align 8
.LC11:
	.string	"     %d          %d          %d          %d          \n"
.LC12:
	.string	"TLB HIT !!!"
.LC13:
	.string	"Adress : %d  \n"
.LC14:
	.string	"istenilen deger : %c \n"
.LC15:
	.string	"%d"
.LC16:
	.string	"Toplam hit sayisi : %d \n"
.LC17:
	.string	"Toplam miss sayisi : %d \n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB5:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$1680, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$.LC0, %edi
	call	puts
	leaq	-528(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	__isoc99_scanf
	movl	$.LC2, %edi
	call	puts
	leaq	-272(%rbp), %rax
	movq	%rax, %rsi
	movl	$.LC1, %edi
	movl	$0, %eax
	call	__isoc99_scanf
	leaq	-528(%rbp), %rax
	movl	$.LC3, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -1568(%rbp)
	cmpq	$0, -1568(%rbp)
	jne	.L17
	movl	$.LC4, %edi
	movl	$0, %eax
	call	printf
	movl	$1, %edi
	call	exit
.L17:
	movl	$0, -1676(%rbp)
	jmp	.L18
.L19:
	movl	$4096, %edi
	call	malloc
	movq	%rax, %rdx
	movl	-1676(%rbp), %eax
	cltq
	movq	%rdx, -1328(%rbp,%rax,8)
	addl	$1, -1676(%rbp)
.L18:
	cmpl	$99, -1676(%rbp)
	jle	.L19
	movl	$0, -1672(%rbp)
	jmp	.L20
.L21:
	movl	-1672(%rbp), %eax
	cltq
	movq	-1328(%rbp,%rax,8), %rax
	movq	-1568(%rbp), %rdx
	movl	$4096, %esi
	movq	%rax, %rdi
	call	fgets
	movl	-1672(%rbp), %eax
	cltq
	movl	-1672(%rbp), %edx
	movl	%edx, page_table(,%rax,4)
	addl	$1, -1672(%rbp)
.L20:
	cmpl	$99, -1672(%rbp)
	jle	.L21
	movl	$0, -1668(%rbp)
	jmp	.L22
.L23:
	movl	-1668(%rbp), %eax
	cltq
	movl	page_table(,%rax,4), %edx
	movl	-1668(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC5, %edi
	movl	$0, %eax
	call	printf
	addl	$1, -1668(%rbp)
.L22:
	cmpl	$99, -1668(%rbp)
	jle	.L23
	movl	$4096, %edi
	call	malloc
	movq	%rax, -1560(%rbp)
	movl	$4096, %edi
	call	malloc
	movq	%rax, -1552(%rbp)
	movl	$0, -1664(%rbp)
	jmp	.L24
.L25:
	call	rand
	movl	%eax, %ecx
	movl	$1374389535, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$5, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -1604(%rbp)
	movl	-1604(%rbp), %eax
	imull	$100, %eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, -1604(%rbp)
	call	rand
	movl	%eax, %ecx
	movl	$1374389535, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$5, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, -1600(%rbp)
	movl	-1600(%rbp), %eax
	imull	$100, %eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, -1600(%rbp)
	movl	-1604(%rbp), %eax
	cltq
	movq	-1328(%rbp,%rax,8), %rax
	movq	%rax, -1560(%rbp)
	movl	-1600(%rbp), %eax
	cltq
	movq	-1328(%rbp,%rax,8), %rax
	movq	%rax, -1552(%rbp)
	movl	-1604(%rbp), %eax
	cltq
	movl	page_table(,%rax,4), %eax
	movl	%eax, -1596(%rbp)
	movl	-1600(%rbp), %eax
	cltq
	movl	page_table(,%rax,4), %eax
	movl	%eax, -1592(%rbp)
	movl	-1604(%rbp), %eax
	cltq
	movq	-1552(%rbp), %rdx
	movq	%rdx, -1328(%rbp,%rax,8)
	movl	-1600(%rbp), %eax
	cltq
	movq	-1560(%rbp), %rdx
	movq	%rdx, -1328(%rbp,%rax,8)
	movl	-1604(%rbp), %eax
	cltq
	movl	-1592(%rbp), %edx
	movl	%edx, page_table(,%rax,4)
	movl	-1600(%rbp), %eax
	cltq
	movl	-1596(%rbp), %edx
	movl	%edx, page_table(,%rax,4)
	addl	$1, -1664(%rbp)
.L24:
	cmpl	$99, -1664(%rbp)
	jle	.L25
	movl	$.LC6, %edi
	call	puts
	movl	$0, -1660(%rbp)
	jmp	.L26
.L27:
	movl	-1660(%rbp), %eax
	cltq
	movl	page_table(,%rax,4), %edx
	movl	-1660(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC5, %edi
	movl	$0, %eax
	call	printf
	addl	$1, -1660(%rbp)
.L26:
	cmpl	$99, -1660(%rbp)
	jle	.L27
	leaq	-272(%rbp), %rax
	movl	$.LC3, %esi
	movq	%rax, %rdi
	call	fopen
	movq	%rax, -1544(%rbp)
	cmpq	$0, -1544(%rbp)
	jne	.L28
	movl	$.LC4, %edi
	movl	$0, %eax
	call	printf
	movl	$1, %edi
	call	exit
.L28:
	movl	$0, -1656(%rbp)
	jmp	.L29
.L30:
	movl	$4096, %edi
	call	malloc
	movq	%rax, %rdx
	movl	-1656(%rbp), %eax
	cltq
	movq	%rdx, -1536(%rbp,%rax,8)
	addl	$1, -1656(%rbp)
.L29:
	cmpl	$9, -1656(%rbp)
	jle	.L30
	movl	$0, -1652(%rbp)
	jmp	.L31
.L32:
	movl	-1652(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	addq	%rbp, %rax
	subq	$1456, %rax
	movl	$0, (%rax)
	movl	-1652(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	addq	%rbp, %rax
	subq	$1452, %rax
	movl	$-1, (%rax)
	movl	-1652(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	addq	%rbp, %rax
	subq	$1448, %rax
	movl	$-1, (%rax)
	addl	$1, -1652(%rbp)
.L31:
	cmpl	$9, -1652(%rbp)
	jle	.L32
	movl	$0, -1680(%rbp)
	jmp	.L33
.L56:
	movl	-1680(%rbp), %eax
	leal	4095(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$12, %eax
	movl	%eax, -1588(%rbp)
	movl	-1588(%rbp), %eax
	cltq
	movl	page_table(,%rax,4), %eax
	movl	%eax, -1584(%rbp)
	movl	-1680(%rbp), %eax
	cltd
	shrl	$20, %edx
	addl	%edx, %eax
	andl	$4095, %eax
	subl	%edx, %eax
	movl	%eax, -1580(%rbp)
	movl	-1584(%rbp), %eax
	cltq
	movq	-1328(%rbp,%rax,8), %rdx
	leaq	-1536(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	TLBde_var_mi
	movl	%eax, -1576(%rbp)
	cmpl	$0, -1576(%rbp)
	jne	.L34
	movl	$.LC7, %edi
	call	puts
	movl	toplam_miss(%rip), %eax
	addl	$1, %eax
	movl	%eax, toplam_miss(%rip)
	movl	-1584(%rbp), %eax
	cltq
	movq	-1328(%rbp,%rax,8), %rdx
	movl	-1580(%rbp), %eax
	cltq
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %edx
	movl	-1680(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC8, %edi
	movl	$0, %eax
	call	printf
	movl	$0, -1648(%rbp)
	movl	$0, -1644(%rbp)
	movl	$0, -1640(%rbp)
	jmp	.L35
.L37:
	movl	-1640(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	addq	%rbp, %rax
	subq	$1452, %rax
	movl	(%rax), %eax
	cmpl	$-1, %eax
	jne	.L36
	movl	-1640(%rbp), %eax
	movl	%eax, -1648(%rbp)
	movl	$1, -1644(%rbp)
.L36:
	addl	$1, -1640(%rbp)
.L35:
	cmpl	$0, -1644(%rbp)
	je	.L37
	cmpl	$0, -1648(%rbp)
	je	.L38
	movl	-1584(%rbp), %eax
	cltq
	movq	-1328(%rbp,%rax,8), %rdx
	movl	-1648(%rbp), %eax
	cltq
	movq	%rdx, -1536(%rbp,%rax,8)
	movl	-1648(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	addq	%rbp, %rax
	leaq	-1452(%rax), %rdx
	movl	-1584(%rbp), %eax
	movl	%eax, (%rdx)
	movl	-1648(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	addq	%rbp, %rax
	leaq	-1448(%rax), %rdx
	movl	-1588(%rbp), %eax
	movl	%eax, (%rdx)
	movl	$0, -1636(%rbp)
	jmp	.L39
.L41:
	movl	-1636(%rbp), %eax
	cmpl	-1648(%rbp), %eax
	je	.L40
	movl	-1636(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	addq	%rbp, %rax
	subq	$1456, %rax
	movl	(%rax), %eax
	leal	-1(%rax), %ecx
	movl	-1636(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	addq	%rbp, %rax
	subq	$1456, %rax
	movl	%ecx, (%rax)
.L40:
	addl	$1, -1636(%rbp)
.L39:
	cmpl	$9, -1636(%rbp)
	jle	.L41
	jmp	.L42
.L38:
	movl	$0, -1632(%rbp)
	movl	$0, -1628(%rbp)
	movl	$0, -1624(%rbp)
	jmp	.L43
.L45:
	movl	-1624(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	addq	%rbp, %rax
	subq	$1456, %rax
	movl	(%rax), %eax
	cmpl	-1632(%rbp), %eax
	jge	.L44
	movl	-1624(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	addq	%rbp, %rax
	subq	$1456, %rax
	movl	(%rax), %eax
	movl	%eax, -1632(%rbp)
	movl	-1624(%rbp), %eax
	movl	%eax, -1628(%rbp)
.L44:
	addl	$1, -1624(%rbp)
.L43:
	cmpl	$9, -1624(%rbp)
	jle	.L45
	movl	-1584(%rbp), %eax
	cltq
	movq	-1328(%rbp,%rax,8), %rdx
	movl	-1628(%rbp), %eax
	cltq
	movq	%rdx, -1536(%rbp,%rax,8)
	movl	-1628(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	addq	%rbp, %rax
	leaq	-1452(%rax), %rdx
	movl	-1584(%rbp), %eax
	movl	%eax, (%rdx)
	movl	-1628(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	addq	%rbp, %rax
	leaq	-1448(%rax), %rdx
	movl	-1588(%rbp), %eax
	movl	%eax, (%rdx)
	movl	-1628(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	addq	%rbp, %rax
	subq	$1456, %rax
	movl	$0, (%rax)
	movl	$0, -1620(%rbp)
	jmp	.L46
.L48:
	movl	-1620(%rbp), %eax
	cmpl	-1628(%rbp), %eax
	je	.L47
	movl	-1620(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	addq	%rbp, %rax
	subq	$1456, %rax
	movl	(%rax), %eax
	leal	-1(%rax), %ecx
	movl	-1620(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	addq	%rbp, %rax
	subq	$1456, %rax
	movl	%ecx, (%rax)
.L47:
	addl	$1, -1620(%rbp)
.L46:
	cmpl	$9, -1620(%rbp)
	jle	.L48
.L42:
	movl	$.LC9, %edi
	call	puts
	movl	$.LC10, %edi
	call	puts
	movl	$0, -1616(%rbp)
	jmp	.L49
.L50:
	movl	-1616(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	addq	%rbp, %rax
	subq	$1452, %rax
	movl	(%rax), %esi
	movl	-1616(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	addq	%rbp, %rax
	subq	$1448, %rax
	movl	(%rax), %ecx
	movl	-1616(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	addq	%rbp, %rax
	subq	$1456, %rax
	movl	(%rax), %edx
	movl	-1616(%rbp), %eax
	movl	%esi, %r8d
	movl	%eax, %esi
	movl	$.LC11, %edi
	movl	$0, %eax
	call	printf
	addl	$1, -1616(%rbp)
.L49:
	cmpl	$9, -1616(%rbp)
	jle	.L50
	jmp	.L33
.L34:
	movl	$.LC12, %edi
	call	puts
	movl	toplam_hit(%rip), %eax
	addl	$1, %eax
	movl	%eax, toplam_hit(%rip)
	movl	-1680(%rbp), %eax
	movl	%eax, %esi
	movl	$.LC13, %edi
	movl	$0, %eax
	call	printf
	movl	-1584(%rbp), %eax
	cltq
	movq	-1328(%rbp,%rax,8), %rcx
	movl	-1580(%rbp), %edx
	leaq	-1536(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	deger_dondur
	movsbl	%al, %eax
	movl	%eax, %esi
	movl	$.LC14, %edi
	movl	$0, %eax
	call	printf
	movl	-1584(%rbp), %eax
	cltq
	movq	-1328(%rbp,%rax,8), %rdx
	leaq	-1536(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	index_dondur
	movl	%eax, -1572(%rbp)
	movl	$0, -1612(%rbp)
	jmp	.L51
.L53:
	movl	-1612(%rbp), %eax
	cmpl	-1572(%rbp), %eax
	je	.L52
	movl	-1612(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	addq	%rbp, %rax
	subq	$1456, %rax
	movl	(%rax), %eax
	leal	-1(%rax), %ecx
	movl	-1612(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	addq	%rbp, %rax
	subq	$1456, %rax
	movl	%ecx, (%rax)
.L52:
	addl	$1, -1612(%rbp)
.L51:
	cmpl	$9, -1612(%rbp)
	jle	.L53
	movl	$.LC9, %edi
	call	puts
	movl	$.LC10, %edi
	call	puts
	movl	$0, -1608(%rbp)
	jmp	.L54
.L55:
	movl	-1608(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	addq	%rbp, %rax
	subq	$1452, %rax
	movl	(%rax), %esi
	movl	-1608(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	addq	%rbp, %rax
	subq	$1448, %rax
	movl	(%rax), %ecx
	movl	-1608(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	salq	$2, %rax
	addq	%rbp, %rax
	subq	$1456, %rax
	movl	(%rax), %edx
	movl	-1608(%rbp), %eax
	movl	%esi, %r8d
	movl	%eax, %esi
	movl	$.LC11, %edi
	movl	$0, %eax
	call	printf
	addl	$1, -1608(%rbp)
.L54:
	cmpl	$9, -1608(%rbp)
	jle	.L55
.L33:
	leaq	-1680(%rbp), %rdx
	movq	-1544(%rbp), %rax
	movl	$.LC15, %esi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf
	cmpl	$-1, %eax
	jne	.L56
	movl	toplam_hit(%rip), %eax
	movl	%eax, %esi
	movl	$.LC16, %edi
	movl	$0, %eax
	call	printf
	movl	toplam_miss(%rip), %eax
	movl	%eax, %esi
	movl	$.LC17, %edi
	movl	$0, %eax
	call	printf
	movq	-1544(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	movq	-1568(%rbp), %rax
	movq	%rax, %rdi
	call	fclose
	movl	$0, %eax
	movq	-8(%rbp), %rsi
	xorq	%fs:40, %rsi
	je	.L58
	call	__stack_chk_fail
.L58:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 5.4.0-6ubuntu1~16.04.11) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits
