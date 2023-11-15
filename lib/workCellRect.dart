import 'package:flutter/material.dart';
import 'package:pmkit/Component/wk_ColorRect.dart';
import 'package:pmkit/Component/wk_DropDown.dart';
import 'package:pmkit/Model/work.dart';
import 'package:provider/provider.dart';

class DropdownCellOption<T> {
  T data;
  ColorRectRenderInfo renderInfo;

  DropdownCellOption({required this.data, required this.renderInfo});
}

class DropdownCell<T> extends StatefulWidget {
  // Work work;
  final List<DropdownCellOption<T>> items;
  void Function(T)? onSelectChange;
  final ColorRectRenderInfo renderInfo;
  DropdownCell({
    super.key,
    required this.renderInfo,
    required this.items,
    this.onSelectChange,
  });

  @override
  State<DropdownCell> createState() => _DropdownCellState<T>();
}

class _DropdownCellState<T> extends State<DropdownCell<T>> {
  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _dropDown;

  OverlayEntry stateDropDown() {
    return OverlayEntry(
      builder: (context) => WKDropdown<T>(
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
