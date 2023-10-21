import 'package:flutter/material.dart';
import 'package:stritva/constant.dart';

class ComingSoon extends StatelessWidget {
  const ComingSoon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text('Coming Soon'),
      ),
      body: Center(
        child: Text(
          'Coming Soon',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
