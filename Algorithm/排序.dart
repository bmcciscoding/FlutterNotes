import 'dart:math';

void main() {
  var list = randomArray(10, 1000);
  print('begin list\t$list');
  // bubble(list);
  // select(list);
  // list = quick(list);
  // insert(list);
  // list = merge(list);
  heap(list);
  print('end list\t$list');
}

/// 堆排序
void heap(List list) {
  var length = list.length;
  void swap(list, i, j) {
    var a = list[i];
    list[i] = list[j];
    list[j] = a;
  }

  void buildHeap(list, i) {
    var left = 2 * i + 1;
    var right = 2 * i + 2;
    var max = i;
    if (left < length && list[left] > list[max]) {
      max = left;
    }
    if (right < length && list[right] > list[max]) {
      max = right;
    }
    if (max != i) {
      swap(list, i, max);
      buildHeap(list, max);
    }
  }

  //  构建堆
  for (var i = (length / 2).floor(); i >= 0; i--) {
    buildHeap(list, i);
  }

  for (var i = length - 1; i > 0; i--) {
    swap(list, 0, i);
    length--;
    buildHeap(list, 0);
  }
}

/// 归并排序
List merge(List list) {
  if (list.length <= 1) {
    return list;
  }

  var mid = (list.length / 2).floor();
  return _merge(merge(list.sublist(0, mid)), merge(list.sublist(mid)));
}

List _merge(List left, List right) {
  var result = [];
  while (left.length > 0 && right.length > 0) {
    if (left[0] < right[0]) {
      result.add(left.removeAt(0));
    } else {
      result.add(right.removeAt(0));
    }
  }
  return result + (left.length > 0 ? left : right);
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

/// 插入排序
void insert(List list) {
  for (var i = 1; i < list.length; i++) {
    var preIndex = i - 1;
    var curValue = list[i];
    while (preIndex >= 0 && list[preIndex] > curValue) {
      list[preIndex + 1] = list[preIndex];
      preIndex--;
    }
    list[preIndex + 1] = curValue;
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
