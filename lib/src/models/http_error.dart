import 'dart:convert' show json, utf8;
import 'dart:typed_data' show Uint8List;

import 'http_error_data.dart';

class HttpError implements Exception {

  final int statusCode;
  final String? message;
  final HttpErrorData? data;

  HttpError(this.statusCode, [this.message, this.data]);

  factory HttpError.parse(int statusCode, String data) {
    try {
      return HttpError(statusCode, null, HttpErrorData.fromJson(json.decode(data)));
    } catch(_) {
      return HttpError(statusCode, data);
    }
  }

  factory HttpError.parseBytes(int statusCode, Uint8List data) {
    var value = utf8.decode(data);
    try {
      return HttpError(statusCode, null, HttpErrorData.fromJson(json.decode(value)));
    } catch(_) {
      return HttpError(statusCode, value);
    }
  }

  @override
  String toString() {
    return "HttpError: code: $statusCode, message: $message, data: $data";
  }

}
