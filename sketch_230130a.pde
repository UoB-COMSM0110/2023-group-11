void setup(){
  //runs once
  size(1000, 1000);
  background(55, 100, 255);
}

int r = 0, g = 0, b = 0;
int radius = 20;

void draw() {
  noStroke();
  fill(r, g, b);
  //Only draws when the mouse is pressed
  if(mousePressed){
    //picks the shape of the brush
     if(key == 49){
        ellipse(mouseX, mouseY, radius, radius);
     } else if(key == 50){
        rect(mouseX, mouseY, radius, radius);
     } else if(key == 51){
       for(int n = 0; n < 10; n++){
          ellipse(mouseX+random(-20, 20), mouseY+random(-20, 20), random(3), random(3));
       }
    }
  }
}

void keyPressed() {
  if(key == 48){
   //Everytime you press the number '0' the background if reset
   r = (int)random(0, 255);
   g = (int)random(0, 255);
   b = (int)random(0, 255);
   background(r, g, b); //teal?
  } else {
  //everytime you press the keybroad, you get a random color :)
   r = (int)random(0, 255);
   g = (int)random(0, 255);
   b = (int)random(0, 255);
  }
}

void mouseClicked(){
  //if you click the left button of the mouse, the brush gets bigger; otherwise, it gets smaller
   if(mouseButton == LEFT){
     radius = radius + 5;
   }
   if(mouseButton == RIGHT){
     radius = radius - 5;
   }
}

void mousePressed(){

}
