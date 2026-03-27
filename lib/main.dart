import 'package:flutter/material.dart';
import 'pages/splash_screen.dart';
import 'Pages/intro_page.dart';
import 'pages/login_page.dart';
import 'pages/home_page.dart';
import 'pages/items_page.dart';
import 'pages/cart_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grocery App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2E8BAE)),
        useMaterial3: true,
      ),
      home: SplashScreen(),
      // home: IntroPage(),
      // home: LoginPage(),
      // home: HomePage(),
      // home: ItemsPage(),
      // home: CartPage(),
    );
  }
}