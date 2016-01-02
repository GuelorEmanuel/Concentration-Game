/*
 * A Deck class, A Deck of card excluding the two jokers
 */
import java.util.*;

public class Deck {
  private ArrayList<Card> myCards;
  private Joker jokerRed; // red joker
  private Joker jokerBlack; // black joker
  private Joker jokerRed2; // joker for double deck
  private Joker jokerBlack2; // joker for double deck
  private int numSuits, numCards; // used for creating standard size deck of 52

  /*
   * Default constructor
   */
  public Deck() {
    myCards    = new ArrayList<Card>();
    jokerRed   = new Joker(14, 5);
    jokerBlack = new Joker(14, 6);
    jokerRed2   = new Joker(14, 5);
    jokerBlack2 = new Joker(14, 6);
    numSuits = 4;
    numCards = 13;
  }

  /*
   * Method for deleting the deck of Cards
   * 
   */
  public void removeCards() {
    myCards.clear();
  }

  /*
   * Method for adding a card in the Deck of Cards
   * @param Object
   */
  public void add(Card myCards) {
    this.myCards.add(myCards);
  }

  /*
   * Method for printing a Card at a specific index of the ArrayList
   * @return String
   */
  public String showCards() {
    String str ="";
    for (Card c : myCards) {
      str += c.toString();
    }
    return str;
  }

  /*
   * Method for populating the ArrayList with a standar deck of 54 
   * cards including the two jokers
   * 
   */
  public void populateDeck() {
    ArrayList<Card> mySingleCards = new ArrayList<Card>();
    for (int i = 1; i <= numSuits; ++i) {
      for (int j = 1; j <= numCards; ++j) {
        Card card = new Card(j, i); // let populate the deck with cards not including the two jokers
        mySingleCards.add(card);
      }
    }
    mySingleCards.add(jokerRed);
    mySingleCards.add(jokerBlack);
    myCards = mySingleCards;
  }

  /*
   * Method for doubling the deck of 54 crads into 108 cards
   */
  public void populateDoubleDeck() {
    ArrayList<Card> myDoubleCards  = new ArrayList<Card>();
    ;
    for (int i = 1; i <= numSuits; ++i) {
      for (int j = 1; j <= numCards; ++j) {
        Card card = new Card(j, i); // let populate the deck with cards not including the two jokers
        myDoubleCards.add(card);
      }
    }
    myDoubleCards.add(jokerRed);
    myDoubleCards.add(jokerBlack);
    myCards.addAll(myDoubleCards);
  }

  /*
   * Method for getting the Deck of cards: The ArrayList of cards
   * @return ArrayList
   */
  public ArrayList<Card> getMyCards() {
    return myCards;
  }

  /*
   * Method for getting a card from a specific index in the ArrayList of Cards
   * @param int
   * @return String
   */
  public String getACard(int index) {
    String aCard;
    if ( myCards.get(index) != null) {
      aCard = myCards.get(index).getRank()+myCards.get(index).getSuits();
      return aCard;
    } else {
      return "-1";
    }
  }

  /*
   * Method for shuffling the deck of card at random
   *  Using the famous Fisher Yates shuffle algorithm methods
   * 
   */
  void deckShuffle() {
    int size = myCards.size(); 
    int i;

    Card [] temp = new Card[1];
    //if there is still elements to shuffle
    while (size !=0) {
      // pick the remaining element
      i =  (int)Math.floor(Math.random() * size--);

      //let swap it with current element
      temp[0] = myCards.get(size);
      myCards.set(size, myCards.get(i));
      myCards.set(i, temp[0]);
    }
  }

  /*
   * Method for setting the boolean of the isFaceUp boolean
   */
  public void setIsFaceUp(boolean isFaceUp, int index) {
    if (myCards.get(index) != null) {
      myCards.get(index).setIsFaceUp(isFaceUp);
    }
  }

  /*
   * Method for reseting the game: reset each individual variable to it 
   * initial starting value
   */
  public void resetGame() {
    for ( int i = 0; i < myCards.size (); i++) {

      myCards.get(i).setIsFaceUp(false);

      myCards.get(i).setIsFaceUpCheat(false);

      myCards.get(i).setIsRemoved(false); 

      myCards.get(i).setIsHint(false);
      myCards.get(i).setFlipped(0);
    }
  }

  /*
   * Method for setting the boolean of the isFaceUpCheat boolean
   * to it initial starting value
   */
  public void setIsFaceUpCheat(boolean isFaceUPCheat, int index ) {
    if (myCards.get(index) != null) {
      myCards.get(index).setIsFaceUpCheat(isFaceUPCheat);
    }
  }

