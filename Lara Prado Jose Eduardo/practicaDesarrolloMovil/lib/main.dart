import 'dart:nativewrappers/_internal/vm/lib/mirrors_patch.dart';

import 'package:flutter/material.dart';

/*void main(List<String> arguments) {
  var cantidad = 11;
  var numero = 10;
  String? nombre= "Lalo";
  nombre = null;
  var productos = ["manzana", "naranja", "pera", "pera"]; //acepta valores duplicados
  print(productos[0]);
  print("el valor del numero es: ${numero}");


  for(var producto in productos){
    print(producto);
  }

  Set productosSet = {"manzana", "naranja", "pera", "pera"}; // SET no acepta valores duplicados
  print(productosSet);

  Map detallesProducto = { //Sirve para guardar clave y el valor
    "manzana":10,
    "pera":20,
    "naranja":15
  };
  print(detallesProducto["manzana"]);


  if (cantidad > 0 && cantidad < 10){
    print("La cantidad es mayor a cero");
    int miTotal= calcularTotal();

  }else if(cantidad == 10 || cantidad == 11)
  {
    print("La cantidad es igual a 10");
  }
  else{
    print("La cantidad es incorrecta");
  }
  int contador = 0;
  while (contador < 5){
    print('el contador es: $contador');
    contador++;
  }
}

int calcularTotal(){
  int total = 100;
  print("Entro a calcular Total");
  return total;

}*/
enum EstadoOrden {
  Pendiente,
  Procesada,
  Entregada,}

class Producto {
  String nombre;
  double precio;
  Producto(this.nombre, this.precio);
}

class Orden {
  List<Producto> productos;
  EstadoOrden estado;
  static const int limiteProductos = 5;
  static const double descuento = 0.2;
  double cantMax;
  Orden(this.productos, this.estado, this.cantMax);

  double calcularElTotal() {
    double total = 0;
    for (var producto in productos) {
      total += producto.precio;
    }
    if (total > cantMax) {
      total -= total * descuento;
    }

    return total;
  }


void main() {

}

}