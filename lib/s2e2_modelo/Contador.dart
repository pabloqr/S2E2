import 'TargetEstadoInstalacion.dart';

class Contador {
  double frecuencia = 0;
  double produccion = 0;

  Contador() {}

  void ejecutar(TargetEstadoInstalacion estadoInstalacion) {
    produccion = estadoInstalacion.produccion;
    frecuencia = estadoInstalacion.frecuencia;

    print("Producción: " + estadoInstalacion.produccion.toString());
    print("Frecuencia: " + estadoInstalacion.frecuencia.toString());
  }
}
