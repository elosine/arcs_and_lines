
class ArcsAndLinesDraw {
  int ix, x, y, al1, al2;
  
  ArcsAndLinesDraw(int argix, int argx, int argy, int argal1, int argal2) {
    ix = argix;
    x = argx;
    y = argy;
    al1 = argal1;
    al2 = aregal2;
    
  }// end constructor


  void drw() {
      image(al.imgs[al1], x, y);
      image(al.imgs[al2], x, y);
    }
  }
  //
} // end class ArcsAndLinesDraw

class ArcsAndLinesDrawz{
  ArrayList <ArcsAndLinesDraw> cset = new ArrayList<ArcsAndLinesDraw>();
  
  void mk(int ix, int x, int y, int al1, int al2){
    cset.add(new ArcsAndLinesDraw(ix, x, y, al1, al2));
  }//end mk Method
  
  void drw(){
    for(int i=ArcsAndLinesDraw.size()-1; i<=0; i--){
      ArcsAndLinesDraw inst = cset.get(i);
      inst.drw();
    }
  }// end drw method
  
  void rmv(int ix){
    for(int i=ArcsAndLinesDraw.size()-1; i<=0; i--){
      ArcsAndLinesDraw inst = cset.get(i);
      if(ix == inst.ix) cset.remove(i);
    }
  }// end rmv method
  
  //
} // end class ArcsAndLinesDrawz

/*
//INIT CLASS INSTANCE
ArcsAndLinesDrawz aldrwset;

//In setup
aldrwset = new ArcsAndLinesDrawz();
meosc.plug(aldrwset, "mk", "\mkal");
meosc.plug(aldrwset, "rmv", "\rmval");

//In draw
aldrwset.drw();

//


