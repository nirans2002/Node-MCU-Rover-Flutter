import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:incepto_rover/dialog.dart';
// import 'package:incepto_rover/init_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

String base_url = '';
String port = '';

get_data(context) async {
  SharedPreferences data = await SharedPreferences.getInstance();
  base_url = data.getString('ip').toString();
  port = data.getString('port').toString();
  if (base_url == 'null' || port == 'null') {
    showMyDialog(context);
  }
}

// String base_url = '192.168.4.1';
// String port = '8080';
String move = 'move';

forward(context) {
  get_data(context);
  http.get(Uri.parse('http://$base_url:$port/$move?command=F'));
  print('$base_url:$port/$move');
}

backward(context) {
  get_data(context);
  http.get(Uri.parse('http://$base_url:$port/$move?command=B'));
}

left(context) {
  get_data(context);
  http.get(Uri.parse('http://$base_url:$port/$move?command=L'));
}

right(context) {
  get_data(context);
  http.get(Uri.parse('http://$base_url:$port/$move?command=R'));
}

twist_left(context) {
  get_data(context);
  http.get(Uri.parse('http://$base_url:$port/$move?command=A'));
}

twist_right(context) {
  get_data(context);
  http.get(Uri.parse('http://$base_url:$port/$move?command=D'));
}

stop_motors(context) {
  get_data(context);
  http.get(Uri.parse('http://$base_url:$port/$move?command=S'));
}
