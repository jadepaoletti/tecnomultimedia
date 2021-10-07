void Creditos(String creditos_, float xcred_, float ycred_, float tamxcred_, float tamycred_) {
  pushStyle();
  pushMatrix();

  textSize(30);
  textFont(fuenteBotones);
  textLeading(50);
  textAlign(CENTER);
  fill(255);
  text(creditos_, xcred_, ycred_, tamxcred_, tamycred_);

  popStyle();
  popMatrix();
}

void Texto(String texto_, float xtex_, float ytex_, float tamxtex_, float tamytex_) {
  pushStyle();
  pushMatrix();

  textFont(fuenteBotones);
  textLeading(50);
  textAlign(LEFT);
  fill(255);
  text(texto_, xtex_ + offsetX, ytex_, tamxtex_, tamytex_);
  

  popStyle();
  popMatrix();
}

void Texto2(String texto2_, float xtex2_, float ytex2_, float tamxtex2_, float tamytex2_) {
  pushStyle();
  pushMatrix();
  
  textFont(fuenteBotones);
  textLeading(50);
  textAlign(CENTER);
  fill(255);
  text(texto2_, xtex2_, ytex2_, tamxtex2_, tamytex2_);
  

  popStyle();
  popMatrix();
}

//Preguntas del camino

void Texto3(String texto3_, float xtex3_, float ytex3_, float tamxtex3_, float tamytex3_) {
  pushStyle();
  pushMatrix();
  
  textFont(fuenteBotones);
  textLeading(50);
  textAlign(LEFT);
  text(texto3_, xtex3_, ytex3_ + offsetY, tamxtex3_, tamytex3_);
  

  popStyle();
  popMatrix();
}
