import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart' as crypto;
import 'package:pacto_movil/src/blocs/provider.dart';
import 'package:pacto_movil/src/blocs/user_bloc.dart';
import 'package:pacto_movil/src/models/meeting_model.dart';
import 'package:pacto_movil/src/providers/user_provider.dart';

class MeetingProvider {
  final String _url = 'https://restserver-pacto.herokuapp.com';
  UserBloc userBloc;

  Future<Map<String, dynamic>> getReunion(String token) async {
    final url = '${this._url}/reuniones';
    print(token);
    final resp = await http.get(
      url,
      headers: <String, String>{
        'Contenrt-Type': 'application/json; charset=UTF-8',
        'token': token
      },
    );
    final Map<String, dynamic> decodedData = json.decode(resp.body);

    final reunion = MeetingModel.fromJson(decodedData['reuniones']);
    print(reunion.toJson());
    
    // final Map<String, dynamic> decodedData = json.decode(resp.body);
    // print(decodedData);
    // final reunion = MeetingModel.fromJson(decodedData['reuniones']);

    // print(reunion);
    //final token = ;
  }
}
