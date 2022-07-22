// 2020/08/09
// 2-3-47 Amane Fukami

float delay = 28;  //テキストとボックスの動作開始時間の差[ms]

float delay1 = delay * 0.0036;

Text mailbox;
Box [] box = new Box[6];

boolean [] update = new boolean [12];
String [] text = new String [6];
int high = 40;
float rotation = 0;
float rotation1 = 0;
float start_position;
float end_position;
boolean release;
boolean border = false;
int judge;

void settings(){
  size(320, 480);
}

void setup(){
  size(320, 480);
  text[0] = "Inbox";
  text[1] = "Draft";
  text[2] = "Sent";
  text[3] = "Junk";
  text[4] = "Trash";
  text[5] = "Archive";
  
  mailbox = new Text();
  for(int i=0; i<box.length; i++){
    box[i] = new Box(50+i*high, text[i]);
  }
  for(int i=0; i<update.length; i++){
    update[i] = false;
  }
}

void draw(){
  background(200, 200, 200);
  mailbox.display();
  mailbox.move_up();
  for(int i=0; i<box.length; i++){
    box[i].display();
    box[i].move_up();
  }
  upDate();
}

void mousePressed(){
  start_position = mouseY;
  rotation = 0;
}

void mouseDragged(){
  end_position = mouseY;
  mailbox.move_down();
  for(int i=0; i<box.length; i++){
    box[i].move_down();
  }
}

void mouseReleased(){
  release = true;
}

void upDate(){
  judge = 0;
  noStroke();
  fill(255);
  for(int i=0; i<update.length; i++){
    if(70/12*i+0.1 <= box[0].current_move){
      update[i] = true;
      judge++;
    }else{
      update[i] = false;
    }
  }
  pushMatrix();
  translate(width/2, 30);
  for(int i=0; i<update.length; i++){
    if(update[i]){
      pushMatrix();
      rotate(2*PI/12*i + rotation);
      if(judge == 12 || release){
        rotation += 0.005;
      }
      rect(-1, -20, 2, 10);
      popMatrix();
    }
  }
  popMatrix();
}
