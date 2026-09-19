import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../core/di/service_locator.dart';
import '../features/auth/presentation/cubit/auth_cubit.dart';
import '../features/auth/presentation/screens/email_login_screen.dart';
import '../features/auth/presentation/screens/email_verification_screen.dart';
import '../features/auth/presentation/screens/register_screen.dart';
import '../features/auth/presentation/screens/start_up_screen.dart';
import '../features/products/presentation/cubit/product_details_cubit.dart';
import '../features/products/presentation/cubit/products_cubit.dart';
import '../features/products/presentation/screens/product_details_screen.dart';
import '../features/products/presentation/screens/product_screen.dart';
import 'routes.dart';

class AppRouter {
  static final GoRouter appRouter = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: AppRoutes.start,
        builder: (_, _) => const StartUpScreen(),
      ),
      GoRoute(
        path: '/login',
        name: AppRoutes.login,
        builder: (context, state) => BlocProvider<AuthCubit>(
          create: (_) => getIt(),
          child: EmailLoginScreen(
            initialEmail: state.uri.queryParameters['email'],
          ),
        ),
      ),
      GoRoute(
        path: '/register',
        name: AppRoutes.register,
        builder: (_, _) => BlocProvider<AuthCubit>(
          create: (_) => getIt(),
          child: const RegisterScreen(),
        ),
      ),
      GoRoute(
        path: '/verify-email',
        name: AppRoutes.verifyEmail,
        builder: (_, state) => BlocProvider<AuthCubit>(
          create: (_) => getIt(),
          child: EmailVerificationScreen(
            email: state.uri.queryParameters['email'] ?? '',
          ),
        ),
      ),
      GoRoute(
        path: '/products',
        name: AppRoutes.products,
        builder: (_, _) => BlocProvider<ProductsCubit>(
          create: (_) => getIt(),
          child: const ProductScreen(),
        ),
      ),
      GoRoute(
        path: '/products/:id',
        name: AppRoutes.productDetails,
        builder: (_, state) => BlocProvider<ProductDetailsCubit>(
          create: (_) => getIt(),
          child: ProductDetailsScreen(
            productId: state.pathParameters['id'] ?? '',
          ),
        ),
      ),
    ],
    errorBuilder: (_, _) =>
        const Scaffold(body: Center(child: Text('Page not found'))),
  );
}
