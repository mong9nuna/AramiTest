import 'package:arami/common/component/custom_search_bar.dart';
import 'package:arami/common/const/colors.dart';
import 'package:arami/common/const/fonts.dart';
import 'package:arami/common/const/function.dart';
import 'package:arami/common/const/size.dart';
import 'package:arami/common/layout/default_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ParentingManagementScreen extends StatefulWidget {
  const ParentingManagementScreen({Key? key}) : super(key: key);

  @override
  State<ParentingManagementScreen> createState() =>
      _ParentingManagementScreenState();
}

class _ParentingManagementScreenState extends State<ParentingManagementScreen> {
  String startDateStr = DateFormat("yy. M. d").format(DateTime.now());
  DateTime startDate = DateTime.now();
  String endDateStr = DateFormat("yy. M. d").format(DateTime.now());
  DateTime endDate = DateTime.now();
  bool startDateSelect = false;
  bool endDateSelect = false;
  bool resetFlag = false;
  bool dateFlag = false;
  bool publicFlag = false;
  String publicStr = '전체';
  bool activeFlag = false;
  String activeStr = '전체';
  bool childFlag = false;
  String childStr = '전체';
  List<String> childList = ['전체', '김아람', '김아라미'];

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appbarPointView: false,
      appbarType: true,
      appTitle: '책육아활동',
      logoType: false,
      notiButton: true,
      elevations: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    width: 16.0 * getScaleWidth(context),
                  ),
                  if (resetFlag) resetItem(),
                  if (resetFlag)
                    SizedBox(
                      width: 12.0 * getScaleWidth(context),
                    ),
                  dateItem(),
                  SizedBox(
                    width: 12.0 * getScaleWidth(context),
                  ),
                  publicItem(),
                  SizedBox(
                    width: 12.0 * getScaleWidth(context),
                  ),
                  activeItem(),
                  SizedBox(
                    width: 12.0 * getScaleWidth(context),
                  ),
                  childItem(),
                  SizedBox(
                    width: 8.0 * getScaleWidth(context),
                  ),
                ],
              ),
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

  Widget resetItem() {
    return GestureDetector(
      onTap: () {
        setState(() {
          allFlagReset();
        });
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: GRAY020,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(4.0),
        ),
        width: 69.0 * getScaleWidth(context),
        height: 32.0 * getScaleWidth(context),
        child: Row(
          children: [
            SizedBox(
              width: 8.0 * getScaleWidth(context),
            ),
            Text(
              '재설정',
              style: BODY1_BOLD.copyWith(
                fontSize: 12.0 * getFontWidth(context),
                color: GRAY090,
              ),
            ),
            SizedBox(
              width: 2.0 * getScaleWidth(context),
            ),
            SizedBox(
              width: 20.0 * getScaleWidth(context),
              height: 20.0 * getScaleWidth(context),
              child: Icon(
                Icons.refresh,
                size: 16.0 * getScaleWidth(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void allFlagReset() {
    startDateStr = DateFormat("yy. M. d").format(DateTime.now());
    startDate = DateTime.now();
    endDateStr = DateFormat("yy. M. d").format(DateTime.now());
    endDate = DateTime.now();
    startDateSelect = false;
    endDateSelect = false;
    resetFlag = false;
    dateFlag = false;
    publicFlag = false;
    publicStr = '전체';
    activeFlag = false;
    activeStr = '전체';
    childFlag = false;
    childStr = '전체';
  }

  void resetFlagCheck() {
    resetFlag = true;
  }

  Widget dateItem() {
    return GestureDetector(
      onTap: () {
        dateModal();
      },
      child: dateFlag
          ? Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: MAIN_COLOR_OP10),
              width: 152.0 * getScaleWidth(context),
              height: 32.0 * getScaleWidth(context),
              child: Row(
                children: [
                  SizedBox(
                    width: 8.0 * getScaleWidth(context),
                  ),
                  Text(
                    '$startDateStr ~ $endDateStr',
                    style: BODY1_BOLD.copyWith(
                      fontSize: 12.0 * getFontWidth(context),
                      color: MAIN_COLOR,
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
                      color: MAIN_COLOR,
                    ),
                  ),
                ],
              ),
            )
          : Container(
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
                children: [
                  SizedBox(
                    width: 8.0 * getScaleWidth(context),
                  ),
                  Text(
                    '조회 기간',
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
  }

  Future dateModal() {
    bool dateCheck = false;
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      isScrollControlled: true,
      isDismissible: false,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return SizedBox(
              height: 434.0 * getScaleWidth(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 24.0 * getScaleWidth(context),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 16.0 * getScaleWidth(context),
                    ),
                    child: Text(
                      '조회기간',
                      style: TITLE1_BOLD.copyWith(
                        fontSize: 20.0 * getFontWidth(context),
                        color: GRAY090,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.0 * getScaleWidth(context),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 16.0 * getScaleWidth(context),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            startDateSelect = true;
                            endDateSelect = false;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: startDateSelect ? 2.0 : 1.0,
                              color: startDateSelect ? MAIN_COLOR : GRAY040,
                            ),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          width: 138.0 * getScaleWidth(context),
                          height: 36.0 * getScaleWidth(context),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 16.0 * getScaleWidth(context),
                              ),
                              SizedBox(
                                width: 24.0 * getScaleWidth(context),
                                height: 24.0 * getScaleWidth(context),
                                child: Icon(
                                  Icons.calendar_month_outlined,
                                  color: GRAY020,
                                  size: 20.0 * getScaleWidth(context),
                                ),
                              ),
                              SizedBox(
                                width: 8.0 * getScaleWidth(context),
                              ),
                              Text(
                                startDateStr,
                                style: BODY3_BOLD.copyWith(
                                  fontSize: 16.0 * getFontWidth(context),
                                  color: GRAY090,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 21.0 * getScaleWidth(context),
                      ),
                      Text(
                        '~',
                        style: BODY3_BOLD.copyWith(
                          fontSize: 16.0 * getFontWidth(context),
                          color: GRAY040,
                        ),
                      ),
                      SizedBox(
                        width: 21.0 * getScaleWidth(context),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            endDateSelect = true;
                            startDateSelect = false;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: endDateSelect ? 2.0 : 1.0,
                              color: endDateSelect ? MAIN_COLOR : GRAY040,
                            ),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          width: 138.0 * getScaleWidth(context),
                          height: 36.0 * getScaleWidth(context),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 16.0 * getScaleWidth(context),
                              ),
                              SizedBox(
                                width: 24.0 * getScaleWidth(context),
                                height: 24.0 * getScaleWidth(context),
                                child: Icon(
                                  Icons.calendar_month_outlined,
                                  color: GRAY020,
                                  size: 20.0 * getScaleWidth(context),
                                ),
                              ),
                              SizedBox(
                                width: 8.0 * getScaleWidth(context),
                              ),
                              Text(
                                endDateStr,
                                style: BODY3_BOLD.copyWith(
                                  fontSize: 16.0 * getFontWidth(context),
                                  color: GRAY090,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (dateCheck)
                    SizedBox(
                      height: 4.0 * getScaleWidth(context),
                    ),
                  if (dateCheck)
                    Container(
                      alignment: Alignment.center,
                      height: 16.0 * getScaleWidth(context),
                      child: Text(
                        '선택 기간을 확인해 주세요.',
                        style: BODY1_REGULAR.copyWith(
                          fontSize: 12.0 * getFontWidth(context),
                          color: Colors.red,
                        ),
                      ),
                    ),
                  if (!dateCheck)
                    SizedBox(
                      height: 20.0 * getScaleWidth(context),
                    ),
                  SizedBox(
                    height: 44.0 * getScaleWidth(context),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 16.0 * getScaleWidth(context),
                        ),
                        SizedBox(
                          width: 24.0 * getScaleWidth(context),
                          height: 24.0 * getScaleWidth(context),
                          child: Icon(
                            Icons.calendar_month_outlined,
                            color: GRAY090,
                            size: 20.0 * getScaleWidth(context),
                          ),
                        ),
                        SizedBox(
                          width: 4.0 * getScaleWidth(context),
                        ),
                        Text(
                          '기간 선택',
                          style: BODY3_BOLD.copyWith(
                            fontSize: 16.0 * getScaleWidth(context),
                            color: GRAY090,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 200 * getScaleWidth(context),
                    child: CupertinoTheme(
                      data: CupertinoThemeData(
                        textTheme: CupertinoTextThemeData(
                          dateTimePickerTextStyle: BODY3_BOLD.copyWith(
                            color: GRAY090,
                            fontSize: 16.0 * getFontWidth(context),
                          ),
                        ),
                      ),
                      child: CupertinoDatePicker(
                        initialDateTime: DateTime.now(),
                        maximumDate: DateTime.now(),
                        minimumYear: 2023,
                        maximumYear: DateTime.now().year,
                        mode: CupertinoDatePickerMode.date,
                        onDateTimeChanged: (DateTime value) {
                          setState(() {
                            if (startDateSelect) {
                              startDateStr = DateFormat("yy. M. d").format(value);
                              startDate = value;
                              if (startDate.compareTo(endDate) == 1) {
                                dateCheck = true;
                              } else {
                                dateCheck = false;
                              }
                            } else if (endDateSelect) {
                              endDateStr = DateFormat("yy. M. d").format(value);
                              endDate = value;
                              if (startDate.compareTo(endDate) == 1) {
                                dateCheck = true;
                              } else {
                                dateCheck = false;
                              }
                            }
                          });
                        },
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: OUTLINE, width: 1.0),
                      ),
                    ),
                    height: 64.0 * getScaleWidth(context),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 8.0 * getScaleWidth(context),
                        left: 16.0 * getScaleWidth(context),
                        right: 16.0 * getScaleWidth(context),
                        bottom: 8.0 * getScaleWidth(context),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (dateCheck) {
                              // 시작날짜가 마지막 날짜보다 클경우 에러 리턴!
                            } else {
                              resetFlagCheck();
                              startDateSelect = false;
                              endDateSelect = false;
                              dateFlag = true;
                              Navigator.of(context).pop();
                            }
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: dateCheck ? GRAY020 : MAIN_COLOR,
                          ),
                          width: 328.0 * getScaleWidth(context),
                          height: 56.0 * getScaleWidth(context),
                          child: Text(
                            '확인',
                            style: BODY3_BOLD.copyWith(
                              fontSize: 16.0 * getFontWidth(context),
                              color: WHITE,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    ).then((value) => setState(() {}));
  }

  Widget publicItem() {
    return GestureDetector(
      onTap: () {
        publicModal();
      },
      child: publicFlag
          ? Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: MAIN_COLOR_OP10),
              width: publicStr == '공개'
                  ? 59.0 * getScaleWidth(context)
                  : 66.0 * getScaleWidth(context),
              height: 32.0 * getScaleWidth(context),
              child: Row(
                children: [
                  SizedBox(
                    width: 8.0 * getScaleWidth(context),
                  ),
                  Text(
                    publicStr,
                    style: BODY1_BOLD.copyWith(
                      fontSize: 12.0 * getFontWidth(context),
                      color: MAIN_COLOR,
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
                      color: MAIN_COLOR,
                    ),
                  ),
                ],
              ),
            )
          : Container(
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
                children: [
                  SizedBox(
                    width: 8.0 * getScaleWidth(context),
                  ),
                  Text(
                    '공개 설정',
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
  }

  Future publicModal() {
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      isScrollControlled: true,
      isDismissible: false,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return SizedBox(
              height: 400.0 * getScaleWidth(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 24.0 * getScaleWidth(context),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.0 * getScaleWidth(context),
                    ),
                    child: Text(
                      '공개 설정',
                      style: TITLE1_BOLD.copyWith(
                        fontSize: 20.0 * getFontWidth(context),
                        color: GRAY090,
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
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              publicStr = '전체';
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  width: 1.0,
                                  color: OUTLINE,
                                ),
                              ),
                              color:
                                  publicStr == '전체' ? MAIN_COLOR_OP10 : WHITE,
                            ),
                            height: 56.0 * getScaleWidth(context),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 16.0 * getScaleWidth(context),
                                    horizontal: 8.0 * getScaleWidth(context),
                                  ),
                                  child: Text(
                                    '전체',
                                    style: BODY3_REGULAR.copyWith(
                                      fontSize: 16.0 * getScaleWidth(context),
                                      color: publicStr == '전체'
                                          ? MAIN_COLOR
                                          : GRAY090,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              publicStr = '공개';
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  width: 1.0,
                                  color: OUTLINE,
                                ),
                              ),
                              color:
                                  publicStr == '공개' ? MAIN_COLOR_OP10 : WHITE,
                            ),
                            height: 56.0 * getScaleWidth(context),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 16.0 * getScaleWidth(context),
                                    horizontal: 8.0 * getScaleWidth(context),
                                  ),
                                  child: Text(
                                    '공개',
                                    style: BODY3_REGULAR.copyWith(
                                      fontSize: 16.0 * getScaleWidth(context),
                                      color: publicStr == '공개'
                                          ? MAIN_COLOR
                                          : GRAY090,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              publicStr = '비공개';
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  width: 1.0,
                                  color: OUTLINE,
                                ),
                              ),
                              color:
                                  publicStr == '비공개' ? MAIN_COLOR_OP10 : WHITE,
                            ),
                            height: 56.0 * getScaleWidth(context),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 16.0 * getScaleWidth(context),
                                    horizontal: 8.0 * getScaleWidth(context),
                                  ),
                                  child: Text(
                                    '비공개',
                                    style: BODY3_REGULAR.copyWith(
                                      fontSize: 16.0 * getScaleWidth(context),
                                      color: publicStr == '비공개'
                                          ? MAIN_COLOR
                                          : GRAY090,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 58.0 * getScaleWidth(context),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: OUTLINE, width: 1.0),
                      ),
                    ),
                    height: 64.0 * getScaleWidth(context),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 8.0 * getScaleWidth(context),
                        left: 16.0 * getScaleWidth(context),
                        right: 16.0 * getScaleWidth(context),
                        bottom: 8.0 * getScaleWidth(context),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (publicStr == '전체') {
                              publicFlag = false;
                              Navigator.of(context).pop();
                            } else {
                              resetFlagCheck();
                              publicFlag = true;
                              Navigator.of(context).pop();
                            }
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: MAIN_COLOR,
                          ),
                          width: 328.0 * getScaleWidth(context),
                          height: 56.0 * getScaleWidth(context),
                          child: Text(
                            '확인',
                            style: BODY3_BOLD.copyWith(
                              fontSize: 16.0 * getFontWidth(context),
                              color: WHITE,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    ).then((value) => setState(() {}));
  }

  Widget activeItem() {
    return GestureDetector(
      onTap: () {
        activeModal();
      },
      child: activeFlag
          ? Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: MAIN_COLOR_OP10),
              width: activeStr == '라이브러리'
                  ? 90.0 * getScaleWidth(context)
                  : 105.0 * getScaleWidth(context),
              height: 32.0 * getScaleWidth(context),
              child: Row(
                children: [
                  SizedBox(
                    width: 8.0 * getScaleWidth(context),
                  ),
                  Text(
                    activeStr,
                    style: BODY1_BOLD.copyWith(
                      fontSize: 12.0 * getFontWidth(context),
                      color: MAIN_COLOR,
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
                      color: MAIN_COLOR,
                    ),
                  ),
                ],
              ),
            )
          : Container(
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
                children: [
                  SizedBox(
                    width: 8.0 * getScaleWidth(context),
                  ),
                  Text(
                    '활동 범위',
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
  }

  Future activeModal() {
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      isScrollControlled: true,
      isDismissible: false,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return SizedBox(
              height: 400.0 * getScaleWidth(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 24.0 * getScaleWidth(context),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.0 * getScaleWidth(context),
                    ),
                    child: Text(
                      '공개 설정',
                      style: TITLE1_BOLD.copyWith(
                        fontSize: 20.0 * getFontWidth(context),
                        color: GRAY090,
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
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              activeStr = '전체';
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  width: 1.0,
                                  color: OUTLINE,
                                ),
                              ),
                              color:
                                  activeStr == '전체' ? MAIN_COLOR_OP10 : WHITE,
                            ),
                            height: 56.0 * getScaleWidth(context),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 16.0 * getScaleWidth(context),
                                    horizontal: 8.0 * getScaleWidth(context),
                                  ),
                                  child: Text(
                                    '전체',
                                    style: BODY3_REGULAR.copyWith(
                                      fontSize: 16.0 * getScaleWidth(context),
                                      color: activeStr == '전체'
                                          ? MAIN_COLOR
                                          : GRAY090,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              activeStr = '오늘의 책활동';
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  width: 1.0,
                                  color: OUTLINE,
                                ),
                              ),
                              color: activeStr == '오늘의 책활동'
                                  ? MAIN_COLOR_OP10
                                  : WHITE,
                            ),
                            height: 56.0 * getScaleWidth(context),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 16.0 * getScaleWidth(context),
                                    horizontal: 8.0 * getScaleWidth(context),
                                  ),
                                  child: Text(
                                    '오늘의 책활동',
                                    style: BODY3_REGULAR.copyWith(
                                      fontSize: 16.0 * getScaleWidth(context),
                                      color: activeStr == '오늘의 책활동'
                                          ? MAIN_COLOR
                                          : GRAY090,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              activeStr = '라이브러리';
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  width: 1.0,
                                  color: OUTLINE,
                                ),
                              ),
                              color: activeStr == '라이브러리'
                                  ? MAIN_COLOR_OP10
                                  : WHITE,
                            ),
                            height: 56.0 * getScaleWidth(context),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 16.0 * getScaleWidth(context),
                                    horizontal: 8.0 * getScaleWidth(context),
                                  ),
                                  child: Text(
                                    '라이브러리',
                                    style: BODY3_REGULAR.copyWith(
                                      fontSize: 16.0 * getScaleWidth(context),
                                      color: activeStr == '라이브러리'
                                          ? MAIN_COLOR
                                          : GRAY090,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 58.0 * getScaleWidth(context),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: OUTLINE, width: 1.0),
                      ),
                    ),
                    height: 64.0 * getScaleWidth(context),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 8.0 * getScaleWidth(context),
                        left: 16.0 * getScaleWidth(context),
                        right: 16.0 * getScaleWidth(context),
                        bottom: 8.0 * getScaleWidth(context),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (activeStr == '전체') {
                              activeFlag = false;
                              Navigator.of(context).pop();
                            } else {
                              resetFlagCheck();
                              activeFlag = true;
                              Navigator.of(context).pop();
                            }
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: MAIN_COLOR,
                          ),
                          width: 328.0 * getScaleWidth(context),
                          height: 56.0 * getScaleWidth(context),
                          child: Text(
                            '확인',
                            style: BODY3_BOLD.copyWith(
                              fontSize: 16.0 * getFontWidth(context),
                              color: WHITE,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    ).then((value) => setState(() {}));
  }

  Widget childItem() {
    return GestureDetector(
      onTap: () {
        childModal();
      },
      child: childFlag
          ? Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: MAIN_COLOR_OP10),
              width: (22.0 * childStr.length) * getScaleWidth(context),
              height: 32.0 * getScaleWidth(context),
              child: Row(
                children: [
                  SizedBox(
                    width: 8.0 * getScaleWidth(context),
                  ),
                  Text(
                    childStr,
                    style: BODY1_BOLD.copyWith(
                      fontSize: 12.0 * getFontWidth(context),
                      color: MAIN_COLOR,
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
                      color: MAIN_COLOR,
                    ),
                  ),
                ],
              ),
            )
          : Container(
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
                children: [
                  SizedBox(
                    width: 8.0 * getScaleWidth(context),
                  ),
                  Text(
                    '자녀 선택',
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
  }

  Future childModal() {
    return showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      isScrollControlled: true,
      isDismissible: false,
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return SizedBox(
              height: 400.0 * getScaleWidth(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 24.0 * getScaleWidth(context),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.0 * getScaleWidth(context),
                    ),
                    child: Text(
                      '자녀 선택',
                      style: TITLE1_BOLD.copyWith(
                        fontSize: 20.0 * getFontWidth(context),
                        color: GRAY090,
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
                    child: SizedBox(
                      height: 224.0 * getScaleWidth(context),
                      child: ListView.builder(
                        itemCount: childList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                childStr = childList[index];
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    width: 1.0,
                                    color: OUTLINE,
                                  ),
                                ),
                                color: childList[index] == childStr
                                    ? MAIN_COLOR_OP10
                                    : WHITE,
                              ),
                              height: 56.0 * getScaleWidth(context),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 16.0 * getScaleWidth(context),
                                      horizontal: 8.0 * getScaleWidth(context),
                                    ),
                                    child: Text(
                                      childList[index],
                                      style: BODY3_REGULAR.copyWith(
                                        fontSize: 16.0 * getScaleWidth(context),
                                        color: childList[index] == childStr
                                            ? MAIN_COLOR
                                            : GRAY090,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: OUTLINE, width: 1.0),
                      ),
                    ),
                    height: 64.0 * getScaleWidth(context),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 8.0 * getScaleWidth(context),
                        left: 16.0 * getScaleWidth(context),
                        right: 16.0 * getScaleWidth(context),
                        bottom: 8.0 * getScaleWidth(context),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (childStr == '전체') {
                              childFlag = false;
                              Navigator.of(context).pop();
                            } else {
                              resetFlagCheck();
                              childFlag = true;
                              Navigator.of(context).pop();
                            }
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: MAIN_COLOR,
                          ),
                          width: 328.0 * getScaleWidth(context),
                          height: 56.0 * getScaleWidth(context),
                          child: Text(
                            '확인',
                            style: BODY3_BOLD.copyWith(
                              fontSize: 16.0 * getFontWidth(context),
                              color: WHITE,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    ).then((value) => setState(() {}));
  }
}
