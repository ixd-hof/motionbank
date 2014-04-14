import peasy.*;

// SETTINGS

String pathToData = "/Volumes/MB_B3_02/CCL_DATA/"; // edit this to point to your local data copy!!
String recording = "D06T01";

// END SETTINGS

PieceMakerLoader pm;
PeasyCam cam;

String [] data;
int index = 0;

void setup()
{
  size( 800, 800, P3D );
  frameRate( 50 );
  
  pm = new PieceMakerLoader( pathToData );
  pm.load( recording );
  //println( pm.getSceneNames() );
  data = pm.getData( "curved path" );
  
  cam = new PeasyCam(this, 1000);
  cam.setMinimumDistance(50);
  cam.setMaximumDistance(1000);
  cam.lookAt(width/2, height/2, 0);
}

void draw ()
{
  background(0);

  fill(100);
  rect(0, 0, width, height);

  float x0 = float(data[index].split(" ")[0]);
  float y0 = float(data[index].split(" ")[1]);
  float z0 = float(data[index].split(" ")[2]);

  float xc = map(x0, 0, 12.472551, 0, width);
  float yc = map(y0, 12.472551, 0, 0, height);
  float zc = map(z0, 0, 12.472551, 0, height);
  
  translate(xc, yc, zc);
  fill(255);
  noStroke();
  sphere(20);

  index++;
  if ( index >= data.length ) index = 0;
}

