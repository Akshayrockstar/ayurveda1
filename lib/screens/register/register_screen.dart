import 'package:ayurvedas/core/common/common_button.dart';
import 'package:ayurvedas/core/common/date_fields.dart';
import 'package:ayurvedas/core/common/textform_field.dart';
import 'package:ayurvedas/core/const.dart';
import 'package:ayurvedas/screens/booking_details/widgets/app_bar.dart';
import 'package:ayurvedas/viemodel/common_viemodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  TextEditingController nameController = TextEditingController();
  TextEditingController whatsappController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController branchController = TextEditingController();
  TextEditingController totalAmountController = TextEditingController();
  TextEditingController discountAmountController = TextEditingController();
  TextEditingController advancedAmountController = TextEditingController();
  TextEditingController balanceAmountController = TextEditingController();
  TextEditingController treatMentDateController = TextEditingController();
  TextEditingController treatmentTimeController = TextEditingController();
  TextEditingController payMentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    CommonViewModel Vm = Provider.of<CommonViewModel>(context);
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
                      controller: whatsappController,
                    ),
                    SizedBox(
                      height: margin,
                    ),
                    InputField(
                      heading: "Address",
                      hint: "Enter Your Address",
                      controller: addressController,
                    ),
                    SizedBox(
                      height: margin,
                    ),
                    InputField(
                      heading: "Location",
                      hint: "Choose your Location",
                      controller: locationController,
                    ),
                    SizedBox(
                      height: margin,
                    ),
                    InputField(
                      heading: "Branch",
                      hint: "Select the Branch",
                      controller: branchController,
                    ),
                    SizedBox(
                      height: margin,
                    ),
                    Text("Treatmnets"),
                    InputField(
                      isDoubleOnly: true,
                      heading: "Total Amount",
                      hint: "",
                      controller: totalAmountController,
                    ),
                    SizedBox(
                      height: margin,
                    ),
                    InputField(
                      isDoubleOnly: true,
                      heading: "Discount Amount",
                      hint: "",
                      controller: discountAmountController,
                    ),
                    SizedBox(
                      height: margin,
                    ),
                    PaymentSelection(
                      text: payMentController,
                    ),
                    InputField(
                      isDoubleOnly: true,
                      heading: "Advance Amount",
                      hint: "",
                      controller: advancedAmountController,
                    ),
                    SizedBox(
                      height: margin,
                    ),
                    InputField(
                      isDoubleOnly: true,
                      heading: "Balance Amount",
                      hint: "",
                      controller: balanceAmountController,
                    ),
                    SizedBox(
                      height: margin,
                    ),
                    BuildDateFormField(
                      label: "Date",
                    ),
                    CustomButton(label: "Save", onTap: () {}),
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

class PaymentSelection extends StatefulWidget {
  final TextEditingController text;
  const PaymentSelection({
    super.key,
    required this.text,
  });

  @override
  State<PaymentSelection> createState() => _PaymentSelectionState();
}

class _PaymentSelectionState extends State<PaymentSelection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Payment Options",
          style: TextStyle(fontSize: 15),
        ),
        Row(
          children: [
            Checkbox(
              checkColor: Colors.white,
              value: widget.text.text == "cash",
              shape: CircleBorder(),
              onChanged: (bool? value) {
                setState(() {
                  widget.text.text = "cash"!;
                });
              },
            ),
            Text(
              "Cash",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 5,
            ),
            Checkbox(
              checkColor: Colors.white,
              value: widget.text.text == "card"!,
              shape: CircleBorder(),
              onChanged: (bool? value) {
                setState(() {
                  widget.text.text = "card"!;
                });
              },
            ),
            Text(
              "Card",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 5,
            ),
            Checkbox(
              checkColor: Colors.white,
              value: widget.text.text == "Up",
              shape: CircleBorder(),
              onChanged: (bool? value) {
                setState(() {
                  widget.text.text = "Up"!;
                });
              },
            ),
            Text(
              "Up",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 5,
            )
          ],
        ),
      ],
    );
  }
}
