import 'dart:math';
import 'package:flutter/widgets.dart';

class ColorProvider extends ChangeNotifier {
  Color backgroundColor; //Add a default color,background is white
  Color circleColor; //Add a default color,circle is white

  void generateColor() {
    Random random = Random();
    int r = 255;
    int g = random.nextInt(205);
    int b = g;
    double o = 1.0;
    backgroundColor = Color.fromRGBO(r, g, b, o);
    circleColor = Color.fromRGBO(r, g + 51, b + 51, o);
    notifyListeners();
  }
}
