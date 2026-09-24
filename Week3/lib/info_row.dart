// lib/info_row.dart
//
// Level 3 of Practice 3. Reused four times from `facts` in main.dart via
// a collection-for, not four copy-pasted widgets (see slide 19: "this is
// what reusable actually means" — change it once here, all four rows
// change). Composition, not a property: a Row holding two Text widgets,
// the same idea as slide 15/16, not a new "twoColumn" flag on Text.

import 'package:flutter/material.dart';

class InfoRow extends StatelessWidget {
  const InfoRow({
    super.key,
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            // One line, one place: this is the answer to the practice's
            // own test — "make every label grey" means editing this file,
            // not four call sites.
            style: TextStyle(color: theme.colorScheme.onSurfaceVariant),
          ),
          Text(
            value,
            style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
