import ddf.minim.*;
import ddf.minim.analysis.*;

Circulo circulo;
color colorCirculo;
Minim minim;
AudioInput in;
FFT fft;

void setup() {
  size(1080, 720);
  //inicializo el objeto minim
  minim = new Minim(this);
  //conexión con la linea de entrada de sonido
  in = minim.getLineIn(Minim.MONO, 256);
  //analisis de sonido en la transformada de Fourier
  fft = new FFT(in.bufferSize(), in.sampleRate());
  //inicializo el objeto circulo
  colorCirculo = color (random(0, 255), random(0, 255), random(0, 255));
  circulo = new Circulo (random(0, width), random(0, height), 3, 5, int (fft.getBand(100)*150), colorCirculo );
}

void draw() {
  fft.forward(in.mix);
  //genero un color nuevo en cada iteracion del draw
  colorCirculo = color (random(0, 255), random(0, 255), random(0, 255));
  //le asigno ese nuevo color a la variable de la clase circulo
  circulo.col = colorCirculo;
  // Ajusto el diámetro del círculo basado en la amplitud de la banda 50, convirtiendo el valor en entero
  int nuevoRadio = int(fft.getBand(50) * 500); // Escalar el valor para el radio
  circulo.radio = nuevoRadio; // Actualiza el radio del círculo
  // asigno el valor de la amplitud en una nueva variable
  int nuevaVelocidad =  int(fft.getBand(50) * 10);
  //actualizo la velocidad en x e y segun la amplitud de la banda 50
  //con la funcion max me aseguro de que la velocidad minima sea 1
  // con el operador ternario multiplico por 1 o -1 para alternar la direccion
  circulo.velocidad.x = max(nuevaVelocidad, 1) * (circulo.velocidad.x < 0 ? -1 : 1);
  circulo.velocidad.y = max(nuevaVelocidad, 1) * (circulo.velocidad.y < 0 ? -1 : 1);

  /////////////////
  background(255);
  noFill();
  strokeWeight(10);
  stroke(0);
  rectMode(CORNER);
  rect(0, 0, 1080, 720);
  noStroke();
  //actualizo la ubicacion del circulo y circulo2
  circulo.actualizar();
  //dibujo
  circulo.dibujar();
  //llamo a la funcion para que detecte los bordes e invierta la velocidad
  circulo.bordes();
  //circulo2.bordes();
}
