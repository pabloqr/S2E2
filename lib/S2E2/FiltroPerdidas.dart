
import 'TargetEstadoInstalacion.dart';
import 'FiltroSolar.dart';

class FiltroPerdidas extends FiltroSolar
{
  FiltroPerdidas()
  {

  }

  void aplicarFiltro(TargetEstadoInstalacion estadoInstalacion)
  {
    estadoInstalacion.produccion *= 0.98;
  }
}
