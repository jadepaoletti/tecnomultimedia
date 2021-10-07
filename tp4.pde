/*
  Alumna: Jade Paoletti
  Comisión: 1 (Prof. José Luis Bugiolachi)
  Link al video: https://youtu.be/x5iZxkDIVaw
  Link al diagrama de flujo: https://github.com/jadepaoletti/tecnomultimedia/tree/diagrama_de_flujo_tp4
*/

PImage [] fondos;
PFont fuenteBotones, fuenteTitulo;
int Pantalla = 0;
int offsetX, offsetY; //Reemplazo del translate
int ejeBotonX = 0; //RectMode Off
int tamBotX, tamBotY,  pBotX, pBotY; //Tamaño y posición de los botones
int decision;

void setup() {
  size(800, 600);

  offsetX = width/2;
  offsetY = height/2;
  tamBotX = 300;
  tamBotY = 50;
  pBotX = width/4; 
  pBotY = height/3; 

  //Cargar Imágenes
  fondos = new PImage[13];
  for (int i=0; i<13; i++) {
    fondos[i] = loadImage("fondo_"+i+".jpg");
  }

  //Cargar Fuentes
  fuenteBotones = createFont("DIOGENES.ttf", 25);
  fuenteTitulo = createFont("adrip1.ttf", 90);
}

boolean isEnBoton(int tx, int ty, int w, int h) { //Distancia 
  int topX = tx - (w/2);
  int topY = ty - (h/2);
  return mouseX >= topX + offsetX && mouseX <= topX + offsetX + w && mouseY >= topY + offsetY && mouseY <= topY + offsetY + h;
}

