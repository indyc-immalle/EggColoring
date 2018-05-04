PGraphics canvas;
PGraphics canvasInstructie;
PImage img;
int c;
int i = 0;
int diameter = 20;
color selectedColor = 0;
int Optelling = -1;

void setup() {
  canvas = createGraphics(801, 852);
  canvasInstructie = createGraphics(801, 852);
  img = loadImage("Eggman.jpg");
  size(801, 852);  
  background(img);
  noStroke();
  frameRate(10000);
}

void draw()
{
  
  image(img, 0, 0);
  text("",0,0);

  canvas.beginDraw();
  if (mousePressed)
  { 
    DrawPen();
  }
  canvas.endDraw();
  image(canvas, 0, 0);
  
   if (key == CODED) {
    if (keyCode == UP) {
       canvasInstructie.beginDraw();
       Instructies();
       canvasInstructie.endDraw();
       image(canvasInstructie,0,0);
     } 
   }
   
  if (keyPressed) {      
    if (key == 'a') tint(0, 200, 255);
    if (key == 'z') tint(200, 0, 255);
    if (key == 'e') tint(255, 0, 200);
    if (key == 's') SavePicture();
    if (key == '-') canvas.clear();
    if (key == '$') noTint();
    if (key == 'r')
    {
      noTint();
      canvas.clear();
    }
  }
}


void keyPressed() {
   if (keyPressed) {
    if (key == '0') selectedColor = #000000;
    if (key == '1') selectedColor = #CC0000;
    if (key == '2') selectedColor = #00CC00;
    if (key == '3') selectedColor = #0000CC;
    if (key == '4') selectedColor = #CCCC00;
  }
}


void SavePicture()
{
  i = i + 1;
  save("CopyEggman"+ i);
  saveFrame("CopyEggman"+ i);
}

void DrawPen()
{
  canvas.stroke(selectedColor);
  canvas.fill(selectedColor);
  canvas.ellipse(mouseX, mouseY, diameter, diameter);
  canvas.ellipse(mouseX-5, mouseY-5, diameter, diameter);
}

void Instructies()
{
  canvasInstructie.background(selectedColor);
  canvasInstructie.textSize(32);
  canvasInstructie.text("Uitleg Controls:", 10, 80); 
  canvasInstructie.text("A = backgroundColor(Rood):", 10, 124); 
  canvasInstructie.text("Z = backgroundColor(Rood):", 10, 156); 
  canvasInstructie.text("E = backgroundColor(Rood):", 10, 188); 
  canvasInstructie.text("S = Save", 10, 222);
  canvasInstructie.text("R = Reset_All", 10, 254); 
  canvasInstructie.text("- = Reset_Lines", 10, 286);
  canvasInstructie.text("$ = Reset_Background", 10, 318);
  canvasInstructie.text("0 = Color_Pen(zwart):", 10, 408);
  canvasInstructie.text("1 = Color_Pen(rood):", 10, 440);
  canvasInstructie.text("2 = Color_Pen(green):", 10, 472);
  canvasInstructie.text("3 = Color_Pen(blauw):", 10, 504);
  canvasInstructie.text("4 = Color_Pen(geel):", 10, 536);
}
