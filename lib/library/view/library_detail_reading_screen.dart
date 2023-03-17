import 'package:arami/common/component/custom_download_dialog.dart';
import 'package:arami/common/const/colors.dart';
import 'package:arami/common/const/fonts.dart';
import 'package:arami/common/const/size.dart';
import 'package:flutter/material.dart';

class LibraryDetailReadingScreen extends StatefulWidget {
  const LibraryDetailReadingScreen({Key? key}) : super(key: key);

  @override
  State<LibraryDetailReadingScreen> createState() =>
      _LibraryDetailReadingScreenState();
}

class _LibraryDetailReadingScreenState
    extends State<LibraryDetailReadingScreen> {
  List<Map<String, dynamic>> itemList = [
    {
      'id': 'file01',
      'mainTitle': '아이와 함께 장난감을_1',
      'date': '2023-01-09',
      'file': 'https://www.arambooks.com/upload/activitybook_1.pdf',
      'originFileName': '활동지',
      'download': 'false',
      'innerFilePath' : '',
    },
    {
      'id': 'file02',
      'mainTitle': '아이와 함께 장난감을_2',
      'date': '2023-01-09',
      'file': 'https://www.arambooks.com/upload/activitybook_1.pdf',
      'originFileName': '활동지2',
      'download': 'false',
      'innerFilePath' : '',
    },
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
            '활동지',
            style: TITLE1_BOLD.copyWith(
              fontSize: 20.0 * getFontWidth(context),
              color: GRAY090,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.0 * getScaleWidth(context),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '영역 : 의사소통, 기본생활',
                style: BODY3_BOLD.copyWith(
                  fontSize: 16.0 * getFontWidth(context),
                  color: GRAY090,
                ),
              ),
              SizedBox(
                height: 8.0 * getScaleWidth(context),
              ),
              Text(
                '다중지능 : 자기이해, 대인관계지능',
                style: BODY2_REGULAR.copyWith(
                  fontSize: 14.0 * getFontWidth(context),
                  color: GRAY020,
                ),
              ),
              SizedBox(
                height: 24.0 * getScaleWidth(context),
              ),
              Text(
                '‘네! 네! 네!’ 는 아이들이 자신의 장난감을 수레 담으면서 물체에 대한 이름을 익히고 의사소통을 합니다. 자신의 물건에 대한 정리 정돈 습관을 배우게 됩니다.',
                style: BODY3_REGULAR.copyWith(
                  fontSize: 16.0 * getFontWidth(context),
                  color: GRAY090,
                ),
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CustomDownloadDialog(
                          itemList: itemList,
                        );
                      });
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
            ],
          ),
        )
      ],
    );
  }
}