import 'package:arami/common/const/colors.dart';
import 'package:arami/common/const/fonts.dart';
import 'package:arami/common/const/size.dart';
import 'package:flutter/material.dart';

class ParentingCardNewsCard extends StatelessWidget {
  ParentingCardNewsCard({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> cardnewsItem = [
    {
      'id': '001',
      'thumbNail': 'asset/img/sample/parenting_cardnews_sample.png',
    },
    {
      'id': '002',
      'thumbNail': 'asset/img/sample/parenting_cardnews_sample.png',
    },
    {
      'id': '003',
      'thumbNail': 'asset/img/sample/parenting_cardnews_sample.png',
    },
    {
      'id': '004',
      'thumbNail': 'asset/img/sample/parenting_cardnews_sample.png',
    },
    {
      'id': '005',
      'thumbNail': 'asset/img/sample/parenting_cardnews_sample.png',
    },
    {
      'id': '006',
      'thumbNail': 'asset/img/sample/parenting_cardnews_sample.png',
    },
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
                '카드뉴스',
                style: TITLE1_BOLD.copyWith(
                  fontSize: 20.0 * getFontWidth(context),
                  color: GRAY090,
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('카드뉴스 더보기 작동');
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
        Padding(
          padding: EdgeInsets.only(
            left: 16.0 * getScaleWidth_Max(context),
            right: 16.0 * getScaleWidth_Max(context),
            bottom: 24.0 * getScaleWidth_Max(context),
          ),
          child: SizedBox(
            height: 216 * getScaleWidth_Max(context),
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: cardnewsItem.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 8.0 * getScaleWidth_Max(context),
                mainAxisSpacing: 8.0 * getScaleWidth_Max(context),
                childAspectRatio: 1.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 104.0 * getScaleWidth_Max(context),
                  width: 104.0 * getScaleWidth_Max(context),
                  child: Image.asset(cardnewsItem[index]['thumbNail']),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
