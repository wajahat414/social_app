class A {
  void printA() {
    print("A");
  }
}

mixin B {
  void printB() {
    print("B");
  }
}

class C extends A {
  void printC() {
    print("C");
  }
}

class D extends C with B {
  void printD() {
    print("D");
  }
}
