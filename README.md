# print_ast

A scratchpad to try out [`ast_writer`](https://github.com/dart-lang/sdk/blob/d63d5d93a59b370bf5f5c277109110cb67a96b75/pkg/analysis_server/lib/src/status/ast_writer.dart) as mentioned in [this thread](https://groups.google.com/a/dartlang.org/g/analyzer-discuss/c/Zo4HS5JVHnU/m/u4SMg3sDAQAJ).

## Parse dart source file to ast

Run `$ pub run print_ast` or `$ yarn run parse`  
Runs a script to parse the file `fixtures/to_be_analyzed.dart` and output the ast structure in `out/index.html`

## View ast structure in html file

Run `$ pub run dhttpd --path out` or `$ yarn run start`  
Starts a http server at port 8080 to view the ast structure html file at `http://localhost:8080`
