
void main() {

  //Lista de productos disponibles
  var inventario = ["Cuerno", "Concha", "Dona", "Oreja", "Panqué", "Bolillo"];

  //Definimos un limite de productos de 6, para no permitir que se repitan en el Set
  const limiteProductos = 6;

  //Carrito Set que permite elegir productos no repetidos
  Set carrito = { };

  //Agregar productos al carrito
  int contador = 0;
  while (contador < limiteProductos){
    carrito.add(inventario[contador]);
    contador++;
  }
  print("\nEl carrito de productos es: ${carrito}");

  //Mapa de stock Producto - Cantidad disponible
  Map stock = {
    "Cuerno": 10,
    "Concha": 20,
    "Dona": 15,
    "Oreja": 10,
    "Panqué": 20,
    "Bolillo": 15
  };

  //Mostramos el Stock disponible
  print("\nStock: ${stock}");

  //Descuento a la orden
  var cantidadMaxima = 400;
  const descuento = 50;
  var totalOrden = calcularTotal();
  if(totalOrden > cantidadMaxima){
    totalOrden = totalOrden - descuento;
    print("\nTu orden con descuento es: ${totalOrden}");
  }

  //Mostramos detalles de la orden
  print("\nDetalles de la orden");
  var EstadoOrden = ["Pendiente","Procesada","Entregada"];
  detallesOrden();

}

//Funcion para calcular el total
int calcularTotal(){
  return 15;
}

//Funcion para definir producto
void Producto(){
  var nombre = "Concha";
  int precio = 15;

  print("\nnombre: "+nombre);
  print("precio: ${precio}");
}

//Funcion para definir orden
void Orden(){
  var productos = [];
  var estado;
  String? nota = "Sin observaciones";

  print("Nota: "+ nota);
}

//Funcion para obtener detalles de la orden
void detallesOrden(){
  Producto();
  var total = calcularTotal();
  print("Total = ${total}");
  Orden();
}
