//Adam A - Final Project
//Click on screen to start
//Use arrow keys to move around
//Explore the maze and get as many points as you can find around the maze before you get stuck
int points = 0;
int set = 50;
int[] x = new int[500]; //array
int[] v = new int[500];
int[] y = new int[500];
int[] vw = new int[500];
int[] j = new int[500];
int[] jw = new int[500];
int px, py;
float[] pointx = new float[4];
float[] pointy = new float[pointx.length];
boolean[] gol = new boolean[pointx.length];
boolean up = true, down = true, left = true, right = true;


void setup() {

  size(600, 600); 
  px = width/2-10; //positioning self
  py = height/2-10;
  for (int i = 0; i < v.length; i++) {
    v[i] = (int)random(width);
    vw[i] = (int)random(set);
    x[i] = (int)random(20)*30;
    j[i] = (int)random(width);
    jw[i] = (int)random(set);
    y[i] = (int)random(20)*30;
  }
  for (int i = 0; i < pointx.length; i++) {
    pointx[i] = (int)random(width);
    pointy[i] = (int)random(height);
    gol[i] = true;
  }
}

void draw() {
  background(0);
  for (int i = 0; i < pointx.length; i++) {
    if (gol[i]) {
      stroke(255, 255, 0);
    } else {
      stroke(0);
    }
    strokeWeight(10); //points around the map
    point(pointx[i], pointy[i]);
    if (gol[i] && (dist(px, py, pointx[i], pointy[i]) <= 11)) {
      gol[i] = false;
      points++; //gain a point if close enough
    }
    if (pointx[i] < 0) {
      pointx[i] = width;
      pointy[i] = (int)random(height);
      gol[i] = true;
    }
    if (pointx[i] > width) {
      pointx[i] = 0;
      pointy[i] = (int)random(height);
      gol[i] = true;
    }

    if (pointy[i] < 0) {
      pointy[i] = height;
      pointx[i] = (int)random(width);
      gol[i] = true;
    }

    if (pointy[i] > height) {
      pointy[i] = 0;
      pointx[i] = (int)random(width);
      gol[i] = true;
    }
  }

  for (int i = 0; i < v.length; i++) {

    fill(0, 255, 0);
    noStroke();
    rect(x[i], v[i], 15, vw[i]);
    rect(j[i], y[i], jw[i], 15);

    if (x[i] + 15 < 0) {

      x[i] = width;
      v[i] = (int)random(width);
      vw[i] = (int)random(set);
    }

    if (j[i] + jw[i] < 0) {
      j[i] = width;
      jw[i] = (int)random(set);
      y[i] = (int)random(20)*30;
    }

    if (x[i] > width) {
      x[i] = -15;
      v[i] = (int)random(width);
      vw[i] = (int)random(set);
    }

    if (j[i] > width) {
      jw[i] = (int)random(set);
      y[i] = (int)random(20)*30;
      j[i] = -jw[i];
    }
    if (v[i] + vw[i] < 0) {
      v[i] = height;
      vw[i] = (int)random(set);
      x[i] = (int)random(20)*30;
    }

    if (y[i] + 15 < 0) {
      y[i] = height;
      j[i] = (int)random(width);
      jw[i] = (int)random(set);
    }

    if (v[i] > height) {

      vw[i] = (int)random(set);

      x[i] = (int)random(20)*30;

      v[i] = -vw[i];
    }

    if (y[i] > height) {

      y[i] = -15;

      j[i] = (int)random(width);

      jw[i] = (int)random(set);
    }

    strokeWeight(2);

    stroke(255);

    point(px, py);

    for (int e = 0; e < x.length; e++) {

      if (((px == j[e]) && (py <= y[e] + 15) && (py >= y[e])) || ((px == x[e]) && (py <= v[e] + vw[e]) && (py >= v[e]))) {

        right = false;
      }

      if (((px == j[e] + jw[e]) && (py <= y[e] + 15) && (py >= y[e])) || ((px == x[e] + 15) && (py <= v[e] + vw[e]) && (py >= v[e]))) {

        left = false;
      }

      if (((py == v[e]) && (px <= x[e] + 15) && (px >= x[e])) || ((py == y[e]) && (py <= j[e] + jw[e]) && (py >= j[e]))) {

        down = false;
      }

      if (((py == v[e] + vw[e]) && (px <= x[e] + 15) && (px >= x[e])) || ((py == y[e] + 15) && (py <= j[e] + jw[e]) && (py >= j[e]))) {

        up = false;
      }
    }
    
    fill(0);
    strokeWeight(3);
    stroke(255, 0, 0);
    rect(30, 510, 60, 60);
    fill(255);
    textSize(30);
    text(points, 50, 550);
    
    if (keyPressed && (key == CODED)) {

      if (up && (keyCode == UP)) {

        y[i] += 1;

        v[i] += 1;

        for (int e = 0; e < pointy.length; e++) {

          pointy[e] += 0.002;
        }
      }

      if (down && (keyCode == DOWN)) {

        y[i] -= 1;

        v[i] -= 1;

        for (int e = 0; e < pointy.length; e++) {

          pointy[e] -= 0.002;
        }
      }

      if (left && (keyCode == LEFT)) {

        x[i] += 1;

        j[i] += 1;

        for (int e = 0; e < pointx.length; e++) {

          pointx[e] += 0.002;
        }
      }

      if (right && (keyCode == RIGHT)) {

        x[i] -= 1;

        j[i] -= 1;

        for (int e = 0; e < pointx.length; e++) {

          pointx[e] -= 0.002;
        }
      }
    }

    up = true;

    down = true;

    left = true;

    right = true;
  }
}
