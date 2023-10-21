import 'package:flutter/material.dart';
import 'package:stritva/view/edit_profile.dart';
import '../constant.dart';
import '../widget/profile_menu_widget.dart';
import './update_details.dart';
import 'package:provider/provider.dart';
import '../model/user_data.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final user = Provider.of<UserData>(context, listen: false).user;
    final username = user.username;
    final userEmail = user.email;
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              'Profile',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: size.height * 0.2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(size.width * 0.92),
                child: Image.asset('asset/images/profile.png'),
              ),
            ),
            Text(
              username,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(userEmail),
            SizedBox(
              height: 20,
            ),
            SizedBox(
                width: 200,
                child: ElevatedButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EditProfileScreen())),
                    child: Text(
                      'Edit Profile',
                      style: TextStyle(color: borderColor),
                    ))),
            SizedBox(
              height: 20,
            ),
            ProfileMenuWidget(
                title: 'Change Details',
                icon: Icons.edit,
                onPress: () => _changeDetailsFunc(context)),
            ProfileMenuWidget(
                title: 'Reports',
                icon: Icons.insert_drive_file_outlined,
                onPress: () {}),
            ProfileMenuWidget(
                title: 'Settings', icon: Icons.settings, onPress: () {}),
            ProfileMenuWidget(
              title: 'Logout',
              icon: Icons.logout,
              onPress: () {},
              textColor: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}

_changeDetailsFunc(BuildContext context) {
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditPeriodInfoScreen(),
      ));
}
