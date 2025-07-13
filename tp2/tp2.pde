//h
// Hernan Cortez 120291/5

// Variables
int mivariable;
int pantalla;
int mitiempo;

PImage miImagen1, miImagen2, miImagen3, miImagen4, miImagen5, miImagen6;
PFont miTexto, miTexto2;
PFont LosSimpsons;

float posX;

// Botón y textos
String texto1, texto2, texto3, texto4, texto5;

int px, py, ancho, alto;
boolean arranca = false;

int reiniciarAncho = 100;
int reiniciarAlto = 30;

void setup() {
size(640, 480);
background(255);

mivariable = 0;
pantalla = 0;
mitiempo = 0;

miImagen1 = loadImage("Familia.jpg");
miImagen2 = loadImage("Homero Trabajando.jpg");
miImagen3 = loadImage("Homero hablando.jpg");
miImagen4 = loadImage("Familia corriendo.jpg");
miImagen5 = loadImage("Springfield.jpg");
miImagen6 = loadImage("Simpson Portada.jpg");

miTexto = loadFont("font1.vlw");
miTexto2 = loadFont("font2.vlw");
LosSimpsons = loadFont("font2.vlw");

ancho = 200;
alto = 50;
px = 20;
py = 420;

texto1 = "La familia Simpson vive su vida cotidiana en Springfield.";
texto2 = "Cuando un desastre ecológico amenaza la ciudad,\nHomero debe salvar a todos.";
texto3 = "Los Simpson son declarados enemigos públicos y deben huir.";
texto4 = "En el exilio, la familia enfrenta pruebas y se une más que nunca.";
texto5 = "Con valentía y humor, regresan para salvar Springfield y el día.";

textFont(LosSimpsons);
textAlign(LEFT);

posX = 10;
}

void draw() {
if (!arranca) {
fill(255);
rect(px, py, ancho, alto);
fill(0);
image(miImagen6, 0, 0, 640, 480);
textSize(28);
text("Empezar!!", px + 20, py + 35);
} else {
mitiempo += 2;

int pantallaAnterior = pantalla;
if (mitiempo > 0 && mitiempo < 400) pantalla = 0;
else if (mitiempo < 800) pantalla = 1;
else if (mitiempo < 1100) pantalla = 2;
else if (mitiempo < 1700) pantalla = 3;
else if (mitiempo < 2300) pantalla = 4;
else if (mitiempo < 3200) pantalla = 5;

if (pantalla != pantallaAnterior) posX = 20;

mivariable++;
stroke(0);
strokeWeight(1);
fill(255);

if (pantalla == 0) {
background(0);
image(miImagen1, 0, 0, 640, 480);
textFont(miTexto2);
textSize(20);
fill(0);
text("Los Simpson disfrutan de su vida cotidiana,\npero una crisis inesperada está por llegar a sus vidas.", 100, mivariable, 400, 100);

int c1 = color(21, 35, 111, 255);
int c2 = color(203, 209, 237, 255);
fill(lerpColor(c1, c2, map(posX, 20, width, 0, 1)));
text(texto1, posX, 355, 600, 200);
posX += 0.5;

} else if (pantalla == 1) {
background(255, 0, 0);
image(miImagen2, 0, 0, 640, 480);
textFont(miTexto2);
textSize(20);
fill(0);
text("Homero accidentalmente causa un desastre ecológico\nque pone en peligro a Springfield y a su familia.", 20, 50, 600, 400);
fill(lerpColor(color(191, 109, 196), color(146, 38, 152), map(posX, 20, width, 0, 1)));
textFont(LosSimpsons);
textSize(20);
text(texto2, posX, 355, 600, 200);
posX += 0.5;

} else if (pantalla == 2) {
background(0, 255, 0);
image(miImagen3, 0, 0, 640, 480);
textFont(miTexto2);
textSize(25);
text("La familia es acusada injustamente y debe huir\npara evitar ser capturados por la ley.", 20, 50, 600, 400);
fill(lerpColor(color(255), color(255, 0, 0, 0), map(posX, 20, width, 0, 1)));
textFont(LosSimpsons);
textSize(20);
text(texto3, posX, 355, 600, 200);
posX += 0.5;

} else if (pantalla == 3) {
background(0, 255, 0);
image(miImagen4, 0, 0, 640, 480);
textFont(miTexto2);
textSize(25);
fill(255);
text("En el exilio enfrentan peligros y dificultades,\npero su amor y humor los mantienen unidos.", 20, 50, 600, 400);
fill(lerpColor(color(220), color(255, 255, 255, 150), map(posX, 20, width, 0, 1)));
textFont(LosSimpsons);
textSize(20);
text(texto4, posX, 355, 600, 200);
posX += 0.5;

} else if (pantalla == 4) {
textFont(miTexto2);
textSize(25);
fill(255, 0, 0);
image(miImagen5, 0, 0, 640, 480);
fill(255);
text("Con valentía y mucho ingenio,\nla familia regresa para salvar Springfield\n y restaurar la paz.", 20, 80, 300, 500);
fill(lerpColor(color(255, 204, 193), color(255, 255, 255, 150), map(posX, 20, width, 0, 1)));
textFont(LosSimpsons);
textSize(20);
text(texto5, posX, 355, 600, 200);
posX += 0.5;

} else if (pantalla == 5) {
background(0, 255, 0);
textFont(miTexto);
textSize(30);
image(miImagen6, 0, 0, 640, 480);
fill(5);
text("FIN", width / 4, height / 4);

fill(255);
rect(px, py, reiniciarAncho, reiniciarAlto);
fill(0);
textSize(20);
textAlign(CENTER, CENTER);
text("Volver", px + reiniciarAncho / 2, py + reiniciarAlto / 2);
textAlign(LEFT);
noStroke();
}
}
}

void mousePressed() {
if (!arranca && mouseX > px && mouseX < px + ancho && mouseY > py && mouseY < py + alto) {
arranca = true;
mitiempo = 1;
} else if (pantalla == 5 && mouseX > px && mouseX < px + reiniciarAncho && mouseY > py && mouseY < py + reiniciarAlto) {
mitiempo = 0;
mivariable = 0;
arranca = false;
posX = 10;
}

println(mouseX + " + " + mouseY);
println(frameCount);
}
