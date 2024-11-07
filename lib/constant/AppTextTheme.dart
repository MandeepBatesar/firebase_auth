import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  AppColors();
  Color primary = const Color(0xff030218);
  Color black = const Color(0xff000000);
  Color white = Colors.white;
  Color bgclr = const Color(0xffF1EDED);
  Color gray = const Color(0xff5D5D5D);
  Color lightgray = const Color(0xffD9D9D9);
  Color green = const Color(0xff1C9D07);
  Color lightgreen = const Color(0xffB6D400);
  Color yellow = const Color(0xffFFD600);
  Color blue = const Color(0xff0057FF);
  Color red = const Color(0xffFF0000);
}

class AppTextTheme {
  AppTextTheme();
  // NORMAL0
  TextStyle fs10Normal =
      GoogleFonts.outfit(fontSize: 10, fontWeight: FontWeight.w400);
  TextStyle fs12Normal =
      GoogleFonts.outfit(fontSize: 12, fontWeight: FontWeight.w400);
  TextStyle fs14Normal =
      GoogleFonts.outfit(fontSize: 14, fontWeight: FontWeight.w400);
  TextStyle fs13Normal =
      GoogleFonts.outfit(fontSize: 13, fontWeight: FontWeight.w400);
  TextStyle fs16Normal =
      GoogleFonts.outfit(fontSize: 16, fontWeight: FontWeight.w400);
  TextStyle fs18Normal =
      GoogleFonts.outfit(fontSize: 18, fontWeight: FontWeight.w400);
  TextStyle fs20Normal =
      GoogleFonts.outfit(fontSize: 20, fontWeight: FontWeight.w400);
  TextStyle fs22Normal =
      GoogleFonts.outfit(fontSize: 22, fontWeight: FontWeight.w400);
  TextStyle fs24Normal =
      GoogleFonts.outfit(fontSize: 24, fontWeight: FontWeight.w400);
  TextStyle fs26Normal =
      GoogleFonts.outfit(fontSize: 26, fontWeight: FontWeight.w400);
  TextStyle fs28Normal =
      GoogleFonts.outfit(fontSize: 28, fontWeight: FontWeight.w400);
  TextStyle fs34Normal =
      GoogleFonts.outfit(fontSize: 34, fontWeight: FontWeight.w400);

  // MEDIUM
  TextStyle fs16Medium =
      GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500);
  TextStyle fs18Medium =
      GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500);
  TextStyle fs20Medium =
      GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w500);
  TextStyle fs24Medium =
      GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w500);
  TextStyle fs29Medium =
      GoogleFonts.poppins(fontSize: 29, fontWeight: FontWeight.w500);
  //Bold
  TextStyle fs12Bold =
      GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w700);
  TextStyle fs16Bold =
      GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w700);
  TextStyle fs18Bold =
      GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w700);
  TextStyle fs20Bold =
      GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w700);
  TextStyle fs24Bold =
      GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w700);
}
