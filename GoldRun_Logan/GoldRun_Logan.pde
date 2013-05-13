#include <MeggyJrSimple.h> 

//GoldRun

struct Point
{
  int x;
  int y;
};

int xc[5]={0,0,1,2,2};
int yc[5]={7,6,6,6,7};

Point s1 = {1,3};
Point s2 = {0,3};
Point z1 = {6,2};
Point z2 = {7,2};

Point FishArray1[2]={s1,s2};
Point FishArray2[2]={z1,z2};

int FishDirection1; //Which way the fish go
int FishDirection2;

void setup()
{
 MeggyJrSimpleSetup(); 
 
 EditColor(CustomColor1, 3, 1, 0);
 
 FishDirection1 = 0;
 FishDirection2 = 180;
 
 ClearSlate();
 for (int i=0; i<5; i++)
   DrawPx(xc[i],yc[i],17);
   
 DrawPx(FishArray1[0].x,FishArray1[0].y,1);
 DrawPx(FishArray2[0].x,FishArray2[0].y,1);
 DisplaySlate();
   
}

void loop()
{
  ClearSlate();
  
  CheckButtonsDown();
  MoveBoat();
  for (int i=0; i<5; i++)
    DrawPx(xc[i],yc[i],17); 
  
for (int l=0; l<3; l++)
   {
 DrawPx(FishArray1[l].x,FishArray1[l].y,1);
 DrawPx(FishArray2[l].x,FishArray2[l].y,1);
   }
DisplaySlate();
delay(150);
}

void MoveBoat()
{
  CheckButtonsDown();
  if (Button_Right)
  {
    if (xc[0]!=5)
    {
      for (int i=0; i<5; i++)
        xc[i]=xc[i]+1;
    }
  }
  if (Button_Left)
  {
    if (xc[0]!= 0)
    {
      for (int i=0; i<5; i++)
        xc[i]=xc[i]-1;
    }
  } 
}
