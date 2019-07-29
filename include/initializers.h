#ifndef INITIALIZERS_H
#define INITIALIZERS_H

#include "system.h"

void clearPosition(Object *obj);
void updateScore();
void resetGlobalVariables();
void welcomeScreen();

void registerPlayerDeath();

void set_fungus_in_array_and_print(uint8_t index, uint8_t x, uint8_t y);
void initializeCentipede();

#endif