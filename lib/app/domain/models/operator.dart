import 'package:ussd_misr/app/domain/models/category.dart';
import 'package:ussd_misr/app/domain/models/internet_bundle.dart';
import 'package:ussd_misr/app/domain/models/other_data.dart';
import 'package:ussd_misr/app/domain/models/tariff.dart';

class Operator {
  String name;
  String icon;
  List<Category> categories;
  List<Tariff>? tariffs;
  List<InternetBundle>? internetBundles;
  List<Other> othersData;

  Operator({
    required this.name,
    required this.icon,
    required this.categories,
    this.tariffs,
    this.internetBundles,
    required this.othersData,
  });
}
