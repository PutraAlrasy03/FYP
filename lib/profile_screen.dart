import 'package:flutter/material.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:newblogapp/mail.dart';
import 'package:newblogapp/screens/home_screen.dart';
import 'package:newblogapp/search.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.red, scaffoldBackgroundColor: Colors.blue),
      home: const MyHomePage(title: 'Youth Higher Learning'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _page = 0;
  final pages = [HomeScreen(), Mail(), Search()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: 0,
        color: Colors.red,
        backgroundColor: Colors.white,
        buttonBackgroundColor: Colors.red,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 400),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        items: [
          Icon(Icons.home, color: Colors.black),
          Icon(Icons.mail, color: Colors.black),
          Icon(Icons.search, color: Colors.black),
        ],
      ),
      body: pages[_page],
    );
  }
}
