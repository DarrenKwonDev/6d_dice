import 'package:flutter/material.dart';
import './screen/dice.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nd6 Dice Roller',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: InitialPage(),
    );
  }
}

class InitialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff252C37),
      body: Container(
        padding: EdgeInsets.fromLTRB(10.0, 105.0, 10.0, 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Image.asset(
              'images/dice_PNG49.png',
              fit: BoxFit.cover,
              height: 70.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Dice Roller',
                    style: TextStyle(color: Colors.white, fontSize: 45.0),
                  ),
                  Text(
                    '주사위 굴리기',
                    style: TextStyle(color: Colors.white, fontSize: 45.0),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    '주사위를 굴려보세요',
                    style: TextStyle(color: Colors.white, fontSize: 15.0),
                  ),
                  Container(width: double.infinity)
                ],
              ),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DiceMain()));
              },
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0)),
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 85.0),
              child: Text('Tap to Roll',
                  style: TextStyle(color: Colors.white, fontSize: 20.0)),
              color: Color(0xff333A47),
            ),
            Container(width: double.infinity),
          ],
        ),
      ),
    );
  }
}
