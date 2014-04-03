import ddf.minim.*;

Minim minim;
AudioPlayer player;

void setup()
{
  size(512, 200, P3D);
  
  minim = new Minim(this);
  player = minim.loadFile("ros.mp3");
  
  // Plays the file on start once
  player.play();
  
  // Enables looping (never ends)
  //player.loop();
}

void draw()
{
  background(0);
  stroke(255);
  noFill();
  
  rectMode(CENTER);
  
  // Display the waveform
  // bufferSize = 1024
  // values are about -10 - +10
  // Audioinput delivers mix, left, right
  for(int i=0; i<player.bufferSize()-1; i+=2)
  {
    float mix = player.mix.get(i);
    float mix_y = map(mix, -1, 1, -height/2, height/2);
    rect(i/2, height/2, 1, mix_y);
  }
  
  // Display the level
  float mix_level = map(player.mix.level(), 0, 0.25, 0, height/2);
  ellipse(width/2, height/2, mix_level, mix_level);
}

void mousePressed()
{
  // Rewinds player
  player.rewind();
  // Plays sample again
  player.play();
}
