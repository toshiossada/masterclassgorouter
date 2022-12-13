class CurrencyInfoModel {
  final double dollarValue;
  final double euroValue;

  const CurrencyInfoModel({
    required this.dollarValue,
    required this.euroValue,
  });

  factory CurrencyInfoModel.fromMap(Map<String, dynamic> map) {
    var currencies = map['results']['currencies'];
    return CurrencyInfoModel(
        dollarValue: currencies['USD']['buy'],
        euroValue: currencies['EUR']['buy']);
  }
}
