/*
 Alumna: Jade Paoletti
 Comisión: 1 (Prof. José Luis Bugiolachi)
 Link al video: https://youtu.be/7svQRvbLL1w
 */

Juego juego;

void setup() {
  size(800, 600);
  juego = new Juego(100, 1);
}

void draw() {
  juego.dibujar();
}

void mouseReleased() {
  juego.pasarPantalla(juego.botonEmpezar);
  juego.pasarPantalla(juego.botonVolver);
  juego.pasarPantalla(juego.botonReintentar);
}
