
String _add0(int n) => n < 10 ? "0" + n.toString() : n.toString();

extension DateTimeExtension on DateTime {

  String formatJJMMAAAA() {
    return "${_add0(day)}/${_add0(month)}/$year";
  }

}
