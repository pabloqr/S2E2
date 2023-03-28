import 'FiltroFrecuencia.dart';
import 'FiltroPerdidas.dart';
import 'FiltroProduccion.dart';
import 'TargetEstadoInstalacion.dart';
import 'GestorFiltroSolar.dart';

class OrigenInstalacionSolar {
  TargetEstadoInstalacion _estadoInstalacion = TargetEstadoInstalacion ();
  GestorFiltroSolar _gestorFiltroSolar = GestorFiltroSolar();

  OrigenInstalacionSolar () {
    _gestorFiltroSolar.aniadirFiltro(FiltroProduccion());
    _gestorFiltroSolar.aniadirFiltro(FiltroPerdidas());
    _gestorFiltroSolar.aniadirFiltro(FiltroFrecuencia());
  }

  void actualizar()
  {
    _gestorFiltroSolar.aplicarFiltros(_estadoInstalacion);
  }

  TargetEstadoInstalacion get getEstadoInstalacion => _estadoInstalacion;
}