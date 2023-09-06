import 'package:expensetracker/screens/expense_screen.dart';
import 'package:flutter/material.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 17, 140, 145));
var kDarkScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 5, 99, 125),
);
void main() {
  runApp(MaterialApp(
    darkTheme: ThemeData.dark().copyWith(
      useMaterial3: true,
      colorScheme: kDarkScheme,
      cardTheme: const CardTheme().copyWith(
        color: kDarkScheme.secondaryContainer,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: kDarkScheme.primaryContainer,
            foregroundColor: kDarkScheme.onPrimaryContainer),
      ),
    ),
    theme: ThemeData().copyWith(
      useMaterial3: true,
      colorScheme: kColorScheme,
      appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer),
      cardTheme: const CardTheme().copyWith(
        color: kColorScheme.secondaryContainer,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer),
      ),
      textTheme: ThemeData().textTheme.copyWith(
            titleLarge: TextStyle(
              fontWeight: FontWeight.bold,
              color: kColorScheme.onSecondaryContainer,
              fontSize: 14,
            ),
          ),
    ),
    debugShowCheckedModeBanner: false,
    home: const Expense(),
  ));
}
