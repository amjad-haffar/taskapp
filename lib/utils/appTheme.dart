import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class AppTheme {
  Color primary = const Color.fromARGB(255, 0, 35, 159);
  Color redColor =const Color.fromARGB(255, 190, 6, 0);
  Color green= const Color.fromARGB(255, 0, 148, 7);
  Color backGround = const Color(0xffF6F6F6);
  Color primaryFont = const Color(0xff373737);
  Color secondaryFont = const Color(0xff838383);
  Color greyColor = const Color(0xffF8F8FA);
  Color hint = const Color(0xffBDBDBD);
  Color white = const Color(0xffffffff);
  Widget addVerBox(double x) {
    return SizedBox(
      height: x,
    );
  }

  TextStyle primaryStyle(double size,) {
    return TextStyle(color: primaryFont,fontSize: size,fontWeight: FontWeight.bold,);
  }
  TextStyle colorStyle(double size,) {
    return TextStyle(color: primary,fontSize: size,fontWeight: FontWeight.bold,);
  }
  TextStyle hintStyle(double size,) {
    return TextStyle(color: secondaryFont,fontSize: size,);
  }

  Widget addhorBox(double x) {
    return SizedBox(
      width: x,
    );
  }
}
// Globals
// AndroidNotificationChannel channel = AndroidNotificationChannel(
//   'Orders',
//   'High Importance Notifications',
//   importance: Importance.max,
//   playSound: false,
//   showBadge: true,
//   enableVibration: true,
//   enableLights: true,
// );
// FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();