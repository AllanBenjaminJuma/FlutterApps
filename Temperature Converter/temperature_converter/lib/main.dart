import 'package:flutter/material.dart';

void main() {
  runApp(TemperatureCalculator());
}

class TemperatureCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Temperature Calculator',
      theme: ThemeData(
        primaryColor: Colors.cyanAccent,
      ),
      home: new TemperatureHome(),
    );
  }
}

class TemperatureHome extends StatefulWidget {
  @override
  createState() => TemperatureState();
}

class TemperatureState extends State<TemperatureHome> {
  String result = '';
  final temperatureMeasurer = ['Celcius', 'Kelvin', 'Farenheit'];
  double formBorders = 6.0;
  TextEditingController celciusController = TextEditingController();
  TextEditingController farenheitController = TextEditingController();
  TextEditingController kelvinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Temperature Converter"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Column(children: <Widget>[
        Padding(
            padding: EdgeInsets.only(top: formBorders, bottom: formBorders),
            child: TextField(
              controller: celciusController,
              decoration: InputDecoration(
                  labelText: 'Temperature in Degrees Celcius',
                  hintText: 'e.g 25',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0))),
              keyboardType: TextInputType.number,
            )),
        Padding(
            padding: EdgeInsets.only(top: formBorders, bottom: formBorders),
            child: TextField(
              controller: farenheitController,
              decoration: InputDecoration(
                  labelText: 'Temperature in FarenHeit',
                  hintText: 'e.g 25',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0))),
              keyboardType: TextInputType.number,
            )),
        Padding(
          padding: EdgeInsets.only(top: formBorders, bottom: formBorders),
          child: TextField(
            controller: kelvinController,
            decoration: InputDecoration(
                labelText: 'Temperature in Kelvin',
                hintText: 'e.g 25',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0))),
            keyboardType: TextInputType.number,
          ),
        ),
        Row(
          children: <Widget>[
            RaisedButton(
              color: Theme.of(context).buttonColor,
              textColor: Theme.of(context).primaryColorDark,
              onPressed: () {
              setState(() {
                
              });
                  
              },
              child: Text(
                'Convert',
                textScaleFactor: 1.5,
              ),
            ),
            RaisedButton(
                color: Theme.of(context).buttonColor,
                textColor: Theme.of(context).primaryColorDark,
                child: Text(
                  'Reset',
                  textScaleFactor: 1.5,
                ),
                onPressed: () {
                  setState(() {
                    reset();
                  });
                }),
          ],
        ),
      ]),
    );
  }
  

  void converter() {
    double celciusTemp = double.parse(celciusController.text);
    double farenheitTemp = double.parse(farenheitController.text);
    double kelvinTemp = double.parse(kelvinController.text);

    double farenheitToCelsius = (farenheitTemp - 32) * 5 / 9;
    double farenheitToKelvin = (farenheitTemp - 32) * 5 / 9 + 273.15;
    double celciusToFarenheit = (celciusTemp * 9 / 5) + 32;
    double celsiusToKelvin = celciusTemp + 273.15;
    double kelvinToFarenheit = (kelvinTemp - 273.15) * 9 / 5 + 32;
    double kelvinToCelcius = kelvinTemp - 273.15;

    

    //if()
    
  }

  void reset() {
    celciusController.text = '';
    farenheitController.text = '';
    kelvinController.text = '';
    setState(() {
      result = '';
    });
  }
}
