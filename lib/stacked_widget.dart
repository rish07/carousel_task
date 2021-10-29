import 'package:flutter/material.dart';

class StackedWidget extends StatelessWidget {
  const StackedWidget({Key? key, required this.widgets, this.overlap = 14.0})
      : super(key: key);
  final List<Widget> widgets;
  final double overlap;

  @override
  Widget build(BuildContext context) {
    List<Widget> stackLayers = List<Widget>.generate(widgets.length, (index) {
      return Padding(
        padding: EdgeInsets.fromLTRB(index.toDouble() * overlap, 0, 0, 0),
        child: widgets[index],
      );
    });

    return Stack(
      children: stackLayers,
      alignment: AlignmentDirectional.centerStart,
    );
  }
}
