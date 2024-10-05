// Parte 1

import 'package:flutter/material.dart';

void main() {
  int numero = 5;
  var cantidad = 9;
   String? nombre= "Derik";
   nombre = null;
   var productos = ["manzana", "naranja", "pera", "pera"];
   print(productos[3]);
   print("el valor del numero es:  + ${numero}");

   for(var producto in productos){
     print(producto);
   }

   Set productoSet = {"manzana", "naranja", "pera"};
   print(productoSet);


   Map detallesProductos = {
     "manzana": 10,
     "pera": 20,
     "naranja": 15
   };
   print(detallesProductos["manzana"]);

   if(cantidad > 0 && cantidad < 10){
     print("la cantidad es mayor a cero");
     int miTotal = calcularTotal();
   }else if (cantidad == 10 || cantidad == 11)
   {
     print("la cantidad es igual a 10-11");
   }
   else{
     print("La cantidad es incorrecta");
   }

  int contador = 0;
  while (contador < 5) {
    print('El contador es: $contador');
    contador++;
  }
}

int calcularTotal(){
  int total = 100;
  print ("Entro a caluclar Total");
  return total;
}


// Parte 2

