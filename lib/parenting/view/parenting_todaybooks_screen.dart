import 'package:arami/common/layout/default_layout.dart';
import 'package:flutter/material.dart';

class ParentingTodayBooksScreen extends StatefulWidget {
  const ParentingTodayBooksScreen({Key? key}) : super(key: key);

  @override
  State<ParentingTodayBooksScreen> createState() =>
      _ParentingTodayBooksScreenState();
}

class _ParentingTodayBooksScreenState extends State<ParentingTodayBooksScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: Text('오늘의 책활동'),
      appbarPointView: false,
      appbarType: true,
      logoType: false,
      elevations: 0,
      appTitle: '오늘의 책활동',
    );
  }
}
