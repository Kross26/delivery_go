import 'package:go_router/go_router.dart';
import 'package:delivery_go/presentation/screens/screens.dart';

final appRouter = GoRouter(
    // initialLocation: '/register_home',
    routes: [
      // route sliderlanding
      GoRoute(
        path: '/',
        name: SliderLanding.name,
        builder: (context, state) => const SliderLanding(),
      ),

      GoRoute(
        path: '/home_screen',
        name: HomeScreen.name,
        builder: (context, state) => const HomeScreen(),
      ),

      GoRoute(
        path: '/register_home',
        name: RegisterScreen.name,
        builder: (context, state) => RegisterScreen(),
      ),

      GoRoute(
        path: '/register_screen',
        name: RegisterScreen.name,
        builder: (context, state) => RegisterScreen(),
      )
    ]);

// slider
