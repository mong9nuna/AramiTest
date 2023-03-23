import 'package:arami/common/component/custom_tab.dart';
import 'package:arami/common/const/colors.dart';
import 'package:arami/common/const/fonts.dart';
import 'package:arami/common/const/size.dart';
import 'package:arami/common/layout/default_layout.dart';
import 'package:arami/parenting/view/cardnews_screen.dart';
import 'package:arami/parenting/view/parentaledu_screen.dart';
import 'package:flutter/material.dart';


class ParentingParentaleduScreen extends StatefulWidget {
  final int initialIndex;

  const ParentingParentaleduScreen({
    required this.initialIndex,
    Key? key,
  }) : super(key: key);

  @override
  State<ParentingParentaleduScreen> createState() =>
      _ParentingParentaleduScreenState();
}

class _ParentingParentaleduScreenState
    extends State<ParentingParentaleduScreen> {
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
              '부모특강',
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
              '카드뉴스',
            ),
          ),
        ),
      ),
    ];

    List<Widget> tabView = [
      const ParentaleduScreen(),
      const CardnewsScreen(),
    ];

    return DefaultLayout(
      appbarPointView: false,
      appbarType: true,
      logoType: false,
      appTitle: '부모교육',
      elevations: 1,
      notiButton: true,
      child: CustomTab(
        length: 2,
        initialIndex: widget.initialIndex,
        labelStyle: BODY3_BOLD.copyWith(
          fontSize: 16.0 * getFontWidth(context),
          color: MAIN_COLOR,
        ),
        unselectedLabelStyle: BODY3_BOLD.copyWith(
          fontSize: 16.0 * getFontWidth(context),
          color: GRAY020,
        ),
        tabs: tabs,
        tabView: tabView,
      ),
    );
  }
}
