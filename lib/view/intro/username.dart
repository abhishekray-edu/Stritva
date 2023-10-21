import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stritva/constant.dart';
import 'package:stritva/model/logic.dart';
import 'package:stritva/model/user_data.dart';
import './cycleLength.dart';

class UserName extends StatelessWidget {
  TextEditingController userNmaeController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 90,
            ),
            Container(
              child: Image.asset('asset/images/third_girl.jpg'),
            ),
            Text(
              'What should we call you?',
              style: TextStyle(color: buttonColor, fontSize: 25),
            ),
            const SizedBox(height: 20),
            Container(
              width: 300,
              child: TextField(
                controller: userNmaeController,
                decoration: const InputDecoration(
                  hintText: 'Username',
                  hintStyle: TextStyle(
                      color: borderColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w300),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: borderColor),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: borderColor),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 300,
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: 'Email',
                  hintStyle: TextStyle(
                      color: borderColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w300),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: borderColor),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: borderColor),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            TextButton.icon(
              onPressed: () {
                if (userNmaeController.text.isNotEmpty &&
                    emailController.text.isNotEmpty) {


                  Provider.of<UserData>(context, listen: false)
                      .addNameEmail(userNmaeController.text, emailController.text);
                 ;
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return CycleLength();
                    }),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Error'),
                        content: const Text('Please fill all the fields'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              icon: const Icon(Icons.arrow_forward_ios_rounded),
              label: const Text('Next'),
              style: ElevatedButton.styleFrom(
                primary: buttonColor,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
