import 'package:go_router/go_router.dart';

import '../features/auth/presentation/screens/start_up_screen.dart';
import '../features/auth/presentation/screens/email_login_screen.dart';
import '../features/auth/presentation/screens/forgot_password_screen.dart';
import '../features/auth/presentation/screens/register_screen.dart';
import '../items_screen.dart' ;


import 'routes.dart' as routes;

class AppRouter {
  static final GoRouter appRouter = GoRouter(
    initialLocation: '/startUpScreen',

    routes: [
      GoRoute(
        path: '/startUpScreen',
        name: routes.startUpScreen,
        builder: (context, state) {
          return const StartUpScreen();
        },
      ),

      GoRoute(
        path: '/emailLoginScreen',
        name: routes.emailLoginScreen,
        builder: (context, state) {
          return const EmailLoginScreen();
        },
      ),

      GoRoute(
        path: '/forgot-password',
        name: 'forgotPassword',
        builder: (context, state) {
          return const ForgotPasswordScreen();
        },
      ),

      GoRoute(
        path: '/register',
        name: routes.registerScreen,
        builder: (context, state) {
          return const RegisterScreen();
        },
      ),
      GoRoute(
        path: '/items-screen',
        name: routes.itemsScreen,
        builder: (context, state) {
          return const ItemsScreen();
        },
      ),
    ],
  );
}