class Skeleton
{
  String [] data;
  int length = 0;
  int index = 0;
  
  PVector SKELETON_POSITION_HIP_CENTER, SKELETON_POSITION_SPINE, SKELETON_POSITION_SHOULDER_CENTER, SKELETON_POSITION_HEAD, SKELETON_POSITION_SHOULDER_LEFT, SKELETON_POSITION_ELBOW_LEFT, SKELETON_POSITION_WRIST_LEFT, SKELETON_POSITION_HAND_LEFT, SKELETON_POSITION_SHOULDER_RIGHT, SKELETON_POSITION_ELBOW_RIGHT, SKELETON_POSITION_WRIST_RIGHT, SKELETON_POSITION_HAND_RIGHT, SKELETON_POSITION_HIP_LEFT, SKELETON_POSITION_KNEE_LEFT, SKELETON_POSITION_ANKLE_LEFT, SKELETON_POSITION_FOOT_LEFT, SKELETON_POSITION_HIP_RIGHT, SKELETON_POSITION_KNEE_RIGHT, SKELETON_POSITION_ANKLE_RIGHT, SKELETON_POSITION_FOOT_RIGHT;
  int frame;
  boolean validity;

  Skeleton (String file) {
    data = loadStrings(file);
    length = data.length;
  }

  void update()
  {
    index ++;

    String [] line = data[index+1].split(",");
    
    frame = int(line[0]);
    validity = boolean(line[1]);
    int timestamp = int(line[2]);
    boolean trackedskeleton = boolean(line[3]);
    
    String [] coord = line[4].replace("(", "").replace(")", "").trim().split(" ");
    SKELETON_POSITION_HIP_CENTER = new PVector(float(coord[0]), float(coord[1]), float(coord[2]));
    coord = line[5].replace("(", "").replace(")", "").trim().split(" ");
    SKELETON_POSITION_SPINE = new PVector(float(coord[0]), float(coord[1]), float(coord[2]));
    coord = line[6].replace("(", "").replace(")", "").trim().split(" ");
    SKELETON_POSITION_SHOULDER_CENTER = new PVector(float(coord[0]), float(coord[1]), float(coord[2]));
    coord = line[7].replace("(", "").replace(")", "").trim().split(" ");
    SKELETON_POSITION_HEAD = new PVector(float(coord[0]), float(coord[1]), float(coord[2]));
    coord = line[8].replace("(", "").replace(")", "").trim().split(" ");
    SKELETON_POSITION_SHOULDER_LEFT = new PVector(float(coord[0]), float(coord[1]), float(coord[2]));
    coord = line[9].replace("(", "").replace(")", "").trim().split(" ");
    SKELETON_POSITION_ELBOW_LEFT = new PVector(float(coord[0]), float(coord[1]), float(coord[2]));
    coord = line[10].replace("(", "").replace(")", "").trim().split(" ");
    SKELETON_POSITION_WRIST_LEFT = new PVector(float(coord[0]), float(coord[1]), float(coord[2]));
    coord = line[11].replace("(", "").replace(")", "").trim().split(" ");
    SKELETON_POSITION_HAND_LEFT = new PVector(float(coord[0]), float(coord[1]), float(coord[2]));
    coord = line[12].replace("(", "").replace(")", "").trim().split(" ");
    SKELETON_POSITION_SHOULDER_RIGHT = new PVector(float(coord[0]), float(coord[1]), float(coord[2]));
    coord = line[13].replace("(", "").replace(")", "").trim().split(" ");
    SKELETON_POSITION_ELBOW_RIGHT = new PVector(float(coord[0]), float(coord[1]), float(coord[2]));
    coord = line[14].replace("(", "").replace(")", "").trim().split(" ");
    SKELETON_POSITION_WRIST_RIGHT = new PVector(float(coord[0]), float(coord[1]), float(coord[2]));
    coord = line[15].replace("(", "").replace(")", "").trim().split(" ");
    SKELETON_POSITION_HAND_RIGHT = new PVector(float(coord[0]), float(coord[1]), float(coord[2]));
    coord = line[16].replace("(", "").replace(")", "").trim().split(" ");
    SKELETON_POSITION_HIP_LEFT = new PVector(float(coord[0]), float(coord[1]), float(coord[2]));
    coord = line[17].replace("(", "").replace(")", "").trim().split(" ");
    SKELETON_POSITION_KNEE_LEFT = new PVector(float(coord[0]), float(coord[1]), float(coord[2]));
    coord = line[18].replace("(", "").replace(")", "").trim().split(" ");
    SKELETON_POSITION_ANKLE_LEFT = new PVector(float(coord[0]), float(coord[1]), float(coord[2]));
    coord = line[19].replace("(", "").replace(")", "").trim().split(" ");
    SKELETON_POSITION_FOOT_LEFT = new PVector(float(coord[0]), float(coord[1]), float(coord[2]));
    coord = line[20].replace("(", "").replace(")", "").trim().split(" ");
    SKELETON_POSITION_HIP_RIGHT = new PVector(float(coord[0]), float(coord[1]), float(coord[2]));
    coord = line[21].replace("(", "").replace(")", "").trim().split(" ");
    SKELETON_POSITION_KNEE_RIGHT = new PVector(float(coord[0]), float(coord[1]), float(coord[2]));
    coord = line[22].replace("(", "").replace(")", "").trim().split(" ");
    SKELETON_POSITION_ANKLE_RIGHT = new PVector(float(coord[0]), float(coord[1]), float(coord[2]));
    coord = line[23].replace("(", "").replace(")", "").trim().split(" ");
    SKELETON_POSITION_FOOT_RIGHT = new PVector(float(coord[0]), float(coord[1]), float(coord[2]));
  }
}

