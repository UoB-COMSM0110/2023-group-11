int score = 0; //Score
boolean gamestart=false;  //StartScreen Screen
boolean gameover=false; //GameOver Screen
boolean wie=false;  //Tutorial Screen

float start_x_0 = 50;  //x für Auto 0 
float start_x_1 = 250; //x für Auto 1 -Spieler
float start_x_2 = 225; //x für Auto 2
float start_x_3 = 350; //x für Auto 3

float x_0; //x für Auto 0 
float x_1; //x für Auto 1 -Spieler
float x_2; //x für Auto 2
float x_3; //x für Auto 3


float y_0 = 400; //y für Auto 0
float y_1 = 600; //y für Auto 1
float y_2 = 400; //y für Auto 2
float y_3 = 400; //y für Auto 3


float btn_x = 80;  // Button x                  neu start
float btn_y = 620; // Button y                  neu start
float btn_w = 140; // Button breite             neu start
float btn_h = 50; // Button höhe                neu start

float btn_x_2 = 250; // Button x                 zurück zum Hauptmenü
float btn_y_2 = 620; // Button y                 zurück zum Hauptmenü
float btn_w_2 = 140; // Button breite            zurück zum Hauptmenü
float btn_h_2 = 50; // Button höhe               zurück zum Hauptmenü

float btn_x_3 = 80; // Button x                  Start
float btn_y_3 = 450; // Button y                 Start
float btn_w_3 = 140; // Button breite            Start
float btn_h_3 = 50; // Button höhe               Start

float btn_x_4 = 250; // Button x                 Wie wird gespielt
float btn_y_4 = 450; // Button y                 Wie Wird gespielt
float btn_w_4 = 140; // Button breite            Wie wird gespielt
float btn_h_4 = 50; // Button höhe               Wie wird gespielt


float btn_x_5 = 150; // Button x                 Wie wird gespielt zurück
float btn_y_5 = 550; // Button y                 Wie Wird gespielt zurück
float btn_w_5 = 140; // Button breite            Wie wird gespielt zurück
float btn_h_5 = 50; // Button höhe               Wie wird gespielt zurück

int AutoUeberholt_0 = 10;   //Score für Überholung von Auto 0
int AutoUeberholt_2 = 10;   //Score für Überholung von Auto 2
int AutoUeberholt_3 = 10;   //Score für Überholung von Auto 3

int Auto_width = 40;  //Auto breite (alle Autos)
int Auto_height = 80; //Auto höhe  (alle Autos)

int ScreenSize_width = 450; //Display breite
int ScreenSize_height = 800; //Display höhe 

PImage LilaAuto, GruenAuto, SchwarzAuto, LilaAuto_Main,Hintergrund,StartImage, StrasseImage, GameOver;  //Variable für Bilder definieren


void setup() {
     size(450,800);  //Display Größe einstellen
     //Bilder
    LilaAuto =loadImage("Bilder/auto_lila.gif");
    LilaAuto_Main =loadImage("Bilder/auto_gruen.gif");
    Hintergrund = loadImage("Bilder/Hintergrund.jpg");
    StartImage = loadImage("Bilder/Start.png");
    StrasseImage = loadImage("Bilder/Hintergrund.jpg");
    GameOver = loadImage("Bilder/GameOver.png");
    
    //Positionen zum Starten 
    x_0=start_x_0;
    x_1=start_x_1;
    x_2=start_x_2;
    x_3=start_x_3;
    start_new_game();
}

void draw() {  
       if(gamestart==false && wie==false) {startScreen();}  //StartScreen
        else if (gameover==false && gamestart==true  && wie==false){game_running();} //Spiel läuft
        else if(wie==true) {tutorial(); } //Toturial
        else if(gameover==true) {gameOver();}  //GameOver 
        else if (gameover==false){startScreen();} //StartScreen
     
   


}

