class Juego {
  
  int cantImagen = 4;
  int cantMar = 17, inicioMar = 0;
  int cantFondo = 13;
  int cantFuente = 2;
  int cantCarriles = 6;

  // ARREGLOS PARA IMAGENES Y FUENTES
  PImage [] fondo = new PImage[cantFondo];
  PImage [] imagen = new PImage[cantImagen];
  PImage [] mar = new PImage[cantMar]; 
  PFont [] fuentes = new PFont[cantFuente];

  int cantVidas, cantMin; 
  int milSeg, seg, min;

  int pantalla = 0;
  int frame = 0; 
  int decision;
  
  int anchoBot = 300;
  int altoBot = 60;

  Barco barco; 
  Boton boton;

  //ARREGLOS DE OBJETOS
  Carril [] carriles;
  Obstaculo [] obstaculoRoca;
  Obstaculo [] obstaculoTiburon;

  Juego(int cantVidas_, int cantMin_) {
    cantVidas = cantVidas_;
    cantMin = cantMin_;

    //CARGAR IMAGENES Y FUENTES 
    for (int i = 0; i < imagen.length; i++) {
      imagen[i] = loadImage("imagen_"+i+".png");
    } 
    for (int i = 0; i < mar.length; i++) {
      mar[i] = loadImage("mar_"+i+".png");
    }
    for (int i = 0; i < fondo.length; i++) {
      fondo[i] = loadImage("fondo_"+i+".jpg");
    }
    for (int i = 0; i < fuentes.length; i++) {
      fuentes[i] = createFont("fuente_"+i+".ttf", 10);
    }
    
    //PARAMETROS DE OBJETOS
    carriles = new Carril[cantCarriles];
    for (int i = 0; i < carriles.length; i++) {
      carriles[i] = new Carril(this, i, width, 100);
    }
    obstaculoRoca = new Obstaculo[8];
    for (int i = 0; i < obstaculoRoca.length; i++) {
      obstaculoRoca[i] = new Obstaculo(this, carriles[(int)random(carriles.length)], imagen[1], random(width)+width, 100, 100);
    }     
    obstaculoTiburon = new Obstaculo [4];
    for (int i = 0; i < obstaculoTiburon.length; i++) {
      obstaculoTiburon[i] = new Obstaculo(this, carriles[(int)random(carriles.length)], imagen[3], random(width)+width, 100, 100);
    }

    barco = new Barco(this, carriles[3], imagen[0], 50, 120, 100);
    boton = new Boton(this, anchoBot, altoBot);
  }

  //ESCENARIOS---------------------------------------------------------------------

