class Barco {
  Juego juego;
  Carril carrilActual;
  Obstaculo obstaculo;
  float posCarril = 3;
  float alto, ancho, posX;
  PImage imgBarco; 
  
  Barco (Juego juego_, Carril carrilActual_, PImage imgBarco_, float posX_, float ancho_, float alto_) {
    juego = juego_;
    carrilActual = carrilActual_;
    imgBarco = imgBarco_;
    alto = alto_;
    ancho = ancho_;
    posX = posX_;
  }

  void dibujar() {
    pushMatrix();
    pushStyle();

    carrilActual.dibujarBarco(this);

    popMatrix();
    popStyle();
  }

  void mover(int tecla) {

    if (tecla==UP) {
      juego.moverBarcoArriba(this);
    }
    if (tecla==DOWN) {
      juego.moverBarcoAbajo(this);
    }
  }
}
