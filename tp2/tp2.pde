// Los Simpsons

PImage img1, img2, img3, img4, img5;
PFont fuente;
int pantalla = -1;
int tiempo = 0;
float posXTexto = -300;
boolean arranca = false;

//Tamaño del boton
int botonAncho = 200;
int botonAlto = 50;

//Posicion del boton
int botonX, botonY;

void setup() {
  size(640, 480);

//Imagenes
img1 = loadImage("Familia.jpg");
img2 = loadImage("Homero Trabajando.jpg");
img3 = loadImage("Homero hablando.jpg");
img4 = loadImage("Familia 1.jpg");
img5 = loadImage("Springfield.jpg");

//Fuente de texto
fuente = loadFont("Alef-Bold-32.vlw");
textFont(fuente);
textAlign(CENTER, CENTER);

//Posicion de los botones
botonX = (width - botonAncho) / 2;
botonY = height - 70;
}

void draw() {
background(0);
  
if (!arranca) {
  
// Pantalla de inicio
image(img1, 0, 0, width, height);
fill(3, 255, 13);
rect(botonX, botonY, botonAncho, botonAlto, 10);
fill(0);
textSize(24);
text("Empezar", botonX + botonAncho / 2, botonY + botonAlto / 2);
} else {
tiempo++;

//Inicio de pantallas
if (pantalla == 0) {
image(img4, 0, 0, width, height);
textSize(22);
fill(0);
text("La familia Simpson vive su vida cotidiana en Springfield", width / 2, 20);
textSize(18);
text("Pero una accion acabara con el destino de la ciudad...", width / 2, 420);
      
if (tiempo > 200) {
pantalla = 1;
tiempo = 0;
posXTexto = -300;
}
      
} else if (pantalla == 1) {
image(img2, 0, 0, width, height);
textSize(25);
fill(255);
text("Homero en su trabajo comete un gran error...", width / 2, 30);
fill(255);
textSize(18);
text("Activando una bomba nuclear.", posXTexto, 160);
if (posXTexto < width / 3) posXTexto += 3;
if (tiempo > 300) {
pantalla = 2;
tiempo = 0;
posXTexto = -300;
}
} else if (pantalla == 2) {
image(img3, 0, 0, width, height);
fill(255);
textSize(30);
text("Homero intenta explicar el accidente...", width / 2, 20);
fill(0);
textSize(18);
text("Y el pueblo decide tomar una decisión.. :(", posXTexto, 320);
if (posXTexto < width / 2) posXTexto += 2;
if (tiempo > 400) {
pantalla = 5;
tiempo = 0;
posXTexto = -300;
}
} else if (pantalla == 5) {
image(img5, 0, 0, width, height);
fill(255);
textSize(28);
text("Expulsarlos de la ciudad...", width / 2, 40);
textSize(20);
text("Porque no le creian hasta que sucedio el desastre fatal :(", posXTexto, 320);
if (posXTexto < width / 2) posXTexto += 2;
if (tiempo > 300) {
        
//Mostrar botón de reinicio
fill(255, 3, 3);
rect(botonX, botonY, botonAncho, botonAlto, 10);
fill(0);
textSize(20);
text("Volver", botonX + botonAncho / 2, botonY + botonAlto / 2);
}
}
}
}
void mousePressed() {

//Botón de inicio
if (!arranca && mouseX > botonX && mouseX < botonX + botonAncho &&
mouseY > botonY && mouseY < botonY + botonAlto) {
arranca = true;
pantalla = 0;
tiempo = 0;
}
//Botón de reinicio
if (arranca && pantalla == 5 && tiempo > 300 &&
mouseX > botonX && mouseX < botonX + botonAncho &&
mouseY > botonY && mouseY < botonY + botonAlto) {
pantalla = -1;
arranca = false;
tiempo = 0;
posXTexto = -300;
}
}
