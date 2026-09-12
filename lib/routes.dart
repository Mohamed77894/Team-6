import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'start_up_screen.dart';
import 'email_login_screen.dart';
const String startUpScreen = 'startUpScreen';
const String emailLoginScreen = 'emailLoginScreen';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const StartUpScreen(),
    ),

    GoRoute(
      path: '/email-login',
      builder: (context, state) => const EmailLoginScreen(),
    ),
  ],
);