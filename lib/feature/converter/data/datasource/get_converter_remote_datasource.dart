import 'package:converterrr/feature/converter/data/model/get_converter_model.dart';

abstract class GetConverterRemoteDatasource {
  Future<List<GetConverterModel>>getConverter();

}