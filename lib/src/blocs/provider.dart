import 'package:flutter/material.dart';
import 'package:pacto_movil/src/blocs/login_bloc.dart';
import 'package:pacto_movil/src/blocs/user_bloc.dart';
export 'package:pacto_movil/src/blocs/login_bloc.dart';

class Provider extends InheritedWidget {
  final loginBloc = LoginBloc();
  final _userBloc = UserBloc();

  static Provider _instancia;

  factory Provider({Key key, Widget child}) {
    if (_instancia == null) {
      _instancia = new Provider._internal(key: key, child: child);
    }

    return _instancia;
  }

  Provider._internal({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static LoginBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<Provider>().loginBloc);
  }

  static UserBloc userGlobal(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<Provider>()._userBloc);
  }
}
