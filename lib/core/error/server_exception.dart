import 'dart:io';

import 'package:flutter/foundation.dart';

class ServerException implements Exception {
  String message = '';
  int? statusCode;

  ServerException({this.message = '', required this.statusCode}) {
    if (statusCode != null) {
      message = _handleResponseError();
    }
  }

  @override
  String toString() => message;

  ServerException.handleError(Object error) {
    _handleException(error);
  }

  void _handleException(dynamic exception) {
    debugPrint(exception.toString());
    if (exception is SocketException) {
      message = 'No internet connection';
    } else if (exception is String) {
      message = exception;
    } else {
      message = 'An unexpected error occurred, retrying...';
    }
  }

  String _handleResponseError() {
    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 404:
        return 'The requested resource was not found';
      case 500:
        return 'Internal server error';
      default:
        return 'Something went wrong';
    }
  }
}
