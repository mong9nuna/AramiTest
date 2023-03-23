import 'package:arami/common/const/colors.dart';
import 'package:arami/common/const/fonts.dart';
import 'package:arami/common/const/function.dart';
import 'package:arami/common/const/size.dart';
import 'package:flutter/material.dart';

class ParentingMomsqnaCard extends StatefulWidget {
  const ParentingMomsqnaCard({Key? key}) : super(key: key);

  @override
  State<ParentingMomsqnaCard> createState() => _ParentingMomsqnaCardState();
}

class _ParentingMomsqnaCardState extends State<ParentingMomsqnaCard> {
  final List<Map<String, dynamic>> momsqnaTopMenu = [
    {
      'statusCode': '00',
      'title': '전체',
      'emoji': '',
    },
    {
      'statusCode': '01',
      'title': '출산준비',
      'emoji': '\u{1F930}',
    },
    {
      'statusCode': '02',
      'title': '수유방법',
      'emoji': '\u{1F37C}',
    },
    {
      'statusCode': '03',
      'title': '이유식',
      'emoji': '\u{1F353}',
    },
    {
      'statusCode': '04',
      'title': '아이건강',
      'emoji': '\u{1F476}',
    },
    {
      'statusCode': '05',
      'title': '어린이집',
      'emoji': '\u{1F3D8}',
    },
  ];

  final List<Map<String, dynamic>> momsqnaDetail = [
    {
      'page': '1',
      'detail': [
        {
          'dates': '2023-02-27 11:20:00',
          'title': '아이 컵사용 연습 조언해주세요',
          'detail':
              '29개월 남아인데 컵사용을 연습시키고 싶은데 컵을 주면 물을 쏟고 장난만 해요. 컵은 물 마시는 용도라고 알려주..',
        },
        {
          'dates': '2023-02-27 09:00:00',
          'title': '130일차 뒤집기 지옥... 탈출 방법 없나요?',
          'detail':
              '아이가 뒤집기를 시작하면서 베게에서 이탈해서 잠들고 종종 엎드려 잘 때가 있는데 코박고 자기도 하고 밤중에..',
        },
      ]
    },
    {
      'page': '2',
      'detail': [
        {
          'dates': '2023-02-26 15:00:00',
          'title': '아이 컵사용 연습 조언해주세요',
          'detail':
              '29개월 남아인데 컵사용을 연습시키고 싶은데 컵을 주면 물을 쏟고 장난만 해요. 컵은 물 마시는 용도라고 알려주..',
        },
        {
          'dates': '2023-02-23 15:00:00',
          'title': '130일차 뒤집기 지옥... 탈출 방법 없나요?',
          'detail':
              '아이가 뒤집기를 시작하면서 베게에서 이탈해서 잠들고 종종 엎드려 잘 때가 있는데 코박고 자기도 하고 밤중에..',
        },
      ]
    },
    {
      'page': '3',
      'detail': [
        {
          'dates': '2023-02-23 15:00:00',
          'title': '아이 컵사용 연습 조언해주세요',
          'detail':
              '29개월 남아인데 컵사용을 연습시키고 싶은데 컵을 주면 물을 쏟고 장난만 해요. 컵은 물 마시는 용도라고 알려주..',
        },
        {
          'dates': '2023-02-23 15:00:00',
          'title': '130일차 뒤집기 지옥... 탈출 방법 없나요?',
          'detail':
              '아이가 뒤집기를 시작하면서 베게에서 이탈해서 잠들고 종종 엎드려 잘 때가 있는데 코박고 자기도 하고 밤중에..',
        },
      ]
    },
    {
      'page': '4',
      'detail': [
        {
          'dates': '2023-02-23 15:00:00',
          'title': '아이 컵사용 연습 조언해주세요',
          'detail':
          '29개월 남아인데 컵사용을 연습시키고 싶은데 컵을 주면 물을 쏟고 장난만 해요. 컵은 물 마시는 용도라고 알려주..',
        },
        {
          'dates': '2023-02-23 15:00:00',
          'title': '130일차 뒤집기 지옥... 탈출 방법 없나요?',
          'detail':
          '아이가 뒤집기를 시작하면서 베게에서 이탈해서 잠들고 종종 엎드려 잘 때가 있는데 코박고 자기도 하고 밤중에..',
        },
      ]
    },
  ];

