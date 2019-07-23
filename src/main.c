#include <screen.h>
#include <keypad.h>

#define TO_STR(ch) ((((ch) >= 0) && ((ch) <= 9)) ? (48 + (ch)) : ('a' + ((ch)-10)))

#define AMOUNT_OF_FUNGUS 30
#define CENTIPEDE_BODY_SIZE 14

enum Directions
{
    UP = 0,
    DOWN = 1,
    LEFT = 2,
    RIGHT = 3,
    COMING_UP = 4,
    COMING_DOWN = 5
};

typedef struct Objects
{
    uint8_t x;
    uint8_t y;

} Object;

typedef struct CentipedesObjects
{
    Object location;
    bool isDead;
    bool isHead;

    enum Directions currentDirection, previousDirection, isComing;

} CentipedeObj;

typedef struct SpiderObjects
{
    Object location;

    enum Directions currentDirection, previousDirection, isComing;

} SpiderObj;

void clearPosition(Object obj);
void updateScore();
void resetGlobalVariables();
void welcomeScreen();

void registerPlayerDeath();

void HandlePlayer();
void HandleSpider();
void HandleBullet(uint8_t objYPos, uint8_t objXPos);

void HandleCentipede();

void paintFungus();
void paintPlayer(Object player);
void paintBullet(Object bullet);
void paintSpider(Object spider);
void paintCentipede(CentipedeObj centipede);

void set_fungus_in_array_and_print(uint8_t index, uint8_t x, uint8_t y);
void initializeCentipede();

void bulletCollisionDetector();
void playerCollisionDetector();

bool is_going_to_hit_a_fungus(uint8_t objX, uint8_t objY);

bool bulletWasPressed = false;
bool shouldBulletBePainted = false;

//Spider movement control
bool spiderDoneMovingUp = false;
bool spiderDoneMovingDown = false;
bool spiderDoneMovingLeft = false;
bool spiderDoneMovingRight = false;

Object fungus[AMOUNT_OF_FUNGUS];
CentipedeObj centipede_body[CENTIPEDE_BODY_SIZE];
SpiderObj spider;

Object player, bullet;

uint8_t score, lifes, centipedes_remaining;

int main()
{

    clear_screen();
    set_color(WHITE, BLACK);

    set_cursor(15, 40);
    keypad_init();

    welcomeScreen();

    resetGlobalVariables();

    while (1)
    {
        delay_ms(20); //Regulates game movement

        updateScore();

        //Draw the score in the top left corner of the screen
        set_cursor(0, 78);
        put_char(TO_STR(score));

        bulletCollisionDetector(); //Detect collision in here or at the end of the loop?

        //Listen to player's keys
        HandlePlayer();

        //Automated spider
        HandleSpider();

        //Automated Centipede
        HandleCentipede();

        if (shouldBulletBePainted)
        {

            //If the player shot a bullet, then call handle bullet but using the player's location to spawn new bullet on top of the player
            if (bulletWasPressed)
            {
                clearPosition(bullet);
                HandleBullet(player.y - 1, player.x);
                bulletWasPressed = false;
            }
            else
            {
                //Else, keep grabbing the bullet's current position and moving the bullet up until it reaches the top end screen
                clearPosition(bullet);
                bullet.y--;

                HandleBullet(bullet.y, bullet.x);
            }

            //Avoid drawing the bullet eventhough it already finish reaching the top
            if (bullet.y != 0)
                paintBullet(bullet);
        }

        paintPlayer(player);
        paintSpider(spider.location);

        playerCollisionDetector();
    }

    return 0;
}

void HandleBullet(uint8_t objYPos, uint8_t objXPos)
{
    if (objYPos == 0)
    {
        //If the bullet reached the top end screen, the bullet shouldnt be painted anymore
        shouldBulletBePainted = false;
        return;
    }

    bullet.y = objYPos;
    bullet.x = objXPos;
}

