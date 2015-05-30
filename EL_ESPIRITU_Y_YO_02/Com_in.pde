//functions that recive the parameters from the Onionface.


//classe on guardem les dades que venen del onionFace.
class onionFaceData_Class {
  OscP5 oscP5, tibP5;
  NetAddress myRemoteLocation, nikkaLocation;
  float level, medLow, medMed, medHi, param1, param2, param3, param4, param5, param6, param7, param8;
  int longCadenaFreq;
  float[] cadenaFreq;
  //boolean lock = false;
  //inicialitzem


  //constructor
  onionFaceData_Class(PApplet parent) {
    //start oscP5, listeningi
    // tibP5 =  new OscP5 (this,3883);
    oscP5 = new OscP5(this, 12000);
    myRemoteLocation = new NetAddress("localhost", 24000);
    oscP5.plug(this, "sound", "/sound");
    oscP5.plug(this, "subdivision", "/subdivision");
    oscP5.plug(this, "level", "/level");
    oscP5.plug(this, "weighting", "/weighting");
    cadenaFreq = new float[LONG];
    for (int i=0;i<LONG;i++) {
      cadenaFreq[i] = 0;
    }
    
  }

  void sound(float[] memory) {

    for (int i=0;i<LONG;i++) {
      setCadenaFreq(memory[i], i);
      // println("emory[i]:"+memory[i]);
    }
  }
  void weighting(float[] _weighting) {
    PESO = _weighting;
   // println("weig");
  }
  void subdivision(int _subdivision) {   
    // println(_subdivision);
    setLongCadenaFreq(_subdivision);
  }  
  void level(float _level) {   

    level  = _level;
  }  
  /* incoming osc message are forwarded to the oscEvent method. */
  void oscEvent(OscMessage theOscMessage) {
    /* with theOscMessage.isPlugged() you check if the osc message has already been
     * forwarded to a plugged method. if theOscMessage.isPlugged()==true, it has already 
     * been forwared to another method in your sketch. theOscMessage.isPlugged() can 
     * be used for double posting but is not required.
     */
    if (theOscMessage.isPlugged()==false) {
      /* print the address pattern and the typetag of the received OscMessage */
      /*println("### received an osc message.");
       println("### addrpattern\t"+theOscMessage.addrPattern());
       println("### typetag\t"+theOscMessage.typetag());*/


      /*setParam1(theOscMessage.get(4).floatValue());
       setParam2(theOscMessage.get(5).floatValue());
       setParam3(theOscMessage.get(6).floatValue());
       setParam4(theOscMessage.get(7).floatValue());
       setParam5(theOscMessage.get(8).floatValue());
       setParam6(theOscMessage.get(9).floatValue());
       setParam7(theOscMessage.get(10).floatValue());
       setParam8(theOscMessage.get(11).floatValue());
       setLongCadenaFreq(theOscMessage.get(12).intValue());*/

      /* for(int i=0;i<getLongCadenaFreq();i++) {
       setCadenaFreq(theOscMessage.get(i+13).floatValue(),i);
       }*/
    }
  }
  void draw() {
  }




  void inicializa() {
    println("----com > inicializa");
  }





  ///////////////////////////////////////////
  //posa cada un de les 
  void setMedLow(float medLow) {
    this.medLow = medLow;
  }  

  //function that returns de medLow 
  float getMedLow() {
    return (this.medLow);
  }

  //posa cada un de les 
  void setMedMed(float medMed) {
    this.medMed = medMed;
  }
  void setMediaLevel(float value) {
    this.level = value;
  }
  //function that returns de medLow 
  float getMed() {
    return (this.level);
  }

  //function that returns de medLow 
  float getMedMed() {
    // println("this.medMed"+this.medMed);
    return (this.medMed);
  }

  //posa cada un de les 
  void setMedHi(float medHi) {
    this.medHi = medHi;
  }

  //function that returns de medLow 
  float getMedHi() {
    return (this.medHi);
  }

  //Funcio que agafa la longitud de la cadana de frecuencies
  void setLongCadenaFreq(int longCadenaFreqIn) {
    longCadenaFreq = longCadenaFreqIn;
    //println("estoy definiendo la long del array  = " + longCadenaFreq);
    cadenaFreq = new float[longCadenaFreq];
  }

  //function returns the freq array size
  int getLongCadenaFreq() {
    return(longCadenaFreq);
  }

  //posa cada un de les 
  void setCadenaFreq(float cadenaFreqs, int i) {
    cadenaFreq[i] = cadenaFreqs;
    //println(" cadenaFreq[i] =" + cadenaFreq[i]);
  }


  float getCadenaFreq(int cont) {
    float temp = 0;
    temp = cadenaFreq[cont];
    return (temp);
  }
  float getLevel() {
    return level;
  }
}

