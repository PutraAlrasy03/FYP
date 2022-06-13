import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // ignore: unnecessary_new
      child: new Form(
          child: Column(children: <Widget>[
        SizedBox(
          height: 15.0,
        ),
        TextFormField(
          decoration: new InputDecoration(labelText: 'Interest'),
          validator: (value) {
            return value!.isEmpty ? 'Interest is required' : null;
          },
        ),
        SizedBox(
          height: 15.0,
        ),
        TextFormField(
          decoration: new InputDecoration(labelText: 'Financial status'),
          validator: (value) {
            return value!.isEmpty ? 'Financial status is required' : null;
          },
        ),
        SizedBox(
          height: 15.0,
        ),
        RaisedButton(
          elevation: 10.0,
          child: Text("Show Result"),
          textColor: Colors.white,
          color: Colors.red,
          onPressed: () {},
        )
      ])),
    );
  }
}
