
import 'package:commerce_hub_dashboard/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class Styles {
  static TextStyle textonbording23 = TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 23,
      fontFamily: GoogleFonts.cairo().fontFamily,
      color: ColorsManager.blackText);

  static TextStyle textonbording13 = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 13,
      fontFamily: GoogleFonts.cairo().fontFamily,
      color: ColorsManager.blackText);

  static TextStyle textappBarAuth = TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 19,
      fontFamily: GoogleFonts.cairo().fontFamily,
      color: ColorsManager.blackText);

  static TextStyle textSize13Black600 = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 13,
      fontFamily: GoogleFonts.cairo().fontFamily,
      color: ColorsManager.blackText);

  static TextStyle textSize13gree600 = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 13,
      fontFamily: GoogleFonts.cairo().fontFamily,
      color: Colors.green);

  static TextStyle textbuttom16White = TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 16,
      fontFamily: GoogleFonts.cairo().fontFamily,
      color: Colors.white);

  static TextStyle textRowNavigate16gray = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 16,
      fontFamily: GoogleFonts.cairo().fontFamily,
      color: const Color(0xffA4ACAD));
  static TextStyle textRowNavigate16green = TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 16,
      fontFamily: GoogleFonts.cairo().fontFamily,
      color: Colors.green);

}