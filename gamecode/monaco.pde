int ScreenSize_width = 600;
int ScreenSize_height = 800; 

PImage pinkBot, blueBot, player, StartImage, trackImage, GameOver;
model game = new model();
float trackPos=0;


 boolean[] keyStates = new boolean[8];
 final int left = 0;
 final int up = 1;
 final int right = 2;
 final int down = 3;
 final int aKey = 4;
 final int wKey = 5;
 final int dKey = 6;
 final int sKey = 7;
 
 
 void keyPressed(){
   int keyVal = keyCode;
   switch (keyVal){
    case LEFT:
      keyStates[left]=true;
      break;
    case UP:
      keyStates[up]=true;
      break;
    case RIGHT:
      keyStates[right]=true;
      break;
    case DOWN:
      keyStates[down]=true;
      break;
    default:
      break;
   }
 }
 
 
 void keyReleased(){
   int keyVal = keyCode;
   switch (keyVal){
    case LEFT:
      keyStates[left]=false;
      break;
    case UP:
      keyStates[up]=false;
      break;
    case RIGHT:
      keyStates[right]=false;
      break;
    case DOWN:
      keyStates[down]=false;
      break;
    default:
      break;
   }
 }
 





void setup(){
    size(600,800);
    pinkBot =loadImage("Data/pinkBot.png");
    blueBot = loadImage("Data/blueBot.png");
    player =loadImage("Data/greenBot.png");
    trackImage = loadImage("/Users/chrishannon/Desktop/compsci/tb2/SWE/Game/trackimages/trackmerged.png");
    StartImage = loadImage("Data/Start.png");
    GameOver = loadImage("Data/GameOver.jpg");
    startNewGame();
    
}

void draw() {  
  if(game.getGameState() == 0) {
     startScreen();
  } else if (game.getGameState() == 1) {
     gamePlay();
  } else if(game.getGameState() == 2) {
     difficulty(); 
  } else if(game.getGameState() == 3) {
     gameOver();
  } 
}

class model{
   int score = 0; //Score
   int gameState = 0; //game state, 0 = start screen, 1 = running, 2 = difficulty screen, 3 = gameover screen
   int difficultyLevel = 0;
   float yBot0; //for bot 0
   float yPlayer; //for player
   float yBot2; //for bot 2
   float yBot3; //for bot 3
   float xBot0; //for bot 0
   float xPlayer; //for player
   float xBot2; //for bot 2
   float xBot3; //for bot 3
   
   // constructor
   model(){

   }
   
   void setDifficulty(int level){
      if(level > 3){
         difficultyLevel = 1;
      }
      difficultyLevel = level;
   }
   
   int getDifficulty(){
     return difficultyLevel;
   }
   
   int getGameState(){
     return gameState;
   }
   
   void setGameState(int newGameState){
      if(newGameState > 3){
         gameState = 0;
         return;
      } else{
         gameState = newGameState;
      }
   }
   
   void setScore(int botOvertaken){
     score=score + botOvertaken;
   }
   
   void resetScore(){
     score = 0;
   }
   
   int getScore(){
      return score;
   }
   
   float getCarPositionY(int carNumber){
     if(carNumber == 0){
       return yBot0;
      } else if(carNumber == 1){
       return yPlayer;
      } else if(carNumber == 2){
       return yBot2;
      } else if(carNumber == 3){
       return yBot3;
      }
      return 0;
   }
   
   void setCarPositionY(int carNumber, float position){
     if(position < 0){
          position = 800;
     }
     if(carNumber == 0){
       yBot0 = position;
      } else if(carNumber == 1){
       yPlayer = position;
      } else if(carNumber == 2){
       yBot2 = position;
      } else if(carNumber == 3){
       yBot3 = position;
      }
   }
   
    float getCarPositionX(int carNumber){
     if(carNumber == 0){
       return xBot0;
      } else if(carNumber == 1){
       return xPlayer;
      } else if(carNumber == 2){
       return xBot2;
      } else if(carNumber == 3){
       return xBot3;
      }
      return 0;
   }
   
   void setCarPositionX(int carNumber, float position){
     if(carNumber == 0){
       xBot0 = position;
      } else if(carNumber == 1){
       xPlayer = position;
      } else if(carNumber == 2){
       xBot2 = position;
      } else if(carNumber == 3){
       xBot3 = position;
      }
   }
}



