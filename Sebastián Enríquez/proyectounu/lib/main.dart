
enum EstadoOrden {
  pendiente,
  procesada,
  entregada
}

void mostrarEstadosOrden() {
  print('Lista de Estados de Orden:');
  EstadoOrden.values.forEach((estado) {
    print(estado.toString().split('.').last);
  });
}


Map<String, dynamic> crearProducto(String nombre, double precio) {
  print('Creando producto: $nombre, Precio: \$${precio}');
  return {
    'nombre': nombre,
    'precio': precio
  };
}

Map<String, dynamic> crearOrden(List<Map<String, dynamic>> productos, EstadoOrden estado, {String? nota}) {
  print('Creando orden con ${productos.length} productos, Estado: ${estado.toString().split('.').last}, Nota: ${nota ?? 'Ninguna'}');
  return {
    'productos': productos,
    'estado': estado,
    'nota': nota
  };
}


double calcularTotalOrden(Map<String, dynamic> orden) {
  double total = 0;
  for (var producto in orden['productos']) {
    total += producto['precio'];
  }
  print('Total calculado: \$${total}');
  return total;
}


void mostrarDetallesOrden(Map<String, dynamic> orden) {
  print('Detalles de la Orden:');
  for (var producto in orden['productos']) {
    print('Producto: ${producto['nombre']}, Precio: \$${producto['precio']}');
  }
  print('Total: \$${calcularTotalOrden(orden)}');
  if (orden['nota'] != null) {
    print('Nota: ${orden['nota']}');
  }
  print('Estado: ${orden['estado'].toString().split('.').last}');
}


int cantidadMaxima = 1000;
const int descuento = 10;
const int limiteDeProductos = 15;

void mostrarVariablesYConstantes() {
  print('Variable cantidadMaxima: \$${cantidadMaxima}');
  print('Constante descuento: ${descuento * 100}%');
  print('Constante limiteDeProductos: $limiteDeProductos productos');
}

void main() {

  mostrarEstadosOrden();

  var producto1 = crearProducto('Laptop', 500.0);
  var producto2 = crearProducto('Mouse', 50.0);

  var orden = crearOrden([producto1, producto2], EstadoOrden.pendiente, nota: 'Entregar en oficina');


  mostrarDetallesOrden(orden);

  mostrarVariablesYConstantes();

  if (calcularTotalOrden(orden) > cantidadMaxima) {
    print('El total excede la cantidad máxima permitida.');
  } else {
    print('El total está dentro del límite permitido.');
  }
}