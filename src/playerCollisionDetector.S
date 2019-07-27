.globl  playerCollisionDetector

.extern player
.extern spider
.extern centipede_body
.extern score

.text

playerCollisionDetector:

    #prologo
    addi    $sp, $sp, -12
    sw      $ra, 0($sp)
    sw      $s0, 4($sp)
    sw      $s1, 8($sp)

    #load all global variable addresses
    la      $t0, player
    la      $t1, spider
    la      $t2, centipede_body
    la      $s0, score

    lbu     $t3, 0($t0)                         #player.x
    lbu     $t4, 0($t1)                         #spider.location.x
    beq     $t3, $t4, nextCondition             #if ((player.x == spider.location.x)) then do the next condition

    addi    $t4, $t4, 1                         #spider.location.x+1
    bne     $t3, $t4, restOfFunction

nextCondition:
    lbu     $t5, 1($t0)                         #player.y (using different register to use it later on in order to save a load instruction of player.x)
    lbu     $t4, 1($t1)                         #spider.location.y (using the same register)
    bne     $t5, $t4, restOfFunction            #if(player.y == spider.location.y)
    jal     registerPlayerDeath                 #registerPlayerDeath()
    j       endOfFunction                       #return


restOfFunction:

    addi    $t6, $zero, 0                       #i = 0
    addi    $t7, $zero, 14                      #CENTIPEDE_BODY_SIZE which is 14
    lbu     $t5, 1($t0)                         #player.y
    lbu     $t3, 0($t0)                         #player.x

for:
    slt     $t8, $t6, $t7                       #i < CENTIPEDE_BODY_SIZE
    beq     $t8, $zero, endOfFunction

    sll     $t8, $t6, 3                         #multiply by 8 because every centipede object is 8 bytes
    add     $t8, $t2, $t8                       #&centipede_body + iterator

    lbu     $t9, 2($t8)                         #centipede_body[i].isDead
    bne     $t9, $zero, nextIteration           #if (centipede_body[i].isDead)

    lbu     $t4, 0($t8)                         #centipede_body[i].location.x                    
    bne     $t3, $t4, nextIteration             #if (player.x == centipede_body[i].location.x)
    lbu     $t4, 1($t8)                         #centipede_body[i].location.y

    # ##########################################
    # #DEBUGGER, just use s1 to print out the value
    # add     $s1, $zero, $t0 
    # sb      $s1, 0($s0)
    # j       endOfFunction
    # ##########################################

    bne     $t4, $t5, nextIteration             #if(player.y == centipede_body[i].location.y)

    jal     registerPlayerDeath                 #registerPlayerDeath()
    j       endOfFunction                       #return   

nextIteration:
    addi    $t6, $t6, 1                         #i++
    j       for

endOfFunction:
    #epilogo
    lw      $ra, 0($sp)
    lw      $s0, 4($sp)
    lw      $s1, 8($sp)
    addi    $sp, $sp, 12
    jr      $ra


