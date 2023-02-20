import 'package:arami/common/layout/default_layout.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: Container(
        alignment: Alignment.center,
        child: Text('홈화면'),
      ),
    );
  }
}
