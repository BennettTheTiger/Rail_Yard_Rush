class Track {
  int xP1;
  int xP2;
  int yP1;
  int yP2;
  int trackType; // 0-6 for the different sidings
  int trackLength;// for how many cars can be stored on a track
  int trackNum;//the track tag for switches to communicate
  boolean trackActive;//is it a possible path

  Track(int x1, int y1, int x2, int y2, int num, int Tnum, boolean active) {

    xP1 = x1;
    yP1 = y1;
    xP2 = x2;
    yP2 = y2;
    trackType = num;
    trackLength = xP2 - xP1;
    trackNum = Tnum;
    trackActive = active;
  }
  
  void buildTrack(){
   line(xP1,yP1,xP2,yP2); 
  }
}