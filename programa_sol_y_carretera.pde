int carX;                // Posición x del auto
int carY = 300;          // Posición y del auto
int carWidth = 50;       // Ancho del auto
int carHeight = 30;      // Altura del auto
int roadWidth = 200;     // Ancho de la carretera
float cloudX = 0;        // Posición x de la nube
float cloudY = 100;      // Posición y de la nube
int cloudSize = 60;      // Tamaño de la nube
int sunX = 50;           // Posición x del sol
int sunY = 100;          // Posición y del sol
float sunSize = 80.0;    // Tamaño del sol

void setup() {
  size(400, 400);
  carX = width / 2;      // Inicializar la posición x del auto al centro de la ventana
}

void draw() {
  // Fondo del cielo
  background(135, 206, 250); // Cielo azul claro
  
  // Dibujar el sol
  fill(255, 255, 0); // Color amarillo
  ellipse(sunX, sunY, sunSize, sunSize);
  
  // Mover el sol de izquierda a derecha
  sunX = (sunX + 1) % width;
  
  // Dibujar la carretera
  fill(100);
  rect(width/2 - roadWidth/2, height - 100, roadWidth, 100);
  
  // Dibujar el auto
  fill(255, 0, 0); // Auto rojo
  rect(carX, carY, carWidth, carHeight);
  
  // Dibujar nubes
  drawCloud(cloudX, cloudY);
  drawCloud(cloudX + 150, cloudY - 40);
  
  // Mover las nubes de derecha a izquierda
  cloudX = (cloudX + 0.5) % width;
}

void drawCloud(float x, float y) {
  noStroke();
  fill(255);
  ellipse(x, y, cloudSize, cloudSize);
  ellipse(x + 20, y - 10, cloudSize + 20, cloudSize);
  ellipse(x + 40, y, cloudSize, cloudSize);
}

void mouseMoved() {
  // Mover el auto horizontalmente con el movimiento del mouse
  carX = constrain(mouseX, width/2 - roadWidth/2, width/2 + roadWidth/2 - carWidth);
}
