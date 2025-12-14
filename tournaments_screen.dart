import 'package:flutter/material.dart';

class TournamentsScreen extends StatelessWidget {
  const TournamentsScreen({super.key});

  // Datos simulados de torneos (Mock Data)
  final List<Map<String, dynamic>> tournaments = const [
    {
      'name': 'Free Fire World Series',
      'date': '15 de Diciembre',
      'status': 'Abierto',
      'prize': '\$500 USD',
      'color': Colors.green,
    },
    {
      'name': 'Clash Royale Liga',
      'date': '20 de Diciembre',
      'status': 'Lleno',
      'prize': '\$200 USD',
      'color': Colors.red,
    },
     {
      'name': 'PUBG Mobile Cup',
      'date': '22 de Diciembre',
      'status': 'Próximamente',
      'prize': '5000 Diamantes',
      'color': Colors.orange,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Torneos Disponibles'),
        backgroundColor: Colors.black87,
      ),
      body: Container(
        color: Colors.black, // Fondo oscuro
        child: ListView.builder(
          itemCount: tournaments.length,
          itemBuilder: (ctx, index) {
            final tournament = tournaments[index];
            return Card(
              color: Colors.grey,
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              elevation: 5,
              child: ListTile(
                leading: Icon(Icons.emoji_events, color: tournament['color']),
                title: Text(tournament['name'], style: const TextStyle(color: Colors.white)),
                subtitle: Text('${tournament['date']} - ${tournament['prize']}', style: const TextStyle(color: Colors.grey)),
                trailing: Chip(
                  label: Text(tournament['status']),
                  backgroundColor: tournament['color'],
                ),
                onTap: () {
                  // Aquí iría la navegación a la pantalla de detalles del torneo
                  ScaffoldMessenger.of(context).showSnackBar(
                     SnackBar(content: Text('Clic en ${tournament['name']}')),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
