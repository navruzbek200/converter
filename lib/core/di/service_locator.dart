import 'package:converterrr/feature/converter/data/datasource/get_converter_remote_datasource.dart';
import 'package:converterrr/feature/converter/data/datasource/get_converter_remote_datasource_impl.dart';
import 'package:converterrr/feature/converter/data/repository/get_converter_repository_impl.dart';
import 'package:converterrr/feature/converter/domain/repository/get_converter_repository.dart';
import 'package:converterrr/feature/converter/domain/usecase/get_converter_usecase.dart';
import 'package:converterrr/feature/converter/presentation/bloc/get_converter/get_converter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initDI() async {
  //dio
  sl.registerLazySingleton<Dio>(() => Dio(
    BaseOptions(
      baseUrl: 'https://cbu.uz',
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
    ),
  ));

  // repositoryDataSourceImpl
  sl.registerLazySingleton<GetConverterRemoteDatasource>(
        () => GetConverterRemoteDatasourceImpl(dio: sl()),
  );

  // repositoryImpl
  sl.registerLazySingleton<GetConverterRepository>(
        () => GetConverterRepositoryImpl(getConverterRemoteDatasource: sl()),
  );
  // usecase
  sl.registerLazySingleton<GetConverterUsecase>(
        () => GetConverterUsecase(sl()),
  );
  // bloc = register factory
  sl.registerFactory<GetConverterBloc>(
        () => GetConverterBloc(sl()),
  );
}
