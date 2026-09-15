// Level 3 & Level 4: Null Safety and Collections

import 'models.dart';

/// The central catalogue holding items and exposing collection queries.
class Library {
  final List<LibraryItem> items = [];

  /// Assigned when the library officially opens.
  late final DateTime openedAt;

  /// Cached string representation of the catalogue report.
  String? _cachedReport;

  /// Adds an item (Book, Magazine, Ghost, etc.) to the catalogue.
  void add(LibraryItem item) {
    items.add(item);
  }

  /// Opens the library, setting [openedAt].
  void open() {
    openedAt = DateTime.now();
  }

  /// Returns helper list of all items that are of type Book.
  List<Book> get books => items.whereType<Book>().toList();

  /// Finds a book by title. Returns null if not found, never throws.
  Book? findByTitle(String title) =>
      items.whereType<Book>().where((item) => item.title == title).firstOrNull;

  /// Returns the country of the author of the book with [title], or 'unknown'.
  /// Single expression utilizing ?. and ??.
  String countryOf(String title) =>
      findByTitle(title)?.author.country ?? 'unknown';

  // ---------------------------------------------------------------------------
  // Level 4: Collection Queries (one expression each, no for-loops)
  // ---------------------------------------------------------------------------

  /// 1. Every title across all items in the catalogue.
  List<String> get allTitles => items.map((item) => item.title).toList();

  /// 2. Books published strictly after 2010.
  List<Book> get booksAfter2010 =>
      books.where((book) => book.year > 2010).toList();

  /// 3. The average page count of all books in the catalogue.
  ///
  /// Why fold instead of reduce?
  /// - reduce() throws a StateError if the collection is empty.
  /// - fold() provides an explicit initial value (0) and handles empty collections safely.
  /// - fold() allows transforming types: accumulating a List<Book> into an int sum.
  double get averagePageCount => books.isEmpty
      ? 0.0
      : books.fold<int>(0, (sum, book) => sum + book.pages) / books.length;

  /// 4. Map from author name to the number of books authored in the catalogue.
  Map<String, int> get bookCountByAuthor => books.fold<Map<String, int>>(
        {},
        (acc, book) => {
          ...acc,
          book.author.name: (acc[book.author.name] ?? 0) + 1,
        },
      );

  /// 5. Set of distinct author names.
  Set<String> get distinctAuthors =>
      books.map((book) => book.author.name).toSet();

  /// 6. Set of every genre present in the library.
  Set<Genre> get presentGenres => books.map((book) => book.genre).toSet();

  /// One display list built as a single list literal using collection-if,
  /// collection-for, and the spread operator (...).
  List<String> get displayList => [
        'CATALOGUE',
        for (final book in books) '${book.title} (${book.year})',
        ...distinctAuthors,
        if (books.any((book) => book.pages == 0)) '(incomplete data)',
      ];

  /// Builds or returns the cached catalogue report.
  /// Demonstrates ??= and safe local promotion.
  String buildReport() {
    _cachedReport ??= displayList.join('\n');
    final report = _cachedReport;
    return report is String ? report : '';
  }
}
