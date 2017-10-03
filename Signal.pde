class Signal {
  int xPos;
  int yPos;
  boolean isClear;

  Signal(int x, int y, boolean s) {
    xPos = x;
    yPos = y;
    isClear = s;
  }
  //This function updates the signals accordingly
  void upDateSignals() {
    if (isClear) {
      fill(#58FF69);//green
    } else {
      fill(#FF3434);//red
    }
    ellipse(xPos, yPos, 8, 8);
  }

  // This function allows the switches to set signals
  void setSignal(boolean s) {
    isClear = s;
  }

 
  }