public class Player //class for game information (scores,rounds)
{
  private int[] scores; //primative array that holds the round scores.
  private int count; //keeps track of the current position of the score array.

  //constructor
  public Player(int numberOfRounds)
  {
    scores= new int[numberOfRounds];//initalises the scores array elements to what the user inputs
    count = 0;
  }

  /*method that adds end of round score to
   the current element of the array which is tracked
   by the count variable*/
  public void addScore(int score) {
    if (score >= 0)
    {
      scores[count] = score;
      count++;
    }
  }

  //method that finds the highest score in the scores array
  public int highestScore() {
    int highestScore = scores[0]; //stores the highest score to the first element in the scores array.

    for (int i = 1; i< count; i++) { //loop goes through the scores array testing if its greater than the current highest score
      if (scores[i] > highestScore) {// if current array is higher than the highest score set it as the new highest score
        highestScore = scores[i];
      }
    }
    return highestScore;
  }

  //method the finds the lowest score in the scores array
  public int lowestScore() {
    int lowestScore = scores[0];

    for (int i = 0; i< count; i++) {
      if (scores[i] < lowestScore) { //if current index is lower than the lowest score set it as the new lowest score
        lowestScore = scores[i];
      }
    }
    return lowestScore;
  }

  //method the finds the average score in the scores array
  public int averageScore() {
    int total = 0;    
    int i =0;
    do { // adds evey element in the scores array the total varaiable
      total += scores[i];
      i++;
    } while (i< count);
    return total/count; // divides the total by the number of elements to return the average score
  }

  //method that returns an object into a string data type to be displayed
  public String toString() {
    String str = ("Your Scores \n");
    for (int i =0; i < count; i++) {//adds new string for every round dictated the count variable
      str =str + "Round " + (i+1) + ": " + scores[i] + "\n";
    }
    return str;
  }

  //getters
  public int[] getScores() {
    return scores;
  }

  public int getCount()
  {
    return count;
  }

  //setters
  public void setScores(int[] scores)
  {
    this.scores = scores;
  }

  public void setCount(int count)
  {
    this.count = count;
  }
}
