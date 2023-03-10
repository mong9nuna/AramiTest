import 'package:arami/common/const/colors.dart';
import 'package:arami/common/const/fonts.dart';
import 'package:arami/common/const/size.dart';
import 'package:flutter/material.dart';

import '../../common/layout/default_layout.dart';

class LibraryMakingBooksScreen extends StatefulWidget {
  final String makingType;

  const LibraryMakingBooksScreen({
    required this.makingType,
    Key? key,
  }) : super(key: key);

  @override
  State<LibraryMakingBooksScreen> createState() =>
      _LibraryMakingBooksScreenState();
}

bool saveButtonActive = false;

class _LibraryMakingBooksScreenState extends State<LibraryMakingBooksScreen> {
  bool inputMode = false;
  late PageController pageController;
  int pageIndex = 1;
  List<Map<String, dynamic>> containers = [];
  List<TextEditingController> tcList = [];
  int num = 0;
  final Map<String, dynamic> makingBookItem = {
    'id': 'makingBook1',
    'title': '참 똑똑한 사회씨',
    'detail': '경복궁에 가면',
    'detailImages': [
      'asset/img/sample/page1.png',
      'asset/img/sample/page2.png',
      'asset/img/sample/page3.png',
      'asset/img/sample/page4.png',
      'asset/img/sample/page5.png',
      'asset/img/sample/page6.png',
      'asset/img/sample/page7.png',
      'asset/img/sample/page8.png',
      'asset/img/sample/page9.png',
    ],
  };

