#include <DHT.h>
#include <Encoder.h>
#include <PID_v1.h>

#define DHTPIN 2
#define DHTTYPE DHT11
DHT dht(DHTPIN, DHTTYPE);

#define TRIG_PIN 9
#define ECHO_PIN 10

#define CLK 3
#define DT 4
#define SW 5

#define LED_MANUAL 6
#define LED_SETPOINT 7
#define LED_FAILURE 8

#define BUZZER 12
#define RELAY 13
#define FAN_PWM_PIN 11

Encoder encoder(CLK, DT);
int lastSwitchState = HIGH;
bool manualMode = false;
bool relayState = false;
bool alarmMode = false;
float hysteresis = 0;
float distanceThreshold = 15.0;
double setpoint = 25;  // Target temperature
float tolerance = 2;
int fanMinSpeed = 50;

// PID variables
double currentTemp, fanOutput;
double Kp = 25.0, Ki = 0.2, Kd = 0.0;
PID myPID(&currentTemp, &fanOutput, &setpoint, Kp, Ki, Kd, REVERSE);  // Use REVERSE for cooling

void setup() {
  Serial.begin(9600);
  dht.begin();

  pinMode(TRIG_PIN, OUTPUT);
  pinMode(ECHO_PIN, INPUT);
  pinMode(SW, INPUT_PULLUP);
  pinMode(LED_MANUAL, OUTPUT);
  pinMode(LED_SETPOINT, OUTPUT);
  pinMode(LED_FAILURE, OUTPUT);
  pinMode(BUZZER, OUTPUT);
  pinMode(RELAY, OUTPUT);
  pinMode(FAN_PWM_PIN, OUTPUT);

  digitalWrite(RELAY, LOW);

  // Initialize PID controller
  myPID.SetMode(AUTOMATIC);
  myPID.SetOutputLimits(0, 255);  // Limit the output to the PWM range
}

void loop() {
  if (Serial.available() > 0) {
    String command = Serial.readStringUntil('\n');
    command.trim();
    processCommand(command);
  }

  currentTemp = dht.readTemperature();
  float humidity = dht.readHumidity();
  float fanSpeed = 0;

  long duration, distance;
  digitalWrite(TRIG_PIN, LOW);
  delayMicroseconds(2);
  digitalWrite(TRIG_PIN, HIGH);
  delayMicroseconds(10);
  digitalWrite(TRIG_PIN, LOW);
  duration = pulseIn(ECHO_PIN, HIGH);
  distance = (duration / 2) / 29.1;

  if (distance < distanceThreshold) {
    digitalWrite(RELAY, LOW);
    analogWrite(FAN_PWM_PIN, 255);
    beepBuzzer(3);
  } else {
    if (manualMode) {
      long position = encoder.read();
      int fanSpeed = map(position, 0, 100, 0, 255);
      fanSpeed = constrain(fanSpeed, 0, 255);
      if (!relayState) {
        digitalWrite(RELAY, HIGH);
        relayState = true;
      }
      digitalWrite(LED_MANUAL, HIGH);
      analogWrite(FAN_PWM_PIN, fanSpeed);
    } else {
      // Automatic PID control
      myPID.Compute();                      // Calculate new PID output based on currentTemp and setpoint
      analogWrite(FAN_PWM_PIN, fanOutput);  
      digitalWrite(LED_MANUAL, LOW);
    }
  }

  if (currentTemp > (setpoint + tolerance)) {
    digitalWrite(LED_FAILURE, HIGH);
    digitalWrite(RELAY, LOW);
    relayState = false;
    beepBuzzer(3);
  } else {
    digitalWrite(LED_FAILURE, LOW);
  }
  if (currentTemp >= (setpoint - tolerance) && currentTemp <= (setpoint + tolerance)) {
    digitalWrite(LED_SETPOINT, HIGH);
  } else {
    digitalWrite(LED_SETPOINT, LOW);
  }

  long position = encoder.read();  
  
  String data = String(currentTemp) + "," + String(humidity) + "," + String(distance) + "," + (manualMode ? "ON" : "OFF") + "," + 
                String(fanOutput) + "," + String(position);

  Serial.println(data);
  Serial.flush();


  delay(1000);
}

void beepBuzzer(int times) {
  if (alarmMode) {
    for (int i = 0; i < times; i++) {
      digitalWrite(BUZZER, HIGH);
      digitalWrite(LED_MANUAL, HIGH);
      digitalWrite(LED_FAILURE, HIGH);
      delay(100);
      digitalWrite(BUZZER, LOW);
      digitalWrite(LED_MANUAL, LOW);
      digitalWrite(LED_FAILURE, LOW);
      delay(100);
    }
  } else {
      digitalWrite(LED_MANUAL, HIGH);
      digitalWrite(LED_FAILURE, HIGH);
      delay(100);
      digitalWrite(LED_MANUAL, LOW);
      digitalWrite(LED_FAILURE, LOW);
      delay(100);
    }
}

void processCommand(String command) {
  int separatorIndex = command.indexOf('=');
  if (separatorIndex != -1) {
    String keyword = command.substring(0, separatorIndex);
    String value = command.substring(separatorIndex + 1);

    if (keyword == "SETPOINT") {
      setpoint = value.toFloat();
    } else if (keyword == "TOLERANCE") {
      tolerance = value.toFloat();
    } else if (keyword == "HYSTERESIS") {
      hysteresis = value.toFloat();
    } else if (keyword == "FAN_MIN_SPEED") {
      fanMinSpeed = value.toInt();
    } else if (keyword == "DISTANCE") {
      distanceThreshold = value.toInt();
    } else if (keyword == "PID") {
      int firstComma = value.indexOf(',');
      int secondComma = value.indexOf(',', firstComma + 1);
      if (firstComma != -1 && secondComma != -1) {
        Kp = value.substring(0, firstComma).toFloat();
        Ki = value.substring(firstComma + 1, secondComma).toFloat();
        Kd = value.substring(secondComma + 1).toFloat();
        myPID.SetTunings(Kp, Ki, Kd);
        Serial.println("PID Parameters Updated: " + String(Kp) + "," + String(Ki) + "," + String(Kd));
      } else {
        Serial.println("Error: Invalid PID parameters format. Expected format 'Kp,Ki,Kd'.");
      }
    } else if (keyword == "ALARM") {
      bool newAlarmMode = (value.toInt() == 1);
      if (alarmMode != newAlarmMode) {
        alarmMode = newAlarmMode;
        Serial.println("Alarm mode set to: " + String(alarmMode));
      }
    } else if (keyword == "MANUAL") {
      bool newManualMode = (value.toInt() == 1);
      if (manualMode != newManualMode) {
        manualMode = newManualMode;
        digitalWrite(LED_MANUAL, manualMode ? HIGH : LOW);
        Serial.println("Manual mode set to: " + String(manualMode));
      }
    }
  }
}