void draw() {

  if (Pantalla == 0) {

    // Inicio
    image(fondos[0], 0, 0);
    Titulo("EL LABERINTO\n DEL MINOTAURO", 0, height/8, width, height);
    Boton ("Empezar", ejeBotonX, height/8, tamBotX, tamBotY);
    Boton ("Créditos", ejeBotonX, height/4, tamBotX, tamBotY);
  } else if (Pantalla == 1) {

    // Créditos
    image(fondos[0], 0, 0);
    Titulo("CREDITOS", 0, height/8, width, height);
    Creditos("Jade Paoletti \n Comisión 1 \n Tecnología Multimedial 1 \n Prof. José Luis Bugiolachi", 0, height/3, width, height);
    Boton("Volver al inicio", pBotX, pBotY, tamBotX, tamBotY);
  } else if (Pantalla == 2) {

    //Página 2
    image(fondos[1], 0, 0);
    Texto("El minotauro era hijo de Pasifae, esposa del rey Minos de Creta y de un toro blanco enviado por  Poseidón, dios del mar.", 0, height/4, width/2, height);
    Boton("Siguiente", pBotX, pBotY, tamBotX, tamBotY);
  } else if (Pantalla == 3) {

    //Página 3
    image(fondos [2], 0, 0);
    Texto("Minos había ofendido gravemente a Poseidón quien como venganza hizo que Pasifae se enamorase del animal. Fruto de dicha unión nació el Minotauro, un ser violento, mitad hombre, mitad toro, que se alimentaba de carne humana.", 0, height/15, width/2, height);
    Boton("Siguiente", pBotX, pBotY, tamBotX, tamBotY);
  } else if (Pantalla == 4) {

    //Página 4
    image(fondos [4], 0, 0);
    Texto2("Esta bestia fue encerrada en un laberinto que construyó el artesano Dédalo, un laberinto del que todo aquel que entraba nunca salía. Era devorado por el Minotauro con el que el rey Minos de Creta tenía aterrorizados a sus vecinos que todos los años le pagaban un tributo para que los dejara en paz.", 0, height/15, width, height);
    Boton("Siguiente", pBotX, pBotY, tamBotX, tamBotY);
  } else if (Pantalla == 5) {

    //Página 5
    image(fondos [5], 0, 0);
    Texto2("Mientras el Minotauro vagaba por el laberinto del palacio de Creta, ocurrió una desgracia: Andrógeno, hijo del rey Minos, fue asesinado tras ganar una olimpiada y su padre declaró la guerra a Atenas, que acabó rindiéndose. La rendición tuvo un precio: entregar siete hombres y siete mujeres al terrible laberinto. Y así lo hacía el rey de Atenas, Egeo.", 0, height/15, width, height);
    Boton("Siguiente", pBotX, pBotY, tamBotX, tamBotY);
  } else if (Pantalla == 6) {

    //Página 6
    image(fondos [6], 0, 0);
    Texto("Su hijo Teseo, príncipe de \nAtenas, estaba harto de \nperder a su gente. Quería viajar él mismo y acabar con la bestia de una vez por todas, pero también temía por su vida.", 0, height/15, width/2, height);
    Texto3("¿Atravesará Teseo la aventura?", width/50, height/5, width/2, height);
    Boton("Si, parte hacia Creta", pBotX, height/5, tamBotX, tamBotY);
    Boton("No, se queda en Atenas", pBotX, pBotY, tamBotX, tamBotY);
  } else if (Pantalla == 7) {

    //Página 7 (Opción "NO") 1er final
    image(fondos [7], 0, 0);
    Texto2("Teseo decidió que era muy descabellado para un miembro de la realeza ir a una aventura tan peligrosa, cualquier otro podría hacerlo. Pero la realidad es que nadie ha vencido ni vencerá al terrible Minotauro. El ciclo se repitó hasta que finalmente nadie quedó en Atenas", 0, height/15, width, height);
    Titulo("FIN", 0, 300, width, height);
    Boton("Volver al inicio", pBotX, pBotY, tamBotX, tamBotY);
  } else if (Pantalla == 8) {

    //Página 8 (Opción "SI") 
    image(fondos [6], 0, 0);
    Texto("Su hijo Teseo se envalentonó y zarpó junto a otros trece jóvenes para Creta mientras su padre le pedía que si lograba su propósito alzara una vela blanca en su embarcación; de lo contrario, desplegaría una de color negro.", 0, height/15, width/2, height);
    Boton("Siguiente", pBotX, pBotY, tamBotX, tamBotY);
  } else if (Pantalla == 9) {

    //Página 9
    image(fondos [8], 0, 0);
    Texto("Ariadna, la hija del rey Minos, quien estaba enamorada del joven, le ofreció ayuda en su recorrido por el laberinto. Le ofreció un ovillo de hilo para saber por dónde regresar en caso de acabar con el Minotauro.", 0, height/15, width/2, height);
    Texto3("¿Aceptará nuestro héroe la ayuda del enemigo?", width/50, height/5, width/2, height);
    Boton("Si, toda ayuda vale", pBotX, height/5, tamBotX, tamBotY);
    Boton("Puede ser una trampa...", pBotX, pBotY, tamBotX, tamBotY);
  } else if (Pantalla == 10) {

    //Página 10 (Rama Denegando ayuda de Ariadna)
    image(fondos [8], 0, 0);
    Texto("Teseo decide que no confía en la princesa de Creta, a pesar de que podría ser una gran ventaja. Así que continúa por el famoso laberinto, seguido por su atemorizada gente.", 0, height/15, width/2, height);
    Boton("Siguiente", pBotX, pBotY, tamBotX, tamBotY);
  } else if (Pantalla == 11) {

    //Página 11 (Rama Aceptando ayuda de Ariadna)
    image(fondos [8], 0, 0);
    Texto("Teseo acepta y agradece la ayuda de la princesa. Ese ovillo de hilo podría ser crucial al momento de salir del laberinto o quedar atrapado en él por el resto de sus vidas. Ató de un poste un extremo del ovillo antes de entrar.", 0, height/15, width/2, height);
    Boton("Siguiente", pBotX, pBotY, tamBotX, tamBotY);
  } else if (Pantalla == 12) {

    //Página 12 (Rama Aceptando y denegando ayuda de Ariadna)
    image(fondos [9], 0, 0);
    Texto2("El príncipe de Atenas dio un paso al frente y se ofreció el primero para adentrarse en el laberinto. Estaba muy oscuro y no sabía qué camino tomar. Cada paso conducía a una muerte segura. Se preguntaba si en el camino habría algo que lo ayude a derrotar a la bestia...", 0, height/15, width, height);
    Texto3("En la primera intersección hay dos caminos ¿Por cual debería seguir?", width/50, height/7, width/2, height);
    Boton("El de la calavera", pBotY, height/5, tamBotX, tamBotY);
    Boton("El de la antorcha", pBotX, pBotY, tamBotX, tamBotY);
  } else if (Pantalla == 13) {

    //Página 13 (Rama Aceptando y denegando ayuda de Ariadna) & (Rama de la Calavera 1)
    image(fondos [10], 0, 0);
    Texto("Teseo y sus seguidores continúan por el camino de la calavera. A lo largo del oscuro pasillo se encuentran diferentes partes óseas y telas de araña. Teseo aprovecha para fabricar un arma que lo ayude a enfrentar al Minotauro.", 0, height/15, width/2, height);
    Boton("Siguiente", pBotX, pBotY, tamBotX, tamBotY);
  } else if (Pantalla == 14) { 

    //Página 14 (Rama Aceptando y denegando ayuda de Ariadna) & (Rama de la Antorcha 1)
    image(fondos [10], 0, 0);
    Texto("Teseo y sus seguidores continúan por el camino de la antorcha. A lo largo del pasillo iluminado por la antorcha, se escuchaban los ecos de los jóvenes quienes aterrorizados rogaban a sus dioses por sus vidas.", 0, height/15, width/2, height);
    Boton("Siguiente", pBotX, pBotY, tamBotX, tamBotY);
  } else if (Pantalla == 15) {

    //Página 15 (Rama Aceptando y denegando ayuda de Ariadna) & (Rama de la Calavera 2)
    image(fondos [3], 0, 0);
    Texto("Siguieron caminando hasta encontrarse en un inmenso y oscuro salón. Un nauseabundo olor a podredumbre se sentía en el ambiente y el aire era frío y húmedo. De repente, unos ojos rojos brillantes aparecieron en la oscuridad.", 0, height/15, width/2, height);
    Boton("Siguiente", pBotX, pBotY, tamBotX, tamBotY);
  } else if (Pantalla == 16) {

    //Página 16 (Rama Aceptando y denegando ayuda de Ariadna) & (Rama de la Antorcha 2)
    image(fondos [3], 0, 0);
    Texto("Siguieron caminando hasta encontrarse en un inmenso y oscuro salón. Un nauseabundo olor a podredumbre se sentía en el ambiente y el aire era frío y húmedo. De repente, unos ojos rojos brillantes aparecieron en la oscuridad.", 0, height/15, width/2, height);
    Boton("Siguiente", pBotX, pBotY, tamBotX, tamBotY);
  } else if (Pantalla == 17) {

    //Página 17 (Rama Aceptando y denegando ayuda de Ariadna) & (Rama de la Calavera 3)
    image(fondos [11], 0, 0);
    Texto("Al ver al joven armado, el Minotauro rugió, derribó a Teseo de un empujón y lo pisoteó con sus afiladas pezuñas. Pelearon completamente a oscuras. El monstruo le estrujó entre sus brazos peludos y le azotó con su cola.", 0, height/15, width/2, height);
    Boton("Siguiente", pBotX, pBotY, tamBotX, tamBotY);
  } else if (Pantalla == 18) {

    //Página 18 (Rama Aceptando y denegando ayuda de Ariadna) & (Rama de la Calavera 4)
    image(fondos [11], 0, 0);
    Texto("Pero Teseo le agarró por los cuernos y los giró primero hacia un lado, después hace el otro. Le pateó, le embistió, forcejeó con él, y en una oportunidad, lo insartó con el arma de huesos. Finalmente la bestia profirió un balbuceo y cayó muerta.", 0, height/15, width/2, height);
    Boton("Siguiente", pBotX, pBotY, tamBotX, tamBotY);
  } else if (Pantalla == 19) {

    //Página 19  (Rama Denegando ayuda de Ariadna) & (Rama de la Calavera y Antorcha 5) 2do Final
    image(fondos [4], 0, 0);
    Texto2("Todos aclamaron al valiente príncipe. Pero el desafío aún no había acabado; al no haber aceptado la ayuda de Ariadna, estaban perdidos dentro del laberinto. Teseo y sus seguidores pasaron el resto de sus vidas tratando de encontrar la salida, mientras cada vez más jóvenes eran eviados a sufrir el mismo destino.", 0, height/15, width, height);
    Titulo("FIN", 0, 300, width, height);
    Boton("Volver al inicio", pBotX, pBotY, tamBotX, tamBotY);
  } else if (Pantalla == 20) {

    //Página 20 (Rama Denegando ayuda de Ariadna) & (Rama de la Antorcha 3)
    image(fondos [11], 0, 0);
    Texto2("El Minotauro rugió, y cegado por la luz, embistió contra Teseo. La llama que antes lo había ayudado a ver en la oscuridad del laberinto, ahora yacía sobre su pecho. Ambos pelearon prendidos en llamas entre gritos y rugidos hasta que finalmente cayeron al suelo carbonizados.", 0, height/15, width, height);
    Titulo("FIN", 0, 300, width, height);
    Boton("Volver al inicio", pBotX, pBotY, tamBotX, tamBotY);
  } else if (Pantalla == 21) {

    //Página 21 (Rama Aceptando ayuda de Ariadna) & (Rama de la Calavera 5) 3er Final 
    image(fondos [12], 0, 0);
    Texto2("Todos aclamaron al valiente príncipe, había hecho lo que nadie más había podido. Usando el hilo que había dejado en la puerta del gran salón, volvieron a la salida, sanos y salvo y Ariadna se fue con ellos. Emocionado por su victoria, a Teseo se le olvidó cambiar la vela negra por la blanca, por lo que su padre, al ver desde la Acrópolis la tela azabache, pensó que su hijo había sido devorado por el Minotauro y se arrojó al vacío.", 0, height/15, width, height);
    Titulo("FIN", 0, 370, width, height);
    Boton("Volver al inicio", pBotX, pBotY, tamBotX, tamBotY);
  }
}

