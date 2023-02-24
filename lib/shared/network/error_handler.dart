import 'package:dio/dio.dart';
import '../../models/failure/failure_model.dart';
import '../resources/strings_manager.dart';

class ErrorHandler implements Exception {
  late FailureModel failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioError) {
      // dio error so its an error from response of the API or from dio itself
      failure = handleError(error);
    } else {
      // default error
      failure = DataSource.DEFAULT.getFailure();
    }
  }
}

FailureModel handleError(DioError error) {
  switch (error.type) {
    case DioErrorType.connectionError:
      return DataSource.NO_INTERNET_CONNECTION.getFailure();
    case DioErrorType.connectionTimeout:
      return DataSource.CONNECT_TIMEOUT.getFailure();
    case DioErrorType.sendTimeout:
      return DataSource.SEND_TIMEOUT.getFailure();
    case DioErrorType.receiveTimeout:
      return DataSource.RECIEVE_TIMEOUT.getFailure();
    case DioErrorType.cancel:
      return DataSource.CANCEL.getFailure();
    case DioErrorType.unknown:
      return DataSource.DEFAULT.getFailure();

    default:
      return DataSource.DEFAULT.getFailure();
  }
}

enum DataSource {
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTORISED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECIEVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  VALIDATION,
  TO_MANY_REQUEST,
  DEFAULT
}

extension DataSourceExtension on DataSource {
  FailureModel getFailure() {
    switch (this) {
      case DataSource.SUCCESS:
        return FailureModel(
            code: ResponseCode.SUCCESS,
            error: ResponseMessage.SUCCESS,
            success: true);
      case DataSource.NO_CONTENT:
        return FailureModel(
            code: ResponseCode.NO_CONTENT,
            error: ResponseMessage.NO_CONTENT,
            success: false);
      case DataSource.BAD_REQUEST:
        return FailureModel(
            code: ResponseCode.BAD_REQUEST,
            error: ResponseMessage.BAD_REQUEST,
            success: false);
      case DataSource.FORBIDDEN:
        return FailureModel(
            code: ResponseCode.FORBIDDEN,
            error: ResponseMessage.FORBIDDEN,
            success: false);
      case DataSource.UNAUTORISED:
        return FailureModel(
            code: ResponseCode.UNAUTORISED,
            error: ResponseMessage.UNAUTHORISED,
            success: false);
      case DataSource.NOT_FOUND:
        return FailureModel(
            code: ResponseCode.NOT_FOUND,
            error: ResponseMessage.NOT_FOUND,
            success: false);
      case DataSource.INTERNAL_SERVER_ERROR:
        return FailureModel(
            code: ResponseCode.INTERNAL_SERVER_ERROR,
            error: ResponseMessage.INTERNAL_SERVER_ERROR,
            success: false);

      case DataSource.CONNECT_TIMEOUT:
        return FailureModel(
            code: ResponseCode.CONNECT_TIMEOUT,
            error: ResponseMessage.CONNECT_TIMEOUT,
            success: false);
      case DataSource.CANCEL:
        return FailureModel(
            code: ResponseCode.CANCEL,
            error: ResponseMessage.CANCEL,
            success: false);
      case DataSource.RECIEVE_TIMEOUT:
        return FailureModel(
            code: ResponseCode.RECIEVE_TIMEOUT,
            error: ResponseMessage.RECIEVE_TIMEOUT,
            success: false);
      case DataSource.SEND_TIMEOUT:
        return FailureModel(
            code: ResponseCode.SEND_TIMEOUT,
            error: ResponseMessage.SEND_TIMEOUT,
            success: false);
      case DataSource.CACHE_ERROR:
        return FailureModel(
            code: ResponseCode.CACHE_ERROR,
            error: ResponseMessage.CACHE_ERROR,
            success: false);
      case DataSource.NO_INTERNET_CONNECTION:
        return FailureModel(
            code: ResponseCode.NO_INTERNET_CONNECTION,
            error: ResponseMessage.NO_INTERNET_CONNECTION,
            success: false);
      case DataSource.TO_MANY_REQUEST:
        return FailureModel(
            code: ResponseCode.TO_MANY_REQUEST,
            error: ResponseMessage.TO_MANY_REQUEST,
            success: false);
      case DataSource.VALIDATION:
        return FailureModel(
            code: ResponseCode.VALIDATION,
            error: ResponseMessage.VALIDATION,
            success: false);
      case DataSource.DEFAULT:
        return FailureModel(
            code: ResponseCode.DEFAULT,
            error: ResponseMessage.DEFAULT,
            success: false);
    }
  }
}

class ResponseCode {
  static const int SUCCESS = 200; // success with data
  static const int NO_CONTENT = 201; // success with no data (no content)
  static const int BAD_REQUEST = 400; // failure, API rejected request
  static const int UNAUTORISED = 401; // failure, user is not authorised
  static const int FORBIDDEN = 403; //  failure, API rejected request
  static const int INTERNAL_SERVER_ERROR = 500; // failure, crash in server side
  static const int NOT_FOUND = 404; // failure, not found
  static const int VALIDATION = 422; //validation
  static const int TO_MANY_REQUEST = 429;

  ///to many request
  // local status code
  static const int CONNECT_TIMEOUT = -1;
  static const int CANCEL = -2;
  static const int RECIEVE_TIMEOUT = -3;
  static const int SEND_TIMEOUT = -4;
  static const int CACHE_ERROR = -5;
  static const int NO_INTERNET_CONNECTION = -6;
  static const int DEFAULT = -7;
}

class ResponseMessage {
  static const String SUCCESS = AppStrings.success; // success with data
  static const String NO_CONTENT =
      AppStrings.success; // success with no data (no content)
  static const String BAD_REQUEST =
      AppStrings.badRequestError; // failure, API rejected request
  static const String UNAUTHORISED =
      AppStrings.unauthorizedError; // failure, user is not authorised
  static const String FORBIDDEN =
      AppStrings.forbiddenError; //  failure, API rejected request
  static const String INTERNAL_SERVER_ERROR =
      AppStrings.internalServerError; // failure, crash in server side
  static const String NOT_FOUND =
      AppStrings.notFoundError; // failure, crash in server side

  // local status code
  static const String CONNECT_TIMEOUT = AppStrings.timeoutError;
  static const String CANCEL = AppStrings.defaultError;
  static const String RECIEVE_TIMEOUT = AppStrings.timeoutError;
  static const String SEND_TIMEOUT = AppStrings.timeoutError;
  static const String CACHE_ERROR = AppStrings.cacheError;
  static const String NO_INTERNET_CONNECTION = AppStrings.noInternetError;
  static const String TO_MANY_REQUEST = AppStrings.toManyRequest;
  static const String VALIDATION = AppStrings.validation;
  static const String DEFAULT = AppStrings.defaultError;
}
