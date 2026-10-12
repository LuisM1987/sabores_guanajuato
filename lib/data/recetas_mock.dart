import '../models/receta.dart';

/// Categorías para los filtros de la pantalla principal.
const List<String> categoriasReceta = [
  'Todos',
  'Platillos',
  'Antojitos',
  'Postres',
  'Bebidas',
];

/// Datos ficticios (mock data) que alimentan la app.
const List<Receta> recetasMock = [
  Receta(
    id: '1',
    nombre: 'Enchiladas mineras',
    categoria: 'Platillos',
    descripcionCorta:
        'Tortillas en salsa de chile guajillo, rellenas de queso y servidas con verduras.',
    descripcion:
        'Un clásico de la cocina guanajuatense. Las tortillas se pasan por una '
        'salsa de chile guajillo, se rellenan de queso fresco y cebolla, y se '
        'sirven con papas, zanahorias, lechuga y pollo deshebrado.',
    imagenAsset: 'assets/images/enchiladas_mineras.jpg',
    tiempoMin: 45,
    porciones: 4,
    calificacion: 4.8,
    dificultad: 'Media',
    ingredientes: [
      '12 tortillas de maíz',
      '6 chiles guajillo',
      '2 dientes de ajo',
      '250 g de queso fresco',
      '1/2 cebolla picada',
      '2 papas y 2 zanahorias',
      '2 pechugas de pollo cocidas y deshebradas',
      'Lechuga y aceite al gusto',
    ],
    pasos: [
      'Desvena los chiles, hiérvelos con el ajo y lícualos con un poco de agua.',
      'Cuece las papas y las zanahorias en cubos y reserva.',
      'Pasa cada tortilla por la salsa y fríela ligeramente.',
      'Rellena con queso y cebolla y dobla las tortillas.',
      'Sirve con las verduras, el pollo y la lechuga.',
    ],
  ),
  Receta(
    id: '2',
    nombre: 'Guacamaya',
    categoria: 'Antojitos',
    descripcionCorta:
        'Torta de bolillo con chicharrón, aguacate y salsa picante con limón.',
    descripcion:
        'Un antojito muy popular en Guanajuato: un bolillo crujiente relleno de '
        'chicharrón, aguacate, cebolla y una salsa picante con mucho limón. '
        'Perfecto para compartir.',
    imagenAsset: 'assets/images/guacamaya.jpg',
    tiempoMin: 15,
    porciones: 2,
    calificacion: 4.6,
    dificultad: 'Fácil',
    ingredientes: [
      '2 bolillos',
      '150 g de chicharrón prensado',
      '1 aguacate',
      '1/4 de cebolla picada',
      'Salsa picante de chile de árbol',
      'Jugo de 2 limones',
    ],
    pasos: [
      'Abre los bolillos por la mitad y calienta un poco el pan.',
      'Rellena con el chicharrón y el aguacate en rebanadas.',
      'Agrega la cebolla picada y la salsa picante.',
      'Termina con el jugo de limón y sirve de inmediato.',
    ],
  ),
  Receta(
    id: '3',
    nombre: 'Nieve de aguacate',
    categoria: 'Postres',
    descripcionCorta:
        'Nieve cremosa inspirada en las nieves artesanales de Dolores Hidalgo.',
    descripcion:
        'Dolores Hidalgo es famoso por sus nieves de sabores sorprendentes. '
        'Esta versión de aguacate es suave, fresca y muy fácil de preparar en '
        'casa.',
    imagenAsset: 'assets/images/nieve_aguacate.jpg',
    tiempoMin: 30,
    porciones: 6,
    calificacion: 4.7,
    dificultad: 'Fácil',
    ingredientes: [
      '3 aguacates maduros',
      '1 lata de leche condensada',
      '1 lata de leche evaporada',
      'Jugo de 2 limones',
      '1 taza de crema',
    ],
    pasos: [
      'Licúa todos los ingredientes hasta obtener una mezcla tersa.',
      'Vierte en un recipiente con tapa y llévalo al congelador.',
      'Remueve cada hora durante 4 horas para que quede cremosa.',
      'Sirve en copas o conos.',
    ],
  ),
  Receta(
    id: '4',
    nombre: 'Cajeta de Celaya',
    categoria: 'Postres',
    descripcionCorta:
        'Dulce de leche de cabra cocinado lentamente hasta quedar espeso y brillante.',
    descripcion:
        'La cajeta es uno de los dulces más representativos de Guanajuato. Se '
        'prepara con leche de cabra, azúcar y vainilla, cocinados a fuego lento '
        'hasta lograr una textura espesa y un color ámbar.',
    imagenAsset: 'assets/images/cajeta_celaya.jpg',
    tiempoMin: 90,
    porciones: 8,
    calificacion: 4.9,
    dificultad: 'Media',
    ingredientes: [
      '1 litro de leche de cabra',
      '1 taza de azúcar',
      '1 rama de vainilla',
      '1/4 de cucharadita de bicarbonato',
    ],
    pasos: [
      'Disuelve el bicarbonato en un poco de leche y mezcla todo en una cazuela.',
      'Cocina a fuego bajo, moviendo con frecuencia, sin dejar de revolver.',
      'Cuando tome color ámbar y espese, retira la vainilla.',
      'Deja enfriar y guarda en un frasco.',
    ],
  ),
  Receta(
    id: '5',
    nombre: 'Fresas con crema',
    categoria: 'Postres',
    descripcionCorta:
        'El postre fresco y sencillo que se disfruta en Irapuato.',
    descripcion:
        'Fresas frescas con una crema dulce y suave. Un postre rápido que se '
        'prepara en minutos y gusta a todos.',
    imagenAsset: 'assets/images/fresas_crema.jpg',
    tiempoMin: 15,
    porciones: 4,
    calificacion: 4.5,
    dificultad: 'Fácil',
    ingredientes: [
      '500 g de fresas',
      '1 taza de crema',
      '1/2 lata de leche condensada',
      '1 cucharadita de vainilla',
    ],
    pasos: [
      'Lava, desinfecta y corta las fresas.',
      'Mezcla la crema con la leche condensada y la vainilla.',
      'Sirve las fresas en vasos y cubre con la crema.',
      'Refrigera 10 minutos antes de servir.',
    ],
  ),
  Receta(
    id: '6',
    nombre: 'Agua de jamaica',
    categoria: 'Bebidas',
    descripcionCorta:
        'Bebida refrescante de flor de jamaica, ideal para acompañar la comida.',
    descripcion:
        'Una de las aguas frescas más queridas de México. Se prepara con flor '
        'de jamaica, agua y azúcar, y se sirve bien fría con mucho hielo.',
    imagenAsset: 'assets/images/agua_jamaica.jpg',
    tiempoMin: 20,
    porciones: 6,
    calificacion: 4.4,
    dificultad: 'Fácil',
    ingredientes: [
      '1 taza de flor de jamaica',
      '2 litros de agua',
      '1/2 taza de azúcar',
      'Hielo',
    ],
    pasos: [
      'Hierve la flor de jamaica en un litro de agua durante 10 minutos.',
      'Cuela y agrega el azúcar hasta disolverla.',
      'Añade el otro litro de agua fría.',
      'Sirve con hielo.',
    ],
  ),
];
