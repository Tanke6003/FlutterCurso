void main() {
  emitNumbers().listen((value) {
    print('Stream value: $value');
  });
}

Stream<int> emitNumbers() {
  return Stream.periodic(Duration(seconds: 1), (value) {
    //print('desde periodict');
    return value;
  }).take(5);
}
