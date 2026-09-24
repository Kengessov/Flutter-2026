# My Profile Screen — Practice 3

Built to match Flutter I, Lecture 3 ("Everything is a widget") and the
Practice 3 brief exactly. Every design choice is commented in the code
with the slide it comes from — see `DEFENSE_NOTES.md` for the short
version you can talk through at the defence.

## What's here

| File | Level | Lecture concept |
|---|---|---|
| `lib/main.dart` | 1 | `MaterialApp` → `Scaffold` → `AppBar` (slide 11), 38 lines |
| `lib/profile_header.dart` | 2 | `StatelessWidget`, `final`, `const` constructor (slides 9, 17) |
| `lib/info_row.dart` | 3 | composition (`Row`), reused via collection-`for` (slide 19) |
| `pubspec.yaml` | 4 | asset + font declaration (slides 23-24) |
| `analysis_options.yaml` | 5 | `flutter_lints`, `prefer_const_constructors` (slide 35) |
| `lib/data.dart` | — | starter data (Dart 3 records, week 2) |

## Before you can run it

1. **Copy `lib/`, `pubspec.yaml`, `analysis_options.yaml` into a fresh
   project** — do not build on top of the counter app:
   ```
   flutter create profile_screen
   ```
   then replace the generated files with the ones here.

2. **Edit `lib/data.dart`** — put your real name, university and facts.

3. **Your photo** (Level 4, step 1 of 2):
   - Replace `assets/images/avatar.jpg` with an actual photo of you
     (a placeholder "YOUR PHOTO HERE" circle is there now so the app
     compiles while you work on everything else).

4. **Your font** (Level 4, step 2 of 2):
   - Pick any font from [fonts.google.com](https://fonts.google.com)
     (`Literata`, the one from slide 24, is a safe pick — or choose your
     own, that's the point of "your own font").
   - Download the `.ttf` files and put them in `assets/fonts/`, named
     `MyProfileFont-Regular.ttf` and `MyProfileFont-Bold.ttf`
     (or edit the filenames in `pubspec.yaml` to match what you downloaded).
   - **Quick test tip**: if you want to see the layout before your font is
     ready, comment out the `fonts:` block in `pubspec.yaml` and the
     `fontFamily:` line in `profile_header.dart` — then uncomment both once
     your `.ttf` files are in place.

5. **Restart, don't hot reload** (slide 26 — this is the exact mistake
   the lecture warns about):
   ```
   flutter pub get
   ```
   then a full restart (not hot reload) so the new assets are picked up.

6. **Polish (Level 5)**:
   ```
   flutter analyze   # must print "No issues found!"
   dart format .
   ```
   Then take a screenshot of the running app and save it as
   `screenshot.png` in the repo root before you commit.

## What was deliberately left out

Per the practice brief: no `StatefulWidget`, no `setState`, no buttons —
nothing on this screen changes (that's next week). Alignment, sizing,
`Expanded`, `Stack` and scrolling are week 5 and are not used here either
— only the four widgets from slide 16 (`Center`, `Padding`, `Column`,
`Row`).
