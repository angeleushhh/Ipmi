PImage img1 , img2, img3;
String texto1, texto2, texto3, texto4;
float posX, posY, velY , velX, tamaño, velTamaño;
int estado;
PFont fuente;
color colorCirculo;

void setup(){
  background(0);
 size (640,480);
 
 //fuente
 fuente= loadFont ("ComicSansMS-48.vlw");
 textFont(fuente);
 textAlign(LEFT);
 textSize(20);
 
 //color
 
colorCirculo = color (255);
 
 //variables de movimiento
 posX= 0;
 posY= 0;
 velX=1;
 velY=1;
 tamaño= 1;
 velTamaño = 0.420;

 
 //imagenes
 img1 =loadImage ("imagenipmi1.jpg");
 img2 =loadImage ("imagenipmi2.jpg");
 img3 =loadImage ("imagenipmi3.jpg");
 
 //textos
 
 texto1 = "The Crossing es una instalación\n de video del artista Bill Viola,creada en 1996.\nMuestra a un hombre caminando hacia la cámara,\n mientras en una pantalla es envuelto por fuego y en otra,por agua.\nLas secuencias, proyectadas en cámara lenta,\ninvitan a la contemplación y resaltan la fuerza\nsimbólica de estos elementos.";
 texto2= "La obra aborda temas como la transformación\ny la dualidad. El fuego representa la destrucción,\n y el agua, la purificación.\n Inspirado en tradiciones espirituales,\n Viola sugiere que para alcanzar la trascendencia,\n uno debe dejar atrás el ego, simbolizado por\n la desaparición del hombre.";
 texto3= "Considerada una obran\n clave del videoarte,\n The Crossing destaca por su\n uso de tecnología para\n crear una experiencia\n emocional profunda.\n Viola manipula el tiempo y logra\n que el espectador reflexione sobre la vida,\n la muerte y la espiritualidad a través\n de la observación prolongada.";

//estado

estado=1;

}
void draw () {
  
  println (frameCount);

if (estado == 1) {
   
  image (img1,0,0,width,height);
  fill (#FF33FF00);
  text (texto1,posX-300,200);
   
   if (posX>=0) {
     
    posX = posX + velX;
    
    if (posX>300) {
      
      velX =0;
    }
    
   }
}
   
if( frameCount >= 650) {
  
  estado = 2;
  
}
 
if ( estado== 2) {
image (img2,0,0,width,height);

text (texto2,width/-400,posY-100);

 if (posY>=0) {
   
   
   posY= posY + velY;
   
   if (posY>= 400) {
     
     velY = 0;
   }

}
}

if (frameCount>=1150) {
  
  estado = 3;
  
}
  
if (estado==3){
  
  image (img3,0,0, width, height);
  textSize (tamaño);  
  text (texto3,0,75);
  
  if (tamaño <30) {
    
    tamaño = tamaño + velTamaño;
  }
  if (tamaño>=40) {
    
    velTamaño = 0;
    
  }
  
}
  
  if (frameCount>= 1400) {
    estado = 4;
}
 if ( estado == 4) {   
   
   float d1 = dist (mouseX, mouseY, width/2, height/2);
   int r1 = 50/2 ;
   background (255);
   fill (colorCirculo);
   ellipse (width/2, height/2, 50,50);
   
   if (d1 < r1) {
     
  colorCirculo = color (#FF33FF00);
    
   } else {
     
     colorCirculo = color (255);
     
   }
   fill (0);
   textSize(10);
   text ("reiniciar", width/2-20, height/2);
}
}
 
 void mouseClicked () {
   float d1 = dist (mouseX, mouseY, width/2, height/2);
   int r1 = 50/2 ;
   
  if ( estado ==4 ) {
   if (d1 < r1) {
    frameCount = 0;
    
    estado = 1;
    posX= 0;
    posY= 0;
    tamaño= 1;
    velX = 1;
    velY=1 ;
    velTamaño= 1;
    textSize(20);
   } 
} 
}
  
