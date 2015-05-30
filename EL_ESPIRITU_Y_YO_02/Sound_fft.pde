
/*-----------------------------------------------------------------*/
class Sound_fft {

  Sound_fft(PApplet parent) {
  }
  public void setDamper(float damper) {
  }
  public void draw() {
    // dibujaSpectrum();
  }
  public float get_LiveInput(int i) {
    return onionData.getCadenaFreq(i);
   
  }
 

  public float get_fft(int i) {
    //println("myFFT.spectrum[i]"+myFFT.spectrum[i]);
    return onionData.getCadenaFreq(i);
  //  else   return myFFT.spectrum[i];
  }
  public float getLevel() {
   
      return onionData.getLevel();
   
    //else   return myFFT.getLevel(myInput);
  }

  public float getSpectrumLenght() {

    return  onionData.getLongCadenaFreq();
   // else    return  onionData.getLongCadenaFreq();
  }
  public boolean isBeat() {
    return false;
  }
  public float getMedia(int in,int out) {
    float mitja = 0;
    for(int i=in;i<out;i++) {
         mitja+= onionData.getCadenaFreq(i);
     // else    return  onionData.getLongCadenaFreq();
    }


    mitja=mitja/(out-in);
    println("----mitja:"+mitja);
    return(mitja);
  }
  public void stop() {
   // Ess.stop();
    //super.stop();
  }
}






