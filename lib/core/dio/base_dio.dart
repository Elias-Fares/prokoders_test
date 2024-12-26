import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:prokoders_test/core/constants/constant.dart';
import 'package:prokoders_test/core/dio/data_state.dart';
import 'package:prokoders_test/core/dio/error_handler.dart';
import 'package:prokoders_test/core/models/general_model.dart';

class BaseDio {
  final Dio dioProject;
  BaseDio({required this.dioProject});

  Future<DataState> get<T extends GeneralModel>({
    required String subUrl,
    String? token,
    String? url,
    bool needToken = false,
    required T model,
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    // if (needToken) {
    //   dioProject.options.headers["Authorization"] =
    //       "Bearer ${token ?? LocalStaticVar.token}";
    // }

    try {
      if (kDebugMode) {
        print("${url ?? Constant.baseUrl}$subUrl");
        print("************************************");
        print(queryParameters);
        print("************************************");
        print(data);
      }
      final response = await dioProject.get("${url ?? Constant.baseUrl}$subUrl",
          queryParameters: queryParameters, data: data);

      final responseObject = model.fromJson({"items": response.data});

      if (kDebugMode) {
        print("the reponse modeled");
      }
      return DataSuccess(responseObject);
    } on DioException catch (e) {
      if (kDebugMode) {
        print("******************* Exception occured *****************");
        print(e.stackTrace);
        print(e.message);
      }
      final ExceptionResponse exceptionResponse = getExceptionResponse(e);
      if (kDebugMode) {
        print("******************* the message extracted *****************");
        print(exceptionResponse.exceptionMessages);
      }
      return DataFailed<ExceptionResponse>(exceptionResponse);
    } catch (e, stacktrace) {
      if (kDebugMode) {
        print(e);
      }
      if (kDebugMode) {
        print('Stacktrace: $stacktrace');
      }
      final ExceptionResponse exceptionResponse = ExceptionResponse(
          statusCode: -888,
          exceptionMessages: ["Another exception was thrown"]);
      return DataFailed<ExceptionResponse>(exceptionResponse);
    }
  }


}