void HandleCentipede()
{
    for (uint8_t i = 0; i < CENTIPEDE_BODY_SIZE; i++)
    {

        if (centipede_body[i].isDead)
            continue;

        clearPosition(centipede_body[i].location);

        if (centipede_body[i].isComing == COMING_DOWN)
        {

            if (centipede_body[i].currentDirection == LEFT)
            {

                /* If the centipede was coming from the left, keep moving it 
               to the left until it reaches the end of the screen, and when
               it does, make it move downwards by 1 and set the current direction 
               to the right */
                if (centipede_body[i].location.x == 0 || is_going_to_hit_a_fungus(centipede_body[i].location.x - 1, centipede_body[i].location.y))
                {
                    //check if we have reach the bottom of the screen, if we did, start
                    //moving the centipede up
                    if (centipede_body[i].location.y + 1 == MAX_ROWS)
                    {
                        centipede_body[i].location.y--;
                        centipede_body[i].isComing = COMING_UP;
                        centipede_body[i].previousDirection = centipede_body[i].currentDirection;
                        centipede_body[i].currentDirection = UP;
                    }
                    else
                    {

                        centipede_body[i].location.y++;
                        centipede_body[i].previousDirection = centipede_body[i].currentDirection;
                        centipede_body[i].currentDirection = DOWN;
                    }
                }
                else
                {
                    centipede_body[i].location.x--;
                    centipede_body[i].currentDirection = LEFT;
                }
            }
            else if (centipede_body[i].currentDirection == RIGHT)
            {

                if (centipede_body[i].location.x == (MAX_COLS - 1) || is_going_to_hit_a_fungus(centipede_body[i].location.x + 1, centipede_body[i].location.y))
                {
                    if (centipede_body[i].location.y + 1 == MAX_ROWS)
                    {
                        centipede_body[i].location.y--;
                        centipede_body[i].isComing = COMING_UP;
                        centipede_body[i].previousDirection = centipede_body[i].currentDirection;
                        centipede_body[i].currentDirection = UP;
                    }
                    else
                    {
                        centipede_body[i].location.y++;
                        centipede_body[i].previousDirection = centipede_body[i].currentDirection;
                        centipede_body[i].currentDirection = DOWN;
                    }
                }
                else
                {
                    centipede_body[i].location.x++;
                    centipede_body[i].currentDirection = RIGHT;
                }
            }
            else if (centipede_body[i].currentDirection == DOWN)
            {
                //If the centipede is currently going down, give it
                //a new direction that is opposite from where it came from
                if (centipede_body[i].previousDirection == LEFT)
                {
                    centipede_body[i].currentDirection = RIGHT;
                    centipede_body[i].location.x++;
                }
                else
                {
                    centipede_body[i].currentDirection = LEFT;
                    centipede_body[i].location.x--;
                }
            }
        }
        else
        {
            if (centipede_body[i].currentDirection == LEFT)
            {

                /* If the centipede was coming from the left, keep moving it 
               to the left until it reaches the end of the screen, and when
               it does, make it move downwards by 1 and set the current direction 
               to the right */
                if (centipede_body[i].location.x == 0 || is_going_to_hit_a_fungus(centipede_body[i].location.x - 1, centipede_body[i].location.y))
                {
                    //check if we have reach the bottom of the screen, if we did, start
                    //moving the centipede up
                    if (centipede_body[i].location.y - 1 == 0)
                    {
                        centipede_body[i].location.y++;
                        centipede_body[i].isComing = COMING_DOWN;
                        centipede_body[i].previousDirection = centipede_body[i].currentDirection;
                        centipede_body[i].currentDirection = DOWN;
                    }
                    else
                    {

                        centipede_body[i].location.y--;
                        centipede_body[i].previousDirection = centipede_body[i].currentDirection;
                        centipede_body[i].currentDirection = UP;
                    }
                }
                else
                {
                    centipede_body[i].location.x--;
                    centipede_body[i].currentDirection = LEFT;
                }
            }
            else if (centipede_body[i].currentDirection == RIGHT)
            {

                if (centipede_body[i].location.x == (MAX_COLS - 1) || is_going_to_hit_a_fungus(centipede_body[i].location.x + 1, centipede_body[i].location.y))
                {
                    if (centipede_body[i].location.y - 1 == 0)
                    {
                        centipede_body[i].location.y++;
                        centipede_body[i].isComing = COMING_DOWN;
                        centipede_body[i].previousDirection = centipede_body[i].currentDirection;
                        centipede_body[i].currentDirection = DOWN;
                    }
                    else
                    {
                        centipede_body[i].location.y--;
                        centipede_body[i].previousDirection = centipede_body[i].currentDirection;
                        centipede_body[i].currentDirection = UP;
                    }
                }
                else
                {
                    centipede_body[i].location.x++;
                    centipede_body[i].currentDirection = RIGHT;
                }
            }
            else if (centipede_body[i].currentDirection == UP)
            {
                //If the centipede is currently going down, give it
                //a new direction that is opposite from where it came from
                if (centipede_body[i].previousDirection == LEFT)
                {
                    centipede_body[i].currentDirection = RIGHT;
                    centipede_body[i].location.x++;
                }
                else
                {
                    centipede_body[i].currentDirection = LEFT;
                    centipede_body[i].location.x--;
                }
            }
        }

        paintCentipede(centipede_body[i]);
    }
}

