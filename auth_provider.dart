import 'package:flutter/material.dart';

// Esta clase manejará el estado de la autenticación
class AuthProvider with ChangeNotifier {
  // Variable booleana para saber si el usuario está autenticado
  bool _isAuthenticated = false;
  String? _userName; // Nombre de usuario opcional

  bool get isAuthenticated => _isAuthenticated;
  String? get userName => _userName;

  // Método para simular el inicio de sesión
  void login(String username) {
    _isAuthenticated = true;
    _userName = username;
    // Notifica a todos los widgets que escuchan que el estado ha cambiado
    notifyListeners(); 
  }

  // Método para simular el cierre de sesión
  void logout() {
    _isAuthenticated = false;
    _userName = null;
    // Notifica a todos los widgets que escuchan que el estado ha cambiado
    notifyListeners();
  }
}
