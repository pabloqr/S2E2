enum MomentoDia { Maniana, Mediodia, Tarde, Noche }
enum Tiempo { Despejado, Nuboso, Nublado }

class TargetEstadoInstalacion {
  double capacidad = 10000.0; // KW
  double produccion = 10.0;   // KW/h
  double frecuencia = 10.0;   // KW/h
  MomentoDia mD = MomentoDia.Maniana;
  Tiempo t = Tiempo.Despejado;

  TargetEstadoInstalacion () {}

/*
  EstadoInstalacion (double cap, double prod, double frec)
  {
    this.capacidad = cap;
    this.produccion = prod;
    this.frecuencia = frec;
  }
*/
}