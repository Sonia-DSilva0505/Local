// ignore_for_file: unused_field, deprecated_member_use

import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../constant/app_text.dart';
import '../constant/storage_key.dart';
import '../error/app_error.dart';
import '../services/local_storage.dart';
import 'log_utility.dart';
import 'type_def.dart';

abstract class AppHttp {
  AppHttpResponse post({
    required String path,
    Object? data,
    Options? options,
    bool withOutToken = false,
    Map<String, dynamic>? queryParameters,
  });

  AppHttpResponse get({
    required String path,
    Object? data,
    Options? options,
    bool withOutToken = false,
    Map<String, dynamic>? queryParameters,
  });

  AppHttpResponse update({
    required String path,
    Object? data,
    Options? options,
    Map<String, dynamic>? queryParameters,
  });

  AppHttpResponse delete({
    required String path,
    Object? data,
    Options? options,
    bool withOutToken = false,
    Map<String, dynamic>? queryParameters,
  });

  AppHttpResponse put({
    required String path,
    Object? data,
    Options? options,
    bool withOutToken = false,
    Map<String, dynamic>? queryParameters,
  });

  AppHttpResponse putFile({
    required String path,
    Object? data,
    Options? options,
    bool withOutToken = false,
    Map<String, dynamic>? queryParameters,
  });
}

class AppHttpImpl extends AppHttp {
  final Dio _dio;
  final LocalStorage _storage;

  AppHttpImpl(this._dio, this._storage);

  @override
  AppHttpResponse delete({
    required String path,
    Object? data,
    Options? options,
    bool withOutToken = false,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      LogUtility.customLog(path, name: "API");

      late final Options? tokenHead;
      if (!withOutToken) {
        tokenHead = await _headerWithToken();

        if (tokenHead == null) {
          return const Left(ErrorMessage(message: Apptext.sessionOut));
        }
      }
      LogUtility.customLog(data, name: "REQUEST BODY");
      final response = await _dio.delete(
        path,
        data: data,
        options: withOutToken ? options : tokenHead!,
        queryParameters: queryParameters,
      );
      LogUtility.customLog(response.statusCode, name: "STATUS-CODE");
      // LogUtility.customLog(response.headers, name: "RESPONSE HEADERS");
      LogUtility.customLog(response.data, name: "RESPONSE BODY");
      return Right(AppResponse.fromDioResponse(response));
    } on DioError catch (dioError) {
      return Left(_dioErroParse(dioError));
    } on SocketException catch (_) {
      return const Left(ErrorResponse.socketException);
    } on FormatException catch (_) {
      return const Left(ErrorResponse.formatException);
    } on TimeoutException catch (_) {
      return const Left(ErrorResponse.timeOutException);
    }
  }

  @override
  AppHttpResponse get(
      {required String path,
      Object? data,
      Options? options,
      bool withOutToken = false,
      Map<String, dynamic>? queryParameters}) async {
    try {
      LogUtility.customLog(path, name: "API");

      late final Options? tokenHead;
      if (!withOutToken) {
        tokenHead = await _headerWithToken();
        // LogUtility.customLog(tokenHead, name: "REQUEST HEADERS");

        if (tokenHead == null) {
          return const Left(ErrorMessage(message: Apptext.sessionOut));
        }
      }
      LogUtility.customLog(data, name: "REQUEST BODY");

      final response = await _dio.get(
        path,
        data: data,
        options: withOutToken ? options : tokenHead!,
        queryParameters: queryParameters,
      );
      LogUtility.customLog(response.statusCode, name: "STATUS-CODE");
      // LogUtility.customLog(response.headers, name: "RESPONSE HEADERS");
      LogUtility.customLog(response.data, name: "RESPONSE BODY");
      return Right(AppResponse.fromDioResponse(response));
    } on DioError catch (dioError) {
      return Left(_dioErroParse(dioError));
    } on SocketException catch (_) {
      return const Left(ErrorResponse.socketException);
    } on FormatException catch (_) {
      return const Left(ErrorResponse.formatException);
    } on TimeoutException catch (_) {
      return const Left(ErrorResponse.timeOutException);
    }
  }

