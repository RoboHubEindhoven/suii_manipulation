#include <AX12A.h>

// Define communication variables for Servo
#define DirectionPin 	(2u)
#define BaudRate  		(1000000ul)
#define ID				(1u)

// Torque values (0 t7 1023)
const int torquePick = 800;
const int openingPosition = 700;
const int openingSpeed = 10;

// Pin that's connected to UR3 controlbox (Analog output 0)
const int controlPin = 10;

void setup()
{
  ax12a.begin(BaudRate, DirectionPin, &Serial);
  delay(10);
  ax12a.reset(ID);
  delay(10);
  ax12a.setEndless(ID, false);
  delay(10);
  pinMode(controlPin, INPUT_PULLUP);
}

void loop()
{
  if (digitalRead(controlPin) == LOW) {
    ax12a.setEndless(ID, true);
    delay(20);
    //Serial.println("Closing Gripper...");
    //delay(10);
    ax12a.turn(ID, true, torquePick);
    delay(20);
    Serial.println(ax12a.readPosition(ID));
    delay(20);
  }

  else if (digitalRead(controlPin) == HIGH) {
    ax12a.setEndless(ID, false);
    delay(20);
    //Serial.println("Opening Gripper...");
    //delay(10);
    ax12a.moveSpeed(ID, openingPosition, openingSpeed);
    delay(20);
    Serial.println(ax12a.readPosition(ID));
    delay(20);
  }
}
