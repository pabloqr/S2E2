import 'TargetEstadoInstalacion.dart';

class Contador {
  Contador () {}

  void ejecutar (TargetEstadoInstalacion estadoInstalacion)
  {
    print("Producción: " + estadoInstalacion.produccion.toString());
    print("Frecuencia: " + estadoInstalacion.frecuencia.toString());
  }
}