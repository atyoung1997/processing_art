// light purple, mint, and butter
int[] r_values = { 170, 197, 255 };
int[] g_values = { 150, 250, 255 };
int[] b_values = { 218, 213, 210 };
// beige, black, tan
// int[] r_values = { 221, 32, 224 };
// int[] g_values = { 195, 30, 169 };
// int[] b_values = { 165, 32, 109 };
// coral, spiced apple, and peach
// int[] r_values = { 252, 120, 241 };
// int[] g_values = { 118, 57, 172 };
// int[] b_values = { 106, 55, 136 };
// raspberry and blues
// int[] r_values = { 138, 121, 104 };
// int[] g_values = { 48, 167, 131 };
// int[] b_values = { 127, 211, 188 };


void setup() {
    size(1000, 1000);
    background(255);
    rectMode(CENTER);
    //noLoop();
}

// ellipse
void draw() {
    background(0);
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
    int num_colors = r_values.length;
    // starting iteration, at half of screen height
    for (int i = 0; i < (width / ellipse_growth_factor); i++) {
        fill(r_values[i % num_colors], g_values[i % num_colors], b_values[i % num_colors]);
        ellipse(i * ellipse_spread, height / 2, initial_diameter + i * ellipse_growth_factor, initial_diameter + i * ellipse_growth_factor);
    }
    
    // calculate how many iterations are needed to fill the screen
    int multiplier = 1;
    float height_of_iteration = ((height / 2) + (largest_diameter / 2 + space_between) * multiplier);
    while (height_of_iteration < (height + largest_diameter)){
        // alternate between iterations starting from right and left
        if(multiplier % 2 == 0){
            for (int i = 0; i < (width / ellipse_growth_factor); i++) {
                fill(r_values[i % num_colors], g_values[i % num_colors], b_values[i % num_colors]);
                ellipse(i * ellipse_spread, (height / 2) + (largest_diameter / 2 + space_between) * multiplier, initial_diameter + i * ellipse_growth_factor, initial_diameter + i * ellipse_growth_factor);
            }
            for (int i = 0; i < (width / ellipse_growth_factor); i++) {
                fill(r_values[i % num_colors], g_values[i % num_colors], b_values[i % num_colors]);
                ellipse(i * ellipse_spread, (height / 2) - (largest_diameter / 2 + space_between) * multiplier, initial_diameter + i * ellipse_growth_factor, initial_diameter + i * ellipse_growth_factor);
            }
        } else {
            for (int i = 0; i < (width / ellipse_growth_factor); i++) {
                fill(r_values[i % num_colors], g_values[i % num_colors], b_values[i % num_colors]);
                ellipse(width - i * ellipse_spread, (height / 2) + (largest_diameter / 2 + space_between) * multiplier, initial_diameter + i * ellipse_growth_factor, initial_diameter + i * ellipse_growth_factor);
            }
            for (int i = 0; i < (width / ellipse_growth_factor); i++) {
                fill(r_values[i % num_colors], g_values[i % num_colors], b_values[i % num_colors]);
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