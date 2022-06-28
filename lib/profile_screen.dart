import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fancy_drawer/fancy_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:newblogapp/mail.dart';
import 'package:newblogapp/main.dart';
import 'package:newblogapp/screens/home_screen.dart';
import 'package:newblogapp/search.dart';
import 'package:newblogapp/user_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late FancyDrawerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = FancyDrawerController(
        vsync: this, duration: Duration(milliseconds: 250))
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: Color.fromARGB(255, 247, 147, 180),
              secondary: Color.fromARGB(255, 247, 147, 180),
              tertiary: Color.fromARGB(255, 22, 36, 82)),
          scaffoldBackgroundColor: Color.fromARGB(255, 22, 36, 82)),
      home: const MyHomePage(
        title: 'Youth Higher Learning',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  late FancyDrawerController _controller;

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.formMap(value.data());
      setState(() {});
    });
    _controller = FancyDrawerController(
        vsync: this, duration: Duration(milliseconds: 250))
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  var _page = 0;
  final pages = [HomeScreen(), Mail(), Search()];
  PageController _pageController = PageController(initialPage: 0);
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Material(
        child: FancyDrawerWrapper(
            backgroundColor: Color.fromARGB(255, 247, 147, 180),
            controller: _controller,
            drawerItems: <Widget>[
              Text(
                  "${loggedInUser.firstName} "
                  "${loggedInUser.secondName}",
                  style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 22, 36, 82),
                      fontWeight: FontWeight.w500)),
              Text("${loggedInUser.email}",
                  style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 22, 36, 82),
                      fontWeight: FontWeight.w500)),
              SizedBox(
                height: 15,
              ),
              ActionChip(
                  label: Text("Logout"),
                  onPressed: () {
                    logout(context);
                  }),
            ],
            child: Scaffold(
              appBar: AppBar(
                title: Text(widget.title),
                centerTitle: true,
                leading: IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    _controller.toggle();
                  },
                ),
              ),
              body: PageView(
                controller: _pageController,
                onPageChanged: (newIndex) {
                  setState(() {
                    _currentIndex = newIndex;
                  });
                },
                children: [
                  HomeScreen(),
                  Mail(),
                  Search(),
                ],
              ),
              bottomNavigationBar: CurvedNavigationBar(
                index: _currentIndex,
                color: Color.fromARGB(255, 247, 147, 180),
                backgroundColor: Color.fromARGB(255, 22, 36, 82),
                buttonBackgroundColor: Color.fromARGB(255, 247, 147, 180),
                animationCurve: Curves.easeInOut,
                animationDuration: Duration(milliseconds: 400),
                onTap: (newIndex) {
                  setState(() {
                    _pageController.animateToPage(newIndex,
                        duration: Duration(milliseconds: 300),
                        curve: Curves.ease);
                  });
                },
                items: [
                  Icon(Icons.home, color: Color.fromARGB(255, 22, 36, 82)),
                  Icon(Icons.mail, color: Color.fromARGB(255, 22, 36, 82)),
                  Icon(Icons.search, color: Color.fromARGB(255, 22, 36, 82)),
                ],
              ),
            )));
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
  }
}
