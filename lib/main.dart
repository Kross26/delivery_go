import 'package:flutter/material.dart';
import 'package:delivery_go/config/router/app_router.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
//
  @override
  Widget build(BuildContext context) {
    // go router
    return MaterialApp.router(
      title: 'DeliveryGo',
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
