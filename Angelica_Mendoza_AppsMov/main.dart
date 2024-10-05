void main() {
  // Variables iniciales
  var cantidad = 11;
  String? nombre = "Angie";
  nombre = null;  // Asignación de valor nulo
  var productos = ["manzana", "naranja", "pera", "pera"];
  print(productos[0]);  // Imprimir primer producto de la lista

  // Recorrer la lista de productos
  for (var producto in productos) {
    print(producto);
  }

  // Set para evitar duplicados
  Set productosSet = {"manzana", "naranja", "pera"};
  print(productosSet);  // Imprime el Set sin duplicados

  // Mapa con los detalles de los productos y sus precios
  Map detallesProductos = {
    "manzana": 10,
    "pera": 20,
    "naranja": 15
  };
  print(detallesProductos["manzana"]);  // Imprimir el precio de la manzana

  // Estructura condicional para cantidad
  if (cantidad > 0 && cantidad < 10) {
    print("La cantidad es mayor a cero");
    int miTotal = calcularTotal();
  } else if (cantidad == 10 || cantidad == 11) {
    print("La cantidad es igual a 10-11");
  } else {
    print("La cantidad es incorrecta");
  }

  // While loop para contador
  int contador = 0;
  while (contador < 5) {
    print('El contador es: $contador');
    contador++;
  }

  // Crear una orden usando funciones
  var carrito = agregarProductosAlCarrito(productosSet, detallesProductos);
  var estado = EstadoOrden.pendiente;

  // Calcular el total y mostrar detalles
  // double totalOrden = calcularTotalCarrito(carrito);
  // mostrarDetallesOrden(carrito, totalOrden, estado);
}

// Función para agregar productos al carrito
Set agregarProductosAlCarrito(Set productosSet, Map detallesProductos) {
  Set carrito = {};
  for (var producto in productosSet) {
    if (detallesProductos.containsKey(producto)) {
      carrito.add(producto);
    }
  }
  return carrito;
}

// Función para calcular el total del carrito
double calcularTotalCarrito(Set carrito) {
  Map detallesProductos = {
    "manzana": 10.0,
    "pera": 20.0,
    "naranja": 15.0
  };

  double total = 0;
  for (var producto in carrito) {
    total += detallesProductos[producto] ?? 0;
  }
  print("El total del carrito es: \$${total}");
  return total;
}

// Función para mostrar detalles de la orden
void mostrarDetallesOrden(Set carrito, double total, EstadoOrden estado) {
  print("Detalles de la orden:");
  for (var producto in carrito) {
    print("Producto: $producto");
  }
  print("Total: \$${total}");
  print("Estado de la orden: ${estado.toString().split('.').last}");
}

// Función para calcular un total de prueba
int calcularTotal() {
  int total = 100;
  print("Entro a calcular Total");
  return total;
}