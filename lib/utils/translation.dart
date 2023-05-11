import 'package:get/get.dart';

class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          "pass":"password",
          "noacc":"don't have an account? ",
          "signup":"Signup",
          "login":"Log in",
          "welcome":"Welcome!",
          "email":"Email Address"
        },
        'ar': {
          "email": "البريد الالكتروني",
          "pass":"كلمة المرور",
          "noacc":"ليس لديك حساب؟ ",
          "signup":"قم بالتسجيل",
          "login":"تسجيل الدخول",
          "welcome":"مرحبا!"
        }
      };
}