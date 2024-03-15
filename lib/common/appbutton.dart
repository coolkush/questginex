import 'package:flutter/material.dart';
import 'package:questginix/common/apptext.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class AppButton extends StatelessWidget {
  final double heightBut;
  final bool isloding;
  final GestureTapCallback onPressed;
  final double sizewidth;
  final double butTextSize;
  final double butRadius;
  final String buttonName;
  final Color buttonColor;
  final Color textColor;
  const AppButton(
      {Key? key,
      // this.buttonColor = const Color(0xfff7b731),
      this.buttonColor = const Color(0xff6a5ff0),
      this.textColor = const Color(0xff000000),
      this.butRadius = 0,
      this.butTextSize = 0,
      this.heightBut = 0,
      required this.buttonName,
      required this.onPressed,
      required this.sizewidth,
      required this.isloding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: heightBut == 0 ? 6.h : heightBut,
        width: sizewidth,
        decoration: BoxDecoration(
            color: buttonColor,
            borderRadius:
                BorderRadius.circular(butRadius == 0 ? 18 : butRadius)),
        child: Center(
          child: isloding
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : AppText(
                  color: textColor,
                  fontWeight: FontWeight.w500,
                  size: butTextSize == 0 ? 17.sp : butTextSize,
                  text: buttonName),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class AppButtonBlack extends StatelessWidget {
  final double heightBut;
  final GestureTapCallback onPressed;
  final double sizewidth;
  final double butTextSize;
  final Color textcolor;
  final double butRadius;
  final Color buttonColor;
  String buttonName;
  AppButtonBlack(
      {Key? key,
      this.butRadius = 0,
      this.butTextSize = 0,
      this.heightBut = 0,
      required this.buttonName,
      required this.onPressed,
      required this.sizewidth,
      this.buttonColor = const Color(0xff6a5ff0),
      this.textcolor = const Color(0xffFFA500)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: heightBut == 0 ? 7.h : heightBut,
        width: sizewidth,
        decoration: BoxDecoration(
            color: buttonColor,
            borderRadius:
                BorderRadius.circular(butRadius == 0 ? 18 : butRadius)),
        child: Center(
          child: AppText(
              color: textcolor,
              fontWeight: FontWeight.w500,
              size: butTextSize == 0 ? 14.sp : butTextSize,
              text: buttonName),
        ),
      ),
    );
  }
}
