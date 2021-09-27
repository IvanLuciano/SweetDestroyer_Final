import fisica.*;
FWorld mundo;
import TUIO.*;
TuioProcessing tuioClient;
import ddf.minim.*;
Minim minim;

canion c;
estructuras e;
evento ev;
PImage fondoa, fondob;
int mousex, mousey, cajasTiradas = 0, tiempoDeExplosion = 80;
float bX, bY;
boolean sigNivel = false;

AudioPlayer cancion, lluviaSonido, win;
AudioSample bomba, impacto,reiniciar;

// SETUP SETUP SETUP SETUP SETUP SETUP SETUP SETUP SETUP SETUP SETUP SETUP SETUP SETUP SETUP SETUP SETUP SETUP SETUP
// SETUP SETUP SETUP SETUP SETUP SETUP SETUP SETUP SETUP SETUP SETUP SETUP SETUP SETUP SETUP SETUP SETUP SETUP SETUP
void setup() {
  size(1366, 640);

  fondoa = loadImage("fondo1.png");
  fondob = loadImage("fondo2.png");

  Fisica.init(this);
  tuioClient  = new TuioProcessing(this);
  minim = new Minim(this);

  cancion = minim.loadFile("music4videogame.mp3");
  lluviaSonido = minim.loadFile("lluvia.mp3");
  win = minim.loadFile("victoria.mp3");

  reiniciar = minim.loadSample("replay.mp3");
  bomba = minim.loadSample("disparo.mp3");
  impacto = minim.loadSample("impacto.mp3");

  cancion.loop();
  cancion.setGain(-20);

  mundo = new FWorld();
  mundo.setEdges();
  mundo.setGravity(0, 1000);

  c = new canion();
  e = new estructuras();
  ev = new evento();

  e.dibujar();
}

// EJECUTAR COSAS EJECUTAR COSAS EJECUTAR COSAS EJECUTAR COSAS EJECUTAR COSAS EJECUTAR COSAS EJECUTAR COSAS EJECUTAR COSAS //
// EJECUTAR COSAS EJECUTAR COSAS EJECUTAR COSAS EJECUTAR COSAS EJECUTAR COSAS EJECUTAR COSAS EJECUTAR COSAS EJECUTAR COSAS //
void draw() {
  if (!ev.lluvia) {
    background(fondoa);
  }
  if (ev.lluvia) {
    background(fondob);
  }
  ArrayList<TuioObject> tuioObjectList = tuioClient.getTuioObjectList();
  for (int i=0; i<tuioObjectList.size (); i++) {
    TuioObject patron = tuioObjectList.get(i);
    int ID = patron.getSymbolID();
    if (ID == 0) {
      pushMatrix();
      c.ang = patron.getAngle();

      if (c.ang <= 5 && c.ang >= 3) {
        c.ang = 5;
      }
      if ( c.ang <= 3 && c.ang >= 0) {
        c.ang = 6.2831573;
      }
      popMatrix();
    }

    if (ID == 1) {
      if (ev.start == false && ev.end == false && ev.reset == false) {
        if (c.disparado == false && c.cantDisp > 0) {
          c.disparo(mundo);
        }
      }
      if (patron.getMotionSpeed() >= 0)
        ev.start = false;
      c.disparado = true;
      if (ev.end) {
        ev.reset = true;
        cajasTiradas = 0;
        ev.end = false;
        c.disparado = true;
      }
    }
  }
  e.caja10.setFill(random(255), 255, random(255));

  mundo.step(); // MOVER MUNDO //
  mundo.draw(); // DIBUJAR MUNDO //

  c.dibujar(); // DIBUJAR CAÑON DIBUJAR CAÑON DIBUJAR CAÑON DIBUJAR CAÑON DIBUJAR CAÑON //
  c.rotar(); // MOVIMIENTO DEL CAÑON MOVIMIENTO DEL CAÑON MOVIMIENTO DEL CAÑON MOVIMIENTO DEL CAÑON // 

  e.detectarCosas(); // DESTRUIR ESTRUCTURAS CUANDO CAEN DESTRUIR ESTRUCTURAS CUANDO CAEN // 

  ev.dibujar(); // DIBUJAR EVENTO //
  ev.funcionalidad(); // EJECUTAR FUNCIONALIDAD EVENTO //

  if (ev.explota) {
    ev.bombaPumba(bX, bY); // HACER ANIMACION DE EXPLOSIÓN
  }
  ev.Start(); // PANTALLA DE INICIO // 
  ev.Reset(); // FUNCION REINICIAR // 
  ev.End(); // PANTALLA DE GANAR //

  c.recargar();

  if (sigNivel == true) {
    cancion.pause();
    lluviaSonido.loop();
  }
}

// TECLAS TECLAS TECLAS TECLAS TECLAS TECCLAS TECLAS TECLAS TECLAS TECLAS TECLAS TECLAS TECLAS TECLAS //
// TECLAS TECLAS TECLAS TECLAS TECLAS TECLAS TECLAS TECLAS TECLAS TECLAS TECLAS TECLAS TECLAS TECLAS TECLAS TECLAS //
void keyReleased() {
  if (ev.start == false && ev.end == false && ev.reset == false) {
    if (keyCode== ' ' && c.disparado == false && c.cantDisp > 0) {
      c.disparo(mundo);
    }
  }
  ev.start = false;
  if (key == 'r') {
    ev.reset= true;
  }
  if (ev.end) {
    ev.reset = true;
    cajasTiradas = 0;
    ev.end = false;
  }
}

// COLISION COLISION COLISION COLISION COLISION COLISION // COLISION COLISION COLISION COLISION COLISION COLISION COLISION //
// COLISION COLISION COLISION COLISION COLISION COLISION // COLISION COLISION COLISION COLISION COLISION COLISION COLISION //
void contactStarted(FContact contacto) {
  FBody body1 = contacto.getBody1();
  FBody body2 = contacto.getBody2();

  if (body1 == e.caja7 && body2.getName() == "bomba") {
    ev.bajarTiempoP = true;
  }
}
void contactEnded(FContact contacto) {
  FBody body1 = contacto.getBody1();
  FBody body2 = contacto.getBody2();

  if (body1.getName() != null && body1.getName() != null) {
    if (body1.getName() == "caja"  && body2.getName() == "bomba") {
      body2.setFillColor(color(255));
      body2.setStrokeColor(color(220));

      mundo.remove(c.proyectil);
      ev.explota =  true;
      bX = c.proyectil.getX();
      bY = c.proyectil.getY();
      impacto.trigger();
    }
  }
}
