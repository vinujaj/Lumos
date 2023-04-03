// Include the necessary libraries
#include <SoftwareSerial.h>

// Create a SoftwareSerial object to communicate with the computer
SoftwareSerial mySerial(2, 3); // RX, TX pins

// Define the pins for controlling the LEDs
int led1 = 2;
int led2 = 3;
int led3 = 4;

void setup() {
  // Initialize the serial communication with the computer
  mySerial.begin(9600);
  Serial.begin(9600);
  
  // Initialize the pins for controlling the LEDs
  pinMode(led1, OUTPUT);
  pinMode(led2, OUTPUT);
  pinMode(led3, OUTPUT);
}

void loop() {
  // Wait for a command from the computer
  while (!mySerial.available()) {}

  // Read the command from the computer
  String command = mySerial.readStringUntil('\n');
  Serial.println("Received command: " + command);

  // Perform the corresponding action based on the command
  if (command == "led1_on\n") {
    Serial.println("Turning LED 1 ON");
    digitalWrite(led1, HIGH);
  }
  else if (command == "led1_off\n") {
    Serial.println("Turning LED 1 OFF");
    digitalWrite(led1, LOW);
  }
  else if (command == "led2_on\n") {
    Serial.println("Turning LED 2 ON");
    digitalWrite(led2, HIGH);
  }
  else if (command == "led2_off\n") {
    Serial.println("Turning LED 2 OFF");
    digitalWrite(led2, LOW);
  }
  else if (command == "led3_on\n") {
    Serial.println("Turning LED 3 ON");
    digitalWrite(led3, HIGH);
  }
  else if (command == "led3_off\n") {
    Serial.println("Turning LED 3 OFF");
    digitalWrite(led3, LOW);
  }
  else if (command == "all_on\n") {
    Serial.println("Turning all LEDs ON");
    digitalWrite(led1, HIGH);
    digitalWrite(led2, HIGH);
    digitalWrite(led3, HIGH);
  }
  else if (command == "all_off\n") {
    Serial.println("Turning all LEDs OFF");
    digitalWrite(led1, LOW);
    digitalWrite(led2, LOW);
    digitalWrite(led3, LOW);
  }
}
