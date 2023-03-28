
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
      case MomentoDia.Maniana:
        estadoInstalacion.produccion = estadoInstalacion.capacidad;
        break;
      case MomentoDia.Mediodia:
        estadoInstalacion.produccion = estadoInstalacion.capacidad * 1.1;
        break;
      case MomentoDia.Tarde:
        estadoInstalacion.produccion = estadoInstalacion.capacidad * 0.85;
        break;
      case MomentoDia.Noche:
        estadoInstalacion.produccion = estadoInstalacion.capacidad * 0.05;
        break;
      default:
        throw new AssertionError("MomentoDia desconocido");
    }

    switch (estadoInstalacion.t) {
      case Tiempo.Despejado:
        estadoInstalacion.produccion = estadoInstalacion.produccion * 1.1;
        break;
      case Tiempo.Nuboso:
        estadoInstalacion.produccion = estadoInstalacion.produccion * 0.7;
        break;
      case Tiempo.Nublado:
        estadoInstalacion.produccion = estadoInstalacion.produccion * 0.5;
        break;
      default:
        throw new AssertionError("Tiempo Desconocido");
    }
  }
}
