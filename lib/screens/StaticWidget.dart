import 'package:flutter/widgets.dart';

class StaticWidget extends StatefulWidget {
  @override
  _StaticWidgetState createState() => _StaticWidgetState();
}

class _StaticWidgetState extends State<StaticWidget> {
  @override
  void initState() {
    super.initState();
    print('init');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('OK'),
    );
  }
}
