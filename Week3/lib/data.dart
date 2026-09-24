// lib/data.dart
//
// Just data — no widgets here. Content and presentation are separate files
// on purpose (see profile_header.dart / info_row.dart): the same split the
// lecture draws between "the tree" (widgets) and "what fills it" (data).
//
// `facts` uses a Dart 3 record type `({String label, String value})` —
// week 2 material — now doing real work instead of being a syntax demo.

const String myName = 'Aida Nurlanqyzy';
const String myUniversity = 'Kazakh-British Technical University';

const List<({String label, String value})> facts = [
  (label: 'Course', value: '2'),
  (label: 'Group', value: 'CS-2426'),
  (label: 'Subject', value: 'Flutter I'),
  (label: 'Favourite widget', value: 'Padding'),
];
