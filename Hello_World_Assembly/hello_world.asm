jmp main


mensagem : var #21
static mensagem + #0, #'A'
static mensagem + #1, #'A'
static mensagem + #2, #'A'
static mensagem + #3, #'a'
static mensagem + #4, #'B'
static mensagem + #5, #'C'
static mensagem + #6, #'E'
static mensagem + #7, #'N'
static mensagem + #8, #'T'
static mensagem + #9, #'E'
static mensagem + #10, #'R'
static mensagem + #11, #' '
static mensagem + #12, #'T'
static mensagem + #13, #'O'
static mensagem + #14, #' '
static mensagem + #15, #'S'
static mensagem + #16, #'T'
static mensagem + #17, #'A'
static mensagem + #18, #'R'
static mensagem + #19, #'T'
static mensagem + #20, #'\0'


mensagem2 : string "Hello, world!"


main:
	loadn r0, #0		; Posicao na tela onde a mensagem sera' escrita
	loadn r1, #mensagem2	; Carrega r1 com o endereco do vetor que contem a mensagem
	loadn r2, #256		; Seleciona a COR da Mensagem
	
	call Imprimestr   ;  r0 = Posicao da tela que o primeiro caractere da mensagem sera' impresso;  r1 = endereco onde comeca a mensagem; r2 = cor da mensagem.   Obs: a mensagem sera' impressa ate' encontrar "/0"

	halt
	
	
Imprimestr:	;  Rotina de Impresao de Mensagens:    r0 = Posicao da tela que o primeiro caractere da mensagem sera' impresso;  r1 = endereco onde comeca a mensagem; r2 = cor da mensagem.   Obs: a mensagem sera' impressa ate' encontrar "/0"
	push r0	; protege o r0 na pilha para preservar seu valor
	push r1	; protege o r1 na pilha para preservar seu valor
	push r2	; protege o r1 na pilha para preservar seu valor
	push r3	; protege o r3 na pilha para ser usado na subrotina
	push r4	; protege o r4 na pilha para ser usado na subrotina
	
	loadn r3, #'\0'	; Criterio de parada

ImprimestrLoop:	
	loadi r4, r1
	cmp r4, r3
	jeq ImprimestrSai
	add r4, r2, r4
	outchar r4, r0
	inc r0
	inc r1
	jmp ImprimestrLoop
	
ImprimestrSai:	
	pop r4	; Resgata os valores dos registradores utilizados na Subrotina da Pilha
	pop r3
	pop r2
	pop r1
	pop r0
	rts
	
	
	
