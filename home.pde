void home() {
    //println("mouseOver: "+mouseOver);
    homeCanvas.beginDraw();
    homeCanvas.background(255);
    homeCanvas.textAlign(CENTER);
    //homeCanvas.fill(0);
    //homeCanvas.stroke(1);
    //homeCanvas.textFont(Head);
    //homeCanvas.text("iCeleb", width/2, 80);
    //homeCanvas.textFont(subTitle);
    //homeCanvas.text("SERIES 1. YOU TUBE ME.", width/2, 120);
    homeCanvas.image(title, width/2-185, 40);
    homeCanvas.noFill();
    homeCanvas.image(pew, width/5, 200, width/5, height/5);
    homeCanvas.image(ksi, width/5*2, 200, width/5, height/5);
    homeCanvas.image(js, width/5*3, 200, width/5, height/5);
    homeCanvas.image(gm, width/5, height/5+200, width/5, height/5);
    homeCanvas.image(shane, width/5*2, height/5+200, width/5, height/5);
    homeCanvas.image(bb, width/5*3, height/5+200, width/5, height/5);
    homeCanvas.image(gg, width/5, height/5*2+200, width/5, height/5);
    homeCanvas.image(pom, width/5*2, height/5*2+200, width/5, height/5);
    homeCanvas.image(nk, width/5*3, height/5*2+200, width/5, height/5);
    homeCanvas.endDraw();
    if (mouseX>width/5&&mouseX<width/5*2&&mouseY>200&&mouseY<height/5+200) {mouseOver=1;//println("PewDiePie");
    }if (mouseX>width/5*2 && mouseX<width/5*3 && mouseY>200 && mouseY<height/5+200) {mouseOver= 2;//println("KSI");
    }if (mouseX>width/5*3 && mouseX<width/5*4 && mouseY>200 && mouseY<height/5+200) {mouseOver=3;//println("Jeffree");
    }if (mouseX>width/5 && mouseX<width/5*2 && mouseY>height/5+200 && mouseY<height/5+370) {mouseOver=4;//println("German");
    }if (mouseX>width/5*2 && mouseX<width/5*3 && mouseY>height/5+200 && mouseY<height/5+370) {mouseOver=5;//println("Shane");
    }if (mouseX>width/5*3 && mouseX<width/5*4 && mouseY>height/5+200 && mouseY<height/5+370) {mouseOver=6;//println("BB");
    }if (mouseX>width/5 && mouseX<width/5*2 && mouseY>height/5*2+200 && mouseY<height/5*2+370) {mouseOver=7;//println("Gigi");
    }if (mouseX>width/5*2 && mouseX<width/5*3 && mouseY>height/5*2+200 && mouseY<height/5*2+370) {mouseOver=8;//println("SoftPomz");
    }if (mouseX>width/5*3 && mouseX<width/5*4 && mouseY>height/5*2+200 && mouseY<height/5*2+370) {mouseOver=9;//println("Nikkie");
    }
    image(homeCanvas, 0, 0);
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