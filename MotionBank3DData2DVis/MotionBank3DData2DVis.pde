String [] data;
int index = 0;

void setup()
{
  size(800, 800, P3D);
  frameRate(25);
  data = loadStrings("Tracked3DPosition_25fps.txt");
  println(data.length);
  background(0);
}

void draw()
{
  background(0);

  fill(100);
  rect(0, 0, width, height);

  // Rohdaten in meter
  float x0 = float(data[index].split(" ")[0]);
  float y0 = float(data[index].split(" ")[1]);
  float z0 = float(data[index].split(" ")[2]);

  // Konvertieren in Pixel
  float xc = map(x0, 0, 12.472551, 0, width);
  float yc = map(y0, 0, 12.472551, 0, height);
  float zc = map(z0, 0, 12.472551, 0, height);
  
  ellipse(xc, yc, 50, 50);

  index++;
}

