import 'dart:math';

void main() {
  var list = randomArray(10, 1000);
  print('begin list\t$list');
  // bubble(list);
  // select(list);
  list = quick(list);
  print('end list\t$list');
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
  for (var i = 0; i < list.length; i++) {
    for (var j = 0; j < list.length - i; j++) {
      if (list[j] > list[j + 1]) {
        var temp = list[j];
        list[j] = list[j + 1];
        list[j + 1] = temp;
      }
    }
  }
}

/// 选择排序
void select(List list) {
  for (var i = 0; i < list.length; i++) {
    var minIndex = i;
    for (var j = i + 1; j < list.length; j++) {
      if (list[j] < list[minIndex]) {
        minIndex = j;
      }
    }
    var temp = list[i];
    list[i] = list[minIndex];
    list[minIndex] = temp;
  }
}

/// 快速排序
List quick(List list) {
  if (list.length <= 1) {
    return list;
  }
  var midIndex = (list.length / 2).floor();
  var midValue = list.removeAt(midIndex);
  var left = [];
  var right = [];
  for (var i = 0; i < list.length; i++) {
    var curValue = list[i];
    if (curValue < midValue) {
      left.add(curValue);
    } else {
      right.add(curValue);
    }
  }
  return quick(left) + [midValue] + quick(right);
}
