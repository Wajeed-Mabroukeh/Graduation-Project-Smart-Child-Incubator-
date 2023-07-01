#include <SPI.h>
#include <MFRC522.h>

#define RST_PIN         9          // Configurable, see typical pin layout above
#define SS_PIN          10         // Configurable, see typical pin layout above

#define TIMEOUT_DURATION 3000     // Timeout duration in milliseconds (5 sec)


#define BLUE A0
#define GREEN A1
#define RED A2

#define waterLevelPin  A3  // Analog input pin connected to the SIG pin of the water level sensor

// Pin definitions for the 7-segment display
const int segmentPins[] = {2,3,4,5, A4, 7, 8,  A5}; // Pins connected to segment pins of the display

// Array to store segment patterns for each digit (0-9)
const byte digitPatterns[] = {
  B1111110, // 0
  B0110000, // 1
  B1101101, // 2
  B1111001, // 3
  B0110011, // 4
  B1011011, // 5
  B1011111, // 6
  B1110000, // 7
  B1111111, // 8
  B1110011  // 9
};


bool isCardDetected = false; 

MFRC522 mfrc522(SS_PIN, RST_PIN);  // Create MFRC522 instance

void setup() {
  Serial.begin(9600);    // Initialize serial communications with the PC
  while (!Serial);       // Do nothing if no serial port is opened (added for Arduinos based on ATMEGA32U4)
  SPI.begin();           // Init SPI bus
  mfrc522.PCD_Init();    // Init MFRC522
  delay(4);              // Optional delay. Some board do need more time after init to be ready, see Readme
  mfrc522.PCD_DumpVersionToSerial(); // Show details of PCD - MFRC522 Card Reader details
  Serial.println(F("Scan PICC to see UID, SAK, type, and data blocks..."));

  pinMode(BLUE,OUTPUT);
  pinMode(GREEN, OUTPUT); 
  pinMode(RED, OUTPUT); 

  for (int i = 0; i < 8; i++) {
    pinMode(segmentPins[i], OUTPUT);
  }
}

byte white[] = {0x70, 0x5C, 0x99, 0xA5};
byte blue[] = {0x84 ,0x19, 0x2B ,0xD0};

bool bl;
bool wh;

unsigned long lastCardTimestamp = 0;    // Timestamp of the last card detection


void loop() {

   int waterLevelPercentage = getWaterLevelPercentage();

   // Display the percentage on the 4-digit 7-segment display
  displayPercentage(waterLevelPercentage);


    // Check if the timeout duration has passed since the last card detection
  if (millis() - lastCardTimestamp > TIMEOUT_DURATION) {
    Serial.print("finished");
    if (isCardDetected) {
      turnOffLED();
    }
  }
  // Reset the loop if no new card present on the sensor/reader. This saves the entire process when idle.
  if (!mfrc522.PICC_IsNewCardPresent()) {
    // analogWrite(BLUE,0);
    // analogWrite(GREEN,0);
    // analogWrite(RED,0);

    return;
  }

  // Select one of the cards
  if (!mfrc522.PICC_ReadCardSerial()) {
    return;
  }

  wh = true;
  bl = true;
  for (int i = 0; i < 4; i++) {
    if (!(mfrc522.uid.uidByte[i] == white[i]))
      wh = false;
    if (!(mfrc522.uid.uidByte[i] == blue[i]))
      bl = false;
  }

 if(wh)
  {
    analogWrite(BLUE,0);
    analogWrite(GREEN,255);
    analogWrite(RED,0);
  }
 if(bl)
  {
    analogWrite(BLUE,255);
    analogWrite(GREEN,0);
    analogWrite(RED,0);
  }
  if(!bl && ! wh){
    analogWrite(BLUE,0);
    analogWrite(GREEN,0);
    analogWrite(RED,255); 
  }
  lastCardTimestamp = millis();    // Update the last card detection timestamp
  isCardDetected = true;

  // Dump debug info about the card; PICC_HaltA() is automatically called
  mfrc522.PICC_DumpToSerial(&(mfrc522.uid));
}



void turnOffLED() {
   analogWrite(BLUE,0);
    analogWrite(GREEN,0);
    analogWrite(RED,0);

  isCardDetected = false; // Reset the card detection flag
}

int getWaterLevelPercentage() {
 
  int waterLevelValue = analogRead(waterLevelPin); // Read the analog value from the water level sensor

   // Convert the water level value to a percentage
  int waterLevelPercentage = map(waterLevelValue, 0, 1023, 0, 100); // Assuming the analog range is 0-1023

  Serial.print("Water level: ");
  Serial.print(waterLevelPercentage);
  Serial.println("%"); // Print the water level percentage

  delay(500);


  
  return waterLevelPercentage;
}



// Function to display the given percentage on the 4-digit 7-segment display
void displayPercentage(int percentage) {
 
  int digit = (percentage / 10) ;   // Tens digit
 
  if(digit == 10){
    digit = 9;
  }
  

  

    // Display the corresponding digit pattern
    displayDigitPattern(digit);

 


    
}


// Function to display the pattern for a single digit on the 7-segment display
void displayDigitPattern(int digit) {
  // Lookup the segment pattern for the given digit
  byte segmentPattern = digitPatterns[digit];

  // Loop through each segment and set its state
  for (int i = 0; i < 8; i++) {
    // Determine the state of the current segment
    bool segmentState = bitRead(segmentPattern, i);

    // Set the state of the segment pin accordingly
    digitalWrite(segmentPins[i], segmentState);
  }
}





















