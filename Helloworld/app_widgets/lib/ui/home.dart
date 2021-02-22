import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 30.0, left: 10.0),
            color: Colors.deepOrangeAccent,
            child: Column(
              children: <Widget>[
                Row(children: <Widget>[
                  Expanded(
                    child: Text(
                      "Pizza",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        fontSize: 30.0,
                        decoration: TextDecoration.none,
                        fontFamily: 'Oxygen',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  Expanded(
                      child: Text(
                    "Tomato, Morazella, Basil",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      fontSize: 20.0,
                      decoration: TextDecoration.none,
                      fontFamily: 'Oxygen',
                      fontWeight: FontWeight.w300,
                    ),
                  ))
                ]),
                Row(children: <Widget>[
                  Expanded(
                    child: Text(
                      "Marinara",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        fontSize: 30.0,
                        decoration: TextDecoration.none,
                        fontFamily: 'Oxygen',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  Expanded(
                      child: Text(
                    "Tomato, Garlic",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      fontSize: 20.0,
                      decoration: TextDecoration.none,
                      fontFamily: 'Oxygen',
                      fontWeight: FontWeight.w300,
                    ),
                  )
                  )
                ]
                ),
                PizzaImageWidget(),
                 OrderButton(),
              ],
            )));
  }
}

class PizzaImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage pizzaAsset = AssetImage('images/pizza5.png');
    Image pizzaImage = Image(image: pizzaAsset, width: 400.0, height: 400.0);

    return Container(child: pizzaImage);
  }
}

class OrderButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container( //return functions must never return null
      margin: EdgeInsets.only(top: 50.0),
        child: RaisedButton(
        child: Text("Order Pizza!"),
        color: Colors.lightGreen,
        elevation: 5.0,
        onPressed: (){
          order(context);
        },
        ),
    );
  }
    void order(BuildContext context){
      var alert = AlertDialog(
        title: Text("Order completed"),
        content: Text("Thanks for your order"),
      );
      showDialog(
        context: context,
        builder: (BuildContext context){
          return alert;
        }
      );
    }
}
