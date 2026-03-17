import 'package:flutter/material.dart';
import 'package:staytics/common/theme/custom_colors.dart';

class BreakIndicator extends StatelessWidget {
  const BreakIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Theme.of(
          context,
        ).extension<SpecialColors>()!.breakIndicatorColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.coffee_outlined, size: 16),
          const SizedBox(width: 6),
          Text(
            'Break',
            style: Theme.of(
              context,
            ).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

