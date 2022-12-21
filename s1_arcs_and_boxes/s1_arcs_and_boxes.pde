float[][] distances;
float maxDistance;
int spacer;
int quad_size_factor;
PShape s;
float beginX = 20.0;  // Initial x-coordinate
float beginY = 10.0;  // Initial y-coordinate
float endX = 570.0;   // Final x-coordinate
float endY = 320.0;   // Final y-coordinate
float distX = 1000;          // X-axis distance to move
float distY = 1000;          // Y-axis distance to move
float exponent = 4;   // Determines the curve
float x = 0.0;        // Current x-coordinate
float y = 0.0;        // Current y-coordinate
float step = 0.01;    // Size of each step along the path
float pct = 0.0;      // Percentage traveled (0.0 to 1.0)

void randomized_quad(float x, float y, float size)
{
    quad(
        x + random(0, size),
        y + random(0, size),
        x + random(0, size),
        y - random(0, size),
        x - random(0, size),
        y - random(0, size),
        x - random(0, size),
        y + random(0, size)
    );
}

void setup() {
    size(2000, 2000);
    maxDistance = dist(width/2, height/2, width, height);
    distances = new float[width][height];
    for (int y = 0; y < height; y++) {
        for (int x = 0; x < width; x++) {
        float distance = dist(width/2, height/2, x, y);
        distances[x][y] = distance/maxDistance * 255;
        }
    }
    spacer = 200;
    quad_size_factor = 20;

    strokeWeight(1);
    smooth();


    background(0);
    //noLoop();  // Run once and stop

}

void draw() {
    //background(0);
    // This embedded loop skips over values in the arrays based on
    // the spacer variable, so there are more values in the array
    // than are drawn here. Change the value of the spacer variable
    // to change the density of the points
    for (int y = 0 - spacer/2; y < height; y += spacer) {
        for (int x = 0 - spacer/2; x < width; x += spacer) {
            noFill();
            stroke(255);
            beginShape();
            vertex(x, y); // first point
            bezierVertex(x + spacer, y, x, y + spacer, x + spacer, y + spacer);
            endShape();

            stroke(255);
            fill(0);
            //fill(distances[x][y]);
            randomized_quad(x, y, quad_size_factor);
        }
    }
    fill(0, 2);
    rect(0, 0, width, height);
    pct += step;
    if (pct < 1.0) {
        x = beginX + (pct * distX);
        y = beginY + (pct * distY);
    }
    fill(255);
    ellipse(x, y, 20, 20);
}