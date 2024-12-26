import 'package:prokoders_test/core/dio/error_handler.dart';

abstract class DataState<T> {
  final T? data;
  final ExceptionResponse? exceptionResponse;

  const DataState({this.data, this.exceptionResponse});
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(ExceptionResponse error) : super(exceptionResponse: error);
}
