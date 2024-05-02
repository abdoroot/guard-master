import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guard_master/common/resources/app_color.dart';
import 'package:sizer/sizer.dart';

ThemeData get applicationTheme => ThemeData(
      scaffoldBackgroundColor: AppColors.scaffoldColor,

      /// Main Color
      primaryColor: AppColors.red,
      primaryColorLight: AppColors.secondary,
      primaryColorDark: Colors.black,
      disabledColor: Colors.grey,

      /// CardViewTheme
      cardTheme: const CardTheme(),

      /// AppBar Theme
      appBarTheme: AppBarTheme(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          )),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
          ),
          backgroundColor: AppColors.scaffoldColor,
          elevation: 0,
          titleTextStyle: GoogleFonts.cairo(
            fontSize: 11.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.secondary,
          ),
          centerTitle: true,
          iconTheme: IconThemeData(color: AppColors.black)),

      /// Button Theme
      buttonTheme: const ButtonThemeData(),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all<TextStyle?>(
            GoogleFonts.cairo(
              fontSize: 13.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),

      /// Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(35.w, 56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          textStyle: GoogleFonts.cairo(
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
          ),
          backgroundColor: AppColors.black,
        ),
      ),

      /// bottom nav bar
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.dark3,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        selectedLabelStyle: GoogleFonts.cairo(color: AppColors.white),
        unselectedLabelStyle: GoogleFonts.cairo(color: AppColors.white),
      ),

      /// Text Theme
      textTheme: TextTheme(
        //
        headlineLarge: GoogleFonts.cairo(
            fontSize: 16.sp, fontWeight: FontWeight.bold, color: AppColors.red),

        headlineMedium: GoogleFonts.cairo(
          fontSize: 15.sp,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        headlineSmall: GoogleFonts.cairo(
          fontSize: 15.sp,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
        titleLarge: GoogleFonts.cairo(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
        labelLarge: GoogleFonts.cairo(
          fontSize: 11.sp,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        labelMedium: GoogleFonts.cairo(
          fontSize: 11.sp,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        labelSmall: GoogleFonts.cairo(
          fontSize: 11.sp,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
        bodyMedium: GoogleFonts.cairo(
          fontSize: 10.sp,
          fontWeight: FontWeight.w500,
          color: Colors.grey,
        ),
        bodySmall: GoogleFonts.cairo(
          fontSize: 10.sp,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
      ),

      /// Input Decoration Theme (text form filed)
    );
