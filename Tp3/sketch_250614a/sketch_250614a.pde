// Hernan Cortez 120291/5
//Obra cuadros de cuadrados flasheros
PImage referencia;
//Cantidad de cuadrados
int niveles = 12;
float desplazamiento = 0;
float velocidad = 0.01;
boolean animar = true;

void setup() {
//Tamaño del trabajo
size(800, 400);
referencia = loadImage("Processing.jpg"); // Imagen de referencia
referencia.resize(width / 2, height);
rectMode(CENTER);
noFill();
}
void draw() {
background(255);
image(referencia, 0, 0); // Imagen de referencia a la izquierda

clip(width / 2, 0, width / 2, height); // Zona derecha del túnel
translate(width * 0.75, height / 2); // Centro óptico

if (animar) {
desplazamiento = (desplazamiento + velocidad) % 1;
}

//Funciones del ciclo FOR anidados que pidieron
for (int i = 0; i < niveles; i++) {
for (int j = 0; j < 1; j++) {
float posicion = (i / float(niveles) + desplazamiento) % 1;
float tamaño = calcularTamaño(posicion); // Función con retorno
int colorLinea = (i % 2 == 0) ? 0 : 255;
dibujarCuadroTunel(tamaño, colorLinea); // Función sin retorno
}
}

noClip();
}

//Función de retorno
float calcularTamaño(float p) {
//Tamaño de la profundidad
return map(p, 0, 1, height * 1.2, 40);
}

//Funcion encargada de hacer los cuadros sin retorno
void dibujarCuadroTunel(float tamaño, int colorLinea) {
stroke(colorLinea);        // Blanco o negro
strokeWeight(22);          // Grosor de las líneas
rect(0, 0, tamaño, tamaño); // Dibuja el cuadrado centrado
}

// Función de arranque del la animación
void keyPressed() {
if (key == 'a') {
    
//Reincia la animación
animar = !animar;
} else if (key == 'r') {
// Reinicia la animacion
desplazamiento = 0;
velocidad = 0.01;
animar = true;
} else if (key == 'e') {
velocidad = random(0.005, 0.03); // Cambiar velocidad aleatoriamente
}
}
