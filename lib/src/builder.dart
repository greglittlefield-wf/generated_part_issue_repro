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
    final inputFilename = buildStep.inputId.pathSegments.last;
    await buildStep
        .writeAsString(buildStep.inputId.changeExtension('.g.dart'), '''
part of '$inputFilename';

var _\$generatedMember = 'I was generated!';
''');
  }
}
