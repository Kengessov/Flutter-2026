// Level 5: Dart 3 Features (sealed, patterns, records)

import 'models.dart';

/// Sealed class hierarchy representing the status of a bookshelf.
sealed class ShelfState {
  const ShelfState();
}

/// The shelf has no items.
class Empty extends ShelfState {
  const Empty();
}

/// The shelf is loaded and ready with items.
class Ready extends ShelfState {
  final List<Book> books;
  const Ready(this.books);
}

/// The shelf is damaged or unusable.
class Broken extends ShelfState {
  final String message;
  const Broken(this.message);
}

/// Describes the shelf state using a Dart 3 switch expression with NO default clause,
/// leveraging object patterns to extract inner fields.
String describe(ShelfState state) => switch (state) {
      Empty() => 'Shelf is empty.',
      Ready(:final books) =>
        'Shelf is ready with ${books.length} book(s).',
      Broken(:final message) => 'Shelf is broken: $message',
    };

/// Computes statistics for a list of books and returns them as a named record.
({int count, double avgPages}) statsOf(List<Book> books) {
  if (books.isEmpty) {
    return (count: 0, avgPages: 0.0);
  }
  final totalPages = books.fold<int>(0, (sum, book) => sum + book.pages);
  return (
    count: books.length,
    avgPages: totalPages / books.length,
  );
}
