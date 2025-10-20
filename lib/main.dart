import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/product_screen.dart';
import 'screens/developer_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/products': (context) => const ProductScreen(),
        '/developer': (context) => const DeveloperScreen(),
      },
    );
  }
}
