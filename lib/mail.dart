import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newblogapp/main.dart';
import 'package:newblogapp/user_model.dart';
import 'package:newblogapp/widgets/category_card.dart';
import 'package:newblogapp/widgets/search_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/svg.dart';

class Mail extends StatefulWidget {
  const Mail({Key? key}) : super(key: key);

  @override
  State<Mail> createState() => _MailState();
}

class _MailState extends State<Mail> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

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
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context)
        .size; //this gonna give us total height and with of our device
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 10),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: .85,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: <Widget>[
                        CategoryCard(
                          title: "Scholarship Bank Negara",
                          svgSrc: "assets/icons/Banknegara.svg",
                          press: () => launch(
                              'https://www.bnm.gov.my/careers/scholarships'),
                        ),
                        CategoryCard(
                          title: "Scholarship JPA",
                          svgSrc: "assets/icons/jpa.svg",
                          press: () => launch(
                              'https://www.index.my/permohonan-biasiswa-jpa-program-ijazah-dalam-negara-pidn/'),
                        ),
                        CategoryCard(
                          title: "PTPTN",
                          svgSrc: "assets/icons/PTPTN.svg",
                          press: () => launch('https://www.ptptn.gov.my/'),
                        ),
                        CategoryCard(
                          title: " Shell Scholarship",
                          svgSrc: "assets/icons/Shell1.svg",
                          press: () => launch(
                              'https://www.shell.com.my/careers/students-and-graduates/scholarships.html'),
                        ),
                        CategoryCard(
                          title: "Biasiswa Yayasan Khazanah Nasional",
                          svgSrc: "assets/icons/yk3.svg",
                          press: () =>
                              launch('https://www.yayasankhazanah.com.my'),
                        ),
                        CategoryCard(
                          title: "Biasiswa Tunku Abdul Rahman",
                          svgSrc: "assets/icons/tun3.svg",
                          press: () => launch(
                              'https://www.yayasantar.org.my/scholarships/biasiswa-tunku-abdul-rahman/'),
                        ),
                        CategoryCard(
                          title: "Karangkraf Scholarship",
                          svgSrc: "assets/icons/KT.svg",
                          press: () => launch(
                              'https://www.karangkraf.com/biasiswa-karangkraf/'),
                        ),
                        CategoryCard(
                          title: " Yayasan Bank Rakyat",
                          svgSrc: "assets/icons/br.svg",
                          press: () => launch(
                              'https://application.yayasanbankrakyat.com.my/'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
  }
}
