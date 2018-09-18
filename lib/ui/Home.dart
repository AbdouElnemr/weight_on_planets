import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  final TextEditingController weightControler = new TextEditingController();

  int radioValue = 0;
  double finalResult = 0.0;
  String _formattedText = "";

  void handleRadioValueCHanged(int value) {
    setState(() {
      radioValue = value;

      switch (radioValue) {
        case 0:
          finalResult = calculateWeight(weightControler.text, 0.06);
          _formattedText =
          "Your Weight on Pluto is ${finalResult.toStringAsFixed(1)}";
          break;
        case 1:
          finalResult = calculateWeight(weightControler.text, 0.38);
          _formattedText =
          "Your Weight on Mars is ${finalResult.toStringAsFixed(1)}";
          break;
        case 2:
          finalResult = calculateWeight(weightControler.text, 0.91);
          _formattedText =
          "Your Weight on Venus is ${finalResult.toStringAsFixed(1)}";
          break;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Weight On Planet X"),
        centerTitle: true,
        backgroundColor: Colors.black38,
      ),
      backgroundColor: Colors.blueGrey,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(2.5),
          children: <Widget>[
            new Image.asset(
              'images/planet.png',
              width: 200.0,
              height: 133.0,
            ),
            new Container(
              margin: const EdgeInsets.all(3.5),
              alignment: Alignment.center,
              child: new Column(
                children: <Widget>[
              new TextField(
              controller: weightControler,
                keyboardType: TextInputType.number,
                decoration: new InputDecoration(
                  labelText: "Your Weight On Earth",
                  hintText: "In Pounds",
                  icon: new Icon(Icons.person_outline),
                ),
              ),
              new Padding(padding: new EdgeInsets.all(6.0)),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Radio<int>(
                      activeColor: Colors.red,
                      value: 0,
                      groupValue: radioValue,
                      onChanged: handleRadioValueCHanged),
                  new Text(
                    "Pluto",
                    style: new TextStyle(color: Colors.white),
                  ),
                  new Radio<int>(
                      activeColor: Colors.orange,
                      value: 1,
                      groupValue: radioValue,
                      onChanged: handleRadioValueCHanged),
                  new Text(
                    "Mars",
                    style: new TextStyle(color: Colors.white),
                  ),
                  new Radio<int>(
                      activeColor: Colors.limeAccent,
                      value: 2,
                      groupValue: radioValue,
                      onChanged: handleRadioValueCHanged),
                  new Text(
                    "Venus",
                    style: new TextStyle(color: Colors.white),
                  ),
                ],
              ),
              new Padding(padding: new EdgeInsets.all(15.0)),
              new Text(
                weightControler.text
                    .toString()
                    .isEmpty ? "Please Enter Your Weight" : _formattedText,
                // " $_formattedText",
                style: new TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            )
          ],
        ),
      )
      ],
    ),)
    ,
    );
  }

  double calculateWeight(String weight, double multiplier) {
    if (int
        .parse(weight)
        .toString()
        .isNotEmpty && int.parse(weight) > 0.0) {
      return int.parse(weight) * multiplier;
    } else {
      print("Wrong");
      return int.parse("180") * 0.38;
    }
  }
}
