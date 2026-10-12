class Button {
  // Member Variables
  float x, y, w, h;
  color c1, c2;
  String val;
  boolean hover;

  // Constructon
  Button(float x, float y, float w, float h, String val, color c1, color c2) {
    this.x = x;
    this.y = y;
    this.y = y;
    this.w = w;
    this.h = h;
    this.c1 = c1;
    this.c2 = c2;
    this.val = val;
    hover = false;
  }

  // Member Methods
  void display() {
    if (hover == true) {
      fill(c1);
    } else {
      fill(c2);
    }

    rectMode(CORNER);
    rect(x, y, w, h, 6);
    fill(255);
    textAlign(BASELINE);
    textSize(16);
    text(val, x+12, y+20);
  }

  void mouseOver(float tempX, float tempY) {
    if (tempX > x && tempX < x + w && tempY > y && tempY < y + h) {
      hover = true;
    } else {
      hover = false;
    }
  }
}
