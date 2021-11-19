/*
 Alumna: Jade Paoletti
 Comisión: 1 (Prof. José Luis Bugiolachi)
 Link al video:
 */

Juego juego;
int vidasMax = 100, minMax = 1;

void setup() {
  size(800, 600);
  juego = new Juego(vidasMax, minMax);
}

void draw() {
  juego.dibujar();
}

void mouseReleased() {
  juego.botonEmpezar.pasarPantalla();
}
