import 'package:anime/core/colors/colors.dart';
import 'package:anime/routes/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Anime',
      theme: ThemeData(
        fontFamily: "PassionOne",
        brightness: Brightness.dark,
        primarySwatch: MaterialColorGenerator.from(ColorPalette.primary),
      ),
      routerConfig: CustomRoutes.goRouter,
    );
  }
}