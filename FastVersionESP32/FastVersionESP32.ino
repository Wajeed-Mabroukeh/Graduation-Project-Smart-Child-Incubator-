#include <Arduino.h>
#include <WiFi.h>
#include <Firebase_ESP_Client.h>
#include "addons/TokenHelper.h"
#include "addons/RTDBHelper.h"
#include <DHT.h>
#include <LiquidCrystal_I2C.h>
#include <Wire.h>
 
LiquidCrystal_I2C lcd(0x27,2,1,0,4,5,6,7,3,POSITIVE);

#define WIFI_SSID "Issa Abbadi"
#define WIFI_PASSWORD "password"

#define DATABASE_URL "https://smart-infant-incubator-aa7c3-default-rtdb.europe-west1.firebasedatabase.app/"
#define API_KEY "AIzaSyCIFVR-yOeYfRNppJsYHjHJBKTAHRX8IW0"

#define DHT_PIN 4 // DHT sensor Pin
#define DHT_TYPE DHT11

#define TRIGGER_PIN 2  // UltraSonic Trigger Pin 
#define ECHO_PIN 5     // UltraSonic Echo Pin

#define SMOKE_PIN 34  // Smoke sensor Pin

#define MOTION_PIN 33 // Motion sensor Pin 

#define MIC_PIN 35 // Mic sensor Pin

#define HEATER_PIN 25 // Heater Pin

#define COOLER_PIN 26 // Cooler Pin

#define O2_PIN 27 // O2 Pin

#define BUZZER_PIN 14 // Buzzer Pin

int sensorMin = 0;
int sensorMax = 4095;


int coolerMode = 0;
int heaterMode = 0;
int o2Mode = 0;
bool danger;


FirebaseData fbdo;
FirebaseAuth auth;
FirebaseConfig config;

DHT dht(DHT_PIN, DHT_TYPE);

unsigned long sendDataPrevMillis = 0;
int count = 0;
bool signupOK = false;

float humidity, temperature, distance, voltage;
int smokeSensorValue, smokePercentage, motionSensorValue, soundValue;

void connectToWiFi();
void readSensors();
void sendDataToFirebase();
void readDataFromFirebase();

void setup() {
  Wire.begin();
  lcd.begin(16,2);
  lcd.clear();
  lcd.home();
  lcd.print("Hello, World!");  // Display a message on the LCD

  Serial.begin(115200);
  connectToWiFi();

  config.api_key = API_KEY;
  config.database_url = DATABASE_URL;

  if (Firebase.signUp(&config, &auth, "", "")){
    Serial.println("ok");
    signupOK = true;
  } else{
    Serial.printf("%s\n", config.signer.signupError.message.c_str());
  }

  config.token_status_callback = tokenStatusCallback;
  Firebase.begin(&config, &auth);
  Firebase.reconnectWiFi(true);

  dht.begin();

  pinMode(TRIGGER_PIN, OUTPUT);
  pinMode(ECHO_PIN, INPUT);
  pinMode(SMOKE_PIN, INPUT);
  pinMode(MOTION_PIN, INPUT);
  pinMode(MIC_PIN, INPUT);
  pinMode(HEATER_PIN, OUTPUT);
  pinMode(COOLER_PIN, OUTPUT);
  pinMode(BUZZER_PIN,OUTPUT);
  pinMode(O2_PIN, OUTPUT);

   digitalWrite(HEATER_PIN,HIGH);
   digitalWrite(COOLER_PIN,HIGH);
   digitalWrite(O2_PIN,HIGH);
   
   danger = false;
  
}

void loop() {
  if (Firebase.ready() && signupOK && (millis() - sendDataPrevMillis > 15000 || sendDataPrevMillis == 0)) {
    sendDataPrevMillis = millis();
    readDataFromFirebase();
    readSensors();
    sendDataToFirebase();
    count++;
    delay(100);
  }
}

void connectToWiFi() {
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  Serial.print("Connecting to WiFi ..");
  while (WiFi.status() != WL_CONNECTED) {
    Serial.print('.');
    delay(1000);
  }
  Serial.println(WiFi.localIP());
  WiFi.setAutoReconnect(true);
  WiFi.persistent(true);
  Serial.println("Connected to WiFi");
}

