import 'package:arami/common/const/colors.dart';
import 'package:arami/common/const/fonts.dart';
import 'package:arami/common/const/size.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class LibraryDetailReadingScreen extends StatefulWidget {
  const LibraryDetailReadingScreen({Key? key}) : super(key: key);

  @override
  State<LibraryDetailReadingScreen> createState() =>
      _LibraryDetailReadingScreenState();
}

class _LibraryDetailReadingScreenState
    extends State<LibraryDetailReadingScreen> {
  List<Map<String, dynamic>> itemList = [
    {
      'id': 'file01',
      'mainTitle': '아이와 함께 장난감을_1',
      'date': '2023-01-09',
      'file': 'https://www.arambooks.com/upload/activitybook_1.pdf',
      'originFileName': '활동지',
      'download': 'false',
      'innerFilePath' : '',
    },
    {
      'id': 'file02',
      'mainTitle': '아이와 함께 장난감을_2',
      'date': '2023-01-09',
      'file': 'https://www.arambooks.com/upload/testpdf.pdf',
      'originFileName': '활동지2',
      'download': 'false',
      'innerFilePath' : '',
    },
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: 32.0 * getScaleWidth(context),
            left: 16.0 * getScaleWidth(context),
            bottom: 16.0 * getScaleWidth(context),
          ),
          child: Text(
            '활동지',
            style: TITLE1_BOLD.copyWith(
              fontSize: 20.0 * getFontWidth(context),
              color: GRAY090,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.0 * getScaleWidth(context),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '영역 : 의사소통, 기본생활',
                style: BODY3_BOLD.copyWith(
                  fontSize: 16.0 * getFontWidth(context),
                  color: GRAY090,
                ),
              ),
              SizedBox(
                height: 8.0 * getScaleWidth(context),
              ),
              Text(
                '다중지능 : 자기이해, 대인관계지능',
                style: BODY2_REGULAR.copyWith(
                  fontSize: 14.0 * getFontWidth(context),
                  color: GRAY020,
                ),
              ),
              SizedBox(
                height: 24.0 * getScaleWidth(context),
              ),
              Text(
                '‘네! 네! 네!’ 는 아이들이 자신의 장난감을 수레 담으면서 물체에 대한 이름을 익히고 의사소통을 합니다. 자신의 물건에 대한 정리 정돈 습관을 배우게 됩니다.',
                style: BODY3_REGULAR.copyWith(
                  fontSize: 16.0 * getFontWidth(context),
                  color: GRAY090,
                ),
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return CustomDialog(
                          itemList: itemList,
                        );
                      });
                },
                child: SizedBox(
                  height: 80.0 * getScaleWidth(context),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 16.0 * getScaleWidth(context),
                      horizontal: 40.0 * getScaleWidth(context),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: MAIN_COLOR,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 24.0 * getScaleWidth(context),
                            height: 24.0 * getScaleWidth(context),
                            child: Image.asset(
                              'asset/img/icons/parenting_down_icon.png',
                            ),
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          Text(
                            '활동지 다운로드',
                            style: BODY3_BOLD.copyWith(
                              fontSize: 16.0 * getFontWidth(context),
                              color: WHITE,
                              height: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              insetPadding: EdgeInsets.zero,
              contentPadding: EdgeInsets.zero,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0))),
              content: Builder(
                builder: (context) {
                  return Container(
                    height: 480.0 * getScaleWidth(context),
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
                            '활동지 다운로드',
                            style: TITLE1_BOLD.copyWith(
                              fontSize: 20.0 * getFontWidth(context),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.0 * getScaleWidth(context),
                            ),
                            child: ListView.builder(
                              itemCount: itemList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return SizedBox(
                                  height: 78.0 * getScaleWidth(context),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            width:
                                                40.0 * getScaleWidth(context),
                                            height:
                                                40.0 * getScaleWidth(context),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(4.0),
                                                color: MAIN_COLOR_OP10),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Image.asset(
                                                'asset/img/icons/parenting_down_icon2.png',
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 8.0 * getScaleWidth(context),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              top:
                                                  16.0 * getScaleWidth(context),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  itemList[index]['mainTitle'],
                                                  style: BODY3_REGULAR.copyWith(
                                                    fontSize: 16.0 *
                                                        getScaleWidth(context),
                                                    color: GRAY090,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 4.0 *
                                                      getScaleWidth(context),
                                                ),
                                                Text(
                                                  itemList[index]['date'],
                                                  style: BODY1_REGULAR.copyWith(
                                                    fontSize: 12.0 *
                                                        getFontWidth(context),
                                                    color: GRAY040,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      if (itemList[index]['download'] ==
                                          'false')
                                        IconButton(
                                          padding: EdgeInsets.zero,
                                          constraints: const BoxConstraints(),
                                          onPressed: () {
                                            setState(() {
                                              itemList[index]['download'] =
                                                  'true';
                                              /*
                                              downloadFile(
                                                itemList[index]['file'],
                                                '활동지.pdf',
                                                itemList[index]['id'],
                                              );

                                               */
                                            });
                                          },
                                          icon: SizedBox(
                                            width:
                                                24.0 * getScaleWidth(context),
                                            height:
                                                24.0 * getScaleWidth(context),
                                            child: Icon(
                                              Icons.file_download_outlined,
                                              color: GRAY040,
                                            ),
                                          ),
                                        ),
                                      if (itemList[index]['download'] == 'true')
                                        SizedBox(
                                          width: 24.0 * getScaleWidth(context),
                                          height: 24.0 * getScaleWidth(context),
                                          child: Icon(
                                            Icons.done,
                                            color: MAIN_COLOR,
                                          ),
                                        ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
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
      },
    );
  }
}

class CustomDialog extends StatefulWidget {
  List<Map<String, dynamic>> itemList;

  CustomDialog({super.key, required this.itemList});

  @override
  State<StatefulWidget> createState() {
    return CustomDialogState();
  }
}

class CustomDialogState extends State<CustomDialog> {
  var progressString = "";
  var file = "";

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      content: Builder(
        builder: (context) {
          return Container(
            height: 480.0 * getScaleWidth(context),
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
                    '활동지 다운로드',
                    style: TITLE1_BOLD.copyWith(
                      fontSize: 20.0 * getFontWidth(context),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.0 * getScaleWidth(context),
                    ),
                    child: ListView.builder(
                      itemCount: widget.itemList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: 78.0 * getScaleWidth(context),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 40.0 * getScaleWidth(context),
                                    height: 40.0 * getScaleWidth(context),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                        color: MAIN_COLOR_OP10),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        'asset/img/icons/parenting_down_icon2.png',
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 8.0 * getScaleWidth(context),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 16.0 * getScaleWidth(context),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          widget.itemList[index]['mainTitle'],
                                          style: BODY3_REGULAR.copyWith(
                                            fontSize:
                                                16.0 * getScaleWidth(context),
                                            color: GRAY090,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 4.0 * getScaleWidth(context),
                                        ),
                                        Text(
                                          widget.itemList[index]['date'],
                                          style: BODY1_REGULAR.copyWith(
                                            fontSize:
                                                12.0 * getFontWidth(context),
                                            color: GRAY040,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              if (widget.itemList[index]['download'] ==
                                      'false')
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  constraints: const BoxConstraints(),
                                  onPressed: () {
                                    setState(() {
                                      downloadFile(
                                        widget.itemList[index]['file'],
                                        '활동지.pdf',
                                        widget.itemList[index]['id'],
                                        index,
                                      );
                                      widget.itemList[index]['download'] = 'ing';
                                    });
                                  },
                                  icon: SizedBox(
                                    width: 24.0 * getScaleWidth(context),
                                    height: 24.0 * getScaleWidth(context),
                                    child: Icon(
                                      Icons.file_download_outlined,
                                      color: GRAY040,
                                    ),
                                  ),
                                ),
                              if (widget.itemList[index]['download'] == 'true')
                                //await OpenFile.open(file);
                                IconButton(
                                  padding: EdgeInsets.zero,
                                  constraints: const BoxConstraints(),
                                  onPressed: () async {
                                    await OpenFile.open(file);
                                  },
                                  icon: SizedBox(
                                    width: 24.0 * getScaleWidth(context),
                                    height: 24.0 * getScaleWidth(context),
                                    child: Icon(
                                      Icons.done,
                                      color: MAIN_COLOR,
                                    ),
                                  ),
                                ),
                              if (widget.itemList[index]['download'] == 'ing')
                                SizedBox(
                                  width: 24.0 * getScaleWidth(context),
                                  height: 24.0 * getScaleWidth(context),
                                  child: CircularProgressIndicator(
                                    color: MAIN_COLOR,
                                  ),
                                ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
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
  }

  Future<void> downloadFile(String url, String filename, String fileID, int index,) async {
    var dio = Dio();

    try {
      var dir = await getTemporaryDirectory();

      var response = await dio.download(
        url,
        '${dir.path}/$filename',
        onReceiveProgress: (rec, total) {
          file = '${dir.path}/$filename';
          setState(() {
            //downloading = true;
            progressString = '${((rec / total) * 100).toStringAsFixed(0)}%';
          });
        },
        //options: Options(sendTimeout: 30000, receiveTimeout: 30000),
      );
    } catch (e) {
      print(e);
    }
    setState(() {
      widget.itemList[index]['download'] = 'true';
      widget.itemList[index]['innerFilePath'] = file;
    });
    await OpenFile.open(file);
  }
}
