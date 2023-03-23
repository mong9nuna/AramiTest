import 'package:arami/common/component/custom_search_bar.dart';
import 'package:arami/common/const/colors.dart';
import 'package:arami/common/const/fonts.dart';
import 'package:arami/common/const/size.dart';
import 'package:flutter/material.dart';

class ParentaleduScreen extends StatefulWidget {
  const ParentaleduScreen({Key? key}) : super(key: key);

  @override
  State<ParentaleduScreen> createState() => _ParentaleduScreenState();
}

class _ParentaleduScreenState extends State<ParentaleduScreen> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> parentaleduItem = [
      {
        'id': '001',
        'title': '특집 부모교육 시리즈 1편 특집 부모교육 시리즈 1편',
        'thumbNail': 'asset/img/sample/parentaledu_sample_1.png',
      },
      {
        'id': '002',
        'title': '영유아의 행복과 인권은 존중되어야 해요',
        'thumbNail': 'asset/img/sample/parentaledu_sample_2.png',
      },
      {
        'id': '003',
        'title': '하녀육아 벗어나는 방법',
        'thumbNail': 'asset/img/sample/parentaledu_sample_3.png',
      },
      {
        'id': '004',
        'title': '절대 휘둘리지 않는 방법',
        'thumbNail': 'asset/img/sample/parentaledu_sample_4.png',
      }
    ];

    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0 * getScaleWidth(context),
              vertical: 12.0 * getScaleWidth(context),
            ),
            child: const CustomSearchBar(
              hintText: '영상 제목으로 검색해 주세요.',
            ),
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: parentaleduItem.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0 * getScaleWidth(context),
                ),
                child: GestureDetector(
                  onTap: () {
                    print('영상 아이디 : ${parentaleduItem[index]['id']}작동');
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        width: 328.0 * getScaleWidth_Max(context),
                        //height: 185.0 * getScaleWidth_Max(context),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            parentaleduItem[index]['thumbNail'],
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 8.0 * getScaleWidth(context),
                          bottom: 16.0 * getScaleWidth(context),
                        ),
                        child: SizedBox(
                          width: 328.0 * getScaleWidth(context),
                          child: Text(
                            parentaleduItem[index]['title'],
                            style: BODY3_REGULAR.copyWith(
                              fontSize: 16.0 * getFontWidth(context),
                              color: GRAY090,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
