import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:three_d/providers/color.dart';

class DrawerComponent extends StatefulWidget {
  @override
  _DrawerComponentState createState() => _DrawerComponentState();
}

class _DrawerComponentState extends State<DrawerComponent>
    with SingleTickerProviderStateMixin {
  bool _visibility = false;
  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _animationController.addListener(() {
      setState(() {});
    });
    _animation = Tween(begin: 0, end: pi / 2).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
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
                AnimatedContainer(
                  duration: Duration(milliseconds: 100),
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
                  width: _visibility ? 100 : 0,
                  child: Visibility(
                    visible: _visibility,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Icon(Icons.home),
                        Icon(Icons.person),
                        Icon(Icons.explore),
                        Icon(Icons.search),
                        Icon(Icons.settings),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      this._visibility = !this._visibility;
                      if (_visibility) {
                        _animationController.forward();
                      } else {
                        _animationController.reverse();
                      }
                    });
                  },
                  child: _visibility
                      ? Icon(Icons.arrow_back_ios)
                      : Icon(
                          Icons.arrow_forward_ios,
                          color: Color.fromRGBO(0, 0, 0, 0.5),
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