void HandleSpider()
{
    //Spider takes two columns, soo clear both of them
    clearPosition(spider.location);
    spider.location.x++;
    clearPosition(spider.location);
    spider.location.x--;

    // //Implement the same logic as the one in handle centipede
    if (spider.isComing == COMING_UP)
    {
        if (spider.currentDirection == LEFT)
        {
            if (spider.location.y == 1 || is_going_to_hit_a_fungus(spider.location.x - 1, spider.location.y - 1) || is_going_to_hit_a_fungus(spider.location.x, spider.location.y - 1))
            {
                spider.isComing = COMING_DOWN;
                spider.location.y++;
                spider.location.x--;
            }
            else if (spider.location.x == 1 || is_going_to_hit_a_fungus(spider.location.x - 1, spider.location.y - 1) || is_going_to_hit_a_fungus(spider.location.x, spider.location.y - 1))
            {
                spider.currentDirection = RIGHT;
                spider.location.y--;
                spider.location.x++;
            }
            else
            {
                spider.location.y--;
                spider.location.x--;
            }
        }

        else if (spider.currentDirection == RIGHT)
        {
            if (spider.location.y == 1 || is_going_to_hit_a_fungus(spider.location.x + 1, spider.location.y - 1) || is_going_to_hit_a_fungus(spider.location.x + 2, spider.location.y - 1))
            {
                spider.isComing = COMING_DOWN;
                spider.location.y++;
                spider.location.x++;
            }
            else if (spider.location.x == (MAX_COLS - 1) || is_going_to_hit_a_fungus(spider.location.x + 1, spider.location.y - 1) || is_going_to_hit_a_fungus(spider.location.x + 2, spider.location.y - 1))
            {
                spider.currentDirection = LEFT;
                spider.location.y--;
                spider.location.x--;
            }
            else
            {
                spider.location.x++;
                spider.location.y--;
            }
        }
    }
    else if (spider.isComing == COMING_DOWN)
    {
        if (spider.currentDirection == LEFT)
        {
            if (spider.location.y == (MAX_ROWS - 1) || is_going_to_hit_a_fungus(spider.location.x - 1, spider.location.y + 1) || is_going_to_hit_a_fungus(spider.location.x, spider.location.y + 1))
            {
                spider.isComing = COMING_UP;
                spider.location.y--;
                spider.location.x--;
            }
            else if (spider.location.x == 1 || is_going_to_hit_a_fungus(spider.location.x - 1, spider.location.y + 1) || is_going_to_hit_a_fungus(spider.location.x, spider.location.y + 1))
            {
                spider.currentDirection = RIGHT;
                spider.location.y++;
                spider.location.x++;
            }
            else
            {
                spider.location.x--;
                spider.location.y++;
            }
        }

        else if (spider.currentDirection == RIGHT)
        {
            if (spider.location.y == (MAX_ROWS - 1) || is_going_to_hit_a_fungus(spider.location.x + 1, spider.location.y + 1) || is_going_to_hit_a_fungus(spider.location.x + 2, spider.location.y + 1))
            {
                spider.isComing = COMING_UP;
                spider.location.y--;
                spider.location.x++;
            }
            else if (spider.location.x == (MAX_COLS - 1) || is_going_to_hit_a_fungus(spider.location.x + 1, spider.location.y + 1) || is_going_to_hit_a_fungus(spider.location.x + 2, spider.location.y + 1))
            {
                spider.currentDirection = LEFT;
                spider.location.y++;
                spider.location.x--;
            }
            else
            {
                spider.location.y++;
                spider.location.x++;
            }
        }
    }

    //spider.x = spider.y = *MS_COUNTER_REG_ADDR & 0x00000004 + player.x;
}

