import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart' as crypto;
import 'package:pacto_movil/src/models/user_model.dart';

class UserGlobalProvider {
  final String _url = 'https://restserver-pacto.herokuapp.com';

  Future<UserModel> getUser(String correo) async {
    final url = '${this._url}/usuario/${correo}';

    final resp = await http.get(url);

    final Map<String, dynamic> decodedData = json.decode(resp.body);

    print(decodedData);

    final user = UserModel.fromJson(decodedData['usuario']);

    return user;
  }
}
