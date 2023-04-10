import 'TargetEstadoInstalacion.dart';
import 'FiltroSolar.dart';

class FiltroProduccion extends FiltroSolar
{
  FiltroProduccion()
  {

  }

  void aplicarFiltro(TargetEstadoInstalacion estadoInstalacion)
  {
    switch (estadoInstalacion.mD) {
      case MomentoDia.maniana:
        estadoInstalacion.produccion = estadoInstalacion.capacidad;
        break;
      case MomentoDia.mediodia:
        estadoInstalacion.produccion = estadoInstalacion.capacidad * 1.1;
        break;
      case MomentoDia.tarde:
        estadoInstalacion.produccion = estadoInstalacion.capacidad * 0.85;
        break;
      case MomentoDia.noche:
        estadoInstalacion.produccion = estadoInstalacion.capacidad * 0.05;
        break;
      default:
        throw new AssertionError("MomentoDia desconocido");
    }

    switch (estadoInstalacion.t) {
      case Tiempo.despejado:
        estadoInstalacion.produccion = estadoInstalacion.produccion * 1.1;
        break;
      case Tiempo.nuboso:
        estadoInstalacion.produccion = estadoInstalacion.produccion * 0.7;
        break;
      case Tiempo.nublado:
        estadoInstalacion.produccion = estadoInstalacion.produccion * 0.5;
        break;
      default:
        throw new AssertionError("Tiempo Desconocido");
    }
  }
}
