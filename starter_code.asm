.orig x3000
;this stack lab computes the polish notation of a set of calls
;push_val(4) pushes the value 4 onto the stack [4]
LEA R1, STORAGE
LD R3, PUSH_VAL_PTR
AND R2, R2, #0
ADD R2, R2, #4
JSRR R3

;push_val(3) pushes the value 3 onto the stack [4,3]
AND R2, R2, #0
ADD R2, R2, #3
JSRR R3

;push_val(2) pushes the value 2 onto the stack [4,3,2]
AND R2, R2, #0
ADD R2, R2, #2
JSRR R3

;add_val() pop 3,2 and push the result of 3+2 onto the stack [4,5]
LD R3, ADD_VAL_PTR
JSRR R3

;add_val() pop 4,5 and push the result of 4+5 onto the stack[9]
JSRR R3



;move the top value of the stack into r4
ADD R1, R1, #-1
LDR R4, R1, #0

HALT

STORAGE                 .BLKW   #100
PUSH_VAL_PTR            .FILL   x3400
ADD_VAL_PTR             .FILL   x3800

.end




;push val subroutine takes in r2 which has number to be pushed and r1 which has pointer pointing to next avaliable space
.orig x3400 ;;push_val(int val)implement your push function that will push a value onto the stack

ST R0, BACKUP_R0_3400
ST R3, BACKUP_R3_3400
ST R4, BACKUP_R4_3400
ST R5, BACKUP_R5_3400
ST R6, BACKUP_R6_3400
ST R7, BACKUP_R7_3400

STR R2, R1, #0
ADD R1, R1, #1

LD R0, BACKUP_R0_3400
LD R3, BACKUP_R3_3400
LD R4, BACKUP_R4_3400
LD R5, BACKUP_R5_3400
LD R6, BACKUP_R6_3400
LD R7, BACKUP_R7_3400

RET

BACKUP_R0_3400          .BLKW   #1
BACKUP_R3_3400          .BLKW   #1
BACKUP_R4_3400          .BLKW   #1
BACKUP_R5_3400          .BLKW   #1
BACKUP_R6_3400          .BLKW   #1
BACKUP_R7_3400          .BLKW   #1

.end

;this subroutine will take in r1 which points to the top of the stack.
.orig x3800 ;; add_val() pops two values from the top of the stack and pushes the result of adding the poppped value into the stack

ST R0, BACKUP_R0_3800
ST R2, BACKUP_R2_3800
ST R3, BACKUP_R3_3800
ST R4, BACKUP_R4_3800
ST R5, BACKUP_R5_3800
ST R6, BACKUP_R6_3800
ST R7, BACKUP_R7_3800

AND R6, R6, #0
ADD R1, R1, #-1
LDR R4, R1, #0
STR R6, R1, #0
ADD R1, R1, #-1
LDR R5, R1, #0
STR R6, R1, #0
ADD R4, R4, R5
STR R4, R1, #0
ADD R1, R1, #1

LD R0, BACKUP_R0_3800
LD R2, BACKUP_R2_3800
LD R3, BACKUP_R3_3800
LD R4, BACKUP_R4_3800
LD R5, BACKUP_R5_3800
LD R6, BACKUP_R6_3800
LD R7, BACKUP_R7_3800

RET

BACKUP_R0_3800          .BLKW   #1
BACKUP_R2_3800          .BLKW   #1
BACKUP_R3_3800          .BLKW   #1
BACKUP_R4_3800          .BLKW   #1
BACKUP_R5_3800          .BLKW   #1
BACKUP_R6_3800          .BLKW   #1
BACKUP_R7_3800          .BLKW   #1

.end



.orig x4200 ;;data you might need

.end


