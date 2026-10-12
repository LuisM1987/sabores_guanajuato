import 'package:flutter/material.dart';

/// Dato informativo con icono (tiempo, porciones, calificación...).
class InfoItem extends StatelessWidget {
  final IconData icono;
  final Color color;
  final String valor;
  final String etiqueta;

  const InfoItem({
    super.key,
    required this.icono,
    required this.valor,
    required this.etiqueta,
    this.color = Colors.black87,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icono, size: 28, color: color),
        const SizedBox(height: 4),
        Text(valor, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(
          etiqueta,
          style: const TextStyle(fontSize: 12, color: Colors.black54),
        ),
      ],
    );
  }
}
