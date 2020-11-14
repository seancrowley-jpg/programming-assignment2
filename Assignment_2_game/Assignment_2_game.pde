import javax.swing.JOptionPane;
//Objects 
Player player;
ShootingStar[] shootingstar = new ShootingStar[50];
Ship ship;
Asteroid[] asteroid= new Asteroid[10];
Bullet bullet;

//Current game varibales
int totalAsteroid = 1; // current number of asteroids on the screen
int score = 0; // the player score
int health = 3; //the number of times the player can be hit

//Round variables
int maxNumberOfRounds = Integer.parseInt(JOptionPane.showInputDialog
  ("Welcome!\nAvoid the asteroids to score points.\n"+"Shoot an Asteroid with the spacebar to score 2 points.\n"
  + "How many rounds do you want to play:", "3"));
int currentRound = 1; //the current round displayed on screen
int roundsPlayed = 0; // number of rounds played

void setup()
{
  size(600, 1000);
  ship = new Ship(4); //creating the ship object
  /*creating the bullet object using default constructor prevents bullet being
   seen at the begining of the programme.Still collides with asteroids*/
  bullet = new Bullet();
  for (int i =0; i< asteroid.length; i++) {
    // creates a new asteroid object for every element in the asteroid array
    asteroid[i] = new Asteroid(random(15, 51));
  }
  player = new Player(maxNumberOfRounds);//intialising the player object
  for (int i =0; i< shootingstar.length; i++) {
    shootingstar[i] = new ShootingStar(); //creates a new star object for every element in the shootingStar array
  }
  surface.setLocation(0, 0);
}

void draw()
{
  background(0);
  /*A loop that draws the star a object for
   the amount that is in the array*/
  for (int i = 0; i < shootingstar.length; i++) {
    shootingstar[i].move();
    shootingstar[i].display();
  }
  ship.display();
  bullet.display();
  for (int i= 0; i < totalAsteroid; i++)
  {
    // adds new asteroid everytime update is called and adds 1 to score
    if (asteroid[i].update()) {
      totalAsteroid = totalAsteroid +1;
      score++;
    }
    // keeps the total asteroid variable form exceeding the max amount of elements in the array
    if (totalAsteroid >= 10) {
      totalAsteroid = 10;
    }
    asteroid[i].display(); //displays an asteroid object according to the current value of totalAsteroid

    boolean collision = shipHit(asteroid[i], ship);
    if (collision == true) {
      asteroid[i].resetAsteroid(); //resets the asteroid object that caused the collision
      health = health -1;
    }
    boolean hit = asteroidHit(asteroid[i], bullet);
    if (hit == true) {
      asteroid[i].resetAsteroid(); //resets the asteroid object that was hit
      score = score +2;
    }
  }
  if (health == 0)//player has been hit for all of their health
  {
    player.addScore(score); //adds the end of round score to the cuurent element in the scores array
    currentRound++;
    roundsPlayed++;
    /*If the rounds played is less than the max numner of rounds 
     a dialog box will ask the player if they want to continue  the game*/
    if (roundsPlayed < maxNumberOfRounds) {
      int reply = JOptionPane.showConfirmDialog
        (null, "You Died!\n Score: " + score + " Continue to next Round?", 
        "Continue", JOptionPane.YES_NO_OPTION);
      if (reply == JOptionPane.YES_OPTION) { //starts a new round
        resetGame();
        ship.resetShip();
      } else {
        gameOver(); //ends the game if NO is selected
      }
    }
    /*ends the game if the current round is greater
     than the maximum number of rounds*/
    if (currentRound > maxNumberOfRounds)
    {
      gameOver();
    }
  }
  info();
}

// method for displaying the in-game inforamtion on the screen
public void info()
{
  fill(255);
  textSize(20);
  text("Score: ", 10, 50);
  text(score, 70, 50);
  text("Health: ", 10, 80);
  text(health, 80, 80);
  text ("Round:", 10, 110);
  text(currentRound, 80, 110);
}

