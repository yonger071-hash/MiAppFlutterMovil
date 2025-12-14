import 'package:flutter/material.dart';

class GiftsScreen extends StatefulWidget {
  const GiftsScreen({super.key});

  @override
  State<GiftsScreen> createState() => _GiftsScreenState();
}

class _GiftsScreenState extends State<GiftsScreen> {
  final _codeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isRedeeming = false;

  void _redeemCode() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isRedeeming = true;
      });

      String enteredCode = _codeController.text.trim().toUpperCase();
      
      // --- Lógica Simulada de Verificación de Código Único ---
      // Cuando integres Firebase, aquí harás una consulta a tu base de datos
      // para verificar si el código existe y si el estado es 'no usado'.
      
      await Future.delayed(const Duration(seconds: 2)); // Simular espera del servidor

      setState(() {
        _isRedeeming = false;
      });

      if (enteredCode == 'SOMOSGAMER') { // Un código de prueba simulado
        _showResultDialog('¡Éxito!', 'Has canjeado 100 diamantes. Código usado.', Colors.green);
        // En el backend real, aquí actualizas el estado del código a 'usado'.
      } else {
        _showResultDialog('Error', 'El código no es válido o ya fue utilizado.', Colors.red);
      }

      _codeController.clear();
    }
  }

  void _showResultDialog(String title, String message, Color color) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title, style: TextStyle(color: color)),
        content: Text(message),
        actions: <Widget>,
      ),
    );
  }

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Canjear Código de Regalo'),
        backgroundColor: Colors.black87,
      ),
      body: Container(
        color: Colors.black,
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>,
          ),
        ),
      ),
    );
  }
}
