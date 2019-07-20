#include <screen.h>
#include <keypad.h>

#define TO_STR(ch) ((((ch) >= 0) && ((ch) <= 9)) ? (48 + (ch)) : ('a' + ((ch)-10)))

typedef struct Objects
{
    uint8_t x;
    uint8_t y;

} Object;

void clearPosition(Object obj);
Object HandlePlayer(Object player);
Object HandleSpider(Object spider);
Object HandleBullet(uint8_t objYPos, uint8_t objXPos, Object bullet);
void paintPlayer(Object player);
void paintBullet(Object bullet);

bool bulletWasPressed = false;
bool shouldBulletBePainted = false;

int main()
{
    Object player, spider, bullet;

    clear_screen();
    set_color(WHITE, BLACK);

    set_cursor(15, 40);

    //Print Spider
    put_char(5);
    put_char(6);

    keypad_init();
    while (1)
    {
        delay_ms(50); //Regulates game movement

        //Listen to player's keys and returns an Object to update this local player's variable location
        player = HandlePlayer(player);

        if (shouldBulletBePainted)
        {

            //If the player shot a bullet, then call handle bullet but using the player's location to spawn new bullet
            if (bulletWasPressed)
            {
                clearPosition(bullet);
                bullet = HandleBullet(player.y - 1, player.x, bullet);
                bulletWasPressed = false;
            }
            else
            {
                //Else, keep grabbing moving the bullet up until it reaches the top end screen
                clearPosition(bullet);
                bullet.y--;
                bullet = HandleBullet(bullet.y, bullet.x, bullet);
            }

            paintBullet(bullet);
        }

        paintPlayer(player);
    }

    return 0;
}

Object HandleBullet(uint8_t objYPos, uint8_t objXPos, Object bullet)
{
    if (objYPos == 0)
    {
        //If the bullet reached the top end screen, the bullet shouldnt be painted anymore
        shouldBulletBePainted = false;
        clearPosition(bullet);

        return bullet;
    }

    bullet.y = objYPos;
    bullet.x = objXPos;

    return bullet;
}

Object HandleSpider(Object spider)
{
}

Object HandlePlayer(Object player)
{
    uint8_t k = keypad_getkey();
    set_cursor(player.x + 1, 1);
    //put_char(TO_STR(player.x));

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

    return player;
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

void clearPosition(Object obj)
{
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