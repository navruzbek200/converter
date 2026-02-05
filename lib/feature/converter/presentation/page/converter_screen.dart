import 'package:flutter/material.dart';
import 'package:converterrr/feature/converter/domain/entity/get_converter_entity.dart';
import 'package:go_router/go_router.dart';

import '../widget/convert_widget.dart';

class ConverterScreen extends StatefulWidget {
  final GetConverterEntity item;
  const ConverterScreen({super.key, required this.item});

  @override
  State<ConverterScreen> createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  final _amountCtrl = TextEditingController(text: '1000');
  bool _swap = false;

  double _toDouble(dynamic v) =>
      double.tryParse(v.toString().replaceAll(',', '.')) ?? 0;

  double get rateUZS => _toDouble(widget.item.rate);

  double get amount => _toDouble(_amountCtrl.text);

  double get converted {
    if (rateUZS == 0) return 0;
    // default: CCY -> UZS
    // swap: UZS -> CCY
    return _swap ? (amount / rateUZS) : (amount * rateUZS);
  }

  String get topCode => _swap ? 'UZS' : widget.item.ccy.toString();
  String get bottomCode => _swap ? widget.item.ccy.toString() : 'UZS';

  String get indicativeText {
    if (rateUZS == 0) return "";
    return _swap
        ? "1 UZS = ${(1 / rateUZS).toStringAsFixed(6)} ${widget.item.ccy}"
        : "1 ${widget.item.ccy} = ${rateUZS.toStringAsFixed(2)} UZS";
  }

  @override
  void dispose() {
    _amountCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          "Currency Converter",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Text(
                textAlign: TextAlign.center,
                "Check lives rates, set rate alerts, receive notifications and more",
                style: TextStyle(fontSize: 20, color: Colors.black,),
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                const SizedBox(height: 10),
                const Text(
                  "Currency Converter",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  "Check live rates, set rate alerts, receive\nnotifications and more.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white70),
                ),
                const SizedBox(height: 18),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      rowBlock(
                        label: "Amount",
                        code: topCode,
                        controller: _amountCtrl,
                        enabled: true,
                        onChanged: (_) => setState(() {}),
                      ),
                      const SizedBox(height: 12),
                      const Divider(height: 1),
                      const SizedBox(height: 12),

                      Center(
                        child: InkWell(
                          onTap: () => setState(() => _swap = !_swap),
                          borderRadius: BorderRadius.circular(999),
                          child: Container(
                            width: 54,
                            height: 54,
                            decoration: const BoxDecoration(
                              color: Color(0xFF1C2C79),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.swap_vert,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),
                      const Divider(height: 1),
                      const SizedBox(height: 12),

                      rowBlock(
                        label: "Converted Amount",
                        code: bottomCode,
                        controller: TextEditingController(
                          text: converted.toStringAsFixed(2),
                        ),
                        enabled: false,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 18),
                const Text(
                  "Indicative Exchange Rate",
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
                const SizedBox(height: 8),
                Text(
                  indicativeText,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
