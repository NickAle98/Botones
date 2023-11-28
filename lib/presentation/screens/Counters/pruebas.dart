import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PermissionScreen(),
    );
  }
}

class PermissionScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _PermissionScreenState createState() => _PermissionScreenState();
}

class _PermissionScreenState extends State<PermissionScreen> {
  @override
  void initState() {
    super.initState();
    _checkPermission();
  }

  _checkPermission() async {
    PermissionStatus status = await Permission.microphone.status;

    if (status.isGranted) {
      // El permiso ya está concedido
      print("Permiso de micrófono concedido");
    } else {
      // Solicitar el permiso
      await Permission.microphone.request();

      // Puedes verificar el estado nuevamente después de solicitar el permiso
      status = await Permission.microphone.status;
      if (status.isGranted) {
        print("Permiso de micrófono concedido");
      } else {}
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Solicitar Permiso'),
      ),
      body: const Center(
        child: Text('Verifica la consola para el estado del permiso.'),
      ),
    );
  }
}
