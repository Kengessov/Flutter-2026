// Level 1 & Level 2: Models and Hierarchy

/// Represents an author with a name and optional country of origin.
class Author {
  final String name;
  final String? country;

  const Author({
    required this.name,
    this.country,
  });

  @override
  String toString() {
    final origin = country;
    return origin == null ? name : '$name ($origin)';
  }
}

/// Represents the genre of a library item.
enum Genre {
  craft('Craft'),
  theory('Theory'),
  unknown('Unknown');

  final String label;

  const Genre(this.label);

  static Genre fromString(String? raw) {
    return switch (raw?.toLowerCase()) {
      'craft' => Genre.craft,
      'theory' => Genre.theory,
      _ => Genre.unknown,
    };
  }
}

/// Base contract and shared behavior for any item in the library catalogue.
abstract class LibraryItem {
  final String title;
  final int year;

  const LibraryItem({
    required this.title,
    required this.year,
  });

  /// Abstract description to be implemented by concrete classes.
  String describe();

  /// Items published more than 20 years ago are considered old.
  bool get isOld => (DateTime.now().year - year) > 20;
}

/// A mixin providing borrowing functionality for library items.
mixin Borrowable on LibraryItem {
  String borrowLabel() => 'BORROW: $title ($year)';
}

/// The main Book model in the library.
class Book extends LibraryItem with Borrowable {
  final int pages;
  final Author author;
  final Genre genre;
  final String? description;

  const Book({
    required super.title,
    required super.year,
    required this.pages,
    required this.author,
    required this.genre,
    this.description,
  });

  /// Placeholder for a book about which nothing is known.
  const Book.missing()
      : pages = 0,
        author = const Author(name: 'Unknown'),
        genre = Genre.unknown,
        description = null,
        super(title: 'Unknown', year: 0);

  /// Factory constructor that safely parses raw Map data.
  /// Handles incomplete entries gracefully with sensible defaults.
  factory Book.fromJson(Map<String, dynamic> json) {
    final title = json['title'];
    final year = json['year'];
    final pages = json['pages'];
    final author = json['author'];
    final country = json['country'];
    final genre = json['genre'];
    final description = json['description'];

    return Book(
      title: title is String ? title : 'Untitled',
      year: year is int ? year : 0,
      pages: pages is int ? pages : 0,
      author: Author(
        name: author is String ? author : 'Unknown',
        country: country is String ? country : null,
      ),
      genre: Genre.fromString(genre is String ? genre : null),
      description: description is String ? description : null,
    );
  }

  /// True when the book has more than 400 pages.
  bool get isLong => pages > 400;

  @override
  String describe() {
    final desc = description;
    final details = desc == null ? '' : ' - $desc';
    return 'Book: "$title" ($year) by $author, $pages pp., genre: ${genre.label}$details';
  }

  Book copyWith({
    String? title,
    int? year,
    int? pages,
    Author? author,
    Genre? genre,
    String? description,
  }) {
    return Book(
      title: title ?? this.title,
      year: year ?? this.year,
      pages: pages ?? this.pages,
      author: author ?? this.author,
      genre: genre ?? this.genre,
      description: description ?? this.description,
    );
  }

  @override
  String toString() =>
      'Book(title: "$title", year: $year, pages: $pages, author: $author, genre: ${genre.label}, description: $description)';
}

/// A magazine item in the library.
class Magazine extends LibraryItem {
  final int issue;

  const Magazine({
    required super.title,
    required super.year,
    required this.issue,
  });

  @override
  String describe() => 'Magazine: "$title" ($year), Issue #$issue';

  @override
  String toString() => 'Magazine(title: "$title", year: $year, issue: $issue)';
}

/// A manually implemented LibraryItem that inherits nothing directly.
class Ghost implements LibraryItem {
  @override
  final String title;

  @override
  final int year;

  const Ghost({
    required this.title,
    required this.year,
  });

  @override
  String describe() => 'Ghost: "$title" ($year) [Manual Implementation]';

  @override
  bool get isOld => (DateTime.now().year - year) > 20;

  @override
  String toString() => 'Ghost(title: "$title", year: $year)';
}
