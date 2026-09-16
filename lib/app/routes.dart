import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/auth/presentation/screens/start_up_screen.dart';
import '../features/auth/presentation/screens/email_login_screen.dart';
import '../features/auth/presentation/screens/register_screen.dart';
import '../features/auth/presentation/screens/forgot_password_screen.dart';
import '../items_screen.dart';

const String startUpScreen = 'startUpScreen';
const String emailLoginScreen = 'emailLoginScreen';
const String registerScreen = 'registerScreen';
const String itemsScreen = 'itemsScreen';

final GoRouter router = GoRouter(
  initialLocation: '/',

  routes: [
    GoRoute(
      path: '/',
      name: startUpScreen,
      builder: (context, state) => const StartUpScreen(),
    ),

    GoRoute(
      path: '/email-login',
      name: emailLoginScreen,
      builder: (context, state) => const EmailLoginScreen(),
    ),

    GoRoute(
      path: '/register',
      name: registerScreen,
      builder: (context, state) => const RegisterScreen(),
    ),

    GoRoute(
      path: '/forgot-password',
      name: 'forgotPassword',
      builder: (context, state) => const ForgotPasswordScreen(),
    ),
     GoRoute(
      path: '/items-screen',
      name: 'itemsScreen',
      builder: (context, state) => const ItemsScreen (),
    ),
  ],
);

