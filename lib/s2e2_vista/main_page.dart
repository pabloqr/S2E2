import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:p2_s2e2/s2e2_controlador/Controlador.dart';

const List<String> opcionesTiempo = <String>["Despejado", "Nuboso", "Nublado"];

class MainPage extends StatefulWidget {
  final String titulo;

  MainPage({super.key, required this.titulo});

  @override
  State<StatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Controlador controlador = Controlador();

  double _produccion = 0;
  double _frecuencia = 0;

  String _tiempoDia = opcionesTiempo.first;
  Time _horaDia = Time(hour: 12, minute: 0);

  @override
  Widget build(BuildContext context) {
    List l = controlador.actualizar(_horaDia, _tiempoDia);
    _produccion = l[0];
    _frecuencia = l[1];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.titulo,
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr,
        ),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
          child: Text(
            "Producción: $_produccion",
            textDirection: TextDirection.ltr,
          ),
        ),
        Center(
          child: Text(
            "Frecuencia: $_frecuencia",
            textDirection: TextDirection.ltr,
          ),
        ),
        Center(
          child: TextButton(
            onPressed: () {
              Navigator.of(context).push(
                showPicker(
                  context: context,
                  value: _horaDia,
                  onChange: (Time t) {
                    setState(() {
                      _horaDia = t;
                      List l = controlador.actualizar(_horaDia, _tiempoDia);
                      _produccion = l[0];
                      _frecuencia = l[1];
                    });
                  },
                  is24HrFormat: true,
                ),
              );
            },
            child: Text(
              "Selector de tiempo",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        DropdownButton(
            items: _getDropDownItems(opcionesTiempo),
            value: _tiempoDia,
            onChanged: (String? newValue) {
              setState(() {
                _tiempoDia = newValue!;
                List l = controlador.actualizar(_horaDia, _tiempoDia);
                _produccion = l[0];
                _frecuencia = l[1];
              });
            })
      ]),
    );
  }

  List<DropdownMenuItem<String>> _getDropDownItems(List<String> listaOpciones) {
    List<DropdownMenuItem<String>> menuItems = <DropdownMenuItem<String>>[];

    for (int i = 0; i < listaOpciones.length; ++i) {
      print(listaOpciones[i]);
      menuItems.add(DropdownMenuItem(
        child: Text(listaOpciones[i]),
        value: listaOpciones[i],
      ));
    }

    return menuItems;
  }
}
