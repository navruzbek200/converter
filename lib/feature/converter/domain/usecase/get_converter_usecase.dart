import 'package:converterrr/feature/converter/domain/repository/get_converter_repository.dart';

import '../entity/get_converter_entity.dart';

class GetConverterUsecase {
  final GetConverterRepository getConverterRepository;

  GetConverterUsecase(this.getConverterRepository);

  Future<List<GetConverterEntity>> call() async {
    return await getConverterRepository.getConvert();
  }
}
