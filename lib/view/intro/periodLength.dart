import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:provider/provider.dart';
import 'package:stritva/constant.dart';
import 'package:stritva/model/user_data.dart';
import 'package:stritva/view/intro/getPresentDate.dart';

class PeriodLength extends StatefulWidget {
  @override
  _PeriodLength createState() => _PeriodLength();
}

class _PeriodLength extends State<PeriodLength> {
  int flowLength = 4; // Default value

  void _showCycleLengthPicker() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Blood Flow  Length',
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              NumberPicker(
                step: 1,

                value: flowLength,
                minValue: 1,
                maxValue: 10, // Adjust the maximum value as needed
                onChanged: (value) {
                  setState(() {
                    flowLength = value;
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
            Image.asset('asset/images/flow_length.png'),
            Text(
              'Blood Flow Length?',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              '$flowLength',
              style: TextStyle(color: buttonColor, fontSize: 30),
            ),
            SizedBox(
              height: 50,
            ),

            // Button to show the modal bottom sheet
            TextButton(
              onPressed: _showCycleLengthPicker,
              child: Text(
                'Set Blood Flow Length',
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
                    .addPeriodLength(flowLength);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return GetPresentDate();
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
