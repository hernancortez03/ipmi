//Hernan Cortez 120291/5 
//Obra de triangulos flasheros con imagen de referencia
//Comisión 1
// https://youtu.be/fkewqDhsPaY?feature=shared
PImage referencia;
boolean coloresRandom = false;
int velocidadcolor = 20;

//12 colores variables individuales de los triangulos
color c0, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11;
color fondoSuperior; // Color del triangulo superior
color fondoInferior; // Color del triangulo inferior
float anguloRotacion = 0;
boolean rotando = false;

//Imagen A 800x400 y referencia de la foto a la izquierda
void setup() {
size(800, 400);                    
referencia = loadImage("Processing.jpg");
referencia.resize(width / 2, height);  
noStroke();
fondoSuperior = color(0);   
fondoInferior = color(255); 
coloresAleatorios();        
}

void draw() {
background(255);
image(referencia, 0, 0); //Imagen referencia ubicada a la izquierda

//Cambio automatico de colores aleatorios
if (coloresRandom && frameCount % velocidadcolor == 0) {
coloresAleatorios();
fondoSuperior = color(random(50, 205), random(50, 205), random(50, 205));
fondoInferior = color(random(50, 205), random(50, 205), random(50, 205));
}

//Rotacion de la obra a la derecha
if (rotando) {
anguloRotacion += 0.01;
}
push();
translate(width / 2 + 200, 200);
rotate(anguloRotacion);
translate(-200, -200);

//Efecto de luz acercando el mouse
fill(brilloSegunMouse(fondoSuperior));
triangle(0, 0, 400, 0, 400, 400);
dibujotriangulo(); // 12 triángulos

//Triangulo grande inferior rotado como espejo del de arriba
push();
translate(400, 400);
rotate(PI);
fill(brilloSegunMouse(fondoInferior));
triangle(0, 0, 400, 0, 400, 400);
pop();

//Triangulos chicos invertidos encima
dibujotrianguloInvertido();
pop();
}

//FUNCIONES PROPIAS IMPORTANTE

//Funcion que NO retorna valor (void) con parametros
void dibujotriangulo(float x, float y, float tam) {
triangle(x, y, x + tam, y, x + tam, y + tam);
}

//Funcion que evita que el color tenga números invalidos
float limitar(float valor) {
if (valor < 0) return 0;
else if (valor > 255) return 255;
else return valor;
}

//Funcion que retorna valor en este caso color más oscuro o más claro segun que tan cerca este el mouse del centro de la pantalla
color brilloSegunMouse(color base) {
float d = dist(mouseX, mouseY, width / 2, height / 2);
float factor = map(d, 0, width / 2, 0.5, 1);  
float r = limitar(red(base) * factor);
float g = limitar(green(base) * factor);
float b = limitar(blue(base) * factor);  
return color(r, g, b);
}

//Ciclos FOR anidados que dibujan los 12 triangulos cambiando tamaño y color
void dibujotriangulo() {
float offsetInicial = 20;
int cantidad = 12;

for (int fila = 0; fila < cantidad; fila++) {
float x = offsetInicial + fila * 15;
float y = offsetInicial + fila * 15;
float tam = 360 - fila * 30;

if (coloresRandom) {
if (fila == 0) fill(c0);
else if (fila == 1) fill(c1);
else if (fila == 2) fill(c2);
else if (fila == 3) fill(c3);
else if (fila == 4) fill(c4);
else if (fila == 5) fill(c5);
else if (fila == 6) fill(c6);
else if (fila == 7) fill(c7);
else if (fila == 8) fill(c8);
else if (fila == 9) fill(c9);
else if (fila == 10) fill(c10);
else if (fila == 11) fill(c11);
}else {
color base = (fila % 2 == 0) ? color(255) : color(0);
fill(brilloSegunMouse(base));
}
dibujotriangulo(x, y, tam);
}
}

void dibujotrianguloInvertido() {
push();
translate(400, 400);
rotate(PI);
float offsetInicial = 20;
int cantidad = 12;

for (int fila = 0; fila < cantidad; fila++) {
float x = offsetInicial + fila * 15;
float y = offsetInicial + fila * 15;
float tam = 360 - fila * 30;

if (coloresRandom) {
if (fila == 0) fill(c0);
else if (fila == 1) fill(c1);
else if (fila == 2) fill(c2);
else if (fila == 3) fill(c3);
else if (fila == 4) fill(c4);
else if (fila == 5) fill(c5);
else if (fila == 6) fill(c6);
else if (fila == 7) fill(c7);
else if (fila == 8) fill(c8);
else if (fila == 9) fill(c9);
else if (fila == 10) fill(c10);
else if (fila == 11) fill(c11);
} else {
color base = (fila % 2 == 0) ? color(0) : color(255);
fill(brilloSegunMouse(base));
}
dibujotriangulo(x, y, tam);
}
pop();
}

//CONDICIONALES if - else y funcion del TECLADO
void keyPressed() {
if (key == 'a') {
coloresRandom = true;
} else if (key == 'p') {
coloresRandom = false;
fondoSuperior = color(0);
fondoInferior = color(255);
} else if (key == 'v') {
velocidadcolor = max(1, velocidadcolor - 5);
} else if (key == 'n') {
velocidadcolor += 5;
} else if (key == 'e') {
rotando = true;
} else if (key == 'g') {
rotando = false;
anguloRotacion = 0;
}
}

//Colores aleatorios
void coloresAleatorios() {
c0 = color(random(50, 205), random(50, 205), random(50, 205));
c1 = color(random(50, 205), random(50, 205), random(50, 205));
c2 = color(random(50, 205), random(50, 205), random(50, 205));
c3 = color(random(50, 205), random(50, 205), random(50, 205));
c4 = color(random(50, 205), random(50, 205), random(50, 205));
c5 = color(random(50, 205), random(50, 205), random(50, 205));
c6 = color(random(50, 205), random(50, 205), random(50, 205));
c7 = color(random(50, 205), random(50, 205), random(50, 205));
c8 = color(random(50, 205), random(50, 205), random(50, 205));
c9 = color(random(50, 205), random(50, 205), random(50, 205));
c10 = color(random(50, 205), random(50, 205), random(50, 205));
c11 = color(random(50, 205), random(50, 205), random(50, 205));
}
