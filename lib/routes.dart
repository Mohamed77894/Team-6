import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'start_up_screen.dart';
import 'email_login_screen.dart';
import 'register_screen.dart';
import 'forgot_password_screen.dart';

const String startUpScreen = 'startUpScreen';
const String emailLoginScreen = 'emailLoginScreen';
const String registerScreen = 'registerScreen';

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
  ],
);