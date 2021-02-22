import 'package:flutter/material.dart';

class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.deepPurple,
      child: Center(
        child: Text(
          sayHello(),
          textDirection: TextDirection.ltr,
          style: TextStyle(color: Colors.white, fontSize: 36.0),
        ),
      ),
    );
  }

  String sayHello() {
    String hello;
    DateTime now = new DateTime.now();
    int hour = now.hour;
    int minute = now.minute;
    int date = now.day;
    if (hour < 12) {
      hello = "Good Morning";
    } else if (hour < 18) {
      hello = "Good afternoon";
    } else {
      hello = "Good evening";
    }
    
    String minutes =
        (minute < 10) ? "0" + minute.toString() : minute.toString();
    return "It's now " + hour.toString()+ ":" +minutes +". \n" + hello;
  }
}
