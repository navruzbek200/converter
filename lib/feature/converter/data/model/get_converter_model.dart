import 'package:json_annotation/json_annotation.dart';
import '/feature/converter/domain/entity/get_converter_entity.dart';

part 'get_converter_model.g.dart';

@JsonSerializable()
class GetConverterModel {
  final int id;

  @JsonKey(name: 'Code')
  final String? code;

  @JsonKey(name: 'Ccy')
  final String? ccy;

  @JsonKey(name: 'CcyNm_RU')
  final String? ccyNmRu;

  @JsonKey(name: 'CcyNm_UZ')
  final String? ccyNmUz;

  @JsonKey(name: 'CcyNm_UZC')
  final String? ccyNmUzc;

  @JsonKey(name: 'CcyNm_EN')
  final String? ccyNmEn;

  @JsonKey(name: 'Nominal')
  final String? nominal;

  @JsonKey(name: 'Rate')
  final String? rate;

  @JsonKey(name: 'Diff')
  final String? diff;

  @JsonKey(name: 'Date')
  final String? date;

  const GetConverterModel({
    required this.id,
    this.code,
    this.ccy,
    this.ccyNmRu,
    this.ccyNmUz,
    this.ccyNmUzc,
    this.ccyNmEn,
    this.nominal,
    this.rate,
    this.diff,
    this.date,
  });

  factory GetConverterModel.fromJson(Map<String, dynamic> json) =>
      _$GetConverterModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetConverterModelToJson(this);

  GetConverterEntity toEntity() => GetConverterEntity(
    id: id,
    code: code,
    ccy: ccy,
    ccyNmRu: ccyNmRu,
    ccyNmUz: ccyNmUz,
    ccyNmUzc: ccyNmUzc,
    ccyNmEn: ccyNmEn,
    nominal: nominal,
    rate: rate,
    diff: diff,
    date: date,
  );
}
