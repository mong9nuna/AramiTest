import 'package:arami/common/const/colors.dart';
import 'package:arami/common/const/fonts.dart';
import 'package:arami/common/const/size.dart';
import 'package:flutter/material.dart';

class StepBooksCard extends StatefulWidget {
  const StepBooksCard({Key? key}) : super(key: key);

  @override
  State<StepBooksCard> createState() => _StepBooksCardState();
}

class _StepBooksCardState extends State<StepBooksCard> {
  int selectMenu = 0;
  List<String> menu = [
    '전체',
    '베이비올',
    '키즈올',
    '스쿨',
  ];

  final List<Map<String, dynamic>> stepBooks = [
    {
      'item': [
        {
          'thumbNail': 'asset/img/sample/step_sample_1.png',
          'title': '뮤직컬 세계 창작 그램책 라라랜드',
        },
        {
          'thumbNail': 'asset/img/sample/step_sample_2.png',
          'title': '베이비올 명화음악',
        },
        {
          'thumbNail': 'asset/img/sample/step_sample_3.png',
          'title': '베이비올 수과학',
        },
        {
          'thumbNail': 'asset/img/sample/step_sample_4.png',
          'title': '코코아 세계창작',
        },
        {
          'thumbNail': 'asset/img/sample/step_sample_5.png',
          'title': '베이비올 영어',
        },
      ]
    },
    {
      'item': [
        {
          'thumbNail': 'asset/img/sample/step_sample_1.png',
          'title': 'Hi, 베이비올 아기1',
        },
        {
          'thumbNail': 'asset/img/sample/step_sample_2.png',
          'title': '베이비올 명화음악',
        },
        {
          'thumbNail': 'asset/img/sample/step_sample_3.png',
          'title': '베이비올 수과학',
        },
        {
          'thumbNail': 'asset/img/sample/step_sample_4.png',
          'title': '코코아 세계창작',
        },
        {
          'thumbNail': 'asset/img/sample/step_sample_5.png',
          'title': '베이비올 영어',
        },
      ]
    },
    {
      'item': [
        {
          'thumbNail': 'asset/img/sample/step_sample_1.png',
          'title': 'Hi, 베이비올 아기2',
        },
        {
          'thumbNail': 'asset/img/sample/step_sample_2.png',
          'title': '베이비올 명화음악',
        },
        {
          'thumbNail': 'asset/img/sample/step_sample_3.png',
          'title': '베이비올 수과학',
        },
        {
          'thumbNail': 'asset/img/sample/step_sample_4.png',
          'title': '코코아 세계창작',
        },
        {
          'thumbNail': 'asset/img/sample/step_sample_5.png',
          'title': '베이비올 영어',
        },
      ]
    },
    {
      'item': [
        {
          'thumbNail': 'asset/img/sample/step_sample_1.png',
          'title': 'Hi, 베이비올 아기3',
        },
        {
          'thumbNail': 'asset/img/sample/step_sample_2.png',
          'title': '베이비올 명화음악',
        },
        {
          'thumbNail': 'asset/img/sample/step_sample_3.png',
          'title': '베이비올 수과학',
        },
        {
          'thumbNail': 'asset/img/sample/step_sample_4.png',
          'title': '코코아 세계창작',
        },
        {
          'thumbNail': 'asset/img/sample/step_sample_5.png',
          'title': '베이비올 영어',
        },
      ]
    },
    {
      'item': [
        {
          'thumbNail': 'asset/img/sample/step_sample_1.png',
          'title': 'Hi, 베이비올 아기4',
        },
        {
          'thumbNail': 'asset/img/sample/step_sample_2.png',
          'title': '베이비올 명화음악',
        },
        {
          'thumbNail': 'asset/img/sample/step_sample_3.png',
          'title': '베이비올 수과학',
        },
        {
          'thumbNail': 'asset/img/sample/step_sample_4.png',
          'title': '코코아 세계창작',
        },
        {
          'thumbNail': 'asset/img/sample/step_sample_5.png',
          'title': '베이비올 영어',
        },
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();

    void _scrollToTop() {
      setState(() {
        _scrollController.animateTo(0, duration: const Duration(milliseconds: 500), curve: Curves.ease);
      });
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: 16.0 * getScaleWidth(context),
            top: 32.0 * getScaleWidth(context),
            bottom: 16.0 * getScaleWidth(context),
          ),
          child: Text(
            '단계별 전집 모아보기',
            style: TITLE1_BOLD.copyWith(
              fontSize: 20.0 * getScaleWidth(context),
            ),
          ),
        ),
        Container(
          height: 40.0 * getScaleWidth(context),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: menu.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                  padding: index == 0
                      ? EdgeInsets.only(
                          left: 16.0 * getScaleWidth(context),
                          right: 6.0 * getScaleWidth(context),
                        )
                      : EdgeInsets.symmetric(
                          horizontal: 6.0 * getScaleWidth(context)),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        print('단계별 전집 변경');
                        selectMenu = index;
                        _scrollToTop();
                      });
                    },
                    child: selectMenu == index
                        ? menuItem(index, true)
                        : menuItem(index, false),
                  ));
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            vertical: 16.0 * getScaleWidth(context),
          ),
          child: SizedBox(
            height: 176.0 * getScaleWidth(context),
            child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: stepBooks[selectMenu]['item'].length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: index == 0
                      ? EdgeInsets.only(
                          left: 16.0 * getScaleWidth(context),
                          right: 8.0 * getScaleWidth(context),
                        )
                      : EdgeInsets.symmetric(
                          horizontal: 8.0 * getScaleWidth(context)),
                  child: SizedBox(
                    width: 120.0 * getScaleWidth(context),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 120.0 * getScaleWidth(context),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.asset(stepBooks[selectMenu]['item']
                                [index]['thumbNail']),
                          ),
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          stepBooks[selectMenu]['item'][index]['title'],
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          softWrap: false,
                          style: BODY3_BOLD.copyWith(
                            fontSize: 14.0 * getScaleWidth(context),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }

  Container menuItem(int index, bool select) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: select ? MAIN_COLOR : WHITE,
        borderRadius: BorderRadius.circular(40.0),
        border: Border.all(
          width: 1.0,
          color: select ? WHITE : MAIN_COLOR,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 8.0 * getScaleWidth(context),
          horizontal: 20.0 * getScaleWidth(context),
        ),
        child: Text(
          menu[index],
          style: BODY3_REGULAR.copyWith(
            fontSize: 16.0 * getFontWidth(context),
            color: select ? WHITE : MAIN_COLOR,
          ),
        ),
      ),
    );
  }
}
