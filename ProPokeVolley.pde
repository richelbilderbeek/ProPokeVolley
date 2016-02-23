int maxx = 908;
int maxy = 605;
float gravity = 0.5;
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
float player_left_dx = 0.0;
float player_left_dy = 0.0;
boolean is_player_left_jumping = false;
float player_right_x = player_maxx;
float player_right_y = player_maxy;
float player_right_dx = 0.0;
float player_right_dy = 0.0;
boolean is_player_right_jumping = false;

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

// Key inputs
boolean player_left_pressed_left = false;
boolean player_left_pressed_right = false;
boolean player_left_pressed_jump = false;

boolean player_right_pressed_left = false;
boolean player_right_pressed_right = false;
boolean player_right_pressed_jump = false;

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
    String title = "ProPokeVolley " + score_left + " - " + score_right;  
    frame.setTitle(title);
}

void draw()
{
  process_keys();
  move_ball();
  move_player();
  draw_all();
}

void animate_baskets()
{
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
}

void draw_all() 
{
  image(background,0,0);
  
  animate_baskets();

  if (!is_player_left_jumping)
  {
    image(player_left_stand,(int)player_left_x,(int)player_left_y);
  }
  else
  {
    image(player_left_jump,(int)player_left_x,(int)player_left_y);
  }
  if (!is_player_right_jumping)
  {
    image(player_right_stand,(int)player_right_x,(int)player_right_y);
  }
  else
  {
    image(player_right_jump,(int)player_right_x,(int)player_right_y);
    
  }
  image(ball,(int)ball_x,(int)ball_y); 
}

void keyPressed() {
  if (key == 'a' || key == 'A') { player_left_pressed_left = true; } 
  if (key == 'd' || key == 'D') { player_left_pressed_right = true; }
  if (key == 'w' || key == 'W') { player_left_pressed_jump = true; }
  
  if (key == CODED) {
    if (keyCode == LEFT ) { player_right_pressed_left = true; }
    if (keyCode == RIGHT) { player_right_pressed_right = true; }
    if (keyCode == UP) { player_right_pressed_jump = true; }
  }
}

void keyReleased() {
  if (key == 'a' || key == 'A') { player_left_pressed_left = false; } 
  if (key == 'd' || key == 'D') { player_left_pressed_right = false; }
  if (key == 'w' || key == 'W') { player_left_pressed_jump = false; }
  
  if (key == CODED) {
    if (keyCode == LEFT ) { player_right_pressed_left = false; }
    if (keyCode == RIGHT) { player_right_pressed_right = false; }
    if (keyCode == UP) { player_right_pressed_jump = false; }
  }
}

void move_ball()
{
  ball_dy += gravity;
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
    String title = "ProPokeVolley " + score_left + " - " + score_right;  
    frame.setTitle(title);
  } 
  //Score in right basket?
  else if (dist(ball_midx,ball_midy,basket_right_midx,basket_right_midy) < (ball_w + basket_left_w) / 2) 
  { 
    ball_y = 0; 
    ball_x = (maxx / 2) - (61 / 2);
    ball_dy = 0.0;
    ++score_left;
    String title = "ProPokeVolley " + score_left + " - " + score_right;  
    frame.setTitle(title);
  } 
  //Left player?
  else if (dist(ball_midx,ball_midy,player_left_midx,player_left_midy) < (ball_w + basket_left_w) / 2) 
  { 
    if (abs(ball_midx - player_left_midy) < abs(ball_midy - player_left_midy))
    {
      if (ball_midy < player_left_midy)
      {
        ball_dy = -abs(ball_dy);
      }
      else
      {
        ball_dy = abs(ball_dy);
      }
      ball_y += ball_dy;
    }
    else
    {
      if (ball_midx < player_left_midx)
      {
        ball_dx = -abs(ball_dx);
      }
      else
      {
        ball_dx = abs(ball_dx);
      }
      ball_x += ball_dx;
    }
  } 
  //Right player?
  else if (dist(ball_midx,ball_midy,player_right_midx,player_right_midy) < (ball_w + basket_left_w) / 2) 
  { 
    if (abs(ball_midx - player_right_midy) < abs(ball_midy - player_right_midy))
    {
      if (ball_midy < player_right_midy)
      {
        ball_dy = -abs(ball_dy);
      }
      else
      {
        ball_dy = abs(ball_dy);
      }
      ball_y += ball_dy;
    }
    else
    {
      if (ball_midx < player_right_midx)
      {
        ball_dx = -abs(ball_dx);
      }
      else
      {
        ball_dx = abs(ball_dx);
      }
      ball_x += ball_dx;
    }
  } 
  
}

void move_player()
{
  player_left_x += player_left_dx; 
  player_right_x += player_right_dx; 
  player_left_y += player_left_dy; 
  player_right_y += player_right_dy;
  if (is_player_left_jumping) { player_left_dy += gravity; }
  if (is_player_right_jumping) { player_right_dy += gravity; }
  if (player_left_x < 0.0) { player_left_x = 0.0; player_left_dx = 0.0; }
  if (player_right_x < 0.0) { player_right_x = 0.0; player_right_dx = 0.0; }

  if (player_left_x + player_w > maxx) { player_left_x = maxx - player_w; player_left_dx = 0.0; }
  if (player_right_x + player_w > maxx) { player_right_x = maxx - player_w; player_right_dx = 0.0; }

  if (player_left_y + player_h > maxy) { player_left_y = maxy - player_h; player_left_dy = 0.0; is_player_left_jumping = false; }
  if (player_right_y + player_h > maxy) { player_right_y = maxy - player_h; player_right_dy = 0.0; is_player_right_jumping = false; }
}

void process_keys()
{
  float accelation_horizontal = 1.0;
  float friction_horizontal = 0.9; 
  float initial_jump_speed = -20.0;
  
  if (player_left_pressed_left) { 
    player_left_dx -= accelation_horizontal; 
  }
  if (player_left_pressed_right) { 
    player_left_dx += accelation_horizontal; 
  }
  player_left_dx *= friction_horizontal;
  player_right_dx *= friction_horizontal;

  if (player_left_pressed_jump && !is_player_left_jumping)
  {
    is_player_left_jumping = true;
    player_left_dy = initial_jump_speed;
  }
  
  if (player_right_pressed_left) { 
    player_right_dx -= accelation_horizontal; 
  }
  if (player_right_pressed_right) { 
      player_right_dx += accelation_horizontal; 
  }
  if (player_right_pressed_jump && !is_player_right_jumping)
  {
    is_player_right_jumping = true;
    player_right_dy = initial_jump_speed;
  }
}