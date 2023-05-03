import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_ex1/providers/movie_provider.dart';
import 'package:provider_ex1/screens/home_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (_) => MovieProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
