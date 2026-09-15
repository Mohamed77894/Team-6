import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_router.dart';
import 'app_theme.dart';
import 'theme_cubit.dart';
import 'theme_state.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => ThemeCubit(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: AppRouter.appRouter,

          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,

          themeMode: state.isDark
              ? ThemeMode.dark
              : ThemeMode.light,
        );
      },
    );
  }
}