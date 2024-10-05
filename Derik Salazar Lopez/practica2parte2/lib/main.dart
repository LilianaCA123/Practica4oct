import 'package:flutter/material.dart';

void main() {


  int cantidadMaxima = 10;
  var cantidad = 9;
  String? nombreCliente = "Derik";
  nombreCliente = null;



  var inventario = ["Lampara de lava", "Billetera", "Camisa"];
  print(inventario[2]);

  print("El valor de cantidadMaxima es: $cantidadMaxima");



  for (var producto in inventario) {
    print(producto);
  }



  Set carrito = {"Lampara de lava", "Billetera", "Camisa"};
  print(carrito);



  Map stock = {
    "Lampara de lava": 10,
    "Billetera": 5,
    "Camisa": 20
  };
  print("Stock de Lampara de lava: ${stock["Lampara de lava"]}");



  if (cantidad > 0 && cantidad < cantidadMaxima) {
    print("La cantidad está dentro del rango permitido.");
    int total = calcularTotal(carrito, stock);
    procesarCompra(nombreCliente, carrito, total);
  } else if (cantidad == cantidadMaxima) {
    print("La cantidad es igual a la cantidad máxima permitida.");
  } else {
    print("La cantidad es incorrecta.");
  }


  // Ciclo while
  //int contador = 0;
  //while (contador < 5) {
    //print('El contador es: $contador');
    //contador++;
  //}





int calcularTotal(Set carrito, Map stock) {
  int total = 0;
  for (var producto in carrito) {
    total += stock[producto] as int ?? 0;
  }
  print("Total de productos en el carrito: $total");
  return total;
}



