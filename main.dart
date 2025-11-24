import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/medicine_list_screen.dart';
import 'screens/medicine_category_screen.dart';
import 'screens/cart_screen.dart';
import 'models/cart_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AL WIAAM PHARMACY',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const LoginScreen(),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/medicines': (context) => const MedicineListScreen(),
        '/categories': (context) => const MedicineCategoryScreen(),
        '/cart': (context) => const CartScreen(),
      },
    );
  }
}
