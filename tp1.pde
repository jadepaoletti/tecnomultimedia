//Sketch
size(400,400);
background(180);
fill(0);
ellipse(200,200,400,400);

//COLORES TERCIARIOS
noStroke();
//Naranja-------------
fill(255,128,0); 
ellipse(275,70,100,100);
//Lima----------------
fill(191, 255, 0); 
ellipse(350,200,100,100);
//Verde Cian----------
fill(0,255,128); 
ellipse(275,330,100,100);
//Azur----------------
fill(0,113,188); 
ellipse(125,330,100,100);
//Violeta-------------
fill(180,0,255); 
ellipse(50,200,100,100);
//Fucsia--------------
fill(255,0,180); 
ellipse(125,70,100,100);

// COLORES RGB
//Rojo----------------
fill(255,0,0); 
ellipse(200,50,100,100);
//Verde---------------
fill(0,255,0); 
ellipse(330,275,100,100); 
//Azul----------------
fill(0,0,255); 
ellipse(70,275,100,100); 

//COLORES YCM
//Amarillo------------
fill(255,255,0); 
ellipse(330,125,100,100); 
 //Cian---------------
fill(0,255,255);
ellipse(200,350,100,100); 
//Magenta-------------
fill(255, 0, 225); 
ellipse(70,125,100,100);

//Circulos exterior-interior
noFill();
stroke(0);
strokeWeight(20);
ellipse(200,200,400,400);
fill(255);
ellipse(200,200,185,185);

//Circulos Centrales
fill(255);
ellipse(200,200,150,150);
ellipse(200,200,100,100);

//Cruz Central
fill(0);
noStroke();
ellipse(225,225,45,45); //abajo der.
ellipse(225,175,45,45); //arriba der.
ellipse(175,225,45,45); //abajo izq.
ellipse(175,175,45,45); //arriba izq. 

//Estrella
noFill();

strokeWeight(5);
stroke(150);
triangle(275,70,50,200,275,330); //Terciarios
triangle(125,70,350,200,125,330);
stroke(200);
triangle(70,125,330,125,200,350); //Secundarios
stroke(255);
triangle(200,50,330,275,70,275); //Primarios
