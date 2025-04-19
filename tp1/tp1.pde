PImage plantonImg;
void setup() {
size(800, 400);
plantonImg = loadImage("planton.png");
}
void draw() {
background(20, 20, 30); // Fondo izquierdo
drawRightBackground(); // Fondo derecho

//Línea divisoria
stroke(100);
strokeWeight(2);
line(width / 2, 0, width / 2, height);

//Imagen de Planton
imageMode(CENTER);
image(plantonImg, width / 4, height / 2, 400, 400);

//Dibujo de Planton
drawPlanton(600, 200);

//Posición del mouse
println("Posicion X: " + mouseX + ", Posicion Y: " + mouseY);
}
void drawRightBackground() {
  
//Fondo de 400 x 800)
noStroke();
fill(154, 200, 200); // color
rect(800, 0, 800, 800); // fondo completo lado derecho
}
void drawPlanton(float x, float y) {
  
//Cuerpo
fill(120, 170, 170);//Color del cuerpo
stroke(0);//Color
strokeWeight(2);//Grosor del borde
ellipse(x, y, 60, 200);

//Color de la antena
stroke(5, 100, 50);//Color del trazo de la antena
strokeWeight(6);//Grosor del trazo 
//Antenas
//Antena derecha
bezier(x + 15, y - 90, x + 20, y - 120, x + 30, y - 140, x + 40, y - 160);
//Antena izquierda
bezier(x - 15, y - 90, x - 20, y - 120, x - 30, y - 140, x - 40, y - 160);
   
//Ceja
stroke(60, 75, 70); //Color
strokeWeight(6); //Grosor
bezier(x - 30, y - 75,// punto inicial
x - 8, y - 60,// control 1 (baja la panza de la curva)
x + 5, y - 60,// control 2 (sigue la panza de la curva)
x + 10, y - 65);// punto final

//Ojo
//Borde
stroke(0); // Borde negro
strokeWeight(2);// borde fino
//Pupila amarilla
fill(230, 230, 160); //Color
ellipse(x, y - 35, 55, 45); //Tamaño
//Pupila roja
fill(255, 0, 0); //Color
ellipse(x, y - 35, 20, 20); //Tamaño
//Pupila blanca
fill(255); //Color
ellipse(x, y - 39, 8, 8); //Tamaño
  
// Boca
fill(100, 40, 40);
rectMode(CENTER);
rect(x, y + 30, 35, 53, 100);
  
//Lengua
fill(250, 190, 190);
rectMode(CENTER);
rect(x, y + 50, 20, 15, 5);
  
// Dientes
fill(255, 255, 255);
noStroke();
rectMode(CENTER);
rect(x, y + 10, 30, 13, 5);

// Divisiones de dientes
stroke(0); // negro
strokeWeight(1.5);
line(x - 11, y + 5, x - 11, y + 15);
line(x, y + 5, x, y + 15);
line(x + 11, y + 5, x + 11, y + 15);
  
// Brazos con borde
strokeWeight(8); // Borde un poco más grueso
stroke(0);       // Negro

// Brazo derecho (borde)
line(x - 30, y, x - 50, y + 30);
line(x + 30, y, x + 50, y + 30);
// Mano derecha (borde)
line(x + 50, y, x + 75, y + 5);
// Brazo izquierdo (borde)
line(x - 60, y, x - 50, y + 30);
line(x + 60, y, x + 50, y + 30);
// Mano izquierda (borde)
line(x - 50, y, x - 75, y + 5);

//Brazos generales
strokeWeight(4);
stroke(120, 170, 170);

//Brazo derecho
line(x - 30, y, x - 50, y + 30);
line(x + 30, y, x + 50, y + 30);
//Mano derecha
line(x + 50, y, x + 75, y + 5);
//Brazo izquierdo
line(x - 60, y, x - 50, y + 30);
line(x + 60, y, x + 50, y + 30);
// Mano izquierda
line(x - 50, y, x - 75, y + 5);

//Patitas con borde
strokeWeight(11); //Borde
stroke(0);//Color
line(x - 14, y + 90, x - 20, y + 140);
line(x + 15, y + 90, x + 15, y + 140);

strokeWeight(8); //Patita real
stroke(120, 170, 170); //Color original
line(x - 13, y + 80, x - 20, y + 140);
line(x + 15, y + 80, x + 15, y + 140);
}
