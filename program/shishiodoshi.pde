// shishiodoshi
// draw the shishiodoshi
// 2019/07/17
// 1-3-47 Amane Fukami

int nowTime;
int judge = 0;
int judgetake = 0;
float t = 0;
float waterAmount = 0;
float angle = 45;

void setup()
{
  size(500, 400);
  background(255);
}

// 動かない竹
void take()
{
  strokeWeight(2);
  stroke(0, 10, 0);
  fill(50, 150, 0);
  rect(155, 150, 40, 480);
  quad(150, 110, 490, 160, 550, 200, 150, 150);
  rect(700, 230, 30, 450);
  fill(200, 200, 0);
  quad(715, 270, 770, 280, 770, 300, 715, 285);
  fill(200, 100, 0);
  rect(140, 100, 70, 70);
  
  //模様
  noFill();
  strokeWeight(2.5);
  stroke(220, 255, 0);
  bezier(154, 300, 165, 307, 185, 307, 196, 300);
  bezier(154, 305, 165, 312, 185, 312, 196, 305);
  bezier(154, 500, 165, 507, 185, 507, 196, 500);
  bezier(154, 505, 165, 512, 185, 512, 196, 505);
  bezier(300, 130, 303, 135, 302, 160, 295, 170);
  bezier(304, 130, 307, 138, 306, 161, 299, 170);
  bezier(450, 153, 453, 155, 452, 180, 445, 188);
  bezier(454, 154, 457, 155, 456, 180, 449, 188);  
  strokeWeight(2.5);
  bezier(699, 300, 707, 306, 723, 306, 731, 300);
  bezier(699, 304, 707, 310, 723, 310, 731, 304);
  bezier(699, 504, 707, 510, 723, 510, 731, 504);
  bezier(699, 508, 707, 514, 723, 514, 731, 508);
  strokeWeight(2);
}

// 水を受ける石
void stone1()
{
  stroke(0);
  fill(150, 100, 10);
  rect(360, 450, 200, 180, 200);
  fill(50, 10, 0);
  ellipse(460, 480, 100, 50);
}

//　草
void grass(float x, float y)
{
  fill(0);
  stroke(0, 200, 0);
  bezier(x, y, x, y - 50, x - 5, y - 70, x - 10, y - 100);
  bezier(x, y, x, y - 50, x + 5, y - 70, x + 10, y - 100);  
}

//小さい草
void grass1(float x, float y)
{
  bezier(x, y, x, y - 30, x - 2, y - 40, x - 5, y - 60);
  bezier(x, y, x, y - 30, x + 2, y - 40, x + 5, y - 60);  
}

//石
void stone()
{
  strokeWeight(2);
  stroke(0);
  fill(100);
  rect(860, 630, 100, 100, 50);
}

