import 'package:arami/common/const/colors.dart';
import 'package:arami/common/const/fonts.dart';
import 'package:arami/common/const/size.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PointListCard extends StatelessWidget {
  final List<Map<String, dynamic>> itemList;

  const PointListCard({
    required this.itemList,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(
        horizontal: 16.0 * getScaleWidth_Max(context),
      ),
      shrinkWrap: true,
      itemCount: itemList.length,
      itemBuilder: (BuildContext context, int index1) {
        var dateTime = DateTime.parse(itemList[index1]['date']);
        return Padding(
          padding: EdgeInsets.only(
            bottom: 8.0 * getScaleWidth_Max(context),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat("MM.dd").format(dateTime),
                style: BODY2_BOLD.copyWith(
                  color: GRAY090,
                  fontSize: 14.0 * getFontWidth(context),
                ),
              ),
              SizedBox(
                width: 36.0 * getScaleWidth_Max(context),
              ),
              Expanded(
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: itemList[index1]['details'].length,
                  itemBuilder: (BuildContext context, int index2) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.0 * getScaleWidth_Max(context),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                itemList[index1]['details'][index2]['title'],
                                style: BODY2_REGULAR.copyWith(
                                  fontSize: 14.0 * getFontWidth(context),
                                  color: GRAY090,
                                ),
                              ),
                              Text(
                                '${itemList[index1]['details'][index2]['point']} P',
                                style: BODY3_BOLD.copyWith(
                                  fontSize: 16.0 * getFontWidth(context),
                                  color: MAIN_COLOR,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
