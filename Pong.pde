Mesa mesa;
Jugador j1;
Jugador j2;
Pelota pelota;

boolean pausa = true;

void setup(){
  size(600,400);
  mesa = new Mesa();
  j1 = new Jugador(0,Consts.JUGADOR_IZQ,new PVector(25,height/2));
  j2 = new Jugador(0,Consts.JUGADOR_DER,new PVector(width-25,height/2));
  pelota = new Pelota();
}

void draw(){  
  if (pausa){
    mesa.display();
    j1.display();
    j2.display();
    fill(0,200);
    rect(0,0,width*2,height*2);
    fill(180);
    textAlign(CENTER,CENTER);
    textSize(40);
    text("Haga clic para empezar", width/2,height/2);
  }else{
    mesa.display();
  
    fill(30);
    textAlign(CENTER);
    textSize(180);
    text(j1.puntaje,(width/2)-150,250);
    text(j2.puntaje,(width/2)+150,250);  
    textSize(12);
    
    j1.display();
    j2.display();
  
    pelota.colisionarJugador(j1); //chequeando colisión con j1
    pelota.colisionarJugador(j2); //chequeando colisión con j2
    
    if (pelota.posicion.x >= width){
      j1.puntaje++;
      pelota.reiniciar();
    }
    if (pelota.posicion.x <= 0){
      j2.puntaje++;
      pelota.reiniciar();
    }
  
    pelota.display();
    pelota.mover();
    pelota.rebotar();
  
    fill(255);
    text(pelota.posicion.x,40,40);
    text(pelota.posicion.y,40,50);
    text(pelota.velocidad.x,40,70);
    text(pelota.velocidad.y,40,80);
   }
}
  
void keyPressed(){
  j1.keyPressed();
  j2.keyPressed();
}

void keyReleased(){
  j1.keyReleased();
  j2.keyReleased();
}

void mousePressed(){
  pausa = false;
}
