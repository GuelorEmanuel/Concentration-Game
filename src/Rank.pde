/*
 * A class for Ranks: 1-14 = A-King
 */

public class Rank {

  /* Let define the Suits and make sure all object will
   have access to the same memory refernce
   and let make it a constant: 1-14 = A-King
   */
  public final static int ACE   = 1;
  public final static int TWOO   = 2;
  public final static int THREE = 3;
  public final static int FOUR  = 4;
  public final static int FIVE  = 5;
  public final static int SIX   = 6;
  public final static int SEVEN = 7;
  public final static int EIGHT = 8;
  public final static int NINE  = 9;
  public final static int TEN   = 10;
  public final static int JACK  = 11;
  public final static int QUEEN = 12;
  public final static int KING  = 13;
  public final static int JOKER = 14;
  private             int order;   

  private int rankValue;  // one of the ranks 1-14 = A-King


  /*
   * Method to assign the rank values from 1-14 = A-King including the Joker
   * @parameter int
   */
  private Rank(int rankValue) {
    switch(rankValue) {
    case 1:
      this.rankValue = ACE;
      order = 20;
      break; 
    case 2:
      this.rankValue = TWOO;
      order = 1;
      break;
    case 3:
      this.rankValue = THREE;
      order = 2;
      break;
    case 4:
      this.rankValue = FOUR;
      order = 3;
      break;
    case 5:
      this.rankValue = FIVE;
      order = 4;
      break;
    case 6:
      this.rankValue = SIX;
      order = 5;
      break;
    case 7:
      this.rankValue = SEVEN;
      order = 6;
      break;
    case 8:
      this.rankValue = EIGHT;
      order = 7;
      break;
    case 9:
      this.rankValue = NINE;
      order = 8;
      break;
    case 10:
      this.rankValue = TEN;
      order = 9;
      break;
    case 11:
      this.rankValue = JACK;
      order = 10;
      break;
    case 12:
      this.rankValue = QUEEN;
      order = 11;
      break;
    case 13:
      this.rankValue = KING;
      order = 12;
      break;
    case 14:
      this.rankValue = JOKER;
      order = 999999;
      break;
    }
  }

  /*
   * Method to get a rank
   * @return int
   */
  public int getRank() {
    return rankValue;
  }

  /*
   * Method to get the order of the  rank
   * @return int
   */
  public int getOrder() {
    return order;
  }
}

