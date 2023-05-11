import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:taskapp/components/button.dart';
import 'package:taskapp/controller/local.dart';
import 'package:taskapp/utils/appTheme.dart';
import 'package:taskapp/utils/notification.dart';
import 'package:taskapp/view/home.dart';
import '../components/textField.dart';
import '../controller/auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginAuth());
    final langcont = Get.put(LocalController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppTheme().primary,
        onPressed: () {
          NotificationApi().showNotification(title: "Notification",body: "hey this is a notification test ",);
        },
        child: Icon(
          Icons.notifications,
          color: AppTheme().white,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: SizerUtil.height,
          padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 5.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'welcome'.tr,
                style: AppTheme().primaryStyle(24.sp),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "AR",
                    style: AppTheme().primaryStyle(12.sp),
                  ),
                  Obx(() => Switch(
                        onChanged: langcont.changeLang,
                        value: langcont.lang.value == 'en' ? true : false,
                        activeColor: Colors.grey[600],
                        activeTrackColor: Colors.grey[300],
                        inactiveThumbColor: Colors.green,
                        inactiveTrackColor: Colors.green[700],
                      )),
                  Text(
                    "EN",
                    style: AppTheme().primaryStyle(12.sp),
                  ),
                ],
              ),
              Column(
                children: [
                  TextfieldCustom(
                    hint: "example@mail.com",
                    text: 'email'.tr,
                    controller: _emailController,
                    type: TextInputType.emailAddress,
                    password: false,
                  ),
                  AppTheme().addVerBox(2.h),
                  TextfieldCustom(
                    hint: "*********",
                    text: 'pass'.tr,
                    controller: _passwordController,
                    type: TextInputType.text,
                    password: true,
                  ),
                  AppTheme().addVerBox(5.h),
                  InkWell(
                      onTap: () async {
                        bool auth = await controller.login(
                            _emailController.text, _passwordController.text);
                        if (auth) {
                          langcont.setLocale(const Locale('en'));
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()),
                            (route) => false,
                          );
                        } else {
                          Get.snackbar(
                            'Failed',
                            'wrong login credential',
                            duration: const Duration(seconds: 5),
                            snackPosition: SnackPosition.BOTTOM,
                          );
                        }
                      },
                      child: Button(
                          text: 'login'.tr,
                          backColor: AppTheme().primary,
                          fontColor: AppTheme().white,
                          width: SizerUtil.width))
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 2.h),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    'noacc'.tr,
                    style: AppTheme().primaryStyle(11.sp),
                  ),
                  InkWell(
                      child: Text(
                    'signup'.tr,
                    style: AppTheme().colorStyle(11.sp),
                  )),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
