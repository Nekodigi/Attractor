void attract(PVector origin, PVector target) {//based on this site
  // calculate distance
  float dx = origin.x - target.x;
  float dy = origin.y - target.y;
  float d = mag(dx, dy);

  if (d > 0 && d < radius) {
    // calculate force
    float s = pow(d / radius, 1 / ramp);
    float f = s * 9 * strength * (1 / (s + 1) + ((s - 3) / 4)) / d;

    // apply force to node velocity
    // swapping of dx and dy makes the twirl
    target.x += dy * f;
    target.y -= dx * f;
  }
}
