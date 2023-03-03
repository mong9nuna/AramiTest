import 'package:arami/common/component/custom_tab.dart';
import 'package:arami/common/const/colors.dart';
import 'package:arami/common/const/fonts.dart';
import 'package:arami/common/const/size.dart';
import 'package:arami/common/layout/default_layout.dart';
import 'package:arami/home/view/noti_screen.dart';
import 'package:arami/home/view/point_screen.dart';
import 'package:flutter/material.dart';

class NotiMainScreen extends StatefulWidget {
  final int initialIndex;

  const NotiMainScreen({
    required this.initialIndex,
    Key? key,}) : super(key: key);

  @override
  State<NotiMainScreen> createState() => _NotiMainScreenState();
}

class _NotiMainScreenState extends State<NotiMainScreen> {
  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = [
      Tab(
        height: 50.0 * getScaleWidth_Max(context),
        child: Container(
          width: 132.0 * getScaleWidth(context),
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(
              //top: 8.0 * getScaleWidth(context),
              bottom: 8.0 * getScaleWidth(context),
            ),
            child: const Text(
              '활동 알림',
            ),
          ),
        ),
      ),
      Tab(
        height: 50.0 * getScaleWidth_Max(context),
        child: Container(
          width: 132.0 * getScaleWidth(context),
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(
              //top: 8.0 * getScaleWidth(context),
              bottom: 8.0 * getScaleWidth(context),
            ),
            child: const Text(
              '포인트 알림',
            ),
          ),
        ),
      ),
    ];

    List<Widget> tabView = [
      Container(
        child: NotiScreen(),
      ),
      Container(
        child: PointScreen(),
      ),
    ];
    return DefaultLayout(
      appTitle: '알림',
      appbarPointView: false,
      appbarType: true,
      logoType: false,
      elevations: 0,
      child: CustomTab(
        initialIndex: widget.initialIndex,
        length: tabs.length,
        labelStyle: BODY3_BOLD.copyWith(
          fontSize: 16.0 * getScaleWidth(context),
        ),
        unselectedLabelStyle: BODY3_BOLD.copyWith(
          fontSize: 16.0 * getScaleWidth(context),
          color: GRAY020,
        ),
        tabs: tabs,
        tabView: tabView,
      ),
    );
  }
}
