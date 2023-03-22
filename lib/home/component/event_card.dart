import 'package:arami/common/const/colors.dart';
import 'package:arami/common/const/fonts.dart';
import 'package:arami/common/const/size.dart';
import 'package:arami/mypage/view/mypage_event_screen.dart';
import 'package:flutter/material.dart';

class EventCard extends StatefulWidget {
  const EventCard({Key? key}) : super(key: key);

  @override
  State<EventCard> createState() => _EventCardState();
}

class _EventCardState extends State<EventCard> {
  final List<Map<String, dynamic>> eventList = [
    {
      'title': '아람 전집 후기 이벤트',
      'thumbNail': 'asset/img/sample/event_sample_1.png',
      'dates': '2023-02-03 ~ 2023-03-01',
    },
    {
      'title': '2월 아람 전집 구입 혜택',
      'thumbNail': 'asset/img/sample/event_sample_2.png',
      'dates': '2023-02-01 ~ 2023-02-28',
    },
    {
      'title': '1월 아람 전집 구입 혜택',
      'thumbNail': 'asset/img/sample/event_sample_3.png',
      'dates': '2023-01-01 ~ 2023-01-31',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 16.0 * getScaleWidth(context),
            right: 16.0 * getScaleWidth(context),
            top: 32.0 * getScaleWidth(context),
            bottom: 16.0 * getScaleWidth(context),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '이벤트',
                style: TITLE1_BOLD.copyWith(
                  fontSize: 20.0 * getFontWidth(context),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MypageEventScreen(),
                    ),
                  );
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
          height: 174.0 * getScaleWidth(context),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: eventList.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  print('이벤트 작동');
                },
                child: Padding(
                  padding: index == 0
                      ? EdgeInsets.only(
                          left: 16.0 * getScaleWidth(context),
                          right: 16.0 * getScaleWidth(context),
                        )
                      : EdgeInsets.symmetric(
                          horizontal: 16.0 * getScaleWidth(context)),
                  child: SizedBox(
                    width: 201.0 * getScaleWidth(context),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(eventList[index]['thumbNail']),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 8.0 * getScaleWidth(context),
                            bottom: 4.0 * getScaleWidth(context),
                          ),
                          child: Text(
                            eventList[index]['title'],
                            style: BODY2_BOLD.copyWith(
                              fontSize: 14.0 * getFontWidth(context),
                            ),
                          ),
                        ),
                        Text(
                          eventList[index]['dates'],
                          style: BODY1_REGULAR.copyWith(
                              fontSize: 12.0 * getFontWidth(context),
                              color: GRAY040),
                        ),
                      ],
                    ),
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
