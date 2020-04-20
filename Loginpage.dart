import 'package:expense/main.dart';
import 'package:flutter/material.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';

class Login extends StatelessWidget {
  static String tag = '';
  final pages = [
    PageViewModel(
      pageColor: Color(0xF6F6F7FF),
      bubbleBackgroundColor: Colors.indigo,
      title: Container(),
      body: Column(
        children: <Widget>[
          Text('Welcome To Expense Planner'),
          Text(
            'Keep track of what you buy on the go',
            style: TextStyle(color: Colors.black54, fontSize: 16.0),
          ),
        ],
      ),
      mainImage: Image.asset(
        'Assets/Images/expense2.png',
        width: 285.0,
        alignment: Alignment.center,
      ),
      textStyle: TextStyle(color: Colors.black),
    ),
    PageViewModel(
      pageColor: Color(0xF6F6F7FF),
      iconColor: null,
      bubbleBackgroundColor: Colors.indigo,
      title: Container(),
      body: Column(
        children: <Widget>[
          Text('Secure Your Wallet'),
          Text(
            'Monitor your spending with our app',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
      mainImage: Image.asset(
        'Assets/Images/expense3.png',
        width: 285.0,
        alignment: Alignment.center,
      ),
      textStyle: TextStyle(color: Colors.black),
    ),
    PageViewModel(
      pageColor: Color(0xF6F6F7FF),
      iconColor: null,
      bubbleBackgroundColor: Colors.indigo,
      title: Container(),
      body: Column(
        children: <Widget>[
          Text('We Are The Best In Bay Area'),
          Text(
            'Keep track of your expenses, anywhere anyplace anytime',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
      mainImage: Image.asset(
        'Assets/Images/expense4.png',
        width: 285.0,
        alignment: Alignment.center,
      ),
      textStyle: TextStyle(color: Colors.black),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            IntroViewsFlutter(
              pages,
              onTapDoneButton: () {
                Navigator.of(context).pushNamed(MyHomePage.tag);
              },
              showSkipButton: false,
              doneText: Text('Get Started'),
              pageButtonsColor: Colors.indigo,
              pageButtonTextStyles: TextStyle(
                fontSize: 16.0,
                fontFamily: 'Regular',
              ),
            ),
            Positioned(
              top: 20.0,
              left: MediaQuery.of(context).size.width / 2 - 50,
              child: Image.asset(
                'Assets/Images/expense1.png',
                width: 70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
