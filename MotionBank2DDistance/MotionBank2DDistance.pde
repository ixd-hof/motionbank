String [] data;
int index = 1;

PrintWriter output;

int counter = 0;
float d25 = 0;

void setup()
{
  size(1000, 800);
  frameRate(100);
  data = loadStrings("Tracked2DPos_CamCenter_25fps.txt");
  println(data.length);
  background(0);
  
  output = createWriter("positions.csv"); 
}

void draw()
{
  fill(0, 5);
  noStroke();
  rect(0, 0, width, height);
  
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
  
  if (counter<25)
   {
     d25 += d;
     counter ++;
   }
   else
   {
     output.println(d25);
     counter = 0;
     d25 = 0;
   }
  //output.println(d);
  
  
  
  stroke(255);
  noFill();
  ellipse(x0/2, y0/2, 50, 50);
  println(d);
}

void keyPressed() {
  output.flush(); // Writes the remaining data to the file
  output.close(); // Finishes the file
  exit(); // Stops the program
}
