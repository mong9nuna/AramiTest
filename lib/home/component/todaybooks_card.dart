import 'package:arami/common/const/colors.dart';
import 'package:arami/common/const/fonts.dart';
import 'package:arami/common/const/size.dart';
import 'package:arami/parenting/view/parenting_todaybooks_screen.dart';
import 'package:flutter/material.dart';

class TodayBooksCard extends StatefulWidget {
  const TodayBooksCard({Key? key}) : super(key: key);

  @override
  State<TodayBooksCard> createState() => _TodayBooksCardState();
}

class _TodayBooksCardState extends State<TodayBooksCard> {
  bool bookmarkState = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16.0 * getScaleWidth(context),
        right: 16.0 * getScaleWidth(context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 24.0 * getScaleWidth(context),
              bottom: 4.0 * getScaleWidth(context),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '오늘의 책활동',
                  style: TITLE1_BOLD.copyWith(
                    fontSize: 20.0 * getFontWidth(context),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ParentingTodayBooksScreen(),
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
          Padding(
            padding: EdgeInsets.only(
              bottom: 16.0 * getScaleWidth(context),
            ),
            child: Text(
              '아이와 함께 매일매일 새로운 책활동을 해볼까요?',
              style: BODY1_REGULAR.copyWith(
                fontSize: 12.0 * getFontWidth(context),
                color: GRAY050,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ParentingTodayBooksScreen(),
                ),
              );
            },
            child: Container(
              alignment: Alignment.center,
              child: Container(
                width: 328.0 * getScaleWidth_Max(context),
                height: 185.0 * getScaleWidth_Max(context),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    'asset/img/sample/today_books_sample_1.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 8.0 * getScaleWidth(context),
                bottom: 24.0 * getScaleWidth(context)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    '아이와 함께 장난감을 가지고 의사소통을 시작해보세요.',
                    style: BODY3_REGULAR.copyWith(
                      fontSize: 16.0 * getFontWidth(context),
                    ),
                  ),
                ),
                /*
                GestureDetector(
                  onTap: () {
                    print('오늘의 책활동 즐겨찾기 작동');
                    setState(() {
                      bookmarkState = bookmarkState ? false : true;
                    });
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 24.0 * getScaleWidth(context),
                        height: 24.0 * getScaleWidth(context),
                        decoration: BoxDecoration(
                            color: bookmarkState ? MAIN_COLOR : LIGHT_BG2,
                            borderRadius: BorderRadius.circular(4.0)),
                      ),
                      Image.asset(
                        bookmarkState ? 'asset/img/icons/star_icon.png' : 'asset/img/icons/star_icon_2.png',
                        width: 16.0 * getScaleWidth(context),
                        height: 15.32 * getScaleWidth(context),
                      ),
                    ],
                  ),
                )
                */
              ],
            ),
          ),
        ],
      ),
    );
  }
}
