import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context)
        .size; //this gonna give us total height and with of our device
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            // Here the height of the container is 45% of our total height
            height: size.height * .45,
            decoration: BoxDecoration(
              color: Color(0xFFF5CEB8),
              image: DecorationImage(
                alignment: Alignment.centerLeft,
                image: AssetImage("assets/images/undraw_pilates_gpdb.png"),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                        color: Color(0xFFF2BEA1),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset("assets/icons/menu.svg"),
                    ),
                  ),
                  Text(
                    "Good Morning\nPutra",
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(fontWeight: FontWeight.w900),
                  ),
                  SearchBar(),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: .85,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      children: <Widget>[
                        CategoryCard(
                          title: "Scholarship Bank Negara",
                          svgSrc: "assets/icons/bank.svg",
                          press: () => launch(
                              'https://www.bnm.gov.my/careers/scholarships'),
                        ),
                        CategoryCard(
                          title: "Scholarship JPA",
                          svgSrc: "assets/icons/question.svg",
                          press: () => launch(
                              'https://www.index.my/permohonan-biasiswa-jpa-program-ijazah-dalam-negara-pidn/'),
                        ),
                        CategoryCard(
                          title: "PTPTN",
                          svgSrc: "assets/icons/question.svg",
                          press: () => launch('https://www.ptptn.gov.my/'),
                        ),
                        CategoryCard(
                          title: " Shell Scholarship",
                          svgSrc: "assets/icons/shell.svg",
                          press: () => launch(
                              'https://www.shell.com.my/careers/students-and-graduates/scholarships.html'),
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
}
