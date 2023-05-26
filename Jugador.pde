/** Representa las paletas del juego */
class Jugador extends GameObject{
  /** DEFINICIÓN DE ATRIBUTOS */  
  /** Puntaje del jugador */
  private Integer puntaje;
  /** Identificador del jugador (si es J1 o J2) */
  private Integer numJugador;
  /** Array que contiene los controles del jugador */
  private char[] controles;
  /** Velocidad del jugador */
  private Integer velocidad;
  
  
  
  /** CONSTRUCTORES */  
  /** Constructor por defecto */
  public Jugador(){
    this.puntaje = 0; //El jugador comienza con puntaje 0 siempre    
    if(this.numJugador == Consts.JUGADOR_IZQ){
      this.controles = new char[] {'a','z'};
    }
    if(this.numJugador == Consts.JUGADOR_DER){
      this.controles = new char[] {'j','m'};
    }
    this.velocidad = 0;
  }
  
  /** Constructor parametrizado */
  public Jugador(Integer puntaje, Integer numJugador, PVector posicion){
    this.puntaje = puntaje; //sólo para debugging - sacar después, el jugador SIEMPRE debe empezar con puntaje 0
    this.numJugador = numJugador;
    this.posicion = posicion;
    if(this.numJugador == Consts.JUGADOR_IZQ){
      this.controles = new char[] {'a','z'};
    }
    if(this.numJugador == Consts.JUGADOR_DER){
      this.controles = new char[] {'j','m'};
    }
    this.velocidad = 0;
    print(controles[0],controles[1]);
  }
   
    
  /** DEFINICIÓN DE MÉTODOS */  
  /** Métodos keyPressed y keyReleasd de Processing para capturar la entrada del teclado */
  public void keyPressed(){
    if (key == this.controles[0]){
      this.velocidad = constrain(velocidad-6,Consts.VELOCIDAD_MIN,Consts.VELOCIDAD_MAX); //Movimiento hacia arriba
    }    
    if (key == this.controles[1]){
      this.velocidad = constrain(velocidad+6,Consts.VELOCIDAD_MIN,Consts.VELOCIDAD_MAX); //Movimiento hacia arriba   
    }
  }
  public void keyReleased(){
    if (key == this.controles[0] || key == this.controles[1]){
      this.velocidad = 0;
    }
  }
  /** Mueve al jugador */
  public void mover(){
    if (this.posicion.y+15 >= height){      
      this.posicion.y = height-15;
    }
    if (this.posicion.y-15 <= 0){
      this.posicion.y = 15;
    }
    
    this.posicion.y += this.velocidad;
  }  
  
  
  /** Dibuja en pantalla al jugador */
  public void display(){
    noStroke();
    rectMode(CENTER);
    //Definiendo qué jugador dibujar dependiendo de su identificador (numJugador)
    if(this.numJugador == Consts.JUGADOR_IZQ){
      fill(#d9f0fc);
      rect(posicion.x, posicion.y, 10, 30);
    }
    if(this.numJugador == Consts.JUGADOR_DER){
      fill(#fcdad9);
      rect(posicion.x, posicion.y, 10, 30);
    }
    this.mover();
  }
  
  public Integer getPuntaje(){
    return this.puntaje;
  }
  
  public void setPuntaje(int puntaje){
    this.puntaje = puntaje;
  }
}