void HandlePlayer()
{
    /* This functions whenever it gets called, listens to the keyboard,
       and depending on the key, it will update the player's x and y
       and return it soo that the player variable that is in main gets updated  
       with the new x and y. This function also handles if the player shot a
       bullet by setting a global variable */

    uint8_t k = keypad_getkey();

    if (k != 0)
    {

        switch (k)
        {
        case 1: //Left

            if (player.x != 0)
            {

                //If the player wants to move to the left but there's a fungus, then the player
                //cant move to the left
                if (is_going_to_hit_a_fungus(player.x - 1, player.y) == false)
                {
                    clearPosition(player);
                    player.x--;
                }
            }

            break;

        case 2: //Right

            if (player.x < MAX_COLS - 1)
            {
                if (is_going_to_hit_a_fungus(player.x + 1, player.y) == false)
                {
                    clearPosition(player);
                    player.x++;
                }
            }

            break;

        case 3: //Down

            if (player.y < MAX_ROWS - 1)
            {
                if (is_going_to_hit_a_fungus(player.x, player.y + 1) == false)
                {
                    clearPosition(player);
                    player.y++;
                }
            }
            break;

        case 4: //Up
            if (player.y != 0)
            {
                if (is_going_to_hit_a_fungus(player.x, player.y - 1) == false)
                {
                    clearPosition(player);
                    player.y--;
                }
            }
            break;

        case 8: //Space para disparar
            bulletWasPressed = true;
            shouldBulletBePainted = true;
            break;
        }
    }
}

void paintPlayer(Object player)
{
    //Grab last color to restore it after painting the player's ship color
    uint8_t fgColor, bgColor;
    get_color(&fgColor, &bgColor);

    set_cursor(player.y, player.x);
    set_color(GREEN, BLACK);

    put_char(14);

    set_color(fgColor, bgColor);
}

void paintBullet(Object bullet)
{
    uint8_t fgColor, bgColor;
    get_color(&fgColor, &bgColor);

    set_cursor(bullet.y, bullet.x);
    set_color(RED, BLACK);

    put_char(13);

    set_color(fgColor, bgColor);
}

void paintSpider(Object spider)
{

    uint8_t fgColor, bgColor;
    get_color(&fgColor, &bgColor);

    set_color(BROWN, BLACK);

    set_cursor(spider.y, spider.x);

    put_char(37);
    put_char(38);

    set_color(fgColor, bgColor);
}

