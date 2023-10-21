import 'package:flutter/material.dart';
import 'package:stritva/constant.dart';

class ProfileMenuWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onPress;
  final Color textColor;

  ProfileMenuWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.textColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => onPress(),
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.grey.withOpacity(0.1),
        ),
        child: Icon(
          icon,
          color: buttonColor,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.w400, color: textColor),
      ),
      trailing: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.grey.withOpacity(0.1),
        ),
        child: const Icon(
          Icons.chevron_right_rounded,
          size: 18,
          color: Colors.grey,
        ),
      ),
    );
  }
}
