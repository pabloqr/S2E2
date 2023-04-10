import 'TargetEstadoInstalacion.dart';
import 'FiltroSolar.dart';

class CadenaFiltroSolar
{
  List<FiltroSolar> _filtros = [];

  CadenaFiltroSolar()
  {

  }

  void aplicarFiltros(TargetEstadoInstalacion estadoInstalacion)
  {
    for(var filtro in _filtros)
      {
        filtro.aplicarFiltro(estadoInstalacion);
      }
  }

  void aniadirFiltro(FiltroSolar filtro)
  {
    _filtros.add(filtro);
  }

  void quitarFiltro(FiltroSolar filtro)
  {
    _filtros.remove(filtro);
  }
}
