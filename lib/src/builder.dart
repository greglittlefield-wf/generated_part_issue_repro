import 'package:build/build.dart';

Builder buildPartToSourceBuilder(BuilderOptions options) =>
    BuildPartToSourceBuilder();

class BuildPartToSourceBuilder extends Builder {
  @override
  final buildExtensions = const {
    '.dart': ['.g.dart'],
  };

  @override
  Future<void> build(BuildStep buildStep) async {
    String partOfDirective;

    final libraryName = (await buildStep.inputLibrary).library.name;
    if (libraryName.isNotEmpty) {
      // Use library name for part-of.
      partOfDirective = 'part of $libraryName;';
    } else {
      // Use path for part-of if there's no library name.
      final inputFilename = buildStep.inputId.pathSegments.last;
      partOfDirective = "part of '$inputFilename';";
    }

    await buildStep
        .writeAsString(buildStep.inputId.changeExtension('.g.dart'), '''
$partOfDirective

var _\$generatedMember = 'I was generated!';
''');
  }
}
