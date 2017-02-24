
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
  if (home) {
    if (mouseOver==1) {
      println("mousePressed 1");
      homeCanvas.beginDraw();
      homeCanvas.clear();
      homeCanvas.endDraw();     
      myMovie = new Movie(this, "../data/vdos/pew_vid.mp4"); 
      myMovie.speed(1);
      myMovie.play();
      mouseOver=0;
      videoScreen=true;
      home=false;
      play=true;
    }
    if (mouseOver==2) {
      println("mousePressed 2");
      homeCanvas.beginDraw();
      homeCanvas.clear();
      homeCanvas.endDraw();     
      myMovie = new Movie(this, "../data/vdos/ksi_vid2.mp4"); 
      myMovie.speed(1);
      myMovie.play();
      mouseOver=0;
      videoScreen=true;
      home=false;
      play=true;
    }
    if (mouseOver==3) {
      println("mousePressed 3");
      homeCanvas.beginDraw();
      homeCanvas.clear();
      homeCanvas.endDraw();     
      myMovie = new Movie(this, "../data/vdos/js_vid.mp4"); 
      myMovie.speed(1);
      myMovie.play();
      mouseOver=0;
      videoScreen=true;
      home=false;
      play=true;
    } 
    if (mouseOver==4) {
      println("mousePressed 4");
      homeCanvas.beginDraw();
      homeCanvas.clear();
      homeCanvas.endDraw();     
      myMovie = new Movie(this, "../data/vdos/German_vid.mp4"); 
      myMovie.speed(1);
      myMovie.play();
      mouseOver=0;
      videoScreen=true;
      home=false;
      play=true;
    } 
    if (mouseOver==5) {
      println("mousePressed 5");
      homeCanvas.beginDraw();
      homeCanvas.clear();
      homeCanvas.endDraw();     
      myMovie = new Movie(this, "../data/vdos/shane_vid.mp4"); 
      myMovie.speed(1);
      myMovie.play();
      mouseOver=0;
      videoScreen=true;
      home=false;
      play=true;
    } 
    if (mouseOver==6) {
      println("mousePressed 6");
      homeCanvas.beginDraw();
      homeCanvas.clear();
      homeCanvas.endDraw();     
      myMovie = new Movie(this, "../data/vdos/BB_vid.mp4"); 
      myMovie.speed(1);
      myMovie.play();
      mouseOver=0;
      videoScreen=true;
      home=false;
      play=true;
    } 
    if (mouseOver==7) {
      println("mousePressed 7");
      homeCanvas.beginDraw();
      homeCanvas.clear();
      homeCanvas.endDraw();     
      myMovie = new Movie(this, "../data/vdos/gigi_vid.mp4"); 
      myMovie.speed(1);
      myMovie.play();
      mouseOver=0;
      videoScreen=true;
      home=false;
      play=true;
    } 
    if (mouseOver==8) {
       println("mousePressed 8");
      homeCanvas.beginDraw();
      homeCanvas.clear();
      homeCanvas.endDraw();     
      myMovie = new Movie(this, "../data/vdos/pomz_vid.mp4"); 
      myMovie.speed(1);
      myMovie.play();
      mouseOver=0;
      videoScreen=true;
      home=false;
      play=true;
    } 
    if (mouseOver==9) { //Nikki 
      println("mousePressed 9");
      homeCanvas.beginDraw();
      homeCanvas.clear();
      homeCanvas.endDraw();     
      myMovie = new Movie(this, "../data/vdos/NK_vid.mp4"); 
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
  } else {
    // Game Mode
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
          myMovie.speed(1);
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
          myMovie.speed(1);
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
}