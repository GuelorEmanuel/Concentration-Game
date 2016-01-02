/*
 * View class: responsible for The GUI
 * Project by: Casey Crooke and Guelor Emanuel
 */

public class View {
  //variables
  private int numCols, numRows;
  private float[][] cardx;
  private float[][] cardy;
  private int cardw, cardh, cardr;
  private int score, score2; 
  private int[]highScoreSingle, highScoreDouble, highScoreDoubleTwo;
  private PImage cardBack;
  private PImage hintCard;
  private int cardClicks;
  private ConcentrationGameLogic controller;
  private int i1, i2, i3, j1, j2, j3;
  private int p2x, p2y;
  private boolean twoPlayer = false, pressStart = false, chooseDeck = false;
  private int cardsLeft;
  private boolean turnp1 = true, turnp2 = false;
  private boolean isDoubled;


  View() {
    numCols= 9;
    numRows = 6;
    cardx = new float[numCols][numRows]; //arraylist for card location
    cardy = new float[numCols][numRows];
    highScoreSingle = new int[1];
    highScoreSingle[0] = 99;
    highScoreDouble = new int[1];
    highScoreDouble[0] = 0;
    highScoreDoubleTwo = new int[1];
    highScoreDoubleTwo[0] = 0;

    p2x=width/2; //player two cursor location
    p2y=height/2;
    cardClicks = 0;
    cardsLeft = (numCols*numRows)/2;
    controller = new ConcentrationGameLogic();
    cardBack = loadImage("graphics/card back blue_0.png");
    controller.deckShuffle();
    isDoubled = false;
  }

  //menu and buttons on right side of screen
  public void sideMenu() {
    if (twoPlayer == false && cardsLeft == 0 && score < highScoreSingle[0]) {
      highScoreSingle[0] = score; //one player highscore
    } 
    if (twoPlayer == true && score > highScoreDoubleTwo[0]) {
      highScoreDoubleTwo[0] = score; //two player highscore
    } 
    if (twoPlayer == true && score2 > highScoreDoubleTwo[0]) {
      highScoreDoubleTwo[0] = score2;
    }
    if (twoPlayer == true && cardsLeft == 0 && score > score2) {
      fill(255);
      text("Player One Wins!", width/3, height);  //two player end game message
    } else if (twoPlayer == true && cardsLeft == 0 && score2 > score) {
      fill(255);
      text("Player Two Wins!", width/3, height);
    }
    stroke(50);
    fill(255);
    rect(numCols*cardw+cardw/4+10, 15, width/5, height/18, cardr);
    if (twoPlayer == true) {
      rect(numCols*cardw+cardw/4+10, 15+height/18, width/5, height/18, cardr);//conditional two player game
    }
    rect(numCols*cardw+cardw/4+10, 15+2*height/18, width/5, height/18, cardr);
    fill(150);
    rect(numCols*cardw+cardw/4+10, height/5, width/5, height/6, cardr);       //right hand menu
    rect(numCols*cardw+cardw/4+10, 2*height/5, width/5, height/6, cardr);
    rect(numCols*cardw+cardw/4+10, 3*height/5, width/5, height/6, cardr);
    rect(numCols*cardw+cardw/4+10, 4*height/5, width/5, height/6, cardr);
    fill(0);
    textSize(width/50);
    if (twoPlayer == true && turnp1 == true) {
      fill(255, 0, 0); //player two scoreboard
    } else {
      fill(0);
    }
    text("P1 SCORE: " + score, numCols*cardw+cardw/4+20, height/18);
    if (twoPlayer == true) {
      if (turnp2 == true) { //show whose turn
        fill(255, 0, 0);
      } else {
        fill(0);
      }
      text("P2 SCORE: " + score2, numCols*cardw+cardw/4+20, 2*height/18);//conditional for two player game
      fill(0);
      text("HIGHSCORE: " + highScoreDoubleTwo[0], numCols*cardw+cardw/4+20, 3*height/18);
    } else if (twoPlayer == false) {
      text("HIGHSCORE: " + highScoreSingle[0], numCols*cardw+cardw/4+20, 3*height/18);
    }
    textSize(width/30);  
    text("START", numCols*cardw+cardw/4+30, height/5+height/10); //menu text
    text("SHUFFLE", numCols*cardw+cardw/4+30, 2*height/5+height/10);
    text("SORT", numCols*cardw+cardw/4+30, 3*height/5+height/10);
    text("HINT", numCols*cardw+cardw/4+30, 4*height/5+height/10);
  }

