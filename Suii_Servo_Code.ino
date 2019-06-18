#include <AX12A.h>

// Define communication variables for Servo
#define DirectionPin   (2u)
#define BaudRate      (1000000ul)
#define ID        (1u)

// Torque values (0 to 1023)
const int torquePick = 800;
int openingPositionPick = 0;
int openingPositionValue =0;
int openingPosition = 500;
const int openingSpeed = 10;

// Pin that's connected to UR3 controlbox (Analog output 0)
const int controlPin = 11;
int analogPin =A3;
int val =0;

void setup()
{
  ax12a.begin(BaudRate, DirectionPin, &Serial);
  delay(20);
  ax12a.reset(ID);
  delay(20);
  ax12a.setEndless(ID, false);
  delay(20);
  ax12a.setMaxTorque(ID,1023);
  delay(20);
}

int openingPositionFunction(int val){
  //Serial.print("val: ");
  //Serial.println(val);

  if (val>=613 && val<=816){//3 volt or more and less than 4 volts
    openingPositionPick=280;    
  }
  else if (val>=408 && val<=612){//2 volt or more and less than 3 volts
    openingPositionPick=320;
  }
  else if (val>=205 && val <=407){//1 volt or more and less than 2 volts
    openingPositionPick=380;  
  }
  return openingPositionPick;
}

void loop()
{
  //Reading the required mode and the value for the prepickmode
 val = analogRead(analogPin);//the UR3 should give a predetermined voltage value between 0 and 5v

  if (val >=817 ) {//4 volts or more
    
//Closing on torque controll
      ax12a.setEndless(ID, true);
      delay(20);
      ax12a.turn(ID, true, torquePick);
      delay(20);
  }
  
  if (val >=205 && val<=816 ) {//between 1 and 4 volts
    
//Prepick position
      openingPositionValue=openingPositionFunction(val);
      ax12a.setEndless(ID, false);
      delay(20);
      ax12a.moveSpeed(ID, openingPositionValue, openingSpeed);
      delay(20);
  }
  else if (val <=204) {// 1 volt or less
    
//The default open position of the gripper
      ax12a.setEndless(ID, false);
      delay(20);
      ax12a.moveSpeed(ID, openingPosition, openingSpeed);
      delay(20);
  }
}
