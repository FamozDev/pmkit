import 'package:flutter/material.dart';

class WKDropdown<T> extends StatelessWidget {
  void Function() onClose;
  // Widget Function(T) itemConstructor;
  LayerLink layerLink;
  // List<T> dataList;
  List<Widget> options;

  WKDropdown(
      {super.key,
      required this.onClose,
      required this.layerLink,
      // required this.dataList,
      required this.options});

  @override
  Widget build(BuildContext context) {
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
          width: 250,
          child: CompositedTransformFollower(
            followerAnchor: Alignment.topCenter,
            targetAnchor: Alignment.bottomCenter,
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
