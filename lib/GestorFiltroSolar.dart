import 'Contador.dart';
import 'TargetEstadoInstalacion.dart';

class GestorFiltroSolar {
  CadenaFiltroSolar _cadenaFiltroSolar = CadenaFiltroSolar ();
  Contador _contador = Contador ();

  GestorFiltroSolar () {}

  void aplicarFiltros (TargetEstadoInstalacion estadoInstalacion)
  {
    _cadenaFiltroSolar.aplicarFiltros (estadoInstalacion);
  }

  void aniadirFiltro (TargetEstadoInstalacion filtro)
  {
    _cadenaFiltroSolar.aniadirFiltro (filtro);
  }

  void quitarFiltro (TargetEstadoInstalacion filtro)
  {
    _cadenaFiltroSolar.quitarFiltro (filtro);
  }
}