void gamePlay() {
  int carWidth = 40; 
  int carHeight = 80;
  int bot0Overtaken = 10;
  int bot2Overtaken = 10;
  int bot3Overtaken = 10;
  noCursor();
  float playerMovement = 3;
  if(game.getDifficulty() == 1){ //easy
    playerMovement = 3;
  } else if(game.getDifficulty() == 2){ //medium
    playerMovement = 6;
  } else if(game.getDifficulty() == 3){ //hard
    playerMovement = 10;
  }
  
  
  // move track
  trackPos += 0.5;
  if (trackPos>ScreenSize_height){
    trackPos=0;
  }
  
  
  //track image load
  image(trackImage, 0, trackPos,ScreenSize_width, ScreenSize_height);
  
  
  
  
  
  
  //bot 0
  image(blueBot, game.getCarPositionX(0), game.getCarPositionY(0), carWidth, carHeight);
  game.setCarPositionY(0, (game.getCarPositionY(0) - playerMovement/2));
  if(game.getCarPositionY(0)>800){
    game.setCarPositionY(0, 0);
  }
  
  // car movement handler : https://stackoverflow.com/questions/7815137/processing-keypressed
   if (keyStates[up]){
     game.setCarPositionY(1, (game.getCarPositionY(1) - playerMovement));
   }
   if (keyStates[down]){
     game.setCarPositionY(1, (game.getCarPositionY(1) + playerMovement/2));
   }
   if (keyStates[left]){
     game.setCarPositionX(1, game.getCarPositionX(1) - 4);
   }
   if (keyStates[right]){
     game.setCarPositionX(1, game.getCarPositionX(1) + 4);
   }
 
 
 
 
  
  // PLAYER CAR   
  image(player, game.getCarPositionX(1), game.getCarPositionY(1), carWidth, carHeight);  
 
  if (game.getCarPositionY(1)<150){
    game.setCarPositionY(1, (game.getCarPositionY(1) + playerMovement - 1));
    if (game.getCarPositionY(1)<50){
      game.setCarPositionY(1, (game.getCarPositionY(1) + playerMovement));
    }
  }
  if(game.getCarPositionY(1)>800) {
     game.setGameState(3);
     gameOver();
  }
           
  //bot 2
  image(blueBot, game.getCarPositionX(2), game.getCarPositionY(2), carWidth, carHeight);
  game.setCarPositionY(2, (game.getCarPositionY(2) - playerMovement/3));
  if(game.getCarPositionY(2)>800){
    game.setCarPositionY(2, 800);
  }
           
  //bot 3
  image(pinkBot, game.getCarPositionX(3), game.getCarPositionY(3), carWidth, carHeight);
  game.setCarPositionY(3, (game.getCarPositionY(3) - playerMovement + 1));
  if(game.getCarPositionY(3)>800){
    game.setCarPositionY(3, 800);
   }
           
   //Score
   textAlign(LEFT);
   fill(1);
   textSize(25);
   text("Score:" + str(game.getScore()), 20,25);
         
   //bot 0
   if(crashDetector(0) == true) {
      gameOver();
   //bot 2
   } if(crashDetector(2) == true) {
      gameOver();
   //bot 3
   } if(crashDetector(3) == true) {
      gameOver();
   }
           
   //bot 0
   if (bot0Overtaken==10 && game.getCarPositionY(1)<=game.getCarPositionY(0) && game.getCarPositionY(1)>=game.getCarPositionY(0)-5) {
      game.setScore(bot0Overtaken);
      bot0Overtaken=0;
   }
   if (bot0Overtaken==0 && game.getCarPositionY(1)>=game.getCarPositionY(0)+15 && game.getCarPositionY(1)>=game.getCarPositionY(0)+5) {
      bot0Overtaken=10;
   }
   //bot 2
   if (bot2Overtaken==10 && game.getCarPositionY(1)<=game.getCarPositionY(2) && game.getCarPositionY(1)>=game.getCarPositionY(2)-5) {
       game.setScore(bot2Overtaken);
       bot2Overtaken=0;
   }
   if (bot2Overtaken==0 && game.getCarPositionY(1)>=game.getCarPositionY(2)+15 && game.getCarPositionY(1)>=game.getCarPositionY(2)+45) {
       bot2Overtaken=10;
   }
   //bot 3
   if (bot3Overtaken==10 && game.getCarPositionY(1)<=game.getCarPositionY(3) && game.getCarPositionY(1)>=game.getCarPositionY(3)-5) {
       game.setScore(bot3Overtaken);
       bot3Overtaken=0;
   }
   if (bot3Overtaken==0 && game.getCarPositionY(1)>=game.getCarPositionY(3)+15 && game.getCarPositionY(1)>=game.getCarPositionY(3)+5) {
       bot3Overtaken=10;
   }
}

