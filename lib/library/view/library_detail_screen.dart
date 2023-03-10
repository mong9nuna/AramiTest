import 'package:arami/common/const/colors.dart';
import 'package:arami/common/const/fonts.dart';
import 'package:arami/common/const/size.dart';
import 'package:arami/common/layout/default_layout.dart';
import 'package:arami/library/view/library_detail_activity_log_screen.dart';
import 'package:arami/library/view/library_detail_allbooks_screen.dart';
import 'package:arami/library/view/library_detail_linked_screen.dart';
import 'package:arami/library/view/library_detail_reading_screen.dart';
import 'package:flutter/material.dart';

import 'library_makingbook_screen.dart';

class LibraryDetailScreen extends StatefulWidget {
  const LibraryDetailScreen({Key? key}) : super(key: key);

  @override
  State<LibraryDetailScreen> createState() => _LibraryDetailScreenState();
}

class _LibraryDetailScreenState extends State<LibraryDetailScreen>
    with SingleTickerProviderStateMixin {
  final Map<String, dynamic> libraryItem = {
    'id': 'detail01',
    'thumbNail': 'asset/img/sample/free_content_2.png',
    'title': '과학특공대',
    'detailTitle': '만약 물이 없다면?',
    'tags': [
      '전집',
      '의사소통',
      '자연탐구',
      '물',
      '지구',
      '생태계',
      '바다',
      '자연탐구',
    ],
  };

  late TabController tabController;
  int tabIndex = 0;

  @override
  void initState() {
    tabController = TabController(initialIndex: 0, length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();

    void _scrollToTop() {
      setState(() {
        _scrollController.animateTo(0,
            duration: const Duration(milliseconds: 500), curve: Curves.ease);
      });
    }

    List<Widget> tabs = [
      Tab(
        height: 50.0 * getScaleWidth_Max(context),
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
                '전체 전집',
              ),
            ),
          ),
        ),
      ),
      Tab(
        height: 50.0 * getScaleWidth_Max(context),
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
                '독후활동',
              ),
            ),
          ),
        ),
      ),
      Tab(
        height: 50.0 * getScaleWidth_Max(context),
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
                '연계독서',
              ),
            ),
          ),
        ),
      ),
      Tab(
        height: 50.0 * getScaleWidth_Max(context),
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
                '활동일지',
              ),
            ),
          ),
        ),
      ),
    ];

    return DefaultLayout(
      appbarPointView: false,
      appbarType: true,
      logoType: false,
      elevations: 1,
      notiButton: true,
      appTitle: '라이브러리',
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(
                16.0 * getScaleWidth(context),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 100.0 * getScaleWidth(context),
                    height: 125.0 * getScaleWidth(context),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4.0),
                      child: Image.asset(
                        libraryItem['thumbNail'],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16.0 * getScaleWidth(context),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        libraryItem['title'],
                        style: BODY3_BOLD.copyWith(
                          fontSize: 16.0 * getScaleWidth(context),
                          color: GRAY090,
                        ),
                      ),
                      SizedBox(
                        height: 8.0 * getScaleWidth(context),
                      ),
                      Text(
                        libraryItem['detailTitle'],
                        style: BODY2_REGULAR.copyWith(
                          fontSize: 14.0 * getScaleWidth(context),
                          color: GRAY090,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.0 * getScaleWidth(context),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsets.only(right: 8.0 * getScaleWidth(context)),
                      child: Container(
                        height: 60.0 * getScaleWidth(context),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: MAIN_COLOR_OP10,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 20.0 * getScaleWidth(context),
                              height: 20.0 * getScaleWidth(context),
                              child: Image.asset(
                                  'asset/img/icons/library_music_icon.png'),
                            ),
                            Text(
                              '음원',
                              style: BODY1_BOLD.copyWith(
                                fontSize: 12.0 * getFontWidth(context),
                                color: MAIN_COLOR,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                          EdgeInsets.only(right: 8.0 * getScaleWidth(context)),
                      child: Container(
                        height: 60.0 * getScaleWidth(context),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: MAIN_COLOR_OP10,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 20.0 * getScaleWidth(context),
                              height: 20.0 * getScaleWidth(context),
                              child: Image.asset(
                                  'asset/img/icons/library_video_icon.png'),
                            ),
                            Text(
                              '영상',
                              style: BODY1_BOLD.copyWith(
                                fontSize: 12.0 * getFontWidth(context),
                                color: MAIN_COLOR,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        _showDialog();
                      },
                      child: Container(
                        height: 60.0 * getScaleWidth(context),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: MAIN_COLOR_OP10,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 20.0 * getScaleWidth(context),
                              height: 20.0 * getScaleWidth(context),
                              child: Image.asset(
                                  'asset/img/icons/library_making_icon.png'),
                            ),
                            Text(
                              '메이킹북',
                              style: BODY1_BOLD.copyWith(
                                fontSize: 12.0 * getFontWidth(context),
                                color: MAIN_COLOR,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: 16.0 * getScaleWidth(context),
                bottom: 16.0 * getScaleWidth(context),
              ),
              height: 58.0 * getScaleWidth(context),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: libraryItem['tags'].length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: index == 0
                        ? EdgeInsets.only(
                            left: 16.0 * getScaleWidth(context),
                            right: 4.0 * getScaleWidth(context),
                          )
                        : EdgeInsets.symmetric(
                            horizontal: 4.0 * getScaleWidth(context)),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 4.0 * getScaleWidth(context),
                        horizontal: 12.0 * getScaleWidth(context),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: GRAY020,
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Text(
                        '#${libraryItem['tags'][index]}',
                        style: BODY1_REGULAR.copyWith(
                          fontSize: 12.0 * getFontWidth(context),
                          color: GRAY090,
                          height: 1.4,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
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
                  horizontal: 6.0,
                ),
                //isScrollable: true,
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
            _getTabAtIndex(tabIndex),
          ],
        ),
      ),
    );
  }

  Widget _getTabAtIndex(int index) {
    var list = [
      LibraryDetailAllbooksScreen(),
      LibraryDetailReadingScreen(),
      LibraryDetailLinkedScreen(),
      LibraryDetailActivityLogScreen(),
    ];
    return list[index];
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          content: Builder(
            builder: (context) {
              return Container(
                height: 326.0 * getScaleWidth(context),
                width: 328.0 * getScaleWidth(context),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 62.0 * getScaleWidth(context),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            width: 1.0,
                            color: OUTLINE,
                          ),
                        ),
                      ),
                      child: Text(
                        '메이킹북',
                        style: TITLE1_BOLD.copyWith(
                          fontSize: 20.0 * getFontWidth(context),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24.0 * getScaleWidth(context),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.0 * getScaleWidth(context),
                      ),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const LibraryMakingBooksScreen(
                                makingType: '1',
                              ),
                            ),
                          );
                        },
                        child: Container(
                          height: 72.0 * getScaleWidth(context),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: MAIN_COLOR_OP10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 20.0 * getScaleWidth(context),
                                width: 20.0 * getScaleWidth(context),
                                child: Image.asset(
                                    'asset/img/icons/makingbook_audio_icon.png'),
                              ),
                              SizedBox(
                                width: 8.0 * getScaleWidth(context),
                              ),
                              Text(
                                '오디오북 만들기',
                                style: BODY3_BOLD.copyWith(
                                  fontSize: 16.0 * getFontWidth(context),
                                  color: MAIN_COLOR,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16.0 * getScaleWidth(context),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.0 * getScaleWidth(context),
                      ),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const LibraryMakingBooksScreen(
                                makingType: '2',
                              ),
                            ),
                          );
                        },
                        child: Container(
                          height: 72.0 * getScaleWidth(context),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: MAIN_COLOR_OP10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 20.0 * getScaleWidth(context),
                                width: 20.0 * getScaleWidth(context),
                                child: Image.asset(
                                    'asset/img/icons/makingbook_text_icon.png'),
                              ),
                              SizedBox(
                                width: 8.0 * getScaleWidth(context),
                              ),
                              Text(
                                '텍스트북 만들기',
                                style: BODY3_BOLD.copyWith(
                                  fontSize: 16.0 * getFontWidth(context),
                                  color: MAIN_COLOR,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24.0 * getScaleWidth(context),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          Navigator.of(context).pop();
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 56.0 * getScaleWidth(context),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(8.0),
                            bottomRight: Radius.circular(8.0),
                          ),
                          color: MAIN_COLOR,
                        ),
                        child: Text(
                          '닫기',
                          style: BODY3_BOLD.copyWith(
                            fontSize: 16.0 * getFontWidth(context),
                            color: WHITE,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
