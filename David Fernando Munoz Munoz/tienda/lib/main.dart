import 'dart:collection';

enum EstadoOrden { pendiente, procesada, entregada }

class Producto {
  String nombre;
  double precio;
  Producto(this.nombre, this.precio);
  String toString() => '$nombre (\$${precio.toStringAsFixed(2)})';
}

void main() {
  List<Producto> inventario = [
    Producto('Manzana', 12),
    Producto('Naranja', 15),
    Producto('Pera', 18),
  ];
  HashMap<Producto, int> stock = HashMap<Producto, int>.from({
    inventario[0]: 5,
    inventario[1]: 3,
    inventario[2]: 2,
  });

  HashSet<Producto> carrito = HashSet<Producto>();
  double cantidadMaxima = 40.0;
  const double descuento = 0.50;

  List<Producto> productosSeleccionados = [
    inventario[0],
    inventario[1],
    inventario[2],
  ];

  for (var producto in productosSeleccionados) {
    if (stock[producto]! > 0) {
      carrito.add(producto);
      stock[producto] = stock[producto]! - 1;
    }
  }

  double total = carrito.fold(0.0, (sum, producto) => sum + producto.precio);
  double totalFinal = total > cantidadMaxima ? total * (1 - descuento) : total;

  print('Estado de la Orden: ${EstadoOrden.pendiente}');
  print('Productos en el carrito: ${carrito.map((p) => p.toString()).join(', ')}');
  print('Total: \$${total.toStringAsFixed(2)}');
  print('Total final: \$${totalFinal.toStringAsFixed(2)}');
}
