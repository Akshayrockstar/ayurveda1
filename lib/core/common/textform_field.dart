import 'package:ayurvedas/core/color_pellete/color_pellete.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class InputField extends StatefulWidget {
  final TextEditingController controller;
  final String? label;
  final String? hint;
  final bool password;
  final String heading;
  final bool isDoubleOnly;

  const InputField(
      {Key? key,
      required this.controller,
      this.label,
      required this.heading,
      this.hint,
      this.isDoubleOnly = false,
      this.password = false})
      : super(key: key);

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool show = false;

  @override
  void initState() {
    super.initState();
    show = widget.password;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.heading,
          style: TextStyle(fontWeight: FontWeight.normal),
        ),
        SizedBox(
          height: 5,
        ),
        TextFormField(
          controller: widget.controller,
          obscureText: show,
          keyboardType:
              widget.isDoubleOnly ? TextInputType.number : TextInputType.text,
          inputFormatters: widget.isDoubleOnly
              ? [FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))]
              : [],
          decoration: InputDecoration(
            filled: true,
            fillColor: Palette.GreyPrimary,
            suffixIcon: widget.password
                ? IconButton(
                    icon: show
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off_outlined),
                    onPressed: () {
                      show = !show;
                      setState(() {});
                    },
                  )
                : null,
            labelStyle: const TextStyle(
                fontWeight: FontWeight.w500, color: Palette.DARK),
            // label: Text(widget.label),
            hintStyle: const TextStyle(color: Palette.DARK, fontSize: 10),
            hintText: widget.hint,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(10.0),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(10.0),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ],
    );
  }
}
