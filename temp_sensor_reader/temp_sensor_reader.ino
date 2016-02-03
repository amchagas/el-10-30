


#include <Wire.h>

void setup() {
  Wire.begin();        // join i2c bus (address optional for master)
  Serial.begin(9600);  // start serial for output
  Wire.beginTransmission(24);
  Wire.write(5);
  Wire.endTransmission();
  delay(200);    
}

void loop() {
  Wire.requestFrom(24, 2);    // request 2 bytes from slave device #24

  float c1 = Wire.read();
  c1=c1*0.125;
  Serial.println("read1");
  Serial.println(c1);    
  c1 = Wire.read();
  c1=c1*0.125;
  Serial.println("read2");
  Serial.println(c1);    
//  c1 = Wire.read();
//  c1=c1*0.125;
//  Serial.println("read3");
//  Serial.println(c1);    
  delay(200);
}
