public class Asteroid //class for the asteroid object
{
  private float xCoord; // x corrindate of the asteroids
  private float yCoord; // y coordinate of the asteroids
  private float xSpeed; // x speed of the asteroids
  private float ySpeed; // y speed of the asteroids
  private float diameter; //diameter of the circle asteroid

  //default constructor
  public Asteroid ()
  {
    resetAsteroid();
  }

  // constructor
  public Asteroid (float diameter)
  {
    resetAsteroid();
    setDiameter(diameter);
  }

  /*method for moving and reseting the asteroid, setting their boundaries
   returns a boolean that is used to add to the games score*/
  public boolean update()
  {
    boolean scorePlus = false;
    // logic to move the asteroids
    xCoord = xCoord + xSpeed;
    yCoord = yCoord + ySpeed;

    //resets the asteroids y position if the player dodges it and adds a point to the score.
    if (yCoord > height + diameter/2) {
      resetAsteroid();
      scorePlus = true;
    }
    // bounces the asteroid if it hits the right hand side of the screen.
    else if (xCoord > width - diameter/2) {
      xCoord = width - diameter/2;
      xSpeed = xSpeed * -1;
    } 
    // bounces the ball if it hits the left hand side of the screen.
    else if (xCoord < diameter/2) {
      xCoord = diameter/2;
      xSpeed = xSpeed * -1;
    }
    return scorePlus;
  }

  public void display() //draws the asteroid
  {
    stroke(166, 79, 12);
    fill(186, 103, 31);
    ellipse(xCoord, yCoord, diameter, diameter);
  }

  /* resets the asteroid position. public because
   it is called from outside the class*/
  public void resetAsteroid()
  {
    this.xCoord = random(width);
    this.yCoord = 0;
    this.xSpeed = random(-4, 5); //set to -4 and 5 so that the asteroid dont always fall to the right
    this.ySpeed = random(3, 9);
  }

  //getter methods
  public float getXCoord()
  {
    return xCoord;
  }

  public float getYCoord() {
    return yCoord;
  }

  public float getXSpeed() {
    return xSpeed;
  }

  public float getYSpeed() 
  {
    return ySpeed;
  }

  public float getDiameter() {
    return diameter;
  }

  //setter methods
  public void setDiameter(float diameter) {
    //validation to set the diameter to a size that is so big that the game becomes unplayable
    if ((diameter >= 14) && (diameter <=52))
      this.diameter = diameter;
    else
      this.diameter = random(15, 51);
  }

  public void setXCoord(float xCoord)
  {
    this.xCoord = xCoord;
  }

  public void setYCoord(float yCoord)
  {
    this.yCoord = yCoord;
  }

  public void setXSpeed(float xSpeed)
  {
    this.xSpeed = xSpeed;
  }

  public void setYSpeed(float ySpeed)
  {
    this.ySpeed = ySpeed;
  }
}
