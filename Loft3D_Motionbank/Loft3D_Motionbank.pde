import peasy.*;

PeasyCam cam;

String [] data;
int index = 0;
float distanz;
float res = 6.0;

void setup()
{
  size(800, 800, P3D);
  frameRate(25);
  data = loadStrings("Tracked3DPosition_25fps.txt");
  println(data.length);
  background(0);

  cam = new PeasyCam(this, 500);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(1000);
  cam.lookAt(0, 0, 0);
}

void draw()
{
  background(0);

  //fill(100);
  //rect(0, 0, width, height);

  int step = 100;
  int h = 0;
  for (int i=0; i<data.length-2*step; i+=step) // oder += step
  {
    // First point
    float x0 = float(data[i].split(" ")[0]);
    float y0 = float(data[i].split(" ")[1]);
    float z0 = float(data[i].split(" ")[2]);
    PVector v0 = new PVector(x0, y0, z0);

    // Next point
    float x1 = float(data[i+step].split(" ")[0]);
    float y1 = float(data[i+step].split(" ")[1]);
    float z1 = float(data[i+step].split(" ")[2]);
    PVector v1 = new PVector(x1, y1, z1);

    // Next next point (next radius)
    float x2 = float(data[i+2*step].split(" ")[0]);
    float y2 = float(data[i+2*step].split(" ")[1]);
    float z2 = float(data[i+2*step].split(" ")[2]);
    PVector v2 = new PVector(x2, y2, z2);

    // Distance
    float d = v0.dist(v1);
    float d2 = v1.dist(v2);

    // Angle
    float deltaY = y1 - y0;
    float deltaX = x1 - x0;
    float a = atan2(deltaY, deltaX);

    // Draw quads around circle
    // x = cx + r * cos(a)
    // y = cy + r * sin(a)

    float step_r = 2*PI/res;
    for (int r=0; r<2*PI; r+=step_r)
    {
      float px0 = d * cos(r);
      float py0 = d * sin(r);
      float px1 = d * cos(r+step_r);
      float py1 = d * sin(r+step_r);
      float px2 = d2 * cos(r+step_r);
      float py2 = d2 * sin(r+step_r);
      float px3 = d2 * cos(r);
      float py3 = d2 * sin(r);

      noFill();
      stroke(255);
      beginShape(QUADS);
      vertex(px0, h, py0);
      vertex(px1, h, py1);
      vertex(px2, h+d, py2);
      vertex(px3, h+d, py3);
      endShape(CLOSE);
    }
    h += d;
  }
}

