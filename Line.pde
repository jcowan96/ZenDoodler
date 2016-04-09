/*private Line updateLine(int linenum){
    Line nextline;
    if(linenum == lines.length)
      nextline = lines[0];
    else
      nextline = lines[linenum + 1];
    Line curline = lines[linenum];
    double newx = nextline.ox - .1*(nextline.ox - nextline.dx);
    double newy = nextline.oy - .1*(nextline.oy - nextline.dy);
    return new Line(curline.ox, curline.oy, newx, newy);
}*/

private class Line {
  protected Point origin;
  protected Point destination;
  /**
   * Constructor for any line
   */
  public Line(Point o, Point d){
    origin = o;
    destination = d;
  }
}