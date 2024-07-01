import 'package:ayurvedas/core/common/common_button.dart';
import 'package:ayurvedas/core/const.dart';
import 'package:ayurvedas/screens/booking_details/widgets/app_bar.dart';
import 'package:ayurvedas/screens/booking_details/widgets/search_section.dart';
import 'package:flutter/material.dart';

import '../../core/color_pellete/color_pellete.dart';

class BookingDetailScreen extends StatelessWidget {
  BookingDetailScreen({super.key});
  ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
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
            const FilterSection(),
            const Divider(),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                controller: controller,
                physics: AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, index) => CustomBookingListCaerd(
                  index: index,
                ),
                itemCount: 5,
                separatorBuilder: (context, index) => SizedBox(
                  height: 10,
                ),
              ),
            ),
            SizedBox(
              height: margin,
            ),
            CustomButton(
              label: "Register",
              onTap: () {},
            ),
          ],
        ),
      ),
    ));
  }
}

class CustomBookingListCaerd extends StatelessWidget {
  final int index;
  const CustomBookingListCaerd({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Palette.GreyPrimary),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: margin, right: margin, top: margin),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  " ${index.toString()} .",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Vikram Sing",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: 200,
                      child: Text(
                        "Cople combo packgedfghjhgfdghjkh",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Palette.DarkGreen,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_month,
                          color: Colors.red,
                        ),
                        Text(
                          "31/01/2024",
                          style: TextStyle(color: Colors.grey.withOpacity(.8)),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Icon(
                          Icons.person_2,
                          color: Colors.red,
                        ),
                        Text(
                          "Jithesh",
                          style: TextStyle(color: Colors.grey.withOpacity(.8)),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Divider(
            color: Colors.grey,
            thickness: 1.5,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: 40,
            child: Row(
              children: [
                Text(
                  "View Booking Details",
                ),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 19,
                  color: Palette.DarkGreen,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class FilterSection extends StatelessWidget {
  const FilterSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
              Icon(Icons.keyboard_arrow_down)
            ],
          ),
        )
      ],
    );
  }
}
