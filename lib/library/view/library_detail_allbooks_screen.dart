import 'package:arami/common/const/colors.dart';
import 'package:arami/common/const/fonts.dart';
import 'package:arami/common/const/size.dart';
import 'package:flutter/material.dart';

class LibraryDetailAllbooksScreen extends StatelessWidget {
  const LibraryDetailAllbooksScreen({Key? key}) : super(key: key);

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
            '전집 내 다른 책 둘러보기',
            style: TITLE1_BOLD.copyWith(
              fontSize: 20.0 * getFontWidth(context),
              color: GRAY090,
            ),
          ),
        ),
      ],
    );
  }
}