  addContainer(BuildContext context, double dx, double dy, int index) {
    TextEditingController tc = TextEditingController();
    tcList.add(tc);
    Map<String, dynamic> items = {};
    items['index'] = index;
    String textID = 'text${num++}';
    items['textID'] = textID;
    bool showIcons = true;
    items['showIcons'] = showIcons;
    setState(
      () {
        Widget item = Positioned(
          top: dy,
          left: dx,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //if(checkShow())
              GestureDetector(
                onTap: () {
                  setState(() {
                    containers.removeWhere(
                      (element) {
                        return element['textID'] == textID;
                      },
                    );
                    print(containers);
                  });
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.0),
                  child: Icon(
                    Icons.close,
                    size: 16.0,
                  ),
                ),
              ),
              IntrinsicWidth(
                child: TextField(
                  onTap: () {
                    for (var element in containers) {
                      if (element['textID'] == textID) {
                        setState(() {
                          element['showIcons'] = false;
                          print(element);
                        });
                      }
                    }
                  },
                  controller: tc,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  cursorColor: GRAY090,
                  decoration: InputDecoration(
                    hintText: '텍스트를 입력해주세요.',
                    hintStyle: BODY2_REGULAR.copyWith(
                      fontSize: 14.0,
                      color: GRAY040,
                      height: 1.5,
                    ),
                    filled: true,
                    fillColor: Color(0x80FFFFFF),
                    contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                    isDense: true,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        );
        items['item'] = item;
        containers.add(items);
      },
    );
  }

  bool checkShow(String textID) {
    return true;
  }

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    tcList.map(
      (e) {
        e.dispose();
      },
    ).toList();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appbarPointView: false,
      appbarType: false,
      logoType: false,
      elevations: 1,
      child: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50.0 * getScaleWidth(context),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.0 * getScaleWidth(context),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(
                            () {
                              Navigator.of(context).pop();
                            },
                          );
                        },
                        child: Icon(
                          Icons.close,
                          weight: 24.0 * getScaleWidth(context),
                          size: 24.0 * getScaleWidth(context),
                        ),
                      ),
                      SizedBox(
                        width: 82.0 * getScaleWidth(context),
                      ),
                      Text(
                        widget.makingType == '1' ? '오디오북' : '텍스트북',
                        style: TITLE1_BOLD.copyWith(
                          fontSize: 20.0 * getFontWidth(context),
                          color: GRAY090,
                        ),
                      ),
                      SizedBox(
                        width: 68.0 * getScaleWidth(context),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {});
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 39.0 * getScaleWidth(context),
                          height: 32.0 * getScaleWidth(context),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            color: saveButtonActive ? MAIN_COLOR : LIGHT_BG2,
                          ),
                          child: Text(
                            '저장',
                            style: BODY1_REGULAR.copyWith(
                              fontSize: 12.0 * getFontWidth(context),
                              color: saveButtonActive ? WHITE : GRAY020,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                height: 1.0,
                color: OUTLINE,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 24.0 * getScaleWidth(context),
                          ),
                          child: Column(
                            children: [
                              Text(
                                makingBookItem['title'],
                                style: BODY3_BOLD.copyWith(
                                  fontSize: 16.0 * getFontWidth(context),
                                  color: GRAY090,
                                ),
                              ),
                              SizedBox(
                                height: 8.0 * getScaleWidth(context),
                              ),
                              Text(
                                makingBookItem['detail'],
                                style: BODY2_REGULAR.copyWith(
                                  fontSize: 14.0 * getFontWidth(context),
                                  color: GRAY090,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 238.0 * getScaleWidth(context),
                        child: PageView.builder(
                          controller: pageController,
                          onPageChanged: (value) {
                            setState(() {
                              pageIndex = value + 1;
                            });
                          },
                          scrollDirection: Axis.horizontal,
                          itemCount: makingBookItem['detailImages'].length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTapDown: (details) {
                                if (inputMode) {
                                  addContainer(
                                      context,
                                      details.localPosition.dx,
                                      details.localPosition.dy,
                                      pageIndex);
                                  inputMode = false;
                                } else {
                                  FocusScope.of(context).unfocus();
                                }
                              },
                              child: Stack(
                                children: [
                                  Image.asset(
                                      makingBookItem['detailImages'][index]),
                                  Stack(
                                    children: containers.map<Widget>((e) {
                                      if (pageIndex == e['index']) {
                                        return e['item'];
                                      } else {
                                        return Container();
                                      }
                                    }).toList(),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 24.0 * getScaleWidth(context),
                          horizontal: 16.0 * getScaleWidth(context),
                        ),
                        child: SizedBox(
                          height: 36.0 * getScaleWidth(context),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    pageController.previousPage(
                                        duration: Duration(milliseconds: 200),
                                        curve: Curves.decelerate);
                                  });
                                },
                                child: Container(
                                  width: 36.0 * getScaleWidth(context),
                                  height: 36.0 * getScaleWidth(context),
                                  decoration: BoxDecoration(
                                    color: GRAY020,
                                    shape: BoxShape.circle,
                                  ),
                                  child: SizedBox(
                                    height: 24.0 * getScaleWidth(context),
                                    width: 24.0 * getScaleWidth(context),
                                    child: Icon(
                                      Icons.arrow_back_ios_sharp,
                                      color: WHITE,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                '$pageIndex / ${makingBookItem['detailImages'].length}',
                                style: TITLE1_REGULAR.copyWith(
                                  fontSize: 20.0 * getFontWidth(context),
                                  color: GRAY090,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    pageController.nextPage(
                                        duration: Duration(milliseconds: 200),
                                        curve: Curves.decelerate);
                                  });
                                },
                                child: Container(
                                  width: 36.0 * getScaleWidth(context),
                                  height: 36.0 * getScaleWidth(context),
                                  decoration: BoxDecoration(
                                    color: GRAY020,
                                    shape: BoxShape.circle,
                                  ),
                                  child: SizedBox(
                                    height: 24.0 * getScaleWidth(context),
                                    width: 24.0 * getScaleWidth(context),
                                    child: Icon(
                                      Icons.arrow_forward_ios_sharp,
                                      color: WHITE,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (widget.makingType == '1') AudioBookInput(),
                      if (widget.makingType == '2') TextBookInput(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget AudioBookInput() {
    return Row(
      children: [
        SizedBox(
          height: 60.0 * getScaleWidth(context),
          width: 60.0 * getScaleWidth(context),
          child: Icon(
            Icons.record_voice_over_outlined,
            color: GRAY060,
          ),
        ),
      ],
    );
  }

  Padding TextBookInput() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.0 * getScaleWidth(context),
      ),
      child: InkWell(
        onTap: () {
          setState(() {
            inputMode = true;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: MAIN_COLOR,
          ),
          height: 56.0 * getScaleWidth(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 24.0 * getScaleWidth(context),
                width: 24.0 * getScaleWidth(context),
                child: Icon(
                  Icons.title_rounded,
                  color: WHITE,
                ),
              ),
              SizedBox(
                width: 8.0 * getScaleWidth(context),
              ),
              if (inputMode == false)
                Text(
                  '입력하기',
                  style: BODY3_BOLD.copyWith(
                      fontSize: 16.0 * getFontWidth(context),
                      color: WHITE,
                      height: 1),
                ),
              if (inputMode)
                GestureDetector(
                  child: Text(
                    '영역을 터치해주세요.',
                    style: BODY3_BOLD.copyWith(
                        fontSize: 16.0 * getFontWidth(context),
                        color: WHITE,
                        height: 1),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

