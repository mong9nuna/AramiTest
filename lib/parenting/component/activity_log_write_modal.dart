import 'dart:io';

import 'package:arami/common/const/colors.dart';
import 'package:arami/common/const/fonts.dart';
import 'package:arami/common/const/function.dart';
import 'package:arami/common/const/size.dart';
import 'package:arami/common/layout/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ActivityLogWrite extends StatefulWidget {
  const ActivityLogWrite({Key? key}) : super(key: key);

  @override
  State<ActivityLogWrite> createState() => _ActivityLogWriteState();
}

bool saveButtonActive = false;
int selectItem = 1;

class _ActivityLogWriteState extends State<ActivityLogWrite> {
  final Map<String, dynamic> activityLogList =
    {
      'id': 'activityLog01',
      'userID': '아람맘',
      'date': '2023-02-28 15:00:00',
      'userImage': 'asset/img/sample/user_sample_1.png',
      'detail': '엄마 우리 아람이가 자동차를 보면서 네네네!라고 말했다. 감동이다. 벌써 10번째 보는 책 최애책!',
      'detailImages': [
        'asset/img/sample/activity_log_sample_1.png',
        'asset/img/sample/activity_log_sample_2.png',
        'asset/img/sample/activity_log_sample_1.png',
        'asset/img/sample/activity_log_sample_2.png',
        'asset/img/sample/activity_log_sample_2.png'
      ],
      'favoriteCount': '3',
      'tags': [
        '오늘의 책활동',
        '베이비올 아기',
      ],
    };

  Map<String, dynamic> sendData = {};
  List<String> selected = [];
  List<dynamic> imageFiles = [];
  late TextEditingController tc;
  late TextEditingController tc2;

