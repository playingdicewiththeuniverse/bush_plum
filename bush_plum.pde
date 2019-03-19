final int   K     = 30;
final float R_MIN = 4.0;
final float R_MAX = 12.0;
final float DIST  = 5.0;
final float RANDOM_SCALE = 3.0;

int endFrame = MAX_INT;

Canvas c;

void setup() {
  size( 1080, 1080 );
  ellipseMode(RADIUS);
  randomSeed(42);
  c = new Canvas(width, height);
}

void draw() {
  c.update();
  c.update();
  c.display(1);
  
  saveFrame( "output/frame####.png");
  if( frameCount % 60 == 0 ){
    println( (frameCount/60) + " seconds" );
  }
  if( frameCount >= endFrame ){
    //saveFrame( "output/finalFrame.png");    
    noLoop();
  }
}