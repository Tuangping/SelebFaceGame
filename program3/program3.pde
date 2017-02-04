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
//reference values
Table referTable;
int NKframe;
float NKBrowL,NKBrowR,NKEyeL,NKEyeR,NKNose,NKMouthH,NKMouthW,NKOriX,NKOriY,NKOriZ;
    
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
   loadReferTable();
}

//XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX

void draw(){
 //frameCount = programFrame;
 if (eyeLeftHeight != 0.0&& plugged){
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
    
   //saveTable(infoTable, "table.csv");
 } else {
   frameCount =0;
 }
 //exportFiles();///saveStringfile

 //println("FC in draw: "+frameCount);
 saveTable(infoTable, "table.csv");//,"html");
 
}

//XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
void loadReferTable(){
  referTable = loadTable("NikkiVideoData.csv","header");
  println(referTable.getRowCount() + "total rows in table");
  for(TableRow row : referTable.rows()){
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
    
    println(NKframe + "[" + NKBrowL +" | "+NKBrowR+" | "
    +NKEyeL+" | "+NKEyeR+" | "
    +NKNose+" | "+NKMouthH+" | "+NKMouthW+" | "
    +NKOriX+" | "+NKOriY+" | "+NKOriZ);
  }
  
}