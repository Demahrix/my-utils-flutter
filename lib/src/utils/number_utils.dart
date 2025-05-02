
class IntUtils {

  IntUtils._();

  static String thousandFormatter(int n, [String separator = " "]) {
    String digits = n.toString();
    StringBuffer sb = StringBuffer();
    int length = digits.length;
    int start = length % 3;

    if (start != 0)
      sb.write(digits.substring(0, start));

    for (; start < length; start += 3) {
      if (start != 0)
        sb.write(separator);
      sb.write(digits.substring(start, start + 3));
    }

    return sb.toString();
  }

}

class DoubleUtils {

  DoubleUtils._();

  static String thousandFormatter(double n, {String separator = " ", bool includeFloatPart = true}) {
    String str = n.toStringAsFixed(2);

    String digits = str.substring(0, str.length - 3);
    StringBuffer sb = StringBuffer();
    int length = digits.length;
    int start = length % 3;

    if (start != 0)
      sb.write(digits.substring(0, start));

    for (; start < length; start += 3) {
      if (start != 0)
        sb.write(separator);
      sb.write(digits.substring(start, start + 3));
    }

    String result = sb.toString();
    // on faire +1 car on rempalce le '.' par le ','
    return includeFloatPart ? '$result,${str.substring(length + 1)}' : result;
  }

}
