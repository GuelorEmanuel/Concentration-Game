/*
 * ConcentrationGameLogic: This class handles the game logic
 *
 */
public class ConcentrationGameLogic {
  Deck myDeck = new Deck();  // instatiating the Deck class
 


  /*
   *  Default Constructor
   *
   */
  ConcentrationGameLogic() {
    myDeck.populateDeck(); // populate the Deck with card objects
  }

  /*
   * Method to check two cards are the same
   * @param int, int, boolean
   * @return boolean
   */
  public boolean compareEquals(int first, int second, boolean isDouble) {
    String firstCard, secondCard;
    firstCard  = getACard(first);
    secondCard = getACard(second);
    if (isDouble) {
      if (firstCard.equals(secondCard)) {
        return true;
      } else {
        return false;
      }
    } else {
      if ((firstCard.equals("1S") && secondCard.equals("1C")) || (secondCard.equals("1S") && firstCard.equals("1C"))) {
        return true;
      } else if ((firstCard.equals("1H") && secondCard.equals("1D")) || (secondCard.equals("1H") && firstCard.equals("1D"))) {
        return true;
      } else if ((firstCard.equals("2S") && secondCard.equals("2C")) || (secondCard.equals("2S") && firstCard.equals("2C"))) {
        return true;
      } else if ((firstCard.equals("2H") && secondCard.equals("2D")) || (secondCard.equals("2H") && firstCard.equals("2D"))) {
        return true;
      } else if ((firstCard.equals("3S") && secondCard.equals("3C")) || (secondCard.equals("3S") && firstCard.equals("3C"))) {
        return true;
      } else if ((firstCard.equals("3H") && secondCard.equals("3D"))|| (secondCard.equals("3H") && firstCard.equals("3D"))) {
        return true;
      } else if ((firstCard.equals("4S") && secondCard.equals("4C")) || (secondCard.equals("4S") && firstCard.equals("4C"))) {
        return true;
      } else if ((firstCard.equals("4H") && secondCard.equals("4D")) || (secondCard.equals("4H") && firstCard.equals("4D"))) {
        return true;
      } else if ((firstCard.equals("5S") && secondCard.equals("5C")) || (secondCard.equals("5S") && firstCard.equals("5C"))) {
        return true;
      } else if ((firstCard.equals("5H") && secondCard.equals("5D")) || (secondCard.equals("5H") && firstCard.equals("5D"))) {
        return true;
      } else if ((firstCard.equals("6S") && secondCard.equals("6C")) || (secondCard.equals("6S") && firstCard.equals("6C"))) {
        return true;
      } else if ((firstCard.equals("6H") && secondCard.equals("6D")) || (secondCard.equals("6H") && firstCard.equals("6D"))) {
        return true;
      } else if ((firstCard.equals("7S") && secondCard.equals("7C")) || (secondCard.equals("7S") && firstCard.equals("7C"))) {
        return true;
      } else if ((firstCard.equals("7H") && secondCard.equals("7D")) || (secondCard.equals("7H") && firstCard.equals("7D"))) {
        return true;
      } else if ((firstCard.equals("8S") && secondCard.equals("8C")) || (secondCard.equals("8S") && firstCard.equals("8C"))) {
        return true;
      } else if ((firstCard.equals("8H") && secondCard.equals("8D")) || (secondCard.equals("8H") && firstCard.equals("8D"))) {
        return true;
      } else if ((firstCard.equals("9S") && secondCard.equals("9C")) || (secondCard.equals("9S") && firstCard.equals("9C"))) {
        return true;
      } else if ((firstCard.equals("9H") && secondCard.equals("9D")) || (secondCard.equals("9H") && firstCard.equals("9D"))) {
        return true;
      } else if ((firstCard.equals("10S") && secondCard.equals("10C")) || (secondCard.equals("10S") && firstCard.equals("10C"))) {
        return true;
      } else if ((firstCard.equals("10H") && secondCard.equals("10D")) || (secondCard.equals("10H") && firstCard.equals("10D"))) {
        return true;
      } else if ((firstCard.equals("11S") && secondCard.equals("11C")) || (secondCard.equals("11S") && firstCard.equals("11C"))) {
        return true;
      } else if ((firstCard.equals("11H") && secondCard.equals("11D")) || (secondCard.equals("11H") && firstCard.equals("11D"))) {
        return true;
      } else if ((firstCard.equals("12S") && secondCard.equals("12C")) || (secondCard.equals("12S") && firstCard.equals("12C"))) {
        return true;
      } else if ((firstCard.equals("12H") && secondCard.equals("12D")) || (secondCard.equals("12H") && firstCard.equals("12D"))) {
        return true;
      } else if ((firstCard.equals("13S") && secondCard.equals("13C")) || (secondCard.equals("13S") && firstCard.equals("13C"))) {
        return true;
      } else if ((firstCard.equals("13H") && secondCard.equals("13D")) || (secondCard.equals("13H") && firstCard.equals("13D"))) {
        return true;
      } else if ((firstCard.equals("14red") && secondCard.equals("14black")) || (secondCard.equals("14red") && firstCard.equals("14black"))) {
        return true;
      } else if (firstCard.equals(secondCard)) {
        return true;
      } else {
        return false;
      }
    }
  }
  
