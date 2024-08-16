class Circulo {

  PVector ubicacion;
  PVector velocidad;
  int radio;
  color col;

  Circulo(float x, float y, float vx, float vy, int r, color c ) {

    ubicacion = new PVector(x, y);
    velocidad = new PVector(vx, vy);
    radio = r;
    col = c;
  }
  // Método para actualizar la posición
  void actualizar() {
    ubicacion.add(velocidad);
  }

  void dibujar() {
    fill(col);
    ellipse(ubicacion.x, ubicacion.y, radio * 2, radio * 2 );
  }

  // Método para detectar los bordes
  void bordes() {
    // Verificar el borde izquierdo
    if (ubicacion.x - radio < 0) {
      ubicacion.x = radio;  // Ajustar la posición para que no se salga
      velocidad.x *= -1;     // Invertir la velocidad en x
    }
    // Verificar el borde derecho
    if (ubicacion.x + radio > width) {
      ubicacion.x = width - radio;  // Ajustar la posición para que no se salga
      velocidad.x *= -1;             // Invertir la velocidad en x
    }
    // Verificar el borde superior
    if (ubicacion.y - radio < 0) {
      ubicacion.y = radio;  // Ajustar la posición para que no se salga
      velocidad.y *= -1;     // Invertir la velocidad en y
    }
    // Verificar el borde inferior
    if (ubicacion.y + radio > height) {
      ubicacion.y = height - radio;  // Ajustar la posición para que no se salga
      velocidad.y *= -1;              // Invertir la velocidad en y
    }
  }
}
