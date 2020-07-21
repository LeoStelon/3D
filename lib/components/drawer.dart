import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:three_d/providers/color.dart';

class DrawerComponent extends StatefulWidget {
  @override
  _DrawerComponentState createState() => _DrawerComponentState();
}

class _DrawerComponentState extends State<DrawerComponent> {
  bool _visibility = false;

  @override
  Widget build(BuildContext context) {
    return Visibility(
        maintainState: false,
        visible: _visibility,
        replacement: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    this._visibility = !this._visibility;
                  });
                },
                child: Text(
                  'Pull',
                  style: TextStyle(
                    color: Color(0xffff0cb4),
                    decoration: TextDecoration.none,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
        ),
        child: Consumer<ColorProvider>(
          builder: (context, colorProvider, _) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x0f000000),
                            spreadRadius: 8,
                            blurRadius: 1,
                          )
                        ],
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                        color: colorProvider.generatedColor,
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
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          this._visibility = !this._visibility;
                        });
                      },
                      child: Text(
                        'Push',
                        style: TextStyle(
                          color: Color(0xffff0cb4),
                          decoration: TextDecoration.none,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ));
  }
}
