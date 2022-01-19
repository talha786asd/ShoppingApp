import 'package:flutter/material.dart';
import 'package:shopping_app/widgets/text_widget.dart';

class BadgeWidget extends StatelessWidget {
  BadgeWidget({Key? key, required this.child, this.color, required this.value})
      : super(key: key);
  final Widget child;
  final String value;
  Color? color;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
            right: 8,
            top: 8,
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              constraints: BoxConstraints(minWidth: 16, minHeight: 16),
              child: TextWidget(
                color: Colors.black,
                fontSize: 12,
                text: value,
                align: TextAlign.center,
              ),
            ))
      ],
    );
  }
}
