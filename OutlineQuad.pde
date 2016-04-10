class OutlineQuad extends Outline {
  Point topLeft; //Top left corner
  Point bottomRight; //Bottom right corner
  Point topRight;
  Point bottomLeft;
  
  OutlineQuad(Point tl, Point br, Point tr, Point bl) {
    this.topLeft = tl;
    this.bottomRight = br;
    this.topRight = tr;
    this.bottomLeft = bl;
  }
  
  void drawSelf(int col) {
    stroke(col);
    line(topLeft.x_coord, topLeft.y_coord, bottomLeft.x_coord, bottomLeft.y_coord);
    line(bottomLeft.x_coord, bottomLeft.y_coord, bottomRight.x_coord, bottomRight.y_coord);
    line(bottomRight.x_coord, bottomRight.y_coord, topRight.x_coord, topRight.y_coord);
    line(topRight.x_coord, topRight.y_coord, topLeft.x_coord, topLeft.y_coord);
  }
  
  boolean pointInside(float x, float y) {
    return (x > topLeft.x_coord && x < bottomRight.x_coord && y > topLeft.y_coord && y < bottomRight.y_coord);
  }
  
  ArrayList<Line> getLines() {
   ArrayList<Line> temp = new ArrayList<Line>();
   temp.add(new Line(topLeft, bottomLeft)); 
   temp.add(new Line(bottomLeft, bottomRight));
   temp.add(new Line(bottomRight, topRight));
   temp.add(new Line(topRight, topLeft));
   
   return temp;
  }
  
  float getArea() {
    return Math.abs(topLeft.x_coord - bottomRight.x_coord) * (topLeft.y_coord - bottomRight.y_coord);
  }
  
  int compareTo(Object o) {
    if (o == this)
      return 0;
    else if (o instanceof Outline) {
      Outline p = (Outline) o;
      float pArea = p.getArea();
      float oArea = this.getArea();
      
      if (pArea > oArea)
        return -1;
      else if (oArea > pArea)
        return 1;
      else
        return 0;
    }
    else {
      println("You fucked up hard somewhere");
      return 0;
    }
      
  }
  
}