void game_running() {
  //Aufbau der Spielseite
 
            noCursor(); //Kein Mauszeiger
            //Autos
            image(Hintergrund ,0,0,ScreenSize_width,ScreenSize_height);
            
            image(LilaAuto,x_0,y_0, Auto_width, Auto_height);  //Bot auto 0          
            y_0 = y_0 +1.3;
            if(y_0>800) { //Wenn das Auto den obersten Teil erreicht hat fängt es wieder von vorne an
            y_0= 0;
            }
                 
            //x_1=mouseX;
            //if (x_1>360) {x_1=360;}  //Erkennung X Rechts damit das Auto in dem Screen bleibt
            //if (x_1<30) {x_1=30;}    //Erkennung X Links damit adas Auto in dem Screen bleibt
           
           // PLAYER CAR
           
            image(LilaAuto_Main,x_1 ,y_1, Auto_width,Auto_height);  //Spieler Auto
            //if(mousePressed) {
            //   y_1 = y_1 - 4 ; //Wenn maus gedrückt wird, wird die Geschwindigeit hoch gesetzt
            // } else {
            //  y_1 = y_1 +1 ;  //Wenn maus nicht gedrückt wird, wird die Geschwindigkeit auf 0.3 gesetzt
            //}
            
            if (keyPressed && key==CODED) {
              switch (keyCode) {
                case UP:
                  y_1 = y_1 -5;
                  break;
                case DOWN:
                  y_1 = y_1 + 3.5;
                  break;
                case LEFT:
                  x_1 = x_1 -4;
                  break;
                case RIGHT:
                  x_1 = x_1 + 4;
                  break;
                default:
                  break;
              }
            }
            
            if (y_1<150){
              y_1 = y_1 + 3;
              if (y_1<50){
                y_1 = y_1 + 4 ;
              }
            }
            else {
              y_1 = y_1 +1;
            }
            
           
            if(y_1>800) { //Erkennung oberer Teil
              gameover=true;
              //y_1 = 650;
            }            
           
            image(LilaAuto,x_2,y_2, Auto_width,Auto_height);  //Bot auto 2
            y_2 = y_2 +2.5;
            if(y_2>800) { //Erkennung oberer Teil
                y_2 = 0;
            }
           
            image(LilaAuto,x_3,y_3, Auto_width,Auto_height);  //Bot auto 3
            y_3+=3;
            if(y_3>800) { //Erkennung oberer Teil
               y_3 = 0;
            }
           
 
 
           
           //Score Anzeige
           textAlign(LEFT);
           fill(1);
           textSize(25);
           text("Score:" + str(score), 20,25);
         
           //Prüfen auf Koolision
           //Es wird geprüft ob das Spielerauto mit einem Bot Auto koolidiert hat. Das passiert indem die 4 Ecken von dem Spielerauto überprüfen, ob min. eine Ecke in dem Bereich von einem Bot Auto eindringt.
           //Auto 0
           if((x_1 > x_0 && x_1 < x_0+Auto_width && y_1>y_0 && y_1 < y_0 + Auto_height)  
              || (x_1+Auto_width > x_0 && x_1+Auto_width < x_0+Auto_width && y_1>y_0 && y_1 < y_0 + Auto_height)
              || (x_1 > x_0 && x_1 < x_0+Auto_width && y_1+Auto_height>y_0 && y_1+Auto_height < y_0 + Auto_height)
              || (x_1+Auto_width > x_0 && x_1+Auto_width < x_0+Auto_width && y_1+Auto_height>y_0 && y_1+Auto_height < y_0 + Auto_height)
              ) {
              gameOver();
              //Auto 2
           } else if((x_1 > x_2 && x_1 < x_2+Auto_width && y_1>y_2 && y_1 < y_2 + Auto_height) //Auto 2
              || (x_1+Auto_width > x_2 && x_1+Auto_width < x_2+Auto_width && y_1>y_2 && y_1 < y_2 + Auto_height)
              || (x_1 > x_2 && x_1 < x_2+Auto_width && y_1+Auto_height>y_2 && y_1+Auto_height < y_2 + Auto_height)
              || (x_1+Auto_width > x_2 && x_1+Auto_width < x_2+Auto_width && y_1+Auto_height>y_2 && y_1+Auto_height < y_2 + Auto_height)
              ) {
              gameOver();
              //Auto 3
           } else if((x_1 > x_3 && x_1 < x_3+Auto_width && y_1>y_3 && y_1 < y_3 + Auto_height) //Auto 2
              || (x_1+Auto_width > x_3 && x_1+Auto_width < x_3+Auto_width && y_1>y_3 && y_1 < y_3 + Auto_height)
              || (x_1 > x_3 && x_1 < x_3+Auto_width && y_1+Auto_height>y_3 && y_1+Auto_height < y_3 + Auto_height)
              || (x_1+Auto_width > x_3 && x_1+Auto_width < x_3+Auto_width && y_1+Auto_height>y_3 && y_1+Auto_height < y_3 + Auto_height)
              ) {
              gameOver();
           }
           
           
           //Score Einstellungen
           //Wenn Score noch nicht addiert wurde ist der überholscore = 10, wenn das BotAuto um min. 1 pixel überholt wird, dann wird die Variable überhlscore zu Variable score addiert und der Variable überholscore auf 0 gesetzt.
           //Danach wird geprüft ob ein BotAuto um min. 5 pixel sich entfernt hat, dann wird die Variable überholscore von überholtem Auto wieder auf 10 gesetzt.
          //Auto 0
          if (AutoUeberholt_0==10 && y_1<=y_0 && y_1>=y_0-5) {
              score=score+AutoUeberholt_0;
              AutoUeberholt_0=0;
          }
          if (AutoUeberholt_0==0 && y_1>=y_0+15 && y_1>=y_0+5) {AutoUeberholt_0=10;}
         
          //Auto 2
          if (AutoUeberholt_2==10 && y_1<=y_2 && y_1>=y_2-5) {
              score=score+AutoUeberholt_2;
              AutoUeberholt_2=0;
          }
          if (AutoUeberholt_2==0 && y_1>=y_2+15 && y_1>=y_2+5) {AutoUeberholt_2=10;}
         
          //Auto 3
          if (AutoUeberholt_3==10 && y_1<=y_3 && y_1>=y_3-5) {
              score=score+AutoUeberholt_3;
              AutoUeberholt_3=0;
          }
          if (AutoUeberholt_3==0 && y_1>=y_3+15 && y_1>=y_3+5) {AutoUeberholt_3=10;}        
       
}

 void gameOver() {
   //Aufbau GameOverSeite
     image(GameOver,0,0, ScreenSize_width,ScreenSize_height);
     gameover=true;
     cursor();
     textAlign(CENTER);
     textSize(80);
     fill(1);
      textSize(50);
     text(score, 370,590);  //Score Anzeige

         
     //Button zum neu starten
     fill(255);
     rect(btn_x,btn_y,btn_w,btn_h); //Button
     fill(0);
     textSize(25);
     text("Neu starten", 150,650);
     
     //Button zurück zum Hauptmenü
     fill(255);
     rect(btn_x_2,btn_y_2,btn_w_2,btn_h_2); //Button
     textSize(25);
     fill(0);
     text("MENÜ",320,650);
     
     if(mousePressed) {
     if(mouseX>btn_x_2 && mouseX <btn_x_2+btn_w_2 && mouseY>btn_y_2 && mouseY <btn_y_2+btn_h_2) {
       gamestart=false;
       gameover=false;
     } else if(mouseX>btn_x && mouseX <btn_x+btn_w && mouseY>btn_y && mouseY <btn_y+btn_h){   //Erkennung ob der Button gedrückt wird{
       start_new_game();
     }  
  }     
}

