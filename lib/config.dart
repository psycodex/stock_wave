import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const String emulatorIp = "127.0.0.1";
const int firebasePort = 8080;
const int firebaseAuth = 9099;
const bool shouldUseFirebaseEmulator = false;

const GOOGLE_CLIENT_ID =
    '150015187293-gp8qbofnfpccjr7d0lcdp3ukccki8fjq.apps.googleusercontent.com';
// const GOOGLE_REDIRECT_URI =
//     'https://psyc-fit.firebaseapp.com/__/auth/handler';
const FACEBOOK_CLIENT_ID = '539756314747237';
const REMOTE_CONFIG_REFRESH_TIME = Duration(seconds: 10);

const placeholderImage =
    'https://upload.wikimedia.org/wikipedia/commons/c/cd/Portrait_Placeholder_Square.png';

const ADMIN_ID = "OHl5QCGkgMO2GOZs7DsHoJeAC1w1";

final String? fontFamily = GoogleFonts.notoSans().fontFamily;
const TextTheme textTheme = TextTheme(
  displayMedium: TextStyle(fontSize: 41),
  displaySmall: TextStyle(fontSize: 36),
  labelSmall: TextStyle(fontSize: 11, letterSpacing: 0.5),
);

const double windowBorderSize = 1;
