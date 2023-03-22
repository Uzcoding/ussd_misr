class InternetBundle {
  final String name;
  final int price;
  final double internetTraffic;
  final String internetTrafficMeasure;
  final String code;
  final int period;
  final bool isDay;

  InternetBundle({
    required this.name,
    required this.price,
    required this.internetTraffic,
    required this.internetTrafficMeasure,
    required this.code,
    required this.period,
    required this.isDay,
  });
}
