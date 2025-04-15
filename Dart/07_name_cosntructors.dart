void main() {
  final Map<String, dynamic> rawJson = {
    'name': 'TonyStark',
    'power': 'Money',
    'isAlive': true,
  };
  //final ironman = Hero(isAlive: false, power: 'Money', name: 'Tony Stark');
  final ironman = Hero.fromJson(rawJson);
  print(ironman);
}

class Hero {
  String name;
  String power;
  bool isAlive;

  Hero({required this.name, required this.power, required this.isAlive});

  Hero.fromJson(Map<String, dynamic> json)
    : name = json["name"] ?? 'no name found',
      power = json["power"] ?? 'no power found',
      isAlive = json["isAlive"] ?? 'no isAlive found';
  @override
  String toString() {
    return '$name, $power ${isAlive ? 'YES!' : 'Nope'}';
  }
}
