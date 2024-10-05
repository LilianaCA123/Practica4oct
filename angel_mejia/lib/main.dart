import 'dart:math';

enum EstadoOrden {
  pendiente,
  procesada,
  entregada,
}

void producto(String nombre, int precio, int stock) {
  print('El producto $nombre tiene un precio de $precio y un stock de $stock');
}

void orden(String cliente, List<String> productos, EstadoOrden estado) {
  print(
      'La orden de $cliente con los productos ${productos.join(', ')} está $estado');
}

void calcularTotal(int cantidad) {
  int total = cantidad * 100;
  print('El total es de $total');
}

class Producto {
  String nombre;
  int precio;
  int stock;

  Producto(this.nombre, this.precio, this.stock);
}

List<Producto> productosDisponibles = [
  Producto('Laptop', 1000, 5),
  Producto('Mouse', 20, 50),
  Producto('Teclado', 50, 30),
  Producto('Monitor', 200, 15),
  Producto('Auriculares', 80, 25),
];

Set<Producto> carrito = {};

Map<Producto, int> stockProductos = {};

void main() {
  for (var producto in productosDisponibles) {
    stockProductos[producto] = producto.stock;
  }

  print('Productos disponibles:');
  for (var producto in productosDisponibles) {
    print(
        '${producto.nombre} - Precio: \$${producto.precio} - Stock: ${stockProductos[producto]}');
  }

  int limiteProductos = 5;
  List<int> seleccionesAutomaticas = [
    2,
    1,
    4,
    3,
    5
  ]; // Selecciones predefinidas

  for (int i = 0; i < limiteProductos; i++) {
    if (i < seleccionesAutomaticas.length) {
      int seleccion = seleccionesAutomaticas[i];
      Producto productoSeleccionado = productosDisponibles[seleccion - 1];

      if (stockProductos[productoSeleccionado]! > 0) {
        carrito.add(productoSeleccionado);
        stockProductos[productoSeleccionado] =
            stockProductos[productoSeleccionado]! - 1;
        print('${productoSeleccionado.nombre} agregado al carrito.');
      } else {
        print('\nLo siento, ${productoSeleccionado.nombre} está agotado.\n');
      }
    }
  }

  print('\nStock restante:');
  for (var producto in productosDisponibles) {
    print('${producto.nombre}: ${stockProductos[producto]}');
  }

  int total = sumarPrecio(carrito);
  int limiteDescuento = 500;
  double descuento = 0.1;

  if (total > limiteDescuento) {
    int descuentoAplicado = (total * descuento).round();
    total -= descuentoAplicado;
    print(
        '\nSe aplicó un descuento del ${descuento * 100}%: -\$$descuentoAplicado');
  }

  print('\nTotal final: \$$total');
}

int sumarPrecio(Set<Producto> carrito) {
  int precioTotal = 0;
  for (var producto in carrito) {
    precioTotal += producto.precio;
  }
  print('El precio total es de: \$$precioTotal');
  return precioTotal;
}

void sumarStock(Set<Producto> carrito) {
  for (var producto in carrito) {
    stockProductos[producto] = stockProductos[producto]! - 1;
  }
}
