/*
  commands to control the car :
 - http://<YourIP>:<YourPort>/move?command=F (Forward)
 - http://<YourIP>:<YourPort>/move?command=B (Backward)
 - http://<YourIP>:<YourPort>/move?command=R (Right)
 - http://<YourIP>:<YourPort>/move?command=L (Left)
 - http://<YourIP>:<YourPort>/move?command=S (Stop)
 - http://<YourIP>:<YourPort>/move?command=A (Twist Left)
 - http://<YourIP>:<YourPort>/move?command=D (Twist Right)

 call these commands with respective ip address and port number

 these url calls triggers the respective functions that move the rover
*/

//configuring pins
#define leftForward D1
#define leftBackward D2
#define rightForward D3
#define rightBackward D4
#define DELAY 50
// ------------------------------- //

#include <ESP8266WiFi.h>
#include <ESP8266WebServer.h>

// wifi AP mode details
const char *ssid = "ENTER_THE_SSID_HERE";   // ssid

const char *password = "ENTER_THE_PASSWORD_HERE";   // password

IPAddress ip(192, 168, 4, 1);           // ip address 
IPAddress netmask(255, 255, 255, 0);    // subnet mask
const int port = 8080;                  // Port
ESP8266WebServer server(8080);

void setup()
{
  // setting wifi settings
  WiFi.mode(WIFI_AP);
  WiFi.softAPConfig(ip, ip, netmask);
  WiFi.softAP(ssid, password);
  
  // configuring pinModes
  pinMode(leftForward, OUTPUT);
  pinMode(rightForward, OUTPUT);
  pinMode(leftBackward, OUTPUT);
  pinMode(rightBackward, OUTPUT);

  server.on("/move", HTTP_GET, handleMoveRequest);    // configuring url handle "/move"
  server.onNotFound(handleNotFound);
  server.begin();                                // starting server

  Serial.begin(9600);                       // starting serial
}

void loop() 
{
  server.handleClient();
}

void handleMoveRequest()
{
  if (!server.hasArg("command"))
  {
    server.send(404, "text / plain", "Move: undefined");
    return;
  }
  String command = server.arg("command");
  if (command.equals("F"))
  {
    forward();
    server.send(200, "text / plain", "Move: forward");
  }
  else if (command.equals("B"))
  {
    backward();
    server.send(200, "text / plain", "Move: backward");
  }
  else if (command.equals("S"))
  {
    stop_motors();
    server.send(200, "text / plain", "Move: stop");
  }
  else if (command.equals("L"))
  {
    left();
    server.send(200, "text / plain", "Turn: Left");
  }
  else if (command.equals("R"))
  {
    right();
    server.send(200, "text / plain", "Turn: Right");
  }
  else if (command.equals("A"))
  {
    twist_left();
    server.send(200, "text / plain", "Twist: Left");
  }
  else if (command.equals("D"))
  {
    twist_right();
    server.send(200, "text / plain", "Twist: Right");
  }
  else
  {
    stop_motors();
    server.send(404, "text / plain", "Move: undefined");
  }
}


void handleNotFound()
{
  server.send(404, "text / plain", "404: Not found");
}


// movement functions
void forward() {
  digitalWrite(leftForward, HIGH);
  digitalWrite(leftBackward, LOW);
  digitalWrite(rightForward, HIGH);
  digitalWrite(rightBackward, LOW);
  delay(DELAY);
  stop_motors();
  Serial.println("Forward");
}

void backward() {
  digitalWrite(leftForward, LOW);
  digitalWrite(leftBackward, HIGH);
  digitalWrite(rightForward, LOW);
  digitalWrite(rightBackward, HIGH);
  delay(DELAY);
  stop_motors();
  Serial.println("Backward");
}
void stop_motors() {
  digitalWrite(leftForward, LOW);
  digitalWrite(leftBackward, LOW);
  digitalWrite(rightForward, LOW);
  digitalWrite(rightBackward, LOW);
  Serial.println("Stop");

  
}
void right() {
  digitalWrite(leftForward, HIGH);
  digitalWrite(leftBackward, LOW);
  digitalWrite(rightForward, LOW);
  digitalWrite(rightBackward, LOW);
  delay(DELAY);
  stop_motors();
  Serial.println("Right");
}
void left() {
  digitalWrite(leftForward, LOW);
  digitalWrite(leftBackward, LOW);
  digitalWrite(rightForward, HIGH);
  digitalWrite(rightBackward, LOW);
  delay(DELAY);
  stop_motors();
  Serial.println("Left");
}
void twist_left() {
  digitalWrite(leftForward, LOW);
  digitalWrite(leftBackward, HIGH);
  digitalWrite(rightForward, HIGH);
  digitalWrite(rightBackward, LOW);
  delay(DELAY);
  stop_motors();
  Serial.println("Twist Left");
}
void twist_right() {
  digitalWrite(leftForward, HIGH);
  digitalWrite(leftBackward, LOW);
  digitalWrite(rightForward, LOW);
  digitalWrite(rightBackward, HIGH);
  delay(DELAY);
  stop_motors();
  Serial.println("Twist Right");
}
