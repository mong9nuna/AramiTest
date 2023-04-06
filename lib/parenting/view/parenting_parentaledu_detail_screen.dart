import 'package:arami/common/const/colors.dart';
import 'package:arami/common/const/size.dart';
import 'package:arami/common/layout/default_layout.dart';
import 'package:flutter/material.dart';

import '../../common/const/fonts.dart';

class ParentingParentaleduDetailScreen extends StatefulWidget {
  const ParentingParentaleduDetailScreen({Key? key}) : super(key: key);

  @override
  State<ParentingParentaleduDetailScreen> createState() =>
      _ParentingParentaleduDetailScreenState();
}

class _ParentingParentaleduDetailScreenState
    extends State<ParentingParentaleduDetailScreen> {
  int mainIndex = 0;

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> qnaList = {
      'id': 'user001',
      'detailImages': [
        'asset/img/sample/activity_log_sample_1.png',
        'asset/img/sample/activity_log_sample_2.png',
        'asset/img/sample/activity_log_sample_1.png',
        'asset/img/sample/activity_log_sample_2.png',
        'asset/img/sample/activity_log_sample_1.png',
      ],
      'detailTitle': '떼쓰는 아이 지혜롭게 대처하는 방법',
      'detail':
          '안녕하세요 ~ 책육아 전문가 아람북스태전 점장입니다. 오늘은 떼 쓰는 아이, 어떻게 대처하면 되는지 알아보겠습니다. 떼쓰는 아이는 부모님을 당황스럽고 힘들게 하지요~ 특히 사람이 많은 공공장소에서 떼를 쓰면 부모님들께서는 머리가 하얗게 되고, 본인도 모르게 화를 내게 된다는 분들이 많으신데요. \n\n1.아이가 언제 떼를 쓰는 지 살펴보세요.\n\n아이마다 기질이 다르기 때문에 언제 떼를 쓰는지 살펴보셔야 합니다. 어떤 아이는 몸이 피곤하고 졸릴때 떼를 쓰고 어떤 아이는 공공장소에서 떼를 쓰면 본인의 요구가 들어진다는 것을 알고 떼를 쓰기도 합니다. 아이가 떼를 쓰는 상황을 파악하고 그러한 상황을 만들지 않는것이 중요합니다.',
    };

    return DefaultLayout(
      appbarPointView: false,
      appbarType: true,
      appTitle: '카드뉴스',
      logoType: false,
      elevations: 1,
      notiButton: true,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 360.0 * getScaleWidth_Max(context),
              height: 360.0 * getScaleWidth_Max(context),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: 360.0 * getScaleWidth_Max(context),
                      height: 360.0 * getScaleWidth_Max(context),
                      child: PageView.builder(
                        onPageChanged: (value) {
                          setState(() {
                            mainIndex = value;
                          });
                        },
                        itemCount: qnaList['detailImages'].length,
                        itemBuilder: (BuildContext context, int index1) {
                          return Container(
                            child: Image.asset(
                              "${qnaList['detailImages'][index1]}",
                              height: 360.0 * getScaleWidth(context),
                              fit: BoxFit.fitWidth,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: 360.0 * getScaleWidth_Max(context),
                      height: 40.0 * getScaleWidth(context),
                      alignment: Alignment.topCenter,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0x00202020),
                            Color(0x33202020),
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 16.0 * getScaleWidth(context),
                        ),
                        child: Container(
                          width: (16.0 * qnaList['detailImages'].length) *
                              getScaleWidth(context),
                          height: 8.0 * getScaleWidth(context),
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: qnaList['detailImages'].length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 4.0 * getScaleWidth(context),
                                ),
                                child: Container(
                                  width: 8.0 * getScaleWidth(context),
                                  height: 8.0 * getScaleWidth(context),
                                  decoration: BoxDecoration(
                                      color:
                                          mainIndex == index ? GRAY040 : WHITE,
                                      shape: BoxShape.circle),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.0 * getScaleWidth(context),
                vertical: 16.0 * getScaleWidth(context),
              ),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${qnaList['detailTitle']}',
                  style: TITLE1_BOLD.copyWith(
                    fontSize: 20.0 * getFontWidth(context),
                    color: GRAY090,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.0 * getScaleWidth(context),
                vertical: 8.0 * getScaleWidth(context),
              ),
              child: Container(
                child: Text(
                  '${qnaList['detail']}',
                  style: BODY2_REGULAR.copyWith(
                    fontSize: 14.0 * getFontWidth(context),
                    color: GRAY090,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50.0 * getScaleWidth(context),
            ),
          ],
        ),
      ),
    );
  }
}
