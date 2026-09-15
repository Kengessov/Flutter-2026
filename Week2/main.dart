import 'catalogue.dart';
import 'data.dart';
import 'models.dart';
import 'shelf_state.dart';

void main() {
  print('=============================================');
  print('Mobile Development Practice 2: Dart Domain');
  print('=============================================\n');

  // Initialize library and set openedAt
  final library = Library();
  library.open();
  print('Library opened at: ${library.openedAt}\n');

  // Build catalogue from rawBooks using factory constructor Book.fromJson
  for (final raw in rawBooks) {
    library.add(Book.fromJson(raw));
  }

  // Demonstrate Level 2 hierarchy with Magazine and Ghost
  final magazine = Magazine(title: 'Dart Developer Digest', year: 2024, issue: 5);
  final ghost = Ghost(title: 'Legacy Cobol Primer', year: 1980);
  library.add(magazine);
  library.add(ghost);

  print('--- Level 2: Hierarchy & Describe ---');
  for (final item in library.items) {
    print('${item.describe()} | isOld: ${item.isOld}');
    if (item case final Borrowable borrowable) {
      print('  -> Borrow label: ${borrowable.borrowLabel()}');
    }
  }

  print('\n--- Level 3: Null Safety Checks ---');
  final cleanCode = library.findByTitle('Clean Code');
  print('findByTitle("Clean Code"): ${cleanCode?.describe()}');
  final missingBook = library.findByTitle('Nonexistent Title');
  print('findByTitle("Nonexistent Title"): $missingBook');
  print('countryOf("Clean Code"): ${library.countryOf('Clean Code')}');
  print('countryOf("Design Patterns") [missing country]: ${library.countryOf('Design Patterns')}');
  print('countryOf("Nonexistent Title"): ${library.countryOf('Nonexistent Title')}');

  print('\n--- Level 4: Collection Queries ---');
  print('All titles: ${library.allTitles}');
  print('Books after 2010: ${library.booksAfter2010.map((b) => b.title).toList()}');
  print('Average page count: ${library.averagePageCount.toStringAsFixed(1)}');
  print('Book count by author: ${library.bookCountByAuthor}');
  print('Distinct authors: ${library.distinctAuthors}');
  print('Present genres: ${library.presentGenres.map((g) => g.label).toSet()}');

  print('\n--- Level 4: Display List Report ---');
  print(library.buildReport());

  print('\n--- Level 5: Dart 3 Records & Patterns ---');
  final stats = statsOf(library.books);
  print('statsOf(books) Record -> count: ${stats.count}, avgPages: ${stats.avgPages.toStringAsFixed(1)}');

  print('\ndescribe(ShelfState) Switch Expression:');
  print('Empty:  ${describe(const Empty())}');
  print('Ready:  ${describe(Ready(library.books))}');
  print('Broken: ${describe(const Broken('Shelf collapse due to excessive load'))}');
}
