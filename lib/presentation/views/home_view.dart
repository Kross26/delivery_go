import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: const Center(
        child: Text(
          'Welcome',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 28,
          ),
        ),
      ),
    );
  }
}
