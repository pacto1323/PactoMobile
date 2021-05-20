import 'package:flutter/material.dart';
import 'package:pacto_movil/src/blocs/provider.dart';
import 'package:pacto_movil/src/blocs/user_bloc.dart';
import 'package:pacto_movil/src/models/user_model.dart';
import 'package:pacto_movil/src/providers/meeting_provider.dart';
import 'package:pacto_movil/src/widgets/drawer.dart';

class MeetingPage extends StatelessWidget {
  UserBloc userBloc;
  @override
  Widget build(BuildContext context) {
    userBloc = Provider.userGlobal(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Reuniones'),
      ),
      drawer: AppDrawer(),
      body: Stack(
        children: [
          StreamBuilder(
            stream: userBloc.tokenStream,
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              
              return FutureBuilder(
                future: MeetingProvider().getReunion(snapshot.data),
                builder: (BuildContext context,
                    AsyncSnapshot<Map<String, dynamic>> snapshot) {
                  if (snapshot.hasData) {
                    print(snapshot.data);
                    return ListView(
                      children: [_meetingBox(context), _meetingBox(context)],
                    );
                  }
                  return CircularProgressIndicator();
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _meetingBox(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0, bottom: 10.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 4,
            offset: Offset(2.0, 5.0),
          ),
        ],
        color: Colors.white,
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              "Tema Reunion",
              style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 22.0,
                color: Colors.black,
                fontFamily: "Lato",
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.left,
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Text(
                    "Lugar: ",
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 18.0,
                      color: Colors.black,
                      fontFamily: "Lato",
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Text("Oficina asociación",
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 18.0,
                        color: Colors.black,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.normal,
                      )),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text(
                          "Fecha ",
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 18.0,
                            color: Colors.black,
                            fontFamily: "Lato",
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          "22/01/2021",
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 18.0,
                            color: Colors.black,
                            fontFamily: "Lato",
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    )),
                Container(
                    child: Column(
                  children: [
                    Text(
                      "Hora",
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 18.0,
                        color: Colors.black,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "08:00",
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 18.0,
                        color: Colors.black,
                        fontFamily: "Lato",
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
