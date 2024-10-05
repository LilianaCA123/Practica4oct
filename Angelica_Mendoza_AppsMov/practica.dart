
enum Status {
  pendiente,
  completada,
  procesada,
}

void main() {
  var cantidad = 11;
  String? nombre= "Angie";
  nombre = null;
  var productos = ["manzana", "pera", "fresa", "fresa"];
  print(productos[0]);

  for(var producto in productos){
    print(producto);
  }

  Set productosSet = {"manzana", "naranja", "fresa, fresa"};
  print(productosSet);

  Map detallesProductos = {
    "manzana": 10,
    "pera": 20,
    "fresa": 35
  };
  print(detallesProductos["manzana"]);


  if(cantidad > 0 && cantidad <10){
    print("la cantidad es mayor a cero");
    int miTotal = calcularTotal();


  }else if(cantidad == 10 || cantidad == 11)
  {
    print("la cantidad es igual a 10-11");
  }
  else{
    print("la cantidad es incorrecta");
  }

  int contador = 0; 
  while (contador <5) {
    print('El contador es: $contador');
    contador++;
  }

  var carrito = agregarProductosAlCarrito(productosSet, detallesProductos);
  var estado = EstadoOrden.pendiente;

  double totalOrden = calcularTotalCarrito(carrito);
  mostrarDetallesOrden(carrito, totalOrden, estado);

}

class EstadoOrden {
  static var pendiente;
}

 Set agregarProductosAlCarrito(Set productosSet, Map detallesProductos){
    Set carrito = {};
    for(var producto in productosSet){
      if(detallesProductos.containsKey(producto)){
        carrito.add(producto);
      }
    }
    return carrito;
  }

  double calcularTotalCarrito(Set carrito){
    Map detallesProductos = {
      "manzana": 10,
      "pera": 20,
      "fresa": 35
    };

    double total = 0;
    for(var producto in carrito){
      total+= detallesProductos[producto] ?? 0;
    }
    print("El total del carrito es: \$${total}");
  return total;
  }

  void mostrarDetallesOrden(Set carrito, double total, EstadoOrden estado) {
  print("Detalles de la orden:");
  for (var producto in carrito) {
    print("Producto: $producto");
  }
  print("Total: \$${total}");
  print("Estado de la orden: ${estado.toString().split('.').last}");
}

int calcularTotal(){
  int total = 100;
  print("Entro a calcular Total");
  return total;
}