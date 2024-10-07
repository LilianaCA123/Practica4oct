void main() {
  // Definir el Enum EstadoOrden
  enum EstadoOrden { pendiente, procesada, entregada }

  // Definicion de funciones
  //Definir funcion productos con ejemplos con precios
  var productos = [
  {"nombre": "Manzana", "precio": 10.0},
  {"nombre": "Pera", "precio": 15.0},
  {"nombre": "Naranja", "precio": 12.0}
  ];

  // Variables globales
  var estado = EstadoOrden.pendiente;
  String? nota = "Entrega rápida";

  // Mostrar los detalles de la orden
  mostrarDetalles(productos, estado, nota);
