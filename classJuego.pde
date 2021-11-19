class Juego {

  int cantImagen = 7;
  int cantFondoJuego = 17, inicioFondoJuego = 0;
  int cantFuente = 2;
  int cantCarriles = 6;
  PImage [] imagen = new PImage[cantImagen];
  PImage [] fondoJuego = new PImage[cantFondoJuego]; 
  PFont [] fuentes = new PFont[cantFuente];

  int cantVidas, cantMin;
  int milSeg, seg, min;

  int pantalla = 0;
  int frame = 0;

  Barco barco;
  Boton botonEmpezar, botonVolver, botonReintentar;
  Carril [] carriles;
  Obstaculo [] obstaculoRoca;
  Obstaculo [] obstaculoTiburon;

  Juego(int cantVidas_, int cantMin_) {

    cantVidas = cantVidas_;
    cantMin = cantMin_;

    //Cargar imágenes y fuentes:
    for (int i = 0; i < imagen.length; i++) {
      imagen[i] = loadImage("imagen_"+i+".png");
    } 
    for (int i = 0; i < fondoJuego.length; i++) {
      fondoJuego[i] = loadImage("fondo_"+i+".png");
    }
    for (int i = 0; i < fuentes.length; i++) {
      fuentes[i] = createFont("fuente_"+i+".ttf", 10);
    }

    //Parámetros de objetos: 
    carriles = new Carril[cantCarriles];
    for (int i = 0; i < carriles.length; i++) {
      carriles[i] = new Carril(this, i, width, 100);
    }
    obstaculoRoca = new Obstaculo[8];
    for (int i = 0; i < obstaculoRoca.length; i++) {
      obstaculoRoca[i] = new Obstaculo(this, carriles[(int)random(carriles.length)], imagen[2], random(width)+width, 100, 100);
    }     
    obstaculoTiburon = new Obstaculo [4];
    for (int i = 0; i < obstaculoTiburon.length; i++) {
      obstaculoTiburon[i] = new Obstaculo(this, carriles[(int)random(carriles.length)], imagen[3], random(width)+width, 100, 100);
    }
    barco = new Barco(this, carriles[3], imagen[1], 50, 120, 100);
    botonEmpezar = new Boton(this, "Empezar", fuentes[1], width/2, height/2+height/4, 300, 60);
    botonVolver = new Boton(this, "Volver al inicio", fuentes[1], width/2, height/2+height/4, 300, 60);
    botonReintentar = new Boton(this, "Reintentar", fuentes[1], width/2, height/2+height/4, 300, 60);
  }

  void dibujar() {
    if (pantalla == 0) {

      //Pantalla de inicio:
      image(imagen[0], 0, 0);
      titulo("Minijuego #1", fuentes[0], width/2, height/3, 100);
      texto("Muévete con UP y DOWN y esquiva los obstaculos \n -Cada obstáculo que choques, te sacará un cierto porcentaje de tu vida \n -Si logras aguantar 1 min sin perder toda la vida, ganas", fuentes[1], width/2, height/2, 25);
      botonEmpezar.dibujar();
    } else if (pantalla == 1) {

      //Pantalla del videojuego:
      if (frame % 5 == 0) {
        //Fondo videojuego:
        image(fondoJuego[inicioFondoJuego], 0, 0);
        inicioFondoJuego = (inicioFondoJuego+1)%fondoJuego.length;
        //Barco:
        barco.dibujar();
        if (keyPressed) {
          barco.mover(keyCode);
        }
        //Obstáculos:
        for (int i = 0; i < obstaculoRoca.length; i++) {
          obstaculoRoca[i].dibujar();
          obstaculoRoca[i].mover();

          //Evalúo colision:
          if (barco.carrilActual.nroCarril == obstaculoRoca[i].carril.nroCarril) {
            if (obstaculoRoca[i].colision(barco.posX, barco.carrilActual.nroCarril, barco.ancho, barco.alto)) {
              cantVidas -=2;
            }
          }
        }
        for (int i = 0; i < obstaculoTiburon.length; i++) {
          obstaculoTiburon[i].dibujar();
          obstaculoTiburon[i].mover();

          //Evalúo colision:
          if (barco.carrilActual.nroCarril == obstaculoTiburon[i].carril.nroCarril) {
            if (obstaculoTiburon[i].colision(barco.posX, barco.carrilActual.nroCarril, barco.ancho, barco.alto)) {
              cantVidas -=2;
            }
          }
        }
      }

      //Vidas:
      vidas(imagen[6], fuentes[1], 50, 50, 50);
      if (cantVidas <= 0) {
        pantalla = 3;
      }
      if (min == cantMin && cantVidas > 0) {
        pantalla = 2;
      }

      //Segundero:
      segundero(fuentes[1], 50, 550);

      //Velocidad del juego:
      frame ++;
      if (frame==60) {
        frame=0;
      }
    } else if (pantalla == 2) {

      //Pantalla de Victoria:
      image(imagen[5], 0, 0);
      titulo("¡Victoria!", fuentes[1], width/2, height/3, 100);
      botonVolver.dibujar();
    } else if (pantalla == 3) {

      //Pantalla de Derrota:
      image(imagen[4], 0, 0);
      titulo("Derrota", fuentes[0], width/2, height/3, 100);
      botonReintentar.dibujar();
    }
  }


  void moverBarcoArriba(Barco barco) {
    cantCarriles = barco.carrilActual.nroCarril;    
    if (cantCarriles==0) {
      barco.carrilActual = carriles[carriles.length-1];
    } else {
      barco.carrilActual = carriles[cantCarriles-1];
    }
  }

  void moverBarcoAbajo(Barco barco) {
    cantCarriles = barco.carrilActual.nroCarril;    
    if (cantCarriles==carriles.length-1) {
      barco.carrilActual = carriles[0];
    } else {
      barco.carrilActual = carriles[cantCarriles+1];
    }
  }

  void titulo(String texto, PFont fuente, float posX, float posY, float tam) {
    pushStyle();

    textFont(fuente, tam);
    textLeading(100);
    textAlign(CENTER);
    fill(157, 0, 0);
    text(texto, posX, posY);

    popStyle();
  }
  void texto(String texto, PFont fuente, float posX, float posY, float tam){
    pushStyle();

    textFont(fuente, tam);
    textLeading(30);
    textAlign(CENTER);
    fill(255);
    text(texto, posX, posY);

    popStyle();
    
  }
  void vidas(PImage imagen, PFont fuente, int posX, int posY, int tam) {
    pushStyle();

    imageMode(CENTER);
    image(imagen, posX, posY, tam, tam);
    textFont(fuente, 30);
    textAlign(CENTER, CENTER);
    fill(255);    
    text(cantVidas+"%", posX+tam, posY);

    popStyle();
  }
  void segundero(PFont fuente, int posX, int posY) {
    pushStyle();

    textFont(fuente, 30);
    textAlign(CENTER, CENTER);
    fill(255);
    if (milSeg <= 58 ) {
      text(min+":"+seg, posX, posY);
      milSeg = milSeg+1;
    } else if (seg <= 58) {
      seg = seg+1;
      milSeg = 0;
      text(min+":"+seg, posX, posY);
    } else {
      min = min+1;
      seg = 0;
      milSeg = 0;
      text(min+":"+seg, posX, posY);
    } 
    popStyle();
  }
  void reiniciarIndicadores() {
    min = 0;
    seg = 0;
    milSeg = 0; 
    cantVidas = vidasMax;
  }
  void reiniciarObstaculos() {
    for (int i = 0; i < obstaculoRoca.length; i++) {
      obstaculoRoca[i].reiniciar();
    }
    for (int i = 0; i < obstaculoTiburon.length; i++) {
      obstaculoTiburon[i].reiniciar();
    }
  }
}
