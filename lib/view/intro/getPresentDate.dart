import 'package:flutter/material.dart';
import 'package:stritva/constant.dart';
import 'package:provider/provider.dart';
import 'package:stritva/view/home_page.dart';
import '../../model/user_data.dart';

DateTime _recentPeriodDate = DateTime.now();

class GetPresentDate extends StatefulWidget {
  @override
  _GetPresentDate createState() => _GetPresentDate();
}

class _GetPresentDate extends State<GetPresentDate> {
  DateTime _recentPeriodDate = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _recentPeriodDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _recentPeriodDate)
      setState(() {
        _recentPeriodDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 16),
            Container(
              margin: EdgeInsets.only(
                bottom: 20,
              ),
              height: 400,
              width: 400,
              child: Image.asset(
                'asset/images/present_date.png',
                height: 200,
                width: 200,
              ),
            ),
            Text(
              'Select your recent period date..',
              style: TextStyle(color: borderColor, fontSize: 28),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    readOnly: true,
                    controller: TextEditingController(
                        text: "${_recentPeriodDate.toLocal()}".split(' ')[0]),
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                      labelText: "Recent Period Date",
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => _selectDate(context),
                  child: Icon(
                    Icons.calendar_today,
                    color: buttonColor,
                  ),
                ),
              ],
            ),
            SizedBox(height: 90),
            TextButton.icon(
              onPressed: () {
                Provider.of<UserData>(context, listen: false)
                    .addRecentPeriodDate(_recentPeriodDate);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return HomePage();
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
