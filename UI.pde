String videoAddress = "";
void mousePressed() {
  if (home) {////////////////////////////////////////HOMEPAGE////////////////////////////////////////////
    if(mouseOver!=0){
      switch (mouseOver){
        case 1 :  videoAddress = "../data/vdos/pew_vid.mp4";  break;
        case 2 :  videoAddress = "../data/vdos/ksi_vid2.mp4"; break;
        case 3 :  videoAddress = "../data/vdos/js_vid.mp4";   break;
        case 4 :  videoAddress = "../data/vdos/German_vid.mp4";break;
        case 5 :  videoAddress = "../data/vdos/shane_vid.mp4";break;
        case 6 :  videoAddress = "../data/vdos/BB_vid.mp4";   break;
        case 7 :  videoAddress = "../data/vdos/gigi_vid.mp4"; break;
        case 8 :  videoAddress = "../data/vdos/pomz_vid.mp4"; break;
        case 9 :  videoAddress = "../data/vdos/NK_vid.mp4";   break;
      }
      homeCanvas.beginDraw();
      homeCanvas.clear();
      homeCanvas.endDraw();     
      myMovie = new Movie(this, videoAddress); 
      myMovie.speed(1);
      myMovie.play();
      mouseOver=0;
      videoScreen=true;
      home=false;
      play=true;
    }
  } else if (videoScreen) {
    //video control buttons
    if (mouseX>width/2-20 && mouseX<width/2+20 && mouseY>height-60 && mouseY <height-20) {
      if (play) {
        Btn03=loadImage("Btn-06.png");
        myMovie.pause();
        play=false;
      } else {
        Btn03=loadImage("Btn-03.png");
        myMovie.speed(1);
        myMovie.play();
        play=true;
      }
    } else if (mouseX<width/2+165 && mouseX>width/2+105 && mouseY>height-60 && mouseY <height-20) {
      println("Skip");
      Btn03=loadImage("Btn-03.png");
      myMovie.stop();
      play=true;
      myMovie = new Movie(this, "../NK8_trim.mp4"); 
      myMovie.speed(1);
      myMovie.play();
      videoScreen=false;
    } else if (mouseX>width/2-155 && mouseX<width/2-115 && mouseY>height-60 && mouseY <height-20) {
      println("Exit");
      Btn03=loadImage("Btn-03.png");
      imageMode(CORNER);
      myMovie.stop();
      play=true;
      videoScreen=false;
      home=true;
    }
    else if(mouseX>width/2-90 && mouseX<width/2-45 && mouseY>height-60 && mouseY <height-20){
     println("CurrentTime: "+myMovie.time());
     myMovie.jump(myMovie.time()-8.0);
     myMovie.play();
     play=true;
    }
    else if(mouseX<width/2+90 && mouseX>width/2+45 && mouseY>height-60 && mouseY <height-20){
    println("fastforward");
    myMovie.speed(8.0);
    myMovie.play();
    play=true;
    }
  } else {// Game Mode
    if ((mouseX > width/2+20 && mouseX < width/2+70)&&(mouseY > 570 && mouseY <620 )) {
        println("pause");
        if (play) {
          myMovie.pause();
          myMovie.volume(0);
          play=false;
          
          endOfClip = false;
        } else {
          if (!readytoPlay) {
            light = loadImage("redLight.png");
            gameMode = false;
            println("GameMode 1 : " + gameMode);
          } else {
            light = loadImage("greenLight.png");
            gameMode = true;
            println("GameMode 2 : " + gameMode);
          }
          myMovie.speed(1);
          myMovie.play();
          play=true; 
        }
    }if ((mouseX>20&&mouseX<70)&&(mouseY > 570 && mouseY <620)) {//reset
        println("reset");
        float mt = myMovie.time();
        if (mt >0) {
          myMovie.jump(0);
          if (!readytoPlay) {
            light = loadImage("redLight.png");
            gameMode = false;
            println("GameMode 3 : " + gameMode);
          } else {
            light = loadImage("greenLight.png");
            gameMode = true;
            println("GameMode 4 : " + gameMode);
          } 
          myMovie.noLoop();
          myMovie.speed(1);
          myMovie.play();
          play=true;
        }
    }if ((mouseX>80&&mouseX<130)&&(mouseY>570&&mouseY<620)) {//loop vid
        myMovie.jump(0);
        myMovie.loop();
    }if ((mouseX>10&&mouseX<60)&&(mouseY>10&&mouseY<70)) {//exit
        println("exit");
        home=true;
        myMovie.stop();
        canvas.beginDraw();
        canvas.clear();
        canvas.endDraw();
        readytoPlay=false;
    }
  }
}

void drawUI() {
  //println(width+" "+height);
  background(255);
  if (home) {
    home();
  } 
  else if (videoScreen){
     //println("videoframe : " + videoFrame + "  Mtime : "+round(myMovie.time()*10)/10.0 + "  MDuration : "+ floor(myMovie.duration()*10)/10.0);
    if (myMovie.available()) {
       myMovie.read();
    }
    imageMode(CENTER);
    image(myMovie, width/2, height/2);
    textFont(subTitle);
    text("First, watch the video and learn how this star's face gesture is.",width/2,45);
    image(Btn01,width/2-140,height-40,50,50);
    image(Btn02,width/2-70,height-40,50,50);
    image(Btn03, width/2, height-40,50,50);
    image(Btn04,width/2+70, height-40,50,50);
    image(Btn05,width/2+140,height-40,50,50);
   if (round(myMovie.time()*10)/10.0>=floor(myMovie.duration()*10)/10.0){
      println("Exit videoScreen");
      Btn03=loadImage("Btn-03.png");
      myMovie.stop();
      play=true;
      myMovie = new Movie(this, "../NK8_trim.mp4"); 
      myMovie.speed(1);
      myMovie.play();
      videoScreen=false;
   }
   }
  else {
    if (cam.available() ==true) { 
      cam.read();
    }  
    if (myMovie.available()) {
      myMovie.read();
    }
    imageMode(CORNER);
    image(myMovie, 0, 200, width/2, height/2);
    gameMode = true;
    println("GameMode 5 : " + gameMode);
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
  text(scoreString, width/2, height-100);
}
void gameSet() {
  if (round(myMovie.time()*100)/100.0 >= floor(myMovie.duration()*100)/100.0) {///////LEFT VIDEO ends
    readytoPlay=true;
    videoFrame = 0;
    gameMode = false;
    println("GameMode 6 : " + gameMode);
    endOfClip = true;
    println("gameEnds");
  }
  if (readytoPlay) {
    if (play) {
      light = loadImage("greenLight.png");
      gameMode = true;
      println("GameMode 7 : " + gameMode);
    } else {
      light = loadImage("pauseBtn.png");
    }
  } else {
    if (play) {
      light = loadImage("redLight.png");
      gameMode = false;
      println("GameMode 8 : " + gameMode);
    } else {
      light = loadImage("pauseBtn.png");
    }
  }
}