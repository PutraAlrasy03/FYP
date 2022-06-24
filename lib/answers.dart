import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answerText;
  Answer(this.selectHandler, this.answerText);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
        topRight: Radius.circular(40),
      )),
      child: RaisedButton(
        color: Color.fromARGB(255, 247, 147, 180),
        textColor: Color.fromARGB(255, 22, 36, 82),
        child: Text(answerText,
            style: TextStyle(
              fontSize: 20,
            )),
        onPressed: selectHandler,
      ),
    );
  }
}
