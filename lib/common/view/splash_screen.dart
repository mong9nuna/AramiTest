import 'package:arami/common/const/colors.dart';
import 'package:arami/common/layout/default_layout.dart';
import 'package:arami/common/view/root_tab.dart';
import 'package:arami/home/view/home_screen.dart';
import 'package:flutter/material.dart';

import '../const/size.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      pageMove();
    });
    super.initState();
  }

  void pageMove(){
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => RootTab(),
      ),
          (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      elevations: 0,
      appbarPointView: false,
      logoType: false,
      appbarType: false,
      backgroundColor: LIGHT_BG1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              alignment: Alignment.center,
              color: GRAY030,
              width: 60.0 * getScaleWidth(context),
              height: 60.0 * getScaleWidth(context),
              child: Text(
                'Logo',
              ),
            ),
          ),
          SizedBox(
            height: 16.0 * getScaleWidth(context),
          ),
          Container(
            width: 40.0 * getScaleWidth(context),
            height: 40.0 * getScaleWidth(context),
            child: CircularProgressIndicator(
              color: MAIN_COLOR,
            ),
          )
        ],
      ),
    );
  }
}
