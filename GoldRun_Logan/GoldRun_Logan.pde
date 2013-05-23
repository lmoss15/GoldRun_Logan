#include <MeggyJrSimple.h> 

//GoldRun

struct Point //Defines the struct
{
  int x;
  int y;
};

int w;

int score[8] = {1,3,7,15,31,63,127,255};

int xchest = random(6)+1;
int ychest = random(0);

int xc[5]={0,0,1,2,2}; //Defines current X and current Y
int yc[5]={7,6,6,6,7};

Point s1 = {1,3}; //Parts of fish 1
Point s2 = {0,3};
Point z1 = {6,2}; //Parts of fish 2
Point z2 = {7,2};

Point FishArray1[2]={s1,s2};
Point FishArray2[2]={z1,z2};

int FishDirection1; //Which way the fish go
int FishDirection2;

Point FishingLiney[6];
Point FishingLinex[6];

int FishCounter;
int BoatCounter;

void setup()
{
 MeggyJrSimpleSetup();

 w = 1;

 SetAuxLEDs(w); 
 
 EditColor(CustomColor1, 3, 1, 0);
 
 FishDirection1 = 0; //Left
 FishDirection2 = 180; //Right

 ClearSlate();
 for (int i=0; i<5; i++)
   DrawPx(xc[i],yc[i],17);
   
 DrawPx(FishArray1[0].x,FishArray1[0].y,1); //Draws obstacle fish
 DrawPx(FishArray2[0].x,FishArray2[0].y,1); //Draws obstacle fish
 DisplaySlate();
   
}

void loop()
{
  win(); //Attempt to void win
  ClearSlate();
  for (int a = 0; a < 8; a++)
    {
      for (int r = 0; r<7; r++)
      {
        DrawPx(a,r,13);
      }
    }
  FishCounter++;
  BoatCounter++;
  DrawPx(xc[2],yc[2]+1,14);
  
  CheckButtonsDown(); //Uses moveboat()
  MoveBoat();
  for (int i=0; i<5; i++)
    DrawPx(xc[i],yc[i],17); 
  
for (int l=0; l<3; l++)
   {
 DrawPx(FishArray1[l].x,FishArray1[l].y,1); //Uses same int for both fish arrays
 DrawPx(FishArray2[l].x,FishArray2[l].y,1);
   }
   
if (FishCounter%3 == 1) //speed of fish
  {
   FishArray1[0].x = FishArray1[0].x++;
   FishArray1[1].x = FishArray1[1].x++;
  }
  
if (FishCounter%2 == 1) //speed of fish
  {
 FishArray2[0].x = FishArray2[0].x--;
 FishArray2[1].x = FishArray2[1].x--;
  }
 
  
 if (FishArray1[0].x > 7) //Fish array loops
   FishArray1[0].x = 0;
 
 if (FishArray1[1].x > 7)
   FishArray1[1].x = 0;
   
 if (FishArray2[0].x < 0)
   FishArray2[0].x = 7;
   
  if (FishArray2[1].x < 0)
   FishArray2[1].x = 7; 
   
   
DisplaySlate();
delay(150);
}

void MoveBoat() //Creates a name to move the boat
{
  CheckButtonsDown();
  if (Button_Right) //If right is held down, Boat goes right
  {
    DrawPx(xc[2],yc[2]+1,14);
    if (xc[0]!=5)
    {
      for (int i=0; i<5; i++)
        xc[i]=xc[i]+1;
    }
  }
  if (Button_Left) //If left is held down, boat goes left.
  {
    DrawPx(xc[2],yc[2]+1,14);
    if (xc[0]!= 0)
    {
      for (int i=0; i<5; i++)
        xc[i]=xc[i]-1;
    }
  } 
  DrawPx(xchest,ychest,3);
  if (Button_A)
  {
   DrawPx(xc[2],yc[2]-1,14);
   DrawPx(xc[2],yc[2]-2,14);
   DrawPx(xc[2],yc[2]-3,14);
   DrawPx(xc[2],yc[2]-4,14);
   DrawPx(xc[2],yc[2]-5,14);
   DrawPx(xc[2],yc[2]-6,14);
   
   Collision();
   
   if (xc[2] == xchest && yc[2]-6 == ychest) //if line hits chest, then make new chest and add one to yellow leds & Make noise
   {
     xchest = random(6)+1;
     ychest = random(0);
     Tone_Start(ToneF5,100);
     w++;
     SetAuxLEDs(score[w-1]); //Set int score to -1
   }
  }
  
  DrawPx(xc[2],yc[2]+1,14);
  DisplaySlate();
}

