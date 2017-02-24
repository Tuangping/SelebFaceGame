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
///
//videoScreen Buttons
PImage Btn01,Btn02,Btn03,Btn04,Btn05;
///
boolean found;

float poseScale, posePos_x, posePos_y, poseOrt_x, poseOrt_y, poseOrt_z;
float leftEyebrowHeight, rightEyebrowHeight, eyeLeftHeight, eyeRightHeight, mouthWidth, mouthHeight, nostrilHeight;
int programFrame, videoFrame = 0, i;
//reference values
int NKframe;
float NKBrowL, NKBrowR, NKEyeL, NKEyeR, NKNose, NKMouthH, NKMouthW, NKOriX, NKOriY, NKOriZ;
boolean play=true, readytoPlay=false, home=true, videoScreen=false, gameMode =false, endOfClip = false, tutorial= false;
int waveCount = 0;
int mouseOver=0;
PImage js,ksi,nk,bb,gm,gg,pew,pom,shane,title;

//settings
int w = 1440, h = 860, score =0;
public String scoreString="";
float area =0.2; 
float ori = 0.01;
void settings() {
  size(w, h, P3D);
}
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
  //canvas = createGraphics(w, h, P3D);
  frameRate(30);
}

//XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

void draw() {
  drawUI();
  //loadReferTable();
  //frameCount = programFrame;
  if(gameMode){
    comparison();
    println("GameMode");
    //println("videoframe : " + videoFrame + "  Mtime : "+round(myMovie.time()*10)/10.0 + "  MDuration : "+ floor(myMovie.duration()*10)/10.0);
  }
  //exportFiles();///saveStringfile

  //println("FC in draw: "+frameCount);
  //println("FRAMECOUNT : "+frameCount+"    SCORE : "+score);
  //saveTable(infoTable, "table.csv");//,"html");
}