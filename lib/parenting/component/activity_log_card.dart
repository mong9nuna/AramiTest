import 'dart:io';

import 'package:arami/common/const/colors.dart';
import 'package:arami/common/const/fonts.dart';
import 'package:arami/common/const/function.dart';
import 'package:arami/common/const/size.dart';
import 'package:flutter/material.dart';

class ActivityLogCard extends StatefulWidget {
  final Map<String, dynamic> item;

  const ActivityLogCard({
    required this.item,
    Key? key,
  }) : super(key: key);

  @override
  State<ActivityLogCard> createState() => _ActivityLogCardState();
}

class _ActivityLogCardState extends State<ActivityLogCard> {

  bool favoriteState = false;

  @override
  Widget build(BuildContext context) {
    return Container(
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
              children: [
                Image.asset(
                  widget.item['userImage'],
                  width: 32.0 * getScaleWidth(context),
                  height: 32.0 * getScaleWidth(context),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8.0 * getScaleWidth(context),
                  ),
                  child: Text(
                    widget.item['userID'],
                    style: BODY2_BOLD.copyWith(
                        fontSize: 14.0 * getFontWidth(context),
                        color: GRAY090,
                        height: 1.4),
                  ),
                ),
                Text(
                  TimeCount2(widget.item['date']),
                  style: BODY1_REGULAR.copyWith(
                    fontSize: 12.0 * getScaleWidth(context),
                    color: GRAY040,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0 * getScaleWidth(context),
              vertical: 8.0 * getScaleWidth(context),
            ),
            child: Text(
              widget.item['detail'],
              style: BODY3_REGULAR.copyWith(
                fontSize: 16.0 * getFontWidth(context),
                color: GRAY090,
              ),
            ),
          ),
          if(widget.item['imgType'] == '1')
          Container(
            height: 160.0 * getScaleWidth(context),
            child: ListView.builder(
              padding: EdgeInsets.symmetric(
                  horizontal: 16.0 * getScaleWidth(context)),
              scrollDirection: Axis.horizontal,
              itemCount: widget.item['detailImages'].length < 2
                  ? widget.item['detailImages'].length == 0
                      ? 0
                      : 1
                  : 2,
              itemBuilder: (BuildContext context, int index2) {
                if (index2 == 0 ||
                    widget.item['detailImages'].length == 2) {
                  return GestureDetector(
                    onTap: () {
                      print('활동일지 이미지 작동');
                    },
                    child: Padding(
                      padding: index2 > 0
                          ? EdgeInsets.only(left: 8.0 * getScaleWidth(context))
                          : EdgeInsets.only(left: 0),
                      child: SizedBox(
                        width: 160.0 * getScaleWidth(context),
                        height: 160.0 * getScaleWidth(context),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4.0),
                          child: Image.asset(
                            widget.item['detailImages'][index2],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  );
                } else {
                  return GestureDetector(
                    onTap: () {
                      print('추가이미지 작동');
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: 8.0 * getScaleWidth(context)),
                      child: SizedBox(
                        width: 160.0 * getScaleWidth(context),
                        height: 160.0 * getScaleWidth(context),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(4.0),
                              child: Image.asset(
                                widget.item['detailImages'][index2],
                                height: 160.0 * getScaleWidth(context),
                                width: 160.0 * getScaleWidth(context),
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0),
                                color: OP50,
                              ),
                              width: 160.0 * getScaleWidth(context),
                              height: 160.0 * getScaleWidth(context),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                '+${widget.item['detailImages'].length - 2}',
                                style: TITLE1_BOLD.copyWith(
                                  fontSize: 20.0 * getFontWidth(context),
                                  color: WHITE,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
          if(widget.item['imgType'] == '2')
            Container(
              height: 160.0 * getScaleWidth(context),
              child: ListView.builder(
                padding: EdgeInsets.symmetric(
                    horizontal: 16.0 * getScaleWidth(context)),
                scrollDirection: Axis.horizontal,
                itemCount: widget.item['detailImages'].length < 2
                    ? widget.item['detailImages'].length == 0
                    ? 0
                    : 1
                    : 2,
                itemBuilder: (BuildContext context, int index2) {
                  if (index2 == 0 ||
                      widget.item['detailImages'].length == 2) {
                    return GestureDetector(
                      onTap: () {
                        print('활동일지 이미지 작동');
                      },
                      child: Padding(
                        padding: index2 > 0
                            ? EdgeInsets.only(left: 8.0 * getScaleWidth(context))
                            : EdgeInsets.only(left: 0),
                        child: SizedBox(
                          width: 160.0 * getScaleWidth(context),
                          height: 160.0 * getScaleWidth(context),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4.0),
                            child: Image.file(
                              File(widget.item['detailImages'][index2]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return GestureDetector(
                      onTap: () {
                        print('추가이미지 작동');
                      },
                      child: Padding(
                        padding:
                        EdgeInsets.only(left: 8.0 * getScaleWidth(context)),
                        child: SizedBox(
                          width: 160.0 * getScaleWidth(context),
                          height: 160.0 * getScaleWidth(context),
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(4.0),
                                child: Image.asset(
                                  widget.item['detailImages'][index2],
                                  height: 160.0 * getScaleWidth(context),
                                  width: 160.0 * getScaleWidth(context),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.0),
                                  color: OP50,
                                ),
                                width: 160.0 * getScaleWidth(context),
                                height: 160.0 * getScaleWidth(context),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  '+${widget.item['detailImages'].length - 2}',
                                  style: TITLE1_BOLD.copyWith(
                                    fontSize: 20.0 * getFontWidth(context),
                                    color: WHITE,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          SizedBox(
            height: 8.0 * getScaleWidth(context),
          ),
          GestureDetector(
            onTap: () {
              setState(
                () {
                  print('좋아요 작동');
                  if (favoriteState) {
                    favoriteState = false;
                  } else {
                    favoriteState = true;
                  }
                },
              );
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 4.0 * getScaleWidth(context),
                horizontal: 16.0 * getScaleWidth(context),
              ),
              child: Row(
                children: [
                  SizedBox(
                    height: 16.0 * getScaleWidth(context),
                    width: 16.0 * getScaleWidth(context),
                    child: FittedBox(
                      child: Icon(
                        Icons.favorite_border,
                        color: favoriteState ? MAIN_COLOR : GRAY040,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 4.0 * getScaleWidth(context),
                  ),
                  Text(
                    '좋아요 ${widget.item['favoriteCount']}',
                    style: BODY1_REGULAR.copyWith(
                      fontSize: 12.0 * getFontWidth(context),
                      color: favoriteState ? MAIN_COLOR : GRAY040,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 8.0 * getScaleWidth(context),
          ),
          Container(
            height: 30.0 * getScaleWidth(context),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.item['tags'].length,
              itemBuilder: (BuildContext context, int index3) {
                return Padding(
                  padding: index3 == 0
                      ? EdgeInsets.only(
                          left: 16.0 * getScaleWidth(context),
                          right: 4.0 * getScaleWidth(context),
                        )
                      : EdgeInsets.symmetric(
                          horizontal: 4.0 * getScaleWidth(context)),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      border: Border.all(
                        width: 1.0,
                        color: OUTLINE,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.0 * getScaleWidth(context),
                        vertical: 4.0 * getScaleWidth(context),
                      ),
                      child: Text(
                        '# ${widget.item['tags'][index3]}',
                        style: BODY2_REGULAR.copyWith(
                          fontSize: 14.0 * getFontWidth(context),
                          color: GRAY040,
                          height: 1.3,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 16.0 * getScaleWidth(context),
          ),
          Divider(
            height: 1,
            color: OUTLINE,
          )
        ],
      ),
    );
  }
}
