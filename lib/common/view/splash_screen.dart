import 'package:arami/common/const/colors.dart';
import 'package:arami/common/layout/default_layout.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      backgroundColor: LIGHT_BG1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: Text(
              '스플레시',
            ),
          ),
        ],
      ),
    );
  }
}
