import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constant.dart';
import 'package:provider/provider.dart';
import '../model/user_data.dart';
import 'coming_soon.dart';

class HomePage extends StatefulWidget {
  static String id = 'HomePage';

  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Future<void> getBool() async {
  //   SharedPreferences prefs =
  //       await SharedPreferences.getInstance() as SharedPreferences;
  //   prefs.setBool('seen', false);
  // }

  Future<void> setBool() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('seen', true);


    Provider.of<UserData>(context, listen: false).getUserFromPrefs();
  }

  @override
  void initState() {
    super.initState();
    setBool();

    // getBool();
  }

  int _index = 0;

  void _onItemTapped(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Strtiva',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Ubuntu',
          textTheme: const TextTheme(
            bodyMedium: TextStyle(
              fontFamily: 'Ubuntu',
              fontWeight: FontWeight.w400,
            ),
            titleLarge: TextStyle(
              fontFamily: 'Ubuntu',
              fontWeight: FontWeight.bold,
            ),
            titleMedium: TextStyle(
              fontFamily: 'Ubuntu',
              fontWeight: FontWeight.bold,
            ),
            titleSmall: TextStyle(
              fontFamily: 'Ubuntu',
              fontWeight: FontWeight.bold,
            ),
          ),
          scaffoldBackgroundColor: backgroundColor,
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: backgroundColor,
            selectedItemColor: buttonColor,
            unselectedItemColor: buttonColor,
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          primarySwatch: Colors.pink,
          buttonTheme: ButtonThemeData(buttonColor: buttonColor)),
      home: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: backgroundColor,
          appBar: AppBar(
            backgroundColor: backgroundColor,
            centerTitle: true,
            leading: Padding(
              padding: EdgeInsets.only(right: 10),
              child: IconButton(
                icon: Icon(
                  Icons.notifications_none_outlined,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return const ComingSoon();
                    }),
                  );
                },
                color: buttonColor,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Container(
                  height: 30,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset('asset/images/profile.png'),
                  ),
                ),
              ),
            ],
            title: Text(
              'Stritva',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: buttonColor,
                  fontSize: 28),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: backgroundColor,
            selectedItemColor: buttonColor,
            elevation: 5,
            items: [
              BottomNavigationBarItem(
                  icon: _index == 0
                      ? Icon(Icons.dashboard_rounded)
                      : Icon(Icons.dashboard_outlined),
                  label: 'dashboard'),
              BottomNavigationBarItem(
                  icon: _index == 1
                      ? Icon(Icons.calendar_month_sharp)
                      : Icon(Icons.calendar_month_outlined),
                  label: 'calendar'),
              BottomNavigationBarItem(
                  icon: _index == 2
                      ? Icon(Icons.tips_and_updates_sharp)
                      : Icon(Icons.tips_and_updates_outlined),
                  label: 'info'),
              BottomNavigationBarItem(
                  icon: _index == 3
                      ? Icon(Icons.manage_accounts_rounded)
                      : Icon(Icons.manage_accounts_outlined),
                  label: 'Profile')
            ],
            currentIndex: _index,
            onTap: _onItemTapped,
          ),
          body: pages[_index]),
    );
  }
}
