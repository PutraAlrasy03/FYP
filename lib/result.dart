import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;
  Result(this.resultScore, this.resetHandler);
  String get resultPhrase {
    String resultText;
    if (resultScore >= 1201) {
      resultText = 'Diploma Sains' +
          "\r\n" +
          'Diploma Mikrobiologi' +
          "\r\n" +
          'Diploma Kimia';
    } else if (resultScore >= 1151) {
      resultText = 'Diploma Pengajian Perbankan' +
          "\r\n" +
          'Diploma Analisis Pejabat' +
          "\r\n" +
          'Diploma Pengajian Perniagaan';
    } else if (resultScore >= 1101) {
      resultText = 'Diploma Sains Komputer' +
          "\r\n" +
          'Diploma Sains Aktuari' +
          "\r\n" +
          'Diploma Sains Matematik';
    } else if (resultScore >= 1051) {
      resultText = 'Diploma Pengajian Islam' +
          "\r\n" +
          'Diploma Muamalat' +
          "\r\n" +
          'Diploma Pengurusan Halal';
    } else if (resultScore >= 1049) {
      resultText = 'Diploma Seni Lukis dan Seni Reka';
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
          SizedBox(height: 50),
          Text(
            resultPhrase,
            style: TextStyle(
                fontSize: 27, fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Lottie.network(
              'https://assets7.lottiefiles.com/packages/lf20_fgmesll3.json',
              frameRate: FrameRate.max,
              repeat: true,
              height: 150),
          SizedBox(height: 25),
          RaisedButton(
              child: Text("Apply Now !"),
              textColor: Color.fromARGB(255, 32, 55, 129),
              color: Color.fromARGB(255, 241, 69, 126),
              onPressed: () => launch('https://online.uitm.edu.my/')),
          SizedBox(height: 25),
          FlatButton(
            onPressed: resetHandler,
            child: Text('Lets start again, shall we?',
                style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic)),
            textColor: Color.fromARGB(255, 241, 69, 126),
          ),
        ],
      ),
    );
  }
}
