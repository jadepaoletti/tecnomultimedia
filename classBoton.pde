class Boton {
  Juego juego;
  String etiqueta;
  PFont fuente;
  int alto, ancho, posX, posY;
  
  boolean isMouseOver(Juego juego_, int posX_, int posY_, int ancho_, int alto_) {
    juego = juego_;
    posX = posX_;
    posY = posY_;
    ancho = ancho_;
    alto = alto_;
    
    if (mouseX >= posX-ancho/2 && mouseX <= posX+ancho/2 && mouseY >= posY-alto/2 && mouseY <= posY+alto/2) {
      return true;
    } else {
      return false;
    }
  }
  
  Boton (Juego juego_, int ancho_, int alto_){
    
    juego = juego_;
    alto = alto_;
    ancho = ancho_;
  }
  
  void dibujar(Juego juego_, String etiqueta_, PFont fuente_, int posX_, int posY_) {
    juego = juego_;
    etiqueta = etiqueta_;
    fuente = fuente_;
    posX = posX_;
    posY = posY_;
    
    pushStyle();

    //boton
    if (isMouseOver(juego, posX, posY, ancho, alto)) {
      fill(108, 0, 0);
    } else {
      fill(157, 0, 0);
    }
    noStroke();
    rectMode(CENTER);
    rect(posX, posY, ancho, alto, 5);
    //etiqueta
    textFont(fuente, 30);
    fill(255);
    textAlign(CENTER, CENTER);
    text(etiqueta, posX, posY);

    popStyle();
  }
}
