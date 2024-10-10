import 'dart:convert';

import 'package:http/http.dart' as http;

final String _token = "15481|E5rx8qLZLadwH1fOaUuXD9qNl5jcrAI4";

Future<Map> converteNumeroPorExtenso(String? _valor) async {
  http.Response response;
  response = await http.get(Uri.parse(
      "https://api.invertexto.com/v1/number-to-words?token=$_token&number=$_valor&language=pt&currency=BRL"));
  return json.decode(response.body);
}

Future<Map> BuscaCEP(String? _valor) async {
  http.Response response;
  response = await http.get(
      Uri.parse("https://api.invertexto.com/v1/cep/$_valor?token=$_token"));
  return json.decode(response.body);
}

Future<Map> ValidadorEmail(String? _valor) async {
  http.Response response;
  response = await http.get(Uri.parse(
      "https://api.invertexto.com/v1/email-validator/$_valor?token=$_token"));
  return json.decode(response.body);
}
