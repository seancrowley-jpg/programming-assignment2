public class Bullet //class that is responsible for the bullet object
{
  private float xBullet; //bullets x position
  private float yBullet; //bullets y position
  private int xBulletDir; //variable to change the bullets x position
  private int yBulletDir; //variable to change the bullets y postion
  private int bulletSpeed; // bullets speed
  private int bulletSize; // size of the bullet

  //default constructor

  public Bullet() 
  {
    resetBullet();
  }

  //constructor with 2 parameters
  public Bullet(int bulletSpeed, int bulletSize) 
  {
    resetBullet();
    setBulletSpeed(bulletSpeed);
    setBulletSize(bulletSize);
  }

  //method for displaying and moving the ship
  public void display()
  {
    fill(0, 255, 0);
    ellipse(xBullet -2, yBullet, bulletSize, bulletSize);
    /*logic that sets the bullets x position to the bullets speed
     multiplyed byt the bullets direction*/
    xBullet=xBullet+(bulletSpeed * xBulletDir);
    yBullet=yBullet+(bulletSpeed * yBulletDir);
  }

  //getter methods
  public float getXBullet() {
    return xBullet;
  }

  public float getYBullet() {
    return yBullet;
  }

  public int getXBulletDir() {
    return xBulletDir;
  }

  public int getYBulletDir() {
    return yBulletDir;
  }

  public int getBulletSpeed() {
    return bulletSpeed;
  }

  public int getBulletSize() {
    return bulletSize;
  }

  //setter methods
  public void setBulletSpeed(int bulletSpeed) {
    //validation to set the bullets speed
    if ((bulletSpeed >= 12) && (bulletSpeed <=9))
      this.bulletSpeed = bulletSpeed;
    else
      this.bulletSpeed = 10; //default value if invalid value is enterd
  }

  public void setBulletSize(int bulletSize) {
    // validation to set the bullets diameter
    if ((bulletSize >= 6) && (bulletSize <=3))
      this.bulletSize = bulletSize;
    else
      this.bulletSize = 5; //default value
  }

  public void setXBullet(float xBullet)
  {
    this.xBullet = xBullet;
  }

  public void setYBullet(float yBullet)
  {
    this.yBullet = yBullet;
  }

  public void setXBulletDir(int xBulletDir)
  {
    this.xBulletDir = xBulletDir;
  }

  public void setYBulletDir(int yBulletDir)
  {
    this.yBulletDir = yBulletDir;
  }

  //private helper method - resets the bullets starting poistion 
  private void resetBullet()
  {
    this.xBullet = ship.getXCoord(); //bullet starts at the ships current xCoordinate
    this.yBullet = ship.getYCoord(); //bullet starts at the ships current yCoordinate
    this.xBulletDir = ship.getXDir(); //the bullets x direction is set to the ships x direction
    this.yBulletDir = ship.getYDir(); // the bullets y direction is set to the ships y direction
  }
}