void start_new_game() {
     // variablen zurücksetzten
     score = 0;
     x_0=start_x_0;
     x_1=start_x_1;
     x_2=start_x_2;
     x_3=start_x_3;
           
     y_0 = 250;  
     y_1 = 500;  
     y_2 = 250;
     y_3 = 250;
     
     gameover=false;
 

}

void startScreen() {
  cursor();
  image(StartImage,0,0,ScreenSize_width,ScreenSize_height); //Hintergrund Dild
 
  //Button zum Starten
  fill(255);
  rect(btn_x_3,btn_y_3,btn_w_3,btn_h_3);
  fill(0);
  textSize(25);
  textAlign(CENTER);
  text("START", 150, 484);
 
 
 
  //Button für Tutorial
  fill(255);
  rect(btn_x_4,btn_y_4,btn_w_4,btn_h_4);
  fill(0);
  textSize(25);
  textAlign(CENTER);
  text("TUTORIAL", 320, 484);
   
 
  if(mousePressed) {
    if(mouseX>btn_x_3 && mouseX <btn_x_3+btn_w_3 && mouseY>btn_y_3 && mouseY <btn_y_3+btn_h_3){
      start_new_game();
      gamestart=true;
    } else if(mouseX>btn_x_4 && mouseX <btn_x_4+btn_w_4 && mouseY>btn_y_4 && mouseY <btn_y_4+btn_h_4){
               wie=true;
           }  
  }
 



}

//Tutorial
void tutorial() {
  background(255);
  fill(0);
  textSize(65);
  textAlign(CENTER);
  textSize(25);
 
  //Tutorial Text
  text("-Du bist ein Rennfahrer ", 225, 50);
  text(" und musst die anderen ", 225, 100);
  text(" Rennfahrer überholen ", 225, 150);
 
  text("-Dein Score erhöht sich  ", 225, 200);
  text(" jedesmal um 10 , wenn du ein  ", 225, 250);
  text("  Auto überholst  ", 225, 300);
 
  text("-Wenn du die Maustaste   ", 225, 350);
  text( "gedrückt hältst,    ", 225, 400);
  text(" tretest du auf das Gaspedal. ", 225, 450);
 
 
  //Zurück button
  fill(255);
  rect(btn_x_5,btn_y_5,btn_w_5,btn_h_5); //Button
  fill(0);
  text("Zurück", 220,580);
  if(mousePressed) {
    if(mouseX>btn_x_5 && mouseX <btn_x_5+btn_w_5 && mouseY>btn_y_5 && mouseY <btn_y_5+btn_h_5) {
      wie=false;
    }
  }  
 
}
