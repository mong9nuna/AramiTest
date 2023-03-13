import 'package:arami/common/const/colors.dart';
import 'package:arami/common/const/fonts.dart';
import 'package:arami/common/const/size.dart';
import 'package:flutter/material.dart';

class LibraryDetailAllbooksScreen extends StatelessWidget {
  const LibraryDetailAllbooksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String count = '46';

    List<Map<String, dynamic>> itemList = [
      {
        'thumbNail': 'asset/img/sample/free_content_3.jpg',
        'title': '할 수 있어!',
      },
      {
        'thumbNail': 'asset/img/sample/free_content_2.png',
        'title': '만약 물이 없다면?',
      },
      {
        'thumbNail': 'asset/img/sample/free_content_1.png',
        'title': '돈이 뭐예요?',
      },
      {
        'thumbNail': 'asset/img/sample/free_content_2.png',
        'title': '만약 물이 없다면?',
      },
      {
        'thumbNail': 'asset/img/sample/free_content_1.png',
        'title': '돈이 뭐예요?',
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 32.0 * getScaleWidth(context),
            left: 16.0 * getScaleWidth(context),
            bottom: 16.0 * getScaleWidth(context),
          ),
          child: Text(
            '전집 내 다른 책 둘러보기',
            style: TITLE1_BOLD.copyWith(
              fontSize: 20.0 * getFontWidth(context),
              color: GRAY090,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 16.0 * getScaleWidth(context),
            left: 16.0 * getScaleWidth(context),
            bottom: 8.0 * getScaleWidth(context),
          ),
          child: Text(
            '총 $count권',
            style: BODY3_REGULAR.copyWith(
              fontSize: 16.0 * getFontWidth(context),
              color: GRAY090,
            ),
          ),
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: itemList.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.0 * getScaleWidth(context),
              ),
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: OUTLINE,
                    ),
                  ),
                ),
                height: 114.0 * getScaleWidth(context),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          border: Border.all(
                            width: 1.0,
                            color: GRAY010,
                          )),
                      width: 72.0 * getScaleWidth(context),
                      height: 90.0 * getScaleWidth(context),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4.0),
                        child: Image.asset(itemList[index]['thumbNail']),
                      ),
                    ),
                    SizedBox(
                      width: 16.0 * getScaleWidth(context),
                    ),
                    Text(
                      itemList[index]['title'],
                      style: BODY3_BOLD.copyWith(
                        fontSize: 16.0 * getFontWidth(context),
                        color: GRAY090,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
