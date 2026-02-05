import '/feature/converter/domain/entity/get_converter_entity.dart';

class GetConverterModel extends GetConverterEntity {
   GetConverterModel({
    required super.id,
    required super.code,
    required super.ccy,
    required super.ccyNmRu,
    required super.ccyNmUz,
    required super.ccyNmUzc,
    required super.ccyNmEn,
    required super.nominal,
    required super.rate,
    required super.diff,
    required super.date,
  });

  factory GetConverterModel.fromJson(Map<String, dynamic> json) {
    return GetConverterModel(
      id: json['id'],
      code: json['Code'],
      ccy: json['Ccy'],
      ccyNmRu: json['CcyNm_RU'],
      ccyNmUz: json['CcyNm_UZ'],
      ccyNmUzc: json['CcyNm_UZC'],
      ccyNmEn: json['CcyNm_EN'],
      nominal: json['Nominal'],
      rate: json['Rate'],
      diff: json['Diff'],
      date: json['Date'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'Code': code,
      'Ccy': ccy,
      'CcyNm_RU': ccyNmRu,
      'CcyNm_UZ': ccyNmUz,
      'CcyNm_UZC': ccyNmUzc,
      'CcyNm_EN': ccyNmEn,
      'Nominal': nominal,
      'Rate': rate,
      'Diff': diff,
      'Date': date,
    };
  }
}
