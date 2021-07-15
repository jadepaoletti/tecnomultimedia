int tam, z, dire, contador;
boolean cambio;

void setup() {
  size(500, 450);
  tam = 50;
  surface.setResizable(true);
  cambio = (false);
}

void draw() { 
  rectMode(CENTER);
  if (contador%10==0) {
    stroke(random(30, map(mouseX, 0, width, 200, width)), 0, random(30, map(mouseY, 0, height, 200, height)));
  }

  strokeWeight(3);

  z = 0;
  dire = 1;
  contador++;
  /*if(contador%120==0){
  
  cambio = !cambio;
  }*/

  for (int fila = 0; fila < height; fila += tam) {

    boolean negro = true;
    
    for (int columna = 0; columna < width+tam; columna += tam) {
      if (negro) {
        fill(0);
        if(cambio){
        fill(255);
        }
      } else {
        fill(255);
        if(cambio){
        fill(0);
        }
      }

      rect(columna + z, fila + (tam / 2), tam, tam);

      negro = !negro;
    }

    z += 12.5 * dire;
    if (z >= 20) {
      dire = -1;
    }
    if (z <= 0) {
      dire = 1;
    }
  }
}

void mousePressed() {
  cambio = !cambio;
}
