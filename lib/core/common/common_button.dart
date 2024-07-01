import 'package:ayurvedas/core/color_pellete/color_pellete.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final double? widths;
  const CustomButton(
      {super.key, required this.label, required this.onTap, this.widths});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTap,
      child: Container(
          width: widths ?? width,
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Palette.Green, borderRadius: BorderRadius.circular(15)),
          child: Center(
            child: Text(
              label,
              style: TextStyle(color: Colors.white),
            ),
          )),
    );
  }
}
