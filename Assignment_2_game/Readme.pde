/*
Name : Sean Crowley

Brief description of the game developed:
The aim of the game is to score points by avoiding the asteroids that appearrandomly on screen.
For every asteroid that goesoff screen 1 point is scored and another asteroid is added
to the total on screen. You can score 2 points by shooting an asteroid but doing so might put you out of
poistion leading you to get hit. If you are hit 3 times the round ends. The number of rounds
the user wants to play is input at the begining of the programme.

Known bugs/problems:
Upon starting the game the bullet object will exist at the players X and Y position
and remain there although it is not visible on screen. This is because the bullet moves in the direction
the player is moving. Since the player hasnt moved yet the bullet will remain there
until the spacebar is pressed to fire a new bullet.

Sources referred to during the development of the assignment:

collison dection
http://www.jeffreythompson.org/collision-detection/circle-rect.php
http://www.jeffreythompson.org/collision-detection/circle-circle.php

background stars inspiration
https://www.youtube.com/watch?v=KkyIDI6rQJI

bullet logic
https://forum.processing.org/two/discussion/21200/shoot-from-circle-when-spacebar-is-pressed

game inspiration
Asteroids (1979) https://en.wikipedia.org/wiki/Asteroids_(video_game)


*/
