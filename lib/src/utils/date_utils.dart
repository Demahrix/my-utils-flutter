
String _add0(int n) => n < 10 ? "0" + n.toString() : n.toString();


enum DateUtilsFormat {
  /// exemple: 12/12/2012
  short,
  /// exemple: Samedi, 12 juin 2021
  long

}


class DateUtils {

  static final List<String> _days = ["Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi", "Dimanche"];
  static final List<String> _months = ["Janiver", "Février", "Mars", "Avril", "Mai", "Juin", "Juillet", "Aout", "Septembre", "Octobre", "Novembre", "Décembre"];

  static String format(DateTime d, [DateUtilsFormat f = DateUtilsFormat.short]) {
    switch(f) {
      case DateUtilsFormat.short:
        return _formatShort(d);
      case DateUtilsFormat.long:
        _formatLong(d);
        break;
    }
    return _formatShort(d);
  }

  static String _formatShort(DateTime d) {
    return "${_add0(d.day)}/${_add0(d.month)}/${d.year}";
  }

  static String _formatLong(DateTime d) {
    return "${_days[d.weekday - 1]}, ${_add0(d.day)} ${_months[d.month - 1]} ${d.year}";
  }

}
