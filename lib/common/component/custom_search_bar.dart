import 'package:arami/common/const/colors.dart';
import 'package:arami/common/const/fonts.dart';
import 'package:arami/common/const/size.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatefulWidget {
  final String hintText;
  const CustomSearchBar({required this.hintText, Key? key}) : super(key: key);

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  late TextEditingController tc;

  @override
  void initState() {
    tc = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    tc.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38.0 * getScaleWidth(context),
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        controller: tc,
        cursorColor: OUTLINE,
        decoration: InputDecoration(
          isCollapsed: true,
          prefixIcon: Padding(
            padding: EdgeInsets.only(
              top: 9.0 * getScaleWidth(context),
              bottom: 9.0 * getScaleWidth(context),
              left: 16.0 * getScaleWidth(context),
              right: 8.0 * getScaleWidth(context),
            ),
            child: Icon(
              Icons.search,
              color: GRAY020,
            ),
          ),
          prefixIconConstraints: BoxConstraints(
            minWidth: 20.0 * getScaleWidth(context),
            minHeight: 20.0 * getScaleWidth(context),
          ),
          hintText: widget.hintText,
          hintStyle: BODY2_REGULAR.copyWith(
              fontSize: 14.0 * getFontWidth(context), color: GRAY020),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: BorderSide(
              color: OUTLINE,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4.0),
            borderSide: BorderSide(
              color: OUTLINE,
            ),
          ),
        ),
      ),
    );
  }
}
