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
  
  int x = int(data[index].split(" ")[0]);
  int y = int(data[index].split(" ")[1]);
  
  stroke(255);
  noFill();
  ellipse(x/2, y/2, 50, 50);
  println(x+" "+y);
}
