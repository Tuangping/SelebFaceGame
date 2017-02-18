void setupNewUI(){
  //fullScreen(); //full screen size is 1440x900
  textAlign(CENTER);
  Head = createFont("SanFranciscoDisplay-Bold.otf", 32);
  subTitle = createFont("SanFranciscoDisplay-Regular.otf", 12);
  canvas = createGraphics(width/2, height/2);
  homeCanvas = createGraphics(width, height);
  fill(0);
  myMovie = new Movie(this, "/NK8_trim.mp4"); 
  // put after cam.start to get it play at the same time.
  qBtn = loadImage("quitBtn.png");
  rBtn = loadImage("reSetBtn.png");
  loopBtn = loadImage("loopBtn.png");
  light = loadImage("redLight.png");
  js=loadImage("js.jpg");
  ksi=loadImage("ksi.jpg");
  nk=loadImage("nk.jpg");
}

void drawUI() {
  //println(width+" "+height);
  background(255);
  if (home) {   
    home();
  } else {
    if (cam.available() ==true) {
      cam.read();
    }  
  
    if (myMovie.available()) {
      myMovie.read();
     
    }
    image(myMovie, 0, 200, width/2, height/2);

    pushMatrix(); 
    translate(canvas.width, 0);
    scale(-1, 1); 
    canvas.beginDraw();
    canvas.image(cam, 0, 0, canvas.width, canvas.height);
    canvas.endDraw();
    image(canvas, -canvas.width, 200);
    popMatrix();
    names();
    gameSet();
    image(qBtn, 10, 10, 50, 50);
    image(rBtn, 20, 570, 50, 50);
    image(light, width/2+20, 570, 50, 50);
    image(loopBtn, 80, 570, 50, 50);
  }
}

void names() {
  textFont(Head);
  textSize(24);
  text("Facial Famous Points: "+score, width/2, 100);
  textFont(subTitle);
  textSize(20);
  text("Nikkie", width/4, 180);
  text("The Next Celeb", width-(width/4), 180);
  text(words, width/2, height-100);
}

void gameSet() {
  if (myMovie.time() == myMovie.duration()) {
    readytoPlay=true;
  }
  if (readytoPlay) {
    if (play) {
      light = loadImage("greenLight.png");
    } else {
      light = loadImage("pauseBtn.png");
    }
  } else {
    if (play) {
      light = loadImage("redLight.png");
    } else {
      light = loadImage("pauseBtn.png");
    }
  }
}
void mousePressed() {
  if (!home) {
    //pause at light
    if (mouseX > width/2+20 && mouseX < width/2+70) {
      if (mouseY > 570 && mouseY <620 ) {
        println("pause");
        if (play) {
          myMovie.pause();
          myMovie.volume(0);
          play=false;
        } else {
          if (!readytoPlay) {
            light = loadImage("redLight.png");
          } else {
            light = loadImage("greenLight.png");
          }
          myMovie.play();
          play=true;
        }
      }
    }
    //exit
    if (mouseX>10&&mouseX<60) {
      if (mouseY>10&&mouseY<70) {
        println("exit");
        home=true;
        myMovie.stop();
        canvas.beginDraw();
        canvas.clear();
        canvas.endDraw();
        readytoPlay=false;
      }
    }
    //reset
    if (mouseX>20&&mouseX<70) {
      if (mouseY > 570 && mouseY <620) {
        println("reset");
        float mt = myMovie.time();
        if (mt >0) {
          myMovie.jump(0);
          if (!readytoPlay) {
            light = loadImage("redLight.png");
          } else {
            light = loadImage("greenLight.png");
          }
          myMovie.noLoop();
          myMovie.play();
          play=true;
        }
      }
    }
    //loop vid
    if (mouseX>80&&mouseX<130) {
      if (mouseY>570&&mouseY<620) {
        myMovie.jump(0);
        myMovie.loop();
      }
    }
  }
   else{
   if(mouseOver==1){
     homeCanvas.beginDraw();
     homeCanvas.clear();
     homeCanvas.endDraw();
     home=false;
     mouseOver=0;
     myMovie.play();
     }
   }
}