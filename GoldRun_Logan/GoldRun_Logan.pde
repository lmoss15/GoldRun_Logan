#include <MeggyJrSimple.h> 

//GoldRun

int xc[5]={0,0,1,2,2};
int yc[5]={7,6,6,6,7};

int BoatDirection;

void setup()
{
 MeggyJrSimpleSetup(); 
 
 ClearSlate();
 BoatDirection = 0;
 
}

void loop()
{
  CheckButtonsDown();
  delay(100);
  if (Button_Right)
    {
    for (int i=0; i<5; i++)
      xc[i]++;
    }
    ClearSlate(
    DisplaySlate();
}

