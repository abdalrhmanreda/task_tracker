import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class Style {
  static const int kPrimaryColor = 0xff8062c6;
  static const int kDarkThemColor = 0xff1f2630;
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme:
        ThemeData().colorScheme.copyWith(primary: const Color(kPrimaryColor)),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: GoogleFonts.aBeeZee(
        color: Colors.black,
        fontSize: 18,
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
      ),
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
    ),
    textTheme: TextTheme(
      bodyMedium: GoogleFonts.aBeeZee(
        color: Colors.black,
      ),
      titleMedium: GoogleFonts.aBeeZee(
        color: Colors.black,
      ),
      titleSmall: GoogleFonts.aBeeZee(
        color: Colors.black,
      ),
      bodyLarge: GoogleFonts.aBeeZee(
        color: Colors.black,
      ),
    ),
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(kPrimaryColor),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: Color(kPrimaryColor),
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    datePickerTheme: DatePickerThemeData(
      backgroundColor: const Color(kDarkThemColor),
      headerHeadlineStyle: GoogleFonts.aBeeZee(color: Colors.white),
      headerHelpStyle: GoogleFonts.aBeeZee(color: Colors.white),
      dayStyle: GoogleFonts.aBeeZee(color: Colors.white),
      rangePickerHeaderHeadlineStyle: GoogleFonts.aBeeZee(color: Colors.white),
      rangePickerHeaderHelpStyle: GoogleFonts.aBeeZee(color: Colors.white),
      yearStyle: GoogleFonts.aBeeZee(color: Colors.white),
      weekdayStyle: GoogleFonts.aBeeZee(color: Colors.white),
      surfaceTintColor: Colors.white,
    ),
    timePickerTheme: const TimePickerThemeData(
      backgroundColor: Color(kDarkThemColor),
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    scaffoldBackgroundColor: const Color(kDarkThemColor),
    colorScheme: ThemeData().colorScheme.copyWith(
          primary: const Color(kPrimaryColor),
          onSurface: Colors.white,
          onPrimary: Colors.white, // body text color
        ),
    appBarTheme: AppBarTheme(
      backgroundColor: const Color(kDarkThemColor),
      elevation: 0,
      titleTextStyle: GoogleFonts.aBeeZee(
        color: Colors.white,
        fontSize: 18,
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
      ),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: GoogleFonts.aBeeZee(
        color: Colors.black,
      ),
      bodyMedium: GoogleFonts.aBeeZee(
        color: Colors.white,
      ),
      titleMedium: GoogleFonts.aBeeZee(
        color: Colors.white,
      ),
      titleSmall: GoogleFonts.aBeeZee(
        color: Colors.black,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(kPrimaryColor),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(kDarkThemColor),
      selectedItemColor: Color(kPrimaryColor),
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Color(kDarkThemColor),
    ),
    listTileTheme: ListTileThemeData(
      iconColor: Colors.white,
    ),
  );
}
