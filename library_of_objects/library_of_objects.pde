void setup() {
  size(1000, 1000);
  maxDistance = dist(width/2, height/2, width, height);
  distances = new float[width][height];
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      float distance = dist(width/2, height/2, x, y);
      distances[x][y] = distance/maxDistance * 255;
    }
  }
  spacer = 100;
  spacer_pct_empty = 75;
  strokeWeight(1);
  background(0);
  //noLoop();  // Run once and stop
}

void draw() {
  //background(0);
  // This embedded loop skips over values in the arrays based on
  // the spacer variable, so there are more values in the array
  // than are drawn here. Change the value of the spacer variable
  // to change the density of the points
  for (int y = 0 + spacer/2; y < height; y += spacer) {
    for (int x = 0 + spacer/2; x < width; x += spacer) {
      stroke(255);
      fill(0);
      //fill(distances[x][y]);
      int sizing_factor = int((spacer - spacer * spacer_pct_empty / 100) / 2);
      randomized_quad(x, y, sizing_factor);
    }
  }
}