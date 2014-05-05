import org.philhosoft.p8g.svg.P8gGraphicsSVG;

String [] data;
//int index = 1;

PrintWriter output;

int counter = 0;
float d25 = 0;

float level = 0.1;
P8gGraphicsSVG svg;

void setup()
{
  size(1000, 800);

  svg = (P8gGraphicsSVG) createGraphics(width, height, P8gGraphicsSVG.SVG, "SineOnBezier.svg");

  frameRate(100);
  data = loadStrings("Tracked3DPosition_25fps.txt");
  //println(data.length);
  background(0);

  output = createWriter("positions.csv");

  noLoop();
}

void draw()
{

  beginRecord(svg);

  g.background(255);

  svg.clear(); // Discard previous frame
  svg.beginDraw(); // And record this one

  beginShape();

  background(0);


  for (int index=1; index<data.length-1; index+=50)
  {
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
    //ellipse(x0/2, y0/2, 50, 50);
    //line(x0, y0, x1, y1);
    //println(d);
    curveVertex(x0*50, y0*50);
  }

  endShape();
  
  svg.endRecord();
  println("Saved.");
}

/*
void keyPressed() {
  output.flush(); // Writes the remaining data to the file
  output.close(); // Finishes the file
  exit(); // Stops the program
}
*/

