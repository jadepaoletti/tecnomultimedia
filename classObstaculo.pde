class Obstaculo {
  Juego juego;
  Carril carril;
  Barco barco;
  float alto, ancho, posX, posY;
  float posXInicial;
  PImage imgObstaculo; 
  boolean colision(float posX_, float posY_, float ancho_, float alto_) {
    if (
      posX-ancho/4 < posX_+ancho_/4 && 
      posX+ancho/4 > posX_-ancho_/4 && 
      posY < posY_+alto_/2 &&  
      posY > posY_-alto_/2 
      ) {
      return true;
    } else {
      return false;
    }
  }

  Obstaculo(Juego juego_, Carril carril_, PImage imgObstaculo_, float posX_, float ancho_, float alto_) {
    juego = juego_;
    carril = carril_;
    imgObstaculo = imgObstaculo_;
    alto = alto_;
    ancho = ancho_;
    posX = posX_;
    posXInicial = posX_;
  }

  void dibujar() {
    pushMatrix();
    pushStyle();

    carril.dibujarObstaculo(this);

    popMatrix();
    popStyle();
  }
  void mover() {
    posX -= 20;
    if (posX<0-100) {
      posX = 800+random(width);
    }
  }
  void reiniciar() {
    posX = posXInicial;
  }
}
