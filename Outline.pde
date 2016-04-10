/**Abstract superclass to all Outline shapes**/
abstract public class Outline implements Comparable {
  
  abstract void drawSelf(int col); //Draws shape onto board
  abstract boolean pointInside(float x, float y); //True if there is a point inside the Outline
  abstract float getArea(); //Returns self-calculate area of Outline
  abstract ArrayList<Line> getLines();


}