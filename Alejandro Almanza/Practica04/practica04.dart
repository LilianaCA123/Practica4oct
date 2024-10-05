// Constante para aplicar un descuento si se supera el precio máximo de la orden
const double porcentajeDescuento = 0.15;
// Límite de productos que se pueden agregar al carrito
const int maximoProductosCarrito = 4;
// Precio máximo para aplicar el descuento
double totalMaximoPermitido = 1000.0;

// Lista que contiene el inventario de productos con su nombre, precio y stock
List<Map<String, dynamic>> listaInventario = [
  {'nombre': 'Tablet', 'precio': 1200.0, 'stock': 6},
  {'nombre': 'Smartphone', 'precio': 750.0, 'stock': 8},
  {'nombre': 'Auriculares', 'precio': 200.0, 'stock': 12},
  {'nombre': 'Cargador', 'precio': 30.0, 'stock': 15}
];

// Mapa para llevar el control del stock disponible de cada producto
Map<String, int> controlStock = {
  'Tablet': 6,
  'Smartphone': 8,
  'Auriculares': 12,
  'Cargador': 15
};

// Clase Producto que define el nombre y el precio del producto
class Producto {
  String nombre;
  double precio;

  Producto(this.nombre, this.precio);
}

// Clase Orden que contiene los productos en el carrito, su estado y una nota opcional
class Orden {
  Map<Producto, int> carritoProductos;
  String estadoOrden;
  String? notaOrden;

  Orden({required this.carritoProductos, required this.estadoOrden, this.notaOrden});

  // Función para calcular el total de la orden, aplicando descuento si es necesario
  double calcularTotalOrden() {
    double totalOrden = 0;
    carritoProductos.forEach((producto, cantidad) {
      totalOrden += producto.precio * cantidad;
    });

    // Aplicar descuento si el total de la orden supera el límite
    if (totalOrden > totalMaximoPermitido) {
      totalOrden -= totalOrden * porcentajeDescuento;
    }

    return totalOrden;
  }

  // Función para mostrar los detalles de la orden
  void mostrarDetallesOrden() {
    print('Detalles de la Orden:');
    carritoProductos.forEach((producto, cantidad) {
      print('Producto: ${producto.nombre}, Precio: \$${producto.precio}, Cantidad: $cantidad');
    });
    print('Total de la orden: \$${calcularTotalOrden().toStringAsFixed(2)}');
    print('Estado de la orden: $estadoOrden');

    if (notaOrden != null) {
      print('Nota: $notaOrden');
    }
  }
}

// Función para mostrar el inventario actual
void mostrarInventarioActual() {
  print('Inventario disponible:');
  for (var producto in listaInventario) {
    print('${producto['nombre']}: Stock disponible: ${producto['stock']}');
  }
}

// Función para actualizar el stock del inventario después de una compra
void actualizarStockInventario(String nombreProducto, int cantidadComprada) {
  for (var producto in listaInventario) {
    if (producto['nombre'] == nombreProducto) {
      producto['stock'] -= cantidadComprada;
      break;
    }
  }
}

void main() {
  // Mostrar el inventario antes de la compra
  mostrarInventarioActual();

  // Carrito de productos, inicialmente vacío
  Map<Producto, int> carritoCompras = {};

  int i = 0;
  // Llenar el carrito hasta el límite de productos o hasta recorrer el inventario
  while (carritoCompras.length < maximoProductosCarrito && i < listaInventario.length) {
    var productoActual = listaInventario[i];
    String nombreProducto = productoActual['nombre'];
    int stockDisponible = controlStock[nombreProducto]!;

    // Verificar si hay stock disponible del producto
    if (stockDisponible > 0) {
      Producto productoCarrito = Producto(nombreProducto, productoActual['precio']);

      // Si el producto ya está en el carrito, se aumenta la cantidad
      if (carritoCompras.containsKey(productoCarrito)) {
        carritoCompras[productoCarrito] = carritoCompras[productoCarrito]! + 1;
      } else {
        carritoCompras[productoCarrito] = 1;
      }

      // Actualizar el stock en el controlStock
      controlStock[nombreProducto] = stockDisponible - 1;

      // Actualizar el stock en el inventario
      actualizarStockInventario(nombreProducto, 1);
    }
    i++;
  }

  // Crear la orden con los productos seleccionados
  Orden nuevaOrden = Orden(
      carritoProductos: carritoCompras,
      estadoOrden: "En proceso",
      notaOrden: "Entregar antes del lunes."
  );

  // Mostrar los detalles de la orden
  nuevaOrden.mostrarDetallesOrden();

  print('\nInventario después de la compra:');
  // Mostrar el inventario después de la compra
  mostrarInventarioActual();
}
