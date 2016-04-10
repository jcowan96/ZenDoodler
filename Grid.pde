class Grid {
  public float x_size = width;
  public float y_size = height;
  public Point[] corners = new Point[20];

  // Need to get a grid of ~6 rectanges, so

  public Grid() {

    int k = 0;
    for (int i = 0; i <= 4; i += 1) {
      for (int j = 0; j <= 3; j += 1) {
        //println(k);
        if (i == 0 || j == 0 || i == 4 || j == 3) {
          println("this should be zero" + k);
          corners[k] = new Point(i * 320, j * 240);
        }
        else
          corners[k] = new Point(i * 320 * (random(0.65, 1)), j * 240 * (random(0.65, 1)));
        k++;
      }
    }
  }

  public String toString() {
    String ret = "";
    for (Point ele : corners) {
     ret = ret + ele.x_coord + " " + ele.y_coord + "\n";
    }
    return ret;
  }
}