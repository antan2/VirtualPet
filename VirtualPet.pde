//var
float snakeY = 500;
float t = 0;
boolean rise = true;
float riseLimit = 300;

void setup() {
  size(800, 800);
  noStroke();  
}

void draw() {
  t++;
  background(200, 200, 200);
  fill(150, 150, 150);
  rect(0,575,800, 225);
  //backdrop
  stroke(0, 0, 0);
  line(0, 575, 800, 575);
  line(0, 620, 800, 620);
  line(0, 675, 800, 675);
  line(0, 740, 800, 740);
  for(int n = 0; n <= 10; n++){
    line(50+70*n, 575, 80 * n, 800);
  }
  for(int n = 0; n <= 10; n++){
    line(50+70*n, 575, 50+70*n, 0);
  }
  for(int n = 1; n<=7; n++){
    line(0, 575 - 75*n, 800, 575 - 75*n); 
  }
  noStroke();
  //basket rim back
  fill(100, 70, 20);
  rect(300, 480, 200, 100);
  fill(195, 160, 60);
  for(int n = 0; n <= 240; n++){
    ellipse(280 + n, 490 + 0.001*n*(n-240), 25, 25);
  }
  //snake
  //body  
  for(int n = 0; n < (600-snakeY); n++){
    stroke(100, 255, 100);
    line(400 - 25 - 30 * sin(n/50.0), snakeY + n, 400 + 25 - 30 * sin(n/50.0), snakeY + n);
  }
  noStroke();
  //head
  fill(100, 255, 100);
  rect(325, snakeY -40, 100, 50, 15);
  //eyes
  fill(255, 255, 255);
  rect(385, snakeY -50, 15, 30, 25);
  rect(395, snakeY -50, 15, 30, 25);
  fill(0, 0, 0);
  rect(387, snakeY -45 -2*sin(t/20.0), 5, 10, 25);
  rect(397, snakeY -45 -2*sin(t/20.0), 5, 10, 25);
  //teeth
  fill(255, 255, 255);
  triangle(335, snakeY + 10, 340, snakeY +10, 337.5, snakeY + 25);
  triangle(340, snakeY + 10, 345, snakeY +10, 342.5, snakeY + 25); 
  //basket base
  for(int n = 0; n<75; n++){
    fill(150 + 1.5*n, 100 + n, 75+n/2);
    arc(400-n, 600-n, 300-3*n, 300-3*n, 0-QUARTER_PI, PI+QUARTER_PI, CHORD);
  }
  fill(175, 140, 50);
  for(int n = 0; n <= 240; n++){
    ellipse(280 + n, 490 - 0.001*n*(n-240), 25, 25);
  }
  //decal
  for(int n = 0; n < 20; n++){
    fill(100, 50, 0, 100);
    if(n % 2 == 1){
      triangle(252.5 + 15*n, 603 - 0.3*n*(n-20), 262.5 + 15*n, 603 - 0.3*n*(n-20), 257.5 + 15*n, 597 - 0.3*n*(n-20));
    }
    else{
      triangle(252.5 + 15*n, 597 - 0.3*n*(n-20), 262.5 + 15*n, 597 - 0.3*n*(n-20), 257.5 + 15*n, 603 - 0.3*n*(n-20));
    }
  }
  //move
  if(rise == true){
    if(snakeY >= riseLimit){
      snakeY --;
    }
    else {
      rise = false;
    }
  } else if(snakeY <= 600){
   snakeY +=5; 
  }
  else{
   snakeY = 600; 
   rise = true;
  }
}





