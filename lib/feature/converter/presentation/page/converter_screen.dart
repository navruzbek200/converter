import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:converterrr/feature/converter/domain/entity/get_converter_entity.dart';

import '../widget/convert_widget.dart';

class ConverterScreen extends StatefulWidget {
  final GetConverterEntity item;
  const ConverterScreen({super.key, required this.item});

  @override
  State<ConverterScreen> createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  final _amountCtrl = TextEditingController(text: '1000');
  final _resultCtrl = TextEditingController();

  bool _swap = false;

  double _toDouble(dynamic v) =>
      double.tryParse(v.toString().replaceAll(',', '.')) ?? 0;

  double get _rateUZS => _toDouble(widget.item.rate);
  double get _amount => _toDouble(_amountCtrl.text);

  String get _topCode => _swap ? 'UZS' : widget.item.ccy.toString();
  String get _bottomCode => _swap ? widget.item.ccy.toString() : 'UZS';

  double get _converted {
    if (_rateUZS == 0) return 0;
    return _swap ? (_amount / _rateUZS) : (_amount * _rateUZS);
  }

  String get _indicative {
    if (_rateUZS == 0) return "";
    return _swap
        ? "1 UZS = ${(1 / _rateUZS).toStringAsFixed(6)} ${widget.item.ccy}"
        : "1 ${widget.item.ccy} = ${_rateUZS.toStringAsFixed(2)} UZS";
  }

  void _recalc() {
    _resultCtrl.text = _converted.toStringAsFixed(2);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _recalc();
    _amountCtrl.addListener(_recalc);
  }

  @override
  void dispose() {
    _amountCtrl.removeListener(_recalc);
    _amountCtrl.dispose();
    _resultCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _AppBar(onBack: () => context.pop()),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const SizedBox(height: 10),
          const _Header(),
          const SizedBox(height: 18),
          _Card(
            topCode: _topCode,
            bottomCode: _bottomCode,
            amountCtrl: _amountCtrl,
            resultCtrl: _resultCtrl,
            onSwap: () => setState(() => _swap = !_swap),
          ),
          const SizedBox(height: 18),
          _RateInfo(text: _indicative),
        ],
      ),
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onBack;
  const _AppBar({required this.onBack});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: onBack,
      ),

    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          "Currency Converter",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w800,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 8),
        Text(
          "Check live rates, set rate alerts, receive\nnotifications and more.",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black54, fontSize: 14),
        ),
      ],
    );
  }
}

class _Card extends StatelessWidget {
  final String topCode;
  final String bottomCode;
  final TextEditingController amountCtrl;
  final TextEditingController resultCtrl;
  final VoidCallback onSwap;

  const _Card({
    required this.topCode,
    required this.bottomCode,
    required this.amountCtrl,
    required this.resultCtrl,
    required this.onSwap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF6F7FB),
        borderRadius: BorderRadius.circular(22),
        boxShadow: const [
          BoxShadow(
            blurRadius: 18,
            offset: Offset(0, 8),
            color: Color(0x11000000),
          )
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          rowBlock(
            label: "Amount",
            code: topCode,
            controller: amountCtrl,
            enabled: true,
          ),
          const SizedBox(height: 12),
          const Divider(height: 1),
          const SizedBox(height: 12),
          Center(
            child: InkWell(
              onTap: onSwap,
              borderRadius: BorderRadius.circular(999),
              child: Container(
                width: 54,
                height: 54,
                decoration: const BoxDecoration(
                  color: Color(0xFF1C2C79),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.swap_vert, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 12),
          const Divider(height: 1),
          const SizedBox(height: 12),
          rowBlock(
            label: "Converted Amount",
            code: bottomCode,
            controller: resultCtrl,
            enabled: false,
          ),
        ],
      ),
    );
  }
}

class _RateInfo extends StatelessWidget {
  final String text;
  const _RateInfo({required this.text});

  @override
  Widget build(BuildContext context) {
    if (text.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Indicative Exchange Rate",
          style: TextStyle(color: Colors.black54, fontSize: 14),
        ),
        const SizedBox(height: 8),
        Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}
