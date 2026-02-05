import 'package:converterrr/feature/converter/data/datasource/get_converter_remote_datasource.dart';
import 'package:converterrr/feature/converter/data/model/get_converter_model.dart';
import 'package:dio/dio.dart';

import '../../../../core/utils/logger.dart';

class GetConverterRemoteDatasourceImpl implements GetConverterRemoteDatasource{
  final Dio dio;

  GetConverterRemoteDatasourceImpl( {required this.dio});


  @override
  Future<List<GetConverterModel>> getConverter() async{
    try {
      final response = await dio.get('/uz/arkhiv-kursov-valyut/json/');
      if (response.statusCode == 200 || response.statusCode == 201) {
        LoggerService.info('get convert successful: ${response.data}');
        final data = response.data;
        final List list = data is List ? data : (data['results'] as List);
        return list
            .map((e) => GetConverterModel.fromJson(e as Map<String, dynamic>))
            .toList();

      } else {
        LoggerService.warning(
          "get convert failed: ${response.statusCode}",
        );
        throw Exception('get convert failed: ${response.statusCode}');
      }
    } catch (e, s) {
      LoggerService.error('Error during get convert: $e');
      print(e);
      print(s);
      rethrow;
    }
  }

}