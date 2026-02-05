// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import 'package:converterrr/feature/converter/presentation/bloc/get_converter/get_converter_bloc.dart';
// import 'package:converterrr/feature/converter/presentation/bloc/get_converter_event.dart';
// import 'core/di/service_locator.dart';
//
// class MyBlocProvider extends StatelessWidget {
//   const MyBlocProvider({super.key, required this.child});
//
//   final Widget child;
//
//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider<GetConvertBloc>(
//           create: (_) => sl<GetConvertBloc>()..add(GetConvertE()),
//         ),
//       ],
//       child: child,
//     );
//   }
// }