  @override
  AppHttpResponse post(
      {required String path,
      Object? data,
      Options? options,
      bool withOutToken = false,
      Map<String, dynamic>? queryParameters}) async {
    try {
      LogUtility.customLog(path, name: "API");
      late final Options? tokenHead;
      if (!withOutToken) {
        tokenHead = await _headerWithToken();
        // LogUtility.customLog(tokenHead, name: "REQUEST HEADERS");
        if (tokenHead == null) {
          return const Left(ErrorMessage(message: Apptext.sessionOut));
        }
      }
      LogUtility.customLog(data, name: "REQUEST BODY");
      final response = await _dio.post(
        path,
        data: data,
        options: withOutToken ? options : tokenHead,
        queryParameters: queryParameters,
      );
      LogUtility.customLog(response.statusCode, name: "STATUS-CODE");
      // LogUtility.customLog(response.headers, name: "RESPONSE HEADERS");
      LogUtility.customLog(response.data, name: "RESPONSE BODY");
      return Right(AppResponse.fromDioResponse(response));
    } on DioError catch (dioError) {
      return Left(_dioErroParse(dioError));
    } on SocketException catch (_) {
      return const Left(ErrorResponse.socketException);
    } on FormatException catch (_) {
      return const Left(ErrorResponse.formatException);
    } on TimeoutException catch (_) {
      return const Left(ErrorResponse.timeOutException);
    }
  }

  @override
  AppHttpResponse update(
      {required String path,
      Object? data,
      Options? options,
      bool defaultHeader = false,
      Map<String, dynamic>? queryParameters}) async {
    try {
      LogUtility.customLog(path, name: "API");

      late final Options? tokenHead;
      if (!defaultHeader) {
        tokenHead = await _headerWithToken();
        // LogUtility.customLog(tokenHead, name: "REQUEST HEADERS");

        if (tokenHead == null) {
          return const Left(ErrorMessage(message: Apptext.sessionOut));
        }
      }
      LogUtility.customLog(data, name: "REQUEST BODY");
      final response = await _dio.put(
        path,
        data: data,
        options: defaultHeader ? options : tokenHead,
        queryParameters: queryParameters,
      );
      LogUtility.customLog(response.statusCode, name: "STATUS-CODE");
      // LogUtility.customLog(response.headers, name: "RESPONSE HEADERS");
      LogUtility.customLog(response.data, name: "RESPONSE BODY");
      return Right(AppResponse.fromDioResponse(response));
    } on DioError catch (dioError) {
      return Left(_dioErroParse(dioError));
    } on SocketException catch (_) {
      return const Left(ErrorResponse.socketException);
    } on FormatException catch (_) {
      return const Left(ErrorResponse.formatException);
    } on TimeoutException catch (_) {
      return const Left(ErrorResponse.timeOutException);
    }
  }

  @override
  AppHttpResponse put(
      {required String path,
      Object? data,
      Options? options,
      bool withOutToken = false,
      Map<String, dynamic>? queryParameters}) async {
    try {
      LogUtility.customLog(path, name: "API");

      late final Options? tokenHead;
      if (!withOutToken) {
        tokenHead = await _headerWithToken();
        // LogUtility.customLog(tokenHead, name: "REQUEST HEADERS");

        if (tokenHead == null) {
          return const Left(ErrorMessage(message: Apptext.sessionOut));
        }
      }
      LogUtility.customLog(data, name: "REQUEST BODY");
      final response = await _dio.put(
        path,
        data: data,
        options: withOutToken ? options : tokenHead,
        queryParameters: queryParameters,
      );
      LogUtility.customLog(response.statusCode, name: "STATUS-CODE");
      // LogUtility.customLog(response.headers, name: "RESPONSE HEADERS");
      LogUtility.customLog(response.data, name: "RESPONSE BODY");
      return Right(AppResponse.fromDioResponse(response));
    } on DioError catch (dioError) {
      return Left(_dioErroParse(dioError));
    } on SocketException catch (_) {
      return const Left(ErrorResponse.socketException);
    } on FormatException catch (_) {
      return const Left(ErrorResponse.formatException);
    } on TimeoutException catch (_) {
      return const Left(ErrorResponse.timeOutException);
    }
  }

