class Canvas {
  int w, h;
  ArrayList<Dot> dots;
  IntList active;
  IntList[][] thegrid;
  float cellSize;
  int gridSizeW, gridSizeH;
  int maxJumps = 1;
  int maxConnections = 1;
  

  Canvas( int _w, int _h ){
    w = _w;
    h = _h;
    cellSize = (DIST + R_MAX + R_MAX) * 2.0;
    gridSizeW = ceil(width  / cellSize) + 1;
    gridSizeH = ceil(height / cellSize) + 1;
    thegrid = new IntList[gridSizeW][gridSizeH];
    for( int x = 0; x < gridSizeW; x++ ){
      for( int y = 0; y < gridSizeH; y++ ){
        thegrid[x][y] = new IntList();
      }
    }
    dots = new ArrayList<Dot>();
    active = new IntList();
    Dot d0 = new Dot( width/2, height/2, getRandomRadius( width/2, height/2 ), 0 );
    d0.edgeIndex = 0;
    dots.add(d0);
    active.append(0);
    addToGrid( d0, 0 );
  }
  

  void addToGrid( Dot d, int index ){
    int x = constrain( floor(d.position.x / cellSize), 0, gridSizeW-1 );
    int y = constrain( floor(d.position.y / cellSize), 0, gridSizeH-1 );
    thegrid[x][y].append( index );
  }
  

  void update() {
    if( active.size() > 0 ){
      int randomIndex;
      if( INDEX_SELECTION_MODE == 1 ){
        randomIndex = active.get( active.size()-1 );
      }else if( INDEX_SELECTION_MODE == 2 ){
        randomIndex = active.get( 0 );
      }else{
        randomIndex = active.get( (int)random(active.size()) );
      }

      Dot d0 = dots.get( randomIndex );
      boolean found = false;
      int tries = 0;
      while( tries++ < K ){
        float radius   = getRandomRadius( d0.position.x, d0.position.y );
        float theta    = random( TWO_PI );
        float distance = (DIST + radius + radius) * random( 1, 2 );
        Dot d1 = new Dot( d0.position.x + distance * cos(theta), d0.position.y + distance * sin(theta), radius, randomIndex );
        maxJumps = max( maxJumps, d1.jumpsToHome );
        if( isValid( d1 ) ){
          dots.add( d1 );
          addToGrid( d1, dots.size()-1 );
          d0.numberOfConnections++;
          maxConnections = max( maxConnections, d0.numberOfConnections );
          active.append( dots.size()-1 );
          found = true;
          //break;
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
  
  
  boolean isValid( Dot dt ){
    if( dt.position.x < dt.size || dt.position.y < dt.size || dt.position.x > this.w-1-dt.size || dt.position.y > this.h-1-dt.size ) return false;
    
    int gx = constrain( floor(dt.position.x / cellSize), 0, gridSizeW-1 );
    int gy = constrain( floor(dt.position.y / cellSize), 0, gridSizeH-1 );

    for( int x = max( 0, gx-1 ); x < min( gridSizeW, gx+2 ); x++ ){
      for( int y = max( 0, gy-1 ); y < min( gridSizeH, gy+2 ); y++ ){
        for( int i = 0; i < thegrid[x][y].size(); i++ ){
          Dot dx = dots.get( thegrid[x][y].get(i) );
          if( PVector.dist( dt.position, dx.position ) < (dt.size + dx.size + DIST) ) return false;
        }
      }
    }
    return true;
  }
}