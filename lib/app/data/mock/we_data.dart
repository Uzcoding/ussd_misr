import 'package:ussd_misr/app/domain/models/category.dart';
import 'package:ussd_misr/app/domain/models/internet_bundle.dart';
import 'package:ussd_misr/app/domain/models/other_data.dart';

import 'categories_data.dart';

class WeData {
  static List<Category> categories = [
    CategoriesData.internet,
    CategoriesData.other,
  ];

  static List<InternetBundle> internetBundles = [
    InternetBundle(
      name: '1 GB Internet',
      price: 10,
      internetTraffic: 1,
      internetTrafficMeasure: 'GB',
      code: '*999*10#',
      period: 1,
      isDay: false,
    ),
    InternetBundle(
      name: '2.5 GB Internet',
      price: 20,
      internetTraffic: 2.5,
      internetTrafficMeasure: 'GB',
      code: '*999*20#',
      period: 1,
      isDay: false,
    ),
    InternetBundle(
      name: '6 GB Internet',
      price: 40,
      internetTraffic: 6,
      internetTrafficMeasure: 'GB',
      code: '*999*40#',
      period: 1,
      isDay: false,
    ),
    InternetBundle(
      name: '7.5 GB Internet',
      price: 70,
      internetTraffic: 7.5,
      internetTrafficMeasure: 'GB',
      code: '*999*70#',
      period: 1,
      isDay: false,
    ),
    InternetBundle(
      name: '18 GB Internet',
      price: 100,
      internetTraffic: 18,
      internetTrafficMeasure: 'GB',
      code: '*999*100#',
      period: 1,
      isDay: false,
    ),
    InternetBundle(
      name: '40 GB Internet',
      price: 200,
      internetTraffic: 40,
      internetTrafficMeasure: 'GB',
      code: '*999*200#',
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
      code: '*688#',
    ),
    Other(
      name: 'Checking the balance',
      nameRu: 'Проверка баланса',
      nameAr: 'التحقق من الرصيد',
      nameUz: 'Balansni tekshirish',
      nameUzCrylic: 'Балансни текшириш',
      code: '*550#',
    ),
    Other(
      name: 'The rest of the Internet',
      nameRu: 'Остаток интернета',
      nameAr: 'بقية الإنترنت',
      nameUz: 'Qolgan Internet',
      nameUzCrylic: 'Қолган Internet',
      code: '*414#',
    ),
    Other(
      name: 'Call to the operator',
      nameRu: 'Звонок к оператору',
      nameAr: 'اتصل بالمشغل',
      nameUz: 'Operatorga qo\'ng\'iroq qiling',
      nameUzCrylic: 'Операторга қўнғироқ қилинг',
      code: '111',
    ),
  ];
}
