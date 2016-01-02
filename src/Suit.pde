/*
 * A Class for Suits: represented as a String
 */
public class Suit {

  /*  Let define the Suits and make sure all object will
   have access to the same memory refernce
   and let make it a constant
   */
  public final static String SPADES   = "S";
  public final static String HEARTS   = "H";
  public final static String DIAMONDS = "D";
  public final static String CLUBS    = "C";
  public final static String RED      = "red";
  public final static String BLACK    = "black";
  private      int           order;

  private String suitText;

  /*
   * Method to assign the four suits and the joker
   * @parameter int
   */
  private Suit(int suitText) {

    switch(suitText) {
    case 1:
      this.suitText = SPADES;
      order         = 20000;
      break; 
    case 2:
      this.suitText = HEARTS;
      order         = 190;
      break;
    case 3:
      this.suitText = DIAMONDS;
      order         = 1;
      break;
    case 4:
      this.suitText = CLUBS;
      order         = 18;
      break;
    case 5:
      this.suitText = RED;
      order         = 50;
      break;
    case 6:
      this.suitText = BLACK;
      order         = 0;
      break;
    }
  }

  /*
   * Method to get a suit
   * @return String
   */
  public String getSuit() {
    return suitText;
  }

  /*
   * Method to get a the ordering of the suits
   * @return int
   */
  public int getOrder() {
    return order;
  }
}

