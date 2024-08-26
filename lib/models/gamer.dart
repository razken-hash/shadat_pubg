class Gamer {
  final String id;
  final String name;
  final String email;
  String code;
  int points;
  int turns;
  DateTime goldenBoxGiftDate;
  DateTime dailyPriseDate;
  final String picture;

  Gamer({
    required this.id,
    required this.name,
    required this.email,
    this.code = "",
    this.points = 0,
    this.turns = 3,
    required this.goldenBoxGiftDate,
    required this.dailyPriseDate,
    required this.picture,
  });
}
