import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/user_data.dart';
import 'package:stritva/constant.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController _usernameController = TextEditingController();

  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _user =
        Provider.of<UserData>(context, listen: false).user; // Initial user data

    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
        backgroundColor: backgroundColor,
        actions: [
          IconButton(
            icon: Icon(
              Icons.save,
            ),
            onPressed: () {
              if (_usernameController.text.isEmpty) {
                _usernameController.text = _user.username;
              }
              if (_emailController.text.isEmpty) {
                _emailController.text = _user.email;
              }

              if (_usernameController.text.isEmpty ||
                  _emailController.text.isEmpty) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Error"),
                        content: Text("Please fill all the fields"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("OK"))
                        ],
                      );
                    });
              }

              Provider.of<UserData>(context, listen: false).addNameEmail(
                  _usernameController.text, _emailController.text);

              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(
                  labelText: "Username", focusColor: buttonColor),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                fillColor: buttonColor,
                labelText: "Email",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
