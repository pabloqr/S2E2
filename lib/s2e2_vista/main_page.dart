import 'package:flutter/material.dart';

const List<String> opcionesMD = <String> [ "Despejado", "Nuboso", "Nublado" ];

class MainPage extends StatefulWidget {
  final String titulo;

  MainPage ({super.key, required this.titulo});

  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  double _produccion = 0;
  double _frecuencia = 0;

  String _momento = opcionesMD.first;
  String _tiempo = "";

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
        mainAxisAlignment: MainAxisAlignment.center,
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
        DropdownButton
        (
          items: _getDropDownItems (opcionesMD),
          value: _momento,
          onChanged: (String? newValue) {
            setState(() {
              _momento = newValue!;
            });
          }
        )]
      ),
    );
  }

  List<DropdownMenuItem<String>> _getDropDownItems (List<String> listaOpciones)
  {
    List<DropdownMenuItem<String>> menuItems = <DropdownMenuItem<String>> [];

    for (int i = 0; i < listaOpciones.length; ++i) {

      print (listaOpciones[i]);
      menuItems.add (DropdownMenuItem (child: Text (listaOpciones[i]), value: listaOpciones[i],));
    }

    return menuItems;
  }
}