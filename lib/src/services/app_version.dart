

@Deprecated("")
class AppVersion {

  final String value;
  AppVersion(this.value);

  List<int> get parts {
    List<int> result = [];
    List<String> split = value.split(".");

    if (split.length != 3)
      throw Exception("Version $value non valide");

    List<String> split2 = split[2].split("+");

    if (split2.length == 1)
      split.add("0");
    else
      split
        ..[2] = split2[0]
        ..add(split2[1]);

    for (int i=0; i<4; ++i)
      result.add(int.parse(split[i]));

    return result;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other is AppVersion && value == other.value); 
  }

  int compare(AppVersion other) {
    List<int> p = parts;
    List<int> q = other.parts;

    for (int i=0; i< 4; ++i) {
      int m = p[i];
      int n = q[i];
      if (m > n)
        return 1;
      else if (m < n)
        return -1;
    }
    return 0;
  }

  bool operator>(AppVersion other) {
    return compare(other) == 1;
  }

  bool operator<(AppVersion other) {
    return compare(other) == -1;
  }

}