void paintFungus()
{
    /* Paint random fungus accross all screen */

    uint8_t fgColor, bgColor;
    get_color(&fgColor, &bgColor);

    set_color(LIGHT_MAGENTA, BLACK);

    //Original smelly code
    /*fungus[0].x = 3;
    fungus[0].y = 3;
    set_cursor(3, 3);
    put_char(4); */

    //New Code this
    set_fungus_in_array_and_print(0, 3, 3);
    set_fungus_in_array_and_print(1, 10, 10);
    set_fungus_in_array_and_print(2, 10, 13);
    set_fungus_in_array_and_print(3, 15, 11);
    set_fungus_in_array_and_print(4, 17, 14);
    set_fungus_in_array_and_print(5, 44, 20);
    set_fungus_in_array_and_print(6, 70, 22);
    set_fungus_in_array_and_print(7, 77, 21);
    set_fungus_in_array_and_print(8, 50, 27);
    set_fungus_in_array_and_print(9, 40, 3);
    set_fungus_in_array_and_print(10, 60, 2);
    set_fungus_in_array_and_print(11, 73, 5);

    //12-24
    set_fungus_in_array_and_print(12, 21, 3);
    set_fungus_in_array_and_print(13, 15, 20);
    set_fungus_in_array_and_print(14, 56, 7);
    set_fungus_in_array_and_print(15, 30, 23);
    set_fungus_in_array_and_print(16, 19, 27);
    set_fungus_in_array_and_print(17, 78, 5);
    set_fungus_in_array_and_print(18, 47, 21);
    set_fungus_in_array_and_print(19, 67, 15);
    set_fungus_in_array_and_print(20, 31, 18);
    set_fungus_in_array_and_print(21, 53, 19);
    set_fungus_in_array_and_print(22, 28, 10);
    set_fungus_in_array_and_print(23, 34, 9);

    //25-30
    set_fungus_in_array_and_print(24, 44, 22);
    set_fungus_in_array_and_print(25, 61, 29);
    set_fungus_in_array_and_print(26, 62, 11);
    set_fungus_in_array_and_print(27, 68, 19);
    set_fungus_in_array_and_print(28, 69, 10);
    set_fungus_in_array_and_print(29, 59, 14);

    //Restore color
    set_color(fgColor, bgColor);
}

void paintCentipede(CentipedeObj centipede)
{
    if (centipede.isDead)
        return;

    set_cursor(centipede.location.y, centipede.location.x);

    uint8_t fgColor, bgColor;
    get_color(&fgColor, &bgColor);

    set_color(LIGHT_GREEN, BLACK);

    if (centipede.currentDirection == UP)
    {
        if (centipede.isHead)
        {
            put_char(12);
        }
        else
        {
            put_char(11);
        }
    }
    else if (centipede.currentDirection == DOWN)
    {
        if (centipede.isHead)
        {
            put_char(8);
        }
        else
        {
            put_char(7);
        }
    }
    else if (centipede.currentDirection == LEFT)
    {
        if (centipede.isHead)
        {
            put_char(2);
        }
        else
        {
            put_char(1);
        }
    }
    else if (centipede.currentDirection == RIGHT)
    {
        if (centipede.isHead)
        {
            put_char(22);
        }
        else
        {
            put_char(9);
        }
    }

    //Restore color
    set_color(fgColor, bgColor);
}

void set_fungus_in_array_and_print(uint8_t index, uint8_t x, uint8_t y)
{
    fungus[index].x = x;
    fungus[index].y = y;
    set_cursor(y, x);
    put_char(4);
}

void initializeCentipede()
{
    for (uint8_t i = 0; i < CENTIPEDE_BODY_SIZE; i++)
    {
        if (i == 0)
        {
            centipede_body[i].isHead = true;
        }
        else
        {
            centipede_body[i].isHead = false;
        }

        //Place each centipede location according to its index soo that in the beginning, the whole centipede spawns
        //in the top right end of the screen
        centipede_body[i].location.x = ((MAX_ROWS - 1) - CENTIPEDE_BODY_SIZE) + i;
        centipede_body[i].location.y = 1;

        centipede_body[i].currentDirection = LEFT;
        centipede_body[i].previousDirection = RIGHT;
        centipede_body[i].isComing = COMING_DOWN;
        centipede_body[i].isDead = false;
    }

    centipedes_remaining = CENTIPEDE_BODY_SIZE;
}

bool is_going_to_hit_a_fungus(uint8_t objX, uint8_t objY)
{
    /* use this function to tell whether the object to check will hit a fungus in advanced */

    for (uint8_t i = 0; i < AMOUNT_OF_FUNGUS; i++)
    {
        if (fungus[i].x == objX && fungus[i].y == objY)
        {
            return true;
        }
    }

    return false;
}

