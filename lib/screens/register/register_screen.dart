import 'package:ayurvedas/core/common/textform_field.dart';
import 'package:ayurvedas/core/const.dart';
import 'package:ayurvedas/screens/booking_details/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const CommonAppBar(),
              Padding(
                padding: EdgeInsets.all(margin),
                child: Text("Register",
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              ),
              Divider(),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: margin),
                child: Column(
                  children: [
                    InputField(
                      heading: "Name",
                      hint: "Enter Your full Name",
                      controller: nameController,
                    ),
                    SizedBox(
                      height: margin,
                    ),
                    InputField(
                      heading: "WhatsApp number",
                      hint: "Enter Your Whtasapp Number",
                      controller: nameController,
                    ),
                    SizedBox(
                      height: margin,
                    ),
                    InputField(
                      heading: "Address",
                      hint: "Enter Your Address",
                      controller: nameController,
                    ),
                    SizedBox(
                      height: margin,
                    ),
                    InputField(
                      heading: "Location",
                      hint: "Choose your Location",
                      controller: nameController,
                    ),
                    SizedBox(
                      height: margin,
                    ),
                    InputField(
                      heading: "Branch",
                      hint: "Select the Branch",
                      controller: nameController,
                    ),
                    SizedBox(
                      height: margin,
                    ),
                    Text("Treatmnets"),
                    InputField(
                      heading: "Total Amount",
                      hint: "",
                      controller: nameController,
                    ),
                    SizedBox(
                      height: margin,
                    ),
                    InputField(
                      heading: "Discount Amount",
                      hint: "",
                      controller: nameController,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
