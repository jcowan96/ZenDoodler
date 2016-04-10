public class Spiral {

  Point origin;
  Outline out;
  ArrayList<Line> lines;

  Spiral(Point p, Outline out) {
    this.origin = p;
    this.out = out;
    lines = (out.getLines());
  }

  //Updates line position
  private Line updateLine(int linenum, float stepSizex, float stepSizey) {
    Line nextline;
    Line prevline;
    if (linenum == lines.size() - 1)
      nextline = lines.get(0);
    else
      nextline = lines.get(linenum + 1);
    if (linenum == 0)
      prevline = lines.get(lines.size() - 1);
    else
      prevline = lines.get(linenum - 1);
    float newx = nextline.origin.x_coord - stepSizex*(nextline.origin.x_coord - nextline.destination.x_coord);
    float newy = nextline.origin.y_coord - stepSizey*(nextline.origin.y_coord - nextline.destination.y_coord);
    return new Line(prevline.destination, new Point(newx, newy));
  } 
}