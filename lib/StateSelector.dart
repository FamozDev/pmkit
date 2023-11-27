import 'package:flutter/material.dart';
import 'package:pmkit/Component/wk_ColorRect.dart';
import 'package:pmkit/Component/wk_DropDown.dart';

class StateOption<T> {
  T data;
  ColorRectRenderInfo renderInfo;

  StateOption({required this.data, required this.renderInfo});
}

class StateSelector<T> extends StatefulWidget {
  // Work work;
  final List<StateOption<T>> items;
  void Function(T)? onSelectChange;
  final ColorRectRenderInfo renderInfo;
  StateSelector({
    super.key,
    required this.renderInfo,
    required this.items,
    this.onSelectChange,
  });

  @override
  State<StateSelector> createState() => _StateSelectorState<T>();
}

class _StateSelectorState<T> extends State<StateSelector<T>> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _dropDown;

  OverlayEntry stateDropDown() {
    return OverlayEntry(
      builder: (context) => WKDropdown(
        onClose: hideDropDown,
        layerLink: _layerLink,
        // dataList: widget.items,
        options: List.generate(
          widget.items.length,
          (index) => ColorRect(
            height: 40,
            renderInfo: widget.items[index].renderInfo,
            onTap: () => {
              widget.onSelectChange?.call(widget.items[index].data),
              hideDropDown()
            },
          ),
        ),
      ),
    );
  }

  void showDropDown() {
    if (_dropDown == null) {
      _dropDown = stateDropDown();
      Overlay.of(context)?.insert(_dropDown!);
    }
  }

  void hideDropDown() {
    _dropDown?.remove();
    _dropDown = null;
  }

  @override
  Widget build(BuildContext context) {
    ColorRectRenderInfo renderInfo = widget.renderInfo;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: CompositedTransformTarget(
        link: _layerLink,
        child: ColorRect(
            onTap: () => showDropDown(),
            renderInfo: renderInfo ??
                ColorRectRenderInfo(text: '', color: Colors.transparent)),
      ),
    );
  }
}
