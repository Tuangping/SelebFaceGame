//<<<<<<< Updated upstream
void home() {
  if (home) {
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
    //homeCanvas.rect(width/5,200,width/5,height/5);
    homeCanvas.image(pew, width/5, 200, width/5, height/5);
    //homeCanvas.rect(width/5*2,200,width/5,height/5);
    homeCanvas.image(ksi, width/5*2, 200, width/5, height/5);
    //homeCanvas.rect(width/5*3,200,width/5,height/5);
    homeCanvas.image(js, width/5*3, 200, width/5, height/5);
    //homeCanvas.rect(width/5,height/5+200,width/5,height/5);
    homeCanvas.image(gm, width/5, height/5+200, width/5, height/5);
    //homeCanvas.rect(width/5*2,height/5+200,width/5,height/5);
    homeCanvas.image(shane, width/5*2, height/5+200, width/5, height/5);
    //homeCanvas.rect(width/5*3,height/5+200,width/5,height/5);
    homeCanvas.image(bb, width/5*3, height/5+200, width/5, height/5);
    //homeCanvas.rect(width/5,height/5*2+200,width/5,height/5);
    homeCanvas.image(gg, width/5, height/5*2+200, width/5, height/5);
    //homeCanvas.rect(width/5*2,height/5*2+200,width/5,height/5);
    homeCanvas.image(pom, width/5*2, height/5*2+200, width/5, height/5);
    //homeCanvas.rect(width/5*3,height/5*2+200,width/5,height/5);
    homeCanvas.image(nk, width/5*3, height/5*2+200, width/5, height/5);
    homeCanvas.endDraw();
    if (mouseX>width/5&&mouseX<width/5*2&&mouseY>200&&mouseY<height/5+200) {
      mouseOver=1;     
      //println("PewDiePie");
    }
    if (mouseX>width/5*2 && mouseX<width/5*3 && mouseY>200 && mouseY<height/5+200) {
      mouseOver= 2;    
      //println("KSI");
    }
    if (mouseX>width/5*3 && mouseX<width/5*4 && mouseY>200 && mouseY<height/5+200) {
      mouseOver=3;     
      //println("Jeffree");
    }
    if (mouseX>width/5 && mouseX<width/5*2 && mouseY>height/5+200 && mouseY<height/5+370) {
      mouseOver=4;    
      //println("German");
    }
    if (mouseX>width/5*2 && mouseX<width/5*3 && mouseY>height/5+200 && mouseY<height/5+370) {
      mouseOver=5;    
      //println("Shane");
    }
    if (mouseX>width/5*3 && mouseX<width/5*4 && mouseY>height/5+200 && mouseY<height/5+370) {
      mouseOver=6;    
      //println("BB");
    }
    if (mouseX>width/5 && mouseX<width/5*2 && mouseY>height/5*2+200 && mouseY<height/5*2+370) {
      mouseOver=7;    
      //println("Gigi");
    }
    if (mouseX>width/5*2 && mouseX<width/5*3 && mouseY>height/5*2+200 && mouseY<height/5*2+370) {
      mouseOver=8;    
      //println("SoftPomz");
    }
    if (mouseX>width/5*3 && mouseX<width/5*4 && mouseY>height/5*2+200 && mouseY<height/5*2+370) {
      mouseOver=9;    
      //println("Nikkie");
    }
    ///
    image(homeCanvas, 0, 0);
//=======
/*
void home(){
  //background(255);
  if(home){
  homeCanvas.beginDraw();
  homeCanvas.textAlign(CENTER);
  homeCanvas.fill(0);
  homeCanvas.stroke(1);
  homeCanvas.textFont(Head);
  homeCanvas.text("iCeleb", width/2, 60);
  homeCanvas.textFont(subTitle);
  homeCanvas.text("SERIES 1. YOUTUBE. FAMOUS ME.", width/2, 100);
  //homeCanvas.image(js,width/5,200,width/5,height/5);
  homeCanvas.noFill();
  homeCanvas.rect(width/5,200,width/5,height/5);
  homeCanvas.rect(width/5*2,200,width/5,height/5);
  homeCanvas.rect(width/5*3,200,width/5,height/5);
  homeCanvas.rect(width/5,height/5+200,width/5,height/5);
  homeCanvas.rect(width/5*2,height/5+200,width/5,height/5);
  homeCanvas.rect(width/5*3,height/5+200,width/5,height/5);
  homeCanvas.rect(width/5,height/5*2+200,width/5,height/5);
  homeCanvas.rect(width/5*2,height/5*2+200,width/5,height/5);
  homeCanvas.rect(width/5*3,height/5*2+200,width/5,height/5);
  homeCanvas.endDraw();
  if(mouseX>width/5&&mouseX<width/5*2&&mouseY>200&&mouseY<height/5+200){
  mouseOver=1; //Nikki
  }
  ///
  image(homeCanvas,0,0);*/
//>>>>>>> Stashed changes
  }
}