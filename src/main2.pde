View view;

//setup
void setup() {
  size(1000, 800);
  frame.setResizable(true);
  view = new View();
}

//main function
void draw() {
  background(0);
  view.setCardW(width); //dynamic card size
  view.setCardH(height);
  view.setCardR(height);
  view.sideMenu();
  view.drawCards();
}
public void mouseClicked() {
  view.mouseClicked();
}
public void keyPressed() {
  view.keyPressed();
}

