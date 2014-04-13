import peasy.*;

PeasyCam cam;

int index = 1;
float distanz;

Skeleton sk;

void setup()
{
  size(800, 800, P3D);
  frameRate(30);
  background(0);
  
  sk = new Skeleton("FusedSkeletonData_Position_MappedTo30FPS.txt");

  cam = new PeasyCam(this, 500);
  cam.setMinimumDistance(10);
  cam.setMaximumDistance(2000);
  cam.lookAt(width/2, height/2, 0);
}

void draw()
{
  background(0);

  fill(100);
  rect(0, 0, width, height);

  sk.update();
  println(sk.index);
  
  //println(sk.frame + " " + sk.validity);
  println(sk.SKELETON_POSITION_HEAD);

  fill(255);
  noStroke();
  
  rotateX(PI/2.0);
  translate(width/2, 100, -height/2);
  
  pushMatrix();
  translate(sk.SKELETON_POSITION_HEAD.x*100, sk.SKELETON_POSITION_HEAD.y*100, sk.SKELETON_POSITION_HEAD.z*100);
  sphere(20);
  popMatrix();
  
  pushMatrix();
  translate(sk.SKELETON_POSITION_HAND_LEFT.x*100, sk.SKELETON_POSITION_HAND_LEFT.y*100, sk.SKELETON_POSITION_HAND_LEFT.z*100);
  sphere(10);
  popMatrix();
  
  pushMatrix();
  translate(sk.SKELETON_POSITION_HAND_RIGHT.x*100, sk.SKELETON_POSITION_HAND_RIGHT.y*100, sk.SKELETON_POSITION_HAND_RIGHT.z*100);
  sphere(10);
  popMatrix();
  
  pushMatrix();
  translate(sk.SKELETON_POSITION_HIP_LEFT.x*100, sk.SKELETON_POSITION_HIP_LEFT.y*100, sk.SKELETON_POSITION_HIP_LEFT.z*100);
  sphere(10);
  popMatrix();
  
  pushMatrix();
  translate(sk.SKELETON_POSITION_HIP_RIGHT.x*100, sk.SKELETON_POSITION_HIP_RIGHT.y*100, sk.SKELETON_POSITION_HIP_RIGHT.z*100);
  sphere(10);
  popMatrix();
  
  pushMatrix();
  translate(sk.SKELETON_POSITION_FOOT_LEFT.x*100, sk.SKELETON_POSITION_FOOT_LEFT.y*100, sk.SKELETON_POSITION_FOOT_LEFT.z*100);
  sphere(10);
  popMatrix();
  
  pushMatrix();
  translate(sk.SKELETON_POSITION_FOOT_RIGHT.x*100, sk.SKELETON_POSITION_FOOT_RIGHT.y*100, sk.SKELETON_POSITION_FOOT_RIGHT.z*100);
  sphere(10);
  popMatrix();
  
  
}