//key pressed function responisible for shooting the ships gun
public void keyPressed()
{
  ship.movement();
  if (key == ' ')
  {
    bullet = new Bullet(10, 5);
  }
}

/*method to determine if there is a collisoin between the ship and the asteroids
 using a rectangle hitbox that is at 100% opacity*/
boolean shipHit(Asteroid asteroid, Ship ship)
{
  // temporary variables to set edges for testing
  float testX = asteroid.getXCoord();
  float testY = asteroid.getYCoord();

  /*if statements that test the closest edge of the hitbox to the asteroid.
   -25 is taken from the ship.getxCoord getter method because the hitbox does not start at
   the ships x coordinate*/
  //if the asteroids x coordinate is less than the ships: test x = the ships xCoord  
  if (asteroid.getXCoord() < (ship.getXCoord() -25))
    testX = (ship.getXCoord() -25); // tests left side of the hitbox

  //if its greater: test x = the xCoord plus the width of the hitbox
  else if (asteroid.getXCoord() > (ship.getXCoord() - 25) + ship.getShipHitboxWidth())
    testX = (ship.getXCoord() -25) + ship.getShipHitboxWidth();//tests the right side

  //if the asteroid yCoord is less than the ships testY = the ships yCoord
  if (asteroid.getYCoord() < ship.getYCoord())
    testY = ship.getYCoord();//tests the top edge of the hitbox

  //if its greater: testY = the ships yCoord + the height of the hitbox
  else if (asteroid.getYCoord() > ship.getYCoord()+ ship.getShipHitboxHeight())
    testY = ship.getYCoord()+ship.getShipHitboxHeight();//tests the bottom bottom of the hitbox

  //finds the distance between the two objects using pythagerous theorem 
  float distX = asteroid.getXCoord()-testX;
  float distY = asteroid.getYCoord()-testY;
  /*the distX and Y values are multiplied by themselves and then added together.
   the square root of the total is set to the variable distance. */
  float distance = sqrt((distX*distX) + (distY*distY));

  /*if the distance between the hitbox and the asteroid is less thanx the radius of the asteroid
   return true*/
  if (distance <= asteroid.getDiameter()/2) {
    return true;
  }
  return false;
}

/*method to determine if there is a collision between the
 bullet object and the asteroid object which are two circles*/
boolean asteroidHit(Asteroid asteroid, Bullet bullet)
{
  //temporary variables that are used to test the distance between the center of the two circles
  float xDistance = (bullet.getXBullet() - asteroid.getXCoord());
  float yDistance = (bullet.getYBullet() - asteroid.getYCoord());
  //using pythagrous theorm again to set the distance between the circles
  float bulletDistance = sqrt( (xDistance * xDistance) + (yDistance * yDistance)); 

  /*if the distance is less than or equal to the radius of the bullet plus
   the radius of the asteroid return true*/
  if (bulletDistance <= (bullet.getBulletSize()/2 + asteroid.getDiameter()/2)) {
    return true;
  }
  return false;
}

//method that resets variables to there starting value
void resetGame()
{
  health = 3;
  totalAsteroid = 1;
  score = 0;
  /*while loop that creates a new instance of the asteroid object when 
   a new round starts. Without it asteroids would  not appear at the top
   of the screen betwwen rounds. Instead they would just 
   reappear at their previous position*/
  int i = 0;
  while ( i< asteroid.length) {
    asteroid[i] = new Asteroid(random(15, 51));
    i++;
  }
}

// method that displays the end game information from the player class
void gameOver()
{
  JOptionPane.showMessageDialog(null, 
    "Game Over\n" + "Number of Rounds played: "+ roundsPlayed 
    + "\n\n" + player.toString()
    + "\n Highest Score: " +player.highestScore()
    + "\n Lowest Score: " + player.lowestScore()
    + "\n Average Score: " + player.averageScore()
    + "\n Thanks for playing!");
  exit();
}
