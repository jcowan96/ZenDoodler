class OutlineSquare extends Outline {
  Point topLeft; //Top left corner
  Point bottomRight; //Bottom right corner
  
  OutlineSquare(Point tl, Point br) { //Fixes positions of topLeft and bottomRight point
    if (tl.x_coord > br.x_coord) {
      float temp = tl.x_coord;
      tl.x_coord = br.x_coord;
      br.x_coord = temp;
    }
    if (tl.y_coord > br.y_coord) {
      float temp = tl.y_coord;
      tl.y_coord = br.y_coord;
      br.y_coord = temp;
    }
    
    this.topLeft = tl;
    this.bottomRight = br;
  }
  
  //Draws 4 lines of a rectangle based on top right and bottom left points
  void drawSelf(int col) {
    stroke(col);
    line(topLeft.x_coord, topLeft.y_coord, bottomRight.x_coord, topLeft.y_coord);
    line(bottomRight.x_coord, topLeft.y_coord, bottomRight.x_coord, bottomRight.y_coord);
    line(bottomRight.x_coord, bottomRight.y_coord, topLeft.x_coord, bottomRight.y_coord);
    line(topLeft.x_coord, bottomRight.y_coord, topLeft.x_coord, topLeft.y_coord);
  }
  
  //Returns true if there's a point inside the rectangle
  boolean pointInside(float x, float y) {
    return (x > topLeft.x_coord && x < bottomRight.x_coord && y > topLeft.y_coord && y < bottomRight.y_coord);
  }
  
  //Returns ArrayList of lines
  ArrayList<Line> getLines() {
   ArrayList<Line> temp = new ArrayList<Line>();
   temp.add(new Line(topLeft, new Point(bottomRight.x_coord, topLeft.y_coord))); 
   temp.add(new Line(new Point(bottomRight.x_coord, topLeft.y_coord), bottomRight));
   temp.add(new Line(bottomRight, new Point(topLeft.x_coord, bottomRight.y_coord)));
   temp.add(new Line(new Point(topLeft.x_coord, bottomRight.y_coord), topLeft));
   
   return temp;
  }
  
  //Returns Area of Square
  float getArea() {
    return Math.abs(topLeft.x_coord - bottomRight.x_coord) * (topLeft.y_coord - bottomRight.y_coord);
  }
  
  //Comparison based on Area
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