import 'package:flutter/material.dart';
import 'pages/profile/profile.dart';
import 'pages/photo/edit_photo.dart';
import 'pages/name/edit_name.dart';
import 'pages/phone/edit_phone.dart';
import 'pages/email/edit_email.dart';
import 'pages/about/edit_about.dart';
import 'style.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/Profile',
      routes: {
        '/Profile': (context) => Profile(),
        '/Photo': (context) => EditPhoto(),
        '/Name': (context) => EditName(),
        '/Phone': (context) => EditPhone(),
        '/Email': (context) => EditEmail(),
        '/About': (context) => EditAbout(),
      },
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          titleTextStyle: AppBarTextStyle,
        ),
        textTheme: TextTheme(
          headline1: Headline1TextStyle,
          headline2: Headline2TextStyle,
          bodyText1: BodyTextStyle,
          bodyText2: BoldTextStyle,
          headline3: BoldTextStyle2,
        ),
      ),
    );
  }
}
