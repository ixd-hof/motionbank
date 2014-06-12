import SimpleOpenNI.*;
import peasy.*;

PeasyCam cam;

int index = 1;
float distanz;

// Recorded session
Skeleton sk;

// Live session
PImage depth_img;
PImage rgb_img;

SimpleOpenNI kinect;

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

  // Enable OpenNI / Kinect with live camera
  //kinect = new SimpleOpenNI(this);

  // Enable OpenNI with pre recorded .oni file
  kinect = new SimpleOpenNI(this, "ml.oni");

  kinect.setMirror(true);
  kinect.enableDepth(); // Kinect depth image
  kinect.enableRGB(); // Kinect color image
  kinect.enableUser(); // enable skeleton
}

void draw()
{
  background(0);

  //fill(100);
  //rect(0, 0, width, height);

  // update OpenNI (live)
  kinect.update();
  
  depth_img = kinect.depthImage();
  //rgb_img = kinect.rgbImage();
  
  // display despth image
  image(depth_img, 0, 0);

  // update recorded skeleton
  sk.update();
  //println(sk.index);

  //println(sk.frame + " " + sk.validity);
  //println(sk.SKELETON_POSITION_HEAD);

  fill(200);
  noStroke();

  //rotateX(PI/2.0);
  //translate(width/2, 100, -height/2);

  pushMatrix();
  translate(sk.SKELETON_POSITION_HEAD.x, sk.SKELETON_POSITION_HEAD.y, sk.SKELETON_POSITION_HEAD.z);
  sphere(20);
  popMatrix();

  pushMatrix();
  translate(sk.SKELETON_POSITION_HAND_LEFT.x, sk.SKELETON_POSITION_HAND_LEFT.y, sk.SKELETON_POSITION_HAND_LEFT.z);
  sphere(10);
  popMatrix();

  pushMatrix();
  translate(sk.SKELETON_POSITION_HAND_RIGHT.x, sk.SKELETON_POSITION_HAND_RIGHT.y, sk.SKELETON_POSITION_HAND_RIGHT.z);
  sphere(10);
  popMatrix();

  pushMatrix();
  translate(sk.SKELETON_POSITION_HIP_LEFT.x, sk.SKELETON_POSITION_HIP_LEFT.y, sk.SKELETON_POSITION_HIP_LEFT.z);
  sphere(10);
  popMatrix();

  pushMatrix();
  translate(sk.SKELETON_POSITION_HIP_RIGHT.x, sk.SKELETON_POSITION_HIP_RIGHT.y, sk.SKELETON_POSITION_HIP_RIGHT.z);
  sphere(10);
  popMatrix();

  pushMatrix();
  translate(sk.SKELETON_POSITION_FOOT_LEFT.x, sk.SKELETON_POSITION_FOOT_LEFT.y, sk.SKELETON_POSITION_FOOT_LEFT.z);
  sphere(10);
  popMatrix();

  pushMatrix();
  translate(sk.SKELETON_POSITION_FOOT_RIGHT.x, sk.SKELETON_POSITION_FOOT_RIGHT.y, sk.SKELETON_POSITION_FOOT_RIGHT.z);
  sphere(10);
  popMatrix();


  // update skeleton
  boolean tracking = updateSketeton();

  if (tracking = true)
  {
    fill(255, 100, 0);
    
    pushMatrix();
    translate(SKEL_HEAD.x, SKEL_HEAD.y, SKEL_HEAD.z);
    sphere(10);
    popMatrix();
    
    pushMatrix();
    translate(SKEL_LEFT_HAND.x, SKEL_LEFT_HAND.y, SKEL_LEFT_HAND.z);
    sphere(10);
    popMatrix();

    fill(255, 100, 255);
    pushMatrix();
    translate(SKEL_RIGHT_HAND.x, SKEL_RIGHT_HAND.y, SKEL_RIGHT_HAND.z);
    sphere(10);
    popMatrix();

    fill(255, 100, 0);
    pushMatrix();
    translate(SKEL_LEFT_FOOT.x, SKEL_LEFT_FOOT.y, SKEL_LEFT_FOOT.z);
    sphere(10);
    popMatrix();

    fill(255, 100, 255);
    pushMatrix();
    translate(SKEL_RIGHT_FOOT.x, SKEL_RIGHT_FOOT.y, SKEL_RIGHT_FOOT.z);
    sphere(10);
    popMatrix();
    
    fill(255, 100, 255);
    pushMatrix();
    translate(SKEL_LEFT_HIP.x, SKEL_LEFT_HIP.y, SKEL_LEFT_HIP.z);
    sphere(10);
    popMatrix();
    
    fill(255, 100, 255);
    pushMatrix();
    translate(SKEL_RIGHT_HIP.x, SKEL_RIGHT_HIP.y, SKEL_RIGHT_HIP.z);
    sphere(10);
    popMatrix();
  }
}