  Future<Options?> _headerWithToken() async {
    final token = await _storage.read(StorageKey.token);
    if (token != null) {
      LogUtility.customLog(token.toString());
      return Options(
        headers: {
          'Cookie': token,
          'Content-Type': 'application/json',
        },
      );
    }
    return null;
  }

  @override
  AppHttpResponse putFile(
      {required String path,
      Object? data,
      Options? options,
      bool withOutToken = false,
      Map<String, dynamic>? queryParameters}) async {
    try {
      LogUtility.customLog(path, name: "API");

      late final Options? tokenHead;
      if (!withOutToken) {
        tokenHead = await _headerWithToken();
        // LogUtility.customLog(tokenHead, name: "REQUEST HEADERS");

        if (tokenHead == null) {
          return const Left(ErrorMessage(message: Apptext.sessionOut));
        }
      }
      LogUtility.customLog(data, name: "REQUEST BODY");
      final response = await _dio.post(
        path,
        data: data,
        options: withOutToken ? options : tokenHead,
        queryParameters: queryParameters,
      );
      LogUtility.customLog(response.statusCode, name: "STATUS-CODE");
      // LogUtility.customLog(response.headers, name: "RESPONSE HEADERS");
      LogUtility.customLog(response.data, name: "RESPONSE BODY");
      return Right(AppResponse.fromDioResponse(response));
    } on DioError catch (dioError) {
      return Left(_dioErroParse(dioError));
    } on SocketException catch (_) {
      return const Left(ErrorResponse.socketException);
    } on FormatException catch (_) {
      return const Left(ErrorResponse.formatException);
    } on TimeoutException catch (_) {
      return const Left(ErrorResponse.timeOutException);
    }
  }

  AppError _dioErroParse(DioError dioError) {
    if (dioError.response != null) {
      final data = dioError.response!.data;
      final statusCode = dioError.response!.statusCode;
      final statusMessage = dioError.response!.statusMessage;
      LogUtility.error("START Dio Error=================>");
      LogUtility.error(data.toString());
      LogUtility.error(dioError.type.name.toString());
      LogUtility.error(dioError.error.toString());
      LogUtility.error(dioError.message?.toLowerCase() ?? 'Dio Message NULL');
      LogUtility.error(statusCode.toString());
      LogUtility.error(statusMessage.toString());
      LogUtility.error("Header -> ");
      LogUtility.error(dioError.requestOptions.path.toString());
      LogUtility.error("END Dio Error =================>");

      if (statusCode != null && statusCode >= 400 && statusCode < 500) {
        return ErrorMessage(
          message: data['message'] ??
              data['error'] ??
              statusMessage ??
              Apptext.somethingWentWrong,
        );
      }
      if (statusCode != null && statusCode >= 500) {
        return const ErrorMessage(message: Apptext.serverDown);
      }
      return ErrorMessage(
        message: data['message'] ?? statusMessage ?? Apptext.somethingWentWrong,
      );
    } else {
      return ErrorMessage(message: dioError.message ?? Apptext.serverDown);
    }
  }
}

class AppResponse {
  dynamic data;
  int? statusCode;
  String? statusMessage;
  Headers headers;

  AppResponse({
    this.data,
    this.statusCode,
    this.statusMessage,
    required this.headers,
  });

  factory AppResponse.fromDioResponse(Response response) {
    return AppResponse(
      data: response.data,
      statusCode: response.statusCode,
      statusMessage: response.statusMessage,
      headers: response.headers,
    );
  }
}
