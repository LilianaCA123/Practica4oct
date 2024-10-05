void main() {
  Set EstadoOrdenSet = {"pendiente", "procesada", "entregada"};
  Set listaProductos = {"Cereal", "Refrescos", "Queso", "Desechables"};
  Set notasProductos = {"El producto llegará pronto", "El producto llegará el día de mañana"};

  Map precioProducto = {
    "Cereal": 40,
    "Refrescos": 20,
    "Queso": 35,
    "Desechables": 50,
  };

  Map estadoProductos = {
    "Cereal": "pendiente",
    "Refrescos": "procesada",
    "Queso": "procesada",
    "Desechables": "pendiente",
  };

  Map productosNotas = {
    "Refrescos": "El producto llegará pronto",
    "Queso": "El producto llegará el día de mañana",
  };

  var cantidadMaxima = 200;
  const double descuento = 0.10;
  const int limiteDeProductos = 10;

  calcularTotalYMostrarDetalles(listaProductos, precioProducto, productosNotas, cantidadMaxima, descuento, limiteDeProductos);
}

void calcularTotalYMostrarDetalles(Set listaProductos, Map precioProducto, Map productosNotas, int cantidadMaxima, double descuento, int limiteDeProductos) {
  int total = 0;

  for (var producto in listaProductos) {
    var precio = precioProducto[producto];
    total += (precio as int);

    var nota = productosNotas[producto] ?? "Sin nota";

    print("Producto: $producto");
    print("Precio: $precio");
    print("Nota: $nota");
  }

  if (total > cantidadMaxima) {
    print("El total excede la cantidad máxima permitida de $cantidadMaxima");
  }

  if (listaProductos.length > limiteDeProductos) {
    print("Se aplica un descuento del 10%");
    total = (total * (1 - descuento)).toInt();
  }

  print("El precio total es de: $total");
}
