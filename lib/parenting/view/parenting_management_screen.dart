import 'package:arami/common/component/custom_search_bar.dart';
import 'package:arami/common/const/colors.dart';
import 'package:arami/common/const/fonts.dart';
import 'package:arami/common/const/function.dart';
import 'package:arami/common/const/size.dart';
import 'package:arami/common/layout/default_layout.dart';
import 'package:flutter/material.dart';

class ParentingManagementScreen extends StatefulWidget {
  const ParentingManagementScreen({Key? key}) : super(key: key);

  @override
  State<ParentingManagementScreen> createState() =>
      _ParentingManagementScreenState();
}

class _ParentingManagementScreenState extends State<ParentingManagementScreen> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> topSelectItem = [
      {'id': 'dateSetting', 'title': '조회 기간'},
      {'id': 'publicSetting', 'title': '공개 설정'},
      {'id': 'activeSetting', 'title': '활동 범위'},
      {'id': 'childSetting', 'title': '자녀 선택'},
    ];

    return DefaultLayout(
      appbarPointView: false,
      appbarType: true,
      appTitle: '책육아활동',
      logoType: false,
      notiButton: true,
      elevations: 1,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 12.0 * getScaleWidth(context),
              left: 16.0 * getScaleWidth(context),
              right: 16.0 * getScaleWidth(context),
            ),
            child: const CustomSearchBar(hintText: '내용으로 검색해주세요.'),
          ),
          SizedBox(
            height: 8.0 * getScaleWidth(context),
          ),
          SizedBox(
            height: 32.0 * getScaleWidth(context),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: topSelectItem.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: index == 0
                      ? EdgeInsets.only(
                          left: 16.0 * getScaleWidth(context),
                        )
                      : index == topSelectItem.length - 1
                          ? EdgeInsets.only(
                              left: 12.0 * getScaleWidth(context),
                              right: 8.0 * getScaleWidth(context),
                            )
                          : EdgeInsets.only(
                              left: 12.0 * getScaleWidth(context),
                            ),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: GRAY020,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    width: 83.0 * getScaleWidth(context),
                    height: 32.0 * getScaleWidth(context),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          topSelectItem[index]['title'],
                          style: BODY1_BOLD.copyWith(
                            fontSize: 12.0 * getFontWidth(context),
                            color: GRAY090,
                          ),
                        ),
                        SizedBox(
                          width: 4.0 * getScaleWidth(context),
                        ),
                        SizedBox(
                          width: 20.0 * getScaleWidth(context),
                          height: 20.0 * getScaleWidth(context),
                          child: Image.asset(
                            'asset/img/icons/parenting_down_arrow_icon.png',
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 8.0 * getScaleWidth(context),
          ),
          Lines(4.0),
        ],
      ),
    );
  }
}
