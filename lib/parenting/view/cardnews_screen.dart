import 'package:arami/common/component/custom_search_bar.dart';
import 'package:arami/common/const/size.dart';
import 'package:arami/library/view/parenting_parentaledu_detail_screen.dart';
import 'package:flutter/material.dart';

class CardnewsScreen extends StatefulWidget {
  const CardnewsScreen({Key? key}) : super(key: key);

  @override
  State<CardnewsScreen> createState() => _CardnewsScreenState();
}

class _CardnewsScreenState extends State<CardnewsScreen> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> cardnewsItem = [
      {
        'id': '001',
        'thumbnail': 'asset/img/sample/parenting_cardnews_sample.png',
      },
      {
        'id': '002',
        'thumbnail': 'asset/img/sample/parenting_cardnews_sample.png',
      },
      {
        'id': '003',
        'thumbnail': 'asset/img/sample/parenting_cardnews_sample.png',
      },
      {
        'id': '001',
        'thumbnail': 'asset/img/sample/parenting_cardnews_sample.png',
      },
      {
        'id': '002',
        'thumbnail': 'asset/img/sample/parenting_cardnews_sample.png',
      },
      {
        'id': '003',
        'thumbnail': 'asset/img/sample/parenting_cardnews_sample.png',
      },
      {
        'id': '001',
        'thumbnail': 'asset/img/sample/parenting_cardnews_sample.png',
      },
      {
        'id': '002',
        'thumbnail': 'asset/img/sample/parenting_cardnews_sample.png',
      },
      {
        'id': '003',
        'thumbnail': 'asset/img/sample/parenting_cardnews_sample.png',
      },
      {
        'id': '001',
        'thumbnail': 'asset/img/sample/parenting_cardnews_sample.png',
      },
      {
        'id': '002',
        'thumbnail': 'asset/img/sample/parenting_cardnews_sample.png',
      },
      {
        'id': '003',
        'thumbnail': 'asset/img/sample/parenting_cardnews_sample.png',
      },
      {
        'id': '001',
        'thumbnail': 'asset/img/sample/parenting_cardnews_sample.png',
      },
      {
        'id': '002',
        'thumbnail': 'asset/img/sample/parenting_cardnews_sample.png',
      },
      {
        'id': '003',
        'thumbnail': 'asset/img/sample/parenting_cardnews_sample.png',
      },
      {
        'id': '001',
        'thumbnail': 'asset/img/sample/parenting_cardnews_sample.png',
      },
      {
        'id': '002',
        'thumbnail': 'asset/img/sample/parenting_cardnews_sample.png',
      },
      {
        'id': '003',
        'thumbnail': 'asset/img/sample/parenting_cardnews_sample.png',
      },
      {
        'id': '001',
        'thumbnail': 'asset/img/sample/parenting_cardnews_sample.png',
      },
      {
        'id': '002',
        'thumbnail': 'asset/img/sample/parenting_cardnews_sample.png',
      },
      {
        'id': '003',
        'thumbnail': 'asset/img/sample/parenting_cardnews_sample.png',
      },
      {
        'id': '001',
        'thumbnail': 'asset/img/sample/parenting_cardnews_sample.png',
      },
      {
        'id': '002',
        'thumbnail': 'asset/img/sample/parenting_cardnews_sample.png',
      },
      {
        'id': '003',
        'thumbnail': 'asset/img/sample/parenting_cardnews_sample.png',
      },
    ];

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.0 * getScaleWidth(context),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 12.0 * getScaleWidth(context),
              ),
              child: const CustomSearchBar(
                hintText: '내용으로 검색해 주세요.',
              ),
            ),
            GridView.builder(
              itemCount: cardnewsItem.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1,
                mainAxisSpacing: 8.0 * getScaleWidth_Max(context),
                crossAxisSpacing: 8.0 * getScaleWidth_Max(context),
              ),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            ParentingParentaleduDetailScreen(),
                      ),
                    );
                  },
                  child: SizedBox(
                    width: 104.0 * getScaleWidth_Max(context),
                    height: 104.0 * getScaleWidth_Max(context),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4.0),
                      child: Image.asset(cardnewsItem[index]['thumbnail']),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
