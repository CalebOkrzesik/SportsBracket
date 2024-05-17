TITLE CalebOkrzesik/Calculates number of rounds needed

INCLUDE Irvine32.inc

.data
    msgInput BYTE "Enter number of entrants: ", 0
    numRounds BYTE "The number of rounds needed is: ", 0

.code
; Calcs rounds needed to be champs
CalcRounds PROC
    push ebp
    mov ebp, esp
    sub esp, 4

    mov eax, 0     ; Number of rounds

CalcLoop:
    cmp ebx, 1
    jle EndCalc    
    inc eax     ; inc nunmber of rounds
    test ebx, 1     ; check for odd
    jz EvenNumber
    inc ebx     ; Incrremnt if odd

EvenNumber:
    shr ebx, 1      ; Divide by 2
    jmp CalcLoop

EndCalc:
    mov esp, ebp
    pop ebp
    ret
CalcRounds ENDP



main PROC
    ; Prompt user for input
    mov edx, OFFSET msgInput
    call WriteString

    ;take number of entrents
    call ReadInt
    mov ebx, eax  ; ebx = input

    ; Calculate number of rounds
    push ebx   ; entrents onto stack
    call CalcRounds
    add esp, 4  ;clean

    ;display end output
    mov edx, OFFSET numRounds
    call WriteString
    call WriteInt

    call Crlf
    call WaitMsg
    exit

main ENDP
END main