boolean crashDetector(int carNumber){
  int carWidth = 40; 
  int carHeight = 80;
  float playerX = game.getCarPositionX(1);
  float playerXPlusWidth = game.getCarPositionX(1) + carWidth;
  float playerY = game.getCarPositionY(1);
  float playerYPlusHeight = game.getCarPositionY(1) + carHeight;
  float botX = game.getCarPositionX(carNumber);
  float botXPlusWidth = game.getCarPositionX(carNumber) + carWidth;
  float botY = game.getCarPositionY(carNumber);
  float botYPlusHeight = game.getCarPositionY(carNumber) + carHeight;
  if(playerX > botX && playerX < botXPlusWidth && playerY > botY && playerY < botYPlusHeight){
    return true;
  } else if(playerXPlusWidth > botX && playerXPlusWidth < botXPlusWidth && playerY > botY && playerY < botYPlusHeight){
    return true;
  } else if(playerX > botX && playerX < botXPlusWidth && playerYPlusHeight > botYPlusHeight && playerYPlusHeight < botYPlusHeight){
    return true;
  } else if(playerXPlusWidth > botX && playerXPlusWidth < botXPlusWidth && playerYPlusHeight > botY && playerYPlusHeight < botYPlusHeight){
    return true;
  }
  return false;
}
   
 void gameOver() {
   int restartButtonX = 80;
   int restartButtonY = 620; 
   int restartButtonW= 140;
   int restartButtonH = 50; 
   int menuButtonX = 250;
   int menuButtonY = 620;
   int menuButtonW = 140; 
   int menuButtonH = 50; 
   //Game over image
   image(GameOver, 0, 0, ScreenSize_width, ScreenSize_height);
   game.setGameState(3);
   cursor();
   textAlign(CENTER);
   textSize(80);
   fill(1);
   textSize(50);
   text(game.getScore(), 370, 590);  //Score
  
   
   
   //New Game button
   fill(255);
   rect(restartButtonX, restartButtonY, restartButtonW, restartButtonH); //Button
   fill(0);
   textSize(25);
   text("NEW GAME", 150,650);
     
   fill(255);
   rect(menuButtonX, menuButtonY, menuButtonW, menuButtonH); //Button
   textSize(25);
   fill(0);
   text("MENU",320,650);
     
   if(mousePressed) {
     if(overButton(menuButtonX, menuButtonY, menuButtonW, menuButtonH)) {
       game.setGameState(0);
     } else if(overButton(restartButtonX, restartButtonY, restartButtonW, restartButtonH)){
       game.resetScore();
       startNewGame();
       game.setGameState(1);
     }  
   }     
}

boolean overButton(int x, int y, int width, int height){
 if(mouseX >= x && mouseX <= x+width && mouseY >= y && mouseY <= y+height){ 
   return true;
 } else{
   return false;
 }
}

void startNewGame() {
   game.setScore(0);
   game.setCarPositionX(0, 50);
   game.setCarPositionX(1, 250);
   game.setCarPositionX(2, 225);
   game.setCarPositionX(3, 350);
   game.setCarPositionY(0, 250);
   game.setCarPositionY(1, 500);
   game.setCarPositionY(2, 250);
   game.setCarPositionY(3, 250);
   game.setGameState(0);
}

void startScreen() {
  int startButtonX = 80; // 
  int startButtonY = 450;
  int startButtonW = 140; 
  int startButtonH = 50; 

  int diffButtonX = 250;
  int diffButtonY = 450;
  int diffButtonW = 140; 
  int diffButtonH = 50; 
  cursor();
  image(StartImage, 0, 0, ScreenSize_width, ScreenSize_height);
 
  //Start button
  fill(255);
  rect(startButtonX, startButtonY, startButtonW, startButtonH);
  fill(0);
  textSize(25);
  textAlign(CENTER);
  text("START", 150, 484);
  
  //Difficulty button
  fill(255);
  rect(diffButtonX, diffButtonY, diffButtonW, diffButtonH);
  fill(0);
  textSize(25);
  textAlign(CENTER);
  text("DIFFICULTY", 320, 484);
   
 
  if(mousePressed) {
    if(overButton(startButtonX, startButtonY, startButtonW, startButtonH)){
      startNewGame();
      game.setGameState(1);
    } else if(overButton(diffButtonX, diffButtonY, diffButtonW, diffButtonH)){
      game.setGameState(2);
    }  
  }
}

void difficulty() {
   int easyX = 150;
   int easyY = 150;
   int easyW = 140;
   int easyH = 50;

   int mediumX = 150;
   int mediumY = 250;
   int mediumW = 140;
   int mediumH = 50;

   int hardX = 150;
   int hardY = 350;
   int hardW = 140;
   int hardH = 50;

   int backButtonX = 150;
   int backButtonY = 550;
   int backButtonW = 140;
   int backButtonH = 50; 

   background(255);
   fill(0);
   textSize(65);
   textAlign(CENTER);
   textSize(25);
 
   fill(255);
   rect(easyX, easyY, easyW, easyH); 
   fill(0);
   text("Easy", 225, 180);
   if(mousePressed) {
     if(overButton(easyX, easyY, easyW, easyH)) {
       game.setDifficulty(1);
     }
   }
  
   fill(255);
   rect(mediumX, mediumY, mediumW, mediumH);
   fill(0);
   text("Medium", 225, 280);
   if(mousePressed) {
     if(overButton(mediumX, mediumY, mediumW, mediumH)) {
       game.setDifficulty(2);
     }
   }
   
   fill(255);
   rect(hardX,hardY,hardW,hardH); //Button
   fill(0);
   text("Hard", 225, 380);
   if(mousePressed) {
     if(overButton(hardX, hardY, hardW, hardH)) {
       game.setDifficulty(3);
     }
   }
  
   //Back button
   fill(255);
   rect(backButtonX, backButtonY, backButtonW, backButtonH);
   fill(0);
   text("Back", 220,580);
   if(mousePressed) {
     if(overButton(backButtonX, backButtonY, backButtonW, backButtonH)) {
      game.setGameState(0);
     }
   }  
}