void Collision() //Makes effects when line collides with fish.
{
  if (xc[2] == FishArray1[0].x && yc[2]-3 == FishArray1[0].y)
  {
    SetAuxLEDs(0); //restart leds
    ClearSlate();
    
    for (int a = 0; a < 8; a++)
    {
      for (int r = 0; r<7; r++)
      {
        DrawPx(a,r,13);
      }
    }

    DrawPx(xc[2],yc[2]-1,14); /*Draws Background, makes noise, draws boat, makes x */
   DrawPx(xc[2],yc[2]-2,14);
   DrawPx(xc[2],yc[2]-3,14);
   DrawPx(xc[2],yc[2]-4,14);
   DrawPx(xc[2],yc[2]-5,14);
   DrawPx(xc[2],yc[2]-6,14);
   for (int i=0; i<5; i++)
   DrawPx(xc[i],yc[i],17);
   Tone_Start(ToneF5,500);
   delay(500);
   Tone_Start(ToneA3,500);
   drawx();
   DisplaySlate();
    delay(10000000);
    ClearSlate();
  }
  if (xc[2] == FishArray1[1].x && yc[2]-3 == FishArray1[1].y)
  {
    SetAuxLEDs(0); //restart leds
    ClearSlate();
    for (int a = 0; a < 8; a++)
    {
      for (int r = 0; r<7; r++)
      {
        DrawPx(a,r,13);
      }
    }
    
    DrawPx(xc[2],yc[2]+1,14); /*Draws Background, makes noise, draws boat, makes x */
    DrawPx(xc[2],yc[2]-1,14);
   DrawPx(xc[2],yc[2]-2,14);
   DrawPx(xc[2],yc[2]-3,14);
   DrawPx(xc[2],yc[2]-4,14);
   DrawPx(xc[2],yc[2]-5,14);
   DrawPx(xc[2],yc[2]-6,14);
   for (int i=0; i<5; i++)
   DrawPx(xc[i],yc[i],17);
   Tone_Start(ToneF5,500);
   delay(500);
   Tone_Start(ToneA3,500);
   drawx();
   DisplaySlate();
    delay(10000000);
    ClearSlate();
  }
  if (xc[2] == FishArray2[0].x && yc[2]-4 == FishArray2[0].y) 
  {
    SetAuxLEDs(0); //restart leds
    ClearSlate();
    for (int a = 0; a < 8; a++)
    {
      for (int r = 0; r<7; r++)
      {
        DrawPx(a,r,13);
      }
    }
    DrawPx(xc[2],yc[2]+1,14); /*Draws Background, makes noise, draws boat, makes x */
    DrawPx(xc[2],yc[2]-1,14);
   DrawPx(xc[2],yc[2]-2,14);
   DrawPx(xc[2],yc[2]-3,14);
   DrawPx(xc[2],yc[2]-4,14);
   DrawPx(xc[2],yc[2]-5,14);
   DrawPx(xc[2],yc[2]-6,14);
   for (int i=0; i<5; i++)
   DrawPx(xc[i],yc[i],17);
   Tone_Start(ToneF5,500);
   delay(500);
   Tone_Start(ToneA3,500);
   drawx();
   DisplaySlate();
    delay(10000000);
   ClearSlate();
  }
  if (xc[2] == FishArray2[1].x && yc[2]-4 == FishArray2[1].y)
  {
    SetAuxLEDs(0); //restart leds
    ClearSlate();
    
    for (int a = 0; a < 8; a++)
    {
      for (int r = 0; r<7; r++)
      {
        DrawPx(a,r,13);
      }
    }
    
    DrawPx(xc[2],yc[2]+1,14); /*Draws Background, makes noise, draws boat, makes x */
    DrawPx(xc[2],yc[2]-1,14);
   DrawPx(xc[2],yc[2]-2,14);
   DrawPx(xc[2],yc[2]-3,14);
   DrawPx(xc[2],yc[2]-4,14);
   DrawPx(xc[2],yc[2]-5,14);
   DrawPx(xc[2],yc[2]-6,14);
   for (int i=0; i<5; i++)
   DrawPx(xc[i],yc[i],17);
   Tone_Start(ToneF5,500);
   delay(500);
   Tone_Start(ToneA3,500);
   drawx();
   DisplaySlate();
    delay(10000000);
    ClearSlate();
  }
}

void drawx() //Red X
{
  int xcross[8] = {0,1,2,3,4,5,6,7}; //Create red y int
  int ycross[8] = {0,1,2,3,4,5,6,7};

  for (int q=7;q>-1;q--)
    DrawPx(xcross[q],ycross[q],1); //Draws Red x
}

void win() //Attempt to make game finish.
{
  if (score[8]==127)
  {
    for (int a = 0; a<7; a++)
      {
        DrawPx(a,a,7);
      }
  }
}
  
