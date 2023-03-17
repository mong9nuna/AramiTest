import 'package:arami/common/component/custom_download_dialog.dart';
import 'package:arami/common/component/custom_video_player.dart';
import 'package:arami/common/const/colors.dart';
import 'package:arami/common/const/fonts.dart';
import 'package:arami/common/const/size.dart';
import 'package:arami/common/layout/default_layout.dart';
import 'package:arami/parenting/view/todaybooks_activity_Introduction_screen.dart';
import 'package:arami/parenting/view/todaybooks_activity_log_screen.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ParentingTodayBooksScreen extends StatefulWidget {
  const ParentingTodayBooksScreen({Key? key}) : super(key: key);

  @override
  State<ParentingTodayBooksScreen> createState() =>
      _ParentingTodayBooksScreenState();
}

class _ParentingTodayBooksScreenState extends State<ParentingTodayBooksScreen>
    with SingleTickerProviderStateMixin {
  Map<String, dynamic> todayBooksItem = {
    'title': '아이와 함께 장난감을 가지고 의사소통을 시작해보세요.',
    'date': '2023-01-09',
    'videoFile' : 'asset/video/todaybooks_sample_video.mp4',
    'id': 'file01',
    'mainTitle': '오늘의 책활동 Sample',
    'file': 'https://www.arambooks.com/upload/activitybook_1.pdf',
    'originFileName': '활동지',
    'download': 'false',
    'innerFilePath' : '',
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

  bool bookmarkState = false;
  bool favoriteState = false;
  late TabController tabController;
  late VideoPlayerController controller;
  int tabIndex = 0;

  @override
  void initState() {
    controller = VideoPlayerController.asset(todayBooksItem['videoFile']);
    tabController = TabController(initialIndex: 0, length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = [
      Tab(
        height: 50.0 * getScaleWidth_Max(context),
        child: Container(
          width: 164.0 * getScaleWidth(context),
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(
              //top: 8.0 * getScaleWidth(context),
              bottom: 8.0 * getScaleWidth(context),
            ),
            child: const Text(
              '활동 소개',
            ),
          ),
        ),
      ),
      Tab(
        height: 50.0 * getScaleWidth_Max(context),
        child: Container(
          width: 164.0 * getScaleWidth(context),
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(
              //top: 8.0 * getScaleWidth(context),
              bottom: 8.0 * getScaleWidth(context),
            ),
            child: const Text(
              '활동 일지',
            ),
          ),
        ),
      ),
    ];

    return DefaultLayout(
      appbarPointView: false,
      appbarType: MediaQuery.of(context).orientation == Orientation.portrait ? true : false,
      logoType: false,
      elevations: 0,
      appTitle: '오늘의 책활동',
      notiButton: true,
      calendarButton: true,
      child: Column(
        children: [
          Container(
            color: GRAY090,
            height: MediaQuery.of(context).orientation == Orientation.portrait ? 203 * getScaleWidth_Max(context) : MediaQuery.of(context).size.height,
            child: CustomVideoPalyer(controller: controller),
          ),
          Visibility(
            visible: MediaQuery.of(context).orientation == Orientation.portrait ? true : false,
            child: Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 16.0 * getScaleWidth(context),
                        left: 16.0 * getScaleWidth(context),
                        right: 16.0 * getScaleWidth(context),
                        bottom: 8.0 * getScaleWidth(context),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            child: Text(
                              '아이와 함께 장난감을 가지고 의사소통을 시작해보세요.',
                              style: BODY3_BOLD.copyWith(
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
                                      color:
                                          bookmarkState ? MAIN_COLOR : LIGHT_BG2,
                                      borderRadius: BorderRadius.circular(4.0)),
                                ),
                                Image.asset(
                                  bookmarkState
                                      ? 'asset/img/icons/star_icon.png'
                                      : 'asset/img/icons/star_icon_2.png',
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
                    Padding(
                      padding: EdgeInsets.only(
                        left: 16.0 * getScaleWidth(context),
                      ),
                      child: Text(
                        todayBooksItem['date'],
                        style: BODY2_REGULAR.copyWith(
                          fontSize: 14.0 * getFontWidth(context),
                          color: GRAY040,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 16.0 * getScaleWidth(context),
                        left: 16.0 * getScaleWidth(context),
                      ),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              print('좋아요 작동');
                              setState(() {
                                favoriteState = !favoriteState;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.0 * getScaleWidth(context),
                                vertical: 4.0 * getScaleWidth(context),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: favoriteState ? MAIN_COLOR : LIGHT_BG2,
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 24.0 * getScaleWidth(context),
                                    height: 24.0 * getScaleWidth(context),
                                    child: Icon(
                                      Icons.favorite_border,
                                      size: 17.0 * getScaleWidth(context),
                                      color: favoriteState ? WHITE : GRAY090,
                                    ),
                                  ),
                                  Text(
                                    '좋아요',
                                    style: BODY1_REGULAR.copyWith(
                                      fontSize: 12.0 * getFontWidth(context),
                                      color: favoriteState ? WHITE : GRAY090,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              print('공유하기 작동');
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 4.0 * getScaleWidth(context),
                              ),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8.0 * getScaleWidth(context),
                                  vertical: 4.0 * getScaleWidth(context),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: LIGHT_BG2,
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 24.0 * getScaleWidth(context),
                                      height: 24.0 * getScaleWidth(context),
                                      child: Icon(
                                        Icons.share_outlined,
                                        size: 17.0 * getScaleWidth(context),
                                      ),
                                    ),
                                    Text(
                                      '공유하기',
                                      style: BODY1_REGULAR.copyWith(
                                        fontSize: 12.0 * getFontWidth(context),
                                        color: GRAY090,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    List<Map<String, dynamic>> itemList = [];
                                    itemList.add(todayBooksItem);
                                    return CustomDownloadDialog(
                                      itemList: itemList,
                                    );
                                  });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.0 * getScaleWidth(context),
                                vertical: 4.0 * getScaleWidth(context),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: LIGHT_BG2,
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 24.0 * getScaleWidth(context),
                                    height: 24.0 * getScaleWidth(context),
                                    child: Icon(
                                      Icons.file_download_outlined,
                                      size: 17.0 * getScaleWidth(context),
                                    ),
                                  ),
                                  Text(
                                    '활동지 다운로드',
                                    style: BODY1_REGULAR.copyWith(
                                      fontSize: 12.0 * getFontWidth(context),
                                      color: GRAY090,
                                    ),
                                  )
                                ],
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
                        itemCount: todayBooksItem['tags'].length,
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
                                '#${todayBooksItem['tags'][index]}',
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
                          });
                        },
                      ),
                    ),
                    _getTabAtIndex(tabIndex),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getTabAtIndex(int index) {
    var list = [
      Container(child: TodayBooksActivityIntroductionScreen()),
      Container(child: TodayBooksActivityLogScreen(controller: controller,)),
    ];
    return list[index];
  }
}