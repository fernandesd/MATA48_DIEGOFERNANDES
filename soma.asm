.data
	n1: .float
	n2: .float
	const:	.float	1.34
	val: .float 7.0
	soma: .float
	m1: .asciiz "Informe o primeiro numero: "
	m2: .asciiz "Informe o segundo numero: "
	m3: .asciiz "Soma: "
	m4: .asciiz "Resultado descartado!"

.text
.globl  main

main:
		
	li  $v0, 4 #armazena o valor 4 em $v0 
	la $a0, m1 #carrega a string de m1 para $a0
	syscall #lê o valor de $v0. 4->imprime uma string
	
	li $v0, 6 #armazena o valor 6 em $v0      
  	syscall #lê o valor de $v0. 6->lê um float e armazena em $f0
  	movf.s $f1, $f0	#$f1 = $f0
  	
  	li  $v0, 4 #armazena o valor 4 em $v0 
	la $a0, m2 #carrega a string de m2 para $a0
	syscall #lê o valor de $v0. 4->imprime uma string
	
	li $v0, 6 #armazena o valor 6 em $v0      
  	syscall #lê o valor de $v0. 6->lê um float e armazena em $f0
  	movf.s $f2, $f0	#$f2 = $f0
  	
  	add.s $f0, $f1, $f2 #$f0 = $f1 + $f2
  	movf.s $f3, $f0	#$f3 = $f0
  	
  	la $v0,const #$v0 = const
  	l.s $f4,($v0) #$f4 = $v0
  	
  	mul.s $f5,$f3,$f4 #$f5 = $f3 x $f4
  	movf.s $f12,$f5 #$f12 = $f5
  	
  	la $v0,val #$v0 = val
  	l.s $f6,($v0) #$f6 = $v0
  	
  	c.lt.s $f6,$f5 #if($f5 > $f6)
  	
  	bc1t THEN #se verdadeiro 	
  	bc1f ELSE  #se falso			  	 	
  	

	THEN:
		li $v0, 4 #armazena o valor 4 em $v0 
		la $a0, m3 #carrega a string de m3 para $a0
		syscall #lê o valor de $v0. 4->imprime uma string
		
		li $v0, 2 #armazena o valor 2 em $v0 		
		syscall #lê o valor de $v0. 2->imprime o float que está em $f12
		
		li $v0, 10 #armazena o valor 10 em $v0 
  		syscall	#lê o valor de $v0. 10->encerra o programa	
	
		 
	ELSE:
		li $v0, 4 #armazena o valor 4 em $v0 
		la $a0, m4 #carrega a string de m4 para $a0
		syscall #lê o valor de $v0. 4->imprime uma string
	
	
		li $v0, 10 #armazena o valor 10 em $v0
  		syscall #lê o valor de $v0. 10->encerra o programa
  	
