import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trip Cost Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new FuelForm(),
    );
  }
}

class FuelForm extends StatefulWidget {
  @override
  createState() => FuelFormState();
}

class FuelFormState extends State<FuelForm> {
  String result = '';
  final currencies = ['Dollars', 'Euro', 'Kenya Shillings'];
  String currency = 'Dollars';
  double formBorders = 5.0;
  TextEditingController distanceController = TextEditingController();
  TextEditingController avgController = TextEditingController();
  TextEditingController pricController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.headline6;
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: formBorders, bottom: formBorders),
              child: TextField(
                controller: distanceController,
                decoration: InputDecoration(
                    labelText: 'Distance',
                    hintText: 'e.g 124',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
                keyboardType: TextInputType.number,
                onChanged: (String name2) {
                  setState(() {
                    result = name2;
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: formBorders, bottom: formBorders),
              child: TextField(
                controller: avgController,
                decoration: InputDecoration(
                    labelText: 'Distance per unit',
                    hintText: 'e.g 17',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
                keyboardType: TextInputType.number,
                onChanged: (String name2) {
                  setState(() {
                    result = name2;
                  });
                },
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: formBorders, bottom: formBorders),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: TextField(
                      controller: pricController,
                      decoration: InputDecoration(
                          labelText: 'Price',
                          hintText: 'e.g 1.65',
                          labelStyle: textStyle,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                      keyboardType: TextInputType.number,
                    )
                        // onChanged: (String name2) {
                        //   setState(() {
                        //     result = name2;
                        //   });
                        // },
                        ),
                  ],
                )),
            Container(width: formBorders * 5),
            Expanded(
              child: DropdownButton<String>(
                items: currencies.map((String value) {
                  //set the array defined above to be mapped
                  return DropdownMenuItem<String>(
                      value: value, child: Text(value));
                }).toList(),
                value: currency,
                onChanged: (String value) {
                  onDropdownChanged(value);
                },
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    color: Theme.of(context).primaryColorDark,
                    textColor: Theme.of(context).primaryColorLight,
                    child: Text(
                      'Submit',
                      textScaleFactor: 1.5,
                    ),
                    onPressed: () {
                      setState(() {
                        result = calculate();
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RaisedButton(
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
                    },
                  ),
                ),
              ],
            ),
            Text(result)
          ],
        ),
      ),
    );
  }

  onDropdownChanged(String value) {
    setState(() {
      this.currency = value;
    });
  }

  String calculate() {
    double distance = double.parse(distanceController.text);
    double fuelCost = double.parse(pricController.text);
    double consumption = double.parse(avgController.text);
    double totalCost = distance / fuelCost * consumption;
    String result = 'The total cost of your trip is' +
        totalCost.toStringAsFixed(2) +
        '' +
        currency;
    return result;
  }

  void reset() {
    avgController.text = '';
    distanceController.text = '';
    pricController.text = '';
    setState(() {
      result = '';
    });
  }
}
