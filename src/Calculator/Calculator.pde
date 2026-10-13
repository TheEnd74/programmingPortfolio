// Osha Furness | Calculator

String displayVal;
float l, r, result;
char op;
boolean left;
boolean newEntry;

Button[] numButtons = new Button[10];
Button[] opButtons = new Button[19];

Button num0;
void setup() {
  size(160, 250);
  displayVal = "0.0";
  l = 0.0;
  r = 0.0;
  result = 0.0;
  op = ' ';
  left = true;
  newEntry = true;

// Numbers 0-9
  numButtons[0] = new Button(50, 210, 30, 30, "0", 25, 125);
  numButtons[1] = new Button(10, 170, 30, 30, "1", 25, 125);
  numButtons[2] = new Button(50, 170, 30, 30, "2", 25, 125);
  numButtons[3] = new Button(90, 170, 30, 30, "3", 25, 125);
  numButtons[4] = new Button(10, 130, 30, 30, "4", 25, 125);
  numButtons[5] = new Button(50, 130, 30, 30, "5", 25, 125);
  numButtons[6] = new Button(90, 130, 30, 30, "6", 25, 125);
  numButtons[7] = new Button(10, 90, 30, 30, "7", 25, 125);
  numButtons[8] = new Button(50, 90, 30, 30, "8", 25, 125);
  numButtons[9] = new Button(90, 90, 30, 30, "9", 25, 125);

  opButtons[0] = new Button(10, 210, 30, 30, "S", 25, 125);
  opButtons[1] = new Button(10, 50, 70, 30, "Clear All", 25, 125);
  opButtons[2] = new Button(90, 50, 30, 30, "%", 25, 125);
  opButtons[3] = new Button(130, 50, 30, 30, "÷", 25, 125);
  opButtons[4] = new Button(130, 90, 30, 30, "*", 25, 125);
  opButtons[5] = new Button(130, 130, 30, 30, "-", 25, 125);
  opButtons[6] = new Button(130, 170, 30, 30, "+", 25, 125);
  opButtons[7] = new Button(130, 210, 30, 30, "=", 25, 125);
  opButtons[8] = new Button(90, 210, 30, 30, ".", 25, 125);

// Scientific Mode
  opButtons[9]  = new Button(170, 50, 70, 30, "Sin", 25, 125);
  opButtons[10] = new Button(250, 50, 70, 30, "Cos", 25, 125);
  opButtons[11] = new Button(170, 90, 70, 30, "Tan", 25, 125);
  opButtons[12] = new Button(250, 90, 70, 30, "x^-1", 25, 125);
  opButtons[13] = new Button(170, 130, 70, 30, "x", 25, 125);
  opButtons[14] = new Button(250, 130, 70, 30, "-x", 25, 125);
  opButtons[15] = new Button(170, 170, 70, 30, "e", 25, 125);
  opButtons[16] = new Button(250, 170, 70, 30, "log", 25, 125);
  opButtons[17] = new Button(170, 210, 70, 30, "^", 25, 125);
  opButtons[18] = new Button(250, 210, 70, 30, "√", 25, 125);
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
  if(displayVal.length()> 8) {
    textSize(28);
  } else if(displayVal.length()> 9) {
    textSize(26);
  } else {
    textSize(30);
  }
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
  } else if (op == '^') {
    result = pow(l, r);
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
  } else if (key == 'S' || key == 's') {
    handleEvent("Sin", false);
  } else if (key == 'C' || key == 'c') {
    handleEvent("Cos", false);
  } else if (key == 'T' || key == 't') {
    handleEvent("Tan", false);
  } else if (key == 'I' || key == 'i') {
    handleEvent("x^-1", false);
  } else if (key == 'X') {
    handleEvent("x", false);
  } else if (key == '_') {
    handleEvent("-x", false);
  } else if (key == 'e' || key == 'E') {
    handleEvent("e", false);
  } else if (key == 'L' || key == 'l') {
    handleEvent("log", false);
  } else if (key == '^') {
    handleEvent("^", false);
  } else if (key == 'R' || key == 'r') {
    handleEvent("√", false);
  } else if (key == '%') {
    handleEvent("%", false);
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
    } else if (val.equals("x") && !val.equals("x^-1")) {
      // Handled separately below or treated as variable/square
    } else if (val.equals("*")) {
      op = '*';
      left = false;
      newEntry = true;
      displayVal = "";
    } else if (val.equals("Clear All")) {
      displayVal = "0.0";
      l = 0.0;
      r = 0.0;
      result = 0.0;
      op = ' ';
      left = true;
      newEntry = true;
    } else if (val.equals("S")) {
      windowResize(330, 250);
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
    } else if (val.equals("%")) {
      float currentVal = left ? l : r;
      result = currentVal / 100.0;
      displayVal = str(result);
      if (left) { l = result; } else { r = result; }
      newEntry = true;
    } else if (val.equals("Sin")) {
      float currentVal = left ? l : r;
      result = sin(radians(currentVal));
      displayVal = str(result);
      if (left) { l = result; } else { r = result; }
      newEntry = true;
    } else if (val.equals("Cos")) {
      float currentVal = left ? l : r;
      result = cos(radians(currentVal));
      displayVal = str(result);
      if (left) { l = result; } else { r = result; }
      newEntry = true;
    } else if (val.equals("Tan")) {
      float currentVal = left ? l : r;
      result = tan(radians(currentVal));
      displayVal = str(result);
      if (left) { l = result; } else { r = result; }
      newEntry = true;
    } else if (val.equals("x^-1")) {
      float currentVal = left ? l : r;
      if (currentVal == 0) {
        displayVal = "ERROR";
        newEntry = true;
        return;
      }
      result = 1.0 / currentVal;
      displayVal = str(result);
      if (left) { l = result; } else { r = result; }
      newEntry = true;
    } else if (val.equals("x")) {
      float currentVal = left ? l : r;
      result = currentVal * currentVal; // Square function
      displayVal = str(result);
      if (left) { l = result; } else { r = result; }
      newEntry = true;
    } else if (val.equals("-x")) {
      float currentVal = left ? l : r;
      result = -currentVal;
      displayVal = str(result);
      if (left) { l = result; } else { r = result; }
      newEntry = true;
    } else if (val.equals("e")) {
      result = 2.7182818f;
      displayVal = str(result);
      if (left) { l = result; } else { r = result; }
      newEntry = true;
    } else if (val.equals("log")) {
      float currentVal = left ? l : r;
      if (currentVal <= 0) {
        displayVal = "ERROR";
        newEntry = true;
        return;
      }
      result = log(currentVal) / log(10); // Base-10 log
      displayVal = str(result);
      if (left) { l = result; } else { r = result; }
      newEntry = true;
    } else if (val.equals("^")) {
      op = '^';
      left = false;
      newEntry = true;
      displayVal = "^";
    } else if (val.equals("√")) {
      float currentVal = left ? l : r;
      if (currentVal < 0) {
        displayVal = "ERROR";
        newEntry = true;
        return;
      }
      result = sqrt(currentVal);
      displayVal = str(result);
      if (left) { l = result; } else { r = result; }
      newEntry = true;
    }
  }
}
