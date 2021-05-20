import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              decoration: BoxDecoration(color: Colors.deepPurple[600]),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 24),
              )),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text("Ver perfil"),
            onTap: () => {Navigator.pushReplacementNamed(context, 'perfil')},
          ),
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text("Reuniones"),
            onTap: () => {Navigator.pushReplacementNamed(context, 'reuniones')},
          ),
          ListTile(
            leading: Icon(Icons.article),
            title: Text("Capacitaciones"),
            onTap: () =>
                {Navigator.pushReplacementNamed(context, 'capacitaciones')},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text("Cerrar sesión"),
            onTap: () => {Navigator.pushNamed(context, 'login')},
          )
        ],
      ),
    );
  }
}
