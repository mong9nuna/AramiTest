import 'package:flutter/material.dart';

// 이미지 기기별 스케일 조정
double getScaleWidth(BuildContext context){
  int designGuideWidth = MediaQuery.of(context).size.width > 500 ? 550 : 360;
  final diff = MediaQuery.of(context).size.width / designGuideWidth;
  return diff;
}

double getScaleHeight(BuildContext context){
  int designGuideWidth = MediaQuery.of(context).size.width > 500 ? 550 : 360;
  final diff = MediaQuery.of(context).size.height / designGuideWidth;
  return diff;
}

// 이미지 기기별 스케일 조정
double getScaleWidth_Max(BuildContext context){
  int designGuideWidth = 360;
  final diff = MediaQuery.of(context).size.width / designGuideWidth;
  return diff;
}

// 폰트 기기별 스케일 조정
double getFontWidth(BuildContext context){
  int designGuideWidth = MediaQuery.of(context).size.width > 500 ? 650 : 360;
  final diff = MediaQuery.of(context).size.width / designGuideWidth;
  return diff;
}