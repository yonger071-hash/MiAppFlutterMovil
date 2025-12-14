import 'package:flutter/material.dart';

class RechargeScreen extends StatefulWidget {
  const RechargeScreen({super.key});

  @override
  State<RechargeScreen> createState() => _RechargeScreenState();
}

class _RechargeScreenState extends State<RechargeScreen> {
  final _formKey = GlobalKey<FormState>();
  final _userIdController = TextEditingController();
  bool _isSending = false;

  void _submitRechargeRequest() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSending = true;
      });

      // Simulación del envío del pedido y comprobante a tu "backend" (base de datos)
      await Future.delayed(const Duration(seconds: 3));

      setState(() {
        _isSending = false;
      });

      // Mostrar mensaje de éxito
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Pedido enviado. Validando comprobante manualmente...'),
          backgroundColor: Color(0xFF39FF14),
        ),
      );

      // Limpiar campo de texto
      _userIdController.clear();
    }
  }

  @override
  void dispose() {
    _userIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Solicitar Recarga Manual'),
        backgroundColor: Colors.black87,
      ),
      body: Container(
        color: Colors.black,
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>,
          ),
        ),
      ),
    );
  }
}
