import 'package:flutter/material.dart';
import 'package:stritva/constant.dart';
import 'package:stritva/model/logic.dart';
import 'package:intl/intl.dart';
import 'package:stritva/view/intro/periodLength.dart';
import '../model/user_data.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});

  final date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserData>(context, listen: false).user;
    final userName = user.username;
    final periodLength = user.periodLength;
    final cycleLength = user.cycleLength;
    final recentPeriodDate = user.recentPeriodDate;

    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '  नमस्कार,  ',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              // Container(
              //     height: 50,
              //     width: 50,
              //     child: Image.asset('asset/images/namaskar.png')),
              SizedBox(width: 10),
              Text(
                userName,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink),
              ),
              SizedBox(
                width: 40,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            elevation: 10,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color.fromARGB(255, 246, 227, 227),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 70,
                    child: Image.asset('asset/images/clock.png'),
                  ),
                  Column(
                    children: [
                      Text(
                        DateFormat.yMMMd().format(date),
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        DateFormat.EEEE().format(date),
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                todayDetails(
                    'Today\'s Phase',
                    calculateMenstrualPhase(DateTime.now(), periodLength,
                            cycleLength, recentPeriodDate)
                        .values
                        .elementAt(0)),
                todayDetails(
                  'Pregnancy',
                  calculateMenstrualPhase(DateTime.now(), periodLength,
                              cycleLength, recentPeriodDate)
                          .values
                          .elementAt(1) +
                      ' chance',
                )
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 20),
              alignment: Alignment.center,
             
              height: size.height * .27,
              width: size.width * .9,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'My Cycle',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(children: [
                      _showContainer('Period Length', periodLength),
                      SizedBox(
                        width: 14,
                      ),
                      _showContainer('Cycle Length', cycleLength),
                    ]),
                  ],
                ),
              ))
        ]),
      ),
    );
  }

  Widget todayDetails(String name, String data) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: Color.fromARGB(255, 246, 227, 227),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          // border: Border.all(width: 1, color: borderColor),
          borderRadius: BorderRadius.circular(20),
          color: Color.fromARGB(255, 246, 227, 227),
        ),
        height: 200,
        width: 170,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
              Text(data,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text(
                'Know your Period days better',
                style: TextStyle(fontWeight: FontWeight.w300),
              ),
              TextButton(
                  onPressed: () {},
                  child: Row(children: [
                    Text(
                      'Read More',
                      style: TextStyle(color: buttonColor),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: buttonColor,
                    )
                  ])),
            ]),
      ),
    );
  }
}

Widget _showContainer(name, length) {
  String status = 'Normal';

  //some logic to calculate whether it is normal or bad
  //
  //
  if (name == 'Period Length') {
    if (length < 7 && length > 2) {
      status = 'Normal';
    } else {
      status = 'Bad';
    }
  }

  if (name == 'Cycle Length') {
    if (length < 35 && length > 21) {
      status = 'Normal';
    } else {
      status = 'Bad';
    }
  }
  return Card(
    elevation: 10,
    color: Color.fromARGB(255, 246, 227, 227),
    surfaceTintColor: Color.fromARGB(255, 246, 227, 227),
    child: Container(
      height: 155,
      width: 155,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            status,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 22,
              color: status == 'Normal'
                  ? Color.fromARGB(255, 31, 190, 123)
                  : Colors.red,
            ),
          ),
          Text(
            length.toString(),
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: buttonColor,
              fontSize: 30,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            name,
            style: TextStyle(
              fontWeight: FontWeight.w200,
              fontSize: 16,
            ),
          )
        ],
      ),
    ),
  );
}
