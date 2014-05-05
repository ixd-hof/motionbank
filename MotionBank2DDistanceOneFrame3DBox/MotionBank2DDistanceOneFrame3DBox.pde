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
    float z0 = float(data[index-1].split(" ")[2]);
    PVector v0 = new PVector(x0, z0, y0); // y geht hier nach oben, im dataset nach hinten

    float x1 = float(data[index].split(" ")[0]);
    float y1 = float(data[index].split(" ")[1]);
    float y1 = float(data[index].split(" ")[2]);
    PVector v1 = new PVector(x1, z1, y1);

    float d = v0.dist(v1);

    float deltaY = v1.y - v0.y;
    float deltaX = v1.x - v0.x;
    float a = atan2(deltaY, deltaX);

    pushMatrix();
    stroke(255);
    noFill();
    translate(v0.x*50, (v0.y*50)/2.0, v0.z*50); // in die mitte der Höhe wg. Box
    //sphere(d*20);
    rotateY(a);
    box(d*20, v0.y, d); 
    //line(x0, y0, x1, y1);
    //println(d);
    //curveVertex(x0*50, y0*50);
    popMatrix();
  }

  endRecord();
}
