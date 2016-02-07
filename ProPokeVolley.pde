int maxx = 908;
int maxy = 605;
PImage background;
PImage player_left_stand;
PImage player_left_jump;
PImage player_right_stand;
PImage player_right_jump;
int player_w = 149;
int player_h = 160;
float player_maxy = maxy - player_w;
float player_maxx = maxx - player_h;
float player_left_x = 0;
float player_left_y = player_maxy;
float player_right_x = player_maxx;
float player_right_y = player_maxy;

PImage basket_left_1;
PImage basket_left_2;
PImage basket_left_3;
PImage basket_right_1;
PImage basket_right_2;
PImage basket_right_3;
int basket_left_x = 0;
int basket_left_y = 100;
int basket_left_w = 161;
int basket_left_h = 150;
int basket_left_midx = basket_left_x + (basket_left_w / 2);
int basket_left_midy = basket_left_y + (basket_left_h / 2);
int basket_right_x = maxx - 150;
int basket_right_y = 100;
int basket_right_w = 161;
int basket_right_h = 150;
float basket_right_midx = basket_right_x + (basket_right_w / 2);
float basket_right_midy = basket_right_y + (basket_right_h / 2);
PImage ball;
float ball_x = (maxx / 2) - (61 / 2);
float ball_y = 0.0;
int ball_w = 61;
int ball_h = 61;
//double ball_dx = (random(10) - 5) / 10.0;
float ball_dx = 5.0;
float ball_dy = 0.0;

int score_left = 0;
int score_right = 0;

void setup()
{
  size(908,605); //maxx, maxy  
  background = loadImage("BeachSmall.png");
  player_left_stand = loadImage("SquirtleLeftSmall.png");
  player_left_jump = loadImage("SquirtleLeftSmallJump.png");
  player_right_stand = loadImage("SquirtleRightSmall.png");
  player_right_jump = loadImage("SquirtleRightSmallJump.png");
  basket_left_1 = loadImage("GhastlyLeft1.png");
  basket_left_2 = loadImage("GhastlyLeft2.png");
  basket_left_3 = loadImage("GhastlyLeft3.png");
  basket_right_1 = loadImage("GhastlyRight1.png");
  basket_right_2 = loadImage("GhastlyRight2.png");
  basket_right_3 = loadImage("GhastlyRight3.png");
  ball = loadImage("PokeBallRed.png");
}

void draw()
{
  //Move stuff
  ball_dy += 0.2; //gravity
  ball_x += ball_dx;
  ball_y += ball_dy;
  if (ball_y > maxy - 61.0) { ball_dy = -abs((float)ball_dy); ball_y += ball_dy;} 
  if (ball_x < 0) { ball_dx = abs((float)ball_dx); ball_x += ball_dx;} 
  if (ball_x > maxx - 61.0) { ball_dx = -abs((float)ball_dx); ball_x += ball_dx;}

  float ball_midx = ball_x + (0.5 * ball_w);
  float ball_midy = ball_y + (0.5 * ball_h);
  float player_left_midx = player_left_x + (player_w / 2);
  float player_left_midy = player_left_y + (player_h / 2);
  float player_right_midx = player_right_x + (player_w / 2);
  float player_right_midy = player_right_y + (player_h / 2);
  //Score in left basket?
  if (dist(ball_midx,ball_midy,basket_left_midx,basket_left_midy) < (ball_w + basket_left_w) / 2) 
  { 
    ball_y = 0; 
    ball_x = (maxx / 2) - (61 / 2);
    ball_dy = 0.0;
    ++score_right;
  } 
  //Score in right basket?
  else if (dist(ball_midx,ball_midy,basket_right_midx,basket_right_midy) < (ball_w + basket_left_w) / 2) 
  { 
    ball_y = 0; 
    ball_x = (maxx / 2) - (61 / 2);
    ball_dy = 0.0;
    ++score_left;
  } 
  //Left player?
  else if (dist(ball_midx,ball_midy,player_left_midx,player_left_midy) < (ball_w + basket_left_w) / 2) 
  { 
    ball_dy = -ball_dy;
  } 
  //Right player?
  else if (dist(ball_midx,ball_midy,player_right_midx,player_right_midy) < (ball_w + basket_left_w) / 2) 
  { 
    ball_dy = -ball_dy;
  } 
  
  //Draw stuff
  image(background,0,0);

  switch (int(random(3))) {
    case 0: image(basket_left_1,basket_left_x,basket_left_y); break;
    case 1: image(basket_left_2,basket_left_x,basket_left_y); break;
    case 2: image(basket_left_3,basket_left_x,basket_left_y); break;
  }
  switch (int(random(3))) {
    case 0: image(basket_right_1,basket_right_x,basket_right_y); break;
    case 1: image(basket_right_2,basket_right_x,basket_right_y); break;
    case 2: image(basket_right_3,basket_right_x,basket_right_y); break;
  }

  image(player_left_stand,(int)player_left_x,(int)player_left_y);
  image(player_right_stand,(int)player_right_x,(int)player_right_y);
  image(player_left_stand,(int)player_left_x,(int)player_left_y);
  image(ball,(int)ball_x,(int)ball_y);
}