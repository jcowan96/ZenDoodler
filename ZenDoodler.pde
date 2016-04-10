int BGCOLOR = 0;
Grid grid;
int corner = 0;

void setup() {
  size(1280, 720);
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

void draw() {

  //OutlineQuad os = new OutlineQuad(grid.corners[0], grid.corners[19], grid.corners[16], grid.corners[3]);

  for (int i = 0; i <= 14; i++) {
    OutlineQuad o = new OutlineQuad(grid.corners[i], grid.corners[i+5], grid.corners[i+4], grid.corners[i+1]);
    outlines.add(o);
  }
  //outlines.add(os);
  //os.drawSelf(BGCOLOR);


  Point p = new Point(mouseX, mouseY);
  for (Outline o : outlines) {
    if (p.insideOutline(o)) {
      //println("Point is inside an Outline");
      Spiral sp = new Spiral(p, o);
      for (int i=0; i<255; i++) {
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

void keyPressed() {
  if (key == ENTER) {
    // stroke(255);
    //Point p = new Point(mouseX, mouseY);
    //for (Outline o : outlines) {
    //  if (p.insideOutline(o)) {
    //    System.out.println("Point is inside an Outline");
    //    Spiral sp = new Spiral(p, o);
    //    for(int i=0; i<255; i++) {
    //      Line l = sp.updateLine(i%4, .01 + i*.0001, .01 + i*.0001);
    //      sp.lines.set(i%4, l);
    //      if (outlines.size()%3 == 0)
    //        stroke(#000001 + i);
    //      else if (outlines.size()%3 == 1)
    //        stroke(#000001 + i*256);
    //      else
    //        stroke(#000001 + i*65536);
    //      line(l.origin.x_coord, l.origin.y_coord, l.destination.x_coord, l.destination.y_coord);
    //    }
    //    break;
    //  }
    //}
  } //
}

void animateLine(Line toAnimate) {
  int framesToAnim = 60;
  line(toAnimate.origin.x_coord, toAnimate.origin.y_coord, 
    toAnimate.origin.x_coord + float(frameCount % framesToAnim) / framesToAnim * (toAnimate.destination.x_coord - toAnimate.origin.x_coord), 
    toAnimate.origin.y_coord + float(frameCount % framesToAnim) / framesToAnim * (toAnimate.destination.y_coord - toAnimate.origin.y_coord));
}