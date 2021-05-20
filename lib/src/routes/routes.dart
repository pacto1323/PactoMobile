import 'package:flutter/material.dart';
import 'package:pacto_movil/src/pages/change_password.dart';
import 'package:pacto_movil/src/pages/home_page.dart';
import 'package:pacto_movil/src/pages/login_page.dart';
import 'package:pacto_movil/src/pages/meeting_page.dart';
import 'package:pacto_movil/src/pages/profile_page.dart';
import 'package:pacto_movil/src/pages/training_page.dart';
//Nuestras importaciones

Map<String, WidgetBuilder> getRoutesAplication() {
  final routes = <String, WidgetBuilder>{
    '/': (BuildContext context) => LoginPage(),
    'home': (BuildContext context) => HomePage(),
    'perfil': (BuildContext context) => ProfilePage(),
    'capacitaciones': (BuildContext context) => TrainingPage(),
    'reuniones': (BuildContext context) => MeetingPage(),
    'cambiarContrasena': (BuildContext context) => ChangePassword()
  };

  return routes;
}
