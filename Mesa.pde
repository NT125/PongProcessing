/** Representa el fondo en el que se jugará */
class Mesa extends GameObject{
  /** DEFINICIÓN DE ATRIBUTOS */  
  /** Color del fondo */
  private color colorMesa;
  
  
  
  /** CONSTRUCTORES */  
  /** Constructor por defecto */
  public Mesa(){
    this.colorMesa = #000000; // Define un fondo negro por defecto
  }
  /** Constructor parametrizado */
  public Mesa(color colorMesa){
    this.colorMesa = colorMesa; //Define el color de fondo por el pasado por parámetro
  }
  
  
  
  /** DEFINICIÓN DE MÉTODOS */  
  /** Dibuja la mesa de juego */
  public void display(){
    background(this.colorMesa);
    stroke(200);
    strokeWeight(2);
    line(width/2,0,width/2,height);
  }
}
