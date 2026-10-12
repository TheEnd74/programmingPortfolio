# Osha's Programming Portfolio

## Term 1 Projects

### Calculatinator

![Calculator2026](https://github.com/TheEnd74/programmingPortfolio/blob/main/images/calc2026.png?raw=true)

[Link to Source Code](https://github.com/TheEnd74/programmingPortfolio/tree/main/src/Calculator)

## Overview
A two mode calculator, standard and scientific; standard is used for basic purposes, such as adding and subtracting; scientific is used for more complex, specific purposes, including but not limited to: trigonometry functions, algebraic functions, and exponential and root equations.

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

[After the project files are uploaded, identify the
project folder and main .pde file to open and run.]

## Controls
### Standard Mode
#### Mouse:
Click on any button on the calculator interface to apply its functions.
Numbers 0-9 work as expected;
"Clear All" resets the calculator back to its empty state;
"%"
"÷" is used to divide;
"*" is used to multiply;
"-" is used to subtract;
"+" is used to add;
"=" is used to get the result of an equation;
"." is used for implementing decimals;
"S" is used for switching the calculator to Scientific Mode.

#### Keyboard:
The keybinds for functions are the same as the symbol on the function's button (look at the mouse controls section for more details) unless specified otherwise here:
Clear All is bound by "Esc" and "Backspace";
Divide is bound by "/";
Multiply is bound by "*" and lower-case "x";
Scientific Mode is bound by "Tab".

Keyboard:
Numbers 0-9 work as when pressed.
All basic functions work as expected when their corresponding keybind is pressed.

## Project Files
Calculator.pde
Button.pde

## Testing
564.23 ÷ 22.8 =
Expected result:
24.74692982
Result:
24.74693

Test:
Successful

## Next Step
I will implement the Percentage function.
