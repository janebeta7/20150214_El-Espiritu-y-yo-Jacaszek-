
import net.nexttext.*;
import net.nexttext.behaviour.*;
import net.nexttext.behaviour.control.*;
import net.nexttext.behaviour.standard.*;
import net.nexttext.behaviour.dform.*;
import net.nexttext.renderer.*;

class Preset30 extends Preset {
  String  lines[];

  color colorr;
  int indice = 0;
  boolean isBrush = false;
  float bposx, bposy;
  Book book;
  int longitud;
  PFont gangOfThree;
  PApplet thiss;
  Preset30(String _name) {
    super(_name);
   
    // bg = loadImage("bg2.png");
    // brocha = loadImage("agua.png");
    initBook();// create the book
  }
  public void f_mousePressed() {
    //if ( super.on)  reset();
  };
  public void f_mouseDrag() {
  };
  public void f_mouseReleased() {
  };
  public void draw() {
    if (super.on) {
      render();
    }
  }

  public void listener() {
    super.listener();
  }
  public void changeTipo(int tipo) {
    
  }
  private void render() {
    book.stepAndDraw();
  }
  public void reset() {
    if (!isOPENGL) pasaPagina();
  }
  void pasaPagina() {
    if (isResize) indice=20;
    book.clear(); 
    println("------pasaPagina: "+indice);
    indice++;
    if (indice > longitud-1) indice = 0;
    fill(o_colores.getColor(), 20);
    stroke(0, 40);
    book.addText(lines[indice], mouseX, mouseY);
  }
  void initBook() {
    book = new Book(this.thiss);



    Pull pull = new Pull(Book.mouse, 5, 8);
    OnMouseDepressed onMouseDepressedPull = new OnMouseDepressed(LEFT, pull);
    Behaviour pullOnLeft = onMouseDepressedPull.makeBehaviour();

    MoveTo followMouse = new MoveTo(Book.mouse, int(map(SPEED, 0, 10, 0, 6)));
    Repeat followMouseAlways = new Repeat(followMouse, 0);  // 0 loops forever
    OnMouseDepressed onCenterPressed = new OnMouseDepressed(CENTER, followMouseAlways);
    Behaviour dragOnCenter = onCenterPressed.makeBehaviour();


    Reform reform = new Reform();
    OnMouseDepressed onMouseDepressedReform = new OnMouseDepressed(RIGHT, reform);
    Behaviour reformOnRight = onMouseDepressedReform.makeBehaviour();


    book.addGroupBehaviour(pullOnLeft);
    book.addGroupBehaviour(dragOnCenter);
    book.addGroupBehaviour(reformOnRight);
    gangOfThree = createFont("tipos/UNCLETYP.TTF", 40, false);
    textFont(gangOfThree);
    textAlign(CENTER);
    fill(255, 20);
    noStroke();
    String  l[] = loadStrings("textos/thesewalls.txt");
    println("there are " + l.length + " lines");
    longitud = l.length;
    for (int i=0; i < l.length; i++) {
      println(l[i]);
    }
    lines = new String[longitud];
    lines = l;
    indice = 0;
    book.addText("you left me dry", 220, height/2);
  }
}
