import 'package:arami/common/const/colors.dart';
import 'package:arami/common/const/fonts.dart';
import 'package:arami/common/const/size.dart';
import 'package:flutter/material.dart';

class TodayBooksActivityIntroductionScreen extends StatelessWidget {
  const TodayBooksActivityIntroductionScreen({Key? key}) : super(key: key);

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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.0 * getScaleWidth(context),
                vertical: 24.0 * getScaleWidth(context),
              ),
              child: Text(
                '같이 읽으면 좋아요!',
                style: TITLE1_BOLD.copyWith(
                  fontSize: 20.0 * getFontWidth(context),
                  color: GRAY090,
                ),
              ),
            ),
            SizedBox(
              height: 204.0 * getScaleWidth(context),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: menu.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      print('활동 소개 연계도서 작동');
                    },
                    child: Padding(
                      padding: index == 0
                          ? EdgeInsets.only(
                              left: 16.0 * getScaleWidth(context),
                              right: 8.0 * getScaleWidth(context),
                            )
                          : EdgeInsets.symmetric(
                              horizontal: 8.0 * getScaleWidth(context)),
                      child: Container(
                        width: 120.0 * getScaleWidth(context),
                        height: 204.0 * getScaleWidth(context),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(4.0),
                              child: Image.asset(
                                menu[index]['thumbNail'],
                              ),
                            ),
                            SizedBox(
                              height: 8.0 * getScaleWidth(context),
                            ),
                            Text(
                              menu[index]['title'],
                              style: BODY3_BOLD.copyWith(
                                fontSize: 16.0 * getFontWidth(context),
                                color: GRAY090,
                              ),
                            ),
                            Text(
                              menu[index]['subTitle'],
                              style: BODY2_REGULAR.copyWith(
                                fontSize: 14.0 * getFontWidth(context),
                                color: GRAY090,
                              ),
                              overflow: TextOverflow.ellipsis,
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
        ),
        Lines(context),
        Padding(
          padding: EdgeInsets.only(left: 16.0 * getScaleWidth(context)),
          child: SizedBox(
            height: 102.0 * getScaleWidth(context),
            child: Padding(
              padding: EdgeInsets.only(
                top: 32.0 * getScaleWidth(context),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '활동 준비물',
                    style: TITLE1_BOLD.copyWith(
                      fontSize: 20.0 * getFontWidth(context),
                      color: GRAY090,
                    ),
                  ),
                  SizedBox(
                    height: 16.0 * getScaleWidth(context),
                  ),
                  Text(
                    '아이의 장난감(공, 인형 등), 수레 혹은 바구니',
                    style: BODY3_REGULAR.copyWith(
                      fontSize: 16.0 * getFontWidth(context),
                      color: GRAY090,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 362.0 * getScaleWidth(context),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0 * getScaleWidth(context),
              vertical: 32.0 * getScaleWidth(context),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '활동 가이드',
                  style: TITLE1_BOLD.copyWith(
                    fontSize: 20.0 * getFontWidth(context),
                    color: GRAY090,
                  ),
                ),
                SizedBox(
                  height: 16.0 * getScaleWidth(context),
                ),
                Container(
                  child: Row(
                    children: [
                      Image.asset(
                        'asset/img/icons/parenting_step_icon_1.png',
                        height: 32.0 * getScaleWidth(context),
                        width: 32.0 * getScaleWidth(context),
                      ),
                      SizedBox(
                        width: 4.0 * getScaleWidth(context),
                      ),
                      Text(
                        'Step1',
                        style: BODY3_BOLD.copyWith(
                          fontSize: 16.0 * getFontWidth(context),
                          color: GRAY090,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 4.0 * getScaleWidth(context),
                ),
                Text(
                  '아이가 좋아하는 인형, 장난감을 가져오게 하세요.',
                  style: BODY3_REGULAR.copyWith(
                    fontSize: 16.0 * getFontWidth(context),
                    color: GRAY090,
                  ),
                ),
                SizedBox(
                  height: 12.0 * getScaleWidth(context),
                ),
                Container(
                  child: Row(
                    children: [
                      Image.asset(
                        'asset/img/icons/parenting_step_icon_2.png',
                        height: 32.0 * getScaleWidth(context),
                        width: 32.0 * getScaleWidth(context),
                      ),
                      SizedBox(
                        width: 4.0 * getScaleWidth(context),
                      ),
                      Text(
                        'Step2',
                        style: BODY3_BOLD.copyWith(
                          fontSize: 16.0 * getFontWidth(context),
                          color: GRAY090,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 4.0 * getScaleWidth(context),
                ),
                Text(
                  '아이에게 장난감의 이름과 명칭을 알려주고, 장난감의 이름을 부르며 대답해 보세요.',
                  style: BODY3_REGULAR.copyWith(
                    fontSize: 16.0 * getFontWidth(context),
                    color: GRAY090,
                  ),
                ),
                SizedBox(
                  height: 12.0 * getScaleWidth(context),
                ),
                Container(
                  child: Row(
                    children: [
                      Image.asset(
                        'asset/img/icons/parenting_step_icon_3.png',
                        height: 32.0 * getScaleWidth(context),
                        width: 32.0 * getScaleWidth(context),
                      ),
                      SizedBox(
                        width: 4.0 * getScaleWidth(context),
                      ),
                      Text(
                        'Step3',
                        style: BODY3_BOLD.copyWith(
                          fontSize: 16.0 * getFontWidth(context),
                          color: GRAY090,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 4.0 * getScaleWidth(context),
                ),
                Text(
                  '당김놀이책을 당겨보며, 물건의 이동을 알려주세요.',
                  style: BODY3_REGULAR.copyWith(
                    fontSize: 16.0 * getFontWidth(context),
                    color: GRAY090,
                  ),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            print('활동지 다운로드 작동');
          },
          child: SizedBox(
            height: 80.0 * getScaleWidth(context),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 16.0 * getScaleWidth(context),
                horizontal: 40.0 * getScaleWidth(context),
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
                        'asset/img/icons/parenting_down_icon.png',
                      ),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      '활동지 다운로드',
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
        Lines(context),
        Padding(
          padding: EdgeInsets.only(
            top: 24.0 * getScaleWidth(context),
            right: 16.0 * getScaleWidth(context),
            left: 16.0 * getScaleWidth(context),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '영상 설명',
                style: TITLE1_BOLD.copyWith(
                  fontSize: 20.0 * getFontWidth(context),
                  color: GRAY090,
                ),
              ),
              SizedBox(
                height: 16.0 * getScaleWidth(context),
              ),
              Text(
                '아이가 좋아하는 물건을 집어 오고, 바구니(혹은 수레)에 담아보는 활동을 통하여 아이는 소근육 및 대근육 발달에 도움이 되는 협응력을 기르게 됩니다. 아이에게 사물의 이름을 이야기하고 이름을 부르며 ‘네~!’ 하고 이름에 대답해 보세요!',
                style: BODY3_REGULAR.copyWith(
                  fontSize: 16.0 * getFontWidth(context),
                  color: GRAY090,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 100.0),
      ],
    );
  }

  Widget Lines(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.0 * getScaleWidth(context),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 16.0 * getScaleWidth(context),
        ),
        alignment: Alignment.center,
        //width: 328.0 * getScaleWidth_Max(context),
        child: Divider(
          color: OUTLINE,
          thickness: 1.0,
        ),
      ),
    );
  }
}
