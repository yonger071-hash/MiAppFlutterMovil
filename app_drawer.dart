// lib/widgets/app_drawer.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Importamos provider

// Importa las pantallas para acceder a sus routeNames (aunque ya no se usan directamente aquí)
import '../screens/home_screen.dart';
import '../screens/tournaments_screen.dart';
import '../screens/recharge_screen.dart';
import '../screens/gifts_screen.dart';
// Importamos nuestro proveedor de autenticación
import '../providers/auth_provider.dart'; 

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Obtenemos el nombre de usuario actual para mostrarlo en el header
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>,
            ),
          ),

          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Inicio'),
            onTap: () {
              // Navega a la Home Screen usando la ruta con nombre
              Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.emoji_events),
            title: const Text('Torneos'),
            onTap: () {
              // Navega a Tournaments Screen
              Navigator.of(context).pushReplacementNamed(TournamentsScreen.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.payment),
            title: const Text('Recargas'),
            onTap: () {
              // Navega a Recharge Screen
              Navigator.of(context).pushReplacementNamed(RechargeScreen.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.card_giftcard),
            title: const Text('Regalos'),
            onTap: () {
              // Navega a Gifts Screen
              Navigator.of(context).pushReplacementNamed(GiftsScreen.routeName);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Cerrar Sesión'),
            onTap: () {
              // Llamamos al método logout de nuestro provider
              Provider.of<AuthProvider>(context, listen: false).logout();
              // main.dart se encargará de cambiar la pantalla a AuthScreen automáticamente.
            },
          ),
        ],
      ),
    );
  }
}
