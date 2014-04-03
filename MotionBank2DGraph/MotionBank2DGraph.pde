String [] data;
int index = 0;

void setup()
{
  size(1000, 800);
  frameRate(100);
  data = loadStrings("Tracked2DPos_CamCenter_25fps.txt");
  println(data.length);
  background(0);
}

void draw()
{
  fill(0, 5);
  noStroke();
  rect(0, 0, width, height);

  //background(0);
  text(data[index], 20, 20);
  index++;

  int x0 = int(data[index].split(" ")[0]);
  int y0 = int(data[index].split(" ")[1]);

  PVector v0 = new PVector(x0, y0);

  int x1 = int(data[index+1].split(" ")[0]);
  int y1 = int(data[index+1].split(" ")[1]);

  PVector v1 = new PVector(x1, y1);

  //float a = PVector.angleBetween(v0, v1);
  float d = v0.dist(v1);
  float deltaY = y1 - y0;
  float deltaX = x1 - x0;
  float a = atan2(deltaY, deltaX);

  stroke(255);
  noFill();
  translate(v0.x/2, v0.y/2);
  ellipse(0, 0, 50, 50);

  println(a);
  rotate(a);
  line(0, 0, d*100, 0);
}

