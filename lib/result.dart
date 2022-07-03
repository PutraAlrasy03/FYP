import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;
  Result(this.resultScore, this.resetHandler);
  String get resultPhrase {
    String resultText;
    if (resultScore >= 1201) {
      resultText = 'Diploma Sains' + "\r\n" + 'Diploma Biologi';
    } else if (resultScore >= 1151) {
      resultText = 'Diploma Perdagangan';
    } else if (resultScore >= 1101) {
      resultText = 'Diploma Agroteknologi';
    } else if (resultScore >= 1051) {
      resultText = 'Diploma Pengajian Islam';
    } else if (resultScore >= 1049) {
      resultText = 'Diploma Sains (Aliran STEM C & Sastera) ';
    } else if (resultScore >= 201 && resultScore <= 250) {
      resultText = 'Pra-Diploma Sains';
    } else if (resultScore >= 151) {
      resultText = 'Pra-Diploma Perdagangan';
    } else if (resultScore >= 101) {
      resultText = 'Pra-Diploma Agroteknologi';
    } else if (resultScore >= 51) {
      resultText = 'Pra-Diploma Pengajian Islam';
    } else if (resultScore <= 50) {
      resultText = 'Pra-Diploma Sains (Aliran STEM C & Sastera) ';
    } else {
      resultText = 'Pra-Diploma Sains (Aliran STEM C & Sastera) ';
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
