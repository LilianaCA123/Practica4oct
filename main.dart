import 'package:flutter/material.dart';

void main() {
  var estadoOrden = ["Pendiente", "Procesada", "Entregada"];

  // Inventario d eproducto
  var inventario = [
    crearProducto("Manzana", 10),
    crearProducto("Pera", 20),
    crearProducto("Naranja", 15),
  ];

  // Stock del producto
  Map stock = {
    "Manzana": 5,
    "Pera": 10,
    "Naranja": 8,
  };

  // Carrito
  Set carrito = {};


  const double descuento = 0.10;
  const int limiteDeProductos = 5;
  int cantidadMaxima = 50;

  // Agregar productos
  int contador = 0;
  while (contador < limiteDeProductos) {
    carrito.add(inventario[contador % inventario.length]);
    contador++;
  }

  // Crear una orden con el carrito de productos
  var orden = crearOrden(carrito.toList(), estadoOrden[0], "Entregar con cuidado");

  // Mostrar los detalles de la orden
  mostrarDetallesOrden(orden);

  // Calcular total de la orden
  var total = calcularTotal(orden['productos']);
  print("Total de la orden: \$${total}");

  // descuento
  if (total > cantidadMaxima) {
    total -= total * descuento;
    print("Descuento aplicado. Nuevo total: \$${total}");
  }

  // mostrar el stock restante
  for (var producto in inventario) {
    print("Producto: ${producto['nombre']}, Stock restante: ${stock[producto['nombre']]}");
  }
}

// Funcion para crear un producto
Map crearProducto(String nombre, double precio) {
  return {'nombre': nombre, 'precio': precio};
}

// Función para crear una orden
Map crearOrden(List productos, String estado, [String? nota]) {
  return {'productos': productos, 'estado': estado, 'nota': nota};
}

// Función para mostrar los detalles de la orden
void mostrarDetallesOrden(Map orden) {
  print("Estado de la orden: ${orden['estado']}");
  for (var producto in orden['productos']) {
    print("Producto: ${producto['nombre']}, Precio: \$${producto['precio']}");
  }
  if (orden['nota'] != null) {
    print("Nota: ${orden['nota']}");
  }
}

// Función para calcular el total de la orden
double calcularTotal(List productos) {
  double total = 0;
  for (var producto in productos) {
    total += producto['precio'];
  }
  return total;
}