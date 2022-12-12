import 'dart:collection';

import 'package:http/http.dart' as http;
import 'dart:convert';

class DiscosProvider {
  final String apiURL = 'http://10.0.2.2:8000/api';

  Future<List<dynamic>?> getDiscos([int? id]) async {
    var uri = Uri.parse('$apiURL/discos/');
    var respuesta = await http.get(uri);
    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return null;
    }
  }

  Future<LinkedHashMap<String, dynamic>?> discosAgregar(
      String nombre, String autos, String genero) async {
    var uri = Uri.parse('$apiURL/discos/');
    var respuesta = await http.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          'nombre': nombre,
          'autos': autos,
          'genero': genero,
        }));
    if (respuesta.body.isNotEmpty) {
      return jsonDecode(respuesta.body);
    } else {
      return null;
    }
  }

  Future<http.Response> discosBorrar(int id) async {
    var uri = Uri.parse('$apiURL/discos/$id');
    return await http.delete(uri);
  }

  Future<LinkedHashMap<String, dynamic>?> discosEditar(
      int id, String nombre, String autos, String genero) async {
    var uri = Uri.parse('$apiURL/discos/$id');
    var respuesta = await http.put(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          'nombre': nombre,
          'autos': autos,
          'genero': genero,
        }));
    if (respuesta.body.isNotEmpty) {
      return jsonDecode(respuesta.body);
    } else {
      return null;
    }
  }
}
