# Osha's Programming Portfolio

## Term 1 Projects

## Calculatinator

### Basic Mode
![CalculatorBasicMode](https://github.com/TheEnd74/programmingPortfolio/blob/main/images/calcBasicMode.png?raw=true)

### Scientific Mode
![CalculatorScientificMode](https://github.com/TheEnd74/programmingPortfolio/blob/main/images/calcScientificMode.png?raw=true)

[Link to Source Code](https://github.com/TheEnd74/programmingPortfolio/tree/main/src/Calculator)

## Overview
A two mode calculator, basic and scientific; basic is used for common purposes, such as adding and subtracting; scientific is used for more complex, specific purposes, including but not limited to: trigonometry functions, algebraic functions, and exponential and root equations.

## Current Status
Working:
- All number 0-9 work by either pressing the corresponding button on your keyboard, or pressing the button build into the calculator interface.
- The basic equation symbols, add, subtract, multiply, divide, and equal are all fully functional and work with numbers 0-9.
- The clear all function, which is bound with Esc and Backspace functions as intended by resetting the calculator back to its stating state.
- The Scientific Mode button, which is an "S," and bound with Tab, is capable of resizing the window.

Still in progress:
- The Scientific Mode button is capable of enlarging the window, but it cannot return the window to its original size.
- I need to add the complex scientific buttons to the empty space once the calculator window is enlarged.

## How to Run
Built with Processing.
Processing version: 4.0.1

[Project Folder](https://github.com/TheEnd74/programmingPortfolio/tree/main/src/Calculator)

## Controls
### Basic Mode
The keybinds for functions are the same as the symbol on the function's button (look at the mouse controls section for more details) unless specified otherwise here:
- Clear All = "Esc" and "Backspace"
- Divide = "/"
- Multiply = "*" and lower-case "x"
- Scientific Mode = "Tab"

### Scientific Mode
- Sin = "S" or "s"
- Cis = "C" or "c"
- Tan = "T" or "t"
- x^-1 = "I" or "i"
- -x = "_"
- e = "E" or "e"
- log = "L" or "l"
- √ = "R" or "r"


Keyboard:
- Numbers 0-9 work as when pressed.
- All basic functions work as expected when their corresponding keybind is pressed.

## Project Files
- Calculator.pde
- Button.pde

## Testing
564.23 ÷ 22.8 =
- Expected result: 24.74692982
- Result: 24.74693

Test:
Successful

## Next Step
I will make the mode button reversible so pressing it doesn't lock you out of basic mode.
