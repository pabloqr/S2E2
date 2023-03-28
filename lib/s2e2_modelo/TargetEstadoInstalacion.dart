enum MomentoDia { maniana, mediodia, tarde, noche }
enum Tiempo { despejado, nuboso, nublado }

class TargetEstadoInstalacion {
  double capacidad = 10000.0; // KW
  double produccion = 10.0;   // KW/h
  double frecuencia = 10.0;   // KW/h

  MomentoDia mD = MomentoDia.maniana;
  Tiempo t = Tiempo.despejado;

  TargetEstadoInstalacion () {}
}