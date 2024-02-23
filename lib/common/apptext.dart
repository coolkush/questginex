import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class AppText extends StatelessWidget {
  final double size;
  final FontWeight fontWeight;
  final Color color;
  final String text;
  final int maxlin;
  final TextOverflow hello;
  final TextAlign? align;
  const AppText({
    Key? key,
    this.align = TextAlign.justify,
    this.hello = TextOverflow.ellipsis,
    required this.fontWeight,
    required this.size,
    required this.text,
    this.maxlin = 1,
    this.color = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        textAlign: align,
        maxLines: maxlin,
        overflow: hello,
        style: GoogleFonts.abhayaLibre(
            color: color, fontSize: size, fontWeight: fontWeight));
  }
}
