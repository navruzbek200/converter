part of 'get_converter_bloc.dart';

@freezed
class GetConverterEvent with _$GetConverterEvent {
  const factory GetConverterEvent.fetch() = _Fetch;
  const factory GetConverterEvent.refresh() = _Refresh;
}
