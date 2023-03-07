import 'package:arami/common/const/colors.dart';
import 'package:arami/common/const/fonts.dart';
import 'package:arami/common/const/size.dart';
import 'package:flutter/material.dart';

class ParentingParentaleduCard extends StatelessWidget {
  ParentingParentaleduCard({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> parentaleduItem = [
    {
      'id': '001',
      'title': '특집 부모교육 시리즈 1편',
      'thumbNail': 'asset/img/sample/parentaledu_sample_1.png',
    },
    {
      'id': '002',
      'title': '영유아의 행복과 인권은 존중되어야 해요',
      'thumbNail': 'asset/img/sample/parentaledu_sample_2.png',
    },
    {
      'id': '003',
      'title': '하녀육아 벗어나는 방법',
      'thumbNail': 'asset/img/sample/parentaledu_sample_3.png',
    },
    {
      'id': '004',
      'title': '절대 휘둘리지 않는 방법',
      'thumbNail': 'asset/img/sample/parentaledu_sample_4.png',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 16.0 * getScaleWidth_Max(context),
            right: 16.0 * getScaleWidth_Max(context),
            top: 32.0 * getScaleWidth_Max(context),
            bottom: 16.0 * getScaleWidth_Max(context),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '부모 특강',
                style: TITLE1_BOLD.copyWith(
                  fontSize: 20.0 * getFontWidth(context),
                  color: GRAY090,
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('부모특강 더보기 작동');
                },
                child: Text(
                  '더보기 +',
                  style: BODY1_REGULAR.copyWith(
                    fontSize: 12.0 * getFontWidth(context),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 192.0 * getScaleWidth(context),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: parentaleduItem.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: (){
                  print('영상 아이디 : ${parentaleduItem[index]['id']} 작동');
                },
                child: Padding(
                  padding: index == 0
                      ? EdgeInsets.only(
                    left: 16.0 * getScaleWidth(context),
                    right: 8.0 * getScaleWidth(context),
                  )
                      : EdgeInsets.symmetric(
                      horizontal: 8.0 * getScaleWidth(context)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          bottom: 8.0 * getScaleWidth(context),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            parentaleduItem[index]['thumbNail'],
                            width: 242.0 * getScaleWidth(context),
                            height: 136.0 * getScaleWidth(context),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 242.0 * getScaleWidth(context),
                        child: Text(
                          parentaleduItem[index]['title'],
                          style: BODY3_REGULAR.copyWith(
                            fontSize: 16.0 * getFontWidth(context),
                            color: GRAY090,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
