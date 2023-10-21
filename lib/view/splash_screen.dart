import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../view/home_page.dart';
import '../view/intro/first.dart';
import '../model/user_data.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashState();
}

class SplashState extends State<SplashScreen> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      return HomePage.id;
    } else {
      // Set the flag to true at the end of onboarding screen if everything is successfull and so I am commenting it out
      return FirstPage.id;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: checkFirstSeen(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return MaterialApp(
              initialRoute: snapshot.data,
              routes: {
                FirstPage.id: (context) => FirstPage(),
                HomePage.id: (context) => HomePage(),
              },
            );
          }
        });
  }
}
