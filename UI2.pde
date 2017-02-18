
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
  } else {
    if (mouseOver==1) { //Nikki
      homeCanvas.beginDraw();
      homeCanvas.clear();
      homeCanvas.endDraw();
      home=false;
      mouseOver=0;
      myMovie.play();
    }
  }
}