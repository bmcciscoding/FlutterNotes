# 关于 Dart 的异步入门


先看一道思考题
```dart
main(List<String> args) {
  print('begin');
  var future = getValue();
  future.then((value) => print('$value'));
  print('end');
}
Future<int> getValue() async {
  return 5;
}
```
答案会输出什么？如果你不知道答案，请听过我娓娓道来。如果我说错了，请告诉我，感谢。
答案是:
```
begin
end
5
```

## 快速使用

Dart 关于异步，主要是通过 Future 来实现的，同时也支持`async`和`await`的房事。


```dart
/// 定义一个 Future 无参数
Future<int> future1() {
  return Future<int>.value(5);
}
/// 定义一个 Future 有参数
Future<int> future2(int p1) {
  return Future<int>.value(p1);
}

Future<int> future3(int p1) {
  return Future<int>.value(p1 * 10);
}

/// 执行
var future = future1();
future.then((value) => print('res $value'));

/// 链式调用
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
```

从链式调用，已经可以看出异步调用的顺序了。但是代码量过多，阅读起来还是费劲。因此需要 async 和  await 来改造。就变成了下面这样。

```dart
/// 改造 future 定义
/// 使用 async 关键字，同时返回值不需要 Future 包裹了
Future<int> futureAsync1() async {
  return 5;
}

Future<int> futureAsync2(int p1) async {
  return p1 * 10;
}

Future<int> futureAsync3(int p1) async {
  return p1 * p1;
}

/// 调用时使用 await 关键字
/// 阅读起来是不是有重同步代码的味道？
void useAsync() async {
  var res1 = await futureAsync1();
  var res2 = await futureAsync2(res1);
  var res3 = await futureAsync3(res2);
  print('res: $res3');
}

/// 调用
useAsync();

/// 如果需要返回值
Future<int> useAsync() async {
  var res1 = await futureAsync1();
  var res2 = await futureAsync2(res1);
  var res3 = await futureAsync3(res2);
  print('res: $res3');
  return res3;
}

// 调用只用这么写
useAsyncInt().then((value) => print('async $value'));

```

## Dart 的异步机制