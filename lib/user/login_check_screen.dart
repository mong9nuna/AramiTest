import 'package:arami/common/const/colors.dart';
import 'package:arami/common/const/fonts.dart';
import 'package:arami/common/const/size.dart';
import 'package:arami/common/layout/default_layout.dart';
import 'package:flutter/material.dart';

class LoginCheckScreen extends StatefulWidget {
  const LoginCheckScreen({Key? key}) : super(key: key);

  @override
  State<LoginCheckScreen> createState() => _LoginCheckScreenState();
}

class _LoginCheckScreenState extends State<LoginCheckScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: DefaultLayout(
        appbarPointView: false,
        appbarType: true,
        logoType: false,
        appTitle: '로그인',
        elevations: 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.0 * getScaleWidth(context),
                    vertical: 24.0 * getScaleWidth(context),
                  ),
                  child: Text(
                    '기존 회원이신가요?\n휴대폰 번호로 로그인 해주세요.',
                    style: TITLE1_BOLD.copyWith(
                      fontSize: 20.0 * getFontWidth(context),
                      color: GRAY090,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.0 * getScaleWidth(context),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '휴대폰 번호',
                        style: BODY1_REGULAR.copyWith(
                          fontSize: 12.0 * getFontWidth(context),
                          color: GRAY060,
                        ),
                      ),
                      SizedBox(
                        height: 4.0 * getScaleWidth(context),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        cursorColor: OUTLINE,
                        decoration: InputDecoration(
                          hintText: '-없이 숫자만 입력',
                          hintStyle: BODY3_REGULAR.copyWith(
                            fontSize: 16.0 * getFontWidth(context),
                            color: GRAY020,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide: BorderSide(
                              color: OUTLINE,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide: BorderSide(
                              color: MAIN_COLOR,
                            ),
                          ),
                        ),
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.0 * getScaleWidth(context),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '인증번호',
                        style: BODY1_REGULAR.copyWith(
                          fontSize: 12.0 * getFontWidth(context),
                          color: GRAY060,
                        ),
                      ),
                      SizedBox(
                        height: 4.0 * getScaleWidth(context),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        cursorColor: OUTLINE,
                        decoration: InputDecoration(
                          hintText: '6자리 입력',
                          hintStyle: BODY3_REGULAR.copyWith(
                            fontSize: 16.0 * getFontWidth(context),
                            color: GRAY020,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide: BorderSide(
                              color: OUTLINE,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.0),
                            borderSide: BorderSide(
                              color: MAIN_COLOR,
                            ),
                          ),
                        ),
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: OUTLINE, width: 1.0),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  top: 8.0 * getScaleWidth(context),
                  left: 16.0 * getScaleWidth(context),
                  right: 16.0 * getScaleWidth(context),
                  bottom: 40.0 * getScaleWidth(context),
                ),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: MAIN_COLOR,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 16.0 * getScaleWidth(context),
                        ),
                        child: Text(
                          '회원가입',
                          style: BODY3_BOLD.copyWith(
                            fontSize: 16.0 * getFontWidth(context),
                            color: MAIN_COLOR,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12.0 * getScaleWidth(context),
                    ),
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: MAIN_COLOR,
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 16.0 * getScaleWidth(context),
                        ),
                        child: Text(
                          '로그인',
                          style: BODY3_BOLD.copyWith(
                            fontSize: 16.0 * getFontWidth(context),
                            color: WHITE,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
