class Gamer {
  final String id;
  final String name;
  final String email;
  String code;
  int points;
  int turns;
  DateTime goldenBoxGiftDate;
  final String picture;

  Gamer({
    required this.id,
    required this.name,
    required this.email,
    this.code = "",
    this.points = 0,
    this.turns = 3,
    required this.goldenBoxGiftDate,
    required this.picture,
  });
}
