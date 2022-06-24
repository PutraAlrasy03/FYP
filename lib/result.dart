import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;
  Result(this.resultScore, this.resetHandler);
  String get resultPhrase {
    String resultText;
    if (resultScore >= 15) {
      resultText = 'You are should try University of Malaya!';
    } else if (resultScore >= 10) {
      resultText = 'You are should try Universiti Putra Malaysia!';
    } else {
      resultText = 'You are should try Universiti Teknologi Mara!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    var colors;
    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(height: 100),
          Text(
            resultPhrase,
            style: TextStyle(
                fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 50),
          FlatButton(
            onPressed: resetHandler,
            child: Text('Lets start again, shall we?',
                style: TextStyle(fontSize: 20, fontStyle: FontStyle.italic)),
            textColor: Color.fromARGB(255, 247, 147, 180),
          )
        ],
      ),
    );
  }
}
