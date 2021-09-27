class evento {
  int lluviaX = 0, lluviaY = 0, tiempoP = 500, tiempoL = 500;
  PImage lluviaIMG, bombaExplo, explo, bombaMojadaDerr, derretir;
  PImage controllerarrow, controller0, controller1, controller2, controller3, controller4, fondoStart, fondoWin;
  boolean bajarTiempoP = false, bajarTiempoL = false, lluvia = false, explota = false; 
  boolean start = true, reset = false, end = false;
  int tiempoRestante = 520, tiempoRestanteWin = 180, tiempoExplo = 20, contadorController = 30;

  evento() {
    lluviaIMG = loadImage("lluvia.png");
    bombaExplo = loadImage("bomba1.png");
    explo = loadImage("explosion.png");
    bombaMojadaDerr = loadImage("bombaMojada1.png");
    derretir = loadImage("derretida.png");

    fondoStart = loadImage("fondoStart.png");
    fondoWin = loadImage("fondoWin.png");
    controllerarrow = loadImage("controller/controllerarrow.png");
    controller0 = loadImage("controller/controller_0.png");
    controller1 = loadImage("controller/controller_1.png");
    controller2 = loadImage("controller/controller_2.png");
    controller3 = loadImage("controller/controller_3.png");
    controller4 = loadImage("controller/controller_4.png");
  }

  void dibujar() {
    if (lluvia) { // EFECTO LLUVIA EFECTO LLUVIA EFECTO LLUVIA EFECTO LLUVIA EFECTO LLUVIA EFECTO LLUVIA 
      lluviaY+=30;
      image(lluviaIMG, lluviaX, lluviaY);
      image(lluviaIMG, lluviaX, lluviaY-height);
      image(lluviaIMG, lluviaX, lluviaY+height);
      if (lluviaY > height) {
        lluviaY = lluviaY-height;
      }
    }
  }

  void funcionalidad() {
    if (bajarTiempoP==true) { // mensaje de alerta ( NO DISPARAR AFUERA)
      tiempoP = tiempoP-2;
    }
    if (tiempoP < 499) {
      pushStyle();
      fill(0, 0, 0);
      textSize(75);
      textAlign(CENTER);
      text("Debes tirar la estructura primero", width/2, height/2);
      fill(255, 50, 50);
      text("Debes tirar la estructura primero", width/2+3, height/2+3);
      popStyle();
    }
    if (tiempoP < 1) {
      tiempoP = 500;
      bajarTiempoP = false;
    }


    if (sigNivel) {
      lluvia = true;
      bajarTiempoL = true;
      mundo.add(e.caja10);
    }


    if (lluvia) {
      if (bajarTiempoL==true) { // mensaje de alerta ( NO DISPARAR AFUERA)
        tiempoL = tiempoL-2;
      }
      if (tiempoL < 499) {
        pushStyle();
        fill(0, 0, 0);
        textSize(45);
        textAlign(CENTER);
        text("Se avecina una tormenta, tus bombas pesaran mucho mas", width/2, height/3);
        fill(255, 50, 50);
        text("Se avecina una tormenta, tus bombas pesaran mucho mas", width/2+3, height/3+3);
        popStyle();
      }
      if (tiempoL < 1) {
        tiempoL = 500;
        bajarTiempoL = false;
      }
    }
  }

  void Start() {
    if (start) {
      pushStyle();
      contadorController --;

      image(fondoStart, 0, 0);

      if (contadorController <= 30 && contadorController > 24) {
        image(controller0, width/2-165, height/3+50);
      }
      if (contadorController <= 24 && contadorController > 18) {
        image(controller1, width/2-165, height/3+50);
      }
      if (contadorController <= 18 && contadorController > 12) {
        image(controller2, width/2-165, height/3+50);
      }
      if (contadorController <= 12 && contadorController > 6) {
        image(controller3, width/2-165, height/3+50);
      }
      if (contadorController <= 6 && contadorController > 0) {
        image(controller4, width/2-165, height/3+50);
      }

      if (contadorController < 30 && contadorController > 22) {
        image(controllerarrow, width/2-160, height/3);
      }

      if (contadorController <= 0 ) {
        contadorController = 30;
      }
      popStyle();
    }
  }

  void Reset() {
    if (c.cantDisp <= 0) {
      tiempoRestante --;
      if (tiempoRestante <= 0) {
        reset =  true;
      }
      if (tiempoRestante > 20 && tiempoRestante < 240) {
        pushStyle();
        fill(0, 0, 0);
        textSize(75);
        textAlign(CENTER);
        text("¡Te quedaste sin bombas!", width/2, height/2);
        fill(255, 50, 50);
        text("¡Te quedaste sin bombas!", width/2+3, height/2+3);
        popStyle();
      }
    }
    if (c.cantDisp > 0 ) {
      tiempoRestante = 520;
    }
    if (reset) {
      reiniciar.trigger();
      ev.lluvia = false;
      sigNivel = false;
      e.forceRemove();
      cancion.loop();
      lluviaSonido.pause();
      e.dibujar();
      c.vel = 5500;
      c.dens = 1.2;
      c.cantDisp = 4;
      cajasTiradas = 0;
      tiempoRestante = 420;
      tiempoRestanteWin = 180;
      mundo.remove(c.proyectil);
      win.pause();

      reset = false;
    }
  }

  void End() {
    if (cajasTiradas >= 12) {
      tiempoRestanteWin --;
      if (tiempoRestanteWin <= 0) {
        end = true;
      }
      if (end) {
        win.play();
        pushStyle();
        tiempoRestanteWin = 180;
        
        image(fondoWin,0,0);
        /*fill(25, 06, 75);
        rect(0, 0, width, height);
        fill(255, 255, 255);
        textSize(75);
        text("Sweet Destroyer", width/2-290, height/2-150);
        fill(random(255), 255, random(255));
        textSize(75);
        text("Ganaste!", width/2-165, height/2+150);
        fill(255, 255, 255);
        textSize(18);
        text("presiona para reiniciar", width/2-135, height/2+275);*/
        popStyle();
      }
    }
  }


  void bombaPumba(float bX, float bY) {
    if (explota && !lluvia) {
      tiempoExplo --;
      if (tiempoExplo >= 10) {
        image(bombaExplo, bX, bY);
      }
      if (tiempoExplo <= 10) {
        image(explo, bX, bY);
      }
      if (tiempoExplo <= 0) {
        tiempoExplo = 20;
        explota = false;
      }
    }

    if (explota && lluvia) {
      tiempoExplo --;
      if (tiempoExplo >= 10) {
        image(bombaMojadaDerr, bX, bY);
      }
      if (tiempoExplo <= 10) {
        image(derretir, bX, bY);
      }
      if (tiempoExplo <= 0) {
        tiempoExplo = 20;
        explota = false;
      }
    }
  }
}
