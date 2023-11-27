import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pmkit/Component/wk_ColorRect.dart';
import 'package:pmkit/Component/wk_DateRect.dart';
import 'package:pmkit/Component/wk_DropDown.dart';

class DateSelector extends StatefulWidget {
  // Work work;
  // final List<StateOption<T>> items;
  DateTime? selectedDate;
  void Function(DateTime) onSelectChange;

  DateSelector({
    super.key,
    required this.selectedDate,
    required this.onSelectChange,
  });

  @override
  State<DateSelector> createState() => _StateDateSelector();
}

class _StateDateSelector extends State<DateSelector> {
  final LayerLink _layerLink = LayerLink();

  OverlayEntry? _dropDown;

  OverlayEntry stateDropDown() {
    return OverlayEntry(
      builder: (context) => WKDropdown(
          onClose: hideDropDown,
          layerLink: _layerLink,
          width: 350,
          // dataList: widget.items,
          options: [
            CalendarDatePicker2(
                config: CalendarDatePicker2Config(
                  calendarViewMode: DatePickerMode.day,
                  calendarType: CalendarDatePicker2Type.single,
                ),
                value: [widget.selectedDate],
                onValueChanged: (dateList) => {
                      widget.onSelectChange(dateList[0] ?? DateTime.now()),
                      hideDropDown()
                    })
          ]),
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
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: CompositedTransformTarget(
          link: _layerLink,
          child:
              DateRect(onTap: () => showDropDown(), date: widget.selectedDate)),
    );
  }
}
