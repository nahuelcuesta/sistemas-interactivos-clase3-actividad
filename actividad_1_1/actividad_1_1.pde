import ddf.minim.*;
import ddf.minim.analysis.*;

Minim minim;
AudioInput in;
FFT fft;

void setup() {
  size(720, 720);
  //instancio el objeto de la clase Minim
  minim = new Minim(this);
  // obtengo la conexion con la entrada de sonido a traves del metodo getLineIn
  in = minim.getLineIn(minim.MONO, 256);
  //instancio el objeto FFT
  fft = new FFT(in.bufferSize(), in.sampleRate());
}

void draw() {
  background(255);
  //informacion del objeto in
  fft.forward(in.mix);
  //creo una variable de tipo int que contendra el valor de la banda 50 en cada iteracion
  int banda = int(fft.getBand(50) * 100);
  fill(255,200,0);
  ellipse(width/2, height/2, 100, 0 + banda );
  rectMode(CORNER);
  fill(255);
  noStroke();
  rect(0, 0, width, height /2);
}
