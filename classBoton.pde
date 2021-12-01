class Boton {
  Juego juego;
  String etiqueta;
  PFont fontBoton;
  int alto, ancho, posX, posY;

  boolean isMouseOver() {
    if (mouseX >= posX-ancho/2 && mouseX <= posX+ancho/2 && mouseY >= posY-alto/2 && mouseY <= posY+alto/2) {
      return true;
    } else {
      return false;
    }
  }

  Boton (Juego juego_, String etiqueta_, PFont fontBoton_, int posX_, int posY_, int ancho_, int alto_) {
    juego = juego_;
    etiqueta = etiqueta_;
    fontBoton = fontBoton_;
    posX = posX_;
    posY = posY_;
    alto = alto_;
    ancho = ancho_;
  }

  void dibujar() {
    pushStyle();

    //boton
    if (isMouseOver()) {
      fill(108, 0, 0);
    } else {
      fill(157, 0, 0);
    }
    textFont(fontBoton, 30);
    noStroke();
    rectMode(CENTER);
    rect(posX, posY, ancho, alto, 5);

    pushStyle();

    //etiqueta
    fill(255);
    textAlign(CENTER, CENTER);
    text(etiqueta, posX, posY);

    popStyle();
    popStyle();
  }

  
}
