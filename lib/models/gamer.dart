class Gamer {
  final String id;
  final String name;
  final String email;
  String code;
  int points;
  final String picture;

  Gamer({
    required this.id,
    required this.name,
    required this.email,
    this.code = "",
    this.points = 0,
    required this.picture,
  });
}
