import 'dart:async';

import 'dart:io';


main(List<String> args) {
  print('begin');
  var future = futureAsync();
  future.then((value) => print('$value'));
  print('end');

  future1()
    .then((value) {
      print('get future1: $value');
      return future2(value);
    })
    .then((value) {
      print('get future2: $value');
      return future3(value);
    })
    .then((value) {
      print('get future3: $value');
    });

    useAsync();

    useAsyncInt().then((value) => print('async $value'));
}

void useAsync() async {
  var res1 = await futureAsync1();
  var res2 = await futureAsync2(res1);
  var res3 = await futureAsync3(res2);
  print('res: $res3');
}

Future<int> useAsyncInt() async {
  var res1 = await futureAsync1();
  var res2 = await futureAsync2(res1);
  var res3 = await futureAsync3(res2);
  print('res: $res3');
  return res3;
}

Future<int> futureAsync() async {
  print('futureAsync');
  return 10;
}

Future<int> future1() {
  return Future<int>.value(5);
}

Future<int> future2(int p1) {
  return Future<int>.value(p1 * 10);
}

Future<int> future3(int p1) {
  return Future<int>.value(p1 * 10);
}

// async
Future<int> futureAsync1() async {
  return 5;
}

Future<int> futureAsync2(int p1) async {
  return p1 * 10;
}

Future<int> futureAsync3(int p1) async {
  return p1 * p1;
}