import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sizer/sizer.dart';
import 'package:taskapp/utils/appTheme.dart';
import 'package:taskapp/view/login.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => goToHome());
  }

  goToHome() {
    Future.delayed(const Duration(seconds: 2), () async {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme().primary,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(child: SizedBox.shrink()),
            Padding(
              padding: EdgeInsets.all(2.h),
              child: SpinKitCircle(color: AppTheme().white,size: 20.w,)
            )
          ],
        )
      );
  }
}
