import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget {
  const CommonAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
        Spacer(),
        IconButton(onPressed: () {}, icon: Icon(Icons.blender_outlined))
      ],
    );
  }
}
