import 'dart:io';

import 'package:analyzer/dart/analysis/analysis_context.dart';
import 'package:analyzer/dart/analysis/analysis_context_collection.dart';
import 'package:analyzer/src/dart/ast/to_source_visitor.dart';
import 'package:path/path.dart' as p;
import 'package:print_ast/src/ast_writer.dart';

void main(List<String> arguments) {
  final includedPaths = <String>[
    p.absolute('fixtures/to_be_analyzed.dart'),
  ];
  final collection = AnalysisContextCollection(includedPaths: includedPaths);
  analyzeFiles(collection, includedPaths);
}

void analyzeFiles(
    AnalysisContextCollection collection, List<String> includedPaths) {
  for (final context in collection.contexts) {
    for (final path in context.contextRoot.analyzedFiles()) {
      analyzeOneFile(context, path);
    }
  }
}

void analyzeOneFile(AnalysisContext context, String path) {
  final session = context.currentSession;
  final parsedUnitResult = session.getParsedUnit(path);
  print('>>> parsedUnitResult.content');
  print(parsedUnitResult.content);
  print('');

  print('>>> to source');
  final buffer = StringBuffer();
  ToSourceVisitor(buffer).visitCompilationUnit(parsedUnitResult.unit);
  print(buffer);
  print('');

  print('>>> ast writer');
  buffer.clear();
  AstWriter(buffer).visitCompilationUnit(parsedUnitResult.unit);
  final file = File(p.absolute('out/index.html'));
  file.writeAsStringSync(buffer.toString());
  print('');

  print('>>>');
}
