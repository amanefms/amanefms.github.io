// 3DCG.pde
// 2020/11/1
// 2-3-47 Amane Fukami

ArrayList gear_list;
ArrayList gear1_list;
PImage image;
int N = 4; //個数
int n = 3;
float rotate = -PI/400.0;
float rotate2 = PI/130.0;
float rotate3 = -PI/70.0;
float n1_plus = 0;
float n2_plus = 0;
float t = 0;
int click = 0;
boolean move = true;
boolean open = false;

void setup(){
  size(800, 700, P3D);
  strokeWeight(3);
  gear_list = new ArrayList();
  gear1_list = new ArrayList();
  image = loadImage("mojiban.png");
  
  for(int i = 0; i < 2; i++){
    Gear2 gear = new Gear2();
    gear.x = i*75;
    gear.y = -i*95;
    gear.z = i*20;
    gear.r = 200;
    gear.n = 68;
    if(i == 1){
      gear.rotate = rotate;
    }else{
      gear.rotate = rotate2;
    }
    gear_list.add(gear);
  }
  Gear2 gear = new Gear2();
    gear.x = 80;
    gear.y = 80;
    gear.z = -20;
    gear.r = 150;
    gear.n = 60;
    gear.rotate = rotate3;
    gear_list.add(gear);   
  
    
  Gear gear1 = new Gear();
    gear1.x = 219;
    gear1.y = 80;
    gear1.z = -20;
    gear1.r = 150;
    gear1.n = 60;
    gear1.rotate = -rotate3;
    gear1_list.add(gear1);  
  
  Gear gear2 = new Gear();
    gear2.x = 219;
    gear2.y = 80;
    gear2.z = 50;
    gear2.r = 50;
    gear2.n = 20;
    gear2.rotate = -rotate3;
    gear1_list.add(gear2);
    
  Gear2 gear3 = new Gear2();
    gear3.x = 310;
    gear3.y = 80;
    gear3.z = 50;
    gear3.r = 150;
    gear3.n = 60;
    gear3.rotate = -rotate2;
    gear_list.add(gear3);   
    
  Gear gear4 = new Gear();
    gear4.x = 219;
    gear4.y = 80;
    gear4.z = 80;
    gear4.r = 150;
    gear4.n = 60;
    gear4.rotate = -rotate;
    gear1_list.add(gear4);
}

void draw(){
  background(250, 250, 255);
  stroke(0);
  translate(width/2, height/2, -3000);
  camera((2000-click*20)*sin(radians(mouseX)), -300, (2000-click*20)*cos(radians(mouseX)), 0, 0, 0, 0, 1, 0);
  for(int i = 0; i < N; i++){
    Gear2 gear = (Gear2)gear_list.get(i);
    gear.draw();
  }
  for(int i = 0; i < n; i++){
    Gear gear1 = (Gear)gear1_list.get(i);
    gear1.draw();
  }
  pushMatrix();
  translate(219, 80, 50);
  box(2, 2, 200);
  line(0, 0, 95, 200/2*cos(2*PI+n1_plus), 200/2*sin(2*PI+n1_plus), 95);
  line(0, 0, 100, 500/2*cos(2*PI+n2_plus), 500/2*sin(2*PI+n2_plus), 100);
  if(move){
    n1_plus += -rotate;
    n2_plus += -rotate3;
  }
  popMatrix();
  
  if(open && t < 25){
    pushMatrix();
    stroke(0);
    translate(219, 80, 140);
    if(5 < t){
      //move = false;
      line(-50, -300, 50, -200);
      if(10 < t){
        line(50, -200, -50, -100);
        if(15 < t){
          line(-50, -100, 50, 0);
          if(19 < t){
            line(50, 0, -50, 100);
            if(22 < t){
              line(-50, 100, 50, 200);
              if(24 < t){
                line(50, 200, -50, 300);
              }
            }
          }
        }
      }
    }
    popMatrix();
    t+=0.1;
  }
  if(t < 25){
    pushMatrix();
    fill(255);
    translate(219, 80, 130);
    translate(0, 0, -200);
    ellipse(0, 0, 600, 600);
    noStroke();
    fill(0);
    translate(0, 0, 199);
    rect(-200, -2000, 400, 4000);
    translate(0, 0, 1);
    image(image, -300, -300);
    popMatrix();
  }
  if(mousePressed == true){
    if(mouseButton == LEFT){
      click++;
    }else if(mouseButton == RIGHT){
      click--;
    }
  }
}

class Gear{
  float x;
  float y;
  float z;
  float r;
  int n; //歯車の数
  float plus;
  float rotate;
  
