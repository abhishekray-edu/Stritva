import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:stritva/constant.dart';
import './periodLength.dart';
import 'package:provider/provider.dart';
import '../../model/user_data.dart';

class CycleLength extends StatefulWidget {
  @override
  _CycleLength createState() => _CycleLength();
}

class _CycleLength extends State<CycleLength> {
  int menstrualCycleLength = 28; // Default value

  void _showCycleLengthPicker() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Menstrual Cycle Length',
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              NumberPicker(
                step: 1,

                value: menstrualCycleLength,
                minValue: 15,
                maxValue: 50, // Adjust the maximum value as needed
                onChanged: (value) {
                  setState(() {
                    menstrualCycleLength = value;
                  });
                },
                itemWidth: 60,
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Cancel',
                style: TextStyle(color: borderColor),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(
                'Save',
                style: TextStyle(color: borderColor),
              ),
              onPressed: () {
                // Use the selected menstrual cycle length (menstrualCycleLength) as needed
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.asset('asset/images/period_cycle.png'),
            Text(
              'Menstrual Cycle Length?',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              '$menstrualCycleLength',
              style: TextStyle(color: buttonColor, fontSize: 30),
            ),
            SizedBox(
              height: 50,
            ),

            // Button to show the modal bottom sheet
            TextButton(
              onPressed: _showCycleLengthPicker,
              child: Text(
                'Set Menstrual Cycle Length',
                style: TextStyle(color: borderColor),
                selectionColor: borderColor,
              ),
            ),

            SizedBox(
              height: 90,
            ),
            TextButton.icon(
              onPressed: () {
                Provider.of<UserData>(context, listen: false)
                    .addCycleLength(menstrualCycleLength);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return PeriodLength();
                }));
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
          ],
        ),
      ),
    );
  }
}
