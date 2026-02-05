import 'package:go_router/go_router.dart';
import 'package:converterrr/feature/converter/domain/entity/get_converter_entity.dart';
import 'package:converterrr/feature/converter/presentation/page/home_screen.dart';

import '../../feature/converter/presentation/page/converter_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (_, __) => const HomeScreen(),
    ),
    GoRoute(
      path: '/convert',
      builder: (context, state) {
        final item = state.extra as GetConverterEntity;
        return ConverterScreen(item: item);
      },
    ),

  ],
);
