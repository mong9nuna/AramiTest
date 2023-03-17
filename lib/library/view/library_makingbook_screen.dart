import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:arami/common/const/colors.dart';
import 'package:arami/common/const/fonts.dart';
import 'package:arami/common/const/size.dart';
import 'package:arami/library/provider/makingbook_provider.dart';
import 'package:provider/provider.dart';

import '../../common/layout/default_layout.dart';
import '../component/custom_makingbook_textfield.dart';

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
  var globalKey = GlobalKey();
  late MakingBookProvider _makingBookProvider;
  int _minutes = 0;
  int _seconds = 0;
  late Timer _Timer;
  bool isLoading = false;

  bool inputMode = false;
  bool audioMode = false;
  bool changeMode = false;

  List<Map<String, dynamic>> imageList = [];

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
    _makingBookProvider.containers.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _makingBookProvider = Provider.of<MakingBookProvider>(context);
    return DefaultLayout(
      appbarPointView: false,
      appbarType: false,
      logoType: false,
      elevations: 1,
      child: SafeArea(
        child: Stack(
          children: [
            GestureDetector(
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
                              setState(() {
                                isLoading = true;
                                if (tcList.isNotEmpty) {
                                  _capture(true);
                                }
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: 39.0 * getScaleWidth(context),
                              height: 32.0 * getScaleWidth(context),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.0),
                                color: changeMode || tcList.isNotEmpty
                                    ? MAIN_COLOR
                                    : LIGHT_BG2,
                              ),
                              child: Text(
                                '저장',
                                style: BODY1_REGULAR.copyWith(
                                  fontSize: 12.0 * getFontWidth(context),
                                  color: changeMode || tcList.isNotEmpty
                                      ? WHITE
                                      : GRAY020,
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
                          RepaintBoundary(
                            key: globalKey,
                            child: SizedBox(
                              height: 238.0 * getScaleWidth(context),
                              child: PageView.builder(
                                controller: pageController,
                                onPageChanged: (value) {
                                  setState(() {
                                    pageIndex = value + 1;
                                  });
                                },
                                physics: const NeverScrollableScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: makingBookItem['detailImages'].length,
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onTapDown: (details) {
                                      if (inputMode) {
                                        textFieldInput(details.localPosition.dx,
                                            details.localPosition.dy);
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
                                          children: _makingBookProvider.containers
                                              .map<Widget>((e) {
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
                                        _capture(false);
                                        pageController.previousPage(
                                            duration: Duration(milliseconds: 10),
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
                                        _capture(false);
                                        pageController.nextPage(
                                            duration: Duration(milliseconds: 10),
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
            if(isLoading)
            Container(
              decoration: BoxDecoration(
                color: OP30,
              ),
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: SizedBox(
                width: 48.0 * getScaleWidth(context),
                height: 48.0 * getScaleWidth(context),
                child: CircularProgressIndicator(
                  color: MAIN_COLOR,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void textFieldInput(double dx, double dy) {
    TextEditingController tc = TextEditingController();
    tcList.add(tc);
    Map<String, dynamic> item = {};
    item['index'] = pageIndex;
    String textID = 'text${num++}';
    item['textID'] = textID;
    item['showIcon'] = false;
    item['dx'] = dx;
    item['dy'] = dy;
    item['item'] = CustomMakingBookTextField(
      textID: textID,
      controller: tc,
      index: pageIndex,
      dx: dx,
      dy: dy,
    );
    setState(() {
      _makingBookProvider.add(item);
    });
    print(_makingBookProvider.containers);
  }

  Widget AudioBookInput() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 24.0 * getScaleWidth(context),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              bottom: 16.0 * getScaleWidth(context),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _minutes <= 9
                      ? _minutes.toString().padLeft(2, '0')
                      : _minutes.toString().padLeft(2, ''),
                  style: TITLE2_BOLD.copyWith(
                      fontSize: 24.0 * getFontWidth(context),
                      color: GRAY090,
                      height: 1),
                ),
                Text(
                  ':',
                  style: TITLE2_BOLD.copyWith(
                      fontSize: 24.0 * getFontWidth(context),
                      color: GRAY090,
                      height: 1),
                ),
                Text(
                  _seconds <= 9
                      ? _seconds.toString().padLeft(2, '0')
                      : _seconds.toString().padLeft(2, ''),
                  style: TITLE2_BOLD.copyWith(
                      fontSize: 24.0 * getFontWidth(context),
                      color: GRAY090,
                      height: 1),
                ),
              ],
            ),
          ),
          Container(
            width: 168.0 * getScaleWidth(context),
            child: Row(
              mainAxisAlignment: changeMode
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (audioMode) {
                        if (changeMode) {
                          changeMode = false;
                          audioMode = false;
                          _ResetTimer();
                        } else {
                          changeMode = true;
                          _StopTimer();
                        }
                      } else {
                        _StartTimer();
                        audioMode = true;
                      }
                    });
                    print('$audioMode : $changeMode');
                  },
                  child: Container(
                    height: 60.0 * getScaleWidth(context),
                    width: 60.0 * getScaleWidth(context),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        30.0 * getScaleWidth(context),
                      ),
                      color: MAIN_COLOR,
                    ),
                    child: Icon(
                      changeMode
                          ? Icons.replay
                          : audioMode
                              ? Icons.stop_circle_outlined
                              : Icons.keyboard_voice_rounded,
                      size: 24.0,
                      color: WHITE,
                    ),
                  ),
                ),
                if (changeMode == true)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (changeMode) {
                          _ResetTimer();
                          _StartTimer();
                        }
                      });
                    },
                    child: Container(
                      height: 60.0 * getScaleWidth(context),
                      width: 60.0 * getScaleWidth(context),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          30.0 * getScaleWidth(context),
                        ),
                        color: MAIN_COLOR,
                      ),
                      child: Icon(
                        Icons.play_circle_outline,
                        size: 24.0,
                        color: WHITE,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
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

  void _StartTimer() {
    _Timer = Timer.periodic(
      Duration(
        seconds: 1,
      ),
      (timer) {
        setState(() {
          _seconds++;
          if (_seconds == 60) {
            _seconds = 0;
            _minutes += 1;
          }
          if (_minutes == 1) {
            _StopTimer();
          }
        });
      },
    );
  }

  void _StopTimer() {
    _Timer.cancel();
  }

  void _ResetTimer() {
    setState(() {
      _minutes = 0;
      _seconds = 0;
    });
  }

  Future<bool> _capture(bool save) async {
    bool setBool = false;
    print("START CAPTURE");
    Map<String, dynamic> item = {};
    var renderObject = globalKey.currentContext!.findRenderObject();
    if (renderObject is RenderRepaintBoundary) {
      var boundary = renderObject;
      ui.Image image = await boundary.toImage(pixelRatio: 2.0);
      item['index'] = pageIndex;
      item['image'] = image;
      imageList.removeWhere(
        (element) {
          return element['index'] == pageIndex;
        },
      );
      imageList.add(item);
      //checkPage();
      if (save) {
        if (imageList.length != makingBookItem['detailImages'].length) {
          print(
              "${imageList.length} : ${makingBookItem['detailImages'].length}");
          int count = makingBookItem['detailImages'].length - imageList.length;
          int minCount = imageList.length + 1;
          print(minCount);
          for (minCount; minCount <= makingBookItem['detailImages'].length; minCount++) {
            print('이미지넣기 시작 $minCount');
            Map<String, dynamic> item = {};
            ui.Image image =
                await loadUiImage(makingBookItem['detailImages'][minCount-1]);
            item['index'] = minCount;
            item['image'] = image;
            imageList.add(item);
          }
        }
        imageList.sort((a, b) => a['index'].compareTo(b['index']));
        for (var element in imageList) {
          print('세이브 아이템 : $element');
          await element['image'].toByteData(format: ui.ImageByteFormat.png);
          final directory = (await getApplicationDocumentsDirectory()).path;
          ByteData? byteData =
          await element['image'].toByteData(format: ui.ImageByteFormat.png);
          Uint8List? pngBytes = byteData?.buffer.asUint8List();
          //print(pngBytes);
          File imgFile = File('$directory/screenshot${element['index']}.png');
          await imgFile.writeAsBytes(pngBytes as List<int>);
          print("FINISH CAPTURE ${imgFile.path}");
        }
        imageList.clear();
      }
    }
    setState(() {
      isLoading = false;
    });
    return setBool;
  }

  Future<ui.Image> loadUiImage(String assetPath) async {
    final data = await rootBundle.load(assetPath);
    final list = Uint8List.view(data.buffer);
    final completer = Completer<ui.Image>();
    ui.decodeImageFromList(list, completer.complete);
    return completer.future;
  }
}
