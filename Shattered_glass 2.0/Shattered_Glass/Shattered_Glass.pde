//Shattered Glass 2.0
void setup() {
  size(1000, 1000);
}

color[] colours = { #454545, #539987, #52FFB8, #4DFFF3, #7067CF};
int offset = 50;

void draw() {
  background(colours[0]);
  stroke(colours[1]);
  strokeWeight(5);
  dLine(0, 0, 0, 0);
  noLoop();
}

void dLine(int OX, int OY, int dir, int currGen) {
  if (currGen < 30) {
    currGen++;
    int NX = 0;
    int NY = 0;
    print("direction is ", dir, " generation is ", currGen, "\n");
    if ((OX >= 0) && (OY >= 0) && (OX <= 500) && (OY <= 500)) {
      
      if (dir == 0) {  //down, right
        NX = OX + offset;
        NY = OY + offset;
      } else if (dir == 1) { // up, right
        NX = OX + offset;
        NY = OY - offset;
      } else if (dir == 2) { //down, left
        NX = OX - offset;
        NY = OY + offset;
      } else if (dir == 3) { //right
        NX = OX + offset;
        NY = OY;
      } else if (dir == 4) { //down // this direction is cancelled
        NX = OX;
        NY = OY + offset;
      }


      line(OX, OY, NX, NY);
      int children = int(random(4));
      for ( int i = 0; i < children; i++) {
        int ND = int(random(4));
        dLine(NX, NY, ND, currGen);
      }
    }
  } else {
    print("Gen killed at ", currGen, "\n");
  }
}


/*
    switch(olddirection) {
 case 0:
 newX = oldX + lLength;        
 newY = oldY + lLength;
 line(oldX, oldY, newX, newY);                                \>
 print("Case 0", oldX, oldY, newX, newY, "End");
 break;
 case 1: 
 newX = oldX + lLength;                                       -> 
 line(oldX, oldY, newX, oldY);
 print("Case 1", oldX, oldY, newX, newY, "End");
 break;
 case 2: 
 newX = oldX + lLength;
 newY = oldY - lLength;
 line(oldX, oldY, newX, newY);                                />  
 print("Case 2", oldX, oldY, newX, newY, "End");
 break;
 case 3:    
 newY = oldY + lLength;
 line(oldX, oldY, oldX, newY);                                 
 print("Case 3", oldX, oldY, newX, newY, "End");                  
 break;
 case 4:
 newY = oldY - lLength;
 line(oldX, oldY, oldX, newY);
 print("Case 4", oldX, oldY, newX, newY, "End");
 break;
 case 5:
 newX = oldX - lLength;
 newY = oldY - lLength;
 line(oldX, oldY, newX, newY);
 print("Case 5", oldX, oldY, newX, newY, "End");
 break;
 case 6:
 newX = oldX - lLength;
 line(oldX, oldY, newX, oldY);
 print("Case 6", oldX, oldY, newX, newY, "End");
 break;
 case 7:
 newX = oldX - lLength;
 newY = oldY + lLength;
 line(oldX, oldY, newX, newY);
 print("Case 7", oldX, oldY, newX, newY, "End");
 break;
 }
 */
