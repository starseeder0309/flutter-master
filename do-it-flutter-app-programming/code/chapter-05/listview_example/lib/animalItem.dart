class Animal {
  String? name;
  String? kind;
  String? imagePath;
  bool? canFly = false;

  Animal(
      {required this.name,
      required this.kind,
      required this.imagePath,
      this.canFly});
}
