import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateRect extends StatefulWidget {
  TextStyle? textStyle;
  double? width;
  double? height;
  DateTime? date;
  void Function()? onTap;
  DateRect({
    super.key,
    required this.date,
    this.textStyle,
    this.width,
    this.height,
    this.onTap,
  });

  @override
  State<DateRect> createState() => _DateRectState();
}

class _DateRectState extends State<DateRect> {
  DateFormat dateFormat = DateFormat('yy년 MM월 dd');
  DateFormat dateFormat_simple = DateFormat('MM월 dd');

  String get getDateString {
    if (widget.date == null) return '-';

    DateTime dateTime = widget.date ?? DateTime.now();

    if (dateTime.year == DateTime.now().year) {
      return dateFormat_simple.format(dateTime);
    } else {
      return dateFormat.format(dateTime);
    }
  }

  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.text,
        onEnter: (event) => setState(() {
          isHover = true;
        }),
        onExit: (event) => setState(() {
          isHover = false;
        }),
        child: Container(
          width: widget.width,
          height: widget.height,
          alignment: Alignment.center,
          decoration:
              BoxDecoration(border: isHover ? Border.all(width: 1) : null),
          child: Text(
            getDateString,
            style: widget.textStyle ??
                TextStyle(color: isHover ? Colors.lightBlue : Colors.black),
          ),
        ),
      ),
    );
  }
}
