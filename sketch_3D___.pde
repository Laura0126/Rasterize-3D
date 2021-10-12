PImage img;

void setup() {
  size(900, 900, P3D);
  img = loadImage("kirby.png");
  img.resize(900, 900);
}

void draw() {
  background(#f1f1f1);
  fill(0);
  noStroke();
  sphereDetail(3);
  
  float tiles = 100;
  float tileSize = width/tiles;
  
  push();
  
  translate(width / 2, height / 2);
  
  rotateY(radians(frameCount));
  
  for(int i = 0; i < tiles; i++) {
    for(int j = 0; j < tiles;  j++) {
      
      color c = img.get(int(i * tileSize), int(j * tileSize));
      float b = map(brightness(c), 0, 255, 0, 1);
      
      float z = map(b, 0, 1, -100, 100);
      
      push();
      translate(i * tileSize - width / 2, j * tileSize - height / 2, z);
      sphere(tileSize * b * 0.8);
      pop();
      
    }
  }
  
  pop();
  
}
