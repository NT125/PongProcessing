abstract class GameObject{
  /** DEFINICIÓN DE ATRIBUTOS */
  /** Posición del objeto */
  protected PVector posicion;
  
  
  
  /**CONSTRUCTORES*/
  /** Constructor por defecto */
  public GameObject(){
    posicion = new PVector();
  } 
  /** Constructor parametrizado */
  public GameObject(PVector posicion){
    this.posicion = posicion;
  }
  
  
  
  /**DEFINICIÓN DE MÉTODOS*/
  /* Dibuja al objeto */
  public abstract void display();
  
  
  
  /**GETTERS Y SETTERS*/
  public PVector getPosicion(){
    return this.posicion;
  }
  public void setPosicion(PVector posicion){
    this.posicion = posicion;
  }
}
