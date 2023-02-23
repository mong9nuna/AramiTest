import 'package:arami/common/const/colors.dart';
import 'package:arami/common/const/fonts.dart';
import 'package:arami/common/const/size.dart';
import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {
  final Color? backgroundColor;
  final Widget child;
  final Widget? bottomNavigationBar;
  final String? appTitle;
  final bool appbarType;
  final bool logoType;

  const DefaultLayout({
    this.backgroundColor,
    required this.child,
    this.bottomNavigationBar,
    this.appTitle,
    required this.appbarType,
    required this.logoType,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? WHITE,
      body: child,
      bottomNavigationBar: bottomNavigationBar,
      appBar: appbarType ? renderAppBar(appTitle, context) : null,
    );
  }

  AppBar? renderAppBar(String? title, BuildContext context) {
    return AppBar(
      toolbarHeight: 50 * getScaleWidth(context),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 1,
      title: logoType
          ? Image.asset(
              'asset/img/logo/sample_logo.png',
              width: 60.0 * getScaleWidth(context),
              height: 20.0 * getScaleWidth(context),
            )
          : Text(
              title!,
              style: TITLE1_BOLD.copyWith(
                fontSize: 20 * getFontWidth(context),
              ),
            ),
      foregroundColor: Colors.black,
      leadingWidth: 110.0 * getScaleWidth(context),
      leading: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: GestureDetector(
          onTap: () {
            print('작동');
          },
          child: Container(
            width: 70.0 * getScaleWidth(context),
            height: 24.0 * getScaleWidth(context),
            child: Row(
              children: [
                Image.asset(
                  'asset/img/icons/point_icon.png',
                  width: 24.0 * getScaleWidth(context),
                  height: 24.0 * getScaleWidth(context),
                ),
                SizedBox(
                  width: 8.0,
                ),
                Text(
                  '999,999p',
                  style: BODY1_BOLD.copyWith(
                    color: MAIN_COLOR,
                    fontSize: 12.0 * getFontWidth(context),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 13.0),
          child: notiIcon(context),
        ),
      ],
    );
  }

  IconButton notiIcon(BuildContext context){
    return IconButton(
      constraints: BoxConstraints(),
      onPressed: () {},
      icon: Image.asset(
        'asset/img/icons/noti_new.png',
        width: 24.0 * getScaleWidth(context),
        height: 24.0 * getScaleWidth(context),
      ),
    );
  }
}
