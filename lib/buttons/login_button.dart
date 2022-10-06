import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  CustomElevatedButton({
    required this.child,
    required this.color,
    required this.borderRadius,
    required this.onPressed,
});
  final Widget child;
  final Color color;
  final double borderRadius;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () {print("object");},

        child: );
  }
}
