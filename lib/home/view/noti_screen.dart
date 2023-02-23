import 'package:arami/common/const/colors.dart';
import 'package:arami/common/const/fonts.dart';
import 'package:arami/common/const/size.dart';
import 'package:arami/common/layout/default_layout.dart';
import 'package:flutter/material.dart';

class NotiScreen extends StatefulWidget {
  const NotiScreen({Key? key}) : super(key: key);

  @override
  State<NotiScreen> createState() => _NotiScreenState();
}

class _NotiScreenState extends State<NotiScreen> {
  @override
  Widget build(BuildContext context) {
    List<Widget> _views = [
      Tab(
        child: Container(
          width: 132.0 * getScaleWidth(context),
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.only(
              top: 16.0 * getScaleWidth(context),
              bottom: 8.0 * getScaleWidth(context),
            ),
            child: const Text(
              '활동 알림',
            ),
          ),
        ),
      ),
      Tab(
        child: Container(
          width: 132.0 * getScaleWidth(context),
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.only(
              top: 16.0 * getScaleWidth(context),
              bottom: 8.0 * getScaleWidth(context),
            ),
            child: const Text(
              '포인트 알림',
            ),
          ),
        ),
      ),
    ];
    return DefaultTabController(
      length: 2,
      child: DefaultLayout(
        elevations: 0,
        appbarPointView: false,
        appbarType: true,
        appTitle: '알림',
        logoType: false,
        child: Column(
          children: [
            Container(
              height: 50.0 * getScaleWidth(context),
              child: TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(width: 2, color: MAIN_COLOR),
                ),
                labelColor: MAIN_COLOR,
                unselectedLabelColor: GRAY020,
                labelStyle: BODY3_BOLD.copyWith(
                  fontSize: 16.0 * getScaleWidth(context),
                ),
                unselectedLabelStyle: BODY3_BOLD.copyWith(
                  fontSize: 16.0 * getScaleWidth(context),
                  color: GRAY020,
                ),
                tabs: _views,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
