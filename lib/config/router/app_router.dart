import 'package:go_router/go_router.dart';
import 'package:delivery_go/presentation/screens/screens.dart';
import 'package:delivery_go/presentation/screens/slider_landing/slider_landing_screen.dart';

final appRouter = GoRouter(initialLocation: '/', routes: [
  // route sliderlanding
  GoRoute(
    path: '/',
    name: SliderLanding.name,
    builder: (context, state) => const SliderLanding(),
  ),
]);
//