void setup() {
    size(1000, 1000);
    background(255);
    rectMode(CENTER);
    //noLoop();
}

// ellipse
void draw() {
    background(255);
    // inputs
    float ellipse_spread = random(10, 100);
    float ellipse_growth_factor = random(1, 2);
    float initial_diameter = random(0, 100);
    float space_between = random(10, 50);
    println("ellipse_spread: "+ellipse_spread);
    println("ellipse_growth_factor: "+ellipse_growth_factor);
    println("initial_diameter: "+initial_diameter);
    println("space_between: "+space_between);

    // calculations
    float largest_diameter = ellipse_growth_factor * (width / ellipse_spread) + initial_diameter; 

    // starting iteration, at half of screen height
    for (int i = 0; i < (width / ellipse_growth_factor); i++) {
        ellipse(i * ellipse_spread, height / 2, initial_diameter + i * ellipse_growth_factor, initial_diameter + i * ellipse_growth_factor);
    }
    
    // calculate how many iterations are needed to fill the screen
    int multiplier = 1;
    float height_of_iteration = ((height / 2) + (largest_diameter / 2 + space_between) * multiplier);
    while (height_of_iteration < (height + largest_diameter)){
        // alternate between iterations starting from right and left
        if(multiplier % 2 == 0){
            for (int i = 0; i < (width / ellipse_growth_factor); i++) {
                ellipse(i * ellipse_spread, (height / 2) + (largest_diameter / 2 + space_between) * multiplier, initial_diameter + i * ellipse_growth_factor, initial_diameter + i * ellipse_growth_factor);
            }
            for (int i = 0; i < (width / ellipse_growth_factor); i++) {
                ellipse(i * ellipse_spread, (height / 2) - (largest_diameter / 2 + space_between) * multiplier, initial_diameter + i * ellipse_growth_factor, initial_diameter + i * ellipse_growth_factor);
            }
        } else {
            for (int i = 0; i < (width / ellipse_growth_factor); i++) {
                ellipse(width - i * ellipse_spread, (height / 2) + (largest_diameter / 2 + space_between) * multiplier, initial_diameter + i * ellipse_growth_factor, initial_diameter + i * ellipse_growth_factor);
            }
            for (int i = 0; i < (width / ellipse_growth_factor); i++) {
                ellipse(width - i * ellipse_spread, (height / 2) - (largest_diameter / 2 + space_between) * multiplier, initial_diameter + i * ellipse_growth_factor, initial_diameter + i * ellipse_growth_factor);
            }
        }
        multiplier++;
        height_of_iteration = ((height / 2) + (largest_diameter / 2 + space_between) * multiplier);
    }
    delay(500);
}

// square
// void draw() {
//     background(255);
//     // inputs
//     float square_spread = random(10, 100);
//     float square_growth_factor = random(1, 2);
//     float initial_extent = random(0, 100);
//     float space_between = random(10, 50);
//     println("square_spread: "+square_spread);
//     println("square_growth_factor: "+square_growth_factor);
//     println("initial_extent: "+initial_extent);
//     println("space_between: "+space_between);

//     // calculations
//     float largest_diameter = square_growth_factor * (width / square_spread) + initial_extent; 

//     // starting iteration, at half of screen height
//     for (int i = 0; i < (width / square_growth_factor); i++) {
//         square(i * square_spread, height / 2, initial_extent + i * square_growth_factor);
//     }
    
//     // calculate how many iterations are needed to fill the screen
//     int multiplier = 1;
//     float height_of_iteration = ((height / 2) + (largest_diameter / 2 + space_between) * multiplier);
//     while (height_of_iteration < (height + largest_diameter)){
//         // alternate between iterations starting from right and left
//         if(multiplier % 2 == 0){
//             for (int i = 0; i < (width / square_growth_factor); i++) {
//                 square(i * square_spread, (height / 2) + (largest_diameter / 2 + space_between) * multiplier, initial_extent + i * square_growth_factor);
//             }
//             for (int i = 0; i < (width / square_growth_factor); i++) {
//                 square(i * square_spread, (height / 2) - (largest_diameter / 2 + space_between) * multiplier, initial_extent + i * square_growth_factor);
//             }
//         } else {
//             for (int i = 0; i < (width / square_growth_factor); i++) {
//                 square(width - i * square_spread, (height / 2) + (largest_diameter / 2 + space_between) * multiplier, initial_extent + i * square_growth_factor);
//             }
//             for (int i = 0; i < (width / square_growth_factor); i++) {
//                 square(width - i * square_spread, (height / 2) - (largest_diameter / 2 + space_between) * multiplier, initial_extent + i * square_growth_factor);
//             }
//         }
//         multiplier++;
//         height_of_iteration = ((height / 2) + (largest_diameter / 2 + space_between) * multiplier);
//     }
//     delay(500);
// }