  //draws the front of cards, including number and suit
  public void drawCards() {
    PImage cardFront;
    for (int i = 0; i < numCols; i += 1) {
      for (int j = 0; j < numRows; j += 1) {
        if (controller.getACard(i+(numCols*j)) != null) {
          cardx[i][j] = i*cardw+cardw/4; //draws evenly
          cardy[i][j] = j*cardh+cardh/2;
          fill(255);
          stroke(0);
          fill(0);

          if ((controller.getIsFaceUp(i+(numCols*j)) && !controller.getIsFaceUpCheat(i+(numCols*j))) || controller.getIsFaceUpCheat(i+(numCols*j))) {
            if (controller.getIsRemoved(i+(numCols*j))) {
              cardFront = loadImage("graphics/-1.png"); //image when card is gone
            } else {
              cardFront = loadImage("graphics/"+controller.getACard(i+(numCols*j))+".png"); //front image
            }
            image(cardFront, cardx[i][j], cardy[i][j], cardw, cardh);
          } else if (controller.getIsRemoved(i+(numCols*j)) != true ) {
            if (controller.getIsHint(i+(numCols*j))) {
              cardBack = loadImage("graphics/hint.png"); //hint image
            } else {
              cardBack = loadImage("graphics/card back blue_0.png"); //back image
            }
            image(cardBack, cardx[i][j], cardy[i][j], cardw, cardh);
          }
        }
      }
    }
    if (turnp2 == true) {
      fill(255, 0, 0);
      ellipse(p2x, p2y, 30, 30);  //player two cursor
    }
    if (pressStart == true) {
      fill(150);    //start menu, choose num of players
      rect(width/4, height/8, width/2, height-2*height/8, cardr);
      fill(0);
      rect(width/3, height/4, width/3, height/8, cardr);
      rect(width/3, height/2, width/3, height/8, cardr);
      fill(255);
      text("1 Player", width/3+width/10, 3*height/8-width/40);
      text("2 Player", width/3+width/10, 5*height/8-width/40);
    }
    if (chooseDeck == true) {
      fill(150);    //start menu, choose num of decks
      rect(width/4, height/8, width/2, height-2*height/8, cardr);
      fill(0);
      rect(width/3, height/4, width/3, height/8, cardr);
      rect(width/3, height/2, width/3, height/8, cardr);
      fill(255);
      text("1 Deck", width/3+width/10, 3*height/8-width/40);
      text("2 Decks", width/3+width/10, 5*height/8-width/40);
    }
  }

  //do other functions if mouse is clicked on buttons
  public void mouseClicked() {
    for (int i = 0; i < numCols; i += 1) {
      for (int j = 0; j < numRows; j += 1) {
        cardx[i][j] = i*cardw+cardw/4;
        cardy[i][j] = j*cardh+cardh/2;
        if (pressStart == false && chooseDeck == false && + cardsLeft != 0 && mouseX > cardx[i][j] && mouseX < cardx[i][j]+cardw && mouseY > cardy[i][j] && mouseY < cardy[i][j]+cardh) {
          if (cardClicks == 0 && controller.getIsRemoved(i+(numCols*j)) != true) {
            i1 = i;  //choose card one
            j1 = j;
            if ( i == i1 && j == j1) {
              controller.setIsFaceUp(true, i1+(numCols*j1));
              cardClicks += 1;
            } else {
              controller.setIsFaceUp(true, i1+(numCols*j1));
            }
          } else if (cardClicks == 1 && controller.getIsRemoved(i+(numCols*j)) != true) {
            i2 = i; //choose card two
            j2 = j;
            controller.setIsFaceUp(true, i2+(numCols*j2));
            if (i1+(numCols*j1)!= i2+(numCols*j2)) {
              cardClicks += 1;
            }
          } else if (cardClicks == 2 && controller.getIsRemoved(i+(numCols*j)) != true) {
            resetCardHint();
            i3 = i;
            j3 = j;
            if (i3+(numCols*j3) == i1+(numCols*j1) ||i3+(numCols*j3) == i2+(numCols*j2) ) {
              controller.setIsFaceUp(true, i3+(numCols*j3));
              cardClicks += 1;
            }
          }
          if (controller.getIsRemoved(i1+(numCols*j1)) != true && controller.getIsRemoved(i2+(numCols*j2)) != true && cardClicks == 3 ) {
            if (!controller.compareEquals(i1+(numCols*j1), i2+(numCols*j2), isDoubled)) {
              if (twoPlayer == false) {
                score += 1; //one player scoring
              } else if (twoPlayer == true && turnp1 == true) {
                turnp1 = false; //switch players in two player game
                turnp2 = true;
              } else if (twoPlayer == true && turnp2 == true) {
                turnp2 = false;
                turnp1 = true;
              }
              controller.setIsFaceUp(false, i1+(numCols*j1));
              controller.setIsFaceUp(false, i2+(numCols*j2));
              cardClicks = 0;
            } else if (controller.compareEquals(i1+(numCols*j1), i2+(numCols*j2), isDoubled)) {
              cardsLeft -= 1;
              if (twoPlayer == false) {
              } else if (twoPlayer == true && turnp1 == true) {
                score += 1; //two player scoring
              } else if (twoPlayer == true && turnp2 == true) {
                score2 += 1;
              }
              controller.removeCardFromGame(i1+(numCols*j1));
              controller.removeCardFromGame(i2+(numCols*j2));
              cardClicks = 0;
            }
          }
        }
      }
    }
    if (mouseX > numCols*cardw+cardw/4+10 && mouseX < numCols*cardw+cardw/4+10 + width/5 && mouseY > height/5 && mouseY < height/5 + height/6) {
      startGame();
    }
    if (pressStart == true && mouseX > width/3 && mouseX < width/3 + width/3 && mouseY > height/4 && mouseY < height/4 + height/8) {
      pressStart = false;
      twoPlayer = false;
      chooseDeck = true;
      score = 0; //solitaire, reset score
    } else if (pressStart == true && mouseX > width/3 && mouseX < width/3 + width/3 && mouseY > height/2 && mouseY < height/2 + height/8) {
      pressStart = false;
      twoPlayer = true; //two player chosen, reset scores
      chooseDeck = true;
      score = 0;
      score2 = 0;
    } else if (chooseDeck == true && mouseX > width/3 && mouseX < width/3 + width/3 && mouseY > height/4 && mouseY < height/4 + height/8) {
      chooseDeck = false;
      isDoubled  = false;
      numRows= 6;
      float [][] cardxNew = new float[numCols][numRows];
      float [][] cardyNew = new float[numCols][numRows];

      cardx = cardxNew;
      cardy = cardyNew;
      controller.populateDeck();
      controller.deckShuffle();
      controller.resetGame();
      cardsLeft = (numCols*numRows)/2;
    } else if (chooseDeck == true && mouseX > width/3 && mouseX < width/3 + width/3 && mouseY > height/2 && mouseY < height/2 + height/8) {
      chooseDeck = false;
      isDoubled  = true;
      numRows= 12;
      float [][] cardxNew = new float[numCols][numRows];
      float [][] cardyNew = new float[numCols][numRows];

      cardx = cardxNew;
      cardy = cardyNew;
      controller.populateDoubleDeck();
      controller.deckShuffle();
      controller.resetGame();
      cardsLeft = (numCols*numRows)/2;
      println(controller.deckSize());
    }
    if (mouseX > numCols*cardw+cardw/4+10 && mouseX < numCols*cardw+cardw/4+10 + width/5 && mouseY > 2*height/5 && mouseY < 2*height/5 + height/6) {
      controller.deckShuffle(); //shuffle is clicked
    }
    if (mouseX > numCols*cardw+cardw/4+10 && mouseX < numCols*cardw+cardw/4+10 + width/5 && mouseY > 3*height/5 && mouseY < 3*height/5 + height/6) {
      controller.deckInsertionSort(isDoubled);
    }
    if (mouseX > numCols*cardw+cardw/4+10 && mouseX < numCols*cardw+cardw/4+10 + width/5 && mouseY > 4*height/5 && mouseY < 4*height/5 + height/6) {
      cardHint(); //hint is clicked
    }
  }