//CLICK BOTONES
void mouseReleased() {
  switch(Pantalla) {
  case 0:    
    {
      if (isEnBoton(ejeBotonX, height/4, tamBotX, tamBotY)) {
        Pantalla = 1;
      }
      if (isEnBoton(ejeBotonX, height/8, tamBotX, tamBotY)) {
        Pantalla = 2;
      }
    }
    break;
  case 1:    
    {
      if (isEnBoton(width/4 + ejeBotonX, height/3, tamBotX, tamBotY)) {
        Pantalla = 0;
      }
    }
    break;
  case 2:    
    {
      if (isEnBoton(width/4 + ejeBotonX, height/3, tamBotX, tamBotY)) {
        Pantalla = 3;
      }
    }
    break;
  case 3:     
    {
      if (isEnBoton(width/4 + ejeBotonX, height/3, tamBotX, tamBotY)) {
        Pantalla = 4;
      }
    }
    break;
  case 4:
    {
      if (isEnBoton(width/4 + ejeBotonX, height/3, tamBotX, tamBotY)) {
        Pantalla = 5;
      }
    }
    break;
  case 5:
    {
      if (isEnBoton(width/4 + ejeBotonX, height/3, tamBotX, tamBotY)) {
        Pantalla = 6;
      }
    }
    break;
  case 6:
    {
      if (isEnBoton(width/4 + ejeBotonX, height/3, tamBotX, tamBotY)) {
        Pantalla = 7;
      }
      if (isEnBoton(width/4 + ejeBotonX, height/5, tamBotX, tamBotY)) {
        Pantalla = 8;
      }
    }
    break;
  case 7: 
    {
      if (isEnBoton(width/4 + ejeBotonX, height/3, tamBotX, tamBotY)) {
        Pantalla = 0;
      }
    }
    break;
  case 8: 
    {
      if (isEnBoton(width/4 + ejeBotonX, height/3, tamBotX, tamBotY)) {
        Pantalla = 9;
      }
    }
    break;
  case 9:
    {
      if (isEnBoton(width/4 + ejeBotonX, height/5, tamBotX, tamBotY)) {
        Pantalla = 11;
        decision = 11;
      }
      if (isEnBoton(width/4 + ejeBotonX, height/3, tamBotX, tamBotY)) {
        Pantalla = 10;
        decision = 10;
      }
    }
    break;
  case 10:
    {
      if (isEnBoton(width/4 + ejeBotonX, height/3, tamBotX, tamBotY)) {
        Pantalla = 12;
      }
    }
    break;
  case 11:
    {
      if (isEnBoton(width/4 + ejeBotonX, height/3, tamBotX, tamBotY)) {
        Pantalla = 12;
      }
    }
    break;
  case 12:
    {
      if (isEnBoton(width/4 + ejeBotonX, height/5, tamBotX, tamBotY)) {
        Pantalla = 13;
      }
      if (isEnBoton(width/4 + ejeBotonX, height/3, tamBotX, tamBotY)) {
        Pantalla = 14;
      }
    }
    break;
  case 13:
    {
      if (isEnBoton(width/4 + ejeBotonX, height/3, tamBotX, tamBotY)) {
        Pantalla = 15;
      }
    }
    break;
  case 15:
    {
      if (isEnBoton(width/4 + ejeBotonX, height/3, tamBotX, tamBotY)) {
        Pantalla = 17;
      }
    }
    break;
  case 17:
    {
      if (isEnBoton(width/4 + ejeBotonX, height/3, tamBotX, tamBotY)) {
        Pantalla = 18;
      }
    }
    break;
  case 18:
    {
      if (isEnBoton(width/4 + ejeBotonX, height/3, tamBotX, tamBotY)) {
        if (decision == 10) {
          Pantalla = 19;
        } else {
          Pantalla = 21;
        }
      }
    }
    break;
  case 19: //FINAL 1
    {
      if (isEnBoton(width/4 + ejeBotonX, height/3, tamBotX, tamBotY)) {
        Pantalla = 0;
      }
    }
    break;
  case 14:
    {
      if (isEnBoton(width/4 + ejeBotonX, height/3, tamBotX, tamBotY)) {
        Pantalla = 16;
      }
    }
    break;
  case 16:
    {
      if (isEnBoton(width/4 + ejeBotonX, height/3, tamBotX, tamBotY)) {
        Pantalla = 20;
      }
    }
    break;
  case 20: // FINAL 2
    {
      if (isEnBoton(width/4 + ejeBotonX, height/3, tamBotX, tamBotY)) {
        Pantalla = 0;
      }
    }
    break;
  case 21: // FINAL 3
    {
      if (isEnBoton(width/4 + ejeBotonX, height/3, tamBotX, tamBotY)) {
        Pantalla = 0;
      }
    }
    break;
  }
}
