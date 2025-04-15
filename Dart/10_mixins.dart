void main() {
  final flipper = Delfin();

  print("Delfin - flipper \n");
  flipper.nadar();
  final batman = Murcielago();
  print("\nMurcielago - batman \n");
  batman.volar();
  batman.caminar();

  final namor = Pato();
  print("\nPato - namor \n");
  namor.volar();
  namor.caminar();
  namor.nadar();
}

abstract class Animal {}

abstract class Mamifero extends Animal {}

abstract class Ave extends Animal {}

abstract class Pez extends Animal {}

mixin class Volador {
  void volar() => print('estoy volando✈️!!!');
}

mixin class Caminante {
  void caminar() => print('estoy caminando🥾!!!');
}

mixin class Nadador {
  void nadar() => print('estoy nadando🏊!!!');
}

class Delfin extends Mamifero with Nadador {}

class Murcielago extends Mamifero with Volador, Caminante {}

class Gato extends Mamifero with Caminante {}

class Paloma extends Ave with Caminante, Volador {}

class Pato extends Ave with Caminante, Volador, Nadador {}

class Tiburon extends Pez with Nadador {}

class PezVolador extends Pez with Volador, Nadador {}
