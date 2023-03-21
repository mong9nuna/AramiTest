import 'package:arami/common/component/custom_calendar_dialog.dart';
import 'package:arami/common/const/colors.dart';
import 'package:arami/common/const/fonts.dart';
import 'package:arami/common/const/size.dart';
import 'package:arami/home/view/noti_main_screen.dart';
import 'package:flutter/material.dart';

class DefaultLayout extends StatefulWidget {
  final Color? backgroundColor;
  final Widget? bottomNavigationBar;
  final String? appTitle;
  final bool appbarPointView;
  final bool appbarType;
  final bool logoType;
  final double elevations;
  final bool notiButton;
  final bool calendarButton;
  final Widget child;

  const DefaultLayout({
    this.backgroundColor,
    this.bottomNavigationBar,
    this.appTitle,
    required this.appbarPointView,
    required this.appbarType,
    required this.logoType,
    required this.elevations,
    this.notiButton = false,
    this.calendarButton = false,
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  State<DefaultLayout> createState() => _DefaultLayoutState();
}

class _DefaultLayoutState extends State<DefaultLayout> {
  late String date;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      top: false,
      child: Scaffold(
        backgroundColor: widget.backgroundColor ?? WHITE,
        body: widget.child,
        bottomNavigationBar: widget.bottomNavigationBar,
        appBar:
            widget.appbarType ? renderAppBar(widget.appTitle, context) : null,
      ),
    );
  }

  AppBar? renderAppBar(String? title, BuildContext context) {
    return AppBar(
      toolbarHeight: 50 * getScaleWidth(context),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: widget.elevations,
      title: widget.logoType
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
      leadingWidth: widget.appbarPointView
          ? 110.0 * getScaleWidth(context)
          : 50.0 * getScaleWidth(context),
      leading: widget.appbarPointView
          ? Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => NotiMainScreen(initialIndex: 1),
                    ),
                  );
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
                      const SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        '1,230p',
                        style: BODY1_BOLD.copyWith(
                          color: MAIN_COLOR,
                          fontSize: 12.0 * getFontWidth(context),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              icon: Icon(
                Icons.arrow_back,
                size: 24.0 * getScaleWidth(context),
              ),
            ),
      actions: [
        if (widget.calendarButton)
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: CalendarIcon(context),
          ),
        if (widget.notiButton)
          Padding(
            padding: EdgeInsets.only(right: 13.0),
            child: notiIcon(context),
          ),
      ],
    );
  }

  IconButton notiIcon(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      constraints: BoxConstraints(),
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => NotiMainScreen(initialIndex: 0),
          ),
        );
      },
      icon: Image.asset(
        'asset/img/icons/noti_new.png',
        width: 24.0 * getScaleWidth(context),
        height: 24.0 * getScaleWidth(context),
      ),
    );
  }

  IconButton CalendarIcon(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      constraints: BoxConstraints(),
      onPressed: () {
        setState(() {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return CustomCalendarDialog();
              });
        });
      },
      icon: Image.asset(
        'asset/img/icons/calendar_icon.png',
        width: 24.0 * getScaleWidth(context),
        height: 24.0 * getScaleWidth(context),
      ),
    );
  }
}