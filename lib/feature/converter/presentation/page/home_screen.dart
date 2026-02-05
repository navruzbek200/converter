import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:converterrr/feature/converter/presentation/bloc/get_converter/get_converter_bloc.dart';
import 'package:converterrr/feature/converter/presentation/bloc/get_converter/get_converter_state.dart';
import '../bloc/get_converter_event.dart';
import '../widget/converter_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> _reload(BuildContext context) async {
    context.read<GetConvertBloc>().add(GetConvertE());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F5F7),
      body: SafeArea(
        child: BlocBuilder<GetConvertBloc, GetConverterState>(
          builder: (context, state) {
            final bool isLoading = state is GetConverterLoading;
            final bool isError = state is GetConverterError;
            final bool isSuccess = state is GetConverterSuccess;

            final list = isSuccess ? (state as GetConverterSuccess).list : const [];
            final dateText = list.isNotEmpty ? list.first.date.toString() : "";

            return RefreshIndicator(
              onRefresh: () => _reload(context),
              child: ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(16),
                children: [
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          "Valyuta kurslari",
                          style: TextStyle(
                            color: Color(0xFF111111),
                            fontSize: 28,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      Text(
                        dateText,
                        style: const TextStyle(
                          color: Color(0xFF6B7280),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),

                  if (isLoading)
                    const Padding(
                      padding: EdgeInsets.only(top: 120),
                      child: Center(child: CircularProgressIndicator()),
                    )
                  else if (isError)
                    Padding(
                      padding: const EdgeInsets.only(top: 120),
                      child: Center(
                        child: Text(
                          (state as GetConverterError).message,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  else
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0x14000000),
                            blurRadius: 20,
                            offset: Offset(0, 10),
                          ),
                        ],
                      ),
                      child: list.isEmpty
                          ? const Padding(
                        padding: EdgeInsets.symmetric(vertical: 70),
                        child: Center(
                          child: Text(
                            "Hozircha ma’lumot yo‘q",
                            style: TextStyle(
                              color: Color(0xFF111111),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      )
                          : ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: list.length,
                        separatorBuilder: (_, __) => const Padding(
                          padding: EdgeInsets.only(left: 92),
                          child: Divider(
                            height: 1,
                            thickness: 1,
                            color: Color(0xFFEDEDED),
                          ),
                        ),
                        itemBuilder: (context, index) {
                          final item = list[index];

                          return InkWell(
                            onTap: () => context.push(
                              '/convert',
                              extra: item,
                            ),
                            child: ConverterItem(converter: item),
                          );
                        },
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
