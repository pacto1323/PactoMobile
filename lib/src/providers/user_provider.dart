import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart' as crypto;
import 'package:pacto_movil/src/models/user_model.dart';

class UserProvider {
  final String _url = 'https://restserver-pacto.herokuapp.com';

  Future<Map<String, dynamic>> loginUser(String correo, String password) async {
    final url = '${this._url}/login';
    final resp = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: json.encode({"email": correo, "password": password}));

    final Map<String, dynamic> decodedData = json.decode(resp.body);

    final user = UserModel.fromJson(decodedData['usuario']);
    final token = decodedData['token'];

    if ((user.email == correo)) {
      return {'ok': true, 'token': token};
    } else {
      return {'ok': false, 'mensaje': 'Datos Incorrectos'};
    }
  }

  Future<Map<String, dynamic>> updateUser(
      UserModel usuario, String token) async {
    final user = usuario;
    final url = '${this._url}/usuario/${user.id}';
    final resp = await http.put(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'token': token
        },
        body: json.encode({
          "nombre": user.nombre,
          "apellido": user.apellido,
          "tlfc": user.tlfc,
          "tlfm": user.tlfm,
          "hectareas": user.hectareas,
          "sector": user.sector,
          "barrio": user.barrio,
          "parroquia": user.parroquia,
          "estado": user.estado,
          "role": user.role,
        }));
    final Map<String, dynamic> decodedData = json.decode(resp.body);
    print(decodedData);
    if (decodedData['ok']) {
      return {'ok': true};
    } else {
      return {'ok': false};
    }
  }
}
