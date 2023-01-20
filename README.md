This package is a reduced test case for https://github.com/dart-lang/sdk/issues/51087, with a simple builder that generates parts using `build_to:cache`.

See the `example` directory for cases that do and do not exhibit the issue.

To reproduce the issue, run:
```sh
dart pub get
dart run build_runner build
dart analyze .
```

...which results in the following analysis error:
```
  error • with_generated_part/path_part_of.dart:10:6 • Expected this library to be part of 'file:///<path_to_package_root>/example/with_generated_part/path_part_of.dart', not
          'file:///<path_to_package_root>/.dart_tool/build/generated/generated_part_issue_repro/example/with_generated_part/path_part_of.g.dart'. Try including a different part, or
          changing the name of the library in the part's part-of directive. • part_of_different_library
```

[GitHub Actions](https://github.com/greglittlefield-wf/generated_part_issue_repro/actions/workflows/dart_ci.yml) are also set up to show this issue in different Dart SDKs.
