import oscP5.*;
import processing.video.*;
import com.hamoid.*;

OscP5 oscP5;
Capture cam;
Movie myMovie;
PFont Head;
PFont subTitle;
PImage light; //playing signal
PImage qBtn;//quitGame to Homescreen
PImage pBtn;//pause
PImage rBtn;//resetGame
PImage loopBtn;//loop vid
PGraphics homeCanvas;
PGraphics canvas;
PVector[] meshPoints;
PVector posePosition, poseOrientation;
Table infoTable, referTable;

boolean found;

float poseScale, posePos_x, posePos_y, poseOrt_x, poseOrt_y, poseOrt_z;
float leftEyebrowHeight, rightEyebrowHeight, eyeLeftHeight, eyeRightHeight, mouthWidth, mouthHeight, nostrilHeight;
//
int programFrame, videoFrame, i;
//reference values
int NKframe;
float NKBrowL, NKBrowR, NKEyeL, NKEyeR, NKNose, NKMouthH, NKMouthW, NKOriX, NKOriY, NKOriZ;
boolean play=true, readytoPlay=false, home=true;
int mouseOver=0;

//settings
int w = 1440, h = 860, score =0;
String scoreString="", words="XXXXXXXX";
//int area =1; //threshold
/*void settings() {
  size(w, h, P3D);
}*/
void setup() {
  setupNewUI();
  noStroke();
  smooth();
  ellipseMode(CENTER);
  //XXXXXXXXXXXXXXXXXX
  //CAMERA PLUG-INS FOR LIVE PLAYING
  //XXXXXXXXXXXXXXXXXX
  String[] cameras = Capture.list();
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  }      
  //cam = new Capture(this, cameras[1]); //built in mac cam "isight"
  //cam = new Capture(this,1280,960, "USB Camera");
  cam = new Capture(this, cameras[0]);
  cam.start();
  
  //XXXXXXXXXXXXXXXXXX
  //FACEOSC PLUG-INS
  //XXXXXXXXXXXXXXXXXX
  posePosition = new PVector();
  poseOrientation = new PVector();
  initMesh();
  oscP5 = new OscP5(this, 8338);
  // USE THESE 2 EVENTS TO DRAW THE 
  // FULL FACE MESH:
  oscP5.plug(this, "found", "/found");
  oscP5.plug(this, "loadMesh", "/raw");
  oscP5.plug(this, "eyeLeftReceived", "/gesture/eye/left");
  oscP5.plug(this, "eyeRightReceived", "/gesture/eye/right");
  oscP5.plug(this, "eyebrowLeftReceived", "/gesture/eyebrow/left");
  oscP5.plug(this, "eyebrowRightReceived", "/gesture/eyebrow/right");
  oscP5.plug(this, "mouthHeightReceived", "/gesture/mouth/height");
  oscP5.plug(this, "mouthWidthReceived", "/gesture/mouth/width");
  oscP5.plug(this, "nostrilsReceived", "/gesture/nostrils");
  oscP5.plug(this, "jawReceived", "/gesture/jaw");
  oscP5.plug(this, "posePosition", "/pose/position");
  oscP5.plug(this, "poseScale", "/pose/scale");
  oscP5.plug(this, "poseOrientation", "/pose/orientation");
  infoTable = new Table();
  infoTable.addColumn("frameCount");
  infoTable.addColumn("LBrowH");
  infoTable.addColumn("RBrowH");
  infoTable.addColumn("LEyeH");
  infoTable.addColumn("REyeH");
  infoTable.addColumn("nose");
  infoTable.addColumn("MouseH");
  infoTable.addColumn("MouseW");
  infoTable.addColumn("OriX");
  infoTable.addColumn("OriY");
  infoTable.addColumn("OriZ");
  //saveTable(infoTable, "table.csv");
  //loadReferTable();
  referTable = loadTable("NikkiVideoData.csv", "header");
  canvas = createGraphics(w, h, P3D);
  frameRate(30);
}

//XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

void draw() {
  drawUI();
  //loadReferTable();
  //frameCount = programFrame;
  if (eyeLeftHeight != 0.0&& plugged) {
    //reportFrame();
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
    if (frameCount<90) {
      TableRow row = referTable.getRow(frameCount);
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
    println("///////////////////////////////CSV : "+NKBrowL +"  WEBCAM : "+leftEyebrowHeight + "  SCORE : "+score);
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
    textSize(60);
    text(score+"\n"+scoreString, 30, 100);
    if (frameCount >=90) {
      result();
      frameCount =0;
      score = 0;
    }
  } else {
    frameCount =0;
    score = 0;
  }
  //exportFiles();///saveStringfile

  //println("FC in draw: "+frameCount);
  //println("FRAMECOUNT : "+frameCount+"    SCORE : "+score);
  saveTable(infoTable, "table.csv");//,"html");
}

float area =0.2; //threshold
float ori = 0.01;
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
    if (NKBrowL-area <leftEyebrowHeight && NKBrowL+area >leftEyebrowHeight) {
      score++;
    }
    if (NKBrowR-area<rightEyebrowHeight && NKBrowR+area >rightEyebrowHeight) {
      score++;
    }
    if (NKEyeL-area< eyeLeftHeight && NKEyeL+area> eyeLeftHeight) {
      score++;
    }
    if (NKEyeR-area< eyeRightHeight && NKEyeR+area >eyeRightHeight ) {
      score++;
    }
    if (NKNose-area< nostrilHeight && NKNose+area >nostrilHeight) {
      score++;
    }
    if (NKMouthH-area< mouthHeight && NKMouthH+area> mouthHeight) {
      score++;
    }
    if (NKMouthW-area< mouthWidth && NKMouthW+area> mouthWidth) {
      score++;
    }
    if (NKOriX-ori<poseOrt_x && NKOriX+ori>poseOrt_x) {
      score++;
    }
    if (NKOriY-ori<poseOrt_y && NKOriY+ori>poseOrt_y) {
      score++;
    }
    if (NKOriZ-ori<poseOrt_z && NKOriZ+ori>poseOrt_z) {
      score++;
    }
  }
}
/*void dataComparsion(Table table){
 }*/
void result() {
  if (score < 300) {
    //text(score+"You are such a mundane person.",100,150);
    //text();
    scoreString = "You are such a mundane person.";
  } else if (score>=300 && score<=450) {
    println(score+"Your acting is ok but still too boring.");
    //text(score+"Your acting is ok but still too boring.",100,150);
    scoreString = "Your acting is ok but still too boring.";
  } else if ( score>450 & score <=650) {
    println(score+"You are kidda fancy person.");
    scoreString = "You are kidda fancy person.";
    //text(score+"You are kidda fancy person.",100,150);
  } else if ( score>650 & score <=800) {
    println(score+"Ahrr.. May be you can be a star one day.");
    scoreString = "Ahrr.. May be you can be a star one day.";
    //text(score+"Ahrr.. May be you can be a star one day.",100,150);
  } else if ( score>800 ) {
    println(score+"Yeah... you do good. Ready for a celeb life?");
    scoreString = "Yeah... you do good. Ready for a celeb life?";
    //text(score+"Yeah... you do good. Ready for a celeb life?",100,150);
  }
}
void Score() {
}