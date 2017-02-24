void drawUI() {
  background(255);
  switch(MENU){
    case 'H' :
      home();
    break;
    case 'C' :
      //println("videoframe : " + videoFrame + "  Mtime : "+round(myMovie.time()*10)/10.0 + "  MDuration : "+ floor(myMovie.duration()*10)/10.0);
      if (myMovie.available()) {
        myMovie.read();
      }
      imageMode(CENTER);
      image(myMovie, width/2, height/2);
      textFont(subTitle);
      text("First, watch the video and learn how this star's face gesture is.", width/2, 45);
      image(Btn01, width/2-140, height-40, 50, 50);
      image(Btn02, width/2-70, height-40, 50, 50);
      image(Btn03, width/2, height-40, 50, 50);
      image(Btn04, width/2+70, height-40, 50, 50);
      image(Btn05, width/2+140, height-40, 50, 50);
      if (round(myMovie.time()*10)/10.0>=floor(myMovie.duration()*10)/10.0) {
        println("Exit charSel");
        Btn03=loadImage("Btn-03.png");
        myMovie.stop();
        play=true;
        println("print 10 : "+ play);
        myMovie = new Movie(this, "../NK8_trim.mp4"); 
        myMovie.speed(1);
        myMovie.play();
        MENU = 'G';
      }
    break;
    case 'G' :
      if (cam.available() ==true) { 
        cam.read();
      }  
      if (myMovie.available()) {
        myMovie.read();
      }
      imageMode(CORNER);
      image(myMovie, 0, 200, width/2, height/2);
      pushMatrix(); 
      translate(canvas.width, 0);
      scale(-1, 1); 
      canvas.beginDraw();
      canvas.image(cam, 0, 0, canvas.width, canvas.height);
      canvas.endDraw();
      image(canvas, -canvas.width, 200);
      popMatrix();
      scoreBoard();
      gameSet();
      image(qBtn, 10, 10, 50, 50);
      image(rBtn, 20, 570, 50, 50);
      image(light, width/2+20, 570, 50, 50);
      image(loopBtn, 80, 570, 50, 50);
    break;
  }
}

void gameSet() {
  switch (GAME){
    case 'T':
    break;
    case 'P':
    break;
    case 'S':
    break;
  }
  if (round(myMovie.time()*100)/100.0 >= floor(myMovie.duration()*100)/100.0) {///////LEFT VIDEO ends
    readytoPlay=true;
    videoFrame = 0;
    gameMode = true;
    //println("GameMode 6 : " + gameMode);
    endOfClip = true;
    //println("gameEnds");
  }if (readytoPlay) {
    if (play) {
      light = loadImage("greenLight.png");
      gameMode = true;
      //println("GameMode 7 : " + gameMode);
    } else {
      light = loadImage("pauseBtn.png");
    }
  } else {
    if (play) {
      light = loadImage("redLight.png");
      gameMode = false;
      //println("GameMode 8 : " + gameMode);
    } else {
      light = loadImage("pauseBtn.png");
    }
  }
}