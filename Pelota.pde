/** Representa la pelota del juego */
class Pelota extends GameObject{
  /** DEFINICIÓN DE ATRIBUTOS */  
  /** Velocidad de la pelota */
  private PVector velocidad;
  /** Tamaño de la pelota */
  private float radio;
  
  
  
  /** CONSTRUCTORES */
  /** Constructor por defecto */
  public Pelota(){
    this.radio = 10;
    this.posicion = new PVector(width/2,height/2); // La pelota aparece en el medio de la mesa
    float velX = 0;
    float velY = 0;
    //Definiendo la velocidad de la pelota
    boolean flag = false;
    while (!flag){
      velX = random(-4,4);
      velY = random(-2.5,2.5);
      if ((velX < -3 || velX > 3) && (velY < -1.5 || velY > 1.5)){
        flag = true;
      }
    }
    this.velocidad = new PVector(velX,velY);
  }
  
  
  
  /** DEFINICIÓN DE MÉTODOS */
  /** Dibuja la pelota */
  public void display(){
    fill(255);
    noStroke();
    circle(this.posicion.x, this.posicion.y, this.radio);
  }
  /** Mueve la pelota */
  public void mover(){
    this.posicion.add(this.velocidad);
  }  
  /** Hace que la pelota rebote en una superficie */
  public void rebotar(){
    if(this.posicion.y >= height || this.posicion.y <= 0){
    text("rebotar()",width-80,40);
      this.velocidad.y *= -1;
    }
  }
  
  public void reiniciar(){    
    if(this.posicion.x >= width || this.posicion.x <= 0){
      this.posicion.x = width/2;
      this.posicion.y = height/2;
      
      float velX = 0;
      float velY = 0;
      boolean flag = false;
      while (!flag){ 
        velX = random(-4,4);
        velY = random(-2.5,2.5);
        if ((velX < -3 || velX > 3) && (velY < -1.5 || velY > 1.5)){
          flag = true;
        }
      }
      
      this.velocidad.x = velX;
      this.velocidad.y = velY;
    }
  }
  
  public void colisionarJugador(Jugador jugador){
    //verifica que algún extremo de la pelota supere algún extremo del jugador
    if (this.posicion.x-radio < jugador.posicion.x+5 &&
        this.posicion.x+this.radio > jugador.posicion.x-5 &&
        this.posicion.y+this.radio > jugador.posicion.y-15 &&
        this.posicion.y-this.radio < jugador.posicion.y+15){
      this.velocidad.x *= -1; // invirtiendo velocidad.x
            
      float nuevaVelocidadY = map(jugador.velocidad, Consts.VELOCIDAD_MIN, Consts.VELOCIDAD_MAX,0.8,2);
      this.velocidad.y *= nuevaVelocidadY; //actualizando velocidad.y según velocidad del jugador
    }
  }
  
}
