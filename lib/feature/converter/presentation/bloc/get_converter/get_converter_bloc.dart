import 'package:bloc/bloc.dart';
import '../../../domain/entity/get_converter_entity.dart';
import '/feature/converter/domain/usecase/get_converter_usecase.dart';


import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_converter_event.dart';
part 'get_converter_state.dart';
part 'get_converter_bloc.freezed.dart';

class GetConverterBloc extends Bloc<GetConverterEvent, GetConverterState> {
  final GetConverterUsecase usecase;

  GetConverterBloc(this.usecase) : super(const GetConverterState.initial()) {
    on<GetConverterEvent>(_onEvent);
  }

  Future<void> _onEvent(
    GetConverterEvent event,
    Emitter<GetConverterState> emit,
  ) async {
    await event.when(fetch: () => _load(emit), refresh: () => _load(emit));
  }

  Future<void> _load(Emitter<GetConverterState> emit) async {
    emit(const GetConverterState.loading());
    try {
      final list = await usecase();
      emit(GetConverterState.success(list: list));
    } catch (e) {
      emit(const GetConverterState.failure(message: "Xatolik"));
    }
  }
}
