import 'package:flutter/material.dart';

class WKDropdown extends StatelessWidget {
  void Function() onClose;
  // Widget Function(T) itemConstructor;
  LayerLink layerLink;
  // List<T> dataList;
  List<Widget> options;

  double width;

  bool isDirectToBelow(BuildContext context) {
    if (this.layerLink.leader != null) {
      Offset offset = this.layerLink.leader!.offset;
      MediaQueryData mediaQueryData = MediaQuery.of(context);

      return offset.dy + 400 < mediaQueryData.size.height;
    }
    return true;
  }

  WKDropdown(
      {super.key,
      required this.onClose,
      required this.layerLink,
      // required this.dataList,
      required this.options,
      this.width = 250});

  @override
  Widget build(BuildContext context) {
    bool isBelow = isDirectToBelow(context);

    return Stack(
      children: [
        GestureDetector(
          onTap: () => onClose.call(),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.transparent,
          ),
        ),
        Positioned(
          width: width,
          child: CompositedTransformFollower(
            followerAnchor:
                isBelow ? Alignment.topCenter : Alignment.bottomCenter,
            targetAnchor:
                isBelow ? Alignment.bottomCenter : Alignment.topCenter,
            link: layerLink,
            child: Material(
              child: Container(
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 6,
                      offset: Offset(0, 4),
                    ),
                  ],
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(10),
                child: Column(
                  children: this.options,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
