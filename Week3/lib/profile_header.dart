// lib/profile_header.dart
//
// Level 2 of Practice 3. This is the class from slide 9 (StatelessWidget +
// build()) combined with slide 17 ("your own widget"): final fields, a
// const constructor with required named parameters, and super.key.
//
// It shows the photo, the name and the university stacked with Column —
// exactly the "four widgets, no properties" vocabulary from slide 16
// (Center, Padding, Column, Row). No new widget invented, no new property
// bolted onto Text — that is slide 15's whole point.

import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.name,
    required this.university,
  });

  // final: a widget is immutable (slide 7). Same object in, same
  // picture out — that is what makes the const constructor legal.
  final String name;
  final String university;

  @override
  Widget build(BuildContext context) {
    // Slide 28: BuildContext is "where am I in the tree" — Theme.of(context)
    // walks up from here to find the nearest Theme. Not a global variable.
    final theme = Theme.of(context);

    return Column(
      children: [
        const CircleAvatar(
          radius: 48,
          backgroundImage: AssetImage('assets/images/profilescreen.jpg'),
        ),
        const SizedBox(height: 12),
        Text(
          name,
          style: theme.textTheme.headlineSmall?.copyWith(
            // Level 4: this family name must match pubspec.yaml exactly.
            fontFamily: 'MyProfileFont',
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          university,
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyMedium?.copyWith(
            // Slide 37, mistake #4: no hardcoded colours. The colour comes
            // from the theme's colour scheme, not a literal like 0xFF....
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
