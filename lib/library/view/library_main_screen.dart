import 'package:arami/common/component/custom_search_bar.dart';
import 'package:arami/common/const/colors.dart';
import 'package:arami/common/const/fonts.dart';
import 'package:arami/common/const/size.dart';
import 'package:arami/common/layout/default_layout.dart';
import 'package:arami/library/component/library_item_card.dart';
import 'package:flutter/material.dart';

class LibraryMainScreen extends StatefulWidget {
  const LibraryMainScreen({Key? key}) : super(key: key);

  @override
  State<LibraryMainScreen> createState() => _LibraryMainScreenState();
}

class _LibraryMainScreenState extends State<LibraryMainScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int tabIndex = 0;

  final List<Map<String, dynamic>> libraryItemList = [
    {
      'items': [
        {
          'title': '베이비올 아기',
          'icon': 'asset/img/sample/library_sample_icon_1.png',
          'details': [
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
              'thumbNail': 'asset/img/sample/free_content_3.jpg',
              'title': '나는야 뿡뿡 변기',
            },
            {
              'thumbNail': 'asset/img/sample/free_content_1.png',
              'title': '돈이 뭐예요?',
            },
          ],
        },
        {
          'title': '아이맘콕',
          'icon': 'asset/img/sample/library_sample_icon_2.png',
          'details': [
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
            {
              'thumbNail': 'asset/img/sample/free_content_2.png',
              'title': '만약 물이 없다면?',
            },
            {
              'thumbNail': 'asset/img/sample/free_content_1.png',
              'title': '돈이 뭐예요?',
            },
          ],
        },
      ],
    },
    {
      'items': [
        {
          'title': '코코아',
          'icon': 'asset/img/sample/library_sample_icon_3.png',
          'details': [
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
            {
              'thumbNail': 'asset/img/sample/free_content_2.png',
              'title': '만약 물이 없다면?',
            },
            {
              'thumbNail': 'asset/img/sample/free_content_1.png',
              'title': '돈이 뭐예요?',
            },
          ],
        },
        {
          'title': '과학특공대',
          'icon': 'asset/img/sample/library_sample_icon_4.png',
          'details': [
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
            {
              'thumbNail': 'asset/img/sample/free_content_2.png',
              'title': '만약 물이 없다면?',
            },
            {
              'thumbNail': 'asset/img/sample/free_content_1.png',
              'title': '돈이 뭐예요?',
            },
          ],
        },
        {
          'title': '지식특공대',
          'icon': 'asset/img/sample/library_sample_icon_5.png',
          'details': [
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
            {
              'thumbNail': 'asset/img/sample/free_content_2.png',
              'title': '만약 물이 없다면?',
            },
            {
              'thumbNail': 'asset/img/sample/free_content_1.png',
              'title': '돈이 뭐예요?',
            },
          ],
        },
      ],
    },
    {
      'items': [
        {
          'title': '경제특공대',
          'icon': 'asset/img/sample/library_sample_icon_6.png',
          'details': [
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
            {
              'thumbNail': 'asset/img/sample/free_content_2.png',
              'title': '만약 물이 없다면?',
            },
            {
              'thumbNail': 'asset/img/sample/free_content_1.png',
              'title': '돈이 뭐예요?',
            },
          ],
        },
        {
          'title': '라라랜드',
          'icon': 'asset/img/sample/library_sample_icon_7.png',
          'details': [
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
            {
              'thumbNail': 'asset/img/sample/free_content_2.png',
              'title': '만약 물이 없다면?',
            },
            {
              'thumbNail': 'asset/img/sample/free_content_1.png',
              'title': '돈이 뭐예요?',
            },
          ],
        },
        {
          'title': '우리아람이',
          'icon': 'asset/img/sample/library_sample_icon_8.png',
          'details': [
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
            {
              'thumbNail': 'asset/img/sample/free_content_2.png',
              'title': '만약 물이 없다면?',
            },
            {
              'thumbNail': 'asset/img/sample/free_content_1.png',
              'title': '돈이 뭐예요?',
            },
          ],
        },
      ],
    },
    {
      'items': [
        {
          'title': '심쿵',
          'icon': 'asset/img/sample/library_sample_icon_9.png',
          'details': [
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
            {
              'thumbNail': 'asset/img/sample/free_content_2.png',
              'title': '만약 물이 없다면?',
            },
            {
              'thumbNail': 'asset/img/sample/free_content_1.png',
              'title': '돈이 뭐예요?',
            },
          ],
        },
        {
          'title': '그리스로마신화',
          'icon': 'asset/img/sample/library_sample_icon_10.png',
          'details': [
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
            {
              'thumbNail': 'asset/img/sample/free_content_2.png',
              'title': '만약 물이 없다면?',
            },
            {
              'thumbNail': 'asset/img/sample/free_content_1.png',
              'title': '돈이 뭐예요?',
            },
          ],
        },
        {
          'title': '참똑똑한사회씨',
          'icon': 'asset/img/sample/library_sample_icon_11.png',
          'details': [
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
            {
              'thumbNail': 'asset/img/sample/free_content_2.png',
              'title': '만약 물이 없다면?',
            },
            {
              'thumbNail': 'asset/img/sample/free_content_1.png',
              'title': '돈이 뭐예요?',
            },
          ],
        },
      ],
    },
    {
      'items': [
        {
          'title': '베이비올 명화음악',
          'icon': 'asset/img/sample/library_sample_icon_12.png',
          'details': [
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
            {
              'thumbNail': 'asset/img/sample/free_content_2.png',
              'title': '만약 물이 없다면?',
            },
            {
              'thumbNail': 'asset/img/sample/free_content_1.png',
              'title': '돈이 뭐예요?',
            },
          ],
        },
        {
          'title': '베이비올 아기',
          'icon': 'asset/img/sample/library_sample_icon_1.png',
          'details': [
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
            {
              'thumbNail': 'asset/img/sample/free_content_2.png',
              'title': '만약 물이 없다면?',
            },
            {
              'thumbNail': 'asset/img/sample/free_content_1.png',
              'title': '돈이 뭐예요?',
            },
          ],
        },
        {
          'title': '아이맘콕',
          'icon': 'asset/img/sample/library_sample_icon_2.png',
          'details': [
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
            {
              'thumbNail': 'asset/img/sample/free_content_2.png',
              'title': '만약 물이 없다면?',
            },
            {
              'thumbNail': 'asset/img/sample/free_content_1.png',
              'title': '돈이 뭐예요?',
            },
          ],
        },
      ],
    },
  ];

  @override
  void initState() {
    tabController = TabController(initialIndex: 0, length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final ScrollController _scrollController = ScrollController();

    void _scrollToTop() {
      setState(() {
        _scrollController.animateTo(0, duration: const Duration(milliseconds: 500), curve: Curves.ease);
      });
    }

    List<Widget> tabs = [
      Tab(
        height: 50.0 * getScaleWidth(context),
        child: Container(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(
              bottom: 8.0 * getScaleWidth(context),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                right: 10.0 * getScaleWidth(context),
                left: 10.0 * getScaleWidth(context),
              ),
              child: const Text(
                '전체',
              ),
            ),
          ),
        ),
      ),
      Tab(
        height: 50.0 * getScaleWidth(context),
        child: Container(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(
              bottom: 8.0 * getScaleWidth(context),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                right: 10.0 * getScaleWidth(context),
                left: 10.0 * getScaleWidth(context),
              ),
              child: const Text(
                '베이비올',
              ),
            ),
          ),
        ),
      ),
      Tab(
        height: 50.0 * getScaleWidth(context),
        child: Container(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(
              bottom: 8.0 * getScaleWidth(context),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                right: 10.0 * getScaleWidth(context),
                left: 10.0 * getScaleWidth(context),
              ),
              child: const Text(
                '키즈올',
              ),
            ),
          ),
        ),
      ),
      Tab(
        height: 50.0 * getScaleWidth(context),
        child: Container(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(
              bottom: 8.0 * getScaleWidth(context),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                right: 10.0 * getScaleWidth(context),
                left: 10.0 * getScaleWidth(context),
              ),
              child: const Text(
                '스쿨',
              ),
            ),
          ),
        ),
      ),
      Tab(
        height: 50.0 * getScaleWidth(context),
        child: Container(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(
              bottom: 8.0 * getScaleWidth(context),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                right: 10.0 * getScaleWidth(context),
                left: 10.0 * getScaleWidth(context),
              ),
              child: const Text(
                '소전집',
              ),
            ),
          ),
        ),
      ),
    ];

    return DefaultLayout(
      elevations: 0,
      appbarPointView: false,
      appbarType: false,
      logoType: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 360 * getScaleWidth_Max(context),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 1,
                  color: OUTLINE,
                ),
              ),
            ),
            child: TabBar(
              labelPadding: const EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              isScrollable: MediaQuery.of(context).size.width > 500 ? false : true,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width: 2, color: MAIN_COLOR),
              ),
              labelColor: MAIN_COLOR,
              unselectedLabelColor: GRAY020,
              labelStyle: BODY3_BOLD.copyWith(
                fontSize: 14.0 * getScaleWidth(context),
              ),
              unselectedLabelStyle: BODY3_BOLD.copyWith(
                fontSize: 14.0 * getScaleWidth(context),
                color: GRAY020,
              ),
              tabs: tabs,
              controller: tabController,
              onTap: (value) {
                setState(() {
                  tabIndex = tabController.index;
                  _scrollToTop();
                });
              },
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15.0 * getScaleWidth(context),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 16.0 * getScaleWidth(context),
                      right: 16.0 * getScaleWidth(context),
                    ),
                    child: const CustomSearchBar(
                      hintText: '전집 이름이나 책 이름으로 검색하세요!',
                    ),
                  ),
                  if (tabIndex == 0)
                    Padding(
                      padding: EdgeInsets.only(
                        left: 16.0 * getScaleWidth(context),
                        top: 24.0 * getScaleWidth(context),
                      ),
                      child: Text(
                        '내 전집 콘텐츠',
                        style: TITLE1_BOLD.copyWith(
                          fontSize: 20.0 * getFontWidth(context),
                          color: GRAY090,
                        ),
                      ),
                    ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: libraryItemList[tabIndex]['items'].length,
                    itemBuilder: (BuildContext context, int index) {
                      return LibraryItemCard(
                        itemList: libraryItemList[tabIndex]['items'][index],
                      );
                    },
                  ),
                  if (tabIndex == 0)
                  Column(
                    children: [
                      SizedBox(
                        child: Container(
                          height: 78.0 * getScaleWidth(context),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.0 * getScaleWidth(context),
                            ),
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '메이킹북 리스트',
                                  style: TITLE1_BOLD.copyWith(
                                    fontSize: 20.0 * getFontWidth(context),
                                    color: GRAY090,
                                  ),
                                ),
                                Text(
                                  '더보기 +',
                                  style: BODY1_REGULAR.copyWith(
                                    fontSize: 12.0 * getFontWidth(context),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.0 * getScaleWidth(context),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: MAIN_COLOR_OP10,
                          ),
                          width: 328.0 * getScaleWidth_Max(context),
                          height: 100.0 * getScaleWidth(context),
                          child: Text(
                            '아이와 함께 메이킹북을 만들어보세요!',
                            style: BODY3_BOLD.copyWith(
                              fontSize: 16.0 * getFontWidth(context),
                              color: MAIN_COLOR,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0 * getScaleWidth(context),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
