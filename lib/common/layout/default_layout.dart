import 'package:arami/common/const/colors.dart';
import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {
  final Color? backgroundColor;
  final Widget child;

  const DefaultLayout({
    this.backgroundColor,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? WHITE,
      body: child,
    );
  }
}