void bulletCollisionDetector()
{
    /* CHECKING COLLISION ON FUNGUS SECTION */

    //Detect if the bullet collided with fongus
    for (uint8_t i = 0; i < AMOUNT_OF_FUNGUS; i++)
    {
        if (bullet.x == fungus[i].x && bullet.y == fungus[i].y)
        {
            /* set_cursor(bullet.y, bullet.x);
            puts("Collision boy"); */
            score++;

            /* Set the fungus position to 250 soo when the bullet hits it, 
               it would no longer be invisible and keep registering collisions
               eventhough it already did. In other words, this avoids the bullet
               from hitting the same fungus over again */
            fungus[i].x = fungus[i].y = 250;

            //Clean the bullet
            clearPosition(bullet);
            bullet.x = bullet.y = 230; //Out of bound location soo that it wont register with anything else
            shouldBulletBePainted = false;

            return;
        }
    }

    /* CHECKING COLLISION ON SPIDER SECTION */

    //The spider takes two column spaces, soo check both of them to detect collision
    if ((bullet.x == spider.location.x || bullet.x == spider.location.x + 1) && bullet.y == spider.location.y)
    {

        //spider takes two column spaces long, so clear those two spaces
        clearPosition(spider.location);
        spider.location.x++;
        clearPosition(spider.location);

        uint8_t score_over_distance_kill = 0;

        if (player.y - spider.location.y >= 9)
            score_over_distance_kill = 8;
        else if (player.y - spider.location.y >= 6)
            score_over_distance_kill = 6;
        else
            score_over_distance_kill = 4;

        score += score_over_distance_kill;

        //Pick a new random location for spider by using the register counter random current value
        spider.location.x = (*MS_COUNTER_REG_ADDR | 255);

        //If the random value was greater than the screen size, then give it a hardcoded x location to prevent a bug
        if (spider.location.x >= MAX_COLS)
            spider.location.x = 40;

        //Clean the bullet
        clearPosition(bullet);

        //Print Score thing
        set_cursor(bullet.y, bullet.x);
        put_char(TO_STR(score_over_distance_kill));

        bullet.x = bullet.y = 209; //Out of bound location soo that it wont register with anything else
        shouldBulletBePainted = false;
    }

    /* CHECKING COLLISION ON CENTIPEDE SECTION */

    for (uint8_t i = 0; i < CENTIPEDE_BODY_SIZE; i++)
    {
        if (centipede_body[i].isDead)
            continue;

        //If the centipede got hit, enter the if
        if (bullet.x == centipede_body[i].location.x && bullet.y == centipede_body[i].location.y)
        {
            score++;
            centipedes_remaining--;

            //Kill Centipede
            clearPosition(centipede_body[i].location);
            centipede_body[i].isDead = true;
            uint8_t prevX = centipede_body[i].location.x;
            centipede_body[i].location.x = centipede_body[i].location.y = 199;

            //Change the rest of the centipedes' direction
            for (uint8_t j = i + 1; j < CENTIPEDE_BODY_SIZE; j++)
            {
                clearPosition(centipede_body[j].location);

                centipede_body[j].location.y = centipede_body[j].location.y + 1;

                if (centipede_body[j].currentDirection == LEFT)
                {
                    centipede_body[j].location.x = (prevX + CENTIPEDE_BODY_SIZE) - j;
                }
                else
                {
                    centipede_body[j].location.x = (prevX + CENTIPEDE_BODY_SIZE) + j;
                }

                centipede_body[j].previousDirection = centipede_body[j].currentDirection;

                if (centipede_body[j].isComing == COMING_DOWN)
                    centipede_body[j].currentDirection = DOWN;
                else
                    centipede_body[j].currentDirection = UP;
            }

            //Clean the bullet
            clearPosition(bullet);
            bullet.x = bullet.y = 208; //Out of bound location soo that it wont register with anything else
            shouldBulletBePainted = false;
        }
    }
    //
}

