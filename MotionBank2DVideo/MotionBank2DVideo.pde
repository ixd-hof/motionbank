import processing.video.*;
Movie myMovie;

int index = 1;
String data [];

void setup()
{
  size(640, 360);
  frameRate(25);
  
  data = loadStrings("Tracked2DPos_CamCenter_25fps.txt");
  println(data.length);
  background(0);
  
  myMovie = new Movie(this, "D01T01_Ros_sync_Center_1.mp4");
  myMovie.loop();
}

void draw()
{
  myMovie.read();
  image(myMovie, 0, 0);
  //background(0);
  text(data[index], 20, 20);
  index++;
  
  float x0 = float(data[index-1].split(" ")[0]);
  float y0 = float(data[index-1].split(" ")[1]);
  PVector v0 = new PVector(x0, y0);
  
  float x1 = float(data[index].split(" ")[0]);
  float y1 = float(data[index].split(" ")[1]);
  PVector v1 = new PVector(x1, y1);
  
  float d = v0.dist(v1);
  
  float deltaY = y1 - y0;
  float deltaX = x1 - x0;
  float a = atan2(deltaY, deltaX);
  
  stroke(255);
  noFill();
  ellipse(x0/3.0, y0/3.0, 50, 50);
}
