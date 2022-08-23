import 'package:crypto_font_icons/crypto_font_icons.dart';
import 'package:crypto_wallet_app/constants/constants.dart';
import 'package:crypto_wallet_app/constants/currencies_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: myLinerGradient(color1: 0xFF5F6270, color2: 0xFF313347)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        drawer: Drawer(backgroundColor: color1),
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text('Portfolio'),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Stack(
                  clipBehavior: Clip.none, // gorunsun
                  children: [
                    FaIcon(
                      FontAwesomeIcons.solidMessage,
                    ),
                    Positioned(
                      top: -2,
                      right: -3,
                      child: Container(
                        child: Center(
                          child: Text("5", style: TextStyle(fontSize: 7)),
                        ),
                        width: 11,
                        height: 11,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.red),
                      ),
                    ),
                  ],
                )),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              myDefaultCard(context),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Your Coins",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  ),
                  FaIcon(
                    FontAwesomeIcons.circlePlus,
                    color: Colors.white,
                  ),
                ],
              ),
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) => myListile(),
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: 8),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget myDefaultCard(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 25, bottom: 18),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 4,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 10, // golge keskinligini azalt
            color: Colors.black54,
            spreadRadius: -5, // golge tasmasini azalt
          )
        ],
        borderRadius: BorderRadius.circular(4),
        gradient: myLinerGradient(color1: 0xFF08AEEA, color2: 0xFF2AF598),
      ),
    );
  }

  Builder myListile() {
    return Builder(builder: (context) {
      return ListTile(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CurrenciesScreen(),
            )),
        leading: Container(
            width: 40,
            height: 40,
            decoration:
                BoxDecoration(color: Color(0xfff5b300), shape: BoxShape.circle),
            child: Icon(
              CryptoFontIcons.BTC,
              color: Colors.white,
            )),
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                myText(name: "Bitcoin"),
                myText(name: "\$1233.45"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                myText(
                  name: "0.00041",
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Row(
                    children: [
                      myText(name: "12.45%", color: Colors.green),
                      FaIcon(
                        FontAwesomeIcons.arrowUp,
                        color: colorgreen,
                        size: 17,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }

  Text myText({required String name, Color? color = Colors.white}) {
    return Text(name, style: TextStyle(color: color, fontSize: 15));
  }
}
