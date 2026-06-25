import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/get_converter/get_converter_bloc.dart';
import '../widget/converter_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> _reload(BuildContext context) async {
    context.read<GetConverterBloc>().add(const GetConverterEvent.refresh());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GetConverterBloc, GetConverterState>(
        builder: (context, state) {
          return state.when(
            initial: () => Center(
              child: ElevatedButton(
                onPressed: () => context
                    .read<GetConverterBloc>()
                    .add(const GetConverterEvent.fetch()),
                child: const Text("Load"),
              ),
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            failure: (message) => RefreshIndicator(
              onRefresh: () => _reload(context),
              child: ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                children: [
                  const SizedBox(height: 200),
                  Center(child: Text(message)),
                ],
              ),
            ),
            success: (list) => RefreshIndicator(
              onRefresh: () => _reload(context),
              child: ListView.separated(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: list.length,
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemBuilder: (context, i) {
                  final item = list[i];

                  return InkWell(
                    onTap: () {
                      // ✅ GoRouter route
                      context.push('/convert', extra: item);
                    },
                    child: ConverterItem(converter: item),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
