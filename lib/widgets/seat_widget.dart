import 'package:flutter/material.dart';

class SeatWidget extends StatelessWidget {
  final String id;
  final bool selected;
  final VoidCallback onTap;

  const SeatWidget({
    super.key,
    required this.id,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: selected ? Colors.purple : Colors.grey[300],
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
