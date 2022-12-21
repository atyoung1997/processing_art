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