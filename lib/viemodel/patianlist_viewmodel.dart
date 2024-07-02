import 'package:ayurvedas/model/patiant_list_model.dart';

class PatiantlistViewmodel {
  Patient? item;

  PatiantlistViewmodel({this.item});

  String get status {
    return this.item?.user ?? "";
  }
}
