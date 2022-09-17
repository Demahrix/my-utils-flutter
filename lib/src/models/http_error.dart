import 'dart:convert';
import 'package:my_utils/src/models/http_error_data.dart';

class HttpError implements Exception {

  final int statusCode;
  final String? message;
  final HttpErrorData? data;

  HttpError(this.statusCode, [this.message, this.data]);

  factory HttpError.parse(int statusCode, String data) {
    try {
      return HttpError(statusCode, null, json.decode(data));
    } catch(_) {
      return HttpError(statusCode, data);
    }
  }

  @override
  String toString() {
    return "HttpError: code: $statusCode, message: $message, data: $data";
  }

}
