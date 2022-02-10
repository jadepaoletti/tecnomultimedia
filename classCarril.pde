class Carril {
  Juego juego;
  Obstaculo obstaculo;
  float ancho, alto, posY;
  int nroCarril;

  Carril(Juego juego_, int nroCarril_, float ancho_, float alto_) {
    juego = juego_;
    nroCarril = nroCarril_;
    posY = nroCarril_*alto_;
    ancho = ancho_;
    alto = alto_;
  }

  void dibujarBarco(Barco barco) {
    image(barco.imgBarco, barco.posX, this.posY, barco.ancho, barco.alto);
  }
  void dibujarObstaculo(Obstaculo obstaculo) {
    image(obstaculo.imgObstaculo, obstaculo.posX, this.posY, obstaculo.ancho, obstaculo.alto);
  }
}
