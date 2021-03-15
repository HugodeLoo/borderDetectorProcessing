PImage img;
ArrayList <EdgePoint> points = new ArrayList<EdgePoint>();
int currentX = 0;
int currentY = 0;

void setup(){
  img = loadImage("street.jpg");
  img.resize(img.width/2 , img.height/2);
  size(1080, 720);
  image(img, 0, 0);
  
  for(int i = 0; i < 720; i++){
    currentX = 0;
   for (int j = 0; j < 1080; j++){
     contrastor(currentX, currentY);
     currentX++;
   }
    currentY++;
  }
  findBorders();
}

void draw(){
  image(img, 0, 0);
  for(int k = 0; k < points.size(); k++){
    EdgePoint p = points.get(k);
   p.display();
  }
  
}

void findBorders(){
  currentY = 0;
  color a;
  color b;
  float hue1;
  float hue2;
  float deltaHue;
  for(int i = 0; i < 720; i++){
    currentX = 0;
   for (int j = 0; j < 1080; j++){
     if(currentX < width){
     a = get(currentX, currentY);
     b = get(currentX+1, currentY+1);
     } else {
     a = get(currentX, currentY);
     b = get(currentX-1, currentY-1);
     }
     hue1 = brightness(a);
     hue2 = brightness(b);
     deltaHue = hue2 - hue1;
    if (deltaHue < 0){
       deltaHue = deltaHue * -1; 
    }
    if (deltaHue > 100){
       points.add(new EdgePoint(currentX, currentY));
    }
     currentX++;
   }
    currentY++;
  }
}

void contrastor(int X1, int Y1){
  color a = get(X1, Y1);
  float hue1 = 0;
  float bri1 = brightness(a);
  float sat1 = saturation(a);
  
  if (saturation(a) > 50){
    sat1 = 100;
  } else if (saturation(a) < 50) {
    sat1 = 0;
  }
  if (brightness(a) > 80){
    bri1 = 100;
  } else if (brightness(a) < 80) {
    bri1 = 0;
  }
  hue1 = bri1 * 2 / sat1 * 2;
  a = color(hue1, hue1, hue1);
  set(X1, Y1, a);
  
  
  
}
