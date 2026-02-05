
import 'package:converterrr/feature/converter/domain/entity/get_converter_entity.dart';

abstract class GetConverterState {
  const GetConverterState();
}

class GetConverterInitial extends GetConverterState {}

class GetConverterLoading extends GetConverterState {}

class GetConverterSuccess extends GetConverterState {
  final List <GetConverterEntity> list;

  const GetConverterSuccess({required this.list});
}

class GetConverterError extends GetConverterState {
  final String message;

  const GetConverterError({required this.message});
}