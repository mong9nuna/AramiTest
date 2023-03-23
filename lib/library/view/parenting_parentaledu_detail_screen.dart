import 'package:arami/common/const/colors.dart';
import 'package:arami/common/const/size.dart';
import 'package:arami/common/layout/default_layout.dart';
import 'package:flutter/material.dart';

class ParentingParentaleduDetailScreen extends StatefulWidget {
  const ParentingParentaleduDetailScreen({Key? key}) : super(key: key);

  @override
  State<ParentingParentaleduDetailScreen> createState() =>
      _ParentingParentaleduDetailScreenState();
}

class _ParentingParentaleduDetailScreenState
    extends State<ParentingParentaleduDetailScreen> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> qnaList = {
      'id': 'user001',
      'detailImages': [
        'asset/img/sample/activity_log_sample_1.png',
        'asset/img/sample/activity_log_sample_2.png',
        'asset/img/sample/activity_log_sample_1.png',
        'asset/img/sample/activity_log_sample_2.png',
        'asset/img/sample/activity_log_sample_2.png',
      ],
      'detail':
          '안녕하세요 ~ 책육아 전문가 아람북스태전 점장입니다. 오늘은 떼 쓰는 아이, 어떻게 대처하면 되는지 알아보겠습니다. 떼쓰는 아이는 부모님을 당황스럽고 힘들게 하지요~ 특히 사람이 많은 공공장소에서 떼를 쓰면 부모님들께서는 머리가 하얗게 되고, 본인도 모르게 화를 내게 된다는 분들이 많으신데요. \n\n1.아이가 언제 떼를 쓰는 지 살펴보세요.\n\n아이마다 기질이 다르기 때문에 언제 떼를 쓰는지 살펴보셔야 합니다. 어떤 아이는 몸이 피곤하고 졸릴때 떼를 쓰고 어떤 아이는 공공장소에서 떼를 쓰면 본인의 요구가 들어진다는 것을 알고 떼를 쓰기도 합니다. 아이가 떼를 쓰는 상황을 파악하고 그러한 상황을 만들지 않는것이 중요합니다.',
    };
    int mainIndex = 0;

    return DefaultLayout(
      appbarPointView: false,
      appbarType: true,
      appTitle: '카드뉴스',
      logoType: false,
      elevations: 1,
      notiButton: true,
      child: Column(
        children: [
          Stack(
            children: [
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: qnaList['detailImages'].length,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 8.0 * getScaleWidth(context),
                        height: 8.0 * getScaleWidth(context),
                        decoration: BoxDecoration(
                          color: GRAY040,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
