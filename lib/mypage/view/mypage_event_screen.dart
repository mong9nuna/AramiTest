import 'package:arami/common/const/colors.dart';
import 'package:arami/common/const/fonts.dart';
import 'package:arami/common/const/size.dart';
import 'package:arami/common/layout/default_layout.dart';
import 'package:flutter/material.dart';

class MypageEventScreen extends StatelessWidget {
  const MypageEventScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> itemList = [
      {
        'thumbnail': 'asset/img/sample/event_sample_1.png',
        'title': '아람 전집 후기 이벤트',
        'startDate': '2023-02-03',
        'endDate': '2023-03-01',
      },
      {
        'thumbnail': 'asset/img/sample/event_sample_2.png',
        'title': '2월 아람 전집 구입 혜택',
        'startDate': '2023-02-01',
        'endDate': '2023-02-28',
      },
      {
        'thumbnail': 'asset/img/sample/event_sample_3.png',
        'title': '1월 아람 전집 구입 혜택',
        'startDate': '2023-01-01',
        'endDate': '2023-01-31',
      },
      {
        'thumbnail': 'asset/img/sample/event_sample_1.png',
        'title': '아람 전집 후기 이벤트',
        'startDate': '2023-02-03',
        'endDate': '2023-03-01',
      },
      {
        'thumbnail': 'asset/img/sample/event_sample_2.png',
        'title': '2월 아람 전집 구입 혜택',
        'startDate': '2023-02-01',
        'endDate': '2023-02-28',
      },
      {
        'thumbnail': 'asset/img/sample/event_sample_3.png',
        'title': '1월 아람 전집 구입 혜택',
        'startDate': '2023-01-01',
        'endDate': '2023-01-31',
      },
    ];

    return DefaultLayout(
      appbarPointView: false,
      appbarType: true,
      logoType: false,
      appTitle: '전체 이벤트',
      elevations: 1,
      notiButton: true,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 24.0 * getScaleWidth(context),
          ),
          child: Column(
            children: [
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: itemList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.0 * getScaleWidth(context),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: (){
                            print('이벤트 터치');
                          },
                          child: SizedBox(
                            width: 328.0 * getScaleWidth(context),
                            height: 185.0 * getScaleWidth(context),
                            child: Image.asset(
                              itemList[index]['thumbnail'],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 8.0 * getScaleWidth(context),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                itemList[index]['title'],
                                style: BODY3_BOLD.copyWith(
                                  fontSize: 16.0 * getFontWidth(context),
                                  color: GRAY090,
                                ),
                              ),
                              SizedBox(
                                height: 4.0 * getScaleWidth(context),
                              ),
                              Text(
                                '${itemList[index]['startDate']} ~ ${itemList[index]['endDate']}',
                                style: BODY1_REGULAR.copyWith(
                                  fontSize: 12.0 * getFontWidth(context),
                                  color: GRAY040,
                                ),
                              ),
                              SizedBox(
                                height: 16.0 * getScaleWidth(context),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
