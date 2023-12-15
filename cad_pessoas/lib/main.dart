import 'package:cad_pessoas/pages/home.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      home: Home(),
      theme: ThemeData(useMaterial3: false),
    ),
  );
}
