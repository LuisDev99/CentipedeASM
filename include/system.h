/*
 * system.h
 *
 *  Created on: Jul 6, 2017
 *      Author: ideras
 */

#ifndef SYSTEM_H_
#define SYSTEM_H_

#ifndef __ASSEMBLER__

typedef unsigned char bool;
typedef unsigned int uint32_t;
typedef unsigned short uint16_t;
typedef unsigned char uint8_t;
typedef signed char int8_t;
typedef signed int int32_t;
typedef unsigned short int16_t;

typedef volatile uint16_t *vga_ptr_t;

enum Directions
{
    //size = 192
    UP = 0,
    DOWN = 1,
    LEFT = 2,
    RIGHT = 3,
    COMING_UP = 4,
    COMING_DOWN = 5
};

typedef struct Objects
{
    //size = 2 bytez
    uint8_t x; // 0 - 7
    uint8_t y; // 8 - 15

} Object;

typedef struct CentipedesObjects
{
    Object location; // 0 - 15
    bool isDead;     //16 - 17
    bool isHead;     //18 - 19

    enum Directions currentDirection;  //20 - 23
    enum Directions previousDirection; //24 - 27
    enum Directions isComing;          //28 - 31

} CentipedeObj;

typedef struct SpiderObjects
{
    Object location; //0 - 15

    enum Directions currentDirection;  //16 - 19
    enum Directions previousDirection; //20 - 23
    enum Directions isComing;          //24 - 27

} SpiderObj;

#define true 1
#define false 0

#define VGA_START_ADDR ((vga_ptr_t)0xb800)
#define VGA_END_ADDR ((vga_ptr_t)0xcabf)
#define BTN_STATE_REG_ADDR ((volatile unsigned char *)0xffff0004)
#define MS_COUNTER_REG_ADDR ((volatile unsigned int *)0xffff0008)

#else

#define VGA_START_ADDR 0xb800
#define VGA_END_ADDR 0xcabf
#define KEYPAD_STATE_REG_ADDR 0xffff0004
#define MS_COUNTER_REG_ADDR 0xffff0008
#define KEYPAD_COUNT 8

#endif

#endif /* SYSTEM_H_ */
