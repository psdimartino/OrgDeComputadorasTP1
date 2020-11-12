#include <sys/regdef.h>

.text
main:
	addiu $a0, $zero, 256 # 10 in a0
	addiu $a1, $zero, 192  # 5 in a1
	# result should be 64 (0x00000040)
	
	jal mcm  # Jumps to mcd. Saves return address in ra
	
	li $v0, 1 # print int
	addi $a0, $v1, 0 # moves v1 to a0 (to print)
	syscall
	
	li $v0, 10 # end program
	syscall
	
mcd:
	subu $sp, $sp, 40 # create stack #define SS 40
	sw $ra, 32($sp) # store retrun adress in stack
    	sw $gp, 28($sp)	# store global pointer in stack
    	sw $fp, 24($sp)	# store function pointer in stack
    	
    	#move $fp, $sp # why
    	
    	#sw $a0, 40($fp) # store a0 in stack?
    	
    	#lw $t0, 40($fp)
    	#sw $t0, 16($fp)
    	
    	#li $t0, 1
    	#sw $t0, 20($fp) 
	#a0 = m, a1 = n
	#if ( n == 0 ) {
        #	return m;
    	#}
    	#return mcd(n, m % n);:
    	beq $a1, $zero, ret
    	divu $a0, $a1
    	mfhi $a0
    	
    	#XOR swap
    	xor $a0, $a0, $a1
	xor $a1, $a0, $a1
	xor $a0, $a0, $a1
    	jal mcd
ret:
	addiu $v1, $a0, 0 # return value in v1
	lw $fp, 24($sp)
    	lw $gp, 28($sp)
    	lw $ra, 32($sp)
	addiu $sp, $sp, 40 # bring back stack pointer
	jr $ra # return
mcm:
	subu $sp, $sp, 40 # create stack #define SS 40
	sw $ra, 32($sp) # store retrun adress in stack
    	sw $gp, 28($sp)	# store global pointer in stack
    	sw $fp, 24($sp)	# store function pointer in stack
    	
	multu $a0, $a1
	mflo $t0 # Does to result fit in 32 bit?
	jal mcd
	divu $v1, $t0, $v1
	
	lw $fp, 24($sp)
    	lw $gp, 28($sp)
    	lw $ra, 32($sp)
	addiu $sp, $sp, 40 # bring back stack pointer
	jr $ra # return