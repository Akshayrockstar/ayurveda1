import 'package:ayurvedas/core/color_pellete/color_pellete.dart';
import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

class BuildDateTimeFormField extends StatefulWidget {
  final String label;
  final bool enable;
  final bool required;
  final FormFieldSetter<DateTime>? onSaved;
  final DateFormat? format;
  const BuildDateTimeFormField(
      {Key? key,
      required this.label,
      this.enable = false,
      this.required = false,
      this.onSaved,
      this.format})
      : super(key: key);

  @override
  _BuildDateTimeFormFieldState createState() => _BuildDateTimeFormFieldState();
}

class _BuildDateTimeFormFieldState extends State<BuildDateTimeFormField> {
  @override
  Widget build(BuildContext context) {
    final mFormat = widget.format ?? DateFormat.yMMMEd().add_jm();
    return Expanded(
        child: ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      leading: Container(
          width: 400,
          child: Text.rich(TextSpan(
              text: widget.label,
              style: TextStyle(fontSize: 12),
              children: widget.required
                  ? [TextSpan(text: "*", style: TextStyle(color: Palette.DARK))]
                  : []))),
      title: DateTimeField(
        onSaved: widget.onSaved,
        validator: (value) => value == null ? "* required" : null,
        decoration: InputDecoration(
          // labelText: ,
          filled: true,
        ),
        format: mFormat,
        onShowPicker: (context, currentValue) async {
          final date = await showDatePicker(
              context: context,
              firstDate: DateTime(1900),
              initialDate: currentValue ?? DateTime.now(),
              lastDate: DateTime(2100));
          if (date != null) {
            final time = await showTimePicker(
              context: context,
              initialTime:
                  TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
            );
            return DateTimeField.combine(date, time);
          } else {
            return currentValue;
          }
        },
      ),
    ));
  }
}

class BuildDateFormField extends StatefulWidget {
  final String label;
  final DateTime? initialValue;
  final bool enable;
  final bool required;
  final FormFieldSetter<DateTime>? onSaved;
  final DateFormat? format;
  final TextEditingController? controller;
  const BuildDateFormField(
      {Key? key,
      required this.label,
      this.enable = true,
      this.required = false,
      this.onSaved,
      this.format,
      this.initialValue,
      this.controller})
      : super(key: key);

  @override
  _BuildDateFormFieldState createState() => _BuildDateFormFieldState();
}

class _BuildDateFormFieldState extends State<BuildDateFormField> {
  @override
  Widget build(BuildContext context) {
    // final mFormat = DateFormat("12,08,2021");
    final mFormat =
        widget.format ?? DateFormat("EEEE, MMMM d, yyyy 'at' h:mma");
    return Container(
        height: 80,
        width: 500,
        child: Column(
          children: [
            Container(
                width: 400,
                child: Text.rich(TextSpan(
                    text: widget.label,
                    style: TextStyle(fontSize: 12),
                    children: widget.required
                        ? [
                            TextSpan(
                                text: "*",
                                style: TextStyle(color: Palette.DARK))
                          ]
                        : []))),
            DateTimeField(
                // initialValue: widget.initialValue,
                controller: widget.controller,
                enabled: widget.enable,
                validator: (value) => value == null ? "* required" : null,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Palette.GreyPrimary,
                  contentPadding: null,
                  labelStyle: TextStyle(color: Colors.red),
                  // labelText: widget.initialValue?.toString().split(" ")[0],
                  isDense: true,
                  label: null,
                  alignLabelWithHint: true,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(10.0),
                  ),

                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                format: mFormat,
                style: TextStyle(fontSize: 12),
                onChanged: widget.onSaved,
                //  onFieldSubmitted: widget.onSaved,
                onShowPicker: (context, currentValue) async {
                  DateTime? date;
                  if (widget.enable)
                    date = await showDatePicker(
                        context: context,
                        firstDate: DateTime(1900),
                        initialDate: currentValue ?? DateTime.now(),
                        lastDate: DateTime(2100));
                  // if (date != null) {
                  final time = await showTimePicker(
                    context: context,
                    initialTime:
                        TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                  );
                  return DateTimeField.combine(date!, time);
                  // }
                })
          ],
        ));
  }
}
