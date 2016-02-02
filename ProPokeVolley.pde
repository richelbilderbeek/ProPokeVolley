int maxx = 908;
int maxy = 605;
PImage background;
PImage player_left_stand;
PImage player_left_jump;
PImage player_right_stand;
PImage player_right_jump;
double player_maxy = maxy - 149;
double player_maxx = maxx - 160;
double player_left_x = 0;
double player_left_y = player_maxy;
double player_right_x = player_maxx;
double player_right_y = player_maxy;

PImage basket_left_1;
PImage basket_left_2;
PImage basket_left_3;
PImage basket_right_1;
PImage basket_right_2;
PImage basket_right_3;
int basket_left_x = 0;
int basket_left_y = 100;
int basket_right_x = maxx - 150;
int basket_right_y = 100;
PImage ball;
double ball_x = (maxx / 2) - (61 / 2);
double ball_y = 0.0;

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