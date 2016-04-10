public class Point {
  float x_coord;
  float y_coord;
  
  Point(float x, float y) {
    x_coord = x;
    y_coord = y;
  }
  
  //Returns true if the point is inside an outline
  boolean insideOutline(Outline out) {
    return out.pointInside(x_coord, y_coord);
  }
}