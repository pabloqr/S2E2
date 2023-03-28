import 'package:flutter/material.dart';

import 's2e2_vista/main_page.dart';

void main()
{
  runApp (const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp
    (
      title: "S2E2",
      theme: ThemeData (primarySwatch: Colors.blueGrey),
      home: MainPage (titulo: "Instalación Solar",),
    );
  }
}
