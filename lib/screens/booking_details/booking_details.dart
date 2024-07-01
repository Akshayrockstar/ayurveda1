import 'package:ayurvedas/core/common/common_button.dart';
import 'package:ayurvedas/core/const.dart';
import 'package:ayurvedas/screens/booking_details/widgets/app_bar.dart';
import 'package:ayurvedas/screens/booking_details/widgets/search_section.dart';
import 'package:flutter/material.dart';

import '../../core/color_pellete/color_pellete.dart';

class BookingDetailScreen extends StatelessWidget {
  const BookingDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(margin),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const CommonAppBar(),
                const SizedBox(
                  height: 20,
                ),
                SearchSection(
                  onTap: () {},
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "Sort by:",
                      style: TextStyle(color: Colors.black),
                    ),
                    Spacer(),
                    Container(
                      width: 150,
                      height: 50,
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(40)),
                      child: Row(
                        children: [
                          Text(
                            "Date",
                            style: TextStyle(color: Colors.grey),
                          ),
                          Spacer(),
                          Icon(Icons.arrow_downward_sharp)
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
