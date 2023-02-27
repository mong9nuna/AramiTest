import 'package:arami/common/const/colors.dart';
import 'package:arami/common/const/size.dart';
import 'package:flutter/material.dart';

class CustomTab extends StatelessWidget {
  final int length;
  final TextStyle labelStyle;
  final TextStyle unselectedLabelStyle;
  final List<Widget> tabs;
  final List<Widget> tabView;
  final int initialIndex;

  const CustomTab({
    required this.length,
    required this.labelStyle,
    required this.unselectedLabelStyle,
    required this.tabs,
    required this.tabView,
    required this.initialIndex,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: initialIndex,
      length: length,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: OUTLINE,
                ),
              ),
            ),
            height: 50.0 * getScaleWidth(context),
            child: TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width: 2, color: MAIN_COLOR),
              ),
              labelColor: MAIN_COLOR,
              unselectedLabelColor: GRAY020,
              labelStyle: labelStyle,
              unselectedLabelStyle: unselectedLabelStyle,
              tabs: tabs,
            ),
          ),
          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              children: tabView,
            ),
          ),
        ],
      ),
    );
  }
}
