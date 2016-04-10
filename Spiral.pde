public class Spiral {
  
  Point origin;
  Outline out;
  ArrayList<Line> lines;
  
  Spiral(Point p, Outline out) {
    this.origin = p;
    this.out = out;
    lines = ((OutlineQuad) out).getLines();
  }
  
  private Line updateLine(int linenum, float stepSizex, float stepSizey){
    Line nextline;
    Line prevline;
    if(linenum == lines.size() - 1)
      nextline = lines.get(0);
    else
      nextline = lines.get(linenum + 1);
     if(linenum == 0)
      prevline = lines.get(lines.size() - 1);
    else
      prevline = lines.get(linenum - 1);
    float newx = nextline.origin.x_coord - stepSizex*(nextline.origin.x_coord - nextline.destination.x_coord);
    float newy = nextline.origin.y_coord - stepSizey*(nextline.origin.y_coord - nextline.destination.y_coord);
    return new Line(prevline.destination, new Point(newx, newy));
  }
  
  /*Draw first line of a spiral inside an outline
  Point drawUpLeft(Outline out) {
    Point point = new Point(origin.x_coord, origin.y_coord); //Shallow copy
    stroke(255);
    while (point.insideOutline(out)) {
      point.x_coord--;
      point.y_coord--;
     // delay(100);
      line(origin.x_coord, origin.y_coord, point.x_coord, point.y_coord);
    }
    line(origin.x_coord, origin.y_coord, point.x_coord, point.y_coord);
    return point;
    } 
    
    
  Point drawFourLines(Outline out) {
    Point point = this.drawUpLeft(out);
    
    
    return point;
  } */

}
    
  
  