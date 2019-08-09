# CentipedeASM
Computer Organization Project - Centipede Arcade Videogame

This game can run in a MIPS processor written in verilog that can be used in a FPGA, the project can be found here: https://github.com/LuisDev99/MIPS32-Processor

<a href="https://en.wikipedia.org/wiki/Centipede_(video_game)" />
<img src="https://upload.wikimedia.org/wikipedia/en/thumb/8/80/Centipede_arcade.png/220px-Centipede_arcade.png" />

## Description

Shoot insects in a mushroom field. The player is represented by a small insect-shaped character that appears at the bottom of the screen. The player can move the character through the lower area of the screen with a trackball and shoot lasers at a worm that advances from the top of the screen to the bottom through the mushroom field. Shooting at the head of the worm will cause them to become a mushroom, while shooting at the body of this will create another worm.

If the worm reaches the bottom of the screen, it moves back up into the player's movement area, adding segments to itself each time it reaches the limit of the part of the screen where the player can move . When all segments of the worm are destroyed, a new one appears at the top of the play area. The player loses a life if it is touched by the worm or some other enemy, such as the spider, a flea that leaves new fungi in its path when less than five are in the player's area, a scorpion that poisons the mushroom and sends the worm Direct to the player's zone. When a life is lost, all partially destroyed or poisoned mushroom return to normal. 

## Scoring System

- Normal and poisoned mushroom: 1 point (take four shots to destroy them). When the mushroom path is restored after the player loses a life, each poisoned or partially destroyed mushroom that is restored gives the player 5 points
- Worm (body): 10 points
- Worm (head): 100 points
- Flea: 200 points (it takes 2 shots to destroy it. The first makes it faster and the second destroys it)
- Spider (from afar): 300 points
- Spider (from near): 600 points
- Spider (from very close): 900 points
- Scorpion: 1000 points


## This project limit (hasta el momento *1 semana*)

- Fungus spawn (static)
- When the worm is shot, it is divided into two worms
- When a head is shot, a fungus is made
- The movement of the worm, if it went from left to right and touches an obstacle, that goes in the opposite direction, but always down, and vice versa
- Spider that will always appears moving to kill the player
- The score according to the distance of the spider

