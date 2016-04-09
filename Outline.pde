abstract public class Outline implements Comparable {
  
  abstract void drawSelf(int col);
  abstract boolean pointInside(float x, float y);
  abstract float getArea();
}