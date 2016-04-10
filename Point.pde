public class Point {
  float x_coord;
  float y_coord;
  
  Point(float x, float y) {
    x_coord = x;
    y_coord = y;
  }
  
  boolean insideOutline(Outline out) {
    return out.pointInside(x_coord, y_coord);
  }