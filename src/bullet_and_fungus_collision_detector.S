.globl  bullet_and_fungus_collision_detector

.extern bullet
.extern fungus
.extern score
.extern shouldBulletBePainted

.text

bullet_and_fungus_collision_detector:

    #prologue
    addi    $sp, $sp, -24
    sw      $s0, 0($sp)
    sw      $s1, 4($sp)
    sw      $s2, 8($sp)
    sw      $s3, 12($sp)
    sw      $a0, 16($sp)
    sw      $ra, 20($sp)
    
    la      $t2, bullet
    la      $t3, fungus
    la      $t4, score
    la      $t5, shouldBulletBePainted

    # ##########################################
    # DEBUGGER, just use t6 to print out the value
    # lbu     $t6, 1($t2)
    # addi    $t6, $t6, 1
    # sb      $t6, 0($t4)
    # j       endOfFunction
    # ##########################################

    #loading bullet.x and bullet.y
    lbu     $t6, 0($t2)                         #bullet.x
    lbu     $t7, 1($t2)                         #bullet.y

    addi    $t0, $zero, 0                       #i = 0
    addi    $t1, $zero, 31                      #amount_of_fungus

for:
    slt     $t8, $t0, $t1                       #i < AMOUNT_OF_FUNGUS
    beq     $t8, $zero, endOfFunction

    sll     $t8, $t0, 1
    add     $t8, $t8, $t3                       #&fungus + iterator

    #start using registers s instead of temps
    lbu     $s0, 0($t8)                         #fungus[i].x
    lbu     $s1, 1($t8)                         #fungus[i].y

    bne     $t6, $s0, nextIteration             #if (bullet.x == fungus[i].x)
    bne     $t7, $s1, nextIteration             #if (bullet.y == fungus[i].y)

    #score++
    lbu     $s2, 0($t4)                         #load whatever value score has
    addi    $s2, $s2, 1                         #score++
    sb      $s2, 0($t4)                         #save score

    #fungus[i].x = fungus[i].y = 250;
    addiu   $s3, $zero, 250                     #constant 250

    sb      $s3, 0($t8)                         #fungus[i].x = 250
    sb      $s3, 1($t8)                         #fungus[i].y = 250

    #Clean the bullet
    add     $a0, $zero, $t2                     #loading bullet adress to parameter register

    #Save $t5, $t6 and $t7 before calling clearPosition
    addi    $sp, $sp, -16
    sw      $t5, 0($sp)
    sw      $t6, 4($sp)
    sw      $t7, 8($sp)
    sw      $t2, 12($sp)

    jal     clearPosition

    lw      $t5, 0($sp)
    lw      $t6, 4($sp)
    lw      $t7, 8($sp)
    lw      $t2, 12($sp)
    addi    $sp, $sp, 16

    addiu   $s3, $zero, 230                     #constant 230

    #bullet.x = bullet.y = 230
    sb      $s3, 0($t2)
    sb      $s3, 1($t2)

    #shouldBulletBePainted = false
    addi    $s3, $zero, 0                       #constante false or 0
    sb      $s3, 0($t5)

    j       endOfFunction                       #return


nextIteration:
    addi    $t0, $t0, 1
    j       for


endOfFunction:
    #epilogue
    lw      $s0, 0($sp)
    lw      $s1, 4($sp)
    lw      $s2, 8($sp)
    lw      $s3, 12($sp)
    lw      $a0, 16($sp)
    lw      $ra, 20($sp)
    addi    $sp, $sp, 24

    jr      $ra