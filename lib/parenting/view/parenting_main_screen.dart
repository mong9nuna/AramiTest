import 'package:arami/common/const/colors.dart';
import 'package:arami/common/const/function.dart';
import 'package:arami/home/component/todaybooks_card.dart';
import 'package:arami/parenting/component/parenting_cardnews_card.dart';
import 'package:arami/parenting/component/parenting_parentaledu_card.dart';
import 'package:arami/parenting/component/parenting_top_menu.dart';
import 'package:flutter/material.dart';

import '../../common/layout/default_layout.dart';
import '../component/parenting_momsqna_card.dart';

class ParentingMainScreen extends StatelessWidget {
  const ParentingMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      elevations: 0,
      appbarPointView: false,
      appbarType: false,
      logoType: false,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ParentingTopMenu(),
            Lines(8.0),
            TodayBooksCard(),
            Lines(8.0),
            ParentingMomsqnaCard(),
            Lines(8.0),
            ParentingParentaleduCard(),
            ParentingCardNewsCard(),
            Lines(8.0),
          ],
        ),
      ),
    );
  }
}
