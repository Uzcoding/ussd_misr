import 'package:ussd_misr/app/data/mock/etisalat_data.dart';
import 'package:ussd_misr/app/data/mock/orange_data.dart';
import 'package:ussd_misr/app/data/mock/vodafone_data.dart';
import 'package:ussd_misr/app/data/mock/we_data.dart';
import 'package:ussd_misr/app/domain/models/operator.dart';
import 'package:ussd_misr/resources/resources.dart';

class OperatorsData {
  static final List<Operator> operators = [
    Operator(
      name: 'Vodafone',
      icon: Svgs.vodafone,
      categories: VodafoneData.categories,
      othersData: VodafoneData.otherData,
      tariffs: VodafoneData.tariffs,
      internetBundles: VodafoneData.internetBundles,
    ),
    Operator(
      name: 'WE',
      icon: Svgs.we,
      categories: WeData.categories,
      othersData: WeData.otherData,
      internetBundles: WeData.internetBundles,
    ),
    Operator(
      name: 'Etisalat',
      icon: Svgs.etisalat,
      categories: EtisalatData.categories,
      othersData: EtisalatData.otherData,
    ),
    Operator(
      name: 'Orange',
      icon: Svgs.orange,
      categories: OrangeData.categories,
      othersData: OrangeData.otherData,
    ),
  ];
}
