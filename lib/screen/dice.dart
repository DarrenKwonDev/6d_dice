import 'dart:math';

import 'package:flutter/material.dart';
import '../constants.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:fluttertoast/fluttertoast.dart';

int diceAmount = 1;
int outsideSelectedAmount = 1;
int outputNumber;
List<int> outputList = [];

class DiceMain extends StatefulWidget {
  @override
  _DiceMainState createState() => _DiceMainState();
}

class _DiceMainState extends State<DiceMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff252C37),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          var selectedAmount = await Navigator.push(
              context, MaterialPageRoute(builder: (context) => DiceChoice()));
          setState(() {
            outsideSelectedAmount = selectedAmount;
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Color(0xffB14343),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              "$outsideSelectedAmount dice",
              style: kTextStyle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                for (var i = 0; i < outsideSelectedAmount; i++)
                  Image.asset(
                    'images/dice_PNG49.png',
                    fit: BoxFit.cover,
                    height: 35.0,
                  ),
              ],
            ),
            OutlineButton(
                onPressed: () {
                  outputList.clear();
                  for (var output = 0;
                      output < outsideSelectedAmount;
                      output++) {
                    outputNumber = Random().nextInt(6) + 1;
                    print(outputNumber);
                    outputList.add(outputNumber);
                  }
                  print(outputList);

                  Alert(
                    context: context,
                    title: "Output",
                    content: Column(
                      children: <Widget>[
                        // Text('total : $')
                      ],
                    ),
                    buttons: [
                      DialogButton(
                        child: Text(
                          "Back to Page",
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        onPressed: () => Navigator.pop(context),
                        color: Color(0xffB14343),
                      ),
                    ],
                  ).show();
                },
                borderSide: BorderSide(color: Color(0xffB14343), width: 3.0),
                child: Text('Roll',
                    style: TextStyle(color: Colors.white, fontSize: 25.0)),
                padding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 85.0),
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(40.0))),
            Container(
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}

class DiceChoice extends StatefulWidget {
  @override
  _DiceChoiceState createState() => _DiceChoiceState();
}

class _DiceChoiceState extends State<DiceChoice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff252C37),
        body: Container(
          padding: EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Card(
                    color: Color(0xff333A47),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(children: <Widget>[
                        Text(
                          "how many?",
                          style: kTextStyle.copyWith(fontSize: 25.0),
                        ),
                        SizedBox(height: 15.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            for (var i = 0; i < diceAmount; i++)
                              Image.asset(
                                'images/dice_PNG49.png',
                                fit: BoxFit.cover,
                                height: 35.0,
                              ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.arrow_left),
                              onPressed: () {
                                if (diceAmount <= 0) {
                                  return;
                                } else {
                                  setState(() {
                                    diceAmount--;
                                  });
                                }
                              },
                              color: Colors.white,
                              iconSize: 35,
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            Text("$diceAmount",
                                style: kTextStyle.copyWith(fontSize: 30.0)),
                            SizedBox(
                              width: 15.0,
                            ),
                            IconButton(
                              icon: Icon(Icons.arrow_right),
                              onPressed: () {
                                if (diceAmount >= 6) {
                                  Fluttertoast.showToast(
                                      msg:
                                          "Sorry. You can't roll more than six dice",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0);

                                  return;
                                } else {
                                  setState(() {
                                    diceAmount++;
                                  });
                                }
                              },
                              color: Colors.white,
                              iconSize: 35,
                            ),
                          ],
                        ),
                      ]),
                    )),
              ),
              SizedBox(
                height: 35.0,
              ),
              OutlineButton(
                  onPressed: () {
                    Navigator.pop(context, diceAmount);
                  },
                  borderSide: BorderSide(color: Color(0xffB14343), width: 3.0),
                  child: Text('Select',
                      style: TextStyle(color: Colors.white, fontSize: 25.0)),
                  padding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 85.0),
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(40.0)))
            ],
          ),
        ));
  }
}

// Card(
//   color: Color(0xff333A47),
//   child: Padding(
//     padding: const EdgeInsets.all(55.0),
//     child: Column(children: <Widget>[
//       Text("D4",
//           style:
//               TextStyle(color: Colors.white, fontSize: 25.0))
//     ]),
//   ),
// ),
