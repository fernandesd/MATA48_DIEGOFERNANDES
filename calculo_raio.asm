.data
	
	PI:	.float	3.14159		
	m1: .asciiz "Digite o valor do raio do circulo, e ENTER\n"
	m2: .asciiz "Raio digitado e' "
	endl: .asciiz "\n"
	m3: .asciiz "Area do circulo com raio "
	eh: .asciiz " e' "	

.text
.globl  main

main:
		
	li  $v0, 4 #armazena o valor 4 em $v0 
	la $a0, m1 #carrega a string de m1 para $a0
	syscall #lê o valor de $v0. 4->imprime uma string
	#saída: "Digite o valor do raio do circulo, e ENTER "
	
	li $v0, 6 #armazena o valor 6 em $v0      
  	syscall #lê o valor de $v0. 6->lê um float e armazena em $f0
  	#entra com 0 valor do raio que será armazenado em $f0
  	
  	movf.s $f12, $f0	#$f12 = $f0   	
  	#copiar os dados de $f0 para $f12	  	
  	
  	la $v0,PI #$v0 = PI
  	l.s $f4,($v0) #$f4 = $v0
  	#copiar o valor de PI para $f4
  	
  	li $v0, 4 #armazena o valor 4 em $v0 
	la $a0, m2 #carrega a string de m3 para $a0
	syscall #lê o valor de $v0. 4->imprime uma string
	#saída: "Raio digitado e' "
	
	li $v0, 2 #armazena o valor 2 em $v0 		
	syscall #ler o valor de $v0. 2->imprime o float que está em $f12
	#saída: valor do raio armazenado em $f12
	
	li $v0, 4 #armazena o valor 4 em $v0 
	la $a0, endl #carrega a string de m3 para $a0
	syscall #lê o valor de $v0. 4->imprime uma string
	#saida:\n (quebra de linha)
	
	li $v0, 4 #armazena o valor 4 em $v0 
	la $a0, m3 #carrega a string de m3 para $a0
	syscall #lê o valor de $v0. 4->imprime uma string
	#saída: "Area do circulo com raio " 
	
	li $v0, 2 #armazena o valor 2 em $v0 		
	syscall #lê o valor de $v0. 2->imprime o float que está em $f12
	#saída: valor do raio armazenado em $f12
	
	li $v0, 4 #armazena o valor 4 em $v0 
	la $a0, eh #carrega a string de m3 para $a0
	syscall #lê o valor de $v0. 4->imprime uma string
	#saída: " e' "
	
	mul.s $f2, $f1,$f1 #$f2 = $f1² ($f1 tem o valor do raio) 
	mul.s $f3, $f4,$f2 #f3 = $f4 * $f2 (A = π*raio²)
	movf.s $f12, $f3	#$f12 = $f0
	#calcula a área do círculo e grava em $f12 
	
	li $v0, 2 #armazena o valor 2 em $v0 		
	syscall #lê o valor de $v0. 2->imprime o float que está em $f12
	#imprime o valor da área que estava armazenado em $f12
	
	li $v0, 4 #armazena o valor 4 em $v0 
	la $a0, endl #carrega a string de m3 para $a0
	syscall #lê o valor de $v0. 4->imprime uma string
	#saida:\n (quebra de linha)
  	
  	li $v0, 10 #armazena o valor 10 em $v0
  	syscall #lê o valor de $v0. 10->encerra o programa
  	
  
  	
  	
  	
  	