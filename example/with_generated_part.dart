// After a build, this part directive has the following part_of_different_library error:
//
//   Expected this library to be part of
//   'file:///<path_to_package>/example/with_generated_part.dart', not
//   'file:///<path_to_package>/.dart_tool/build/generated/build_to_source_repro/example/with_generated_part.g.dart'.
//   Try including a different part, or changing the name of the library in the part's part-of directive.
part 'with_generated_part.g.dart';

main() {
  // The analyzer doesn't seem to resolve this (you can't go to definition),
  // but if you run this file with build runner
  // (via `dart run build_runner run example/with_generated_part.dart`),
  // it works.
  print(_$generatedMember);
}
