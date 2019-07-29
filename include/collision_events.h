#ifndef COLLISION_EVENTS_H
#define COLLISION_EVENTS_H

#include "system.h"

void bulletCollisionDetector();
void bullet_and_fungus_collision_detector(); //Assembled this - DONE
void bullet_and_spider_collision_detector();
void bullet_and_centipede_collision_detector();

void playerCollisionDetector(); //Assembled this - DONE

bool is_going_to_hit_a_fungus(uint8_t objX, uint8_t objY);

#endif