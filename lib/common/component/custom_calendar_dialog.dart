import 'package:arami/common/const/colors.dart';
import 'package:arami/common/const/fonts.dart';
import 'package:arami/common/const/size.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomCalendarDialog extends StatefulWidget {
  const CustomCalendarDialog({Key? key}) : super(key: key);

  @override
  State<CustomCalendarDialog> createState() => _CustomCalendarDialogState();
}

class _CustomCalendarDialogState extends State<CustomCalendarDialog> {

  static DateTime now = DateTime.now();
  List<String> week = ["일", "월", "화", "수", "목", "금", "토"];
  int year = now.year;
  int month = now.month;
  List<dynamic> days = [];
  int dayCount = 42;
  int indexCount = 0;
  String selectDate = DateFormat("yyyy-M-d").format(now);

  @override
  Widget build(BuildContext context) {
    insertDays(year, month);
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      content: Builder(
        builder: (context) {
          return SizedBox(
            height: 512.0 * getScaleWidth(context),
            width: 304.0 * getScaleWidth(context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 12.0 * getScaleWidth(context),
                        left: 8.0 * getScaleWidth(context),
                        right: 8.0 * getScaleWidth(context),
                        bottom: 8.0 * getScaleWidth(context),
                      ),
                      child: SizedBox(
                        width: 288.0 * getScaleWidth(context),
                        height: 24.0 * getScaleWidth(context),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 24.0 * getScaleWidth(context),
                              height: 24.0 * getScaleWidth(context),
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                                onPressed: () {
                                  setState(() {
                                    indexCount = 0;
                                    if (month == 1) {
                                      month = 12;
                                      year -= 1;
                                    } else {
                                      month -= 1;
                                    }
                                  });
                                },
                                icon: const Icon(
                                  Icons.navigate_before,
                                ),
                              ),
                            ),
                            Text(
                              '$year년 $month월',
                              style: BODY3_BOLD.copyWith(
                                fontSize: 16.0 * getFontWidth(context),
                                color: GRAY090,
                              ),
                            ),
                            SizedBox(
                              width: 24.0 * getScaleWidth(context),
                              height: 24.0 * getScaleWidth(context),
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                                onPressed: () {
                                  setState(() {
                                    indexCount = 0;
                                    if (month == 12) {
                                      month = 1;
                                      year += 1;
                                    } else {
                                      month += 1;
                                    }
                                  });
                                },
                                icon: const Icon(
                                  Icons.navigate_next,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0 * getScaleWidth(context)),
                      child: SizedBox(
                        width: 288.0 * getScaleWidth(context),
                        height: 36.0 * getScaleWidth(context),
                        child: Row(
                          children: [
                            for (var i = 0; i < week.length; i++)
                              Padding(
                                padding: EdgeInsets.only(
                                    left: i == 0
                                        ? 0.0
                                        : 6.0 * getScaleWidth(context)),
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 36.0 * getScaleWidth(context),
                                  height: 36.0 * getScaleWidth(context),
                                  child: Text(
                                    week[i],
                                    style: BODY3_BOLD.copyWith(
                                      fontSize: 16.0 * getFontWidth(context),
                                      color: GRAY060,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 8.0 * getScaleWidth(context)),
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: (dayCount / 7).round(),
                        itemBuilder: (BuildContext context, int index) {
                          if (indexCount >= dayCount) {
                            indexCount = 0;
                          }
                          var date = days[indexCount]["date"];
                          return Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    width: 1.0, color: OUTLINE),
                              ),
                            ),
                            width: 288.0 * getScaleWidth(context),
                            height: 60.0 * getScaleWidth(context),
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 7,
                              itemBuilder: (BuildContext context, int index2) {
                                indexCount++;
                                var date = days[indexCount - 1]["date"];
                                var inMonth = days[indexCount - 1]["inMonth"];
                                return Padding(
                                  padding: EdgeInsets.only(
                                      left: index2 == 0
                                          ? 0.0
                                          : 6.0 * getScaleWidth(context)),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (index2 != 0 && index2 != 6 &&
                                            inMonth) {
                                          selectDate = date;
                                        }
                                      });
                                    },
                                    child: Container(
                                      decoration: selectDate ==
                                          days[indexCount - 1]["date"]
                                          ? BoxDecoration(
                                        color: WHITE,
                                        border: Border.all(
                                            color: MAIN_COLOR,
                                            width: 2.0
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            4.0),
                                        boxShadow: const [
                                          BoxShadow(
                                              blurRadius: 4.0,
                                              color: Color.fromRGBO(
                                                  191, 88, 19, 0.75)
                                          )
                                        ],
                                      )
                                          : null,
                                      width: 36.0 * getScaleWidth(context),
                                      height: 60.0 * getScaleWidth(context),
                                      child: Center(
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height:
                                              4.0 * getScaleWidth(context),
                                            ),
                                            Text(
                                              days[indexCount - 1]["day"]
                                                  .toString(),
                                              style: BODY1_REGULAR.copyWith(
                                                fontSize: 12.0 *
                                                    getFontWidth(context),
                                                color: days[indexCount - 1]
                                                ["inMonth"]
                                                    ? index2 == 0 || index2 == 6
                                                    ? GRAY020
                                                    : GRAY090
                                                    : GRAY020,
                                              ),
                                            ),
                                            SizedBox(
                                              height:
                                              7.0 * getScaleWidth(context),
                                            ),
                                            if (days[indexCount -
                                                1]["inMonth"] &&
                                                days[indexCount -
                                                    1]["viewCheck"] ==
                                                    false &&
                                                index2 != 0 &&
                                                index2 != 6)
                                              Container(
                                                width: 24.0 *
                                                    getScaleWidth(context),
                                                height: 24.0 *
                                                    getScaleWidth(context),
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: LIGHT_BG2,
                                                ),
                                              ),
                                            if (days[indexCount -
                                                1]["inMonth"] &&
                                                days[indexCount -
                                                    1]["viewCheck"] &&
                                                index2 != 0 &&
                                                index2 != 6)
                                              Container(
                                                width: 24.0 *
                                                    getScaleWidth(context),
                                                height: 24.0 *
                                                    getScaleWidth(context),
                                                child: Image.asset(
                                                    'asset/img/icons/calendar_check_icon.png'),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
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
                                bottomLeft: Radius.circular(8.0)),
                            color: GRAY020,
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
                    ),
                    Expanded(
                      child: GestureDetector(
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
                                bottomRight: Radius.circular(8.0)),
                            color: MAIN_COLOR,
                          ),
                          child: Text(
                            '선택',
                            style: BODY3_BOLD.copyWith(
                              fontSize: 16.0 * getFontWidth(context),
                              color: WHITE,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  insertDays(int year, int month) {
    days.clear();

    /*
      이번달 채우기
      => 이번달의 마지막날을 구해 1일부터 마지막 날까지 추기
    */
    int lastDay = DateTime(year, month + 1, 0).day;
    for (var i = 1; i <= lastDay; i++) {
      days.add({
        "year": year,
        "month": month,
        "day": i,
        "date": "$year-$month-$i",
        "inMonth": true,
        "picked": false,
        "viewCheck": i % 2 ==0 ? true : false,
      });
    }

    if (DateTime(year, month, 1).weekday == 6) {
      dayCount = 42;
    } else if (DateTime(year, month, 1).weekday == 5) {
      if (lastDay == 31) {
        dayCount = 42;
      } else {
        dayCount = 35;
      }
    } else {
      dayCount = 35;
    }

    /*
      이번달 1일의 요일 : DateTime(year, month, 1).weekday
      => 7이면(일요일) 상관x
      => 아니면 비어있는 요일만큼 지난달 채우기
    */
    if (DateTime(year, month, 1).weekday != 7) {
      var temp = [];
      int prevLastDay = DateTime(year, month, 0).day;
      for (var i = DateTime(year, month, 1).weekday - 1; i >= 0; i--) {
        temp.add({
          "year": year,
          "month": month - 1,
          "day": prevLastDay - i,
          "date": "$year-${month - 1}-${prevLastDay - i}",
          "inMonth": false,
          "picked": false,
        });
      }
      days = [...temp, ...days];
    }

    /*
      6줄을 유지하기 위해 남은 날 채우기
      => 6*7 = 42. 42개까지
    */
    var temp = [];
    for (var i = 1; i <= dayCount - days.length; i++) {
      temp.add({
        "year": year,
        "month": month + 1,
        "day": i,
        "date": "$year-${month + 1}-$i",
        "inMonth": false,
        "picked": false,
      });
    }

    days = [...days, ...temp];
  }
}
