import 'package:ussd_misr/app/domain/models/category.dart';

class CategoriesData {
  static final tarif = Category(
    name: 'Tarifs',
    nameUz: 'Tariflar',
    nameUzCyrilic: 'Тарифлар',
    nameAr: 'السعر',
    nameRu: 'Тарифы',
  );
  static final internet = Category(
    name: 'Internet',
    nameUz: 'Internet',
    nameUzCyrilic: 'Интернет',
    nameAr: 'الإنترنت',
    nameRu: 'Интернет',
  );
  static final other = Category(
    name: 'Other',
    nameUz: 'Boshqalar',
    nameUzCyrilic: 'Бошқалар',
    nameAr: 'أخرى',
    nameRu: 'Другие',
  );
}
