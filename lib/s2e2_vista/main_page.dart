import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  final String titulo;

  MainPage ({super.key, required this.titulo});

  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  double _produccion = 0;
  double _frecuencia = 0;

  @override
  Widget build (BuildContext context) 
  {
    return Scaffold
    (
      appBar: AppBar
      (
        title: Text
        (
          widget.titulo,
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr,
        ),
      ),
      body: Column
      (
        children: [Center
        (
          child: Text
          (
            "Producción: $_produccion",
            textDirection: TextDirection.ltr,
          ),
        ),
        Center
        (
          child: Text
          (
            "Frecuencia: $_frecuencia",
            textDirection: TextDirection.ltr,
          ),
        ),
        //DropdownButton
        //(
          //items: items,
          //onChanged: onChanged
        //)
        ]
      ),
    );
  }
}