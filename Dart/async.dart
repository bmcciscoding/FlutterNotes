import 'dart:async';

import 'dart:io';


main(List<String> args) {
  print('begin');
  var future = getValue();
  future.then((value) => print('res $value'));
  print('end');
}
Future<int> getValue() async {
  return 5;
}