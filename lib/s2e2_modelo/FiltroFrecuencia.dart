import 'FiltroSolar.dart';
import 'TargetEstadoInstalacion.dart';

class FiltroFrecuencia extends FiltroSolar {
  FiltroFrecuencia() {

  }

  void aplicarFiltro(TargetEstadoInstalacion estadoInstalacion) {
    if (estadoInstalacion.produccion >= estadoInstalacion.capacidad * 0.6)
    {
      estadoInstalacion.produccion *= 0.975;
      estadoInstalacion.frecuencia = 60;
    }
    else
    {
      estadoInstalacion.produccion *= 0.9;
      estadoInstalacion.frecuencia =
          60 * (estadoInstalacion.produccion / estadoInstalacion.capacidad);
    }
  }
}
