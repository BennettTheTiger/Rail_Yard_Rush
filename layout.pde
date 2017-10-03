//Bennett Schoonerman
//Final Project 12/5/2016
//RailRoad Rush

//game assets
Switch[] trackSwitch;
Track[] yardTrack;
Signal[] yardSignal;
FreightCar[] rollingStock;
int numOfCars = 1;
int score = 0;
boolean carsReady = false; //holds the cars until the player is ready

//home screen assets -----------------------------------------------------------------
PImage title;
PImage author;
PImage play1;
PImage play2;
PImage theBoss;
//menu images and variables ----------------------------------------------------------
PImage Locomotive;
PImage car1;
PImage car2;
PImage roadBed;
float locoPos = -1500;
float car1Pos = -2800;
float car2Pos = -4100;
float menuSpeed = 1.2; //<---------------------- ( train speed in menu )--------------
float bgSpeed = 3;
float titlePosition = 700;
boolean playReady = false;
boolean hasPlayed = false;

String[] helpTxt = new String[13];
String currentText;
int helpIndex = 0;
boolean home = true;
float[] railTie = new float[20];
float[] bedTiles = new float[13];
void setup() {
  println("'1' key switch 1");
  println("'2' key switch 2");
  println("'3' key switch 3");
  println("'4' key switch 4");
  println("'5' key switch 5");
  println("'6' key switch 6");

  // game Setup() --------------------------------------------
  size(1200, 700);
  rectMode(CENTER);
  background(25);
  stroke(255);
  strokeWeight(2);
  yardTrack = new Track[14];
  trackSwitch = new Switch[6];
  yardSignal = new Signal[19];
  rollingStock = new FreightCar[25];// ----- THE NUMBER OF CARS YOU SORT! ---------------------------------
  initYard();
  helpTxt[0] = "Welcome to the yard! Help me by sorting the cars to their corresponding color track. \n | click to continue |";
  helpTxt[1] = "Click on the blue switches or use keys 1-6 to change change them \n | click to continue |.";
  helpTxt[2] = "When you're ready I will send some cars your way! \n | click to begin | ";
  helpTxt[3] = "That was the last car, your score is" + str(score) + " return to the menu to play again!";
  helpTxt[4] = "Awesome!";
  helpTxt[5] = "Great Job";
  helpTxt[6] = "You're a natural!";
  helpTxt[7] = "I think you've done this before";
  helpTxt[8] = "Yikes that car doesnt belong there!";
  helpTxt[9] = "You're going to get me FIRED!";
  helpTxt[10] ="Remember you want the color of the car to match the track!";
  helpTxt[11] ="Opps wrong track!";
  helpTxt[12] ="Welcome back click to begin";

  for (int i = 0; i <rollingStock.length; i++) {
    rollingStock[i] = new FreightCar();
  }
  theBoss = loadImage("helpImg.png");
  //menu Setup() ---------------------------------------------
  Locomotive = loadImage("train.png");
  car1 = loadImage("car1.png");
  car2 = loadImage("car2.png");
  roadBed = loadImage("roadBed.png");
  title = loadImage("title.png");
  author = loadImage("about.png");
  play1  = loadImage("play.png");
  play2 = loadImage("playHover.png");
  size(1200, 700);
  smooth(8);

  for (int i = 0; i < bedTiles.length; i++) {
    bedTiles[i] = i*(width/12);
  }


  for (int i = 0; i < railTie.length; i++) {
    railTie[i] = i*(width/19.5);
  }
}

