
extension NumberExtension on num {

}

extension IntExtension on int {

  // Optimiser: implementer sans convertir en string
  String thousandFormatter([String separator = " "]) {
    String digits = this.toString();
    StringBuffer sb = StringBuffer();
    int start = digits.length % 3;

    if (start != 0)
      sb.write(digits.substring(0, start));

    for (; start < digits.length; start += 3) {
      if (start != 0)
        sb.write(separator);
      sb.write(digits.substring(start, start + 3));
    }

    return sb.toString();
  }

}
