import 'package:go_router/go_router.dart';
import 'package:converterrr/feature/converter/domain/entity/get_converter_entity.dart';
import 'package:converterrr/feature/converter/presentation/page/home_screen.dart';
import 'package:converterrr/feature/converter/presentation/page/converter_screen.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
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
