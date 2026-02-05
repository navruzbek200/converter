import 'package:converterrr/core/route/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/di/service_locator.dart';
import 'feature/converter/presentation/bloc/get_converter/get_converter_bloc.dart';
import 'feature/converter/presentation/bloc/get_converter_event.dart';
import 'feature/converter/presentation/page/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetConvertBloc>(
          create: (_) => sl<GetConvertBloc>()..add(GetConvertE()),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        title: 'converter',
      ),
    );
  }
}
