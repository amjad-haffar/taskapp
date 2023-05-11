import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../utils/appTheme.dart';

class TextfieldCustom extends StatelessWidget {
  TextfieldCustom(
      {Key? key,
      required this.text,
      required this.hint,
      required this.type,
      this.password = false,
      this.lines=0,
      this.controller})
      : super(key: key);
  final String text;
  final String hint;
  final TextInputType type;
  final TextEditingController? controller;
  int lines;
  bool password;

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 2.h, bottom: 1.5.h, left: 3.w),
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold,
                  color: AppTheme().primaryFont),
            ),
          ),
          TextFormField(
            controller: controller,
            maxLines: lines==0? 1: lines,
            obscureText: password,
            cursorColor: Colors.blue,
            textAlign: TextAlign.start,
            decoration: InputDecoration(
              counterText: '',
              errorMaxLines: 4,
              filled: true,
              fillColor: AppTheme().white,
              border: OutlineInputBorder(
                borderSide: const BorderSide(style: BorderStyle.none),
                borderRadius: BorderRadius.circular(2.h),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(style: BorderStyle.none),
                borderRadius: BorderRadius.circular(2.h),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(style: BorderStyle.none),
                borderRadius: BorderRadius.circular(2.h),
              ),
              contentPadding: EdgeInsets.only(
                  left: 4.w, bottom: 1.7.h, top: 1.7.h, right: 5.w),
              hintText: hint,
              hintStyle: TextStyle(fontSize: 12.sp, color: AppTheme().hint),
            ),
          ),
        ]);
  }
}
