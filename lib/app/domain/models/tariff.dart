class Tariff {
  final String name;
  final int price;
  final int internetTraffic;
  final String internetTrafficMeasure;
  final int minuteTraffic;
  final String code;
  final int period;
  final String periodString;
  final List<String>? bonus;

  Tariff({
    required this.name,
    required this.price,
    required this.internetTraffic,
    required this.internetTrafficMeasure,
    required this.minuteTraffic,
    required this.code,
    required this.period,
    required this.periodString,
    this.bonus,
  });
}
