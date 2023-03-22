import 'package:arami/common/component/custom_tab.dart';
import 'package:arami/common/const/colors.dart';
import 'package:arami/common/const/fonts.dart';
import 'package:arami/common/const/size.dart';
import 'package:arami/common/layout/default_layout.dart';
import 'package:flutter/material.dart';

import '../../common/component/custom_search_bar.dart';

class ParentingParentaleduScreen extends StatefulWidget {
  final int initialIndex;

  const ParentingParentaleduScreen({
    required this.initialIndex,
    Key? key,
  }) : super(key: key);

  @override
  State<ParentingParentaleduScreen> createState() =>
      _ParentingParentaleduScreenState();
}

class _ParentingParentaleduScreenState
    extends State<ParentingParentaleduScreen> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> parentaleduItem = [
      {
        'id': '001',
        'title': '특집 부모교육 시리즈 1편 특집 부모교육 시리즈 1편',
        'thumbNail': 'asset/img/sample/parentaledu_sample_1.png',
      },
      {
        'id': '002',
        'title': '영유아의 행복과 인권은 존중되어야 해요',
        'thumbNail': 'asset/img/sample/parentaledu_sample_2.png',
      },
      {
        'id': '003',
        'title': '하녀육아 벗어나는 방법',
        'thumbNail': 'asset/img/sample/parentaledu_sample_3.png',
      },
      {
        'id': '004',
        'title': '절대 휘둘리지 않는 방법',
        'thumbNail': 'asset/img/sample/parentaledu_sample_4.png',
      }
    ];
    final List<Map<String, dynamic>> cardnewsItem = [
      {
        'id': '001',
        'thumbnail': 'asset/img/sample/parenting_cardnews_sample.png',
      },
      {
        'id': '002',
        'thumbnail': 'asset/img/sample/parenting_cardnews_sample.png',
      },
      {
        'id': '003',
        'thumbnail': 'asset/img/sample/parenting_cardnews_sample.png',
      },
      {
        'id': '001',
        'thumbnail': 'asset/img/sample/parenting_cardnews_sample.png',
      },
      {
        'id': '002',
        'thumbnail': 'asset/img/sample/parenting_cardnews_sample.png',
      },
      {
        'id': '003',
        'thumbnail': 'asset/img/sample/parenting_cardnews_sample.png',
      },
      {
        'id': '001',
        'thumbnail': 'asset/img/sample/parenting_cardnews_sample.png',
      },
      {
        'id': '002',
        'thumbnail': 'asset/img/sample/parenting_cardnews_sample.png',
      },
      {
        'id': '003',
        'thumbnail': 'asset/img/sample/parenting_cardnews_sample.png',
      },
      {
        'id': '001',
        'thumbnail': 'asset/img/sample/parenting_cardnews_sample.png',
      },
      {
        'id': '002',
        'thumbnail': 'asset/img/sample/parenting_cardnews_sample.png',
      },
      {
        'id': '003',
        'thumbnail': 'asset/img/sample/parenting_cardnews_sample.png',
      },
      {
        'id': '001',
        'thumbnail': 'asset/img/sample/parenting_cardnews_sample.png',
      },
      {
        'id': '002',
        'thumbnail': 'asset/img/sample/parenting_cardnews_sample.png',
      },
      {
        'id': '003',
        'thumbnail': 'asset/img/sample/parenting_cardnews_sample.png',
      },
      {
        'id': '001',
        'thumbnail': 'asset/img/sample/parenting_cardnews_sample.png',
      },
      {
        'id': '002',
        'thumbnail': 'asset/img/sample/parenting_cardnews_sample.png',
      },
      {
        'id': '003',
        'thumbnail': 'asset/img/sample/parenting_cardnews_sample.png',
      },
      {
        'id': '001',
        'thumbnail': 'asset/img/sample/parenting_cardnews_sample.png',
      },
      {
        'id': '002',
        'thumbnail': 'asset/img/sample/parenting_cardnews_sample.png',
      },
      {
        'id': '003',
        'thumbnail': 'asset/img/sample/parenting_cardnews_sample.png',
      },
      {
        'id': '001',
        'thumbnail': 'asset/img/sample/parenting_cardnews_sample.png',
      },
      {
        'id': '002',
        'thumbnail': 'asset/img/sample/parenting_cardnews_sample.png',
      },
      {
        'id': '003',
        'thumbnail': 'asset/img/sample/parenting_cardnews_sample.png',
      },
    ];

    List<Widget> tabs = [
      Tab(
        height: 50.0 * getScaleWidth_Max(context),
        child: Container(
          width: 132.0 * getScaleWidth(context),
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(
              //top: 8.0 * getScaleWidth(context),
              bottom: 8.0 * getScaleWidth(context),
            ),
            child: const Text(
              '부모특강',
            ),
          ),
        ),
      ),
      Tab(
        height: 50.0 * getScaleWidth_Max(context),
        child: Container(
          width: 132.0 * getScaleWidth(context),
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(
              //top: 8.0 * getScaleWidth(context),
              bottom: 8.0 * getScaleWidth(context),
            ),
            child: const Text(
              '카드뉴스',
            ),
          ),
        ),
      ),
    ];

    List<Widget> tabView = [
      Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0 * getScaleWidth(context),
                  vertical: 12.0 * getScaleWidth(context),
                ),
                child: const CustomSearchBar(
                  hintText: '질문이나 내용으로 검색해주세요.',
                ),
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: parentaleduItem.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.0 * getScaleWidth(context),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        print('영상 아이디 : ${parentaleduItem[index]['id']}작동');
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 328.0 * getScaleWidth(context),
                            height: 185.0 * getScaleWidth(context),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                parentaleduItem[index]['thumbNail'],
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 8.0 * getScaleWidth(context),
                              bottom: 16.0 * getScaleWidth(context),
                            ),
                            child: SizedBox(
                              width: 328.0 * getScaleWidth(context),
                              child: Text(
                                parentaleduItem[index]['title'],
                                style: BODY3_REGULAR.copyWith(
                                  fontSize: 16.0 * getFontWidth(context),
                                  color: GRAY090,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0 * getScaleWidth(context),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 12.0 * getScaleWidth(context),
                  ),
                  child: const CustomSearchBar(
                    hintText: '질문이나 내용으로 검색해주세요.',
                  ),
                ),
                GridView.builder(
                  itemCount: cardnewsItem.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1,
                    mainAxisSpacing: 8.0 * getScaleWidth_Max(context),
                    crossAxisSpacing: 8.0 * getScaleWidth_Max(context),
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: (){
                        print('${parentaleduItem[index]['id']} 들어가기');
                      },
                      child: SizedBox(
                        width: 104.0 * getScaleWidth_Max(context),
                        height: 104.0 * getScaleWidth_Max(context),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4.0),
                          child: Image.asset(cardnewsItem[index]['thumbnail']),
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    ];

    return DefaultLayout(
      appbarPointView: false,
      appbarType: true,
      logoType: false,
      appTitle: '부모교육',
      elevations: 1,
      notiButton: true,
      child: CustomTab(
        length: 2,
        initialIndex: widget.initialIndex,
        labelStyle: BODY3_BOLD.copyWith(
          fontSize: 16.0 * getFontWidth(context),
          color: MAIN_COLOR,
        ),
        unselectedLabelStyle: BODY3_BOLD.copyWith(
          fontSize: 16.0 * getFontWidth(context),
          color: GRAY020,
        ),
        tabs: tabs,
        tabView: tabView,
      ),
    );
  }
}
