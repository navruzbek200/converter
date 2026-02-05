import 'dart:io';

import 'package:bloc/bloc.dart';
import '/feature/converter/domain/entity/get_converter_entity.dart';
import '/feature/converter/domain/usecase/get_converter_usecase.dart';
import '/feature/converter/presentation/bloc/get_converter/get_converter_state.dart';
import '/feature/converter/presentation/bloc/get_converter_event.dart';
import 'package:dio/dio.dart';



class GetConvertBloc extends Bloc<GetConverterEvent, GetConverterState> {
  final GetConverterUsecase getConverterUsecase;

  GetConvertBloc(this.getConverterUsecase) : super(GetConverterInitial()) {
    on<GetConvertE>(_onGetConvert);
  }

  Future<void> _onGetConvert(
      GetConvertE event,
      Emitter<GetConverterState> emit,
      ) async {
    emit(GetConverterLoading());
    try {
      final List<GetConverterEntity> result = await getConverterUsecase();
      emit(GetConverterSuccess(list: result));
    } on DioException catch (e) {
      emit(GetConverterError(message: _mapDioErrorToMessage(e)));
    } catch (_) {
      emit(const GetConverterError(message: "Noma’lum xato yuz berdi"));
    }
  }

  String _mapDioErrorToMessage(DioException error) {
    if (error.type == DioExceptionType.unknown && error.error is SocketException) {
      return "Internet ulanmagan. Iltimos, tarmoqni tekshiring.";
    } else if (error.response?.statusCode == 401 ||
        error.response?.statusCode == 404) {
      return "So‘rovda xatolik (401/404).";
    } else if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout) {
      return "So‘rov vaqtida javob kelmadi. Keyinroq urinib ko‘ring.";
    } else if (error.response?.statusCode == 500) {
      return "Serverda nosozlik bor. Iltimos, keyinroq urinib ko‘ring.";
    }

    return "Noma’lum xato yuz berdi. Iltimos, qayta urinib ko‘ring.";
  }
}
