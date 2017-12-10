#include <PWM.h>

int left = 9;
int right = 10; 
int x = 0;
int y = 0;
int delta = 1;         // how many points to fade the LED by
int32_t frequency = 400000;   //frequency (in Hz)

void setup()
{
  //Serial.begin(9600);
  //initialize all timers except for 0, to save time keeping functions
  InitTimersSafe(); 

  //sets the frequency for the specified pin
  bool success1 = SetPinFrequency(left, frequency);
  bool success2 = SetPinFrequency(right, frequency);
  
  //if the pin frequency was set successfully, turn pin 13 on
  if(success1 && success2) {
    pinMode(13, OUTPUT);
    digitalWrite(13, HIGH);    
  }
}

void loop()
{
  //use this functions instead of analogWrite on 'initialized' pins

  x = x + delta;     
  //Serial.print(y);
  //Serial.print(",");
  //Serial.print(y+128);

  drive(left,right, x, y);
  //Serial.print("\n");

  if (x <= -127 || x >= 127) {
    delta = -delta ; 
  }
  delay(30);      
}

//invert x argument for right side
int drive(int L_pin, int R_pin, int x, int y){
  float y_scale = y*1.0/255;     
  //Serial.print(y_scale);
  //Serial.print(",");
  float x_scale = x*1.0/255;     
  //Serial.print(x_scale);
  //Serial.print(",");
  float V = (255-abs(x))*y_scale+y;   
  //Serial.print(V);
  //Serial.print(",");
  float W = (255-abs(y))*x_scale+x;   
  //Serial.print(W);
  //Serial.print(",");
  int L = (V+W)/2+128;
  //Serial.print(L);
  //Serial.print(",");
  int R = (V-W)/2+128;
  //Serial.print(R);
  //Serial.print(",");
  pwmWrite(L_pin, L );
  pwmWrite(R_pin, R );
  //Serial.print("||");
  return 0;
}
  

