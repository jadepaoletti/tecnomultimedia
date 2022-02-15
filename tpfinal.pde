/*
 Alumna: Jade Paoletti
 Comisión: 1 (Prof. José Luis Bugiolachi)
 */
 
 Juego juego;
 
 void setup(){
   size(800, 600);
   juego = new Juego(100, 1);
 }
 
 void draw(){
   juego.dibujar();
   
 }
 void mouseReleased(){
   juego.pasarPantalla(juego.boton);
 }

 
