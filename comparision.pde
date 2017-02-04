/*    newRow.setInt("frameCount", infoTable.lastRowIndex());
    newRow.setFloat("LBrowH", leftEyebrowHeight);
    newRow.setFloat("RBrowH", rightEyebrowHeight);
    newRow.setFloat("LEyeH", eyeLeftHeight);
    newRow.setFloat("REyeH", eyeRightHeight);
    newRow.setFloat("nose", nostrilHeight);
    newRow.setFloat("MouseH", mouthHeight);
    newRow.setFloat("MouseW", mouthWidth);
    newRow.setFloat("OriX", poseOrt_x);
    newRow.setFloat("OriY", poseOrt_y);
    newRow.setFloat("OriZ", poseOrt_z);*/
int area =10; //thereshoe
int score;
void compare(){
  if(LBrowH-area <leftEyebrowHeight && LBrowH+area >leftEyebrowHeight){
    score++;
  }
  if (RBrowH-area<rightEyebrowHeight && RBrowH+area >rightEyebrowHeight){
  
  }
  if(LEyeH-area< eyeLeftHeight && LEyeH+area> eyeLeftHeight){
  
  }
  if(REyeH-area< eyeRightHeight && REyeH+area >eyeRightHeight ){
  }
  if(nose-area< nostrilHeight && nose+area >nostrilHeight){
  }
  if(MouseH-area< mouthHeight && MouseH+area> mouthHeight){
  }
  if (MouseW-area< mouthWidth && MouseW+area> mouthWidth){
  }
  if(OriX-area<poseOrt_x && OriX+area>poseOrt){
  }
  if(OriY-area<poseOrt_y && OriY+area>poseOrt_y){
  }
  if(OriZ-area<poseOrt_z && OriZ+area>poseOrt_z){
  }
}

void score(){
  if (score < 40){
    println("You are such a mundane person.");
  } else if (score>=40 && score<=80){
    println("Your acting is ok but still too boring.");
  } else if ( score>80 & score <=120){
    println("You are kidda fancy person.");
  } else if ( score>120 & score <=180){
    println("Ahrr.. May be you can be a star one day.");
  }else if ( score>180 ){
    println("Yeah... you do good. Ready for a celeb life?");
  }
}