  int selectMenu = 0;
  int mainIndex = 0;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 16.0 * getScaleWidth_Max(context),
            right: 16.0 * getScaleWidth_Max(context),
            top: 32.0 * getScaleWidth_Max(context),
            bottom: 24.0 * getScaleWidth_Max(context),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '맘끼리 Q&A',
                style: TITLE1_BOLD.copyWith(
                  fontSize: 20.0 * getFontWidth(context),
                  color: GRAY090,
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('맘끼리 Q&A 더보기 작동');
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
          padding: EdgeInsets.symmetric(
            vertical: 12.0 * getScaleWidth(context),
          ),
          child: SizedBox(
            height: 38.5 * getScaleWidth(context),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: momsqnaTopMenu.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectMenu = index;
                    });
                  },
                  child: Padding(
                    padding: index == 0
                        ? EdgeInsets.only(
                            left: 16.0 * getScaleWidth(context),
                            right: 4.0 * getScaleWidth(context),
                          )
                        : EdgeInsets.symmetric(
                            horizontal: 4.0 * getScaleWidth(context)),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1.0,
                          color: selectMenu == index ? GRAY090 : GRAY040,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 8.0 * getScaleWidth(context),
                          horizontal: 20.0 * getScaleWidth(context),
                        ),
                        child: Text(
                          '${momsqnaTopMenu[index]['emoji']}${momsqnaTopMenu[index]['title']}',
                          style: BODY2_REGULAR.copyWith(
                              fontSize: 14.0 * getFontWidth(context),
                              color: selectMenu == index ? GRAY090 : GRAY040,
                              height: 1.5),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        Container(
          height: 296.0 * getScaleWidth(context),
          child: PageView.builder(
            onPageChanged: (value) {
              setState(() {
                mainIndex = value;
              });
            },
            itemCount: momsqnaDetail.length,
            itemBuilder: (BuildContext context, int index1) {
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: momsqnaDetail[index1].length,
                      itemBuilder: (BuildContext context, int index2) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.0 * getScaleWidth_Max(context),
                          ),
                          height: 148.0 * getScaleWidth(context),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(width: 1.0, color: OUTLINE)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    top: 16.0 * getScaleWidth_Max(context),
                                    bottom: 12.0 * getScaleWidth_Max(context),
                                  ),
                                  child: Text(
                                    momsqnaDetail[index1]['detail'][index2]
                                        ['title'],
                                    style: BODY3_BOLD.copyWith(
                                      fontSize: 16.0 * getFontWidth(context),
                                      color: GRAY090,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                    bottom: 12.0 * getFontWidth(context),
                                  ),
                                  child: Text(
                                    momsqnaDetail[index1]['detail'][index2]
                                        ['detail'],
                                    style: BODY2_REGULAR.copyWith(
                                      fontSize: 14.0 * getFontWidth(context),
                                      color: GRAY090,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    maxLines: 2,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            'asset/img/icons/momsqna_empathy_icon.png',
                                            height:
                                                24.0 * getScaleWidth(context),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              left: 4.0 *
                                                  getScaleWidth_Max(context),
                                            ),
                                            child: Text(
                                              '공감  5',
                                              style: BODY1_REGULAR.copyWith(
                                                  fontSize: 12.0 *
                                                      getFontWidth(context),
                                                  color: GRAY040,
                                                  height: 1),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 8.0 *
                                                  getScaleWidth_Max(context),
                                            ),
                                            child: Container(
                                              width: 2.0,
                                              height: 2.0,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: GRAY040,
                                              ),
                                            ),
                                          ),
                                          Image.asset(
                                            'asset/img/icons/momsqna_comment_icon.png',
                                            height:
                                                24.0 * getScaleWidth(context),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              left: 4.0 *
                                                  getScaleWidth_Max(context),
                                            ),
                                            child: Text(
                                              '댓글  1',
                                              style: BODY1_REGULAR.copyWith(
                                                  fontSize: 12.0 *
                                                      getFontWidth(context),
                                                  color: GRAY040,
                                                  height: 1),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                      TimeCount(momsqnaDetail[index1]['detail']
                                          [index2]['dates']),
                                      style: BODY1_REGULAR.copyWith(
                                        fontSize: 12.0 * getFontWidth(context),
                                        color: GRAY040,
                                      ),
                                    ),
                                  ],
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
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 16.0 * getScaleWidth_Max(context),
            bottom: 24.0 * getScaleWidth_Max(context),
          ),
          child: Container(
            width: (16.0 * momsqnaDetail.length) * getScaleWidth(context),
            height: 8.0 * getScaleWidth(context),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: momsqnaDetail.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 4.0 * getScaleWidth(context),
                  ),
                  child: Container(
                    width: 8.0 * getScaleWidth(context),
                    height: 8.0 * getScaleWidth(context),
                    decoration: BoxDecoration(
                        color: mainIndex == index ? GRAY090 : GRAY010,
                        shape: BoxShape.circle),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
