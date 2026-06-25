// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_converter_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetConverterModel _$GetConverterModelFromJson(Map<String, dynamic> json) =>
    GetConverterModel(
      id: (json['id'] as num).toInt(),
      code: json['Code'] as String?,
      ccy: json['Ccy'] as String?,
      ccyNmRu: json['CcyNm_RU'] as String?,
      ccyNmUz: json['CcyNm_UZ'] as String?,
      ccyNmUzc: json['CcyNm_UZC'] as String?,
      ccyNmEn: json['CcyNm_EN'] as String?,
      nominal: json['Nominal'] as String?,
      rate: json['Rate'] as String?,
      diff: json['Diff'] as String?,
      date: json['Date'] as String?,
    );

Map<String, dynamic> _$GetConverterModelToJson(GetConverterModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'Code': instance.code,
      'Ccy': instance.ccy,
      'CcyNm_RU': instance.ccyNmRu,
      'CcyNm_UZ': instance.ccyNmUz,
      'CcyNm_UZC': instance.ccyNmUzc,
      'CcyNm_EN': instance.ccyNmEn,
      'Nominal': instance.nominal,
      'Rate': instance.rate,
      'Diff': instance.diff,
      'Date': instance.date,
    };
