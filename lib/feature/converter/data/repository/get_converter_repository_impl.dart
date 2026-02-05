import 'package:converterrr/feature/converter/data/datasource/get_converter_remote_datasource.dart';
import 'package:converterrr/feature/converter/domain/entity/get_converter_entity.dart';
import '../../domain/repository/get_converter_repository.dart';

class  GetConverterRepositoryImpl implements GetConverterRepository{
  final GetConverterRemoteDatasource getConverterRemoteDatasource;

  GetConverterRepositoryImpl({required this.getConverterRemoteDatasource});

  @override
  Future<List<GetConverterEntity>> getConvert() {
    return getConverterRemoteDatasource.getConverter();
  }
}

