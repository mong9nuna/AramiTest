import 'package:arami/common/const/colors.dart';
import 'package:arami/common/const/fonts.dart';
import 'package:arami/common/const/size.dart';
import 'package:arami/library/view/library_detail_screen.dart';
import 'package:flutter/material.dart';

class LibraryItemCard extends StatelessWidget {
  final Map<String, dynamic> itemList;

  const LibraryItemCard({
    required this.itemList,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 253.0 * getScaleWidth(context),
      child: Column(
        children: [
          SizedBox(
            height: 76.0 * getScaleWidth(context),
            child: Padding(
              padding: EdgeInsets.only(
                top: 24.0 * getScaleWidth(context),
                bottom: 16.0 * getScaleWidth(context),
                left: 16.0 * getScaleWidth(context),
                right: 16.0 * getScaleWidth(context),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
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
                        width: 36.0 * getScaleWidth(context),
                        height: 36.0 * getScaleWidth(context),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Image.asset(
                            itemList['icon'],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 4.0 * getScaleWidth(context),
                      ),
                      Text(
                        itemList['title'],
                        style: BODY3_BOLD.copyWith(
                          fontSize: 16.0 * getFontWidth(context),
                          color: GRAY090,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '더보기 +',
                    style: BODY1_REGULAR.copyWith(
                      fontSize: 12.0 * getFontWidth(context),
                      color: GRAY090,
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 177.0 * getScaleWidth(context),
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemCount: itemList['details'].length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: itemList['details'].length - 1 == index ? EdgeInsets.only(
                    left: 16.0 * getScaleWidth(context),
                    right: 16.0 * getScaleWidth(context),
                  ) : EdgeInsets.only(
                    left: 16.0 * getScaleWidth(context),
                  ),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => LibraryDetailScreen(),
                        ),
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 100.0 * getScaleWidth(context),
                          height: 125.0 * getScaleWidth(context),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.33),
                            border: Border.all(
                              width: 1.0,
                              color: GRAY010,
                            )
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(3.33),
                            child: Image.asset(
                              itemList['details'][index]['thumbNail'],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8.0 * getScaleWidth(context),
                        ),
                        SizedBox(
                          width: 100.0 * getScaleWidth(context),
                          child: Text(
                            itemList['details'][index]['title'],
                            style: BODY2_REGULAR.copyWith(
                              fontSize: 14.0 * getFontWidth(context),
                              color: GRAY090,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
