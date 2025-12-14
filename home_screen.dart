import 'package:flutter/material.dart';
import 'tournaments_screen.dart';
import 'recharge_screen.dart';
import 'gifts_screen.dart';
import '../app_drawer.dart'; // <-- Importación del Drawer AÑADIDA (fíjate en los dos puntos para subir de carpeta)

class HomeScreen extends StatelessWidget {
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
            onPressed: () {},
          ),
        ],
      ),
      // <-- AÑADIMOS el Drawer al Scaffold principal
      drawer: const AppDrawer(), 
      // ------------------------------------------------
      body: Container(
        color: Colors.black,
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>,
        ),
      ),
    );
  }

  // --- Widgets Reutilizables (El resto del código es el mismo) ---
  Widget _buildBannerSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:,
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
        _navCard(context, 'Torneos', Icons.emoji_events, () {
           Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const TournamentsScreen()),
          );
        }),
        _navCard(context, 'Recargas', Icons.account_balance_wallet, () {
           Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const RechargeScreen()),
          );
        }),
        _navCard(context, 'Regalos', Icons.card_giftcard, () {
           Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const GiftsScreen()),
          );
        }),
        _navCard(context, 'Comunidad', Icons.people, () {}),
      ],
    );
  }

  Widget _navCard(BuildContext context, String title, IconData icon, VoidCallback onTap) {
     // ... (mismo código para el nav card)
    return InkWell(
      onTap: onTap,
      splashColor: const Color(0xFF39FF14).withAlpha(30),
      highlightColor: const Color(0xFF39FF14).withAlpha(10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0xFF39FF14).withOpacity(0.5)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:,
        ),
      ),
    );
  }
  
  Widget _buildEventCard(String title, String subtitle) {
      // ... (mismo código para el event card)
    return Card(
      color: Colors.grey,
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
