import 'package:arami/common/const/colors.dart';
import 'package:arami/common/const/fonts.dart';
import 'package:arami/common/const/size.dart';
import 'package:flutter/material.dart';

class LibraryDetailLinkedScreen extends StatefulWidget {
  const LibraryDetailLinkedScreen({Key? key}) : super(key: key);

  @override
  State<LibraryDetailLinkedScreen> createState() =>
      _LibraryDetailLinkedScreenState();
}

class _LibraryDetailLinkedScreenState extends State<LibraryDetailLinkedScreen> {
  List<Map<String, dynamic>> itemList = [
    {
      'mainTitle': '베이비올 아기',
      'icon': 'asset/img/sample/library_sample_icon_1.png',
      'thumbNail': 'asset/img/sample/free_content_5.jpg',
      'title': '어쩜 그리 예쁘지?',
      'detail': '아이들이 공기의 소중함을 깨닫는 책으로 환경을 보호하는 마음을 가질 수 있습니다.'
    },
    {
      'mainTitle': '경제특공대',
      'icon': 'asset/img/sample/library_sample_icon_6.png',
      'thumbNail': 'asset/img/sample/free_content_4.jpg',
      'title': '나는야 뿡뿡 변기',
      'detail': '아이들이 공기의 소중함을 깨닫는 책으로 환경을 보호하는 마음을 가질 수 있습니다.'
    },
    {
      'mainTitle': '베이비올 아기',
      'icon': 'asset/img/sample/library_sample_icon_1.png',
      'thumbNail': 'asset/img/sample/free_content_7.jpg',
      'title': '옳지, 옳지!',
      'detail': '아이들이 공기의 소중함을 깨닫는 책으로 환경을 보호하는 마음을 가질 수 있습니다.'
    },
    {
      'mainTitle': '과학특공대',
      'icon': 'asset/img/sample/library_sample_icon_4.png',
      'thumbNail': 'asset/img/sample/free_content_8.jpg',
      'title': '양 다섯 마리가',
      'detail': '아이들이 공기의 소중함을 깨닫는 책으로 환경을 보호하는 마음을 가질 수 있습니다.'
    },
  ];

  int selected = 0;
  late FixedExtentScrollController _scrollController;

  @override
  void initState() {
    _scrollController = FixedExtentScrollController(initialItem: 0);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
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
            bottom: 24.0 * getScaleWidth(context),
          ),
          child: Text(
            '함께 읽어 보아요!',
            style: TITLE1_BOLD.copyWith(
              fontSize: 20.0 * getFontWidth(context),
              color: GRAY090,
            ),
          ),
        ),
        Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 100.0 * getScaleWidth(context),
                height: 125.0 * getScaleWidth(context),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    border: Border.all(
                      width: 1.0,
                      color: GRAY010,
                    )),
                child: Image.asset('asset/img/sample/free_content_2.png'),
              ),
            ),
            SizedBox(
              height: 232.0 * getScaleWidth(context),
              child: RotatedBox(
                quarterTurns: -1,
                child: ListWheelScrollView.useDelegate(
                  physics: const FixedExtentScrollPhysics(),
                  perspective: 0.005,
                  // diameterRatio: 1.5,
                  squeeze: 0.75,
                  onSelectedItemChanged: (x) {
                    setState(() {
                      selected = x;
                    });
                  },
                  controller: _scrollController,
                  itemExtent: 120.0 * getScaleWidth(context),
                  childDelegate: ListWheelChildLoopingListDelegate(
                    children: itemList.map((e) => RotatedBox(
                      quarterTurns: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            border: Border.all(
                              width: 1.0,
                              color: GRAY010,
                            )),
                        child: Image.asset(e['thumbNail']),
                      ),
                    )).toList(),
                  ),
                ),
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: (16.0 * 4) * getScaleWidth(context),
            height: 8.0 * getScaleWidth(context),
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 4.0 * getScaleWidth(context),
                  ),
                  child: Container(
                    width: 8.0 * getScaleWidth(context),
                    height: 8.0 * getScaleWidth(context),
                    decoration: BoxDecoration(
                        color: selected == index ? GRAY020 : LIGHT_BG2,
                        shape: BoxShape.circle),
                  ),
                );
              },
            ),
          ),
        ),
        SizedBox(
          height: 24.0 * getScaleWidth(context),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.0 * getScaleWidth(context),
          ),
          child: Container(
            decoration: BoxDecoration(
                color: LIGHT_BG3,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 4.0,
                    offset: Offset(0, 4.0),
                    color: Color.fromRGBO(0, 0, 0, 0.25),
                  )
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 16.0 * getScaleWidth(context),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: WHITE,
                        shape: BoxShape.circle,
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.2),
                            blurRadius: 1.5,
                          ),
                        ],
                      ),
                      width: 48.0 * getScaleWidth(context),
                      height: 48.0 * getScaleWidth(context),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Image.asset(
                          itemList[selected]['icon'],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 4.0 * getScaleWidth(context),
                    ),
                    Text(
                      itemList[selected]['mainTitle'],
                      style: BODY3_BOLD.copyWith(
                        fontSize: 16.0 * getFontWidth(context),
                        color: GRAY090,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8.0 * getScaleWidth(context),
                ),
                Text(
                  itemList[selected]['title'],
                  style: BODY2_BOLD.copyWith(
                    fontSize: 14.0 * getFontWidth(context),
                    color: GRAY090,
                  ),
                ),
                SizedBox(
                  height: 16.0 * getScaleWidth(context),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0 * getScaleWidth(context),
                  ),
                  child: Text(
                    itemList[selected]['detail'],
                    style: BODY2_REGULAR.copyWith(
                      fontSize: 14.0 * getFontWidth(context),
                      color: GRAY090,
                    ),
                  ),
                ),
                SizedBox(
                  height: 16.0 * getScaleWidth(context),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 16.0 * getScaleWidth(context),
        ),
      ],
    );
  }
}
