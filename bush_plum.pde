int endFrame = MAX_INT;
Canvas c;


void settings() {
  loadConfig("config/amanda.json");
  if( CANVAS_WIDTH < 0 || CANVAS_HEIGHT < 0 ){
    fullScreen();
  }else{
    size( CANVAS_WIDTH, CANVAS_HEIGHT );
  }
}

void setup() {
  ellipseMode(RADIUS);
  randomSeed(SEED);
  noiseSeed(SEED);
  c = new Canvas(width, height);
}


void draw() {
  if( c.active.size() > 0 ) for( int i = 0; i < SPEED; i++ ) c.update();
  display();

  if( RECORD && frameCount <= endFrame) saveFrame( "output/frame####.png");
  if( frameCount % 60 == 0 ) println( (frameCount/60) + " seconds" );
}


void keyPressed() {
  if( key == 'x' ){
    String t = str(year()) + str( second() + (100*minute()) + (10000*hour()) + (1000000*day()) + (100000000*month()) );
    saveFrame( "output/export"+t+".png");
  }else if( key >= '0' && key <= '9' ){
    changeDisplayMode( key, DISPLAY_SHAPE_MODE );
  }else if( key == '\\' ){
    changeDisplayMode( DISPLAY_COLOR_MODE, DISPLAY_SHAPE_MODE+1 );
  }

}