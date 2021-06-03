PImage fondo, fondo2, pata;
PFont fuente;
int a; 

void setup() {
  size (600, 400);
  fondo = loadImage("imagen1.png");
  fondo2 = loadImage("imagen2.png");
  imageMode(CENTER);
  fuente = createFont("Sun zoom spark.ttf", 50);
  a = 0;

  // TITULO
  background(0);
  image(fondo, width/2, height/2, width, height);
}

void draw () {
  textFont(fuente);
  a = a+1;
  fill(mouseX,  random(150,200), mouseY);

  //1era pantalla
  if (a>120 && a<240) {
    image(fondo2, width/2, height/2, width, height);
    textSize(30);
    textAlign(CENTER);
    text("CO - STARRING", width/2, 100);

    textSize(40);
    textAlign(RIGHT);
    text("WAYNE PERE \n ISAAC WHITE \n PHILIP FORNAH \n JAIDEN KAINE", width/2, 170);

    textSize(20);
    textAlign(LEFT);
    text("    LAWRENCE FREMER \n \n     DANIEL \n \n     GUIDE 1 \n \n     KENYAN POLICEMAN", width/2, 170);
  }

  // 2da pantalla
  if (a>240 && a<360) {
    image(fondo2, width/2, height/2, width, height);
    textSize(30);
    textAlign(CENTER);
    text("CO - STARRING", width/2, 100);

    textSize(40);
    textAlign(RIGHT);
    text("BRANDON SCOTT STACY \n SHANE JACOBSEN \n GARRETT KRUITHOF \n JAY S. POTTER \n STELLA ALLEN", width/2, 170);

    textSize(20);
    textAlign(LEFT);
    text("    BLAINE \n \n     RUDY \n \n     AUSTRALIAN DUDE \n \n     REPORTER \n \n     FREMER'S DAUGHTER", width/2, 170);
  }

  // 3era pantalla
  if (a>360 && a<480) {
    image(fondo2, width/2, height/2, width, height);
    textSize(20);
    textAlign(CENTER);
    text("UNIT PREODUCTION MANAGER", width/2, 100);

    textSize(40);
    text("CYNDI BENNER", width/2, 150);

    textSize(20);
    text("FIRST ASSISTANT DIRECTOR", width/2, 200);

    textSize(40);
    text("ROBERT SCHROER", width/2, 250);

    textSize(20);
    text("SECOND ASSISTANT DIRECTOR", width/2, 300);

    textSize(40);
    text("JASON ALTIERI", width/2, 350);
  }

  // 4ta pantalla
  if (a>480 && a<600) {

    image(fondo2, width/2, height/2, width, height);
    textSize(20);
    textAlign(CENTER);
    text("CASTING BY", width/2, 100);

    textSize(40);
    text("DONNA ROSEINSTEIN, CSA", width/2, 150);

    textSize(20);
    text("RON DIGMAN", width/2, 180);

    textSize(20);
    text("NEW ORLEANS CASTING BY", width/2, 250);

    textSize(40);
    text("MEAGAN LEWIS, CSA", width/2, 300);
  }

  // 5ta pantalla
  if (a>600 && a<720) {
    image(fondo2, width/2, height/2, width, height);
    textSize(20);
    textAlign(RIGHT);
    text("ART DIRECTOR \n \n SET DECORATOR \n \n LOCATIONS MANAGER \n \n PROPERTY MASTER \n \n PRODUCTION ACCONUNTANT \n \n 1ST ASSISTANT ACCOUNTANT", width/2, 100);

    textSize(40);
    textAlign(LEFT);
    text("     JAY HINKLE \n     KRISTIN BICKSLER \n     JOHN JOHNSTON \n     MICHAEL MARTIN \n     CARI STORY \n     EMMA FULLER", width/2, 100);
  }

  // 6ta pantalla
  if (a>720 && a<840) {
    image(fondo2, width/2, height/2, width, height);
    textSize(20);
    textAlign(RIGHT);
    text("CHIED LIGHTING TECHNICIAN \n \n FIRST COMPANY GRIP \n \n A CAMERA OPERATOR \n \n B CAMERA OPERATOR \n \n PRODUCTION SOUND MIXER", width/2, 120);

    textSize(40);
    textAlign(LEFT);
    text("     MAX POMERLEAU \n     CHRIS EKSTROM \n     COLIN HUDSTON \n     REMI TOURNOIS \n     DAN IZEN", width/2, 120);
  }
}
