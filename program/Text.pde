class Text extends Box{
  
  Text(){
    super(50, "MailBox");
  }
 
  void display(){
    current_move = y1 - y;
    if(current_move <= 0){
      y1 = y;
    }
   fill(0);
   textSize(50);
   text(text, 0, y1);  
  }
 
  void move_up(){
    if(release && current_move > 0){
      float w = 4*PI; //角速度[rad/s]
        if(realfirst_move > 70){
          if(current_move > 70){
            if(rotation > 5){
              t2 += 1/60.0;
            }else{
              t2 = 0;
              t1 += 1/60.0;
            }
          }else{
            t1 = 0;
            if(rotation > 5){
              t2 += 1/60.0;
            }else{
              real_move = y1 - y;
            }
          }
        }else{
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
