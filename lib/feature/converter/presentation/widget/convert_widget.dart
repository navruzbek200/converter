import 'package:flutter/material.dart';

Widget rowBlock({
  required String label,
  required String code,
  required TextEditingController controller,
  required bool enabled,
  ValueChanged<String>? onChanged,
}) {
  return Row(
    children: [
      // flag placeholder
      ClipOval(
        child: Image.asset(
          'assets/images/ic_currency_exchange.png',
          width: 46,
          height: 46,
          fit: BoxFit.cover,
        ),
      ),
      const SizedBox(width: 12),

      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: const TextStyle(color: Colors.black54)),
            const SizedBox(height: 6),
            Row(
              children: [
                Text(
                  code,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF1C2C79),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),

      const SizedBox(width: 10),

      SizedBox(
        width: 140,
        child: TextField(
          controller: controller,
          enabled: enabled,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          onChanged: onChanged,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFFF3F3F3),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 14),
          ),
        ),
      ),
    ],
  );
}