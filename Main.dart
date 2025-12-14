import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Importamos el paquete provider

// Importa todas tus pantallas
import './screens/home_screen.dart';
import './screens/auth_screen.dart';
import './screens/tournaments_screen.dart';
import './screens/recharge_screen.dart';
import './screens/gifts_screen.dart';
// Importamos nuestro nuevo proveedor de autenticación
import './providers/auth_provider.dart'; 


void main() {
  // Envolvemos toda la aplicación con ChangeNotifierProvider
  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthProvider(), // Creamos una instancia de nuestro AuthProvider
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Somos Gamer App',
      theme: ThemeData(
        brightness: Brightness.dark, // Tema oscuro por defecto
        primarySwatch: Colors.green, // Tono principal
      ),
      // home: const AuthScreen(), // Comentamos home para usar rutas

      routes: {
        AuthScreen.routeName: (context) => const AuthScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        TournamentsScreen.routeName: (context) => const TournamentsScreen(),
        RechargeScreen.routeName: (context) => const RechargeScreen(),
        GiftsScreen.routeName: (context) => const GiftsScreen(),
      },
      // Usaremos un consumidor para decidir qué pantalla mostrar al inicio (login o home)
      home: Consumer<AuthProvider>(
        builder: (ctx, auth, _) {
          if (auth.isAuthenticated) {
            return const HomeScreen();
          } else {
            return const AuthScreen();
          }
        },
      ),
    );
  }
}
