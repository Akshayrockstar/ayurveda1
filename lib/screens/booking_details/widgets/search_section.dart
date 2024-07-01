import 'package:ayurvedas/core/color_pellete/color_pellete.dart';
import 'package:ayurvedas/core/common/common_button.dart';
import 'package:flutter/material.dart';

class SearchSection extends StatelessWidget {
  final VoidCallback onTap;
  const SearchSection({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        SizedBox(
          width: width / 1.65,
          height: 50,
          child: TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey,
              ),
              hintStyle: const TextStyle(color: Palette.DARK, fontSize: 10),
              hintText: "Search for treatments",
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(10.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(10.0),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        CustomButton(
          label: "Search",
          widths: 100,
          onTap: () {
            onTap();
          },
        ),
      ],
    );
  }
}
