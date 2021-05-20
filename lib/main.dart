import 'package:flutter/material.dart';
import 'package:pacto_movil/src/blocs/provider.dart';
import 'package:pacto_movil/src/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pacto Mobile',
        initialRoute: '/',
        routes: getRoutesAplication(),
        theme: ThemeData(primaryColor: Colors.deepPurple),
      ),
    );
  }
}
