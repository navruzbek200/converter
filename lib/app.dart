import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:converterrr/core/di/service_locator.dart';
import 'package:converterrr/core/route/app_router.dart';
import 'package:converterrr/feature/converter/presentation/bloc/get_converter/get_converter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<GetConverterBloc>()..add(const GetConverterEvent.fetch()),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter,
      ),
    );
  }
}
