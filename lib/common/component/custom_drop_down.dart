import 'package:arami/common/const/colors.dart';
import 'package:arami/common/const/fonts.dart';
import 'package:arami/common/const/size.dart';
import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  final List<Map<String, dynamic>> itemList;
  ValueChanged? itemChange;

  CustomDropDown({
    required this.itemList,
    this.itemChange,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  String? selectItem;
  OverlayEntry? overlayEntry;
  final LayerLink layerLink = LayerLink();
  bool iconFlag = true;

  @override
  void initState() {
    selectItem = widget.itemList[0]['title'];
    super.initState();
  }

  // 드롭다운 생성.
  void _createOverlay(LayerLink layerlink) {
    if (overlayEntry == null) {
      setState(() {
        overlayEntry = _customDropdown(layerLink);
        Overlay.of(context)?.insert(overlayEntry!);
      });
    }
  }

  // 드롭다운 해제.
  void _removeOverlay() {
    setState(
      () {
        overlayEntry?.remove();
        overlayEntry = null;
      },
    );
  }

  OverlayEntry _customDropdown(LayerLink layerLink) {
    return OverlayEntry(
      builder: (context) => Align(
        alignment: Alignment.center,
        child: CompositedTransformFollower(
          offset: Offset(0, 32.0 * getScaleWidth(context)),
          link: layerLink,
          child: GestureDetector(
            onTap: () {
              overlayChange();
            },
            child: Material(
              child: Container(
                decoration: BoxDecoration(
                  color: WHITE,
                  borderRadius: BorderRadius.circular(4.0),
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.1),
                        blurRadius: 20,
                        offset: Offset(0, 8)),
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.1),
                        blurRadius: 8,
                        offset: Offset(0, 2)),
                  ],
                ),
                width: 132.0 * getScaleWidth(context),
                height: (40 * getScaleWidth(context)) * widget.itemList.length,
                child: ListView.separated(
                  padding: EdgeInsets.only(
                    top: 8.0 * getScaleWidth(context),
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.itemChange!(widget.itemList[index]['statusCode']);
                        });
                        selectItem = widget.itemList[index]['title'];
                        overlayChange();
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 0.0 * getScaleWidth(context),
                          horizontal: 12.0 * getScaleWidth(context),
                        ),
                        child: Container(
                          width: 108.0 * getScaleWidth(context),
                          height: 24.0 * getScaleWidth(context),
                          child: Text(
                            widget.itemList[index]['title'],
                            style: BODY3_REGULAR.copyWith(
                              fontSize: 16.0 * getFontWidth(context),
                              color: GRAY090,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.0),
                      child: Divider(
                        color: GRAY020,
                      ),
                    );
                  },
                  itemCount: widget.itemList.length,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        overlayChange();
      },
      child: CompositedTransformTarget(
        link: layerLink,
        child: Container(
          width: 132.0 * getScaleWidth(context),
          height: 32.0 * getScaleWidth(context),
          decoration: BoxDecoration(
              border: Border.all(width: 1.0, color: GRAY020),
              borderRadius: BorderRadius.circular(4.0)),
          child: Padding(
            padding: EdgeInsets.only(
              bottom: 4.0 * getScaleWidth(context),
              top: 4.0 * getScaleWidth(context),
              left: 12.0 * getScaleWidth(context),
              right: 5.0 * getScaleWidth(context),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectItem!,
                  style: BODY2_REGULAR.copyWith(
                    fontSize: 14.0 * getFontWidth(context),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    overlayChange();
                  },
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: iconFlag
                      ? Icon(
                          Icons.arrow_drop_down,
                          color: GRAY020,
                        )
                      : Icon(
                          Icons.arrow_drop_up,
                          color: GRAY020,
                        ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void overlayChange() {
    if (overlayEntry == null) {
      _createOverlay(layerLink);
    } else {
      _removeOverlay();
    }

    if (iconFlag) {
      iconFlag = false;
    } else {
      iconFlag = true;
    }
  }
}
