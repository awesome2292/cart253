//INSTRUCTION CLASS //<>//
//This class is responsible for the text associated with each object in each room
//Each instruction has a "allowExit" boolean, which determines whether the text
//allows the sprite to unlock interaction with the next object or not (post-beta version), and
//the content of each piece of instruction. These instructions will be plugged into
//arrays that will be arguments placed in each Object

class Instruction {

  boolean allowsExit;
  String instructionText;


  Instruction(boolean tempAlEx, String tempInstTxt)
  {
    allowsExit = tempAlEx;
    instructionText = tempInstTxt;
  }
}