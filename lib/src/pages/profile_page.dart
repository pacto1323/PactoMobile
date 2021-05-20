import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pacto_movil/src/blocs/provider.dart';
import 'package:pacto_movil/src/blocs/user_bloc.dart';
import 'package:pacto_movil/src/models/user_model.dart';
import 'package:pacto_movil/src/providers/user_global_provider.dart';
import 'package:pacto_movil/src/providers/user_provider.dart';
import 'package:pacto_movil/src/widgets/drawer.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final formKey = GlobalKey<FormState>();
  bool _guardando = false;
  UserBloc userBloc;
  UserModel user = new UserModel();
  @override
  Widget build(BuildContext context) {
    userBloc = Provider.userGlobal(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
      ),
      drawer: AppDrawer(),
      body: ListView(
        children: [_crearInputs(context)],
      ),
    );
  }

  Widget _crearInputs(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Form(
        key: formKey,
        child: StreamBuilder(
            stream: userBloc.userStream,
            builder: (BuildContext context, AsyncSnapshot<UserModel> snapshot) {
              if (snapshot.hasData) {
                final usuario = snapshot.data;
                return Column(children: [
                  _inputNombre("Nombre de persona", "Nombre",
                      Icons.account_circle, null, usuario),
                  _inputApellido("Apellido de persona", "Apellido",
                      Icons.account_circle, null, usuario),
                  _inputEmail('Email', 'Email', Icons.mail_outline,
                      TextInputType.emailAddress, usuario),
                  _inputTelefonoCasa("Telefono Casa", 'Telefono Casa',
                      Icons.phone, TextInputType.number, usuario),
                  _inputTelefonoCasa("Telefono Movil", 'Telefono Movil',
                      Icons.phone, TextInputType.number, usuario),
                  _cambiarContrasena(context),
                  _botonActualizar(
                      'Actualizar', Colors.blue[600], usuario, context)
                ]);
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
    );
  }

  Widget _inputNombre(String hint, String label, IconData icon,
      TextInputType type, UserModel usuario) {
    return TextFormField(
      initialValue: usuario.nombre,
      keyboardType: type,
      enabled: true,
      decoration:
          InputDecoration(hintText: hint, labelText: label, icon: Icon(icon)),
      onChanged: (value) => usuario.nombre = value,
      validator: (value) {
        if (value.length < 1) {
          return "El campo no puede estar vacio";
        }
        return null;
      },
    );
  }

  Widget _inputApellido(String hint, String label, IconData icon,
      TextInputType type, UserModel usuario) {
    return TextFormField(
      initialValue: usuario.apellido,
      keyboardType: type,
      enabled: true,
      decoration:
          InputDecoration(hintText: hint, labelText: label, icon: Icon(icon)),
      onChanged: (value) => usuario.apellido = value,
      validator: (value) {
        if (value.length < 1) {
          return "El campo no puede estar vacio";
        }
        return null;
      },
    );
  }

  Widget _inputEmail(String hint, String label, IconData icon,
      TextInputType type, UserModel usuario) {
    return TextFormField(
      initialValue: usuario.email,
      keyboardType: type,
      enabled: false,
      decoration:
          InputDecoration(hintText: hint, labelText: label, icon: Icon(icon)),
      onChanged: (value) => usuario.email = value,
      validator: (value) {
        if (value.length < 1) {
          return "El campo no puede estar vacio";
        } else {
          return null;
        }
      },
    );
  }

  Widget _inputTelefonoCasa(String hint, String label, IconData icon,
      TextInputType type, UserModel usuario) {
    return TextFormField(
      initialValue: usuario.tlfc,
      keyboardType: type,
      enabled: true,
      decoration:
          InputDecoration(hintText: hint, labelText: label, icon: Icon(icon)),
      onChanged: (value) => usuario.tlfc = value,
      validator: (value) {
        if (value.length < 1) {
          return "El campo no puede estar vacio";
        }
        return null;
      },
    );
  }

  Widget _inputTelefonoMovil(String hint, String label, IconData icon,
      TextInputType type, UserModel usuario) {
    return TextFormField(
      initialValue: usuario.tlfm,
      keyboardType: type,
      enabled: true,
      decoration:
          InputDecoration(hintText: hint, labelText: label, icon: Icon(icon)),
      onChanged: (value) => usuario.tlfm = value,
      validator: (value) {
        if (value.length < 1) {
          return "El campo no puede estar vacio";
        }
        return null;
      },
    );
  }

  Widget _cambiarContrasena(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: InkWell(
        child: Text('Cambiar tu contraseña',
            style: TextStyle(color: Colors.blueAccent[100])),
        onTap: () => Navigator.pushNamed(context, 'cambiarContrasena'),
      ),
    );
  }

  Widget _botonActualizar(
      String texto, Color color, UserModel usuario, BuildContext context) {
    return RaisedButton(
      child: Container(
        child: Text(texto),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 0.0,
      color: color,
      textColor: Colors.white,
      onPressed: () => _actualizar(usuario, context),
    );
  }

  _actualizar(UserModel usuario, BuildContext context) async {
    print('actualizar');
    if (formKey.currentState.validate()) {
      Stream token = userBloc.tokenStream;
      token.listen((value) async {
        final t = value;
        final userProvider = UserProvider();
        Map info = await userProvider.updateUser(usuario, t);
        if (info['ok']) {
          final snackBar =
              SnackBar(content: Text('Se ha actualizado el usuario'));
          Scaffold.of(context).showSnackBar(snackBar);
        }
      });
    }
  }
}
