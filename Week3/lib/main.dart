import 'package:flutter/material.dart';
import 'data.dart';
import 'profile_header.dart';
import 'info_row.dart';

// Slides 10-11: runApp + MaterialApp + Scaffold + AppBar is the whole
// shell. Every widget with real content is extracted into its own file
// (slide 17: "when a piece of the tree gets long, pull it out").
void main() => runApp(const ProfileApp());

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'My Profile',
        theme: ThemeData(colorSchemeSeed: Colors.deepPurple),
        home: const ProfileScreen(),
      );
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('My profile')),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const ProfileHeader(name: myName, university: myUniversity),
              const SizedBox(height: 24),
              for (final f in facts)
                InfoRow(label: f.label, value: f.value),
            ],
          ),
        ),
      );
}
