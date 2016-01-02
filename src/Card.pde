/*
 * Card class: implements the Comprable protocol
 */

public class Card implements Comparable<Card> {

  /*
   * our local variables
   */
  private Suit suit; 
  private Rank rank;
  private boolean isFaceUp;
  private boolean isFaceUPCheat;
  private boolean isHint;
  private boolean isRemoved;
  private int     flippedCount;
  private int     order;

  /*
   * Overloaded constructor
   */
  public Card(int rank, int suit) {
    this.rank     = new Rank(rank);
    this.suit     = new Suit(suit);
    isFaceUp      = false;
    isFaceUPCheat = false;
    isRemoved     = false;
    isHint        = false;
    flippedCount  = 0;
    order         = this.rank.getOrder()*this.suit.getOrder();
  }

  /*
   * Method to assign the four suits and the joker
   * @parameter int
   */
  public String getSuits() {
    return suit.getSuit();
  }

  /*
   * Method to get a rank
   * @return int
   */
  public int getRank() {
    return rank.getRank();
  }

  /*
   * Method to get a the ordering of the suits
   * @return int
   */
  public int getOrder() {
    return order;
  }


  /*
   * Implementing the Comparable protocol to compare two card
   * in term of greatest to least
   */
  @Override
    public int compareTo(final Card card) {

    return card.getOrder()-order;
  }
 
  /*
   * Method for printing out the object
   *@return String
   */
  public String toString() {
    String str = "";
    if (isFaceUp) {
      str+=rank.getRank() + "of" + suit.getSuit();
    }
    return str;
  }
  
  /*
   * Method for setting the boolean of the isFaceUp boolean
   */
  public void setIsFaceUp(boolean isFaceUp) {
    this.isFaceUp = isFaceUp;
  }
  
  /*
   * Method for setting the boolean of the isFaceUpCheat boolean
   * to it initial starting value
   */
  public void setIsFaceUpCheat(boolean isFaceUPCheat ) {
    this.isFaceUPCheat = isFaceUPCheat;
  }
  
  /*
   * Method for setting the boolean of the isRemoved boolean
   * to its initial starting value
   */
  public void setIsRemoved(boolean isRemoved) {
    this.isRemoved = isRemoved;
  }
  
  /*
   * Method for setting the boolean of the isHint boolean
   * to its initial starting value
   */
  public void setIsHint(boolean isHint) {
    this.isHint = isHint;
  }
  
  /*
   * Method for setting the boolean of the isFlipped boolean
   * to its initial starting value
   */
  public void setFlipped(int flippedCount) {
    this.flippedCount = flippedCount;
  }
  
  /*
   * Method for getting the  isFaceUp boolean value
   * @return boolean
   */
  public boolean getIsFaceUp() {
    return isFaceUp;
  }
  
  /*
   * Method for getting the  isFaceUpCheat boolean value
   * @return boolean
   */
  public boolean getIsFaceUpCheat() {
    return isFaceUPCheat;
  }
  
   /*
   * Method for getting the  isRemoved boolean value
   * @return boolean
   */
  public boolean getIsRemoved() {
    return isRemoved;
  }
  
  /*
   * Method for getting the  isHint boolean value
   * @return boolean
   */
  public boolean getIsHint() {
    return isHint;
  }
  
  /*
   * Method for getting the  isFlipped boolean value
   * @return boolean
   */
  public int getFlipped() {
    return flippedCount;
  }
}