  /*
   * Method to remove card from game: Abstration method
   * @param int
   */
  public void removeCardFromGame(int index) {
    myDeck.removeCardFromGame(true, index);
  }
  
  /*
   * Method to populate the Deck with cards: Abstration method
   */
  public void populateDeck() {
    myDeck.populateDeck();
  }
  
  /*
   * Method to populate the double deck of cards: Abstration method
   */
  public void populateDoubleDeck() {
    myDeck.populateDoubleDeck();
  }
  
  /*
   * Method to reset the game: Abstration method
   */
  public void resetGame() {
    myDeck.resetGame();
  }
  
  /*
   * Method to find if a card match
   *@param int, String
   *@return int
   */
  public int findMatch(int rank, String suit ) {
    return myDeck.findMatch(rank, suit );
  }
  
  /*
   * Method for setting the boolean of the isFaceUpCheat boolean
   * to it initial starting value
   */
  public void setIsFaceUp(boolean isFaceUp, int index) {
    myDeck.setIsFaceUp(isFaceUp, index);
  }
  
  public void setIsFaceUpCheat(boolean isFaceUPCheat, int index ) {
    myDeck.setIsFaceUpCheat(isFaceUPCheat, index);
  }
  
  /*
   * Method for setting the boolean of the isRemoved boolean
   * to its initial starting value
   */
  public void setIsRemoved(boolean isRemoved, int index) {
    myDeck.setIsRemoved(isRemoved, index);
  }
  
   /*
   * Method for setting the boolean of the isHint boolean
   * to its initial starting value
   */
  public void setIsHint(boolean isHint, int index) {
    myDeck.setIsHint(isHint, index);
  }
  
  /*
   * Method for setting the boolean of the isFlipped boolean
   * to its initial starting value
   */
  public void setFlipped(int flippedCount, int index) {
    myDeck.setFlipped(flippedCount, index);
  }
  public void deckShuffle() {
    myDeck.deckShuffle();
  }
  public void deckInsertionSort(boolean isDoubled) {
    myDeck.deckInsertionSort(isDoubled);
  }
  
  /*
   * Method for getting the  isFaceUp boolean value
   * @param int
   * @return boolean
   */
  public boolean getIsFaceUp(int index) {
    return myDeck.getIsFaceUp(index);
  }
  
  /*
   * Method for getting the  isFaceUpCheat boolean value
   * @param int
   * @return boolean
   */
  public boolean getIsFaceUpCheat(int index) {
    return myDeck.getIsFaceUpCheat(index);
  }
  
  /*
   * Method for getting the  isRemoved boolean value
   * @param int
   * @return boolean
   */
  public boolean getIsRemoved(int index) {
    return myDeck.getIsRemoved(index);
  }
  
  /*
   * Method for getting the  isHint boolean value
   * @param int
   * @return boolean
   */
  public boolean getIsHint(int index) {
    return myDeck.getIsHint(index);
  }
  
   /*
   * Method for getting the number of times the card was flipped
   * @param int
   * @return int
   */
  public int getFlipped(int index) {
    return myDeck.getFlipped(index);
  }
  
   /*
   * Method for getting a card at a specific index of myDeck
   * @param int
   * @return String
   */
  public String getACard(int index) {
    String aCard;
    aCard = myDeck.getACard(index);
    return aCard;
  }
  
  /*
   * Method for getting the Suits of each cards
   * @param int
   * @return String
   */
  public String getSuits(int index) {
    return myDeck.getSuits(index);
  }
  
  /*
   * Method for getting the Rank of each cards
   * @param int
   * @return int
   */
  public int getRank(int index) {
    return myDeck.getRank(index);
  }
  
  /*
   * Method for getting the size of the deck
   * @return String
   */
  public int deckSize() {
    return myDeck.deckSize();
  }
}

