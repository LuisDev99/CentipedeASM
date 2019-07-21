#include <screen.h>
#include <keypad.h>

#define TO_STR(ch) ((((ch) >= 0) && ((ch) <= 9)) ? (48 + (ch)) : ('a' + ((ch)-10)))
#define AMOUNT_OF_FUNGUS 12
#define CENTIPEDE_BODY_SIZE 8

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

void clearPosition(Object obj);

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

Object player, spider, bullet;

uint8_t score;

int main()
{

    player.x = 40;
    player.y = 25;

    bullet.x = bullet.y = 210; //Give a random location outside 80x60 so that it wont register any collision

    spider.x = 1;
    spider.y = 10;

    score = 0;

    clear_screen();
    set_color(WHITE, BLACK);

    set_cursor(15, 40);
    keypad_init();

    paintFungus();
    initializeCentipede();

    while (1)
    {
        delay_ms(50); //Regulates game movement

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
        paintSpider(spider);
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
    if (spider.y == 0)
        spiderDoneMovingUp = true;

    if (spiderDoneMovingUp)
    {
        spider.x++;
        spiderDoneMovingRight = true;
        spiderDoneMovingDown = false;
    }

    if (spiderDoneMovingDown)
    {
    }
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

    put_char(5);
    put_char(6);

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

    set_fungus_in_array_and_print(9, 50, 3);

    set_fungus_in_array_and_print(10, 60, 2);

    set_fungus_in_array_and_print(11, 73, 5);

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
        centipede_body[i].location.y = 0;

        centipede_body[i].currentDirection = LEFT;
        centipede_body[i].previousDirection = LEFT;
        centipede_body[i].isComing = COMING_DOWN;
        centipede_body[i].isDead = false;
    }
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
    if ((bullet.x == spider.x || bullet.x == spider.x + 1) && bullet.y == spider.y)
    {

        //spider takes two column spaces long, so clear those two spaces
        clearPosition(spider);
        spider.x++;
        clearPosition(spider);

        score++;

        //Pick a new random location for spider by using the register counter random current value
        spider.x = (*MS_COUNTER_REG_ADDR | 255);

        //If the random value was greater than the screen size, then give it a hardcoded x location to prevent a bug
        if (spider.x >= MAX_COLS)
            spider.x = 40;

        set_cursor(1, 78);
        put_char(TO_STR(spider.x));

        //Clean the bullet
        clearPosition(bullet);
        bullet.x = bullet.y = 209; //Out of bound location soo that it wont register with anything else
        shouldBulletBePainted = false;
    }

    /* CHECKING COLLISION ON CENTIPEDE SECTION */

    for (uint8_t i = 0; i < CENTIPEDE_BODY_SIZE; i++)
    {
        if (centipede_body[i].isDead)
            continue;

        if (bullet.x == centipede_body[i].location.x && bullet.y == centipede_body[i].location.y)
        {
            score++;

            //Kill Centipede
            clearPosition(centipede_body[i].location);
            centipede_body[i].isDead = true;
            uint8_t prevX = centipede_body[i].location.x;
            centipede_body[i].location.x = centipede_body[i].location.y = 199;

            //Change the rest of the centipede's direction
            for (uint8_t j = i + 1; j < CENTIPEDE_BODY_SIZE; j++)
            {
                clearPosition(centipede_body[j].location);
                centipede_body[j].location.y = centipede_body[j].location.y + 1;
                centipede_body[j].location.x = prevX + j;
                centipede_body[j].previousDirection = centipede_body[j].currentDirection;
                centipede_body[j].currentDirection = DOWN;
            }

            //Clean the bullet
            clearPosition(bullet);
            bullet.x = bullet.y = 208; //Out of bound location soo that it wont register with anything else
            shouldBulletBePainted = false;
        }
    }
    //
}

void clearPosition(Object obj)
{
    /* Takes in any object and will write a null character in its location */

    //Clear last x and y
    set_cursor(obj.y, obj.x);
    put_char(255); //Write to that position an empty char
}

// uint8_t k = keypad_getkey();
// set_cursor(2, 1);
// put_char(TO_STR(k & 0xf));
// set_cursor(3, 1);
// put_char(TO_STR((k & 0xf0) >> 4));

//player = HandlePlayer(player);