// 動く竹
void moveTake(int x, int y)
{
  if(judgetake == 1)
  {
    if(waterAmount <= 500)
    {
      angle -= 0.01;
    }
    else if(500 < waterAmount && waterAmount <=  1050)
    {
      angle -= 0.1;
      water(x - 20 - 200 * cos(radians(angle)), y + 20 - 200 * sin(radians(angle)), -1);
    }
    else if(1050 < waterAmount && waterAmount <= 1090)
    {
      angle -= 0.5;
      water(x - 20 - 200 * cos(radians(angle)), y + 20 - 200 * sin(radians(angle)), -1);
    }
    else if(1090 < waterAmount && waterAmount <= 1100)
    {
      water(x - 20 - 200 * cos(radians(angle)), y + 20 - 200 * sin(radians(angle)), -1);
    }
  }
  if(1100 < waterAmount && waterAmount <= 1120)
  {
    angle += 2;
    if(judge == 1)
    {
      waterAmount++;
    }
  }
  if(1135 < waterAmount)
  {
    angle = 45;
    waterAmount = 0;
  }
  fill(50, 150, 0);
  stroke(0, 10, 0);
  quad(x + 20 + 300 * cos(radians(angle)), y - 20 + 300 * sin(radians(angle)), x - 20 + 300 * cos(radians(angle)), y + 20 + 300 * sin(radians(angle)), x - 20 - 200 * cos(radians(angle)), y + 20 - 200 * sin(radians(angle)), x + 20 - 100 * cos(radians(angle)), y - 20 - 100 * sin(radians(angle))); 
  rect(770, 250, 35, 470);
  fill(200, 200, 0);
  quad(727, 397, 770, 410, 770, 430, 727, 413);
  
  //模様
  noFill();
  strokeWeight(3);
  stroke(220, 255, 0);
  bezier(769, 328, 779, 335, 795, 335, 806, 328);
  bezier(769, 333, 779, 340, 795, 340, 806, 333);  
  bezier(769, 528, 779, 535, 795, 535, 806, 528);
  bezier(769, 533, 779, 540, 795, 540, 806, 533);
  bezier(x + 21 - 50 * cos(radians(angle)), y - 21 - 50 * sin(radians(angle)), x + 14 - 30 * cos(radians(angle)), y - 14 - 30 * sin(radians(angle)), x - 14 - 30 * cos(radians(angle)), y + 14 - 30 * sin(radians(angle)), x - 21 - 50 * cos(radians(angle)), y + 21 - 50 * sin(radians(angle))); 
  bezier(x + 21 - 44 * cos(radians(angle)), y - 21 - 44 * sin(radians(angle)), x + 14 - 25 * cos(radians(angle)), y - 14 - 25 * sin(radians(angle)), x - 14 - 25 * cos(radians(angle)), y + 14 - 25 * sin(radians(angle)), x - 21 - 44 * cos(radians(angle)), y + 21 - 44 * sin(radians(angle))); 
  bezier(x + 21 + 150 * cos(radians(angle)), y - 21 + 150 * sin(radians(angle)), x + 14 + 170 * cos(radians(angle)), y - 14 + 170 * sin(radians(angle)), x - 14 + 170 * cos(radians(angle)), y + 14 + 170 * sin(radians(angle)), x - 21 + 150 * cos(radians(angle)), y + 21 + 150 * sin(radians(angle))); 
  bezier(x + 21 + 144 * cos(radians(angle)), y - 21 + 144 * sin(radians(angle)), x + 14 + 165 * cos(radians(angle)), y - 14 + 165 * sin(radians(angle)), x - 14 + 165 * cos(radians(angle)), y + 14 + 165 * sin(radians(angle)), x - 21 + 144 * cos(radians(angle)), y + 21 + 144 * sin(radians(angle))); 
}

// 水のX座標
float waterX(float x, float v, float t, int direction)
{
  return x + direction * v * t;
}

// 水のY座標
float waterY(float y, float t)
{
  return y + 0.5 * 9.8 * t * t;
}

// 水の描画
void water(float x, float y, int direction)
{
  t+= 0.1;
  noStroke();
  for(int i = 0; i < 100; i++)
  {
    float t1;
    if(t < 4.5)
    {
      t1 = random(t);
    }
    else
    {
      t1 = random(4.5 + waterAmount / 600.0);
    }
    fill(0, 0, 255);
    ellipse(waterX(x, 10 + random(5), t1, direction), waterY(y,t1), 1, 1);
  }
  waterAmount++;
}

void draw()
{
  background(255);
  scale(0.5, 0.5);
  noStroke();
  fill(100, 200, 0, 50);
  rect(0, 0, 1000, 800);
  if(t > 5)
  {
    judgetake = 1;
  }
  if(judge == 0)
  {
    water(540, 190, 1);
  }
  take();
  grass(650, 430);
  moveTake(725, 400);
  stone();
  stone1();
  grass(100, 500);
  grass(300, 400);
  grass(250, 750);
  grass(600, 750);
  grass(850, 300);
  grass1(100, 100);
  grass1(600, 150);
}

void mousePressed()
{
  t = 0;
  judge++;
  judgetake = 0;
  if(judge > 1)
  {
    judge = 0;
  }
}