void draw() {
  if (!home) {
    background(25);
    trackColors();
    for (int i = 0; i<trackSwitch.length; i++) {
      stroke(#17C3FF);
      trackSwitch[i].switchBuild();
    }

    for (int i = 0; i<yardTrack.length; i++) {
      stroke(255);
      yardTrack[i].buildTrack();
    }

    for (int i = 0; i<yardSignal.length; i++) {
      yardSignal[i].upDateSignals();
    }
    if (carsReady) {
      for (int i = 0; i<numOfCars; i++) {
        rollingStock[i].moveCar();
      }
    }

    //bottom score and menu text --------------------------
    textSize(20);
    fill(255);
    text("Score:" + score, 20, 600);
    fill(25);
    rect(220, 590, 100, 35);
    fill(255);
    text("Menu", 193, 595);
    //hoverState ---------------------------------------
    if (mouseX>180&&mouseX<270&&mouseY>575&&mouseY<605) {
      fill(255);
      rect(220, 590, 100, 35);
      fill(25);
      text("Menu", 193, 595);
    }

    image(theBoss, 0, 0);
    fill(0);
    textSize(15);
    text(helpTxt[helpIndex], 270, 160, 160, 200);
  } //end gameLoop
  else {
    //run the draw main menu function
    mainMenu();
  }
}

void initYard() {
  //initalize all the signals --------------------------------------------------------------------------------------
  yardSignal[0] = new Signal(20, 450, true);//yard in
  yardSignal[1] = new Signal(120, 450, true);//switch 1 in
  yardSignal[2] = new Signal(200, 450, true);//switch 1 out Straight
  yardSignal[3] = new Signal(200, 400, true);//switch 1 out North
  yardSignal[4] = new Signal(275, 350, true);//switch 2 in
  yardSignal[5] = new Signal(350, 350, true);//switch 2 out Straight
  yardSignal[6] = new Signal(350, 250, true);//switch 2 out North
  yardSignal[7] = new Signal(400, 350, true);//switch 3 in
  yardSignal[8] = new Signal(500, 250, true);//switch 3 out North
  yardSignal[9] = new Signal(500, 350, true);//switch 3 out Straight
  yardSignal[10] = new Signal(550, 250, true);//switch 4 in
  yardSignal[11] = new Signal(650, 250, true);//switch 4 out Straight
  yardSignal[12] = new Signal(650, 150, true);//switch 4 out North
  yardSignal[13] = new Signal(275, 450, true);//switch 5 in
  yardSignal[14] = new Signal(350, 450, true);//switch 5 Straight
  yardSignal[15] = new Signal(350, 550, true);//switch 5 South
  yardSignal[16] = new Signal(500, 550, true);//switch 6 in 
  yardSignal[17] = new Signal(600, 550, true);//switch 6 Straight
  yardSignal[18] = new Signal(600, 650, true);//Switch 6 South

  //build the track -------------------------------------------------------------------------------------------------
  //
  yardTrack[0] = new Track(600, 50, 1100, 50, 0, 5, true);//siding 0
  yardTrack[1] = new Track(650, 150, 1100, 150, 1, 6, true);//siding 1
  yardTrack[2] = new Track(650, 250, 1100, 250, 2, 11, true);//siding 2
  yardTrack[3] = new Track(500, 350, 1100, 350, 3, 12, true);//siding 3
  yardTrack[4] = new Track(350, 450, 1100, 450, 4, 14, true);//siding 4
  yardTrack[5] = new Track(600, 550, 1100, 550, 5, 17, true);//siding 5
  yardTrack[6] = new Track(600, 650, 1100, 650, 6, 18, true);//siding 6
  yardTrack[7] = new Track(0, 450, 120, 450, 0, 0, true);// first line in 
  yardTrack[8] = new Track(200, 400, 275, 350, 0, 2, true);//switch1 North
  yardTrack[9] = new Track(350, 250, 600, 50, 0, 4, true);//switch2 North
  yardTrack[10] = new Track(350, 350, 400, 350, 0, 7, true);//switch2 Straight
  yardTrack[11] = new Track(500, 250, 550, 250, 0, 9, true);
  yardTrack[12] = new Track(200, 450, 275, 450, 0, 13, true);
  yardTrack[13] = new Track(350, 550, 500, 550, 0, 15, true);

  //build the switches ---------------------------------------------------------------------------------------------
  trackSwitch[0] = new Switch(120, 450, 200, 450, 200, 400, true); 
  trackSwitch[1] = new Switch(275, 350, 350, 350, 350, 250, true); 
  trackSwitch[2] = new Switch(400, 350, 500, 250, 500, 350, true); 
  trackSwitch[3] = new Switch(550, 250, 650, 250, 650, 150, true); 
  trackSwitch[4] = new Switch(275, 450, 350, 450, 350, 550, true); 
  trackSwitch[5] = new Switch(500, 550, 600, 550, 600, 650, true); 

  //draw all components to the Screen -----------------------------------------------------------------------------
  for (int i = 0; i<trackSwitch.length; i++) {
    stroke(#17C3FF);
    trackSwitch[i].switchBuild();
  }

  for (int i = 0; i<yardTrack.length; i++) {
    stroke(255);
    yardTrack[i].buildTrack();
  }

  for (int i = 0; i<yardSignal.length; i++) {
    yardSignal[i].upDateSignals();
  }
}//end of initYard()

void mouseClicked() {
  //switch 1 toggle -------------------------------------------------------------------------------
  if (mouseX>120&&mouseX<200&&mouseY>400&&mouseY<450) {
    trackSwitch[0].switchToggle();
    //if the track status is straight set the signals acordingly 
    if (trackSwitch[0].getStatus()) {
      for (int i = 3; i< 13; i++) {
        yardSignal[i].setSignal(false);
      }
      for (int i = 13; i< yardSignal.length; i++) {
        yardSignal[i].setSignal(true);
      }
      yardSignal[2].setSignal(true);
    }
    //if the track is switched north change the signals ---------
    else {
      for (int i = 3; i< 13; i++) {
        yardSignal[i].setSignal(true);
      }
      for (int i = 13; i< yardSignal.length; i++) {
        yardSignal[i].setSignal(false);
      }
      yardSignal[2].setSignal(false);
    }
  }
  //switch 2 toggle --------------------------------------------------
  if (mouseX>275&&mouseX<350&&mouseY>250&&mouseY<350) {
    trackSwitch[1].switchToggle();
    //if straight
    if (trackSwitch[1].getStatus()) {
      yardSignal[6].setSignal(false);
    }
    //if North
    else {
      yardSignal[6].setSignal(true);
    }
  }

  if (mouseX>400&&mouseX<500&&mouseY>250&&mouseY<350) {
    trackSwitch[2].switchToggle();
    if (trackSwitch[2].getStatus()) {
      yardSignal[9].setSignal(false);
      yardSignal[8].setSignal(true);
    }
    //if North
    else {
      yardSignal[9].setSignal(true);
      yardSignal[8].setSignal(false);
    }
  }

  if (mouseX>550&&mouseX<650&&mouseY>150&&mouseY<250) {
    trackSwitch[3].switchToggle();
  }

  if (mouseX>250&&mouseX<350&&mouseY>450&&mouseY<550) {
    trackSwitch[4].switchToggle();
  }

  if (mouseX>500&&mouseX<600&&mouseY>550&&mouseY<650) {
    trackSwitch[5].switchToggle();
  }
  //this triggers the scene to change to the game --------------------------
  if (playReady) {
    if (mouseX>925&&mouseX<1130&&mouseY>75&&mouseY<125) {
      home = false;
      //makes the cars have new tracks
      for (int i = 0; i <rollingStock.length; i++) {
        rollingStock[i] = new FreightCar();
      }
    }
    if (hasPlayed) {
      helpIndex = 12; //welcome back msg
    }
  }
  // this button is waitng for a click on the menu button in the game screen
  if (!home) {
    if (mouseX>180&&mouseX<270&&mouseY>575&&mouseY<605) {
      goHome(); 
      home = true;
    }
  }

  //checks for a click inside the help Text area
  if (!home) {
    if (mouseX>200&&mouseX<400&&mouseY>60&&mouseY<260) { // checks in the box for a click to start the game
      if (!hasPlayed) {
        if (helpIndex<2) {
          helpIndex++;
        } else {
          carsReady = true; // starts the cars moving
        }
      }
      // if you have played this waits for you start the game again
      if (hasPlayed) {
        carsReady = true;
      }
    }
  }
}//end of mouseClicked()
//this function draws the colors at the end of the line
void trackColors() {
  fill(#FA67D8);//pink
  rect(1150, 50, 20, 20);
  fill(#B067FA);//purple
  rect(1150, 150, 20, 20);
  fill(#67CAFA);//blue
  rect(1150, 250, 20, 20);
  fill(#49EA52);//green
  rect(1150, 350, 20, 20);
  fill(#E4FA5B);//yellow
  rect(1150, 450, 20, 20);
  fill(#FFA646);//orange
  rect(1150, 550, 20, 20);
  fill(#FF4C46);//red
  rect(1150, 650, 20, 20);
}

// This part draws the main menu portion;
void mainMenu() {
  background(111, 181, 255, 100);
  for (int i = 0; i < bedTiles.length; i++) {
    image(roadBed, bedTiles[i], 620);
    bedTiles[i]-=bgSpeed;
    if (bedTiles[i]<-100) {
      bedTiles[i] = width;
    }
  }

  //draws the ties and moves them
  for (int i = 0; i < railTie.length; i++) {
    fill(#765C4F);
    rect(railTie[i], 622, 30, 20);  //the ties
    railTie[i]-=bgSpeed;
    if (railTie[i]<-25) {
      railTie[i] = width;
    }
  }
  fill(200);
  rect(width/2, 608, width, 15);//the rail
  //draws each object
  image(Locomotive, locoPos, 200); 
  image(car1, car1Pos, 200); 
  image(car2, car2Pos, 200);

  locoPos+=menuSpeed; 
  car1Pos+=menuSpeed; 
  car2Pos+=menuSpeed; 
  //wraps the cars after the locomotive has passed 
  if (car1Pos>width) {
    car1Pos = -1400;
  }
  if (car2Pos>width) {
    car2Pos = -1400;
  }
  if (bgSpeed>=0) {
    bgSpeed-=.012;
    image(author, 800, 400);
  } else if (menuSpeed<8) {
    menuSpeed+=.005;
    playReady = true;//adds the play button to the main menu
  }
  //displays the title
  image(title, titlePosition-= bgSpeed, 0);
  //when the animation is done this adds the play button
  if (playReady) {
    if (mouseX>925&&mouseX<1130&&mouseY>75&&mouseY<125) {
      fill(0);
      rect( 1025, 100, 200, 50);
      image(play1, 940, 75);
    } else {// hover state
      fill(#FF8205);
      rect( 1025, 100, 200, 50);
      image(play2, 940, 75);
    }
  }
}
//resets all the parameters for the home screen --------------------------------------------------------------------
void goHome() {
  carsReady = false;//keeps the game paused on re-entry so that they dont start before you are ready
  locoPos = -1500;
  car1Pos = -2800;
  car2Pos = -4100;
  menuSpeed = 1.2; //<---------------------- ( train speed in menu )--------------
  bgSpeed = 3;
  titlePosition = 700; //title starting pos
  playReady = false; // lets the opening animation play again
  hasPlayed = true; // now when the player re-enters they wont need to click through all the how to prompts
  numOfCars = 1;
  //resets game elements
  score = 0;
  initYard(); // resets all the track Objects since their length property has been altered during play
   for (int i = 0; i <rollingStock.length; i++) {
    rollingStock[i] = new FreightCar();
  }
}
//adds keyboard functionlity
void keyPressed() {
  if (!home) {
    if (key=='1') {
      trackSwitch[0].switchToggle();
    }
    if (key=='2') {
      trackSwitch[1].switchToggle();
    }
    if (key=='3') {
      trackSwitch[2].switchToggle();
    }
    if (key=='4') {
      trackSwitch[3].switchToggle();
    }
    if (key=='5') {
      trackSwitch[4].switchToggle();
    }
    if (key=='6') {
      trackSwitch[5].switchToggle();
    }
  }
}