  void draw(){
    fill(128);
    beginShape();
    for(int i=0; i<n; i++){
      if(i%2 == 0){
        vertex(x+r/2*cos(2*PI*i/n+plus), y+r/2*sin(2*PI*i/n+plus), z+10);
      }else{
        vertex(x+(r-30)/2*cos(2*PI*i/n+plus), y+(r-30)/2*sin(2*PI*i/n+plus), z+10);
      }
    }
    endShape(CLOSE);
    
    beginShape();
    for(int i=0; i<n; i++){
      if(i%2 == 0){
        vertex(x+r/2*cos(2*PI*i/n+plus), y+r/2*sin(2*PI*i/n+plus), z+30);
      }else{
        vertex(x+(r-30)/2*cos(2*PI*i/n+plus), y+(r-30)/2*sin(2*PI*i/n+plus), z+30);
      }
    }
    endShape(CLOSE);
    
    beginShape();
    for(int i=0; i<n; i++){
      if(i%2 == 0){
        vertex(x+r/2*cos(2*PI*i/n+plus), y+r/2*sin(2*PI*i/n+plus), z+10);
        vertex(x+r/2*cos(2*PI*i/n+plus), y+r/2*sin(2*PI*i/n+plus), z+30);
      }else{
        vertex(x+(r-30)/2*cos(2*PI*i/n+plus), y+(r-30)/2*sin(2*PI*i/n+plus), z+30);
        vertex(x+(r-30)/2*cos(2*PI*i/n+plus), y+(r-30)/2*sin(2*PI*i/n+plus), z+10);
      }
    }
    endShape(CLOSE);
    noFill();
    if(move){
      plus += rotate;
    }
  }
}

class Gear2{
  float x;
  float y;
  float z;
  float r;
  int n; //歯車の数
  float plus;
  float rotate;
  
  void draw(){
    fill(128);
    beginShape();
    for(int i=0; i<n; i++){
      if(i%2 == 0){
        vertex(x+r/2*cos(2*PI*i/n+plus), y+r/2*sin(2*PI*i/n+plus), z+10);
      }else{
        vertex(x+(r-30)/2*cos(2*PI*i/n+plus), y+(r-30)/2*sin(2*PI*i/n+plus), z+10);
      }
    }
    endShape(CLOSE);
    
    beginShape();
    for(int i=0; i<n; i++){
      if(i%2 == 0){
        vertex(x+r/2*cos(2*PI*i/n+plus), y+r/2*sin(2*PI*i/n+plus), z+30);
      }else{
        vertex(x+(r-30)/2*cos(2*PI*i/n+plus), y+(r-30)/2*sin(2*PI*i/n+plus), z+30);
      }
    }
    endShape(CLOSE);
    
    beginShape();
    for(int i=0; i<n; i++){
      if(i%2 == 0){
        vertex(x+r/2*cos(2*PI*i/n+plus), y+r/2*sin(2*PI*i/n+plus), z+10);
        vertex(x+r/2*cos(2*PI*i/n+plus), y+r/2*sin(2*PI*i/n+plus), z+30);
      }else{
        vertex(x+(r-30)/2*cos(2*PI*i/n+plus), y+(r-30)/2*sin(2*PI*i/n+plus), z+30);
        vertex(x+(r-30)/2*cos(2*PI*i/n+plus), y+(r-30)/2*sin(2*PI*i/n+plus), z+10);
      }
    }
    endShape(CLOSE);
    noFill();
    
    float z2 = z+20;
    float r2 = r/3;
    int n2 = n/3;
    fill(128);
    beginShape();
    for(int i=0; i<n2; i++){
      if(i%2 == 0){
        vertex(x+r2/2*cos(2*PI*i/n2+plus), y+r2/2*sin(2*PI*i/n2+plus), z2+10);
      }else{
        vertex(x+(r2-30)/2*cos(2*PI*i/n2+plus), y+(r2-30)/2*sin(2*PI*i/n2+plus), z2+10);
      }
    }
    endShape(CLOSE);
    
    beginShape();
    for(int i=0; i<n2; i++){
      if(i%2 == 0){
        vertex(x+r2/2*cos(2*PI*i/n2+plus), y+r2/2*sin(2*PI*i/n2+plus), z2+30);
      }else{
        vertex(x+(r2-30)/2*cos(2*PI*i/n2+plus), y+(r2-30)/2*sin(2*PI*i/n2+plus), z2+30);
      }
    }
    endShape(CLOSE);
    
    beginShape();
    for(int i=0; i<n2; i++){
      if(i%2 == 0){
        vertex(x+r2/2*cos(2*PI*i/n2+plus), y+r2/2*sin(2*PI*i/n2+plus), z2+10);
        vertex(x+r2/2*cos(2*PI*i/n2+plus), y+r2/2*sin(2*PI*i/n2+plus), z2+30);
      }else{
        vertex(x+(r2-30)/2*cos(2*PI*i/n2+plus), y+(r2-30)/2*sin(2*PI*i/n2+plus), z2+30);
        vertex(x+(r2-30)/2*cos(2*PI*i/n2+plus), y+(r2-30)/2*sin(2*PI*i/n2+plus), z2+10);
      }
    }
    endShape(CLOSE);
    noFill();
    if(move){
      plus += rotate;
    }
  }  
}

void keyPressed(){
  if(key == ' '){
    if(open == false){
      open = true;
    }else{
      t = 0;
      open = false;
    }
  }else{
    if(move == false){
      move = true;
    }else{
      move = false;
    }
  }
}