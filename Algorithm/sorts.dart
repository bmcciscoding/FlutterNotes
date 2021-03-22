import 'dart:math';

void main() {
  var list = randomArray(10, 100);
  print('begin list $list');
  bubble(list);
  print('end list $list');
}

List randomArray(int count, int max) {
  var ran = new Random();
  var list = [];
  for (var i = 0; i < count; i++) {
    list.add(ran.nextInt(max));
  }
  return list;
}

/// 冒泡排序
void bubble(List list) {
  for (var i = 0; i < list.length - 1; i++) {
    for (var j = 0; j < list.length - 1 - i; j++) {
      if (list[j] > list[j + 1]) {
        var temp = list[j];
        list[j] = list[j + 1];
        list[j + 1] = temp;
      }
    }
  }
}
