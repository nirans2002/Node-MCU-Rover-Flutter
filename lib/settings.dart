import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatelessWidget {
  Settings({Key? key}) : super(key: key);

  final ipController = TextEditingController(text: '192.168.4.1');
  final portController = TextEditingController(text: '8080');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 33, 34, 39),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 33, 34, 39),
        title: Text(
          "Settings",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text('ip Address',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  )),
              TextField(
                controller: ipController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '192.168.4.1',
                  hintStyle: TextStyle(
                    color: Color.fromARGB(100, 220, 220, 220),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text('Port number',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  )),
              TextField(
                controller: portController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '8080',
                  hintStyle: TextStyle(
                    color: Color.fromARGB(100, 220, 220, 220),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  minimumSize: Size.fromHeight(40),
                ),
                onPressed: () {
                  set_shared_data();
                },
                child: Text(
                  'Save',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Spacer(flex: 1),
              Text(
                "info \n\nControll the rover with nodeMCU using this app.\n\n ip address : ip address of nodeMCU is AP mode \(default 192.168.4.1\)\n\n port number : port number of nodeMCU \(default 8080\).",
                style: TextStyle(color: Colors.white),
              ),
              Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }

// function

  set_shared_data() async {
    SharedPreferences data = await SharedPreferences.getInstance();
    String ip = ipController.text;
    String port = portController.text;
    data.setString('ip', ip);
    data.setString('port', port);
    print('host: $ip:$port');
  }
}
