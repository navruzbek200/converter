import 'package:flutter/material.dart';
import 'package:converterrr/feature/converter/domain/entity/get_converter_entity.dart';

class ConverterItem extends StatelessWidget {
  final GetConverterEntity converter;

  const ConverterItem({super.key, required this.converter});

  double _toDouble(dynamic v) {
    if (v == null) return 0;
    return double.tryParse(v.toString().replaceAll(',', '.')) ?? 0;
  }

  String _flagAsset(String ccy) {
    return 'assets/images/ic_currency_exchange.png';
  }

  @override
  Widget build(BuildContext context) {
    final rateNum = _toDouble(converter.rate);
    final diffNum = _toDouble(converter.diff);

    final isUp = diffNum > 0;
    final isDown = diffNum < 0;

    final percent = rateNum == 0 ? 0 : (diffNum / rateNum) * 100;
    final percentText = "${percent.abs().toStringAsFixed(2)}%";

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          ClipOval(
            child: Image.asset(
              _flagAsset(converter.ccy.toString()),
              width: 56,
              height: 56,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  converter.ccy.toString(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF1E1E1E),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  converter.ccyNmUz.toString(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFFB7B7B7),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 10),

          SizedBox(
            width: 140,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "${converter.rate} UZS",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF1E1E1E),
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      child: Text(
                        percentText,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xFFB7B7B7),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    if (isUp)
                      Image.asset('assets/images/ic_incr.png', width: 18, height: 18)
                    else if (isDown)
                      Image.asset('assets/images/ic_decr.png', width: 18, height: 18)
                    else
                      const SizedBox(width: 18, height: 18),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
