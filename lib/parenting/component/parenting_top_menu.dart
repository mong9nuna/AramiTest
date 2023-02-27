import 'package:arami/common/const/colors.dart';
import 'package:arami/common/const/fonts.dart';
import 'package:arami/common/const/size.dart';
import 'package:flutter/material.dart';

class ParentingTopMenu extends StatelessWidget {
  const ParentingTopMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> parentingTopMenu = [
      {
        'title': '책육아활동',
        'thumbNail': 'asset/img/icons/parenting_management_icon.png',
      },
      {
        'title': '기질검사',
        'thumbNail': 'asset/img/icons/parenting_temperament_test_icon.png',
      },
      {
        'title': '부모교육',
        'thumbNail': 'asset/img/icons/parenting_parentaledu_icon.png',
      },
      {
        'title': '맘 Q&A',
        'thumbNail': 'asset/img/icons/parenting_momsqna_icon.png',
      },
      /*{
        'title': '도와줘요 박사님',
        'thumbNail': 'asset/img/icons/parenting_pro_icon.png',
      },*/
    ];

    return Container(
      height: 94.0 * getScaleWidth(context),
      child: ListView.builder(
        padding: EdgeInsets.only(
          top: 16.0 * getScaleWidth(context),
          bottom: 16.0 * getScaleWidth(context),
        ),
        scrollDirection: Axis.horizontal,
        itemCount: parentingTopMenu.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: (){
              print('${parentingTopMenu[index]['title']} 작동');
            },
            child: Padding(
              padding: index == 0
                  ? EdgeInsets.only(
                left: 24.0 * getScaleWidth(context),
                right: 8.5 * getScaleWidth(context),
              )
                  : EdgeInsets.symmetric(
                  horizontal: 8.5 * getScaleWidth(context)),
              child: Container(
                width: 65.0 * getScaleWidth(context),
                child: Column(
                  children: [
                    Container(
                      width: 32.0 * getScaleWidth(context),
                      height: 32.0 * getScaleWidth(context),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: MAIN_COLOR,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Image.asset(
                          parentingTopMenu[index]['thumbNail'],
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 8.0 * getScaleWidth(context),
                      ),
                      child: Text(
                        parentingTopMenu[index]['title'],
                        style: BODY2_REGULAR.copyWith(
                          fontSize: 14.0 * getFontWidth(context),
                          color: GRAY090,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
