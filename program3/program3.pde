import oscP5.*;
OscP5 oscP5;


boolean found;
PVector[] meshPoints;
float poseScale;
float posePos_x;
float posePos_y;
float poseOrt_x;
float poseOrt_y;
float poseOrt_z;
//
PVector posePosition;
PVector poseOrientation;
float leftEyebrowHeight;
float rightEyebrowHeight;
float eyeLeftHeight;
float eyeRightHeight;
float mouthWidth;
float mouthHeight;
float nostrilHeight;
//
int programFrame;
int videoFrame;
int i;
//info Array
float[][] info;
Table infoTable;

void setup(){
  noStroke();
  smooth();
  ellipseMode(CENTER);
  //size(640, 480);
  frameRate(30);
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
}

//XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

void draw(){
 //frameCount = programFrame;
 if (eyeLeftHeight != 0.0&& plugged){
    reportFrame();
    TableRow newRow = infoTable.addRow();
    newRow.setInt("frameCount", infoTable.lastRowIndex());
    newRow.setFloat("LBrowH", leftEyebrowHeight);
    newRow.setFloat("RBrowH", rightEyebrowHeight);
    newRow.setFloat("LEyeH", eyeLeftHeight);
    newRow.setFloat("REyeH", eyeRightHeight);
    newRow.setFloat("nose", nostrilHeight);
    newRow.setFloat("MouseH", mouthHeight);
    newRow.setFloat("MouseW", mouthWidth);
    newRow.setFloat("OriX", poseOrt_x);
    newRow.setFloat("OriY", poseOrt_y);
    newRow.setFloat("OriZ", poseOrt_z);
    
   //saveTable(infoTable, "table.csv");
 } else {
   frameCount =0;
 }
 //exportFiles();///saveStringfile

 println("FC in draw: "+frameCount);
 saveTable(infoTable, "table.csv");//,"html");
 
}

//XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
void reportFrame(){
  
}