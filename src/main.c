#include <screen.h>
#include <keypad.h>

#define TO_STR(ch) ((((ch) >= 0) && ((ch) <= 9)) ? (48 + (ch)) : ('a' + ((ch)-10)))

typedef struct Objects
{
    uint8_t x;
    uint8_t y;

} Object;

void clearPosition(Object obj);

void HandlePlayer();
void HandleSpider();
void HandleBullet(uint8_t objYPos, uint8_t objXPos);

Object HandleCentipede(Object centipede);

void paintPlayer(Object player);
void paintBullet(Object bullet);
void paintSpider(Object spider);

void set_fungus_in_array_and_print(uint8_t index, uint8_t x, uint8_t y);
void paintFungus();

void masterCollisionDetector();

bool bulletWasPressed = false;
bool shouldBulletBePainted = false;

//Spider movement control
bool spiderDoneMovingUp = false;
bool spiderDoneMovingDown = false;
bool spiderDoneMovingLeft = false;
bool spiderDoneMovingRight = false;

Object fungus[12];
Object player, spider, bullet;

uint8_t score;

int main()
{

    player.x = 40;
    player.y = 25;

    spider.x = 1;
    spider.y = 10;

    score = 0;

    clear_screen();
    set_color(WHITE, BLACK);

    set_cursor(15, 40);

    // //Print Spider
    // put_char(5);
    // put_char(6);

    keypad_init();

    paintFungus();

    while (1)
    {
        delay_ms(50); //Regulates game movement

        //Draw the score in the top left corner of the screen
        set_cursor(0, 78);
        put_char(TO_STR(score));

        masterCollisionDetector(); //Detect collision in here or at the end of the loop?

        //Listen to player's keys and returns an Object to update this local player's variable location
        HandlePlayer();

        //Automated spider
        HandleSpider();

        if (shouldBulletBePainted)
        {

            //If the player shot a bullet, then call handle bullet but using the player's location to spawn new bullet
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
        clearPosition(bullet);

        return;
    }

    bullet.y = objYPos;
    bullet.x = objXPos;
}

Object HandleCentipede(Object centipede)
{
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
                clearPosition(player);
                player.x--;
            }

            break;

        case 2: //Right

            if (player.x < MAX_COLS - 1)
            {
                clearPosition(player);
                player.x++;
            }

            break;

        case 3: //Down

            if (player.y < MAX_ROWS - 1)
            {
                clearPosition(player);
                player.y++;
            }
            break;

        case 4: //Up
            if (player.y != 0)
            {
                clearPosition(player);
                player.y--;
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

void set_fungus_in_array_and_print(uint8_t index, uint8_t x, uint8_t y)
{
    fungus[index].x = x;
    fungus[index].y = y;
    set_cursor(y, x);
    put_char(4);
}

void masterCollisionDetector()
{
    //Detect if bullet collided with fongus
    for (uint8_t i = 0; i < 12; i++)
    {
        if (bullet.x == fungus[i].x && bullet.y == fungus[i].y)
        {
            /* set_cursor(bullet.y, bullet.x);
            puts("Collision boy"); */
            score++;

            /* Set the fungus position to 255 soo when the bullet hits it, 
               it would no longer be invisible and keep registering collisions
               eventhough it already did. In other words, this avoids the bullet
               from hitting the same fungus over again */
            fungus[i].x = fungus[i].y = 255;

            //Clean the bullet
            clearPosition(bullet);

            //bullet.x = bullet.y = 0; //Avoid keep getting into this if statement more than once by resetting bullet's coordinates
            shouldBulletBePainted = false;
            return;
        }
    }

    //If the bullet didnt hit any fungus, keep checking

    //The spider takes two column spaces, soo check both of them to detect collision
    if ((bullet.x == spider.x || bullet.x == spider.x + 1) && bullet.y == spider.y)
    {
        shouldBulletBePainted = false;

        //spider takes two column spaces long, so clear those two spaces
        clearPosition(spider);
        spider.x++;
        clearPosition(spider);

        score++;

        //Pick a random location for spider by using the register counter random current value
        spider.x = (*MS_COUNTER_REG_ADDR & 31);

        //If the random value was greater than the screen size, then give it a hardcoded x location to prevent a bug
        if (spider.x >= MAX_COLS)
            spider.x = 40;

        set_cursor(1, 78);
        put_char(TO_STR(spider.x));

        //Set a place to the bullet soo that it doesnt keep registering
        bullet.x = bullet.y = 0;
    }
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