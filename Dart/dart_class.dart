import 'dart:async';

main(List<String> args) {
  print(args);
  impl();

  var value = 20;
  void localClosure() {
    value += 1;
    print('change value in closure: $value');
  }

  localClosure();
  localClosure();
  print(value);

}


void impl() {
  final zhangsan = Person();
  zhangsan.speak();
  zhangsan.gotoCompany();
}

mixin Workable {
  void gotoCompany() {
    print('$this will go to company');
  }
}

class Person with Workable {
  void speak() {
    print(this);
  }

  @override
  void gotoCompany() {
    print('$this will go to company alone');
  }

  @override
  noSuchMethod(Invocation invocation) {
    print(invocation);
    return super.noSuchMethod(invocation);
  }
}


