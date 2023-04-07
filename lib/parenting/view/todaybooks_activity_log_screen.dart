import 'package:arami/common/const/colors.dart';
import 'package:arami/common/const/fonts.dart';
import 'package:arami/common/const/size.dart';
import 'package:arami/parenting/component/activity_log_card.dart';
import 'package:arami/parenting/component/activity_log_write_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:video_player/video_player.dart';

import '../../common/const/function.dart';

class TodayBooksActivityLogScreen extends StatefulWidget {
  final VideoPlayerController? controller;

  const TodayBooksActivityLogScreen({
    this.controller,
    Key? key,
  }) : super(key: key);

  @override
  State<TodayBooksActivityLogScreen> createState() =>
      _TodayBooksActivityLogScreenState();
}

class _TodayBooksActivityLogScreenState
    extends State<TodayBooksActivityLogScreen> {
  String updateList = 'new';

  final List<Map<String, dynamic>> activityLogList = [
    {
      'id': 'activityLog01',
      'userID': '아람맘',
      'date': '2023-02-28 15:00:00',
      'userImage': 'asset/img/sample/user_sample_1.png',
      'detail': '엄마 우리 아람이가 자동차를 보면서 네네네!라고 말했다. 감동이다. 벌써 10번째 보는 책 최애책!',
      'imgType': '1',
      'detailImages': [
        'asset/img/sample/activity_log_sample_1.png',
        'asset/img/sample/activity_log_sample_2.png',
        'asset/img/sample/activity_log_sample_1.png',
        'asset/img/sample/activity_log_sample_2.png',
        'asset/img/sample/activity_log_sample_2.png'
      ],
      'favoriteCount': '3',
      'tags': [
        '오늘의 책활동',
        '베이비올 아기',
      ],
    },
    {
      'id': 'activityLog02',
      'userID': '아람파더',
      'date': '2022-02-23 15:00:00',
      'userImage': 'asset/img/sample/user_sample_1.png',
      'detail': '아빠 우리 아람이가 자동차를 보면서 네네네!라고 말했다. 감동이다. 벌써 10번째 보는 책 최애책!',
      'imgType': '1',
      'detailImages': [
        'asset/img/sample/activity_log_sample_1.png',
        'asset/img/sample/activity_log_sample_2.png',
        'asset/img/sample/activity_log_sample_1.png',
      ],
      'favoriteCount': '1',
      'tags': [
        '오늘의 책활동',
        '베이비올 영어',
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    String count = '240';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.0 * getScaleWidth(context),
            vertical: 24.0 * getScaleWidth(context),
          ),
          child: Text(
            '이렇게 활동했어요!',
            style: TITLE1_BOLD.copyWith(
              fontSize: 20.0 * getScaleWidth(context),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              if (widget.controller != null) {
                widget.controller?.pause();
              }
              activityLog(context);
            });
          },
          child: SizedBox(
            height: 48.0 * getScaleWidth(context),
            child: Padding(
              padding: EdgeInsets.only(
                left: 40.0 * getScaleWidth(context),
                right: 40.0 * getScaleWidth(context),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: MAIN_COLOR,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 24.0 * getScaleWidth(context),
                      height: 24.0 * getScaleWidth(context),
                      child: Image.asset(
                        'asset/img/icons/parenting_activity_writing_icon.png',
                      ),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      '활동일지 쓰기',
                      style: BODY3_BOLD.copyWith(
                        fontSize: 16.0 * getFontWidth(context),
                        color: WHITE,
                        height: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            right: 16.0 * getScaleWidth(context),
            left: 16.0 * getScaleWidth(context),
            top: 36.0 * getScaleWidth(context),
            bottom: 8.0 * getScaleWidth(context),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '활동일지 ${count}건',
                style: BODY3_BOLD.copyWith(
                  fontSize: 16.0 * getFontWidth(context),
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(
                        () {
                          print('최신순 작동 ${updateList}');
                          if (updateList == 'favorite') {
                            updateList = 'new';
                          }
                        },
                      );
                    },
                    child: Text(
                      '최신순',
                      style: BODY1_REGULAR.copyWith(
                          fontSize: 12.0 * getScaleWidth(context),
                          color: updateList == 'new' ? GRAY090 : GRAY020),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.0 * getScaleWidth(context),
                    ),
                    child: Text(
                      '|',
                      style: BODY1_REGULAR.copyWith(
                          fontSize: 12.0 * getScaleWidth(context),
                          color: GRAY040),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        print('좋아요순 작동 ${updateList}');
                        if (updateList == 'new') {
                          print('작동');
                          updateList = 'favorite';
                        }
                      });
                    },
                    child: Text(
                      '좋아요순',
                      style: BODY1_REGULAR.copyWith(
                          fontSize: 12.0 * getScaleWidth(context),
                          color: updateList == 'favorite' ? GRAY090 : GRAY020),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: activityLogList.length,
          itemBuilder: (BuildContext context, int index) {
            print(activityLogList[index]);
            return ActivityLogCard(
              item: activityLogList[index],
              momQnaThemeTag: false,
              userId: false,
            );
          },
        ),
      ],
    );
  }

  Future activityLog(context) async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ActivityLogWrite(),
      ),
    );
    setState(() {
      activityLogList.insert(0, result);
    });
  }
}
