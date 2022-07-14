import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFF0747a1);
const Color notificationColor = Color(0xFF64b7f6);
const Color accentColor = Color(0xFFFFF9E3);
const Color offWhiteGrey = Color(0xFFFAFAFA);
const Color overlayColor = Color(0x66FFC600);
const Color backgroundColor = Color.fromARGB(255, 26, 27, 30);
const Color linkColor = Color(0xFF000000);

const Color inputFillColor = Color(0xFFF8F9FC);
const Color cardBackgroundColor = Color(0xFFE6D2D3);
const Color white = Color(0xFFFFFFFF);

const Color grey = Color(0xFF999999);

const kPrimaryColor = Color(0xFFFFC600);
const kPrimaryLightColor = Color(0xFFFFECDF);

const kSecondaryColor = Color(0xFF000000);
const kTextColor = Color(0xFF0D0D0D);
const kTextSecondaryColor = Color(0xFF828282);
const kActiveColor = Color(0xFF000000);
const kSubIconColor = Color(0XFFC4C4C4);

// Form Error
const String emailValidator =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kFileError = "File not accepted";
const String naira = "\u20A6";
