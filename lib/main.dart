import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled1/main_content.dart';

final kColorScheme = ColorScheme.fromSeed(seedColor: const Color(0x6b0a0a0a));

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((fn) {
    runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData().copyWith(
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: kColorScheme.onSecondaryContainer,
              foregroundColor: kColorScheme.primaryContainer,
            ),
          ),
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: kColorScheme.onPrimaryContainer,
            foregroundColor: kColorScheme.primaryContainer,
          ),
          textTheme: const TextTheme(
            titleSmall: TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
        home: Scaffold(
          backgroundColor: kColorScheme.onPrimaryContainer,
          appBar: AppBar(
            title: const Text(
              'Body Mass Index',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),
            ),
            centerTitle: true,
          ),
          body: const CurrPage(),
        ),
      ),
    );
  });
}
