import 'package:arami/common/component/custom_drop_down.dart';
import 'package:arami/common/component/point_list_card.dart';
import 'package:arami/common/const/colors.dart';
import 'package:arami/common/const/fonts.dart';
import 'package:arami/common/const/size.dart';
import 'package:arami/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class PointScreen extends StatefulWidget {
  const PointScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<PointScreen> createState() => _PointScreenState();
}

class _PointScreenState extends State<PointScreen> {
  late HomeProvider _homeProvider;
  String statusCode = '00';
  List<Map<String, dynamic>> pointList = [];

  @override
  Widget build(BuildContext context) {
    _homeProvider = Provider.of<HomeProvider>(context);
    final List<Map<String, dynamic>> itemList = [
      {
        'statusCode': '00',
        'title': '전체',
        'itemList': [
          {
            'date': '2023-02-26',
            'details': [
              {
                'title': '출석하기',
                'point': '10',
              },
              {
                'title': '활동 일지 쓰기',
                'point': '20',
              },
              {
                'title': '전집 구매',
                'point': '1000',
              },
            ],
          },
          {
            'date': '2023-02-26',
            'details': [
              {
                'title': '출석하기',
                'point': '10',
              },
              {
                'title': '활동 일지 쓰기',
                'point': '20',
              },
              {
                'title': '전집 구매',
                'point': '1000',
              },
            ],
          },
          {
            'date': '2023-02-26',
            'details': [
              {
                'title': '출석하기',
                'point': '10',
              },
              {
                'title': '활동 일지 쓰기',
                'point': '20',
              },
              {
                'title': '전집 구매',
                'point': '1000',
              },
            ],
          },
          {
            'date': '2023-02-25',
            'details': [
              {
                'title': '출석하기',
                'point': '10',
              },
              {
                'title': '활동 일지 쓰기',
                'point': '20',
              },
            ],
          },
          {
            'date': '2023-02-24',
            'details': [
              {
                'title': '출석하기',
                'point': '10',
              },
              {
                'title': '활동 일지 쓰기',
                'point': '20',
              },
            ],
          },
          {
            'date': '2023-02-23',
            'details': [
              {
                'title': '출석하기',
                'point': '10',
              },
              {
                'title': '활동 일지 쓰기',
                'point': '20',
              },
            ],
          },
        ],
      },
      {
        'statusCode': '01',
        'title': '적립',
        'itemList': [
          {
            'date': '2023-02-26',
            'details': [
              {
                'title': '적립 출석하기',
                'point': '10',
              },
              {
                'title': '활동 일지 쓰기',
                'point': '20',
              },
              {
                'title': '전집 구매',
                'point': '1000',
              },
            ],
          },
        ],
      },
      {
        'statusCode': '02',
        'title': '사용',
        'itemList': [
          {
            'date': '2023-02-26',
            'details': [
              {
                'title': '사용 출석하기',
                'point': '10',
              },
              {
                'title': '활동 일지 쓰기',
                'point': '20',
              },
              {
                'title': '전집 구매',
                'point': '1000',
              },
            ],
          },
        ],
      },
    ];

    if (pointList.isEmpty) {
      print('포인트 : ${pointList.length}');
      pointList = itemList[0]['itemList'];
      print('포인트 후 : ${pointList.length}');
    }

    // 드롭다운 해제.
    void _removeOverlay() {
      setState(
        () {
          if (_homeProvider.overlayEntry != null) {
            _homeProvider.overlayEntry?.remove();
            _homeProvider.overlayEntry = null;
            _homeProvider.iconFlag = true;
          }
        },
      );
    }

    const int totalPoint = 1230;
    return GestureDetector(
      onTap: () {
        _removeOverlay();
      },
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 110.0 * getScaleWidth_Max(context),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0 * getScaleWidth_Max(context),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 24.0 * getScaleWidth_Max(context),
                        bottom: 4.0 * getScaleWidth_Max(context),
                      ),
                      child: Text(
                        '총 포인트',
                        style: BODY2_REGULAR.copyWith(
                          fontSize: 14.0 * getFontWidth(context),
                          color: GRAY050,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 24.0 * getScaleWidth_Max(context),
                      ),
                      child: Text(
                        '${NumberFormat('###,###,###,###').format(totalPoint)} P',
                        style: TITLE2_BOLD.copyWith(
                          fontSize: 24.0 * getFontWidth(context),
                          color: GRAY090,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 8.0,
              color: LIGHT_BG2,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 16.0 * getScaleWidth(context),
                    top: 11.0 * getScaleWidth(context),
                    bottom: 11.0 * getScaleWidth(context),
                  ),
                  child: CustomDropDown(
                    itemList: itemList,
                    itemChange: (value) {
                      setState(
                        () {
                          for (int i = 0; i < itemList.length; i++) {
                            if (itemList[i]['statusCode'] == value) {
                              pointList = itemList[i]['itemList'];
                            }
                          }
                          //print('실행 ${value}');
                        },
                      );
                    },
                  ),
                ),
                PointListCard(
                  itemList: pointList,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
