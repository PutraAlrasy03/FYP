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
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            onPressed: resetHandler,
            child: Text('Restart'),
            textColor: Colors.blue,
          )
        ],
      ),
    );
  }
}
