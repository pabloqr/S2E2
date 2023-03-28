import 'package:p2_s2e2/s2e2_modelo/TargetEstadoInstalacion.dart';

import '../s2e2_modelo/Contador.dart';
import '../s2e2_modelo/OrigenInstalacionSolar.dart';

class Controlador {
  // MODELO
  Contador _contador = Contador();
  OrigenInstalacionSolar _origenInstalacionSolar = OrigenInstalacionSolar();

  // VISTA

  Controlador() {
    this._contador =
        this._origenInstalacionSolar.getGestorFiltroSolar.getContador;
  }

  void setVista() {}

  void cambiarMomentoDia(String mD) {}

  void cambiarTiempo(String tiempo) {}

  void actualizarVista() {}
}
