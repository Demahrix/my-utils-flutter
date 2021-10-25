import 'package:flutter/material.dart';

class CircleAvatarLetters extends StatelessWidget {

  static const List<Color> _colors = [
    Colors.orange,
    Colors.amberAccent,
    Colors.blue,
    Colors.green,
    Colors.indigo,
    Colors.brown,
    Colors.blueGrey,
    Colors.purple,
    Colors.red,
    Colors.lime
  ];

  final String name;
  final double radius;
  final bool transparent;

  const CircleAvatarLetters(
    this.name, {
      this.radius = 20.0,
      this.transparent: false
    }
  );

  @override
  Widget build(BuildContext context) {

    final String letters = _getInitialLetter(name).toUpperCase();

    final color = _getColor(letters);

    return CircleAvatar(
      backgroundColor: transparent ? color.withOpacity(0.25) : color,
      radius: radius,
      child: Text(
        letters,
        style: TextStyle(
          // fontWeight: FontWeight.bold,
          fontSize: radius / 1.5,
          color: transparent ? color : Colors.white
        ),
      ),
    );
  }

  static String _getInitialLetter(String name) {
    if (name.length == 1)
      return name[0];
    List<String> parts = name.split(" ");
    if (parts.length == 1)
      return name.substring(0, 2);
    else
      return parts[0][0] + parts[1][0];
  }

  static Color _getColor(String letters) {
    int result = 0;
    for (int i=0, len=letters.length; i<len; ++i) {
      result += (i + 1) * letters.codeUnitAt(i);
    }
    return _colors[result % _colors.length];
  }

}
