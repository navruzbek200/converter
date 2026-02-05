import 'package:converterrr/feature/converter/domain/entity/get_converter_entity.dart';

abstract class GetConverterRepository {
  Future<List<GetConverterEntity>>getConvert();
}