import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String finalResult = 'Final Result will be displayed';
  bool anwserTapped = false;
  static const String anwserA = 'Science';
  static const String anwserB = 'Computer';
  static const String anwserC = 'Art';
  static const String anwserD = 'Religion';

  String switchCase(variableToBeChecked) {
    switch (variableToBeChecked) {
      case anwserA:
        return 'Go To UM';
        break;
      case anwserB:
        return 'Go to USM';
        break;
      case anwserC:
        return 'Go to UITM';
        break;
      case anwserD:
        return 'Go to UIA';
        break;
    }
    return switchCase(variableToBeChecked);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'What Your Interest',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            color: Colors.tealAccent,
            child: ListTile(
              leading: Text('A'),
              trailing: Text(
                anwserA,
                style: TextStyle(fontSize: 10),
              ),
              onTap: () {
                setState(() {
                  finalResult = anwserA;
                  anwserTapped = true;
                });
                print(finalResult);
              },
            ),
          ),
          Container(
            color: Colors.lightGreenAccent,
            child: ListTile(
              leading: Text('B'),
              trailing: Text(
                anwserB,
                style: TextStyle(fontSize: 10),
              ),
              onTap: () {
                setState(() {
                  finalResult = anwserB;
                  anwserTapped = true;
                });
                print(finalResult);
              },
            ),
          ),
          Container(
            color: Colors.limeAccent,
            child: ListTile(
              leading: Text('C'),
              trailing: Text(
                anwserC,
                style: TextStyle(fontSize: 10),
              ),
              onTap: () {
                setState(() {
                  finalResult = anwserC;
                  anwserTapped = true;
                });
                print(finalResult);
              },
            ),
          ),
          Container(
            color: Colors.greenAccent,
            child: ListTile(
              leading: Text('D'),
              trailing: Text(
                anwserD,
                style: TextStyle(fontSize: 10),
              ),
              onTap: () {
                setState(() {
                  finalResult = anwserD;
                  anwserTapped = true;
                });
                print(finalResult);
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30.0),
            padding: EdgeInsets.all(20.0),
            width: double.infinity,
            color: Colors.deepOrange,
            child: Text(
              anwserTapped ? switchCase(finalResult) : finalResult,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 21.0,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      )),
    );
  }
}
