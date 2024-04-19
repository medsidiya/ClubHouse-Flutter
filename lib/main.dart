import 'package:clubhouse_ui/constants.dart';
import 'package:clubhouse_ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'ClubHouse UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme:const AppBarTheme(backgroundColor: kBackgroundColor,),
        scaffoldBackgroundColor: kBackgroundColor,
        primaryColor: Colors.white,
        colorScheme: colorScheme,
        iconTheme:const IconThemeData(color: Colors.black),
        fontFamily: GoogleFonts.montserrat().fontFamily,
        textTheme: GoogleFonts.montserratTextTheme(),

    ),
    home: const HomeScreen(),
    );
  }
}
