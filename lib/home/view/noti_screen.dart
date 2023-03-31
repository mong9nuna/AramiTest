import 'package:arami/common/const/colors.dart';
import 'package:arami/common/const/fonts.dart';
import 'package:arami/common/const/function.dart';
import 'package:arami/common/const/size.dart';
import 'package:flutter/material.dart';

class NotiScreen extends StatelessWidget {
  const NotiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final List<Map<String, dynamic>> notiList = [
      {
        'icons': 'asset/img/icons/noti_point_icon.png',
        'title': '포인트 적립',
        'detail': '포인트 10점을 받았어요.',
        'date': '2023-02-23 15:00:00',
      },
      {
        'icons': 'asset/img/icons/noti_activity_icon.png',
        'title': '활동일지 쓰기',
        'detail': '아이와 함께한 독서활동을 공유해보세요.',
        'date': '2023-02-10 15:00:00',
      },
      {
        'icons': 'asset/img/icons/noti_todaybooks_icon.png',
        'title': '오늘의 책활동',
        'detail': '새로운 오늘의 책활동이 업데이트됐어요!',
        'date': '2023-02-08 15:00:00',
      },
      {
        'icons': 'asset/img/icons/noti_point_icon.png',
        'title': '포인트 적립',
        'detail': '포인트 10점을 받았어요.',
        'date': '2023-02-07 15:00:00',
      },
      {
        'icons': 'asset/img/icons/noti_activity_icon.png',
        'title': '활동일지 쓰기',
        'detail': '아이와 함께한 독서활동을 공유해보세요.',
        'date': '2023-01-10 15:00:00',
      },
      {
        'icons': 'asset/img/icons/noti_todaybooks_icon.png',
        'title': '오늘의 책활동',
        'detail': '새로운 오늘의 책활동이 업데이트됐어요!',
        'date': '2023-01-08 15:00:00',
      },
      {
        'icons': 'asset/img/icons/noti_point_icon.png',
        'title': '포인트 적립',
        'detail': '포인트 10점을 받았어요.',
        'date': '2023-02-23 15:00:00',
      },
      {
        'icons': 'asset/img/icons/noti_activity_icon.png',
        'title': '활동일지 쓰기',
        'detail': '아이와 함께한 독서활동을 공유해보세요.',
        'date': '2023-02-10 15:00:00',
      },
      {
        'icons': 'asset/img/icons/noti_todaybooks_icon.png',
        'title': '오늘의 책활동',
        'detail': '새로운 오늘의 책활동이 업데이트됐어요!',
        'date': '2023-02-08 15:00:00',
      },
      {
        'icons': 'asset/img/icons/noti_point_icon.png',
        'title': '포인트 적립',
        'detail': '포인트 10점을 받았어요.',
        'date': '2023-02-07 15:00:00',
      },
      {
        'icons': 'asset/img/icons/noti_activity_icon.png',
        'title': '활동일지 쓰기',
        'detail': '아이와 함께한 독서활동을 공유해보세요.',
        'date': '2023-01-10 15:00:00',
      },
      {
        'icons': 'asset/img/icons/noti_todaybooks_icon.png',
        'title': '오늘의 책활동',
        'detail': '새로운 오늘의 책활동이 업데이트됐어요!',
        'date': '2023-01-08 15:00:00',
      },
    ];

    return ListView.builder(
      padding: EdgeInsets.only(
        top: 12.0 * getScaleWidth_Max(context),
        bottom: 50.0 * getScaleWidth_Max(context),
        left: 16.0 * getScaleWidth_Max(context),
        right: 16.0 * getScaleWidth_Max(context),
      ),
      itemCount: notiList.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: index != 0
              ? EdgeInsets.only(
                  top: 12.0 * getScaleWidth_Max(context),
                )
              : null,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 1.0,
                color: OUTLINE,
              ),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                notiList[index]['icons'],
                height: 24.0 * getScaleWidth(context),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 8.0 * getScaleWidth_Max(context),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 296.0 * getScaleWidth_Max(context),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            notiList[index]['title'],
                            style: BODY2_REGULAR.copyWith(
                              fontSize: 14.0 * getFontWidth(context),
                              color: GRAY050,
                            ),
                          ),
                          Text(
                            TimeCount(notiList[index]['date']),
                            style: BODY2_REGULAR.copyWith(
                              fontSize: 14.0 * getFontWidth(context),
                              color: GRAY020,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 8.0 * getScaleWidth(context),
                      ),
                      child: Text(
                        notiList[index]['detail'],
                        style: BODY3_REGULAR.copyWith(
                          fontSize: 16.0 * getFontWidth(context),
                          color: GRAY090,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
