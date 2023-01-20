
class HttpErrorData {

  final String code;
  final Map<String, dynamic>? data;

  HttpErrorData(this.code, this.data);

  factory HttpErrorData.fromJson(Map<String, dynamic> data) {
    return HttpErrorData(data['code'], data['data']);
  }

  @override
  String toString() {
    return "HttpErrorData: code: $code, data $data";
  }

}
