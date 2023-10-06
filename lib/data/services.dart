Future<String> getData() async {
  await Future.delayed(const Duration(seconds: 3));
  return "This is from server data";
}
