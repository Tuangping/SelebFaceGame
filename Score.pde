void comparison(){
  if (eyeLeftHeight != 0.0&& plugged) {
    //reportFrame();
    videoFrame++;
    if (videoFrame<90) {//frameCount
      TableRow row = referTable.getRow(videoFrame); //sync to the referTable it was frameCount
      NKframe = row.getInt("frameCount");
      NKBrowL = row.getFloat("LBrowH");
      NKBrowR = row.getFloat("RBrowH");
      NKEyeL = row.getFloat("LEyeH");
      NKEyeR = row.getFloat("REyeH");
      NKNose = row.getFloat("nose");
      NKMouthH = row.getFloat("MouseH");
      NKMouthW = row.getFloat("MouseW");
      NKOriX = row.getFloat("OriX");
      NKOriY = row.getFloat("OriY");
      NKOriZ = row.getFloat("OriZ");
    }
    //scoreStringChange();
    if (endOfClip) { //frameCount >=90
      //scoreStringChange();
      //frameCount =0;
      score = 0;
      println("show the SCORE HERE");
      endOfClip = false;
    }else{
      scoreStringChange();
    }
  } else {
    frameCount =0;
    score = 0;
  }
}

void scoreStringChange() {
  println("///////////////////////////////FRAME : " + NKframe+ "  CSV : "+NKBrowL +"  WEBCAM : "+leftEyebrowHeight + "  SCORE : "+score);
  if (NKBrowL-area <leftEyebrowHeight && NKBrowL+area >leftEyebrowHeight) {score++;}
  if (NKBrowR-area<rightEyebrowHeight && NKBrowR+area >rightEyebrowHeight) {score++;}
  if (NKEyeL-area< eyeLeftHeight && NKEyeL+area> eyeLeftHeight) {score++;}
  if (NKEyeR-area< eyeRightHeight && NKEyeR+area >eyeRightHeight ) {score++;}
  if (NKNose-area< nostrilHeight && NKNose+area >nostrilHeight) {score++;}
  if (NKMouthH-area< mouthHeight && NKMouthH+area> mouthHeight) {score++;}
  if (NKMouthW-area< mouthWidth && NKMouthW+area> mouthWidth) {score++;}
  if (NKOriX-area<poseOrt_x && NKOriX+area>poseOrt_x) {score++;}
  if (NKOriY-area<poseOrt_y && NKOriY+area>poseOrt_y) {score++;}
  if (NKOriZ-area<poseOrt_z && NKOriZ+area>poseOrt_z) {score++;}
  
  if (score < 400) {scoreString = "You are such a mundane person.";} 
  else if (score>=500 && score<=500) {scoreString = "Your acting is ok but still too boring.";} 
  else if ( score>500 & score <=600) {scoreString = "You are kidda fancy person.";}
  else if ( score>600 & score <=700) {scoreString = "Ahrr.. May be you can be a star one day.";} 
  else if ( score>700 ) {scoreString = "Yeah... you do good. Ready for a celeb life?";}
}

void loadReferTable() {
  //referTable = loadTable("NikkiVideoData.csv","header");
  //println(referTable.getRowCount() + "total rows in table");
  for (TableRow row : referTable.rows()) {
    NKframe = row.getInt("frameCount");
    NKBrowL = row.getFloat("LBrowH");
    NKBrowR = row.getFloat("RBrowH");
    NKEyeL = row.getFloat("LEyeH");
    NKEyeR = row.getFloat("REyeH");
    NKNose = row.getFloat("nose");
    NKMouthH = row.getFloat("MouseH");
    NKMouthW = row.getFloat("MouseW");
    NKOriX = row.getFloat("OriX");
    NKOriY = row.getFloat("OriY");
    NKOriZ = row.getFloat("OriZ");
    println("DATA FROM THE CSV : "+NKOriZ);
  }
}

void saveReferTable(){
  TableRow newRow = infoTable.addRow();
    newRow.setInt("frameCount", frameCount);//infoTable.lastRowIndex());
    newRow.setFloat("LBrowH", Math.round(leftEyebrowHeight*100)/100.0);
    newRow.setFloat("RBrowH", Math.round(rightEyebrowHeight*100)/100.0);
    newRow.setFloat("LEyeH", Math.round(eyeLeftHeight*100)/100.0);
    newRow.setFloat("REyeH", Math.round(eyeRightHeight*100)/100.0);
    newRow.setFloat("nose", Math.round(nostrilHeight*100)/100.0);  
    newRow.setFloat("MouseH", Math.round(mouthHeight*100)/100.0);
    newRow.setFloat("MouseW", Math.round(mouthWidth*100)/100.0);
    newRow.setFloat("OriX", Math.round(poseOrt_x*100)/100.0);
    newRow.setFloat("OriY", Math.round(poseOrt_y*1000)/1000.0);
    newRow.setFloat("OriZ", Math.round(poseOrt_z*100)/100.0);

}