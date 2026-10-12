/// Modelo de datos de una receta.
class Receta {
  final String id;
  final String nombre;
  final String categoria;
  final String descripcionCorta;
  final String descripcion;
  final String imagenAsset;
  final int tiempoMin;
  final int porciones;
  final double calificacion;
  final String dificultad;
  final List<String> ingredientes;
  final List<String> pasos;

  const Receta({
    required this.id,
    required this.nombre,
    required this.categoria,
    required this.descripcionCorta,
    required this.descripcion,
    required this.imagenAsset,
    required this.tiempoMin,
    required this.porciones,
    required this.calificacion,
    required this.dificultad,
    required this.ingredientes,
    required this.pasos,
  });
}
