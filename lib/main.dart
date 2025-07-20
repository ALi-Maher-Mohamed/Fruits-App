import 'package:flutter/material.dart';
import 'package:fruits_app/views/home_view.dart';

void main() {
  runApp(Fruits());
}

class Fruits extends StatelessWidget {
  const Fruits({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeView());
  }
}
