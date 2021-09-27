class canion {
  FCircle proyectil;
  int couldown = 95;
  float x, y, ang, vang, vel, cantDisp, dens, largo = x-100;
  boolean disparado, noBombas;
  PImage canion_IMG, rueda_IMG, bomba_IMG, bombaMojada_IMG;

  canion () {
    imageMode(CORNERS);
    canion_IMG = loadImage("canion.png");
    rueda_IMG = loadImage("rueda.png");
    bomba_IMG= loadImage("bomba.png");
    bombaMojada_IMG= loadImage("bombaMojada.png");

    x =100;
    y =595;
    ang = -1.4;
    vang = 0.8;
    vel = 5500;
    dens = 1.2;

    cantDisp = 4;
    noBombas = false;
  }

  void dibujar() {
    pushMatrix();
    pushStyle();
    imageMode(CENTER);
    translate(x, y);
    rotate(ang);
    fill(255, 0, 0, 50);
    rect(10, 0, 655, 4);
    fill(50, 50, 50);
    noStroke();
    image(canion_IMG, 10, -20);
    fill(90, 90, 90);
    noStroke();
    image(rueda_IMG, -10, 15, 65, 65);


    if (!ev.start && !ev.end) {
      pushStyle(); // MARCADOR DE DISPARO   MARCADOR DE DISPARO   MARCADOR DE DISPARO   MARCADOR DE DISPARO   MARCADOR DE DISPARO //
      fill(255,100);
      stroke(0);
      rectMode(CENTER);
      rect(x-50, 0, 50, 10);
      if (couldown <= 94) {
        rectMode(CORNERS);
        largo = largo+0.52;
        fill(x, 2.5*largo, 0);
        rect(x-75, -5, largo, 5);
      }
      if (couldown == 95) {
        largo = x-75;
      }
      popStyle();
      c.cantDisp();
    }


    popStyle();
    popMatrix();
  }

  void rotar() {
    if (keyPressed) {
      if (keyCode== RIGHT || key == 'd') {
        ang+= radians(vang/0.7);
      }
      if (keyCode== LEFT || key == 'a') {
        ang-= radians(vang/0.7);
      }
    } 

    ang= constrain(ang, 4.9567404, 6.2133694);
  }

  void disparo(FWorld mundo) {
    pushMatrix();
    translate(x, y);
    proyectil = new FCircle(30);
    proyectil.setName("bomba");
    proyectil.setPosition(x, y );
    if(!ev.lluvia){
    proyectil.attachImage(bomba_IMG);
    }
    if(ev.lluvia){
    proyectil.attachImage(bombaMojada_IMG);
    }
    float vx = vel * cos(ang);
    float vy = vel * sin(ang);
    proyectil.setGrabbable(false);
    proyectil.setVelocity(vx, vy);
    proyectil.setFill(30, 30, 30);
    proyectil.setDensity(dens);
    mundo.add(proyectil);
    cantDisp = cantDisp-1;
    disparado = true;
    popMatrix();
    bomba.trigger();
  }

  void cantDisp() {
    fill(0);
    textSize(15);
    text("Bombas:" + round(cantDisp), x-110, -35);
    if (cantDisp <= 0) {
    }

    if (sigNivel) {
      cantDisp = cantDisp + 10;
      vel = 1450;
      dens = 12.7;
      sigNivel = false;
    }
  }


  void recargar() {
    if (c.disparado == true) {
      couldown --;
    }
    if (couldown <= 0) {
      couldown = 95;
      c.disparado = false;
    }
  }
}
/*

 
 if (!ev.start && !ev.end) {
 pushStyle(); // MARCADOR DE DISPARO   MARCADOR DE DISPARO   MARCADOR DE DISPARO   MARCADOR DE DISPARO   MARCADOR DE DISPARO //
 fill(255);
 stroke(0);
 rectMode(CENTER);
 rect(width/2, 30, 200, 30);
 if (couldown <= 94) {
 rectMode(CORNERS);
 largo = largo+2.1;
 fill(0, 1*largo, 0);
 rect(width/2-100, 15, largo, 45);
 }
 if (couldown == 95) {
 largo = width/2-100;
 }
 popStyle();
 c.cantDisp();
 }
 
 
 */
