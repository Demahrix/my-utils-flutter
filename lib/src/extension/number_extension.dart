
extension NumberExtension on num {

}

extension IntExtension on int {

  // Optimiser: implementer sans convertir en string
  String thousandFormatter([String separator = " "]) {
    String digits = this.toString();
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

extension DoubleExtension on double {

  String thousandFormatter({String separator = " ", bool includeFloatPart = true}) {
    String str = this.toStringAsFixed(2);

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
    return includeFloatPart ? result + "," + str.substring(length + 1) : result;
  }

}

main(List<String> args) {
  print(2000000.5.thousandFormatter());
}

