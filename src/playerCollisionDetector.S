# .globl  playerCollisionDetector

# .extern player
# .extern spider
# .extern centipede_body

# .text

# playerCollisionDetector:

#     #prologo
#     addi    $sp, $sp, -4
#     sw      $ra, 0($sp)

#     #load all global variable addresses
#     la      $t0, player
#     la      $t1, spider
#     la      $t2, centipede_body

#     #if ((player.x == spider.location.x || player.x == spider.location.x + 1) && player.y == spider.location.y)
#     lbu     $t3, 0($t0)                         #player.x
#     lbu     $t4, 0($t1)                         #spider.location.x
#     beq     $t3, $t4, nextCondition             #if ((player.x == spider.location.x)) then do the next condition

#     addiu   $t4, $t4, 1                         #spider.location.x+1
#     bne     $t3, $t4, restOfFunction

# nextCondition:
#     lbu     $t5, 1($t0)                         #player.y (using different register to use it later on in order to save a load instruction of player.x)
#     lbu     $t4, 1($t0)                         #spider.location.y (using the same register)
#     bne     $t3, $t4, restOfFunction            #if(player.y == spider.location.y)
#     jal     registerPlayerDeath                 #registerPlayerDeath()
#     j       endOfFunction                       #return


# restOfFunction:

#     addi    $t6, $zero, 0                       #i = 0
#     addi    $t7, $zero, 14                      #CENTIPEDE_BODY_SIZE which is 14

# for:
#     slt     $t8, $t6, $t7                       #i < CENTIPEDE_BODY_SIZE
#     beq     $t8, $zero, endOfFunction



# endOfFunction:
#     #epilogo
#     lw      $ra, 0($sp)
#     addi    $sp, $sp, 4
#     jr      $ra


