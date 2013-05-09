#include <MeggyJrSimple.h> 

//GoldRun

int xc[5]={0,0,1,2,2};
int yc[5]={7,6,6,6,7};

void setup()
{
 MeggyJrSimpleSetup(); 
 
 ClearSlate();
 for (int i=0; i<5; i++)
   DrawPx(xc[i],yc[i],1);
   
}

void loop()
{
  ClearSlate();
  CheckButtonsDown();
  MoveBoat();
  for (int i=0; i<5; i++)
    DrawPx(xc[i],yc[i],1);  
DisplaySlate();
delay(100);
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
    if (xc[0]!= 1)
    {
      for (int i=0; i<5; i++)
        xc[i]=xc[1]-1;
    }
  } 
}
