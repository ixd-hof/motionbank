String [] data;
int index = 0;
float distanz;

PVector [] path;
int nearest = -1;

void setup()
{
  size(800, 800, P3D);
  //frameRate(25);
  smooth();

  data = loadStrings("Tracked3DPosition_25fps.txt");
  println(data.length);
  background(0);

  path = new PVector[data.length];
  for (int i=0; i<path.length; i++)
  {
    float x0 = float(data[i].split(" ")[0]);
    float y0 = float(data[i].split(" ")[1]);
    float z0 = float(data[i].split(" ")[2]);

    float xc = map(x0, 0, 12.472551, 0, width);
    float yc = map(y0, 0, 12.472551, 0, height);
    float zc = map(z0, 0, 12.472551, 0, height);

    path[i] = new PVector((int)xc, (int)yc);
  }
  println(path.length);
}

void draw()
{
  background(0);

  noFill();
  stroke(255);

  PVector mouse = new PVector(mouseX, mouseY);

  int step = 100;

  // Pfad zeichnen
  beginShape();
  for (int i=0; i<path.length-2; i+=step)
  {
    curveVertex(path[i].x, path[i].y);
  }
  endShape();


  // Nearest testen
  float d = 100000;

  for (int i=0; i<path.length-2; i+=step)
  {
    float dm = mouse.dist(path[i]);
    if (dm < d)
    {
      d = dm;
      nearest = i;
    }

    ellipse(path[i].x, path[i].y, 10, 10);
  }

  // Nearest und ID zeichnen
  if (nearest != -1)
  {
    fill(255);
    ellipse(path[nearest].x, path[nearest].y, 10, 10);
    text(nearest, path[nearest].x+10, path[nearest].y);
  }
}

