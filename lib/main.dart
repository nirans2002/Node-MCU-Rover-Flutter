import 'package:flutter/material.dart';
import 'package:incepto_rover/controls.dart';
import 'package:incepto_rover/home.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  runApp(const MyApp());
  // get_data(context);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override  
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NodeMCU Rover',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}




/*    EXPLANATION : 

 The ip address of the nodeMCU server and and the port number in the settings options,
 these are saved in the shared_preferences of the application.

 The buttons are implemented using the HoldDetector widget.
  The HoldDetector widget is a widget that detects a long press gesture.
Each button calls the respective function in the controls.dart file.
Forwards, backwards, left, right, twist left and twist right.

These functions make an url call to the web server hosted on the nodeMCU server 
with the ip address and the port number with the respective commands.
Which calls the respective function in the nodeMCU to the move the rover as the command is given.


    */