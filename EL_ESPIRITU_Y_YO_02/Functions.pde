//-----------------------------------------------------------------------------------------------------------------------------------
//-----------------------------------------------------------------------------------------------------------------------------------
public void init() {
   setBackground(Color.black);
  frame.removeNotify();
 frame.setUndecorated(true);
  frame.addNotify();
  frame.setLocation(locationX, locationY);
  //frame.setAlwaysOnTop(true);
 
  super.init();
}
void salvarImagen() {
  String nombre = getIncrementalFilename("out/el_espiiritu_y_yo_jakaszek###.jpg");
  saveFrame(nombre);
}
public String getIncrementalFilename(String what) {
  String s="",prefix,suffix,padstr,numstr;
  int index=0,first,last,count;
  File f;
  boolean ok;

  first=what.indexOf('#');
  last=what.lastIndexOf('#');
  count=last-first+1;

  if( (first!=-1)&& (last-first>0)) {
    prefix=what.substring(0, first);
    suffix=what.substring(last+1);

    // Comment out if you want to use absolute paths
    // or if you're not using this inside PApplet
    if(sketchPath!=null) prefix=savePath(prefix);

    index=0;
    ok=false;

    do {
      padstr="";
      numstr=""+index;
      for(int i=0; i<count-numstr.length(); i++) padstr+="0";       
      s=prefix+padstr+numstr+suffix;

      f=new File(s);
      ok=!f.exists();
      index++;

      // Provide a panic button. If index > 10000 chances are it's an 
      // invalid filename.
      if(index>10000) ok=true;
    } 
    while(!ok);

    // Panic button - comment out if you know what you're doing
    if(index>10000) {
      println("getIncrementalFilename thinks there is a problem - Is there "+
        " more than 10000 files already in the sequence or is the filename invalid?");
      return prefix+"ERR"+suffix;
    }
  }
  println("save File >> "+s );
  return s;
}
void limpiaPantalla() {
  background(COLOR_FONDO);
}
///RENDER FRAMES//
void renderFrames() {
  if (renderToFrames==true) {

    saveFrame("./render/particles-####.tga");
  }
}

/**
 * filter out PICS .Changed by Alba G. Corral
 */
class PicFilter implements FilenameFilter
{

  /**
   * Select only *.Pic files.
   *
   * @param dir the directory in which the file was found.
   *
   * @param name the name of the file
   *
   * @return true if and only if the name should be
   * included in the file list; false otherwise.
   */
  public boolean accept ( File dir, String name )
  {
    if ( new File( dir, name ).isDirectory() )
    {
      return false;
    }
    name = name.toLowerCase();
    return (name.endsWith( ".png" ) || name.endsWith( ".jpg" ) || name.endsWith( ".gif" )) ;
  }
}



/*-----------------------------presets-----------------------------*/
// opengl blending as seen here http://www.rui-m.com/p5/Boids/ ;)
void glowStuff() {

}

void sound(float MedLow,float MedMed,float MedHi,float MediaLevel,int LongCadenaFreq,Float[] arrFreq,float param1,float param2, float param3, float param4, float param5, float param6, float param7, float param8) {
  print("PLUG  /SOUND");
}

void calibrar() {
  imageMode(CORNER);
  image(imCa,0,0);
  imageMode(CENTER);
}
