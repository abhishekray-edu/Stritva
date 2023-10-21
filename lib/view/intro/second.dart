import 'package:flutter/material.dart';
import 'package:stritva/constant.dart';
import 'package:stritva/view/intro/username.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(
          height: 150,
        ),
        Text(
          'Track Your Periods & Fertility ',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 33, color: buttonColor, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 40),
        Container(
          width: 300,
          child: Image.asset('asset/images/girl.png'),
        ),
        SizedBox(height: 185),
        TextButton.icon(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return  UserName();
              }),
            );
          },
          icon: Icon(Icons.arrow_forward_ios_rounded),
          label: Text('Next'),
          style: ElevatedButton.styleFrom(
            primary: buttonColor,
            onPrimary: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
          ),
        ),
      ]),
    );
  }
}
