String displayVal;
float l, r, result;
char op;
boolean left;
boolean newEntry;

Button[] numButtons = new Button[10];
Button[] opButtons = new Button[12];

Button num0;
void setup() {
  size(170, 250);
  displayVal = "0.0";
  l = 0.0;
  r = 0.0;
  result = 0.0;
  op = ' ';
  left = true;
  newEntry = true;

  numButtons[0] = new Button(50, 210, 30, 30, "0");
  numButtons[1] = new Button(10, 170, 30, 30, "1");
  numButtons[2] = new Button(50, 170, 30, 30, "2");
  numButtons[3] = new Button(90, 170, 30, 30, "3");
  numButtons[4] = new Button(10, 130, 30, 30, "4");
  numButtons[5] = new Button(50, 130, 30, 30, "5");
  numButtons[6] = new Button(90, 130, 30, 30, "6");
  numButtons[7] = new Button(10, 90, 30, 30, "7");
  numButtons[8] = new Button(50, 90, 30, 30, "8");
  numButtons[9] = new Button(90, 90, 30, 30, "9");

  opButtons[0] = new Button(10, 210, 30, 30, "S");
  opButtons[1] = new Button(10, 50, 70, 30, "Clear All");
  opButtons[2] = new Button(90, 50, 30, 30, "%");
  opButtons[3] = new Button(130, 50, 30, 30, "÷");
  opButtons[4] = new Button(130, 90, 30, 30, "*");
  opButtons[5] = new Button(130, 130, 30, 30, "-");
  opButtons[6] = new Button(130, 170, 30, 30, "+");
  opButtons[7] = new Button(130, 210, 30, 30, "=");
  opButtons[8] = new Button(90, 210, 30, 30, ".");
  opButtons[9] = new Button(0, 0, 0, 0, "0");
  opButtons[10] = new Button(0, 0, 0, 0, "0");
  opButtons[11] = new Button(0, 0, 0, 0, "0");
}

void draw() {
  background(255);
  updateDisplay();
  for (int i = 0; i < numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].mouseOver(mouseX, mouseY);
  }
  for (int i = 0; i < opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].mouseOver(mouseX, mouseY);
  }
}

void updateDisplay() {
  // Background shape
  rectMode(CENTER);
  rect(width/2, height/10, width-20, 30, 8);

  // Overlay text
  fill(0);
  textAlign(RIGHT);
  textSize(30);
  text(displayVal, width-30, height/7);
}

void mouseReleased() {
  for (int i = 0; i < numButtons.length; i++) {
    if (numButtons[i].hover) {
      handleEvent(numButtons[i].val, true);
    }
  }

  for (int i = 0; i < opButtons.length; i++) {
    if (opButtons[i].hover == true) {
      handleEvent(opButtons[i].val, false);
    }
  }
  printState();
}

void mousePressed() {
  // Update display with proper button mouse click
}

void printState() {
  println(
    "l: " + l +
    " | r: " + r +
    " | result: " + result +
    " | left: " + left +
    " | op: " + op
    );
}

void performCalc() {
  if (op == '+') {
    result = l + r;
  } else if (op == '-') {
    result = l - r;
  } else if (op == '÷') {
    if (r == 0) {
      displayVal = "ERROR";
      newEntry = true;
      return;
    }
    result = l / r;
  } else if (op == '*') {
    result = l * r;
  } else {
    return;
  }

  displayVal = str(result);
  l = result;
  r = 0.0;
  left = true;
  newEntry = true;
}

void keyPressed() {
  if (key >= '0' && key <= '9') {
    println("You hit " + key + " " + keyCode);
    handleEvent(str(key), true);
  } else if (key == '-') {
    handleEvent("-", false);
  } else if (key == '*' || key == 'x') {
    handleEvent("*", false);
  } else if (key == '/' || key == '÷') {
    handleEvent("÷", false);
  } else if (key == '+') {
    handleEvent("+", false);
  } else if (key == '=' || key == ENTER || key == RETURN) {
    handleEvent("=", false);
  } else if (key == TAB) {
    handleEvent("S", false);
  } else if (key == '.') {
    handleEvent(".", false);
  } else if (key == ESC || key == BACKSPACE) {
    key = 0; // Prevent Processing from closing the window on ESC
    handleEvent("Clear All", false);
  }
}

void handleEvent(String val, boolean isNum) {
  if (isNum) {
    String digit = val;

    if (newEntry || displayVal.equals("0.0")) {
      displayVal = digit;
      newEntry = false;
    } else {
      displayVal += digit;
    }

    if (left) {
      l = float(displayVal);
    } else {
      r = float(displayVal);
    }
  } else {
    // Other actions (operators & commands)
    if (val.equals("=")) {
      performCalc();
    } else if (val.equals("+") || val.equals("-") || val.equals("÷")) {
      op = val.charAt(0);
      left = false;
      newEntry = true;
      displayVal = str(op);
    } else if (val.equals("x") || val.equals("*")) {
      op = '*';
      left = false;
      newEntry = true;
      displayVal = "*";
    } else if (val.equals("Clear All")) {
      displayVal = "0.0";
      l = 0.0;
      r = 0.0;
      result = 0.0;
      op = ' ';
      left = true;
      newEntry = true;
    } else if (val.equals("S")) {
      windowResize(400, 250);
    } else if (val.equals(".")) {
      if (newEntry) {
        displayVal = "0.";
        newEntry = false;
      } else if (!displayVal.contains(".")) {
        displayVal += ".";
      }
      if (left) {
        l = float(displayVal);
      } else {
        r = float(displayVal);
      }
    }
  }
}
