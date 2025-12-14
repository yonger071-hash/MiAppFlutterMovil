import 'package:flutter/material.dart';
// Importamos la pantalla de inicio a la que navegaremos después del login (ficticio por ahora)
import 'home_screen.dart'; 

class AuthScreen extends StatelessWidget {
  // Añadimos la ruta con nombre para la navegación global
  static const routeName = '/auth';

  const AuthScreen({super.key});

  void _login(BuildContext context) {
    // Aquí es donde en el futuro enviaremos datos a un servidor.
    // Por ahora, simulamos un inicio de sesión exitoso y navegamos a la Home.
    
    // pushReplacementNamed nos lleva a la Home y reemplaza la pantalla actual, 
    // así el usuario no puede volver a la pantalla de login con el botón de atrás.
    Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Somos Gamer Login'),
        backgroundColor: Colors.black87,
      ),
      body: Container(
        color: Colors.black, // Fondo oscuro
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Icon(
                  Icons.sports_esports,
                  size: 100,
                  color: Colors.green,
                ),
                const SizedBox(height: 20),
                Text(
                  'Bienvenido a Somos Gamer',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 30),
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Correo Electrónico',
                    labelStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.black54,
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 15),
                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                    labelStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.black54,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => _login(context), // Llama a nuestra función de login
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // Color del botón
                    minimumSize: const Size(double.infinity, 40), // Botón ancho
                  ),
                  child: const Text('INICIAR SESIÓN'),
                ),
                TextButton(
                  onPressed: () {
                    // Lógica para ir a la pantalla de registro (o mostrar un diálogo)
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Ir a pantalla de Registro (próximamente)')),
                    );
                  },
                  child: const Text('¿No tienes cuenta? Regístrate aquí'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
