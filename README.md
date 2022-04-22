# Node-MCU-Rover-Flutter

An Android application made with flutter for controlling the rover with nodeMCU web server .

## How it works

The ip address of the nodeMCU server and and the port number in the settings options,
these are saved in the shared_preferences of the application.

The buttons are implemented using the HoldDetector widget.
The HoldDetector widget is a widget that detects a long press gesture.
Each button calls the respective function in the controls.dart file.
Forwards, backwards, left, right, twist left and twist right.

These functions make an url call to the web server hosted on the nodeMCU server
with the ip address and the port number with the respective commands.
Which calls the respective function in the nodeMCU to the move the rover as the command is given.

The ip address and port number of the web server is specified in the configuration of the server.

## instructions for usage

clone the repo 

```
git clone https://github.com/nirans2002/Node-MCU-Rover-Flutter.git
```

change to the project directory
```
cd Node-MCU-Rover-Flutter
```

get packages

```
flutter pub get
```

run and build 

```
flutter run
```
