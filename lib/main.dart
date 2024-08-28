import 'package:flutter/material.dart';
import 'package:project/views/home_view.dart';

void main() {
  runApp(const SmoothIndicator());
}

class SmoothIndicator extends StatelessWidget {
  const SmoothIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
