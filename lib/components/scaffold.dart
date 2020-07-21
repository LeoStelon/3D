import 'package:flutter/widgets.dart';
import 'package:three_d/components/drawer.dart';
import 'package:three_d/screens/background.dart';

class ScaffoldComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundScreen(),
        DrawerComponent(),
      ],
    );
  }
}
