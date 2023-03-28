import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileView;
  final Widget desktopView;

  static const int mobileWidth = 375;

  const ResponsiveLayout(
      {super.key, required this.mobileView, required this.desktopView});

  @override
  Widget build(BuildContext context) =>
      LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth < mobileWidth) {
          return mobileView;
        } else {
          return desktopView;
        }
      });
}
