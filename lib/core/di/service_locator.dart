import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/data/datasources/auth_remote_data_source.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/usecase/login.dart';
import '../../features/auth/domain/usecase/register_user.dart';
import '../../features/auth/domain/usecase/resend_otp.dart';
import '../../features/auth/domain/usecase/verify_email.dart';
import '../../features/auth/presentation/cubit/auth_cubit.dart';
import '../../features/products/data/datasources/product_remote_data_source.dart';
import '../../features/products/data/repositories/product_repository_impl.dart';
import '../../features/products/domain/repositories/product_repository.dart';
import '../../features/products/domain/usecase/get_product_details.dart';
import '../../features/products/domain/usecase/get_products.dart';
import '../../features/products/presentation/cubit/product_details_cubit.dart';
import '../../features/products/presentation/cubit/products_cubit.dart';
import '../network/api/api_consumer.dart';
import '../network/api/dio_api_consumer.dart';

final getIt = GetIt.instance;

void setupDependencies() {
  if (getIt.isRegistered<ApiConsumer>()) return;

  getIt.registerLazySingleton<Dio>(
    () => Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20),
      ),
    ),
  );
  getIt.registerLazySingleton<ApiConsumer>(() => DioApiConsumer(dio: getIt()));

  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSource(getIt()),
  );
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(getIt()),
  );
  getIt.registerLazySingleton(() => RegisterUser(getIt()));
  getIt.registerLazySingleton(() => VerifyEmail(getIt()));
  getIt.registerLazySingleton(() => ResendOtp(getIt()));
  getIt.registerLazySingleton(() => LoginUser(getIt()));
  getIt.registerFactory(
    () => AuthCubit(
      registerUser: getIt(),
      verifyEmailUseCase: getIt(),
      resendOtpUseCase: getIt(),
      loginUser: getIt(),
    ),
  );

  getIt.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSource(getIt()),
  );
  getIt.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(getIt()),
  );
  getIt.registerLazySingleton(() => GetProducts(getIt()));
  getIt.registerLazySingleton(() => GetProductDetails(getIt()));
  getIt.registerFactory(() => ProductsCubit(getIt()));
  getIt.registerFactory(() => ProductDetailsCubit(getIt()));
}
