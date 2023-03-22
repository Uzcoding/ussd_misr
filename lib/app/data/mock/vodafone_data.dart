import 'package:ussd_misr/app/data/mock/categories_data.dart';
import 'package:ussd_misr/app/domain/models/category.dart';
import 'package:ussd_misr/app/domain/models/internet_bundle.dart';
import 'package:ussd_misr/app/domain/models/other_data.dart';
import 'package:ussd_misr/app/domain/models/tariff.dart';

class VodafoneData {
  static List<Category> categories = [
    CategoriesData.tarif,
    CategoriesData.internet,
    CategoriesData.other,
  ];

  static List<Tariff> tariffs = [
    Tariff(
      name: 'Flex 30',
      price: 30,
      internetTraffic: 1000,
      internetTrafficMeasure: 'MB',
      minuteTraffic: 1000,
      code: '*030# ',
      bonus: ['Facebook', 'Whatsapp'],
    ),
    Tariff(
      name: 'Flex 45',
      price: 45,
      internetTraffic: 2000,
      internetTrafficMeasure: 'MB',
      minuteTraffic: 2000,
      code: '*045# ',
      bonus: ['Facebook', 'Whatsapp'],
    ),
    Tariff(
      name: 'Flex 70',
      price: 70,
      internetTraffic: 3000,
      internetTrafficMeasure: 'MB',
      minuteTraffic: 3000,
      code: '*070# ',
      bonus: ['Facebook', 'Whatsapp'],
    ),
    Tariff(
      name: 'Flex 100',
      price: 100,
      internetTraffic: 5500,
      internetTrafficMeasure: 'MB',
      minuteTraffic: 5500,
      code: '*0100# ',
      bonus: ['Facebook', 'Whatsapp'],
    ),
    Tariff(
      name: 'Flex 200',
      price: 200,
      internetTraffic: 13000,
      internetTrafficMeasure: 'MB',
      minuteTraffic: 13000,
      code: '*02000# ',
      bonus: ['Facebook', 'Whatsapp'],
    ),
  ];

  static List<InternetBundle> internetBundles = [
    InternetBundle(
      name: '150 MB Internet',
      price: 5,
      internetTraffic: 150,
      internetTrafficMeasure: 'MB',
      code: '*2000*5#',
      period: 1,
      isDay: false,
    ),
    InternetBundle(
      name: '400 MB Internet',
      price: 10,
      internetTraffic: 400,
      internetTrafficMeasure: 'MB',
      code: '*2000*10#',
      period: 1,
      isDay: false,
    ),
    InternetBundle(
      name: '1.25 GB Internet',
      price: 25,
      internetTraffic: 1.25,
      internetTrafficMeasure: 'GB',
      code: '*2000*25#',
      period: 1,
      isDay: false,
    ),
    InternetBundle(
      name: '2.25 GB Internet',
      price: 40,
      internetTraffic: 2.25,
      internetTrafficMeasure: 'GB',
      code: '*2000*40#',
      period: 1,
      isDay: false,
    ),
    InternetBundle(
      name: '3.5 GB Internet',
      price: 60,
      internetTraffic: 3.5,
      internetTrafficMeasure: 'GB',
      code: '*2000*60#',
      period: 1,
      isDay: false,
    ),
    InternetBundle(
      name: '7 GB Internet',
      price: 100,
      internetTraffic: 7,
      internetTrafficMeasure: 'GB',
      code: '*2000*100#',
      period: 1,
      isDay: false,
    ),
    InternetBundle(
      name: '12 GB Internet',
      price: 150,
      internetTraffic: 12,
      internetTrafficMeasure: 'GB',
      code: '*2000*150#',
      period: 1,
      isDay: false,
    ),
    InternetBundle(
      name: '20 GB Internet',
      price: 250,
      internetTraffic: 20,
      internetTrafficMeasure: 'GB',
      code: '*2000*250#',
      period: 1,
      isDay: false,
    ),
  ];

  static List<Other> otherData = [
    Other(
      name: 'My number',
      nameRu: 'Мой номер',
      nameAr: 'رقم هاتفي',
      nameUz: 'Mening raqamim',
      nameUzCrylic: 'Менинг рақамим',
      code: '*878#',
    ),
    Other(
      name: 'Checking the balance',
      nameRu: 'Проверка баланса',
      nameAr: 'التحقق من الرصيد',
      nameUz: 'Balansni tekshirish',
      nameUzCrylic: 'Балансни текшириш',
      code: '*60#',
    ),
    Other(
      name: 'The rest of the Internet',
      nameRu: 'Остаток интернета',
      nameAr: 'بقية الإنترنت',
      nameUz: 'Qolgan Internet',
      nameUzCrylic: 'Қолган Internet',
      code: '*60#',
    ),
    Other(
      name: 'Call to the operator',
      nameRu: 'Звонок к оператору',
      nameAr: 'اتصل بالمشغل',
      nameUz: 'Operatorga qo\'ng\'iroq qiling',
      nameUzCrylic: 'Операторга қўнғироқ қилинг',
      code: '888',
    ),
  ];
}
