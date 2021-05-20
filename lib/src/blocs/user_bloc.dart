import 'package:pacto_movil/src/providers/user_global_provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:pacto_movil/src/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserBloc {
  final _userController = new BehaviorSubject<UserModel>();
  final _cargandoController = new BehaviorSubject<bool>();
  final _tokenController = new BehaviorSubject<String>();

  final _userProvider = new UserGlobalProvider();

  Stream<UserModel> get userStream => _userController.stream;
  Stream<bool> get cargando => _cargandoController.stream;
  Stream<String> get tokenStream => _tokenController.stream;

  dispose() {
    _userController?.close();
    _cargandoController?.close();
    _tokenController?.close();
  }

  Future read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'UsuId';
    final value = prefs.getString(key) ?? "";
    print('read: $value');
    return value;
  }

  save(String val) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'UsuId';
    final value = val;
    prefs.setString(key, value);
    print('saved $value');
  }

  void verUsuario() async {
    print(_userController.value);
  }

  void cargarUsuario(String correo, String token) async {
    final user = await _userProvider.getUser(correo);
    _userController.sink.add(user);
    _tokenController.sink.add(token);
  }
}
