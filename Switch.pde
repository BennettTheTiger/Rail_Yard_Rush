class Switch{
 int xPos0;
 int yPos0;
 int xPos1;
 int yPos1;
 int xPos2;
 int yPos2;
 boolean straight; 
 
 Switch(int x0, int y0, int x1, int y1, int x2, int y2, boolean status){
  xPos0 = x0;
  yPos0 = y0;
  xPos1 = x1;
  yPos1 = y1;
  xPos2 = x2;
  yPos2 = y2;
  straight = status;
  
 }
  void switchBuild(){
    stroke(#17C3FF);
    if(straight){
      line(xPos0,yPos0,xPos1,yPos1);
    }
    else{
      line(xPos0,yPos0,xPos2,yPos2);
    }
  }//end swith build
  
  //this method toggles the swith 
  void switchToggle(){
    if(straight){
      straight = false;
    }
    else{
      straight = true;
    }
  }//end switch toggle
  //this method checks the switches position
  boolean getStatus(){
    return straight;
  }
   
 }//end switch class