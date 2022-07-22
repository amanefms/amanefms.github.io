class Box{
  
  int wid = width;
  int y;  //初期のY座標
  float y1;  //現在のY座標
  String text;
  float move_y;
  float realfirst_move;
  float real_move;
  float current_move; //元の位置と現在の位置との距離
  float k = 0.8;
  float t1, t2, t3 = 0;
  
  Box(int y, String moji){
    this.y = y;
    y1 = y;
    text = moji;
  }
    
  void display(){
    current_move = y1 - y;
    if(current_move <= 0){
      y1 = y;
      release = false;
    }
    fill(255);
    stroke(0);
    rect(0, y1, wid, high);
    fill(0);
    textSize(20);
    text(text, 10, y1 + 30);
  }
  
  void move_down(){
    y1 = y;
    move_y = end_position - start_position;
    y1 = y + (1-k) * move_y;
    realfirst_move = y1 - y;
    real_move = y1 - y;
  }
  
  void move_up(){
    if(release){
      float w = 4*PI; //角速度[rad/s]
        if(realfirst_move > 70){
          if(current_move > 70){
            if(rotation > 5 + delay1){
              t2 += 1/60.0;
            }else{
              t2 = 0;
              t1 += 1/60.0;
            }
          }else{
            t1 = 0;
            if(rotation > 5 + delay1){
              t2 += 1/60.0;
            }else{
              real_move = y1 - y;
            }
          }
        }else{
          rotation = 0;
          t3 += 1/60.0;
        }
        y1 = y + real_move/2.0 + real_move/2.0*sin(w*(t1+t2+t3)+0.5*PI);
    }else{
      t1 = 0;
      t2 = 0;
      t3 = 0;
    }
  }
}