void readSensors() {
  humidity = dht.readHumidity();
  temperature = dht.readTemperature();

  if(heaterMode == 1) {
    digitalWrite(HEATER_PIN,LOW);
  } else if(heaterMode == 2) {
    digitalWrite(HEATER_PIN,HIGH);
  } else {
    if(temperature < 20){
      digitalWrite(HEATER_PIN,LOW);
    } else {
      digitalWrite(HEATER_PIN,HIGH);
    }
  }

 

  


  // nessessary for the UltraSonic
  digitalWrite(TRIGGER_PIN, LOW);
  delayMicroseconds(2);
  digitalWrite(TRIGGER_PIN, HIGH);
  delayMicroseconds(10);
  digitalWrite(TRIGGER_PIN, LOW);
  distance = pulseIn(ECHO_PIN, HIGH) * 0.034 / 2;

  smokeSensorValue = analogRead(SMOKE_PIN);
  voltage = (smokeSensorValue / 1024.0) * 5.0;
  smokePercentage = map(smokeSensorValue, sensorMin, sensorMax, 0, 100);


 if(o2Mode == 1) {
    digitalWrite(O2_PIN,LOW);
  } else if(o2Mode == 2) {
    digitalWrite(O2_PIN,HIGH);
  } else  if(o2Mode == 0 ){
     if(smokePercentage > 14){
      digitalWrite(O2_PIN,LOW);
      if(coolerMode != 2 ){
        digitalWrite(COOLER_PIN,LOW);
      }
    } else {
      digitalWrite(O2_PIN,HIGH);
      if(coolerMode == 0 && temperature < 26){
        digitalWrite(COOLER_PIN,HIGH);
      } else {
        digitalWrite(COOLER_PIN,LOW);
      }
    }
  }



 

  if(coolerMode == 1) {
    digitalWrite(COOLER_PIN,LOW);
  } else if(coolerMode == 2) {
    digitalWrite(COOLER_PIN,HIGH);
  } else if(o2Mode != 0) {
       if(temperature > 26 ){
     digitalWrite(COOLER_PIN,LOW);
       } else {
     digitalWrite(COOLER_PIN,HIGH);
      }
  }


  
  






  motionSensorValue = digitalRead(MOTION_PIN);

  soundValue = analogRead(MIC_PIN);
   

  if (soundValue > 1100 || smokePercentage > 35 ||  humidity > 70 || humidity < 15 || temperature < 17 || temperature > 30 ) {
    digitalWrite(BUZZER_PIN,HIGH);
    danger = true;
  } else {
    danger = false;
    digitalWrite(BUZZER_PIN,LOW);
  }

  lcd.clear();
  lcd.setCursor(0,0);
  lcd.print(temperature);
  lcd.print("C ");
  lcd.print(humidity);
  lcd.print("% H");
  lcd.setCursor(0,1);
  lcd.print((100 - smokePercentage)/5);
  lcd.print("% O2");

}

void readDataFromFirebase() {
    if (Firebase.RTDB.getInt(&fbdo, "/Cooler/mode")) {
      if (fbdo.dataType() == "int") {
        coolerMode = fbdo.intData();
        Serial.println(coolerMode);
      }
    }
    else {
      Serial.println(fbdo.errorReason());
    }
    
    if (Firebase.RTDB.getInt(&fbdo, "/Heater/mode")) {
      if (fbdo.dataType() == "int") {
        heaterMode = fbdo.intData();
        Serial.println(heaterMode);
      }
    }
    else {
      Serial.println(fbdo.errorReason());
    }

     if (Firebase.RTDB.getInt(&fbdo, "/O2/mode")) {
      if (fbdo.dataType() == "int") {
        o2Mode = fbdo.intData();
        Serial.println(o2Mode);
      }
    }
    else {
      Serial.println(fbdo.errorReason());
    }
}

void sendDataToFirebase() {
   if (Firebase.RTDB.setBool(&fbdo, "danger", danger)) {
  
  } else {
    Serial.println("Failed to send Danger to Firebase!");
    Serial.println("REASON: " + fbdo.errorReason());
  }

  if (Firebase.RTDB.setFloat(&fbdo, "dht/humidity", humidity)) {
  
  } else {
    Serial.println("Failed to send humidity to Firebase!");
    Serial.println("REASON: " + fbdo.errorReason());
  }

  if (Firebase.RTDB.setFloat(&fbdo, "dht/temperature", temperature)) {
    
  } else {
    Serial.println("Failed to send temperature to Firebase!");
    Serial.println("REASON: " + fbdo.errorReason());
  }

  if (Firebase.RTDB.setFloat(&fbdo, "UltraSonic/distance", distance)) {
    
  } else {
    Serial.println("Failed to send Distance to Firebase!");
    Serial.println("REASON: " + fbdo.errorReason());
  }

  if (Firebase.RTDB.setFloat(&fbdo, "MQ-2_smoke/smokePercentage", smokePercentage)) {
  
  } else {
    Serial.println("Failed to send smokePercentage to Firebase!");
    Serial.println("REASON: " + fbdo.errorReason());
  }

  if (Firebase.RTDB.setFloat(&fbdo, "PIR_Motion/Value", motionSensorValue)) {
    
  } else {
    Serial.println("Failed to send motionSensorValue to Firebase!");
    Serial.println("REASON: " + fbdo.errorReason());
  }

  if (Firebase.RTDB.setFloat(&fbdo, "KY-038microphone/Value", soundValue)) {
    
  } else {
    Serial.println("Failed to send soundValue to Firebase!");
    Serial.println("REASON: " + fbdo.errorReason());
  }
  Serial.println("Done Sending to Firebase");
}
