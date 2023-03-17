import 'package:arami/common/const/colors.dart';
import 'package:arami/common/const/fonts.dart';
import 'package:arami/common/const/size.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class CustomDownloadDialog extends StatefulWidget {
  List<Map<String, dynamic>> itemList;

  CustomDownloadDialog({
    required this.itemList,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomDownloadDialog> createState() => _CustomDownloadDialogState();
}

class _CustomDownloadDialogState extends State<CustomDownloadDialog> {

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
