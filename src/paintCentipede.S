.globl  paintCentipede

.extern main
.extern fgColor
.extern bgColor
.extern score

.text

#add this to the makefile
paintCentipede:
    lbu     $t0, 2($a0)            #loading isDead into t0
    beq     $zero, $t0, afterReturn #if (centipede->isDead)
    jr      $ra                     #return

afterReturn:

    # save a0 prologo
    addi    $sp, $sp, -36
    sw      $a0, 0($sp)
    sw      $a1, 4($sp)
    sw      $ra, 8($sp)
    sw      $s0, 12($sp)
    sw      $s1, 16($sp)
    sw      $s2, 20($sp)
    sw      $s3, 24($sp)
    sw      $s4, 28($sp)
    sw      $s5, 32($sp)

    move    $s0, $a0                #save address of a0 or the centipede reference
    lbu     $a0, 1($s0)             #centipede->location.y
    lbu     $a1, 0($s0)             #centipede->location.x

    jal     set_cursor

    la      $a0, fgColor
    la      $a1, bgColor

    jal     get_color
    
    move     $s1, $a0               #s1 will have whatever get_color put in a0
    move     $s2, $a1               #s2 will have whatever get_color put in a1

    addi    $a0, $zero, 0xa         #a0 = light green
    addi    $a1, $zero, 0x0         #a1 = black

    jal     set_color

    lbu      $s3, 4($s0)             #load centipede->currentDirection into $s3

    #Given that in all if blocks we access isHead, do it once before entering the if branches
    lbu     $s4, 3($s0)             #$s4 = isHead

    bne     $s3, $zero, elseIfDown  #centipede->currentDirection == UP

    beq     $s4, $zero, put_char11  #if(centipede->isHead)
    
    ori     $a0, $zero, 12          
    jal     put_char                #put_char(12)
    j       endOfFunction

put_char11:
    ori     $a0, $zero, 11          
    jal     put_char                #put_char(11)
    j       endOfFunction

elseIfDown:

    ori     $s5, $zero, 1           #s5 = DOWN (which is 1) in order to use it in the if
    bne     $s3, $s5, elseIfLeft    #if (centipede->currentDirection == DOWN)

    beq     $s4, $zero, put_char7   #if(centipede->isHead)
    
    ori     $a0, $zero, 8          
    jal     put_char                #put_char(8)
    j       endOfFunction

put_char7:
    ori     $a0, $zero, 7          
    jal     put_char                #put_char(7)
    j       endOfFunction


elseIfLeft:

    ori     $s5, $zero, 2           #s5 = LEFT (which is 2) in order to use it in the if
    bne     $s3, $s5, elseIfRight    #if (centipede->currentDirection == LEFT)

    beq     $s4, $zero, put_char1   #if(centipede->isHead)
    
    ori     $a0, $zero, 2          
    jal     put_char                #put_char(2)
    j       endOfFunction

put_char1:
    ori     $a0, $zero, 1          
    jal     put_char                #put_char(1)
    j       endOfFunction


elseIfRight:

    ori     $s5, $zero, 3           #s5 = RIGHT (which is 3) in order to use it in the if
    bne     $s3, $s5, endOfFunction    #if (centipede->currentDirection == RIGHT)

    beq     $s4, $zero, put_char9   #if(centipede->isHead)
    
    ori     $a0, $zero, 22          
    jal     put_char                #put_char(22)
    j       endOfFunction

put_char9:
    ori     $a0, $zero, 9          
    jal     put_char                #put_char(9)
    j       endOfFunction



endOfFunction:

    lbu     $a0, 0($s1)
    lbu     $a1, 0($s2)

    jal     set_color
    j       epilogo
 
epilogo:
    lw      $a0, 0($sp)
    lw      $a1, 4($sp)
    lw      $ra, 8($sp)
    lw      $s0, 12($sp)
    lw      $s1, 16($sp)
    lw      $s2, 20($sp)
    lw      $s3, 24($sp)
    lw      $s4, 28($sp)
    lw      $s5, 32($sp)
    addi    $sp, $sp, 36

    jr      $ra
