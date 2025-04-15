void main() async {
  print("Inicio del programa");

  try {
    final value = await httpGet('http://google.com');
    print('exito: $value');
  } on Exception catch (err) {
    print('Tenemos una exception: $err');
  } catch (err) {
    print('Opps!! algo terrible paso: $err');
  } finally {
    print('Fin del try catch');
  }

  print("Fin del programa");
}

Future<String> httpGet(String url) async {
  await Future.delayed(const Duration(seconds: 1));
  throw new Exception('No hay parametros en el url');
  //throw 'Error en la peticion http';
  //return 'Respuesta de la peticion http';
}
