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
