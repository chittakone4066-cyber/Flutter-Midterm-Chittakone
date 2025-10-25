import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_midterm/screens/developer_screen.dart';
import 'package:flutter_midterm/screens/form_screen.dart';
import 'package:flutter_midterm/screens/home_screen.dart';
import 'package:flutter_midterm/screens/product_screen.dart';
import 'package:flutter_midterm/providers/transaction_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TransactionProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const MyHomePage(),
          '/home': (context) => const HomeScreen(),
          '/products': (context) => const ProductScreen(),
          '/developer': (context) => const DeveloperScreen(),
          '/form': (context) => const FormScreen(),
        },
        title: 'Flutter Midterm App',
        theme: ThemeData(primarySwatch: Colors.blue),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''),
          Locale('lo', 'LA'),
          Locale('th', 'TH'),
        ],
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    const HomeScreen(),
    const ProductScreen(),
    const DeveloperScreen(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'ໜ້າຫຼັກ'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'ສິນຄ້າ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.developer_mode),
            label: 'ຜູ້ພັດທະນາ',
          ),
        ],
      ),
    );
  }
}
