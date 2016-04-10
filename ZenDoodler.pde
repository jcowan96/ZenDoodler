int BGCOLOR = 0;
Grid grid;
int corner = 0;

void setup() {
  size(1260, 720);
  background(BGCOLOR);
  smooth(8);
  grid = new Grid();
  println(grid);
}

ArrayList<Outline> outlines = new ArrayList<Outline>();

boolean firstCoord = false;
Point topLeft;
Point bottomRight;
Point topRight;
Point bottomLeft;

boolean enterPressed = false;

void draw() {
  float randVar = random(3);
  int index = 0;
  
  if(enterPressed == false) {
  for (int i = 0; i <= 14; i++) {
    OutlineQuad o = new OutlineQuad(grid.corners[i], grid.corners[i+5], grid.corners[i+4], grid.corners[i+1]);
    outlines.add(o);
  }
  
  
  
  //if(enterPressed == false) {
  Point p = new Point(mouseX, mouseY);
  for (Outline o : outlines) {
    if (p.insideOutline(o)) {
      Spiral sp = new Spiral(p, o);
      for (int i=0; i<2000; i++) {
        Line l = sp.updateLine(i%4, .01 + i*.0001, .01 + i*.0001);
        sp.lines.set(i%4, l);
        
        if ((index + randVar)%3 <= 1.0)
          stroke(#F0000F - 32*i);
        else if ((index + randVar)%3 <= 2.0)
          stroke(#0FF000 - i*256);
        else
          stroke(#000FF0 - i*65536);
        line(l.origin.x_coord, l.origin.y_coord, l.destination.x_coord, l.destination.y_coord);
      }
      break;
    }
    index++;
    }
  }
  
  else if (enterPressed == true) {
    fill(BGCOLOR);
    rect(0,0,width,height);
    
    OutlineSquare os = new OutlineSquare(new Point(0,0), new Point(width, height));
    Spiral sp = new Spiral(new Point(width/2, height/2), os);
    /*for (Outline o : outlines) {
      
      Spiral sp;
      try {
        sp = new Spiral(new Point(o.topLeft.x_coord+5, o.topLeft.y_coord+5), o);
      } catch(Exception e) {sp = new Spiral(new Point(5, 5), o); } */
      
      for (int i=0; i<2000; i++) {
        Line l = sp.updateLine(i%4, .01 + i*.0001, .01 + i*.0001);
        sp.lines.set(i%4, l);
        
        randVar = random(3);
        if (randVar <= 1.0)
          stroke(#0000FF - i);
        else if (randVar <= 2.0)
          stroke(#00FF00 - i*256);
        else
          stroke(#FF0000 - i*65536);
        line(l.origin.x_coord, l.origin.y_coord, l.destination.x_coord, l.destination.y_coord);
      }
  }
} 


void keyPressed() {
  if (key == ENTER) {
    enterPressed = true;
  } 
}

void keyReleased() {
  if (key == ENTER) {
    enterPressed = false;
    fill(BGCOLOR);
    rect(0,0,width,height);
  }
}

void animateLine(Line toAnimate) {
  int framesToAnim = 60;
  line(toAnimate.origin.x_coord, toAnimate.origin.y_coord, 
    toAnimate.origin.x_coord + float(frameCount % framesToAnim) / framesToAnim * (toAnimate.destination.x_coord - toAnimate.origin.x_coord), 
    toAnimate.origin.y_coord + float(frameCount % framesToAnim) / framesToAnim * (toAnimate.destination.y_coord - toAnimate.origin.y_coord));
}