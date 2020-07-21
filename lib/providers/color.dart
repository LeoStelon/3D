import 'dart:math';
import 'package:flutter/widgets.dart';

class ColorProvider extends ChangeNotifier {
  Color generatedColor;

  void generateColor() {
    Random random = Random();
    int r = 255;
    int g = random.nextInt(256);
    int b = random.nextInt(256);
    double o = 1.0;
    generatedColor = Color.fromRGBO(r, g, b, o);
    notifyListeners();
  }
}
