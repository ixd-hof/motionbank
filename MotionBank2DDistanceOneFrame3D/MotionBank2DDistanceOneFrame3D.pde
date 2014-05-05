import nervoussystem.obj.*;

String [] data;

int counter = 0;
float d25 = 0;

float level = 0.1;

void setup()
{
  size(1000, 800, P3D);

  frameRate(100);
  data = loadStrings("Tracked3DPosition_25fps.txt");
  //println(data.length);
  background(0);

  noLoop();
  sphereDetail(5);
}

void draw()
{
  beginRecord("nervoussystem.obj.OBJExport", "filename.obj");


  background(0);


  for (int index=1; index<data.length-1; index+=10)
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

    pushMatrix();
    stroke(255);
    noFill();
    translate(x0*50, y0*50);
    sphere(d*20);
    //line(x0, y0, x1, y1);
    //println(d);
    //curveVertex(x0*50, y0*50);
    popMatrix();
  }

  endRecord();
}
