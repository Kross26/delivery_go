import 'package:go_router/go_router.dart';
import 'package:delivery_go/presentation/screens/screens.dart';

final appRouter = GoRouter(
    // initialLocation: '/',
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
      )
    ]);

// slider
