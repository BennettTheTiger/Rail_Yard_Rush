class FreightCar {
  float xPos;
  float yPos;
  int carLength;
  boolean isMoving;
  int carType;
  int trackNum;
  color carColor;
  boolean sentAnother;


  FreightCar() {
    int carKind = int(random(7));
    xPos = - 10;
    yPos = 450;
    carLength = int(random(15, 25));
    isMoving = true;
    carType = carKind;
    trackNum = 0;//this is the id for the first part of track
    if (carKind == 0) {
      carColor = color(#FA67D8);//pink
    }
    if (carKind == 1) {
      carColor = color(#B067FA);//purple
    }
    if (carKind == 2) {
      carColor = color(#67CAFA);//blue
    }
    if (carKind == 3) {
      carColor = color(#49EA52);//green
    }
    if (carKind == 4) {
      carColor = color(#E4FA5B);//yellow
    }
    if (carKind == 5) {
      carColor = color(#FFA646);//orange
    }
    if (carKind == 6) {
      carColor = color(#FF4C46);//red
    }
    sentAnother = false;
  }
  // this method moves all the cars ------------------------------------------------
  void moveCar() {
    if (isMoving) {
      xPos++;

      //check on the switches 1) check xPos 2) check track 3) check switch state 4) setTrack accordingly
      //switch 1 -------------------------------------------------------------------
      if (xPos==120) {
        if (trackSwitch[0].straight) {
          this.trackNum = 12;
        } else {
          this.trackNum = 2;
        }
      }
      //switch 2 -------------------------------------------------------------------
      if (xPos==275&&this.trackNum==2) {
        if (trackSwitch[1].straight) {
          this.trackNum = 11;
        } else {
          this.trackNum = 4;
        }
      }
      //switch 3 -------------------------------------------------------------------
      if (xPos==400&&this.trackNum==11) {
        if (trackSwitch[2].straight) {
          this.trackNum = 10;
        } else {
          this.trackNum = 15;
        }
      }
      //switch 4 -------------------------------------------------------------------
      if (xPos==550&&this.trackNum==9) {
        if (trackSwitch[3].straight) {
          this.trackNum = 7;
        } else {
          this.trackNum = 8;
        }
      }
      //switch 5 -------------------------------------------------------------------
      if (xPos==275&&this.trackNum==12) {
        if (trackSwitch[4].straight) {
          this.trackNum = 14;
        } else {
          this.trackNum = 13;
        }
      }
      //switch 6 -------------------------------------------------------------------
      if (xPos==500&&this.trackNum==16) {
        if (trackSwitch[5].straight) {
          this.trackNum = 18;
        } else {
          this.trackNum = 17;
        }
      }

      //track Slopes ---------------------------------------------------------------
      //track 2
      if (xPos>120&&xPos<400&&this.trackNum==2) {
        yPos-=.63;
      }

      //track 4
      if (xPos>275&&this.trackNum==4) {
        if (xPos>275&&xPos>350) {
          yPos-=.82;
        } else {
          yPos-=1.33;
        }
        if (xPos==598) {
          this.trackNum = 5;
        }
      }

      //track 10
      if (this.trackNum==10) {
        yPos--;
        if (this.xPos==500) {
          this.trackNum = 9;
        }
      } 

      //track 8
      if (this.trackNum ==8) {
        yPos--;
        if (this.xPos==650) {
          this.trackNum = 6;
        }
      }

      //track 13
      if (this.trackNum==13) {
        yPos+=1.33;
        if (this.xPos==350) {
          this.trackNum = 16;
        }
      }

      //track 17
      if (this.trackNum==17) {
        yPos++;
        if (xPos==600) {
          this.trackNum = 19;
        }
      }

      //stop the car at the end of the track ----------------------------------------------

      if (this.trackNum == 5) {
        if (this.xPos == 600 + yardTrack[0].trackLength) {
          this.isMoving = false; //stop the car
          if (this.carType == yardTrack[0].trackType) {
            score+=10;
            helpIndex = int(random(4, 8));//says a positive message
          } else {
            score -= 5;
            helpIndex = int(random(8, 12));//says a negative message
          }
          yardTrack[0].trackLength -= 1.25*(this.carLength);
          //println(yardTrack[0].trackLength);
        }
      }

      if (this.trackNum == 6) {
        if (this.xPos == 650 + yardTrack[1].trackLength) {
          this.isMoving = false; //stop the car
          if (this.carType == yardTrack[1].trackType) {
            score+=10;
            helpIndex = int(random(4, 8));//says a positive message
          } else {
            score -= 5;
            helpIndex = int(random(8, 12));//says a negative message
          }
          yardTrack[1].trackLength -= 1.25*(this.carLength);
          //println(yardTrack[1].trackLength);
        }
      }

      if (this.trackNum == 7) {
        if (this.xPos == 650 + yardTrack[2].trackLength) {
          this.isMoving = false; //stop the car
          if (this.carType == yardTrack[2].trackType) {
            score+=10;
            helpIndex = int(random(4, 8));//says a positive message
          } else {
            score -= 5;
            helpIndex = int(random(8, 12));//says a negative message
          }
          yardTrack[2].trackLength -= 1.25*(this.carLength);
          //println(yardTrack[2].trackLength);
        }
      }

      if (this.trackNum == 15) {
        if (this.xPos == 500 + yardTrack[3].trackLength) {
          this.isMoving = false; //stop the car
          if (this.carType == yardTrack[3].trackType) {
            score+=10;
            helpIndex = int(random(4, 8));//says a positive message
          } else {
            score -= 5;
            helpIndex = int(random(8, 12));//says a negative message
          }
          yardTrack[3].trackLength -= 1.25*(this.carLength);
          //println(yardTrack[3].trackLength);
        }
      }

      if (this.trackNum == 14) {
        if (this.xPos == 350 + yardTrack[4].trackLength) {
          this.isMoving = false; //stop the car
          if (this.carType == yardTrack[4].trackType) {
            score+=10;
            helpIndex = int(random(4, 8));//says a positive message
          } else {
            score -= 5;
            helpIndex = int(random(8, 12));//says a negative message
          }
          yardTrack[4].trackLength -= 1.25*(this.carLength);
          //println(yardTrack[4].trackLength);
        }
      }

      if (this.trackNum == 18) {
        if (this.xPos == 600 + yardTrack[5].trackLength) {
          this.isMoving = false; //stop the car
          if (this.carType == yardTrack[5].trackType) {
            score+=10;
            helpIndex = int(random(4, 8));//says a positive message
          } else {
            score -= 5;
            helpIndex = int(random(8, 12));//says a negative message
          }
          yardTrack[5].trackLength -= 1.25*(this.carLength);
          //println(yardTrack[5].trackLength);
        }
      }

      if (this.trackNum == 19) {
        if (this.xPos == 600 + yardTrack[6].trackLength) {
          this.isMoving = false; //stop the car
          if (this.carType == yardTrack[6].trackType) {
            score+=10;
            helpIndex = int(random(4, 8));//says a positive message
          } else {
            score -= 5;
            helpIndex = int(random(8, 12));//says a negative message
          }
          yardTrack[6].trackLength -= 1.25*(this.carLength);
          //println(yardTrack[6].trackLength);
        }
      }

      //send another car after one has been placed
      if (!rollingStock[numOfCars-1].isMoving) { // if the car is stoped release another car
        if (numOfCars<rollingStock.length) {
          numOfCars++;
        } else {
          helpTxt[3] = "That was the last car, your score is" + str(score) + " return to the menu to play again!";
          helpIndex = 3;
        }
      }

      fill(carColor);
      rect(xPos, yPos, carLength, 10);
    } else {
      fill(carColor);
      rect(xPos, yPos, carLength, 10);
    }
    //print(this.trackNum + "\n");
    if (!this.sentAnother) {
      if (numOfCars<rollingStock.length) { // prevents out of Bounds index!
        if (this.trackNum == 5) {
          numOfCars++;
          this.sentAnother = true;
        }
        if (this.trackNum == 6) {
          numOfCars++;
          this.sentAnother = true;
        }
        if (this.trackNum == 7) {
          numOfCars++;
          this.sentAnother = true;
        }
        if (this.trackNum == 15) {
          numOfCars++;
          this.sentAnother = true;
        }
        if (this.trackNum == 14) {
          numOfCars++;
          this.sentAnother = true;
        }
        if (this.trackNum == 18) {
          numOfCars++;
          this.sentAnother = true;
        }
        if (this.trackNum == 19) {
          numOfCars++;
          this.sentAnother = true;
        }
      }
    }
  }
}