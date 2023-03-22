import 'package:ussd_misr/app/domain/models/category.dart';
import 'package:ussd_misr/app/domain/models/other_data.dart';

import 'categories_data.dart';

class OrangeData {
  static List<Category> categories = [
    CategoriesData.other,
  ];
  static List<Other> otherData = [
    Other(
      name: 'My number',
      nameRu: 'Мой номер',
      nameAr: 'رقم هاتفي',
      nameUz: 'Mening raqamim',
      nameUzCrylic: 'Менинг рақамим',
      code: '*119#',
    ),
    Other(
      name: 'Checking the balance',
      nameRu: 'Проверка баланса',
      nameAr: 'التحقق من الرصيد',
      nameUz: 'Balansni tekshirish',
      nameUzCrylic: 'Балансни текшириш',
      code: '210',
    ),
    Other(
      name: 'The rest of the Internet',
      nameRu: 'Остаток интернета',
      nameAr: 'بقية الإنترنت',
      nameUz: 'Qolgan Internet',
      nameUzCrylic: 'Қолган Internet',
      code: '*136#',
    ),
    Other(
      name: 'Call to the operator',
      nameRu: 'Звонок к оператору',
      nameAr: 'اتصل بالمشغل',
      nameUz: 'Operatorga qo\'ng\'iroq qiling',
      nameUzCrylic: 'Операторга қўнғироқ қилинг',
      code: '110',
    ),
  ];
}
