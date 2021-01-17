/*
Matt Begbie
 started 2021 -01-15
 2d art thingie that looks like digital window broken thing
 
 This will be a generational program so first declare how many generations it will run
 then each genertations it will roll a few random numbers
 branch nums
 branch directions 
 need an array which stores all points so that a new node can be compared and if they make a closed shape fill it in
 will have to bootstrap it at 0, 0, going down and right
 
 give each line a chance to be twice as big, kinda rare 10% if the time?
 it cannot go backwards
 
 */

int lLength = 50;
int newX = 0;
int newY = 0;
void setup() {

  size(1000, 1000);
}



void draw() {
  background(#454545);
  stroke(#7067CF);
  strokeWeight(5);
  addline(0, 0, 0, 0, 10);
  //line(0, 0, 100, 100);
  //line (200, 200, 200, 200);
}



void addline(int oldX, int oldY, int oldDirection, int currGen, int maxGen) {
  currGen++;
  //draw new line

  while (currGen < maxGen) {
  
    switch(oldDirection) {
    case 0:
      newX = oldX + lLength;
      newY = oldY + lLength;
      line(oldX, oldY, newX, newY);
      print("Case 0", oldX, oldY, newX, newY, "End");
      break;
    case 1: 
      newX = oldX + lLength;
      line(oldX, oldY, newX, oldY);
      print("Case 1", oldX, oldY, newX, newY, "End");
      break;
    case 2: 
      newX = oldX + lLength;
      newY = oldY - lLength;
      line(oldX, oldY, newX, newY);
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

    if (oldX > 500 || oldY > 500 || oldX < 0 || oldY < 0) {
      break;
    }
    int childNum = int(random(8));
    int[] direction = new int[childNum];
    for ( int i = 0; i < childNum; i++) {
      //chose a direction for every child, each has to be unique
      direction[i] = int(random(8));
      //print(direction[i]);
      for (int j = 0; j < i - 1; j++) {
        if ((direction[i] == direction[j]) || (direction[i] == oldDirection)) {
          direction[i] = int(random(8));
          i = i - 1;
          //print("reset");
        }
      }
      //print("\n");
      addline(newX, newY, direction[i], currGen, maxGen);
    }
  }
}