  void dibujar() {
    if (pantalla == 0) {

      //PANTALLA DE INICIO
      image(fondo[0], 0, 0);
      titulo("EL LABERINTO\n DEL MINOTAURO", fuentes[0], width/2, height/3, 80);
      boton.dibujar(this, "Empezar", fuentes[1], width/2, height/2+height/5);
      boton.dibujar(this, "Creditos", fuentes[1], width/2, height/2+height/3);
  
    } else if (pantalla == 1) {

      //PANTALLA DE CREDITOS
      image(fondo[0], 0, 0);
      titulo("CREDITOS", fuentes[0], width/2, height/4, 70);
      textoCenter("Jade Paoletti \n Comisión 1 \n Tecnología Multimedial 1 \n Prof. José Luis Bugiolachi", fuentes[1], width/2, height/3, 25);
      boton.dibujar(this, "Volver al Inicio", fuentes[1], width/2, height/2+height/3);

    } else if (pantalla == 2) {

      //ESCENA 1
      image(fondo[1], 0, 0);
      textoLeft("El minotauro era hijo de Pasifae, esposa \n del rey Minos de Creta y de un \n toro blanco enviado por  Poseidón, dios del \n mar.", fuentes[1], width/2, height/4, 25);
      boton.dibujar(this, "Siguiente", fuentes[1], width/2+width/4, height/2+height/3);

    } else if (pantalla == 3) {

      //ESCENA 2
      image(fondo[2], 0, 0);
      textoLeft("Minos había ofendido gravemente a \n Poseidón quien como venganza hizo \n que Pasifae se enamorase del animal.\n Fruto de dicha unión nació el \n Minotauro, un ser violento, mitad \n hombre, mitad toro, que se alimentaba \n de carne humana.", fuentes[1], width/2, height/10, 25);
      boton.dibujar(this, "Siguiente", fuentes[1], width/2+width/4, height/2+height/3);
      
    } else if (pantalla == 4) {

      //ESCENA 3
      image(fondo[4], 0, 0);
      textoCenter("Esta bestia fue encerrada en un laberinto que construyó el artesano Dédalo, \n un laberinto del que todo aquel que entraba nunca salía. Era devorado por el \n Minotauro con el que el rey Minos de Creta tenía aterrorizados a sus vecinos \n que todos los años le pagaban un tributo para que los dejara en paz.", fuentes[1], width/2, height/10, 25);
      boton.dibujar(this, "Siguiente", fuentes[1], width/2+width/4, height/2+height/3);
      
    } else if (pantalla == 5) {

      //ESCENA 4
      image(fondo[5], 0, 0);
      textoCenter("Mientras el Minotauro vagaba por el laberinto del palacio de Creta, ocurrió \n una desgracia: Andrógeno, hijo del rey Minos, fue asesinado tras ganar una \n olimpiada y su padre declaró la guerra a Atenas, que acabó rindiéndose. La \n rendición tuvo un precio: entregar siete hombres y siete mujeres al terrible \n laberinto. Y así lo hacía el rey de Atenas, Egeo.", fuentes[1], width/2, height/10, 25);
      boton.dibujar(this, "Siguiente", fuentes[1], width/2+width/4, height/2+height/3);
      
    } else if (pantalla == 6) {

      //ESCENA 5 -- 1ERA ELECCION 
      image(fondo[6], 0, 0);
      textoLeft("Su hijo Teseo, príncipe de Atenas, \n estaba harto de perder a su gente. \n Quería viajar él mismo y acabar con la bestia \n de una vez por todas, pero también \n temía por su vida.", fuentes[1], width/2, height/10, 25);
      textoLeft("¿Atravesará Teseo la aventura?", fuentes[1], width/20, height/2 + height/4, 25);
      boton.dibujar(this, "Si, parte hacia Creta", fuentes[1], width/2+width/4, height/2+height/5);
      boton.dibujar(this, "No, se queda en Atenas", fuentes[1], width/2+width/4, height/2+height/3);
      
    } else if (pantalla == 7) {

      //ESCENA 6 -- OPCION "NO VIAJA" (PRIMER FINAL)
      image(fondo[7], 0, 0);
      textoCenter("Teseo decidió que era muy descabellado para un miembro de la realeza ir a una \n aventura tan peligrosa, cualquier otro podría hacerlo. Pero la realidad es que \n nadie ha vencido ni vencerá al terrible Minotauro. El ciclo se repitó hasta que \n finalmente nadie quedó en Atenas", fuentes[1], width/2, height/10, 25);
      titulo("FIN", fuentes[0], width/2, height/2 + height/4, 70);
      boton.dibujar(this, "Volver al Inicio", fuentes[1], width/2+width/4, height/2+height/3);
    
    } else if (pantalla == 8) {

      //ESCENA 7 -- OPCION "SI VIAJA" 
      image(fondo[6], 0, 0);
      textoLeft("Su hijo Teseo se envalentonó y zarpó \n junto a otros trece jóvenes para Creta \n mientras su padre le pedía que si lograba \n su propósito alzara una vela blanca en \n su embarcación; de lo contrario, \n desplegaría una de color negro.", fuentes[1], width/2, height/10, 25);
      boton.dibujar(this, "Siguiente", fuentes[1], width/2+width/4, height/2+height/3);

    } else if (pantalla == 9) {

      //ESCENA 8 -- 2DA ELECCION
      image(fondo[8], 0, 0);
      textoLeft("Ariadna, la hija del rey Minos, quien \n estaba enamorada del joven, le ofreció \n ayuda en su recorrido por el laberinto. \n Le ofreció un ovillo de hilo para saber \n por dónde regresar en caso de acabar \n con el Minotauro.", fuentes[1], width/2, height/10, 25);
      textoLeft("¿Aceptará nuestro héroe \n la ayuda del enemigo?", fuentes[1], width/20, height/2 + height/4, 25);
      boton.dibujar(this, "Si, toda ayuda vale", fuentes[1], width/2+width/4, height/2+height/5);
      boton.dibujar(this, "Puede ser una trampa...", fuentes[1], width/2+width/4, height/2+height/3);
      
    } else if (pantalla == 10) {

      //ESCENA 9 -- OPCION "DENEGAR AYUDA"
      image(fondo[8], 0, 0);
      textoLeft("Teseo decide que no confía en la \n princesa de Creta, a pesar de que podría ser una gran \n ventaja. Así que continúa por el \n famoso laberinto, seguido por su \n atemorizada tripulacion.", fuentes[1], width/2, height/10, 25);
      boton.dibujar(this, "Siguiente", fuentes[1], width/2+width/4, height/2+height/3);
      
    } else if (pantalla == 11) {

      //ESCENA 10 -- OPCION "ACEPTAR AYUDA"
      image(fondo[8], 0, 0);
      textoLeft("Teseo acepta y agradece la ayuda de \n la princesa. Ese ovillo de hilo podría ser \n crucial al momento de salir del laberinto \n o quedar atrapado en él por el resto de \n sus vidas. Ató de un poste un extremo \n del ovillo antes de entrar.", fuentes[1], width/2, height/10, 25);
      boton.dibujar(this, "Siguiente", fuentes[1], width/2+width/4, height/2+height/3);
      
    } else if (pantalla == 12) {

      //ESCENA 11 -- 3ERA ELECCION
      image(fondo[9], 0, 0);
      textoCenter("El príncipe de Atenas dio un paso al frente y se ofreció el primero \n para adentrarse en el laberinto. Estaba muy oscuro y no sabía qué camino \n tomar. Cada paso conducía a una muerte segura. Se preguntaba si en el camino \n habría algo que lo ayude a derrotar a la bestia...", fuentes[1], width/2, height/10, 25);
      textoLeft("En la primera intersección hay dos \n caminos ¿Por cual debería seguir?", fuentes[1], width/20, height/2 + height/4, 25);
      boton.dibujar(this, "El de la antorcha", fuentes[1], width/2+width/4, height/2+height/5);
      boton.dibujar(this, "El de la calavera", fuentes[1], width/2+width/4, height/2+height/3);
      
    } else if (pantalla == 13) {

      //ESCENA 12 -- OPCION "CALAVERA" - 1
      image(fondo[10], 0, 0);
      textoLeft("Teseo y sus seguidores continúan por el \n camino de la calavera. A lo largo del \n oscuro pasillo se encuentran diferentes \n partes óseas y telas de araña. Teseo \n aprovecha para fabricar un arma que \n lo ayude a enfrentar al Minotauro.", fuentes[1], width/2, height/10, 25);
      boton.dibujar(this, "Siguiente", fuentes[1], width/2+width/4, height/2+height/3);
      
    } else if (pantalla == 14) {

      //ESCENA 13 -- OPCION "ANTORCHA" - 1
      image(fondo[10], 0, 0);
      textoLeft("Teseo y sus seguidores continúan por el \n camino de la antorcha. A lo largo del \n pasillo iluminado, se escuchaban \n los ecos de los jóvenes quienes, \n aterrorizados, rogaban a sus dioses por \n sus vidas.", fuentes[1], width/2, height/10, 25);
      boton.dibujar(this, "Siguiente", fuentes[1], width/2+width/4, height/2+height/3);
      
    } else if (pantalla == 15) {

      //ESCENA 14 -- OPCION "CALAVERA" - 2
      image(fondo[3], 0, 0);
      textoLeft("Siguieron caminando hasta encontrarse \n en un inmenso y oscuro salón. Un \n nauseabundo olor a podredumbre se \n sentía en el ambiente y el aire era frío \n y húmedo. De repente, unos ojos rojos \n brillantes aparecieron en la oscuridad.", fuentes[1], width/2, height/10, 25);
      boton.dibujar(this, "Siguiente", fuentes[1], width/2+width/4, height/2+height/3);
      
    } else if (pantalla == 16) {

      //ESCENA 15 -- OPCION "ANTORCHA" - 2
      image(fondo[3], 0, 0);
      textoLeft("Siguieron caminando hasta encontrarse \n en un inmenso y oscuro salón. Un \n nauseabundo olor a podredumbre se \n sentía en el ambiente y el aire era frío \n y húmedo. De repente, unos ojos rojos \n brillantes aparecieron en la oscuridad.", fuentes[1], width/2, height/10, 25);
      boton.dibujar(this, "Siguiente", fuentes[1], width/2+width/4, height/2+height/3);
      
    } else if (pantalla == 17) {

      //ESCENA 16 -- OPCION "CALAVERA" - 3
      image(fondo[11], 0, 0);
      textoLeft("Al ver al joven armado, el Minotauro \n rugió, derribó a Teseo de un empujón \n y lo pisoteó con sus afiladas pezuñas. \n Pelearon completamente a oscuras. \n El monstruo le estrujó entre sus brazos \n peludos y le azotó con su cola.", fuentes[1], width/2, height/10, 25);
      boton.dibujar(this, "Siguiente", fuentes[1], width/2+width/4, height/2+height/3);
      
    } else if (pantalla == 18) {

      //ESCENA 17 -- OPCION "CALAVERA" - 4
      image(fondo[11], 0, 0);
      textoLeft("Pero Teseo le agarró por los cuernos y \n los giró primero hacia un lado, después \n hace el otro. Le pateó, le embistió, \n forcejeó con él, y en una oportunidad, \n lo insartó con el arma de huesos. \n Finalmente la bestia profirió un \n balbuceo y cayó muerta.", fuentes[1], width/2, height/10, 25);
      boton.dibujar(this, "Siguiente", fuentes[1], width/2+width/4, height/2+height/3);
      
    } else if (pantalla == 19) {

      //ESCENA 18 -- OPCIONES "CALAVERA" Y "DENEGAR AYUDA" - 5 - (SEGUNDO FINAL)
      image(fondo[4], 0, 0);
      textoCenter("Todos aclamaron al valiente príncipe. Pero el desafío aún no había acabado; al \n no haber aceptado la ayuda de Ariadna, estaban perdidos dentro del laberinto. \n Teseo y sus seguidores pasaron el resto de sus vidas tratando de encontrar la \n salida, mientras cada vez más jóvenes eran eviados a sufrir el mismo destino.", fuentes[1], width/2, height/10, 25);
      titulo("FIN", fuentes[0], width/2, height/2 + height/4, 70);
      boton.dibujar(this, "Volver al Inicio", fuentes[1], width/2+width/4, height/2+height/3);
      
    } else if (pantalla == 20) {

      //ESCENA 19 -- OPCIONES "ANTORCHA", "DENEGAR AYUDA" Y "ACEPTAR AYUDA" - 3 - (TERCER FINAL)
      image(fondo[11], 0, 0);
      textoCenter("El Minotauro rugió, y cegado por la luz, embistió contra Teseo. La llama \n que antes lo había ayudado a ver en la oscuridad del laberinto, ahora yacía sobre \n su pecho. Ambos pelearon prendidos en llamas entre gritos y rugidos hasta \n que finalmente cayeron al suelo carbonizados.", fuentes[1], width/2, height/10, 25);
      titulo("FIN", fuentes[0], width/2, height/2 + height/4, 70);
      boton.dibujar(this, "Volver al Inicio", fuentes[1], width/2+width/4, height/2+height/3);
      
    } else if (pantalla == 21) {

      //ESCENA 20 -- OPCIONES "CALAVERA" Y "ACEPTAR AYUDA" (CUARTO FINAL)
      image(fondo[12], 0, 0);
      textoCenter("Todos aclamaron al valiente príncipe, había hecho lo que nadie más había \n podido. Usando el hilo que había dejado en la puerta del gran salón, volvieron a \n la salida, sanos y salvo y Ariadna se fue con ellos. Emocionado por su victoria, \n a Teseo se le olvidó cambiar la vela negra por la blanca, por lo que su padre, \n al ver desde la Acrópolis la tela azabache, pensó que su hijo había sido \n devorado por el Minotauro y se arrojó al vacío.", fuentes[1], width/2, height/10, 25);
      titulo("FIN", fuentes[0], width/2, height/2 + height/4, 70);
      boton.dibujar(this, "Volver al Inicio", fuentes[1], width/2+width/4, height/2+height/3);
      
    } else if (pantalla == 22){
      
      // VIDEOJUEGO -- DESPUES DE LA PANTALLA 9 -- PANTALLA 1
      image(fondo[0], 0, 0);
      titulo("Minijuego", fuentes[0], width/2, height/3, 100);
      textoCenter("Muévete con UP y DOWN y esquiva los obstaculos \n -Cada obstáculo que choques, te sacará un cierto porcentaje de tu vida \n -Si logras aguantar 1 min sin perder toda la vida, ganas", fuentes[1], width/2, height/2, 25);
      boton.dibujar(this, "Empezar", fuentes[1], width/2, height/2+height/4);
  
    } else if (pantalla == 23){
      
      // VIDEOJUEGO -- PANTALLA 2
      
      if (frame % 5 == 0) {
        
        //Fondo videojuego:
        image(mar[inicioMar], 0, 0);
        inicioMar = (inicioMar+1)%mar.length;
        
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
      vidas(imagen[2], fuentes[1], 50, 50, 50);
      if (cantVidas <= 0) {
        pantalla = 25;
      }
      if (min == cantMin && cantVidas > 0) {
        pantalla = 24;
      }

      //Segundero:
      segundero(fuentes[1], 50, 550);

      //Velocidad del juego:
      frame ++;
      if (frame==60) {
        frame=0;
      }

    } else if (pantalla == 24){
      
      //PANTALLA VICTORIA
      image(fondo[12], 0, 0);
      titulo("¡Victoria!", fuentes[1], width/2, height/3, 100);
      boton.dibujar(this, "Continuar", fuentes[1], width/2+width/4, height/2+height/3);
      
    } else if (pantalla == 25){
      
      //PANTALLA DERROTA
      image(fondo[7], 0, 0);
      titulo("Derrota", fuentes[1], width/2, height/3, 100);
      boton.dibujar(this, "Reintentar", fuentes[1], width/2+width/4, height/2+height/3);
      
    }
  }
  //PASAR PANTALLAS----------------------------------------------------------------
  
  void pasarPantalla(Boton boton) {
    switch(pantalla){
      case 0: //PANTALLA DE INICIO------------------------------------------>
      { 
        if (boton.isMouseOver(this, width/2, height/2+height/3, anchoBot, altoBot)){
          pantalla = 1;
        }
        if (boton.isMouseOver(this, width/2, height/2+height/5, anchoBot, altoBot)){
          pantalla = 2;
        }
      }
      break;
      case 1: //PANTALLA DE CREDITOS---------------------------------------->
      {
        if (boton.isMouseOver(this, width/2, height/2+height/3, anchoBot, altoBot)){
          pantalla = 0;
        }
      }
      break;
      case 2: //ESCENA 1---------------------------------------------------->
      {
        if(boton.isMouseOver(this, width/2+width/4, height/2+height/3, anchoBot, altoBot)){
          pantalla = 3;
        }
      }
      break;
      case 3: //ESCENA 2---------------------------------------------------->
      {
        if(boton.isMouseOver(this, width/2+width/4, height/2+height/3, anchoBot, altoBot)){
          pantalla = 4;
        }
      }
      break;
      case 4: //ESCENA 3---------------------------------------------------->
      {
        if(boton.isMouseOver(this, width/2+width/4, height/2+height/3, anchoBot, altoBot)){
          pantalla = 5;
        }
      }
      break;
      case 5: //ESCENA 4---------------------------------------------------->
      {
        if(boton.isMouseOver(this, width/2+width/4, height/2+height/3, anchoBot, altoBot)){
          pantalla = 6;
        }
      }
      break;
      case 6: //1ERA ELECCION----------------------------------------------->
      {
        if(boton.isMouseOver(this, width/2+width/4, height/2+height/5, anchoBot, altoBot)){
          pantalla = 8;
        }
        if (boton.isMouseOver(this, width/2+width/4, height/2+height/3, anchoBot, altoBot)){
          pantalla = 7;
        }
      }
      break;
      case 7: //NO VIAJA--------------------------------------------------->
      {
        if (boton.isMouseOver(this, width/2+width/4, height/2+height/3, anchoBot, altoBot)){
          pantalla = 0;
        }
      }
      break;
      case 8: //SI VIAJA--------------------------------------------------->
      {
        if (boton.isMouseOver(this, width/2+width/4, height/2+height/3, anchoBot, altoBot)){
          pantalla = 22;
        }
      }
      break;
      case 22: //MINIJUEGO------------------------------------------------->
      {
        if (boton.isMouseOver(this, width/2, height/2+height/4, anchoBot, altoBot)){
          pantalla = 23;
        }
      }
      break;
      case 24: //PANTALLA VICTORIA----------------------------------------->
      {
        if (boton.isMouseOver(this, width/2+width/4, height/2+height/3, anchoBot, altoBot)){
          pantalla = 9;
        }
      }
      break;
      case 25: //PANTALLA DERROTA------------------------------------------>
      {
        if (boton.isMouseOver(this, width/2+width/4, height/2+height/3, anchoBot, altoBot)){
          pantalla = 22;
          reiniciarIndicadores();
          reiniciarObstaculos();
        }
      }
      break;
      case 9: //2DA ELECCION-----------------------------------------------> 
      {
        if (boton.isMouseOver(this, width/2+width/4, height/2+height/3, anchoBot, altoBot)){ //NIEGA AYUDA
          pantalla = 10;
          decision = 10;
        }
        if (boton.isMouseOver(this, width/2+width/4, height/2+height/5, anchoBot, altoBot)){ //ACEPTA AYUDA
          pantalla = 11;
          decision = 11;
        }
      }
      break;
      case 10: //ACEPTA AYUDA---------------------------------------------->
      {
        if(boton.isMouseOver(this, width/2+width/4, height/2+height/3, anchoBot, altoBot)){
          pantalla = 12;
        }
      }
      break;
      case 11: //NEGA AYUDA------------------------------------------------>
      {
        if(boton.isMouseOver(this, width/2+width/4, height/2+height/3, anchoBot, altoBot)){
          pantalla = 12;
        }
      }
      break;
      case 12: //3ERA ELECCION--------------------------------------------->
      {
        if(boton.isMouseOver(this, width/2+width/4, height/2+height/3, anchoBot, altoBot)){
          pantalla = 13;
        }
        if(boton.isMouseOver(this, width/2+width/4, height/2+height/5, anchoBot, altoBot)){
          pantalla = 14;
        }
      }
      break;
      case 13: //CAMINO CALAVERA 1----------------------------------------->
      {
        if(boton.isMouseOver(this, width/2+width/4, height/2+height/3, anchoBot, altoBot)){
          pantalla = 15;
        }
      }
      break;
      case 14: //CAMINO ANTORCHA 1----------------------------------------->
      {
        if(boton.isMouseOver(this, width/2+width/4, height/2+height/3, anchoBot, altoBot)){
          pantalla = 16;
        }
      }
      break;
      case 15: //CAMINO CALAVERA 2----------------------------------------->
      {
        if(boton.isMouseOver(this, width/2+width/4, height/2+height/3, anchoBot, altoBot)){
          pantalla = 17;
        }
      }
      break;
      case 16:
      {
        if(boton.isMouseOver(this, width/2+width/4, height/2+height/3, anchoBot, altoBot)){
          pantalla = 20;
        }
      }
      break;
      case 17: //CAMINO CALAVERA 3----------------------------------------->
      {
        if(boton.isMouseOver(this, width/2+width/4, height/2+height/3, anchoBot, altoBot)){
          pantalla = 18;
        }
      }
      break;
      case 18: //CAMINO CALAVERA 4----------------------------------------->
      {
        if(boton.isMouseOver(this, width/2+width/4, height/2+height/3, anchoBot, altoBot)){
          if (decision == 10) {
          pantalla = 19;
        } else {
          pantalla = 21;
        }
        }
      }
      break;
      case 19://SEGUNDO FINAL---------------------------------------------->
      {
        if(boton.isMouseOver(this, width/2+width/4, height/2+height/3, anchoBot, altoBot)){
          pantalla = 0;
          reiniciarIndicadores();
          reiniciarObstaculos();
        }
      }
      break;
      case 20://TERCER FINAL---------------------------------------------->
      {
        if(boton.isMouseOver(this, width/2+width/4, height/2+height/3, anchoBot, altoBot)){
          pantalla = 0;
          reiniciarIndicadores();
          reiniciarObstaculos();
        }
      }
      break;
      case 21://CUARTO FINAL---------------------------------------------->
      {
        if(boton.isMouseOver(this, width/2+width/4, height/2+height/3, anchoBot, altoBot)){
          pantalla = 0;
          reiniciarIndicadores();
          reiniciarObstaculos();
        }
      }
      break;
    }
  }
  
  //MOVER BARCO--------------------------------------------------------------------

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

  //INDICADORES--------------------------------------------------------------------

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
    cantVidas = 100;
  }

  void reiniciarObstaculos() {
    for (int i = 0; i < obstaculoRoca.length; i++) {
      obstaculoRoca[i].reiniciar();
    }
    for (int i = 0; i < obstaculoTiburon.length; i++) {
      obstaculoTiburon[i].reiniciar();
    }
  }

  //TEXTOS-------------------------------------------------------------------------

  void titulo(String texto, PFont fuente, float posX, float posY, float tam) {
    pushStyle();

    textFont(fuente, tam);
    textLeading(70);
    textAlign(CENTER);
    fill(157, 0, 0);
    text(texto, posX, posY);

    popStyle();
  }

  void textoLeft(String texto, PFont fuente, float posX, float posY, float tam) {
    pushStyle();

    textFont(fuente, tam);
    textLeading(50);
    textAlign(LEFT);
    fill(240);
    text(texto, posX, posY);

    popStyle();
  }
  void textoCenter(String texto, PFont fuente, float posX, float posY, float tam) {
    pushStyle();

    textFont(fuente, tam);
    textLeading(50);
    textAlign(CENTER);
    fill(240);
    text(texto, posX, posY);

    popStyle();
  }
}
