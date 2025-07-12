//https://youtu.be/IVR3TiFI4gI





//variables

PImage imagen;             
color colorDegrade;       

int columnas = 8;          
int filas = 13;            

float anchoRect;           
float altoRect;            



void setup() {
  size(800, 400);                          
  
  //asignar valor  a las variables
  imagen = loadImage("F_1.jpg");            
  colorDegrade = color(0);                  
  anchoRect = width / 2 / columnas;       
  altoRect = height / float(filas);         
  noLoop();                                
}



void draw() {
  background(255);                    

  // pone la imagen a la mitad izquierda
  image(imagen, 0, 0, width / 2, height);

  // nos movemos a la mitad dertecha para no dibujar sobre la imagen
  translate(width / 2, 0);

  dibujarCuadricula();
}


// funcion sin retorno
void dibujarCuadricula() {
  for (int col = 0; col < columnas; col++) {
    for (int fil = 0; fil < filas; fil++) {

      //para saber si la fila es par o impar
      boolean sentidoNormal = fil % 2 == 0;

    
      dibujarRectangulo(col * anchoRect, fil * altoRect, anchoRect, altoRect, sentidoNormal);
    }
  }
}

// funcion con retorno
color obtenerColor(float porcentaje, boolean sentidoNormal) {
  
  
  if (!sentidoNormal) porcentaje = 1 - porcentaje;   // invertir el degradado
  
  
  return lerpColor(color(255), colorDegrade, porcentaje);  // obtener los colores para el degradado
}

// funcion sin retorno para dibujar los rectangulos con degrade
void dibujarRectangulo(float x, float y, float w, float h, boolean sentidoNormal) {
              
  
  // distintos valores entre 0 y 1 para generar todas las lineas necesarias para el degrade
  for (int i = 0; i < int(w); i++) {               
    float pct = map(i, 0, w, 0, 1);                 
    stroke(obtenerColor(pct, sentidoNormal));       
    line(x + i, y, x + i, y + h);                   
  }
}



void keyPressed() {
  // cambiamos el color del degrade segun la tecla
  if (key == 'r') colorDegrade = color(255, 0, 0);      // rojo
  else if (key == 'g') colorDegrade = color(0, 255, 0); // verde
  
  else if (key == 'b') colorDegrade = color(0, 0, 255); // azul
  
  
  else if (key == 'x') colorDegrade = color(0);         // reiniciar a negro

  redraw(); // redibuja la pantalla con el nuevo color
}
