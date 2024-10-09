void main() {
  var cantidadMaxima = 50;
  const int limiteDeProductos = 5;
  const double descuento = 0.50; // este es por e descuento, mitad de precio

  var productos = ["Manzana", "Naranja", "Pera", "Melón", "Sandía"];
  var precios = [10, 8, 12, 15, 20];

  Map<String, int> stock = {
    "Manzana": 32,
    "Naranja": 10,
    "Pera": 5,
    "Melón": 200,
    "Sandía": 3
  };

  Set<String> carrito = {};

  // aqui es donde se agregan productos al carrito
  int cantidad = 1;
  while (cantidad < limiteDeProductos) {
    carrito.add(productos[cantidad]);
    print("Producto agregado: ${productos[cantidad]}, Stock antes de la compra: ${stock[productos[cantidad]]}");
    cantidad++;
  }


  double total = 0; // calculamos el monto tota
  for (var producto in carrito) {
    var index = productos.indexOf(producto);
    total += precios[index];
  }


  if (total > cantidadMaxima) {
    print("¡El total supera la cantidad máxima! Aplicando descuento del 50%");
    total *= (1 - descuento);
  }

  print("Detalles de la orden:"); // detalles de la compra
  for (var producto in carrito) {
    var index = productos.indexOf(producto);
    print("Producto: $producto, Precio: \$${precios[index]}");
  }
  print("Total: \$${total.toStringAsFixed(2)}");


  for (var producto in carrito) { //aqui vamos actualizar el stok de acuerdo a lo que se vendio
    stock[producto] = stock[producto]! - 2;
  }


  print("Stock actualizado:"); // aqui en esta ya se actualizo
  stock.forEach((producto, cantidad) {
    print("$producto: $cantidad unidades restantes");
  });
}

