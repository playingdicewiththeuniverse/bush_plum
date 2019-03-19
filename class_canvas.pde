class Canvas {
  int w, h;
  ArrayList<Dot> dots;
  IntList active;
  Canvas( int _w, int _h ){
    w = _w;
    h = _h;
    dots = new ArrayList<Dot>();
    active = new IntList();
    Dot d0 = new Dot( random(width), random(height), random(5,15) );
    dots.add(d0);
    active.append(0);
  }
  
  
  void update() {
    if( active.size() > 0 ){
      //int randomIndex = active.get( (int)random(active.size()) );
      int randomIndex = active.get( active.size()-1 );
      Dot d0 = dots.get( randomIndex );
      boolean found = false;
      int tries = 0;
      while( tries++ < K ){
        float radius   = map( pow( random( 0, 1 ), RANDOM_SCALE), 0, 1, R_MIN, R_MAX );
        float theta    = random( TWO_PI );
        float distance = (DIST + radius + radius) * random( 1, 2 );
        Dot d1 = new Dot( d0.position.x + distance * cos(theta), d0.position.y + distance * sin(theta), radius );
        if( isValid( d1 ) ){
          dots.add( d1 );
          active.append( dots.size()-1 );
          found = true;
          break;
        }
      }
      if( found == false ){
        active.removeValue( randomIndex );
      }
      if(  active.size() == 0 ){
        endFrame = frameCount + 60;
      }
    }
  }
  
  
  void display() {
    background(0);
    for( int i = 0; i < dots.size(); i++ ){
      Dot d = dots.get(i);
      if( active.hasValue(i) ){
        fill(127);
      }else{
        fill(255);
      }
      ellipse( d.position.x, d.position.y, d.size, d.size );
    }
  }

  
  boolean isValid( Dot dt ){
    if( dt.position.x < dt.size || dt.position.y < dt.size || dt.position.x > this.w-1-dt.size || dt.position.y > this.h-1-dt.size ) return false;
    for( int i = 0; i < dots.size(); i++ ){
      Dot dx = dots.get(i);
      if( PVector.dist( dt.position, dx.position ) < (dt.size + dx.size + DIST) ) return false;
    }
    return true;
  }
}