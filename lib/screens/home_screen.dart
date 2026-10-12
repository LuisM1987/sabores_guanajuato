import 'package:flutter/material.dart';

import '../data/recetas_mock.dart';
import '../models/receta.dart';
import '../theme/app_theme.dart';
import '../widgets/receta_card.dart';
import 'detalle_screen.dart';

/// Pantalla principal: búsqueda, categorías y lista de recetas.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _busqueda = '';
  String _categoria = 'Todos';
  final Set<String> _favoritos = {};

  /// Recetas que cumplen la categoría elegida y el texto de búsqueda.
  List<Receta> get _filtradas {
    final q = _busqueda.trim().toLowerCase();
    return recetasMock.where((r) {
      final coincideCategoria = _categoria == 'Todos' || r.categoria == _categoria;
      final coincideTexto = q.isEmpty ||
          r.nombre.toLowerCase().contains(q) ||
          r.descripcionCorta.toLowerCase().contains(q);
      return coincideCategoria && coincideTexto;
    }).toList();
  }

  void _abrirDetalle(Receta receta) {
    // Se pasa el objeto completo a la pantalla de detalle por el constructor.
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => DetalleScreen(
          receta: receta,
          esFavoritoInicial: _favoritos.contains(receta.id),
          onFavoritoCambio: (esFavorito) {
            setState(() {
              if (esFavorito) {
                _favoritos.add(receta.id);
              } else {
                _favoritos.remove(receta.id);
              }
            });
          },
        ),
      ),
    );
  }

  void _mostrarPerfil() {
    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Mi perfil'),
        content: Text('Recetas favoritas: ${_favoritos.length}'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Cerrar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final recetas = _filtradas;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sabores de Guanajuato'),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle_outlined),
            tooltip: 'Perfil',
            onPressed: _mostrarPerfil,
          ),
        ],
      ),
      body: Column(
        children: [
          // Barra de búsqueda funcional.
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: TextField(
              onChanged: (texto) => setState(() => _busqueda = texto),
              decoration: InputDecoration(
                hintText: 'Buscar receta...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // Categorías (chips).
          SizedBox(
            height: 48,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              itemCount: categoriasReceta.length,
              separatorBuilder: (context, index) => const SizedBox(width: 8),
              itemBuilder: (context, i) {
                final categoria = categoriasReceta[i];
                final seleccionada = categoria == _categoria;
                return FilterChip(
                  label: Text(categoria),
                  selected: seleccionada,
                  showCheckmark: false,
                  selectedColor: AppTheme.primario,
                  backgroundColor: Colors.white,
                  labelStyle: TextStyle(
                    color: seleccionada ? Colors.white : Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                  onSelected: (_) => setState(() => _categoria = categoria),
                );
              },
            ),
          ),

          // Lista dinámica de tarjetas.
          Expanded(
            child: recetas.isEmpty
                ? const Center(child: Text('No encontramos recetas'))
                : ListView.builder(
                    padding: const EdgeInsets.only(bottom: 16),
                    itemCount: recetas.length,
                    itemBuilder: (context, i) {
                      final receta = recetas[i];
                      return RecetaCard(
                        receta: receta,
                        esFavorito: _favoritos.contains(receta.id),
                        onTap: () => _abrirDetalle(receta),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
