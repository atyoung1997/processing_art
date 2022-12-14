// colors
color c1 = #10A19D;
color c2 = #540375;
color c3 = #FF7000;
color c4 = #FFBF00;


int spacer = 200;
int boxSize = 100;
int sphereDirection = 1;
float sphereSizeIncrement = 0.005;
float sphereSize = boxSize / 10;
float sphereMinSize = boxSize / 10;
float sphereMaxSize = boxSize / 2 - 5;
float sphereNumIncrements = (sphereMaxSize - sphereMinSize) * 2 / sphereSizeIncrement;

void oscillatingHelix(float startX, float startY, float endX, float endY, float cyclePct, color c1, color c2)
{
    float xDiff = endX - startX;
    float yDiff = endY - startY;
    /*
    Curve 1
    Control point 1:
        - cyclePct 0   at (endX,   startY)
        - cyclePct 0.5 at (endX,   endY)
        - cyclePct 1   at (startX, endY)
    Control point 2:
        - cyclePct 0   at (startX, endY)
        - cyclePct 0.5 at (startX, startY)
        - cyclePct 1   at (endX,   startY)

    Curve 2
    Control point 1:
        - cyclePct 0   at (startX, endY)
        - cyclePct 0.5 at (endX,   endY)
        - cyclePct 1   at (endX,   startY)
    Control point 2:
        - cyclePct 0   at (endX,   startY)
        - cyclePct 0.5 at (startX, startY)
        - cyclePct 1   at (startX, endY)
    */
    if(cyclePct < 0.5)
    {
        cyclePct = cyclePct / 0.5;
        stroke(c1);
        beginShape();
        vertex(startX, startY); // first point x, first point y
        bezierVertex(endX, startY + yDiff * cyclePct, startX, endY - yDiff * cyclePct, endX, endY); // control point 1 x, control point 1 y, control point 2 x, control point 2 y, ending vertex x, ending vertex y
        endShape();

        stroke(c2);
        beginShape();
        vertex(startX, startY);
        bezierVertex(startX + xDiff * cyclePct, endY, endX - xDiff * cyclePct, startY, endX, endY);
        endShape();

    } 
    else
    {
        cyclePct = (cyclePct - 0.5) / 0.5;
        stroke(c1);
        beginShape();
        vertex(startX, startY);
        bezierVertex(endX - xDiff * cyclePct, endY, startX + xDiff * cyclePct, startY, endX, endY);
        endShape();

        stroke(c2);
        beginShape();
        vertex(startX, startY);
        bezierVertex(endX, endY - yDiff * cyclePct, startX, startY + yDiff * cyclePct, endX, endY);
        endShape();
    }
}

void setup() {
    size(2000, 2000, P3D);
    //surface.setLocation(1000,30);
    strokeWeight(3);
    smooth();


    background(0);
    //noLoop();  // Run once and stop
    println("sphereMinSize: "+sphereMinSize);
    println("sphereMaxSize: "+sphereMaxSize);
    println("sphereSizeIncrement: "+sphereSizeIncrement);
    println("sphereNumIncrements: "+sphereNumIncrements);
    
}

void draw() {
    background(0);
    float pctOfFullCycle = (sphereSize - sphereMinSize) / (sphereMaxSize - sphereMinSize);
    
    for (int y = 0 - spacer/2; y < height; y += spacer) {
        for (int x = 0 - spacer/2; x < width; x += spacer) {
            noFill();
            
            // stroke(c1);
            // beginShape();
            // vertex(x, y); // first point x, first point y
            // bezierVertex(x + spacer, y, x, y + spacer, x + spacer, y + spacer); // control point 1 x, control point 1 y, control point 2 x, control point 2 y, ending vertex x, ending vertex y
            // endShape();
            
            // stroke(c2);
            // beginShape();
            // vertex(x + spacer, y + spacer);
            // bezierVertex(x + spacer, y, x, y + spacer, x, y);
            // endShape();
            
            // stroke(c1);
            // beginShape();
            // vertex(width - x, y); // first point x, first point y
            // bezierVertex(width - x - spacer, y, width - x, y + spacer, width - x - spacer, y + spacer); // control point 1 x, control point 1 y, control point 2 x, control point 2 y, ending vertex x, ending vertex y
            // endShape();
            
            // stroke(c2);
            // beginShape();
            // vertex(width - x - spacer, y + spacer); // first point x, first point y
            // bezierVertex(width - x - spacer, y, width - x, y + spacer, width - x, y); // control point 1 x, control point 1 y, control point 2 x, control point 2 y, ending vertex x, ending vertex y
            // endShape();
            

            noFill();
            pushMatrix();
            translate(x, y);
            
            oscillatingHelix(0, 0, spacer, spacer, pctOfFullCycle, c1, c2);
            // stroke(c1);
            // beginShape();
            // vertex(0, 0); // first point x, first point y
            // bezierVertex(spacer, 0, 0, spacer, spacer, spacer); // control point 1 x, control point 1 y, control point 2 x, control point 2 y, ending vertex x, ending vertex y
            // endShape();
            
            // stroke(c2);
            // beginShape();
            // vertex(spacer, spacer);
            // bezierVertex(spacer, 0, 0, spacer, 0, 0);
            // endShape();
            
            //stroke(c1);
            //beginShape();
            //vertex(width - x, y); // first point x, first point y
            //bezierVertex(width - x - spacer, y, width - x, y + spacer, width - x - spacer, y + spacer); // control point 1 x, control point 1 y, control point 2 x, control point 2 y, ending vertex x, ending vertex y
            //endShape();
            
            //stroke(c2);
            //beginShape();
            //vertex(width - x - spacer, y + spacer); // first point x, first point y
            //bezierVertex(width - x - spacer, y, width - x, y + spacer, width - x, y); // control point 1 x, control point 1 y, control point 2 x, control point 2 y, ending vertex x, ending vertex y
            //endShape();
            
            //stroke(random(0,255), random(0,255), random(0,255));
            // stroke(255);
            // sphere(sphereSize);
            if(sphereSize > sphereMaxSize || sphereSize < sphereMinSize){
              sphereDirection *= -1;
            }
            sphereSize += sphereSizeIncrement * sphereDirection;
            stroke(255);
            box(boxSize);
            noFill();
            
            popMatrix();
            
            
        }
    }
}
