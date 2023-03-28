import 'Contador.dart';
import 'CadenaFiltroSolar.dart';
import 'FiltroSolar.dart';
import 'TargetEstadoInstalacion.dart';

class GestorFiltroSolar {
  CadenaFiltroSolar _cadenaFiltroSolar = CadenaFiltroSolar();
  Contador _contador = Contador();

  GestorFiltroSolar() {}

  void aplicarFiltros(TargetEstadoInstalacion estadoInstalacion) {
    _cadenaFiltroSolar.aplicarFiltros(estadoInstalacion);
    _contador.ejecutar(estadoInstalacion);
  }

  void aniadirFiltro(FiltroSolar filtro) {
    _cadenaFiltroSolar.aniadirFiltro(filtro);
  }

  void quitarFiltro(FiltroSolar filtro) {
    _cadenaFiltroSolar.quitarFiltro(filtro);
  }

  Contador get getContador => _contador;
}
