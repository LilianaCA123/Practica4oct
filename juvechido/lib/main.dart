const int limiteDeProductos = 5;
double cantidadMaxima = 500.0;

List<Map<String, dynamic>> inventario = [
  {'nombre': 'Laptop', 'precio': 800.0},
  {'nombre': 'Celular', 'precio': 500.0},
  {'nombre': 'Teclado', 'precio': 50.0},
  {'nombre': 'Monitor', 'precio': 300.0}
];

double calcularTotalOrden(Map<String, int> carrito) {
  double total = 0;

  carrito.forEach((nombreProducto, cantidad) {
    var producto = inventario.firstWhere((item) => item['nombre'] == nombreProducto);
    total += producto['precio'] * cantidad;
  });

  return total;
}

void mostrarDetallesOrden(Map<String, int> carrito, String estado, String? nota) {
  print('Detalles de la Orden:');
  carrito.forEach((nombreProducto, cantidad) {
    var producto = inventario.firstWhere((item) => item['nombre'] == nombreProducto);
    print('Producto: ${producto['nombre']}, Precio: \$${producto['precio']}, Cantidad: $cantidad');
  });

  print('Total: \$${calcularTotalOrden(carrito).toStringAsFixed(2)}');
  print('Estado de la orden: $estado');

  if (nota != null) {
    print('Nota: $nota');
  }
}

void main() {
  Map<String, int> carrito = {
    'Laptop': 1,
    'Celular': 2
  };

  String estado = 'Pendiente';
  String? nota = 'Por favor, entregar antes del viernes.';

  mostrarDetallesOrden(carrito, estado, nota);
}
