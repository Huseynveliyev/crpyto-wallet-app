import 'dart:math';

import 'package:crypto_wallet_app/constants/constants.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CurrenciesScreen extends StatefulWidget {
  const CurrenciesScreen({Key? key}) : super(key: key);

  @override
  State<CurrenciesScreen> createState() => _CurrenciesScreenState();
}

class _CurrenciesScreenState extends State<CurrenciesScreen> {
  final PageController _pageController = PageController();

  double _currentPosition = 0;

  @override
  void initState() {
    _pageController.addListener(() {
      _currentPosition = _pageController.page!;
      setState(() {});
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: myLinerGradient(color1: 0xFF5F6270, color2: 0xFF313347),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text("Your Coins"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              DotsIndicator(
                position: _currentPosition,
                dotsCount: 3,
                decorator: DotsDecorator(
                  activeColor: colorwhite,
                  size: Size(4, 4),
                ),
              ),
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.002)
                  ..rotateY(pi * _currentPosition),
                child: Container(
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
                    gradient:
                        myLinerGradient(color1: 0xFF08AEEA, color2: 0xFF2AF598),
                  ),
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: 3,
                  itemBuilder: (context, index) => Container(
                    child: ListView.separated(
                      itemBuilder: (context, index) => ListTile(
                        title: Text(
                          index.toString(),
                        ),
                      ),
                      separatorBuilder: (context, index) => Divider(),
                      itemCount: 10,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
