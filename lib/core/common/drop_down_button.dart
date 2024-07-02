// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_typeahead/flutter_typeahead.dart';

// class PopUpCall extends StatefulWidget {
//   final String? value;
//   final VoidCallback? onAddNew;
//   final Function onSelection;
//   final String type;

//   final bool enable;
//   final List<String>? list;
//   const PopUpCall(
//       {Key? key,
//       this.value,
//       this.enable = false,
//       this.onAddNew,
//       required this.onSelection,
//       required this.type,
//       this.list})
//       : super(key: key);

//   @override
//   _PopUpCallState createState() => _PopUpCallState();
// }

// class _PopUpCallState extends State<PopUpCall> {
//   @override
//   Widget build(BuildContext context) {
//     Widget data = SellingPriceBasedPopUpCall(
//         onSelection: widget.onSelection,
//         onAddNew: widget.onAddNew,
//         value: widget.value,
//         enable: widget.enable,
//         type: widget.type);
//     // Widget data = BrandPopUpCall(
//     //     onSelection: widget.onSelection,
//     //     onAddNew: widget.onAddNew,
//     //     value: widget.value,
//     //     enable: widget.enable,
//     //     type: widget.type);
//     switch (widget.type) {
//       case "branch-basedOn":
//         {
//           data = BranchListPopUpCall(
//               onSelection: widget.onSelection,
//               onAddNew: widget.onAddNew,
//               value: widget.value,
//               enable: widget.enable,
//               type: widget.type);
//         }
//         break;

//       default:
//     }
//     return data;
//   }
// }

// class BranchListPopUpCall extends StatefulWidget {
//   final String? value;
//   final VoidCallback? onAddNew;
//   final Function onSelection;
//   final String type;
//   final bool enable;
//   final List<String>? list;
//   const BranchListPopUpCall(
//       {Key? key,
//       this.value,
//       this.onAddNew,
//       required this.onSelection,
//       required this.type,
//       required this.enable,
//       this.list})
//       : super(key: key);

//   @override
//   _BranchListPopUpCallState createState() => _BranchListPopUpCallState();
// }

// class _BranchListPopUpCallState extends State<BranchListPopUpCall> {
//   String? label;
//   TextEditingController _controller = TextEditingController();
//   @override
//   void initState() {
//     label = widget.value;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     label = widget.value;
//     return BlocProvider<PurchaseOrderTypeCubit>(
//         create: (context) => PurchaseOrderTypeCubit(),
//         child: Builder(
//           builder: (context) {
//             context.read<PurchaseOrderTypeCubit>().getPurchaseOrdertype();
//             return BlocBuilder<PurchaseOrderTypeCubit, PurchaseOrderTypeState>(
//                 builder: (context, state) {
//               print(state);
//               return state.maybeWhen(
//                 orElse: () => Center(
//                   child: CircularProgressIndicator(),
//                 ),
//                 // error: () => {errorLoader(widget.onAddNew)},
//                 success: (data) {
//                   print("data===" + data.toString());
//                   List<String> list = [];
//                   // list=data.orderTypes;
//                   int? length = data?.orderTypes?.length;
//                   for (var i = 0; i < length!; i++) {
//                     list.add(data!.orderTypes![i]);
//                   }
//                   String? onSellingBasedSelect(var value, List<String> list) {
//                     print("value" + value.toString());
//                     // print("value"+list.toString());

//                     PurchaseOrdertype? newData;
//                     list.forEach((element) {
//                       newData?.orderTypes?.add(element);
//                     });
//                     return value;
//                   } // });

//                   if (widget.onAddNew != null) list.add("");
//                   _controller = TextEditingController(text: label);
//                   return TypeAheadFormField(
//                     enabled: widget.enable,
//                     validator: (value) {
//                       if (value != null && value.isEmpty) {
//                         return "required";
//                       }
//                     },
//                     textFieldConfiguration: TextFieldConfiguration(
//                         controller: _controller,
//                         decoration: InputDecoration(
//                             isDense: true,
//                             border: OutlineInputBorder(),
//                             suffixIcon: Icon(Icons.arrow_downward_outlined))),
//                     onSuggestionSelected: (suggestion) {
//                       if (suggestion == "Add new")
//                         widget.onAddNew!();
//                       else {
//                         widget.onSelection(onSellingBasedSelect(
//                             suggestion.toString(), data!.orderTypes!));
//                         // data.sellingPercntageBasedOn?.forEach((element) {
//                         //   if (element == suggestion)
//                         //     Variable.methodId = element.id;
//                         // });
//                       }
//                     },
//                     itemBuilder: (context, suggestion) {
//                       // if (suggestion == "Add new")
//                       //   return ListTile(
//                       //     leading: Icon(Icons.add_circle_outline_outlined),
//                       //     title: Text(suggestion.toString()),
//                       //   );
//                       return ListTile(
//                         ////leading: Icon(Icons.shopping_cart_outlined),
//                         title: Text(suggestion.toString()),
//                       );
//                     },
//                     suggestionsCallback: (String? value) async {
//                       return value == null || value.isEmpty
//                           ? list
//                           : search(value, list, widget.onAddNew);
//                     },
//                   );
//                 },
//               );
//             });
//           },
//         ));
//   }

//   List<String> search(String value, List<String> list, VoidCallback? onAddNew) {
//     List<String> newList = [];
//     list.forEach((element) {
//       if (element.toLowerCase().contains(value.toLowerCase()))
//         newList.add(element);
//     });
//     onAddNew != null ? newList.add("Add new") : null;
//     return newList;
//   }
// }