  @override
  void initState() {
    tc = TextEditingController();
    tc2 = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    tc.clear();
    tc2.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appbarPointView: false,
      appbarType: false,
      logoType: false,
      elevations: 1,
      appTitle: '활동일지 쓰기',
      child: SafeArea(
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
                            if (saveButtonActive ||
                                imageFiles.isNotEmpty ||
                                selected.isNotEmpty) {
                              _showDialog();
                            } else {
                              saveButtonActive = false;
                              Navigator.of(context).pop();
                            }
                          },
                        );
                      },
                      child: Icon(
                        Icons.close,
                        weight: 24.0 * getScaleWidth(context),
                        size: 24.0 * getScaleWidth(context),
                      ),
                    ),
                    Text(
                      '활동일지 쓰기',
                      style: TITLE1_BOLD.copyWith(
                        fontSize: 20.0 * getFontWidth(context),
                        color: GRAY090,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          saveButtonActive = false;
                          Navigator.pop(
                            context,
                            _sendData(),
                          );
                        });
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
                    Padding(
                      padding: EdgeInsets.only(
                          top: 16.0 * getScaleWidth(context),
                          left: 16.0 * getScaleWidth(context),
                          right: 16.0 * getScaleWidth(context),
                          bottom: 8.0 * getScaleWidth(context)),
                      child: SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '활동일지 공개여부',
                              style: BODY2_REGULAR.copyWith(
                                fontSize: 14.0 * getFontWidth(context),
                                color: GRAY090,
                              ),
                            ),
                            SizedBox(
                              height: 8.0 * getScaleWidth(context),
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectItem = 1;
                                    });
                                  },
                                  child: Container(
                                    height: 38.0 * getScaleWidth(context),
                                    width: 78.0 * getScaleWidth(context),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: selectItem == 1
                                            ? MAIN_COLOR
                                            : OUTLINE,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        if (selectItem == 1)
                                          Padding(
                                            padding: EdgeInsets.only(
                                              right:
                                                  4.0 * getScaleWidth(context),
                                            ),
                                            child: Icon(
                                              Icons.done,
                                              weight:
                                                  16.0 * getScaleWidth(context),
                                              size:
                                                  16.0 * getScaleWidth(context),
                                              color: MAIN_COLOR,
                                            ),
                                          ),
                                        Text(
                                          '공개',
                                          style: BODY2_BOLD.copyWith(
                                              fontSize:
                                                  14.0 * getFontWidth(context),
                                              color: selectItem == 1
                                                  ? MAIN_COLOR
                                                  : OUTLINE,
                                              height: 1.3),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 8.0 * getScaleWidth(context),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(
                                      () {
                                        selectItem = 2;
                                      },
                                    );
                                  },
                                  child: Container(
                                    height: 38.0 * getScaleWidth(context),
                                    width: 78.0 * getScaleWidth(context),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: selectItem == 2
                                            ? MAIN_COLOR
                                            : OUTLINE,
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(4.0),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        if (selectItem == 2)
                                          Padding(
                                            padding: EdgeInsets.only(
                                              right:
                                                  4.0 * getScaleWidth(context),
                                            ),
                                            child: Icon(
                                              Icons.done,
                                              weight:
                                                  16.0 * getScaleWidth(context),
                                              size:
                                                  16.0 * getScaleWidth(context),
                                              color: MAIN_COLOR,
                                            ),
                                          ),
                                        Text(
                                          '비공개',
                                          style: BODY2_BOLD.copyWith(
                                              fontSize:
                                                  14.0 * getFontWidth(context),
                                              color: selectItem == 2
                                                  ? MAIN_COLOR
                                                  : GRAY020,
                                              height: 1.3),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        right: 16.0 * getScaleWidth(context),
                        left: 16.0 * getScaleWidth(context),
                        bottom: 12.0 * getScaleWidth(context),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '관련 태그',
                            style: BODY2_REGULAR.copyWith(
                              fontSize: 14.0 * getFontWidth(context),
                              color: GRAY090,
                            ),
                          ),
                          SizedBox(
                            height: 12.0 * getScaleWidth(context),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Container(
                                  height: 30.0 * getScaleWidth(context),
                                  width: 60.0 * getScaleWidth(context),
                                  child: TextField(
                                    style: BODY2_REGULAR.copyWith(
                                        fontSize: 14.0 * getFontWidth(context),
                                        color: GRAY040,
                                        height: 1.2),
                                    maxLines: 1,
                                    cursorColor: GRAY040,
                                    textInputAction: TextInputAction.go,
                                    onSubmitted: (value) {
                                      if (value.isNotEmpty) {
                                        selected.insert(0, value);
                                        tc.text = '';
                                      }
                                    },
                                    controller: tc,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      hintText: '태그 입력',
                                      hintStyle: BODY2_REGULAR.copyWith(
                                          fontSize:
                                              14.0 * getFontWidth(context),
                                          color: GRAY040,
                                          height: 1.2),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: GRAY040),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: GRAY040),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Row(
                                  children: selected.map((s) {
                                    return Padding(
                                      padding: EdgeInsets.only(
                                        right: 14.0 * getScaleWidth(context),
                                      ),
                                      child: Container(
                                        height: 30.0 * getScaleWidth(context),
                                        child: Chip(
                                            visualDensity: const VisualDensity(
                                                horizontal: 0.0,
                                                vertical: -2.0),
                                            backgroundColor: WHITE,
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                  width: 1.0, color: OUTLINE),
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                            label: Text(
                                              '# $s',
                                              style: BODY2_REGULAR.copyWith(
                                                  fontSize: 14.0 *
                                                      getFontWidth(context),
                                                  color: GRAY040,
                                                  height: 1),
                                            ),
                                            onDeleted: () {
                                              setState(() {
                                                selected.remove(s);
                                              });
                                            }),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.0 * getScaleWidth(context),
                      ),
                      child: Divider(
                        height: 1.0,
                        color: OUTLINE,
                      ),
                    ),
                    Container(
                      height: 96.0 * getScaleWidth(context),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 8.0 * getScaleWidth(context),
                            horizontal: 16.0 * getScaleWidth(context),
                          ),
                          child: Row(
                            children: [
                              if (imageFiles.length < 5)
                                GestureDetector(
                                  onTap: () async {
                                    if (imageFiles.length < 5) {
                                      var picker = ImagePicker();
                                      var image = await picker.pickImage(
                                          source: ImageSource.gallery);
                                      setState(() {
                                        if (image != null) {
                                          imageFiles.add(image);
                                        }
                                      });
                                    } else {
                                      _showDialog();
                                    }
                                  },
                                  child: Container(
                                    width: 80.0 * getScaleWidth(context),
                                    height: 80.0 * getScaleWidth(context),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                        color: LIGHT_BG2),
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment: Alignment.center,
                                          child: SizedBox(
                                            width:
                                                24.0 * getScaleWidth(context),
                                            height:
                                                24.0 * getScaleWidth(context),
                                            child: Image.asset(
                                                'asset/img/icons/activity_log_img_add.png'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              Row(
                                children: imageFiles.map((s) {
                                  return Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 16.0 * getScaleWidth(context),
                                    ),
                                    child: Container(
                                      width: 80.0 * getScaleWidth(context),
                                      height: 80.0 * getScaleWidth(context),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                          color: LIGHT_BG2),
                                      child: Stack(
                                        children: [
                                          SizedBox(
                                            width:
                                                80.0 * getScaleWidth(context),
                                            height:
                                                80.0 * getScaleWidth(context),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                              child: Image.file(
                                                File(s.path),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              right:
                                                  2.0 * getScaleWidth(context),
                                              top: 2.0 * getScaleWidth(context),
                                            ),
                                            child: Align(
                                              alignment: Alignment.topRight,
                                              child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    imageFiles.remove(s);
                                                  });
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: WHITE,
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        blurRadius: 20.0,
                                                        offset: Offset(0, 8.0),
                                                        color: Color.fromRGBO(
                                                            0, 0, 0, 0.1),
                                                      ),
                                                      BoxShadow(
                                                        blurRadius: 8.0,
                                                        offset: Offset(0, 2.0),
                                                        color: Color.fromRGBO(
                                                            0, 0, 0, 0.1),
                                                      ),
                                                    ],
                                                  ),
                                                  width: 24.0 *
                                                      getScaleWidth(context),
                                                  height: 24.0 *
                                                      getScaleWidth(context),
                                                  child: Icon(
                                                    Icons.close,
                                                    color: GRAY020,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: 8.0 * getScaleWidth(context),
                          left: 16.0 * getScaleWidth(context),
                          right: 16.0 * getScaleWidth(context),
                          bottom: 16.0 * getScaleWidth(context),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '내용 입력',
                              style: BODY1_REGULAR.copyWith(
                                fontSize: 12.0 * getFontWidth(context),
                                color: GRAY060,
                              ),
                            ),
                            SizedBox(
                              height: 8.0 * getScaleWidth(context),
                            ),
                            TextFormField(
                              controller: tc2,
                              onChanged: (value) {
                                setState(
                                  () {
                                    if (value.length > 1) {
                                      saveButtonActive = true;
                                    } else {
                                      saveButtonActive = false;
                                    }
                                  },
                                );
                              },
                              cursorColor: OUTLINE,
                              decoration: InputDecoration(
                                hintText: '활동일지를 입력해주세요.',
                                hintStyle: BODY3_REGULAR.copyWith(
                                    fontSize: 16.0 * getFontWidth(context),
                                    color: GRAY020),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                  borderSide: BorderSide(
                                    color: OUTLINE,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                  borderSide: BorderSide(
                                    color: OUTLINE,
                                  ),
                                ),
                              ),
                              maxLines: 5,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
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
                height: 200.0 * getScaleWidth(context),
                width: 328.0 * getScaleWidth(context),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 48.0 * getScaleWidth(context),
                      ),
                      child: Column(
                        children: [
                          Text(
                            '잠시만요!',
                            style: BODY3_REGULAR.copyWith(
                              fontSize: 16.0 * getFontWidth(context),
                              color: GRAY090,
                            ),
                          ),
                          Text(
                            '중간에 멈추시면 작성한 내용이 없어집니다.',
                            style: BODY3_REGULAR.copyWith(
                              fontSize: 16.0 * getFontWidth(context),
                              color: GRAY090,
                            ),
                          ),
                        ],
                      ),
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
                                '계속 작성',
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
                                saveButtonActive = false;
                                Navigator.of(context).pop();
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
                                '나가기',
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
      },
    );
  }

  Map<String, dynamic> _sendData(){
    var images = [];
    for(int i = 0; i < imageFiles.length; i++){
      images.add(imageFiles[i].path);
    }
    sendData['id'] = 'activityLog03';
    sendData['userID'] = '아람관리자';
    sendData['userImage'] = 'asset/img/sample/user_sample_1.png';
    sendData['date'] = getToday();
    sendData['detail'] = tc2.text;
    sendData['detailImages'] = images;
    sendData['imgType'] = '2';
    sendData['favoriteCount'] = 0;
    sendData['tags'] = selected;
    print(sendData);
    return sendData;
  }
}
