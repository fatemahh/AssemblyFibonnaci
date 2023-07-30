
.data
Input:
	.string "Enter integer for fibonnacci: "	
			
.text
la a0, Input
li a7, 4
ecall

li a7,5 # take input
ecall

jal fib # run fibonacci
	
li a7, 1 # output result
ecall
li a7, 10 # end program
ecall
	
fib:
addi t0, x0, 3
bge a0, t0, fib_ric # check if input is >= 3 to enter function
li a0, 1 # base case of Fibonacci sequence when input is <= 2
jalr zero, ra, 0 # return to main
	
fib_ric:
addi sp, sp, -12
sw ra, 0(sp)
sw a0, 4(sp)	# add a0 and return address n to stack


addi a0, a0, -1 # get(n-1)
jal fib # call fib(n-1)
sw a0, 8(sp) # add result of fib(n-1) to stack

lw a0, 4(sp)
addi a0, a0, -2 # get (n-2)
jal fib # call fib(n-2)

lw t0, 8(sp)	# fetch fib(n-1) to do sum with result of fib(n-2) in a0
add a0, a0, t0	# fib(n-2)+fib(n-1) and store in a0

lw ra, 0(sp) # return address
addi sp, sp, 12 # add pointer to original place
jalr zero, ra, 0 # return to function fib

