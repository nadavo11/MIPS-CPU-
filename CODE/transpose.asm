
.data

matrix: .word 1, 2, 3, 4, 5, 6, 7, 8, 9,10,11,12,13,14,15,16
shmatrix : .word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0	
M: .word 4

.text


la $a0, matrix 				# a0 is the pointer to matrix[0][0]
la $a1,	shmatrix			# a1 is the pointer to shmatrix[0][0]

li $t0, 0 				# $t0 is current row #
li $t1, 0				# $t1 is current column #
lw $a2, M 				# $a2 is M #

li $t4, 0
li $t5, 0
make_4M:
#-------------------------------------------------------------------------------------------------------------			
beq $t5, 4, main			# 	t4 = M*4  
add $t4, $t4, $a2			#			
addi $t5, $t5,1				#	(we need it to easily "skip" M matrix entries - in other words: 
j make_4M				#	go to the next column
#-------------------------------------------------------------------------------------------------------------
##############################################################################################################
main:					#
add $s0, $a0, $zero		 	# $s0 points to A[0][0]
add $s1, $a1, $zero 			# $s1 points to A'[0][0]
					#
outer_loop:				# while ( row < M ){
beq $t0, $a2, exit 			#	
					#			// Here, $s0 always points to A[0][j]
					#			// which is -first element, current row
addi $s1, $a1,0				#-------------------------------------------------
li $t5, 0				#	$s1 <-  A[row][0]
find_col:				#			//this loop is to make
beq $t5, 4, inner_loop			# 			//$s1 point to A[j][0]  
add $s1, $s1, $t0			#			// - this is A + 4*j = A + 4* $ t0	
addi $t5, $t5,1				#			
j find_col				#--------------------------------------------------
#########				# 	
inner_loop:				#	while ( col < M ){
beq $t1, $a2, outer_loop_inc 		#	 
 					#
lw $t2, 0($s0) 				#	 $t2 <- A[row][column]
sw $t2, 0($s1)				# 	 A'[column][row] = A[row][column]
					#
addi $s0, $s0, 4 			# 	$s0 ++ (next element in A)
add  $s1, $s1, $t4			# 	$s1 += M (next row)		//we use $t4 = 4*M beacause each element is 4 bytes
					#
addi $t1, $t1, 1 	 		#	t1 ++
j inner_loop				#	}
##########				#--------------------------------------------------
 					#
outer_loop_inc:				#--------------------------------------------------
					#
addi $t1, $zero, 0			# $t1 = 0 (first column)
addi $t0, $t0, 1 			# $t0 ++  (next row)
 					# }
j outer_loop				# ------------------------------
##############################################################################################################
exit:
nop
