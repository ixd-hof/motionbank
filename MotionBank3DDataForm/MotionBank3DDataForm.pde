import peasy.*;

PeasyCam cam;

String [] data;
int index = 0;
float distanz;

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
  cam.lookAt(width/2, height/2, 0);
}

void draw()
{
  background(0);

  fill(100);
  rect(0, 0, width, height);

  float x0 = float(data[index].split(" ")[0]);
  float y0 = float(data[index].split(" ")[1]);
  float z0 = float(data[index].split(" ")[2]);

  float xc = map(x0, 0, 12.472551, 0, width);
  float yc = map(y0, 0, 12.472551, 0, height);
  float zc = map(z0, 0, 12.472551, 0, height);
  
  translate(xc, yc, zc);
  fill(255);
  noStroke();
  sphere(20);

  index++;
}

