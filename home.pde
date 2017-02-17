PImage js,ksi,nk;

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
  mouseOver=1;
  }
  ///
  image(homeCanvas,0,0);
  }
}