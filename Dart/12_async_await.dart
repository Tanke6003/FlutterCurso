void main() async {
  print("Inicio del programa");

  try {
    final value = await httpGet('http://google.com');
    print(value);
  } catch (err) {
    print('tenemos un error: $err');
  }

  print("Fin del programa");
}

Future<String> httpGet(String url) async {
  await Future.delayed(const Duration(seconds: 1));
  throw 'Error en la peticion http';
  //return 'Respuesta de la peticion http';
}
