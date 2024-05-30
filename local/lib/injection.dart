import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:local/core/constant/app_colors.dart';
import 'package:local/core/services/image_utility.dart';
import 'package:local/core/services/local_storage.dart';
import 'package:local/core/utility/http_utils.dart';
import 'package:get_it/get_it.dart';

import 'features/auth/presentation/bloc/auth/auth_bloc.dart';

final GetIt getIt = GetIt.instance;

class Injection {
  
    static AuthBloc get authBloc {
    return AuthBloc(
    );
  }

  static Future<void> init() async {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarColor: AppColors.primary,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: AppColors.primary,
        systemNavigationBarContrastEnforced: true,
        systemNavigationBarDividerColor: AppColors.primary,
        systemStatusBarContrastEnforced: true,
        systemNavigationBarIconBrightness: Brightness.light));
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);


    final dio = Dio();
    dio.options.extra['withCredentials'] = true;
    // dio.interceptors.add(InterceptorsWrapper(
    //   onRequest:
    //       (RequestOptions requestOptions, RequestInterceptorHandler handler) {
    //     print('Request OPtions : ${requestOptions.data}');
    //     handler.next(requestOptions);
    //   },
    //   onResponse: (Response response, handler) {
    //     print('Response : ${response.data}');
    //     print('Response : ${response.headers}');
    //     print('Response : ${response.requestOptions}');
    //     print('Response : ${response.statusCode}');
    //     handler.resolve(response);
    //   },
    //   onError: (DioError err, ErrorInterceptorHandler handler) {
    //     print('ERROR DIO :: $err');
    //   },
    // ));
    
    getIt.registerSingleton<Dio>(dio);

    const storage = FlutterSecureStorage();
    getIt.registerSingleton<FlutterSecureStorage>(storage);

    final localStorage = LocalStorageImpl(getIt<FlutterSecureStorage>());
    getIt.registerSingleton<LocalStorage>(localStorage);

    getIt.registerLazySingleton<ImageUtilityService>(
        () => ImageUtilityServiceImplementation());

    final appHttp = AppHttpImpl(getIt<Dio>(), getIt<LocalStorage>());
    getIt.registerSingleton<AppHttp>(appHttp);

    
  }
}
