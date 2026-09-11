import 'package:go_router/go_router.dart';

import 'start_up_screen.dart';
import 'email_login_screen.dart';

import 'routes.dart';

class AppRouter {
  static final GoRouter appRouter = GoRouter(
    initialLocation: '/startUpScreen',

    routes: [
      GoRoute(
        path: '/startUpScreen',
        name: Routes.startUpScreen,
        builder: (context, state) {
          return const StartUpScreen();
        },
      ),

      GoRoute(
        path: '/emailLoginScreen',
        name: Routes.emailLoginScreen,
        builder: (context, state) {
          return const EmailLoginScreen();
        },
      ),
    ],
  );
}