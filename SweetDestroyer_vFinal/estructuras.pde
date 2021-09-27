class estructuras {

  FBox caja1, caja2, caja3, caja4, caja5, caja6, caja7, caja8, caja9, caja10, caja11, caja12, caja13, caja14, caja15, caja16, caja17, caja18, caja19, caja20, caja21;
  float caja3Y, caja6Y, caja8Y, caja9Y, caja10Y, caja11Y, caja12Y, caja13Y, caja14Y, caja15Y, caja16Y, caja17Y, caja18Y, caja19Y, caja20Y, caja21Y;
  int tiempo = 90;
  PImage caniaVertical1_IMG, caniaVertical2_IMG, caniaHorizontal1_IMG, caniaHorizontal2_IMG;
  PImage blockVertical1_IMG, blockVertical2_IMG, blockVertical3_IMG, blockHorizontal1_IMG, blockHorizontal2_IMG, caja_IMG, obstaculo_IMG;

  estructuras() {
    imageMode(CORNERS);
    caniaVertical1_IMG = loadImage("cañaVertical1.png");
    caniaVertical2_IMG = loadImage("cañaVertical2.png");
    caniaHorizontal1_IMG = loadImage("cañaHorizontal1.png");
    caniaHorizontal2_IMG = loadImage("cañaHorizontal2.png");

    blockVertical1_IMG = loadImage("blockVertical1.png");
    blockVertical2_IMG = loadImage("blockVertical2.png");
    blockVertical3_IMG = loadImage("blockVertical3.png");
    blockHorizontal1_IMG = loadImage("blockHorizontal1.png");
    blockHorizontal2_IMG = loadImage("blockHorizontal2.png");
    caja_IMG = loadImage("caja.png");
    obstaculo_IMG = loadImage("obstaculo.png");
  }

  void dibujar() {
    caja1 = new FBox(15, 100); // ESTRUCTURA 1 ESTRUCTURA 1 ESTRUCTURA 1 ESTRUCTURA 1 ESTRUCTURA 1 ESTRUCTURA 1 //
    caja1.setName("caja");
    caja2 = new FBox(15, 100);
    caja2.setName("caja");
    caja3 = new FBox(200, 15);
    caja3.setName("caja");
    caja4 = new FBox(10, 70);
    caja4.setName("caja");
    caja5 = new FBox(10, 70);
    caja5.setName("caja");
    caja6 = new FBox(150, 15);
    caja6.setName("caja");

    caja1.attachImage(caniaVertical1_IMG);
    caja2.attachImage(caniaVertical1_IMG);
    caja4.attachImage(caniaVertical2_IMG);
    caja5.attachImage(caniaVertical2_IMG);

    caja3.attachImage(caniaHorizontal1_IMG);
    caja6.attachImage(caniaHorizontal2_IMG);

    caja1.setPosition(820-180, 570);
    caja2.setPosition(720-180, 570);
    caja3.setPosition(770-180, 560);
    caja4.setPosition(740-180, 490);
    caja5.setPosition(800-180, 490);
    caja6.setPosition(770-180, 480);
    caja1.setDensity(20);
    caja2.setDensity(20);
    caja3.setDensity(10);
    caja4.setDensity(25);
    caja5.setDensity(25);
    caja6.setDensity(15);

    caja1.setFill(0);
    caja2.setFill(0);
    caja3.setFill(0);
    caja4.setFill(0);
    caja5.setFill(0);
    caja6.setFill(0);

    caja1.setGrabbable(false);
    caja2.setGrabbable(false);
    caja3.setGrabbable(false);
    caja4.setGrabbable(false);
    caja5.setGrabbable(false);
    caja6.setGrabbable(false);

    mundo.add(caja1);
    mundo.add(caja2);
    mundo.add(caja3);
    mundo.add(caja4);
    mundo.add(caja5);
    mundo.add(caja6);

    caja7 = new FBox(15, 630); // SEPARADOR DE ESTRUCTURAS SEPARADOR DE ESTRUCTURAS SEPARADOR DE ESTRUCTURAS //
    caja7.setName("caja");
    caja7.setStatic(true);
    caja7.setPosition(860-100, 320);
    caja7.setFill(255, 20, 20, 20);
    caja7.setNoStroke();
    caja7.setDensity(20);
    caja7.setGrabbable(false);
    mundo.add(caja7);

    caja8 = new FBox(21.5, 120); // ESTRUCTURA 2 ESTRUCTURA 2 ESTRUCTURA 2 ESTRUCTURA 2 ESTRUCTURA 2 ESTRUCTURA 2 //
    caja8.setName("caja");
    caja9 = new FBox(30, 120);
    caja9.setName("caja");
    caja10 = new FBox(20, 43);
    caja10.setName("caja");
    caja11 = new FBox(30, 120);
    caja11.setName("caja");
    caja13 = new FBox(21.5, 120);
    caja13.setName("caja");
    caja14 = new FBox(170, 60);
    caja14.setName("caja");
    caja15 = new FBox(170, 60);
    caja15.setName("caja");
    caja16 = new FBox(170, 60);
    caja16.setName("caja");
    caja17 = new FBox(30, 120);
    caja17.setName("caja");
    caja18 = new FBox(30, 120);
    caja18.setName("caja");
    caja19 = new FBox(260, 60);
    caja19.setName("caja");
    caja20 = new FBox(60, 275);
    caja20.setName("caja");
    caja21 = new FBox(80, 80);
    caja21.setName("caja");

    caja10.attachImage(obstaculo_IMG);

    caja9.attachImage(blockVertical1_IMG);
    caja11.attachImage(blockVertical1_IMG);
    caja17.attachImage(blockVertical1_IMG);
    caja18.attachImage(blockVertical1_IMG);

    caja8.attachImage(blockVertical2_IMG);
    caja13.attachImage(blockVertical2_IMG);

    caja14.attachImage(blockHorizontal1_IMG);
    caja15.attachImage(blockHorizontal1_IMG);
    caja16.attachImage(blockHorizontal1_IMG);
    caja19.attachImage(blockHorizontal2_IMG);

    caja20.attachImage(blockVertical3_IMG);
    caja21.attachImage(caja_IMG);



    caja8.setGrabbable(false);
    caja9.setGrabbable(false);
    caja10.setGrabbable(false);
    caja11.setGrabbable(false);
    caja13.setGrabbable(false);
    caja14.setGrabbable(true);
    caja15.setGrabbable(true);
    caja16.setGrabbable(true);
    caja17.setGrabbable(false);
    caja18.setGrabbable(false);
    caja19.setGrabbable(true);
    caja20.setGrabbable(false);
    caja21.setGrabbable(false);

    caja8.setPosition(830, 570);
    caja9.setPosition(970, 570);
    caja10.setPosition(520, 535);
    caja11.setPosition(1140, 570);
    caja13.setPosition(1280, 570);
    caja14.setPosition(885, 485);
    caja15.setPosition(1055, 485);
    caja16.setPosition(1225, 485);
    caja17.setPosition(830, 395);
    caja18.setPosition(1000, 395);
    caja19.setPosition(915, 303);
    caja20.setPosition(1230, 318);
    caja21.setPosition(1230, 138);

    caja8.setDensity(5);
    caja9.setDensity(17);
    caja10.setDensity(9999);
    caja11.setDensity(17);
    caja13.setDensity(5);
    caja14.setDensity(5);
    caja15.setDensity(5);
    caja16.setDensity(1);
    caja17.setDensity(8);
    caja18.setDensity(8);
    caja19.setDensity(2);
    caja20.setDensity(2);
    caja21.setDensity(1);

    caja8.setFriction(1);
    caja9.setFriction(1);
    caja10.setFriction(1);
    caja11.setFriction(1);
    caja13.setFriction(1);
    caja14.setFriction(1);
    caja15.setFriction(1);
    caja16.setFriction(1);
    caja17.setFriction(1);
    caja18.setFriction(1);
    caja19.setFriction(1);
    caja20.setFriction(1);
    caja21.setFriction(1);

    caja8.setFill(0);
    caja9.setFill(0);
    caja11.setFill(0);
    caja13.setFill(0);
    caja14.setFill(0);
    caja15.setFill(0);
    caja16.setFill(0);
    caja17.setFill(0);
    caja18.setFill(0);
    caja19.setFill(0);
    caja20.setFill(0);
    caja21.setFill(0);

    mundo.add(caja8);
    mundo.add(caja9);
    mundo.add(caja11);
    mundo.add(caja13);
    mundo.add(caja14);
    mundo.add(caja15);
    mundo.add(caja16);
    mundo.add(caja17);
    mundo.add(caja18);
    mundo.add(caja19);
    mundo.add(caja20);
    mundo.add(caja21);
  }

  void detectarCosas() { // DETECTAR OBJETOS DESTRUIDOS
    caja3Y = caja3.getY();
    caja6Y = caja6.getY();
    caja8Y = caja8.getY();
    caja9Y =caja9.getY();
    caja10Y = caja10.getY();
    caja11Y = caja11.getY();
    caja13Y = caja13.getY();
    caja14Y = caja14.getY();
    caja15Y = caja15.getY();
    caja16Y = caja16.getY();
    caja17Y = caja17.getY();
    caja18Y = caja18.getY();
    caja19Y = caja19.getY();
    caja20Y = caja20.getY();
    caja21Y = caja21.getY();

    if (caja6Y > height - 90 && caja3Y > height - 100) { // PRIMERA ESTRUCTURA PRIMERA ESTRUCTURA PRIMERA ESTRUCTURA PRIMERA ESTRUCTURA 
      tiempo --;
      if (tiempo <5) {
        mundo.remove(caja1);
        mundo.remove(caja2);
        mundo.remove(caja3);
        mundo.remove(caja4);
        mundo.remove(caja5);
        mundo.remove(caja6);
        mundo.remove(caja7);
        tiempo = 90;
        sigNivel = true; // ROMPER CAJA7
      }
    }

    if (caja8Y > height - 30) { // SEGUNDA ESTRUCTURA SEGUNDA ESTRUCTURA SEGUNDA ESTRUCTURA SEGUNDA ESTRUCTURA SEGUNDA ESTRUCTURA
      mundo.remove(caja8);
      cajasTiradas +=1;
    }
    if (caja9Y > height - 30) {
      mundo.remove(caja9);
      cajasTiradas +=1;
    }
    if (caja11Y > height - 30) {
      cajasTiradas +=1;
      mundo.remove(caja11);
    }
    if (caja13Y > height - 64) {
      cajasTiradas +=1;
      mundo.remove(caja13);
    }
    if (caja14Y > height - 100) {
      cajasTiradas +=1;
      mundo.remove(caja14);
    }
    if (caja15Y > height - 100) {
      cajasTiradas +=1;
      mundo.remove(caja15);
    }
    if (caja16Y > height - 100) {
      cajasTiradas +=1;
      mundo.remove(caja16);
    }
    if (caja17Y > height - 75) {
      cajasTiradas +=1;
      mundo.remove(caja17);
    }
    if (caja18Y > height - 75) {
      cajasTiradas +=1;
      mundo.remove(caja18);
    }
    if (caja19Y > height - 155) {
      cajasTiradas +=1;
      mundo.remove(caja19);
    }
    if (caja20Y > height - 145) {
      cajasTiradas +=1;
      mundo.remove(caja20);
    }
    if (caja21Y > height - 50) {
      cajasTiradas +=1;
      mundo.remove(caja21);
    }
  }


  void forceRemove() {
    if (ev.reset == true) {
      mundo.remove(caja1);
      mundo.remove(caja2);
      mundo.remove(caja3);
      mundo.remove(caja4);
      mundo.remove(caja5);
      mundo.remove(caja6);
      mundo.remove(caja7);
      mundo.remove(caja8);
      mundo.remove(caja9);
      mundo.remove(caja10);
      mundo.remove(caja11);
      mundo.remove(caja12);
      mundo.remove(caja13);
      mundo.remove(caja14);
      mundo.remove(caja15);
      mundo.remove(caja16);
      mundo.remove(caja17);
      mundo.remove(caja18);
      mundo.remove(caja19);
      mundo.remove(caja20);
      mundo.remove(caja21);
    }
  }
}
