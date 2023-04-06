import 'package:arami/common/const/colors.dart';
import 'package:arami/common/const/fonts.dart';
import 'package:arami/common/const/size.dart';
import 'package:arami/common/layout/default_layout.dart';
import 'package:arami/library/view/library_detail_screen.dart';
import 'package:flutter/material.dart';

class LibraryProductDetailScreen extends StatelessWidget {
  const LibraryProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> itemList = {
      'title': '베이비올 아기',
      'detail': '우리 아기 통합 발달 프로그램',
      'count': '30',
      'items': [
        {
          'thumbnail': 'asset/img/sample/free_content_1.png',
          'title': '베이비올 아기',
          'subtitle': '네!네!네!',
        },
        {
          'thumbnail': 'asset/img/sample/free_content_2.png',
          'title': '베이비올 아기',
          'subtitle': '아니오!',
        },
        {
          'thumbnail': 'asset/img/sample/free_content_1.png',
          'title': '베이비올 아기',
          'subtitle': '네!네!네!',
        },
        {
          'thumbnail': 'asset/img/sample/free_content_2.png',
          'title': '베이비올 아기',
          'subtitle': '아니오!',
        },
        {
          'thumbnail': 'asset/img/sample/free_content_1.png',
          'title': '베이비올 아기',
          'subtitle': '네!네!네!',
        },
        {
          'thumbnail': 'asset/img/sample/free_content_2.png',
          'title': '베이비올 아기',
          'subtitle': '아니오!',
        },
      ]
    };

    return DefaultLayout(
      appbarPointView: false,
      appbarType: true,
      logoType: false,
      appTitle: itemList['title'],
      notiButton: true,
      elevations: 1,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0 * getScaleWidth(context)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 120.0 * getScaleWidth(context),
                    height: 90.0 * getScaleWidth(context),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4.0),
                      child: Image.asset('asset/img/sample/free_content_9.jpg'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 16.0 * getScaleWidth(context),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          itemList['title'],
                          style: BODY3_BOLD.copyWith(
                            fontSize: 16.0 * getFontWidth(context),
                            color: GRAY090,
                          ),
                        ),
                        SizedBox(
                          height: 8.0 * getScaleWidth(context),
                        ),
                        Text(
                          itemList['detail'],
                          style: BODY2_REGULAR.copyWith(
                            fontSize: 14.0 * getFontWidth(context),
                            color: GRAY090,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: OUTLINE,
                    width: 1.0,
                  ),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  left: 16.0 * getScaleWidth(context),
                  top: 12.0 * getScaleWidth(context),
                  bottom: 12.0 * getScaleWidth(context),
                ),
                child: Text(
                  "총 ${itemList['count']}권",
                  style: BODY3_BOLD.copyWith(
                    fontSize: 16.0 * getFontWidth(context),
                    color: GRAY020,
                  ),
                ),
              ),
            ),
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0 * getScaleWidth(context),
                ),
                itemCount: itemList['items'].length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: OUTLINE,
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 12.0 * getScaleWidth(context),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => LibraryDetailScreen(),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            SizedBox(
                              width: 72.0 * getScaleWidth(context),
                              height: 90.0 * getScaleWidth(context),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(4.0),
                                child: Image.asset(
                                  itemList['items'][index]['thumbnail'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: 8.0 * getScaleWidth(context),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    itemList['items'][index]['title'],
                                    style: BODY3_BOLD.copyWith(
                                      fontSize: 16.0 * getFontWidth(context),
                                      color: GRAY090,
                                    ),
                                  ),
                                  Text(
                                    itemList['items'][index]['subtitle'],
                                    style: BODY3_REGULAR.copyWith(
                                      fontSize: 16.0 * getFontWidth(context),
                                      color: GRAY090,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