  public void keyPressed() {

    if (key == 'q' || key == 'Q') {
      if (controller.getIsFaceUpCheat(0) ==  false) { //show front of all if covered
        for (int i = 0; i < numCols; i += 1) {
          for (int j = 0; j < numRows; j += 1) {
            cardx[i][j] = i*cardw+cardw/4;
            cardy[i][j] = j*cardh+cardh/2;
            controller.setIsFaceUpCheat(true, i+(numCols*j));
          }
        }
      } else if (controller.getIsFaceUpCheat(0) ==  true) { //show back of card if not covered
        for (int i = 0; i < numCols; i += 1) {
          for (int j = 0; j < numRows; j += 1) {
            controller.setIsFaceUpCheat(false, i+(numCols*j));
          }
        }
      }
    }
    if (key == CODED && turnp2 == true) { //movement for player two cursor
      if (keyCode == UP && p2y > 0) {
        p2y -= 20;
      } else if (keyCode == DOWN && p2y < height) {
        p2y += 20;
      } else if (keyCode == RIGHT && p2x < width) {
        p2x += 20;
      } else if (keyCode == LEFT && p2x > 0) {
        p2x -= 20;
      }
    }
    if (key == ' ' && turnp2 == true) { //click for player two cursor
      mouseX = p2x;
      mouseY = p2y;
      mouseClicked();
    }
  }


  public void startGame() {
    cardsLeft = (numRows*numCols)/2;
    pressStart = true;
  }

  public void cardHint() {
    if (cardClicks == 1) {
      int store = controller.findMatch (controller.getRank(i1+(numCols*j1)), controller.getSuits(i1+(numCols*j1)));
      controller.setIsHint(true, store);
    }
  }

  public void resetCardHint() {
    int store = controller.findMatch (controller.getRank(i1+(numCols*j1)), controller.getSuits(i1+(numCols*j1)));
    controller.setIsHint(false, store);
  }

  public void setCardW(int cardw) {
    this.cardw = cardw/(numCols+3);
  }
  public void setCardH(int cardh) {
    this.cardh = cardh/(numRows+1);
  }
  public void setCardR(int cardr) {
    this.cardr = cardr/40;
  }
}

