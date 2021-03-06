// This sketch controls a relay that should be conencted to the 
// main power of a system.  It supports a hardwired estop switch
// and inturprets serial data for a estop message from software.
// To turn on relay all estops must be disengaged and the run 
// signal from software must be recieved

const int RELAY_PIN = 4;
const int ESTOP_PIN = 3;
const int SERIAL_TIMEOUT_VALUE = 30000;

boolean relay;
boolean eStop;
boolean softStop;
boolean run;
int noComm;

void setup() {
  Serial.begin(9600);
  pinMode(RELAY_PIN, OUTPUT);  
  pinMode(ESTOP_PIN, INPUT); 
  relay = HIGH;
  softStop = LOW;
  run = LOW; // Initialize system powered off
}

void loop() {
  eStop = digitalRead(ESTOP_PIN);
  
  int serialIn = Serial.read();  
  
  // Counts how many messages missed
  if (serialIn == -1) {
    noComm++;
  } else {
    noComm = 0;
  }
  
  // If too many massages missed then estop
  if (noComm > SERIAL_TIMEOUT_VALUE) {  
    Serial.println("Serial timeout");
    softStop = HIGH;
    noComm = 0;
  }
  
  // debugging information printed to terminal
  if (serialIn != -1) { 
    Serial.println(serialIn);
    Serial.flush();
  }
  
  if (serialIn == 49) { // ascii '1'
    softStop = HIGH;
  } else if (serialIn == 50) { // ascii '2'
    softStop = LOW;
  } else if (serialIn == 51) { // ascii '3'
    run = HIGH;
  }
  
  if (!eStop || softStop) {
    digitalWrite(RELAY_PIN, LOW);  // stop
    run = LOW;
  } else if (run) {  
    digitalWrite(RELAY_PIN, HIGH);  // go
  } else {
    digitalWrite(RELAY_PIN, LOW);  // reset
  }
}
