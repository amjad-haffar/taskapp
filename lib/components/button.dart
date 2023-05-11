
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sizer/sizer.dart';

class Button extends StatefulWidget {
  const Button(
      {Key? key,
      required this.text,
      required this.backColor,
      required this.fontColor,
      // required this.shadowColor,
      required this.width,
      })
      : super(key: key);
  final String text;
  final Color fontColor;
  final Color backColor;
  final dynamic width;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 7.h,
      width: widget.width,
      decoration:
          BoxDecoration(
          color: widget.backColor,
          borderRadius: BorderRadius.circular(2.5.h),)
          ,
      child: Center(
        child:
        widget.text==""?
         SpinKitCircle(
          color: widget.fontColor,
          size: 6.h
        ):
        Text(
          widget.text,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15.sp,
              color: widget.fontColor),
        )

      ),
    );
  }
}
