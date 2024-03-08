import 'package:delivery_go/config/theme/app_theme.dart';
import 'package:delivery_go/presentation/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterHome extends StatelessWidget {
  static const String name = 'register_home';
  const RegisterHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/hamburguer.jpg'),
                    fit: BoxFit.cover)),
          ),
          const Positioned(
            left: 35,
            top: 100,
            child: Row(
              children: [
                Icon(
                  Icons.whatshot_rounded,
                  size: 80,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          const Positioned(
            top: 180,
            left: 50,
            child: Row(
              children: [
                Text(
                  'Food for\nEveryone',
                  style: TextStyle(
                    fontSize: 35.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 170,
            top: 530,
            child: TextButton(
              onPressed: () {
                // navegation homescreen with go router
                context.pushNamed(RegisterScreen.name);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.purple), // Color de fondo del botón
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.only(
                  right: 20,
                  left: 20,
                )), // Padding del botón), // Bordes redondeados del botón
              ),
              child: const Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Positioned(
            right: 96,
            top: 530,
            child: TextButton(
              onPressed: () {
                context.pushNamed(RegisterScreen.name);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.white), // Color de fondo del botón
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.only(
                  right: 28,
                  left: 22,
                )), // Padding del botón), // Bordes redondeados del botón
              ),
              child: const Text(
                'Login',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
