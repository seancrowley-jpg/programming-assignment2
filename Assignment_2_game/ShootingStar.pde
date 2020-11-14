public class ShootingStar // class for the background stars
{
  private float xCoord; //stars x coordinate
  private float yCoord; // stars y coordinate
  private float starSpeed; // the speed of the stars

  //constructor
  public ShootingStar()
  {
    resetStars();
  }

  //method for displaying the star
  public void display()
  {
    smooth();
    noStroke();
    fill(255, 255, 255);
    rect(xCoord, yCoord, 3, 5);
  }

  /*method for the movement of the stars
   used to convey travel through space*/
  public void move()
  {
    yCoord = yCoord +starSpeed; //logic for moving the stars
    if (yCoord > height + 50)//if the stars go off screen reset them
    {
      resetStars();
    }
  }

  //getter methods.
  public float getXCoord() {
    return xCoord;
  }

  public float getYCoord() {
    return yCoord;
  }

  public float getStarSpeed() {
    return starSpeed;
  }
  
  //setter methods
  public void setXCoord(float xCoord)
  {
    this.xCoord = xCoord;
  }

  public void setYCoord(float yCoord)
  {
    this.yCoord = yCoord;
  }

  public void setStarSpeed(float starSpeed)
  {
    this.starSpeed = starSpeed;
  }

  //helper method for reset
  private void resetStars()
  {
    this.xCoord = random(0, width);
    this.yCoord = random(-500, 0);
    this.starSpeed = random(5, 11);
  }
}
