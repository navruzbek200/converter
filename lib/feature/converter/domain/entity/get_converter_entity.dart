class GetConverterEntity {
  final int id;
  final String? code;
  final String? ccy;
  final String? ccyNmRu;
  final String? ccyNmUz;
  final String? ccyNmUzc;
  final String? ccyNmEn;
  final String? nominal;
  final String? rate;
  final String? diff;
  final String? date;

  GetConverterEntity({
    required this.id,
    required this.code,
    required this.ccy,
    required this.ccyNmRu,
    required this.ccyNmUz,
    required this.ccyNmUzc,
    required this.ccyNmEn,
    required this.nominal,
    required this.rate,
    required this.diff,
    required this.date,
  });
}