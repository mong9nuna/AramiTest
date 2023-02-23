import 'package:arami/common/const/fonts.dart';
import 'package:arami/common/const/size.dart';
import 'package:flutter/material.dart';

class FreeContentCard extends StatefulWidget {
  const FreeContentCard({Key? key}) : super(key: key);

  @override
  State<FreeContentCard> createState() => _FreeContentCardState();
}

class _FreeContentCardState extends State<FreeContentCard> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> menu = [
      {
        'thumbNail': 'asset/img/sample/free_content_1.png',
        'title': '경제특공대',
        'subTitle': '돈이 뭐예요?',
      },
      {
        'thumbNail': 'asset/img/sample/free_content_2.png',
        'title': '경제특공대',
        'subTitle': '돈은 어떻게 벌어요?',
      },
      {
        'thumbNail': 'asset/img/sample/free_content_1.png',
        'title': '경제특공대',
        'subTitle': '개미들이 유튜버가 됐어요',
      },
      {
        'thumbNail': 'asset/img/sample/free_content_2.png',
        'title': '경제특공대',
        'subTitle': '돈이 뭐예요?',
      },
      {
        'thumbNail': 'asset/img/sample/free_content_1.png',
        'title': '경제특공대',
        'subTitle': '돈은 어떻게 벌어요?',
      },
      {
        'thumbNail': 'asset/img/sample/free_content_2.png',
        'title': '경제특공대',
        'subTitle': '개미들이 유튜버가 됐어요',
      },
    ];
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 32.0 * getScaleWidth(context),
            bottom: 16.0 * getScaleWidth(context),
            left: 16.0 * getScaleWidth(context),
            right: 16.0 * getScaleWidth(context),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '무료 콘텐츠 체험하기',
                style: TITLE1_BOLD.copyWith(
                  fontSize: 20.0 * getFontWidth(context),
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('무료 콘텐츠 더보기 작동');
                },
                child: Text(
                  '더보기 +',
                  style: BODY1_REGULAR.copyWith(
                    fontSize: 12.0 * getFontWidth(context),
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          height: 230.0 * getScaleWidth(context),
          // 리스트뷰 추가
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: menu.length,
            itemBuilder: (BuildContext context, int index) {
              bool last = menu.length == (index + 1);
              return Padding(
                padding: index == 0
                    ? EdgeInsets.only(
                        left: 16.0 * getScaleWidth(context),
                        right: 10.0 * getScaleWidth(context),
                      )
                    : EdgeInsets.symmetric(
                        horizontal: 10.0 * getScaleWidth(context)),
                child: SizedBox(
                  width: 120.0 * getScaleWidth(context),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 150.0 * getScaleWidth(context),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4.0),
                          child: Image.asset(
                            menu[index]['thumbNail'],
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 8.0 * getScaleWidth(context),
                          bottom: 4.0 * getScaleWidth(context),
                        ),
                        child: Text(
                          menu[index]['title'],
                          style: BODY3_BOLD.copyWith(
                            fontSize: 16.0 * getFontWidth(context),
                          ),
                        ),
                      ),
                      Text(
                        menu[index]['subTitle'],
                        style: BODY2_REGULAR.copyWith(
                          fontSize: 14.0 * getFontWidth(context),
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
