int BGCOLOR = 0;

void setup() {
  size(1280,720);
  background(BGCOLOR);
  smooth(8);
}

ArrayList<Outline> outlines = new ArrayList<Outline>();

boolean firstCoord = false;
Point topLeft;
Point bottomRight;

void draw() {
  if(mousePressed && firstCoord == false) {
    topLeft = new Point(mouseX, mouseY);
    System.out.println("Top Left:"+topLeft.x_coord);
    firstCoord = true;
  }
  if (firstCoord == true && !mousePressed) {
    bottomRight = new Point(mouseX, mouseY);
    OutlineSquare os = new OutlineSquare(topLeft, bottomRight);
    outlines.add(os);
    os.drawSelf(BGCOLOR);
    System.out.println("Bottom Right:"+bottomRight.x_coord);
    firstCoord = false; //Comment this out to only draw one square
  } 
}

void keyPressed() {
    if (key == ENTER) {
     // stroke(255);
      Point p = new Point(mouseX, mouseY);
      for (Outline o : outlines) {
        if (p.insideOutline(o)) {
          System.out.println("Point is inside an Outline");
          Spiral sp = new Spiral(p, o);
          for(int i=0; i<255; i++) {
            Line l = sp.updateLine(i%4, .01 + i*.0001, .01 + i*.0001);
            sp.lines.set(i%4, l);
            if (outlines.size()%3 == 0)
              stroke(#000001 + i);
            else if (outlines.size()%3 == 1)
              stroke(#000001 + i*256);
            else
              stroke(#000001 + i*65536);
            line(l.origin.x_coord, l.origin.y_coord, l.destination.x_coord, l.destination.y_coord);
          }
          break;
        }
      }
    } 
}

void animateLine(Line toAnimate) {
  int framesToAnim = 60;
  line(toAnimate.origin.x_coord, toAnimate.origin.y_coord, 
  toAnimate.origin.x_coord + float(frameCount % framesToAnim) / framesToAnim * (toAnimate.destination.x_coord - toAnimate.origin.x_coord), 
 toAnimate.origin.y_coord + float(frameCount % framesToAnim) / framesToAnim * (toAnimate.destination.y_coord - toAnimate.origin.y_coord));
}