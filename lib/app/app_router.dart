import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../core/network/api/dio_api_consumer.dart';
import '../data/data_sources/product_remote_data_source.dart';
import '../domain/repositories/product_repository_impl.dart';
import '../features/auth/presentation/screens/email_login_screen.dart';
import '../features/auth/presentation/screens/forgot_password_screen.dart';
import '../features/auth/presentation/screens/register_screen.dart';
import '../features/auth/presentation/screens/start_up_screen.dart';
import '../items_screen.dart';
import '../presentation/cubit/products/product_cubit.dart';

import 'routes.dart' as routes;

class AppRouter {
  static final GoRouter appRouter = GoRouter(
    initialLocation: '/',

    routes: [
      GoRoute(
        path: '/',
        name: routes.startUpScreen,
        builder: (context, state) {
          return const StartUpScreen();
        },
      ),

      GoRoute(
        path: '/email-login',
        name: routes.emailLoginScreen,
        builder: (context, state) {
          return const EmailLoginScreen();
        },
      ),

      GoRoute(
        path: '/forgot-password',
        name: routes.forgetpassword,
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
          final apiConsumer = DioApiConsumer(
            dio: Dio(),
          );

          final remoteDataSource = ProductRemoteDataSource(
            apiConsumer: apiConsumer,
          );

          final repository = ProductRepositoryImpl(
            remoteDataSource: remoteDataSource,
          );

          return BlocProvider(
            create: (context) => ProductCubit(
              repository: repository,
            ),
            child: const ItemsScreen(),
          );
        },
      ),
    ],
  );
}