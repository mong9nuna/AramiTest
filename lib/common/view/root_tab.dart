import 'package:arami/common/const/colors.dart';
import 'package:arami/common/const/fonts.dart';
import 'package:arami/common/const/size.dart';
import 'package:arami/common/layout/default_layout.dart';
import 'package:arami/home/view/home_screen.dart';
import 'package:arami/library/view/library_main_screen.dart';
import 'package:arami/parenting/view/parenting_main_screen.dart';
import 'package:flutter/material.dart';

class RootTab extends StatefulWidget {
  const RootTab({Key? key}) : super(key: key);

  @override
  State<RootTab> createState() => _RootTabState();
}

class _RootTabState extends State<RootTab> with SingleTickerProviderStateMixin {
  bool logoListener = true;
  String appTitle = '';
  late TabController controller;
  int index = 0;
  List<Image> IconsImages = [
    Image.asset('asset/img/icons/home_default_icon.png'),
    Image.asset('asset/img/icons/home_active_icon.png'),
    Image.asset('asset/img/icons/home_active_icon.png'),
    Image.asset('asset/img/icons/parenting_default_icon.png'),
    Image.asset('asset/img/icons/parenting_active_icon.png'),
    Image.asset('asset/img/icons/library_default_icon.png'),
    Image.asset('asset/img/icons/library_active_icon.png'),
    Image.asset('asset/img/icons/mypage_default_icon.png'),
    Image.asset('asset/img/icons/mypage_active_icon.png'),
  ];

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 4, vsync: this);
    controller.addListener(tabListener);
  }
@override
  void didChangeDependencies() {
  for(int i = 0; i < IconsImages.length; i++){
    precacheImage(IconsImages[i].image, context);
  }
    super.didChangeDependencies();
  }
  @override
  void dispose() {
    controller.removeListener(tabListener);
    super.dispose();
  }

  void tabListener() {
    setState(
      () {
        index = controller.index;
        /*
        if (index != 0) {
          logoListener = false;
          switch(index) {
            case 1 :
            appTitle = '책육아';
            break;

            case 2 :
            appTitle = '라이브러리';
            break;

            case 3 :
            appTitle = '마이페이지';
            break;
          }
        } else {
          logoListener = true;
        }

       */
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      elevations: 1,
      appbarPointView: true,
      logoType: true,
      appbarType: true,
      notiButton: true,
      bottomNavigationBar: SizedBox(
        height: 50.0 * getScaleWidth(context),
        child: BottomNavigationBar(
          backgroundColor: WHITE,
          selectedItemColor: MAIN_COLOR_IMPACT,
          unselectedItemColor: GRAY050,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          type: BottomNavigationBarType.fixed,
          onTap: (int index) {
            controller.animateTo(index);
          },
          currentIndex: index,
          items: [
            BottomNavigationBarItem(
              icon: _buildContainer(
                  'asset/img/icons/home_default_icon.png', '홈', false),
              activeIcon: _buildContainer(
                  'asset/img/icons/home_active_icon.png', '홈', true),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: _buildContainer(
                  'asset/img/icons/parenting_default_icon.png', '책육아', false),
              activeIcon: _buildContainer(
                  'asset/img/icons/parenting_active_icon.png', '책육아', true),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: _buildContainer(
                  'asset/img/icons/library_default_icon.png', '라이브러리', false),
              activeIcon: _buildContainer(
                  'asset/img/icons/library_active_icon.png', '라이브러리', true),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: _buildContainer(
                  'asset/img/icons/mypage_default_icon.png', '마이페이지', false),
              activeIcon: _buildContainer(
                  'asset/img/icons/mypage_active_icon.png', '마이페이지', true),
              label: '',
            ),
          ],
        ),
      ),
      child: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: [
          const HomeScreen(),
          const ParentingMainScreen(),
          const LibraryMainScreen(),
          Center(
            child: Container(
              child: Text('마이페이지'),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildContainer(String imgNm, String text, bool activeType) {
    return Container(
      decoration: BoxDecoration(
        color: activeType ? MAIN_COLOR_OP10 : WHITE,
        borderRadius: BorderRadius.circular(4.0),
      ),
      width: 70 * getScaleWidth(context),
      height: 44 * getScaleWidth(context),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imgNm,
            width: 24 * getScaleWidth(context),
            height: 24 * getScaleWidth(context),
          ),
          Text(
            text,
            style: BODY1_REGULAR.copyWith(
                fontSize: 12 * getFontWidth(context),
                color: activeType ? MAIN_COLOR_IMPACT : GRAY050),
          ),
        ],
      ),
    );
  }
}
