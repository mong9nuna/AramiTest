import 'package:arami/common/const/colors.dart';
import 'package:arami/common/const/fonts.dart';
import 'package:arami/library/provider/makingbook_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomMakingBookTextField extends StatefulWidget {
  final String textID;
  final TextEditingController controller;
  final int index;
  double dx;
  double dy;

  CustomMakingBookTextField({
    required this.textID,
    required this.controller,
    required this.index,
    required this.dx,
    required this.dy,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomMakingBookTextField> createState() =>
      _CustomMakingBookTextFieldState();
}

class _CustomMakingBookTextFieldState extends State<CustomMakingBookTextField> {
  late MakingBookProvider _makingBookProvider;
  Map<String, dynamic> items = {};
  late double dx;
  late double dy;

  @override
  Widget build(BuildContext context) {
    _makingBookProvider = Provider.of<MakingBookProvider>(context);
    var index = checkIndex(widget.textID);
    return Positioned(
      top: widget.dy,
      left: widget.dx,
      child: GestureDetector(
        onPanUpdate: (info) {
          setState(() {
            widget.dx += info.delta.dx;
            widget.dy += info.delta.dy;
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Visibility(
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              visible: _makingBookProvider.containers[index]['showIcon'],
              child: GestureDetector(
                onTap: () {
                  _makingBookProvider.remove(widget.textID);
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.0),
                  child: Icon(
                    Icons.close,
                    size: 16.0,
                  ),
                ),
              ),
            ),
            IntrinsicWidth(
              child: TextField(
                onTapOutside: (event) {
                  setState(() {
                    _makingBookProvider.containers[index]['showIcon'] = false;
                  });
                },
                onTap: () {
                  setState(() {
                    _makingBookProvider.containers[index]['showIcon'] = true;
                  });
                },
                controller: widget.controller,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                cursorColor: GRAY090,
                decoration: InputDecoration(
                  hintText: '텍스트를 입력해주세요.',
                  hintStyle: BODY2_REGULAR.copyWith(
                    fontSize: 14.0,
                    color: GRAY040,
                    height: 1.5,
                  ),
                  filled: true,
                  fillColor: Color(0x80FFFFFF),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                  isDense: true,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  checkIndex(String textID) {
    int index = 0;
    for (var item in _makingBookProvider.containers) {
      if (item['textID'] == textID) {
        return index;
      }
      index++;
    }
  }
}
