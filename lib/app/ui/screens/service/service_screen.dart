import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ussd_misr/app/domain/models/category.dart';
import 'package:ussd_misr/app/domain/models/operator.dart';

import 'package:ussd_misr/app/ui/screens/service/widgets/operator_tarif_card.dart';

import 'widgets/widgets.dart';

class ServiceScreen extends StatefulWidget {
  final Operator operatorData;
  const ServiceScreen({Key? key, required this.operatorData}) : super(key: key);

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  int _selectedCategoryIndex = 0;

  List data = [];

  Color getOperatorColor(String operatorName) {
    switch (operatorName.toLowerCase()) {
      case 'vodafone':
        return const Color(0xFFE60012);
      case 'we':
        return const Color(0xFF5C2F87);
      case 'etisalat':
        return const Color(0xFF789904);
      default:
        return const Color(0xFFFF6600);
    }
  }

  void selectCategory(int newIndex, Operator operatorData) {
    _selectedCategoryIndex = newIndex;

    if (newIndex == 0) {
      if (operatorData.categories[0].name == 'Tarifs') {
        data = operatorData.tariffs!;
      } else if (operatorData.categories[0].name == 'Internet') {
        data = operatorData.internetBundles!;
      } else {
        data = operatorData.othersData;
      }
    } else if (newIndex == 1) {
      if (operatorData.categories[1].name == 'Tarifs') {
        data = operatorData.tariffs!;
      } else if (operatorData.categories[1].name == 'Internet') {
        data = operatorData.internetBundles!;
      } else {
        data = operatorData.othersData;
      }
    } else {
      data = operatorData.othersData;
    }

    setState(() {});
  }

  String getCurrentLanguageName(Locale currentLocale, Category category) {
    switch (currentLocale.toString()) {
      case 'ru':
        return category.nameRu;
      case 'uz':
        return category.nameUz;
      case 'uz_cyrilic':
        return category.nameUzCyrilic;
      case 'ar':
        return category.nameAr;

      default:
        return category.name;
    }
  }

  @override
  void initState() {
    super.initState();
    selectCategory(0, widget.operatorData);
  }

  @override
  Widget build(BuildContext context) {
    final operatorName = widget.operatorData.name;
    final operatorColor = getOperatorColor(operatorName);
    final categories = widget.operatorData.categories;
    final selectedCategory = categories[_selectedCategoryIndex];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: operatorColor,
        title: Text(
          operatorName,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50.0,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 10.0,
                ),
                itemCount: categories.length,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) =>
                    const SizedBox(width: 10.0),
                itemBuilder: (context, index) => OperatorCategoryButton(
                  onTap: () => selectCategory(index, widget.operatorData),
                  activeColor: operatorColor,
                  isActive: _selectedCategoryIndex == index,
                  text:
                      getCurrentLanguageName(context.locale, categories[index]),
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                clipBehavior: Clip.hardEdge,
                itemCount: data.length,
                padding: const EdgeInsets.symmetric(
                  vertical: 24.0,
                ).copyWith(top: 14.0),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 15.0),
                itemBuilder: (context, index) =>
                    selectedCategory.name == 'Tarifs'
                        ? OperatorTariffCard(
                            operatorColor: operatorColor,
                            data: data[index],
                          )
                        : selectedCategory.name == 'Internet'
                            ? OperatorInternetCard(
                                operatorColor: operatorColor,
                                data: data[index],
                              )
                            : OtherCard(
                                operatorColor: operatorColor,
                                data: data[index],
                              ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
