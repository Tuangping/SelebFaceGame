
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
  if (round(myMovie.time()*10)/10.0 == floor(myMovie.duration()*10)/10.0) {///////LEFT VIDEO ends
    readytoPlay=true;
    videoFrame = 0;
    gameMode = false;
    endOfClip = true;
  }
  if (readytoPlay) {
    if (play) {
      light = loadImage("greenLight.png");
      gameMode = true;
    } else {
      light = loadImage("pauseBtn.png");
    }
  } else {
    if (play) {
      light = loadImage("redLight.png");
      gameMode = false;
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
      mouseOver=10;
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
          
          endOfClip = false;
        } else {
          if (!readytoPlay) {
            light = loadImage("redLight.png");
            gameMode = false;
          } else {
            light = loadImage("greenLight.png");
            gameMode = true;
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
            gameMode = false;
          } else {
            light = loadImage("greenLight.png");
            gameMode = true;
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

void setupNewUI() {
  //fullScreen(); //full screen size is 1440x900
  textAlign(CENTER);
  Head = createFont("SanFranciscoDisplay-Bold.otf", 32);
  subTitle = createFont("SanFranciscoDisplay-Regular.otf", 12);
  canvas = createGraphics(w/2, h/2,P3D);
  homeCanvas = createGraphics(w, h);
  fill(0);
   //myMovie = new Movie(this, "../NK8_trim.mp4"); 
  // put after cam.start to get it play at the same time.
  qBtn = loadImage("quitBtn.png");
  rBtn = loadImage("reSetBtn.png");
  loopBtn = loadImage("loopBtn.png");
  light = loadImage("redLight.png");
  js=loadImage("thumbnails/JS.jpg");
  ksi=loadImage("thumbnails/ksi.jpg");
  nk=loadImage("thumbnails/nk.jpg");
  bb=loadImage("thumbnails/BB.jpg");
  gm=loadImage("thumbnails/German.jpg");
  gg=loadImage("thumbnails/gg.jpg");
  pew=loadImage("thumbnails/pew.jpg");
  pom=loadImage("thumbnails/pomz.jpg");
  shane=loadImage("thumbnails/shane.jpg");
  title=loadImage("cNNtitle.png");
  ///
  //videoScreen buttons
  Btn01=loadImage("Btn-01.png");
  Btn02=loadImage("Btn-02.png");
  Btn03=loadImage("Btn-03.png");
  Btn04=loadImage("Btn-04.png");
  Btn05=loadImage("Btn-05.png");
  
}
void drawUI() {
  //println(width+" "+height);
  background(255);
  if (home) {
    home();
  } 
  else if (videoScreen){
     //println("CurrentTime: "+myMovie.time()+" Video Time: "+ myMovie.duration());
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
   if (myMovie.time()>=myMovie.duration()-1){
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