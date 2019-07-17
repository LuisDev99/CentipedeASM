# CentipedeASM
Computer Organization Project - Centipede Arcade Videojuego

![Fuente de la informacion de abajo](https://es.wikipedia.org/wiki/Centipede_(videojuego))

![Screenshot](http://www.arcadedivision.com/content/img/200x150/centipede.jpg "OK")

## Descripcion

Dispare a los insectos en un campo de hongos. El jugador es representado por un pequeño carácter con forma de insecto que aparece en la parte inferior de la pantalla. El jugador puede mover el carácter a través del área inferior de la pantalla con una trackball y disparar láseres a un gusano que avanza desde la parte superior de la pantalla hasta abajo a través del campo de hongos. El disparar a la cabeza del gusano hará que aparezca un hongo, mientras que disparar al cuerpo de este creará otro gusano.

Si el gusano alcanza la parte inferior de la pantalla, se moverá nuevamente hacia arriba dentro del área de movimiento del jugador, añadiéndose segmentos a sí mismo cada vez que llega al límite de la parte de la pantalla en la que el jugador se puede desplazar. Cuando todos los segmentos del gusano son destruidos, uno nuevo aparece en la parte superior del área de juego. El jugador pierde una vida si es tocado por el gusano o algún otro enemigo, como la araña, una pulga que deja nuevos hongos en su camino cuando menos de cinco están en el área del jugador, un escorpión que envenena los hongos y envía al gusano directo a la zona del jugador. Cuando se pierde una vida, todos los hongos parcialmente destruidos o envenenados vuelven a la normalidad. 

## Modo de Puntuacion

    - Hongos normales y envenenados: 1 punto (toma cuatro disparos destruirlos). Cuando el camino de hongos es restaurado después de que el jugador pierde una vida, cada hongo enveneado o parcialmente destruido que es restaurado le regala al jugador 5 puntos
    - Gusano (cuerpo): 10 puntos
    - Gusano (cabeza): 100 puntos
    - Pulga: 200 puntos (toma 2 disparos destruirla. El primero la hace más rápido y el segundo la destruye)
    - Araña (desde lejos): 300 puntos
    - Araña (desde cerca): 600 puntos
    - Araña (desde muy cerca): 900 puntos
    - Escorpión: 1000 puntos


## Alcance del proyecto (hasta el momento *1 semana*)

- El spawn de los hongos (estatico)
- Que cuando se dispare al gusano, que se divida en dos
- Que cuando se dispare a una cabeza, se haga un hongo
- El movimiento del gusano, si iba de izquierda a derecha y toca un obstaculo, que vaya al sentido contrario, pero siempre para             abajo, y viceversa
- La araña que siempre aparece moviendose para matar al jugador
- La puntuacion de acuerdo a la distancia de la araña

