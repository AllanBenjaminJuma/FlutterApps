import 'package:flutter/material.dart';
import './screens/home.dart';

void main() {
  runApp(new HelloFlutterApp());
}

//the new keyword is optional in flutter application
//we use the scaffold widget that has widgets and we
// use two properties of this widget
//i.e appBar that contains the application bar and body with the main contents of the screen.
class HelloFlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    title: "Hello Flutter App",
    home: Scaffold(
      appBar: AppBar(
        title: Text("Title in App Bar"),
      ),
      body: home()
    ),
  );

  }


}
