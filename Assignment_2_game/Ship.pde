public class Ship //class for the ship objects controls
{
  private float xCoord;  //x corrdinate of the ship
  private float yCoord; //y coordinate of the ship
  private int xDir; // variable to chane the x positions direction
  private int yDir; //variable to change the y posotions direction
  private int shipSpeed; // the ships speed
  private int shipHitboxWidth; // the x position of the ships hitbox
  private int shipHitboxHeight;// the y position of the ships hitbox

  //default constructor
  public Ship()
  {
    resetShip();
  }

  //constructor
  public Ship(int shipSpeed)
  {
    setShipSpeed(shipSpeed);
    resetShip();
  }

  //method that draws the ship, sets screen boundary, movement logic.
  public void display()
  {
    noStroke();
    fill(#FFFF00);
    quad(xCoord - 25, yCoord + 25, xCoord, yCoord, xCoord +25, yCoord +25, xCoord, yCoord +10);
    //Hit box
    noFill();
    rect(xCoord -25, yCoord, shipHitboxWidth, shipHitboxHeight);
    /*logic for the movement of the ship within keyPressed.
     the x and y coord is added to the ships speed multiplied 
     by the ships direction which is changed by the arrow keys*/
    if (keyPressed)
    {
      this.xCoord= this.xCoord + (this.shipSpeed * this.xDir);
      this.yCoord= this.yCoord + (this.shipSpeed * this.yDir);
    }
    // setting the ships screen boundary
    if (xCoord >= width)
    {
      xCoord = width;
    } else if (xCoord <= 0)
    {
      xCoord = 0;
    }
    if (yCoord >= height)
    {
      yCoord = height -25;
    } else if (yCoord <=0)
    {
      yCoord = 0;
    }
  }

  public void movement() //controls for changing the ships direction
  { //changes the x and y direction depending on key pressed
    if (key == CODED)
      /*arrow keys are considerd special keys and need this conditional for
       processing to detect them*/
    {
      if (keyCode == UP)
      {
        this.xDir= 0;
        this.yDir =-1;
      } else if (keyCode == DOWN)
      {
        this.xDir= 0;
        this.yDir=1;
      } else if (keyCode == LEFT)
      {
        this.xDir=-1;
        this.yDir = 0;
      } else if (keyCode == RIGHT)
      {
        this.xDir=1;
        this.yDir= 0;
      }
    }
  }

  //getter methods.
  public float getXCoord() {
    return xCoord;
  }

  public float getYCoord() {
    return yCoord;
  }

  public int getShipSpeed() {
    return shipSpeed;
  }

  public int getXDir() {
    return xDir;
  }

  public int getYDir() {
    return yDir;
  }

  public int getShipHitboxWidth() {
    return shipHitboxWidth;
  }

  public int getShipHitboxHeight() {
    return shipHitboxHeight;
  }

  //setter methods
  public void setShipSpeed(int shipSpeed) {
    if ((shipSpeed >= 10) && (shipSpeed <=1)) // validation that sets the ships speed between 10 and 1
    {
      this.shipSpeed = shipSpeed;
    } else
      this.shipSpeed = 4; // a default value of 4 is used if the value enterd is not valid
  }

  public void setXCoord(float xCoord)
  {
    this.xCoord = xCoord;
  }

  public void setYCoord(float yCoord)
  {
    this.yCoord = yCoord;
  }

  public void setXDir(int xDir)
  {
    this.xDir = xDir;
  }

  public void setYDir(int yDir)
  {
    this.yDir = yDir;
  }

  public void setShipHitboxWidth(int shipHitboxWidth)
  {
    this.shipHitboxWidth = shipHitboxWidth;
  }

  public void setShipHitboxHeight(int shipHitboxHeight)
  {
    this.shipHitboxHeight = shipHitboxHeight;
  }

  //helper method
  private void resetShip() { // sets the staring position of the ship
    this.xCoord = 300;
    this.yCoord = 800;
    this.shipHitboxWidth = 50;
    this.shipHitboxHeight = 25;
  }
}
