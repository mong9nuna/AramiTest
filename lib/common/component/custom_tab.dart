import 'package:arami/common/const/colors.dart';
import 'package:arami/common/const/size.dart';
import 'package:arami/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomTab extends StatefulWidget {
  final int length;
  final TextStyle labelStyle;
  final TextStyle unselectedLabelStyle;
  final List<Widget> tabs;
  final List<Widget> tabView;
  final int initialIndex;

  CustomTab({
    required this.length,
    required this.labelStyle,
    required this.unselectedLabelStyle,
    required this.tabs,
    required this.tabView,
    required this.initialIndex,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomTab> createState() => _CustomTabState();
}

class _CustomTabState extends State<CustomTab> {
  late HomeProvider _homeProvider;
  // 드롭다운 해제.
  void _removeOverlay() {
    setState(
      () {
        if (_homeProvider.overlayEntry != null) {
          _homeProvider.overlayEntry?.remove();
          _homeProvider.overlayEntry = null;
          _homeProvider.iconFlag = true;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    _homeProvider = Provider.of<HomeProvider>(context);
    return DefaultTabController(
      initialIndex: widget.initialIndex,
      length: widget.length,
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
              onTap: (value) {
                setState(() {
                    _removeOverlay();
                });
              },
              indicatorSize: TabBarIndicatorSize.label,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width: 2, color: MAIN_COLOR),
              ),
              labelColor: MAIN_COLOR,
              unselectedLabelColor: GRAY020,
              labelStyle: widget.labelStyle,
              unselectedLabelStyle: widget.unselectedLabelStyle,
              tabs: widget.tabs,
            ),
          ),
          Expanded(
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              children: widget.tabView,
            ),
          ),
        ],
      ),
    );
  }
}
