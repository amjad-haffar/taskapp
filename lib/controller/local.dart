import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalController extends GetxController {
  Locale _locale = const Locale("ar", "");
  var lang = 'ar'.obs;
  Locale get locale => _locale;
  void setLocale(Locale locale) {
    Get.updateLocale(locale);
    lang.value = locale.languageCode;
    }

  void changeLang(bool x) {
    if (lang.value =='ar') {
      lang.value = 'en';
      setLocale(const Locale('en'));
    } else {
      setLocale(const Locale('ar'));
      lang.value = 'ar';
    }
  }
}