  /*
   * Method for setting the boolean of the isRemoved boolean
   * to its initial starting value
   */
  public void setIsRemoved(boolean isRemoved, int index) {
    if (myCards.get(index) != null) {
      myCards.get(index).setIsRemoved(isRemoved);
    }
  }

  /*
   * Method for setting the boolean of the isFlipped boolean
   * to its initial starting value
   */
  public void setFlipped(int flippedCount, int index) {
    if (myCards.get(index) != null) {
      myCards.get(index).setFlipped(flippedCount);
    }
  }

  /*
   * Method for setting the boolean of the isHint boolean
   * to its initial starting value
   */
  public void setIsHint(boolean setIsHint, int index) {
    if (myCards.get(index) != null) {
      myCards.get(index).setIsHint(setIsHint);
    }
  }

  /*
   * Method for getting the  isFaceUp boolean value
   * @param int
   * @return boolean
   */
  public boolean getIsFaceUp(int index) {
    if (myCards.get(index) != null) {
      return myCards.get(index).getIsFaceUp();
    } else {
      return true;
    }
  }

  /*
   * Method for getting the  isFaceUpCheat boolean value
   * @param int
   * @return boolean
   */
  public boolean getIsFaceUpCheat(int index) {
    if (myCards.get(index) != null) {
      return myCards.get(index).getIsFaceUpCheat();
    } else {
      return false;
    }
  }

  /*
   * Method for getting the  isRemoved boolean value
   * @param int
   * @return boolean
   */
  public boolean getIsRemoved(int index) {
    if (myCards.get(index) != null) {
      return myCards.get(index).getIsRemoved();
    } else {
      return false;
    }
  }

  /*
   * Method for getting the  isHint boolean value
   * @param int
   * @return boolean
   */
  public boolean getIsHint(int index) {
    if (myCards.get(index) != null) {
      return myCards.get(index).getIsHint();
    } else {
      return false;
    }
  }

  /*
   * Method for finding out which cards macth in the array given a Card: according to the game rules
   * @param int, String
   * @return int
   */
  public int findMatch(int rank, String suit ) {
    int num = 0;
    for (int i =0; i<myCards.size (); i++) {
      if ( getRank(i) == rank ) {
        if (getSuits(i) == returnPair(suit)) {
          num = i;
          break;
        }
      }
    }
    return num;
  }

  /*
   * Method for which suit matches
   * @param String
   * @return String
   */
  public String returnPair(String suit) {
    if (suit.equals("S")) {
      return "C";
    } else if ( suit.equals("C")) {
      return "S";
    } else if ( suit.equals("H") ) {
      return "D";
    } else if ( suit.equals("D")) {
      return "H";
    } else if (suit.equals("red")) {
      return "black";
    } else if (suit.equals("S")) {
      return "S";
    } else if (suit.equals("C")) {
      return "C";
    } else if (suit.equals("H")) {
      return "H";
    } else if (suit.equals("D")) {
      return "D";
    } else if (suit.equals("red")) {
      return "red";
    } else if (suit.equals("black")) {
      return "black";
    } else {
      return "red";
    }
  }

  /*
   * Method for getting the Suits of each cards
   * @param int
   * @return String
   */
  public String getSuits(int index) {
    return myCards.get(index).getSuits();
  }

  /*
   * Method for getting the Rank of each cards
   * @param int
   * @return int
   */
  public int getRank(int index) {
    return myCards.get(index).getRank();
  }
  
  /*
   * Method for getting the number of times the card was flipped
   * @param int
   * @return int
   */
  public int getFlipped(int index) {
    if (myCards.get(index) != null) {
      return myCards.get(index).getFlipped();
    } else {
      return -1;
    }
  }
  
  /*
   * Method for getting the size of the deck
   * @return String
   */
  public int deckSize() {
    int size;
    return size = myCards.size();
  }

  /*
   * Method for removing a card from the game
   * @param boolean, int
   */
  public void removeCardFromGame(boolean isRemoved, int index) {
    myCards.get(index).setIsRemoved(isRemoved);
  }

  /*
   * Method for sorting the deck  according to the comparable protocol
   * @param boolean
   */
  public void deckInsertionSort(boolean isDoubled) {
    Collections.sort(myCards.subList(0, 9));
    Collections.sort(myCards.subList(9, 18));
    Collections.sort(myCards.subList(18, 27));
    Collections.sort(myCards.subList(27, 36));
    Collections.sort(myCards.subList(36, 45));
    Collections.sort(myCards.subList(45, 54));
    if (isDoubled) {
      Collections.sort(myCards.subList(54, 63));
      Collections.sort(myCards.subList(63, 72));
      Collections.sort(myCards.subList(72, 81));
      Collections.sort(myCards.subList(81, 90));
      Collections.sort(myCards.subList(90, 99));
      Collections.sort(myCards.subList(99, 108));
    }
  }
}

