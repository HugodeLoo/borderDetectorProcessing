class EdgePoint{
  int x;
  int y;
  
  EdgePoint(int X, int Y){
   x = X;
   y = Y;
  }
  
  void display(){
    fill(#2EFA21);
    circle(x, y, 5);
  }
  int getX(){
   return x; 
  }
  int getY(){
   return y; 
  }
}
