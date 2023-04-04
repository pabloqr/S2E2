import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:p2_s2e2/s2e2_modelo/TargetEstadoInstalacion.dart';

import '../s2e2_modelo/Contador.dart';
import '../s2e2_modelo/OrigenInstalacionSolar.dart';

class Controlador {
  // MODELO
  Contador _contador = Contador();
  OrigenInstalacionSolar _origenInstalacionSolar = OrigenInstalacionSolar();

  Controlador() {
    this._contador =
        this._origenInstalacionSolar.getGestorFiltroSolar.getContador;
  }

  List actualizar(Time horaDia, String tiempoDia) {
    Tiempo tiempoDiaParsed = Tiempo.despejado;
    MomentoDia momentoDiaParsed = MomentoDia.maniana;

    if (horaDia.hour > 12)
      momentoDiaParsed = MomentoDia.mediodia;
    else if (horaDia.hour > 15)
      momentoDiaParsed = MomentoDia.tarde;
    else if (horaDia.hour > 19 || horaDia.hour < 7)
      momentoDiaParsed = MomentoDia.noche;

    switch (tiempoDia) {
      case "Despejado":
        tiempoDiaParsed = Tiempo.despejado;
        break;
      case "Nuboso":
        tiempoDiaParsed = Tiempo.nuboso;
        break;
      case "Nublado":
        tiempoDiaParsed = Tiempo.nublado;
        break;
    }

    _origenInstalacionSolar.estadoInstalacion.t = tiempoDiaParsed;
    _origenInstalacionSolar.estadoInstalacion.mD = momentoDiaParsed;

    _origenInstalacionSolar.actualizar();

    return [_contador.produccion, _contador.frecuencia];
  }

  void cambiarMomentoDia(String mD) {}

  void cambiarTiempo(String tiempo) {}
}
