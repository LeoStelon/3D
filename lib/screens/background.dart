import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/color.dart';

class BackgroundScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Consumer<ColorProvider>(
        builder: (_, colorProvider, __) {
          return GestureDetector(
            onHorizontalDragEnd: (DragEndDetails dragEndDetails) {
              if (dragEndDetails.primaryVelocity >= 1000 ||
                  dragEndDetails.primaryVelocity <= -1000) {
                print(colorProvider.backgroundColor);
                colorProvider.generateColor();
              }
            },
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: colorProvider.backgroundColor,
              ),
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: colorProvider.circleColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
