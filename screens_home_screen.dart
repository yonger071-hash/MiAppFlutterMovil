import 'package:flutter/material.dart';
// Importamos las pantallas para usar sus routeNames
import 'tournaments_screen.dart';
import 'recharge_screen.dart';
import 'gifts_screen.dart';
import '../widgets/app_drawer.dart'; // Importación del Drawer

class HomeScreen extends StatelessWidget {
  // Añadimos la ruta con nombre
  static const routeName = '/home';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Somos Gamer App'),
        backgroundColor: Colors.black87,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            // Usamos la navegación por nombre para cerrar sesión (volver a AuthScreen)
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/auth');
            },
          ),
        ],
      ),
      drawer: const AppDrawer(), 
      body: Container(
        color: Colors.black,
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[ // Corregido el error de sintaxis aquí
            _buildBannerSection(),
            const SizedBox(height: 20),
            Text('Navegación Rápida', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white)),
            const SizedBox(height: 10),
            _buildQuickNavigation(context), // Pasamos el contexto
            const SizedBox(height: 20),
            Text('Eventos Recientes', style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white)),
            _buildEventCard('Evento 1', 'Detalles del Evento 1'),
            _buildEventCard('Evento 2', 'Detalles del Evento 2'),
          ],
        ),
      ),
    );
  }

  // --- Widgets Reutilizables (Adaptados para usar routeNames) ---
  Widget _buildBannerSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey, // Oscurecido un poco
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column( // Corregido el error de sintaxis aquí
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text('¡Gana Premios Hoy!', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          Text('Participa en nuestros torneos diarios.', style: TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }

  Widget _buildQuickNavigation(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 15,
      mainAxisSpacing: 15,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        // Usamos pushNamed en lugar de MaterialPageRoute
        _navCard(context, 'Torneos', Icons.emoji_events, () {
           Navigator.of(context).pushNamed(TournamentsScreen.routeName);
        }),
        _navCard(context, 'Recargas', Icons.account_balance_wallet, () {
           Navigator.of(context).pushNamed(RechargeScreen.routeName);
        }),
        _navCard(context, 'Regalos', Icons.card_giftcard, () {
           Navigator.of(context).pushNamed(GiftsScreen.routeName);
        }),
        _navCard(context, 'Comunidad', Icons.people, () {
           ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Comunidad (próximamente)')));
        }),
      ],
    );
  }

  Widget _navCard(BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      splashColor: const Color(0xFF39FF14).withAlpha(30),
      highlightColor: const Color(0xFF39FF14).withAlpha(10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey, // Oscurecido un poco
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xFF39FF14).withOpacity(0.5)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ // Corregido el error de sintaxis aquí
            Icon(icon, size: 40, color: const Color(0xFF39FF14)),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
  
  Widget _buildEventCard(String title, String subtitle) {
    return Card(
      color: Colors.grey, // Oscurecido un poco
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: const Icon(Icons.gamepad, color: Color(0xFF39FF14)),
        title: Text(title, style: const TextStyle(color: Colors.white)),
        subtitle: Text(subtitle, style: const TextStyle(color: Colors.grey)),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
        onTap: () {},
      ),
    );
  }
}
