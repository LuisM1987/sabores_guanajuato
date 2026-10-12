import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../models/receta.dart';
import '../theme/app_theme.dart';
import '../widgets/info_item.dart';

/// Pantalla de detalle de una receta.
class DetalleScreen extends StatefulWidget {
  final Receta receta;
  final bool esFavoritoInicial;
  final ValueChanged<bool> onFavoritoCambio;

  const DetalleScreen({
    super.key,
    required this.receta,
    required this.esFavoritoInicial,
    required this.onFavoritoCambio,
  });

  @override
  State<DetalleScreen> createState() => _DetalleScreenState();
}

class _DetalleScreenState extends State<DetalleScreen> {
  late bool _esFavorito;

  @override
  void initState() {
    super.initState();
    _esFavorito = widget.esFavoritoInicial;
  }

  void _alternarFavorito() {
    setState(() => _esFavorito = !_esFavorito);
    widget.onFavoritoCambio(_esFavorito);
  }

  Future<void> _compartir() async {
    final r = widget.receta;
    final texto = StringBuffer()
      ..writeln(r.nombre)
      ..writeln()
      ..writeln('Ingredientes:');
    for (final ingrediente in r.ingredientes) {
      texto.writeln('- $ingrediente');
    }
    texto
      ..writeln()
      ..writeln('Preparación:');
    for (var i = 0; i < r.pasos.length; i++) {
      texto.writeln('${i + 1}. ${r.pasos[i]}');
    }

    await Clipboard.setData(ClipboardData(text: texto.toString()));
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Receta copiada al portapapeles')),
    );
  }

  Widget _titulo(String texto) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 8),
      child: Text(
        texto,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppTheme.primario,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final r = widget.receta;

    return Scaffold(
      appBar: AppBar(title: Text(r.nombre)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen destacada con Hero y esquinas redondeadas.
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Hero(
                tag: 'receta-${r.id}',
                child: Image.asset(
                  r.imagenAsset,
                  height: 240,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 240,
                    color: Colors.grey.shade300,
                    child: const Icon(Icons.image_not_supported),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              r.nombre,
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(r.categoria, style: const TextStyle(color: Colors.black54)),
            const SizedBox(height: 16),

            // Iconos informativos.
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InfoItem(
                  icono: Icons.schedule,
                  valor: '${r.tiempoMin} min',
                  etiqueta: 'Tiempo',
                ),
                InfoItem(
                  icono: Icons.people,
                  valor: '${r.porciones}',
                  etiqueta: 'Porciones',
                ),
                InfoItem(
                  icono: Icons.star,
                  color: Colors.amber,
                  valor: '${r.calificacion}',
                  etiqueta: 'Calificación',
                ),
                InfoItem(
                  icono: Icons.speed,
                  valor: r.dificultad,
                  etiqueta: 'Dificultad',
                ),
              ],
            ),

            _titulo('Descripción'),
            Text(r.descripcion, style: const TextStyle(fontSize: 16, height: 1.4)),

            _titulo('Ingredientes'),
            for (final ingrediente in r.ingredientes)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.check_circle_outline,
                      size: 20,
                      color: AppTheme.primario,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(ingrediente,
                          style: const TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
              ),

            _titulo('Preparación'),
            for (var i = 0; i < r.pasos.length; i++)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: AppTheme.primario,
                      child: Text(
                        '${i + 1}',
                        style: const TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(r.pasos[i],
                          style: const TextStyle(fontSize: 16, height: 1.3)),
                    ),
                  ],
                ),
              ),

            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: FilledButton.icon(
                    onPressed: _alternarFavorito,
                    icon: Icon(
                      _esFavorito ? Icons.favorite : Icons.favorite_border,
                    ),
                    label: Text(_esFavorito ? 'En favoritos' : 'Favorito'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: _compartir,
                    icon: const Icon(Icons.share),
                    label: const Text('Compartir'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
