/*
//if the arduino light sensor is in use :)
import processing.serial.*;
import cc.arduino.*;
Arduino arduino;
*/
  //var
  boolean arduMode = false;
  float snakeY = 500;
  float t = 0;
  float riseLimit;
  boolean rise = true;
 
void setup() {
  size(800, 800);
  if (arduMode == true){
    arduino = new Arduino(this, Arduino.list()[0], 57600); //change the [0] to a [1] or [2] etc. if your program doesn't work
  }
  noStroke();  
}
void draw() {
  //Troubleshooting console
  /*
  System.out.print(arduino.analogRead(5));
  System.out.print(" + ");
  System.out.println(riseLimit);
  */
  if(arduMode == true){
    riseLimit = 600 - 1.5 * arduino.analogRead(5);
  }
  else{
    riseLimit = 300;
  }
  t++;
  background(225, 225, 225);
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
  //head
  stroke(0, 0, 0);
  fill(100, 255, 100);
  rect(325, snakeY -40, 100, 50, 15);
  //body  
  for(int n = 0; n < (600-snakeY); n++){
    stroke(100, 255, 100);
    line(400 - 25 - 30 * sin(n/50.0), snakeY + n, 400 + 25 - 30 * sin(n/50.0), snakeY + n);
  stroke(0, 0, 0);
  point(400 - 25 - 30 * sin(n/50.0), snakeY + n);
  point(400 + 25 - 30 * sin(n/50.0), snakeY + n);
  }
  noStroke();
  //line covering
  noStroke();
  rect(327, snakeY -38, 96, 48, 15);
  //eyes
  stroke(0, 0, 0);
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
  noStroke();
  //basket base
  for(int n = 0; n<75; n++){
    fill(150 + 1.5*n, 100 + n, 75+n/2);
    arc(400-n, 600-n, 300-3*n, 300-3*n, 0-QUARTER_PI, PI+QUARTER_PI, CHORD);
  }
  //rim
  for(int n = 0; n <= 240; n++){
    for(int m = 0; m<= 10; m++){
      fill(125 + 5 * m, 80 + 4 * m, 20 + 3 * m);
      ellipse(280 + n - m/2, 490 - 0.001*n*(n-240) - m/2, 25 - m, 25 - m);
    }
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
  if(arduMode == true){
  if(rise == true){
    if(snakeY >= riseLimit){
      snakeY --;
    }
    else {
      rise = false;
    }
  } else if(snakeY <= riseLimit){
   snakeY +=5; 
  }
  else{
   snakeY = riseLimit; 
   rise = true;
  }
  }
  else{
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
}












