main() {

  createMessageStream().listen((event) {
    print(event);
  });

}

Stream<String> createMessageStream() async* {
  yield "Hello World!";
  await Future.delayed(const Duration(seconds: 1));
  yield "This code is created by";
  await Future.delayed(const Duration(seconds: 3));
  yield "OgabekDev";
}