import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:three_d/providers/color.dart';

class DrawerComponent extends StatefulWidget {
  @override
  _DrawerComponentState createState() => _DrawerComponentState();
}

class _DrawerComponentState extends State<DrawerComponent>
    with TickerProviderStateMixin {
  bool _visibility = false;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
      animationBehavior: AnimationBehavior.preserve,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorProvider>(
      builder: (context, colorProvider, _) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Visibility(
                  maintainState: false,
                  visible: _visibility,
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.16),
                          spreadRadius: 6,
                          blurRadius: 3,
                        )
                      ],
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      color: colorProvider.backgroundColor,
                    ),
                    alignment: Alignment.centerLeft,
                    height: 400,
                    width: 100,
                    child: Center(
                      child: Text(
                        'Drawer',
                        style: TextStyle(
                          color: Color(0xffff0cb4),
                          decoration: TextDecoration.none,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      this._visibility = !this._visibility;
                    });
                  },
                  child: TweenAnimationBuilder(
                    tween: Tween(begin: 0, end: pi),
                    duration: Duration(seconds: 1),
                    builder: (context, dynamic, child) {
                      return Text(
                        _visibility ? 'Push' : 'Pull',
                        style: TextStyle(
                          color: Color(0xffff0cb4),
                          decoration: TextDecoration.none,
                          fontSize: 14,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
