part of 'get_converter_bloc.dart';

@freezed
class GetConverterState with _$GetConverterState {
  const factory GetConverterState.initial() = _Initial;
  const factory GetConverterState.loading() = _Loading;
  const factory GetConverterState.success({
    required List<GetConverterEntity> list,
  }) = _Success;
  const factory GetConverterState.failure({
    required String message,
  }) = _Failure;
}
