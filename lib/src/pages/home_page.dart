import 'package:flutter/material.dart';
import 'package:pacto_movil/src/blocs/provider.dart';
import 'package:pacto_movil/src/blocs/user_bloc.dart';
import 'package:pacto_movil/src/models/user_model.dart';
import 'package:pacto_movil/src/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  UserBloc userBloc;
  @override
  Widget build(BuildContext context) {
    userBloc = Provider.userGlobal(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Bienvenido'),
        ),
        drawer: AppDrawer(),
        body: Stack(
          children: [
            Center(
              child: Container(
                  child: StreamBuilder(
                      stream: userBloc.userStream,
                      builder: (BuildContext context,
                          AsyncSnapshot<UserModel> snapshot) {
                        if (snapshot.hasData) {
                          return Column(
                            children: [
                              Icon(
                                Icons.account_circle,
                                size: 150,
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 20, left: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      "Nombre: ",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      snapshot.data.nombre +
                                          " " +
                                          snapshot.data.apellido,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 20, left: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      "Email: ",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      snapshot.data.email,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 20, left: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      "Teléfono Fijo: ",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      snapshot.data.tlfc,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 20, left: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      "Teléfono Móvil: ",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      snapshot.data.tlfm,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 20, left: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      "Rol: ",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 23,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      snapshot.data.role,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      })),
            ),
          ],
        ));
  }
}
