import 'package:arami/common/layout/default_layout.dart';
import 'package:arami/home/component/free_content_card.dart';
import 'package:arami/home/component/step_books_card.dart';
import 'package:arami/home/component/todaybooks_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      logoType: true,
      appbarType: true,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TodayBooksCard(),
            FreeContentCard(),
            StepBooksCard(),
          ],
        ),
      ),
    );
  }
}