void playerCollisionDetector()
{
    if ((player.x == spider.location.x || player.x == spider.location.x + 1) && player.y == spider.location.y)
    {
        registerPlayerDeath();
        return;
    }

    for (uint8_t i = 0; i < CENTIPEDE_BODY_SIZE; i++)
    {
        if (centipede_body[i].isDead)
            continue;

        if (player.x == centipede_body[i].location.x && player.y == centipede_body[i].location.y)
        {
            registerPlayerDeath();
            return;
        }
    }
}

void clearPosition(Object obj)
{
    /* Takes in any object and will write a null character in its location */

    //Clear last x and y
    set_cursor(obj.y, obj.x);
    put_char(255); //Write to that position an empty char
}

void updateScore()
{
    uint8_t fgColor, bgColor;
    get_color(&fgColor, &bgColor);

    set_cursor(0, 60);

    puts("Lifes: ");

    set_color(RED, BLACK);

    if (centipedes_remaining == 0)
    {
        initializeCentipede();
    }

    if (lifes == 3)
    {
        put_char(17);
        put_char(18);
        puts(" ");
        put_char(17);
        put_char(18);
        puts(" ");
        put_char(17);
        put_char(18);
    }
    else if (lifes == 2)
    {
        put_char(17);
        put_char(18);
        puts(" ");
        put_char(17);
        put_char(18);
    }
    else
    {
        put_char(17);
        put_char(18);
    }

    set_color(fgColor, bgColor);
}

void resetGlobalVariables()
{
    player.x = 40;
    player.y = 25;

    bullet.x = bullet.y = 210; //Give a random location outside 80x60 so that it wont register any collision

    spider.location.x = 1;
    spider.location.y = 10;
    spider.isComing = COMING_DOWN;
    spider.currentDirection = RIGHT;

    score = 0;
    lifes = 3;
    centipedes_remaining = CENTIPEDE_BODY_SIZE;

    paintFungus();
    initializeCentipede();
}

void welcomeScreen()
{
    uint8_t k;
    do
    {
        k = keypad_getkey();

        for (uint8_t x = 0; x < MAX_COLS; x++)
        {
            for (uint8_t y = 0; y < MAX_ROWS; y++)
            {
                if ((x >= 20 && x <= 60 && (y == 10 || y == 25)) || ((y >= 10 && y <= 25 && (x == 20 || x == 60))))
                {
                    set_cursor(y, x);
                    put_char(254);
                }
            }
        }

        set_cursor(15, 30);
        puts("CENTIPEDE VIDEOGAME");

        set_cursor(18, 30);
        puts("Created by: LuisDev99");
        set_cursor(19, 37);
        puts("2019");

        set_cursor(21, 27);
        puts("press any key to start the game");

    } while (k == 0);

    clear_screen();
}

void registerPlayerDeath()
{
    clear_screen();
    lifes--;

    uint8_t k;
    do
    {
        k = keypad_getkey();

        for (uint8_t x = 0; x < MAX_COLS; x++)
        {
            for (uint8_t y = 0; y < MAX_ROWS; y++)
            {
                if ((x >= 20 && x <= 60 && (y == 10 || y == 25)) || ((y >= 10 && y <= 25 && (x == 20 || x == 60))))
                {
                    set_cursor(y, x);
                    put_char(254);
                }
            }
        }

        if (lifes == 0)
        {
            set_cursor(15, 30);
            puts("Game Over");

            set_cursor(21, 27);
            puts("press space bar to reset");

            if (k == 8)
            {
                resetGlobalVariables();
                break;
            }
        }
        else
        {

            set_cursor(15, 30);
            puts("YOU DIED!");

            set_cursor(21, 27);
            puts("press any key to continue");
        }

    } while (k == 0 || lifes == 0);

    player.x = 40;
    player.y = 29;
    clear_screen();
    paintFungus();
}

// uint8_t k = keypad_getkey();
// set_cursor(2, 1);
// put_char(TO_STR(k & 0xf));
// set_cursor(3, 1);
// put_char(TO_STR((k & 0xf0) >> 4));

//player = HandlePlayer(player);