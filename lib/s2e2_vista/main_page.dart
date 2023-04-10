import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:flutter/material.dart';
import '../s2e2_controlador/Controlador.dart';

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

    String prodStr = _produccion.toStringAsFixed (4);
    String frecStr = _frecuencia.toStringAsFixed (2);

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
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              child: const Text(
                "Producción: ",
                textDirection: TextDirection.ltr,
                textScaleFactor: 2.0,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                border: Border.all(
                  color: const Color.fromARGB(255, 67, 87, 97),
                  width: 3.0,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(3.0),
              ),
              child: Text(
                prodStr,
                textDirection: TextDirection.ltr,
                textScaleFactor: 2.0,
                style: const TextStyle(color: Colors.white),
              ),
            )
          ],),
        ),
        const Center (child: SizedBox(height: 10.0,),),
        Center(
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              child: const Text(
                "Frecuencia: ",
                textDirection: TextDirection.ltr,
                textScaleFactor: 2.0,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                border: Border.all(
                  color: const Color.fromARGB(255, 67, 87, 97),
                  width: 3.0,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(3.0),
              ),
              child: Text(
                frecStr,
                textDirection: TextDirection.ltr,
                textScaleFactor: 2.0,
                style: const TextStyle(color: Colors.white),
              ),
            )
          ],),
        ),
        const SizedBox(height: 80.0,),
        Center(
          child: OutlinedButton(
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
            child: const Text(
              "Selector de hora",
              style: TextStyle(
                inherit: false,
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Center(
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text(
              "Selector de tiempo:    ",
              style: TextStyle(
                inherit: false,
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            DropdownButton(
              items: _getDropDownItems(opcionesTiempo),
              value: _tiempoDia,
              style: const TextStyle(
                inherit: false,
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  _tiempoDia = newValue!;
                  List l = controlador.actualizar(_horaDia, _tiempoDia);
                  _produccion = l[0];
                  _frecuencia = l[1];
                });
            })
          ],),
        ),
      ]),
    );
  }

  List<DropdownMenuItem<String>> _getDropDownItems(List<String> listaOpciones) {
    List<DropdownMenuItem<String>> menuItems = <DropdownMenuItem<String>>[];

    for (int i = 0; i < listaOpciones.length; ++i) {
      print(listaOpciones[i]);
      menuItems.add(DropdownMenuItem(
        value: listaOpciones[i],
        child: Text(listaOpciones[i]),
      ));
    }

    return menuItems;
  }
}
