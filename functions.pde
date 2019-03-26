void changeDisplayMode( int colorMode, int shapeMode ) {
  if( colorMode == '1' ){
    if( DISPLAY_COLOR_MODE != 1 ) println("Display Mode: White");
    DISPLAY_COLOR_MODE = 1;
  }else if( colorMode == '2' ){
    if( DISPLAY_COLOR_MODE != colorMode ) println("Display Mode: Fire");
    DISPLAY_COLOR_MODE = 2;
  }else if( colorMode == '3' ){
    if( DISPLAY_COLOR_MODE != colorMode ) println("Display Mode: Color Angle");
    DISPLAY_COLOR_MODE = 3;
  }else if( colorMode == '4' ){
    if( DISPLAY_COLOR_MODE != colorMode ) println("Display Mode: New");
    DISPLAY_COLOR_MODE = 4;
  }else if( colorMode != DISPLAY_COLOR_MODE ){
    println("Display Mode: White");
    DISPLAY_COLOR_MODE = 1;
  }
  if( shapeMode != DISPLAY_SHAPE_MODE ){
    DISPLAY_SHAPE_MODE = ((shapeMode + 3) % 3) + 1;
    if( DISPLAY_SHAPE_MODE == 1 ) println("Shape Mode: Dots");
    if( DISPLAY_SHAPE_MODE == 2 ) println("Shape Mode: Graph");
    if( DISPLAY_SHAPE_MODE == 3 ) println("Shape Mode: Combined");
  }
}


float getRandomRadius( float x, float y ) {
  if( RANDOM_RADIUS_MODE == 1){
    // noise based
    return constrain( map( constrain( pow( map( noise( x * NOISE_SCALE, y * NOISE_SCALE ), NOISE_MIN, NOISE_MAX, 0, 1 ), 2 ), 0, 2) , 0, 2, R_MIN, R_MAX ), R_MIN, R_MAX);
  }else if( RANDOM_RADIUS_MODE == 2){
    // noise based + quantized
    int size = (int)(pow( map( noise( x * NOISE_SCALE, y * NOISE_SCALE ), NOISE_MIN, NOISE_MAX, 0, 1 ), 2 ) * 3);
    return constrain( map( constrain(size,0,2) , 0, 2, R_MIN, R_MAX ), R_MIN, R_MAX);
  }else{
    // purely random
    return map( pow( random( 0, 1 ), RANDOM_SCALE), 0, 1, R_MIN, R_MAX );
  }
}


void loadConfig( String filename ){
  if( filename != "" ){
    JSONObject json = loadJSONObject( filename );
    CANVAS_WIDTH         = json.getInt( "CANVAS_WIDTH", CANVAS_WIDTH );
    CANVAS_HEIGHT        = json.getInt( "CANVAS_HEIGHT", CANVAS_HEIGHT );
    INDEX_SELECTION_MODE = json.getInt( "INDEX_SELECTION_MODE", INDEX_SELECTION_MODE );
    RANDOM_RADIUS_MODE   = json.getInt( "RANDOM_RADIUS_MODE", RANDOM_RADIUS_MODE );
    SEED                 = json.getInt( "SEED", SEED );
    SPEED                = json.getInt( "SPEED", SPEED );
    COLOR_SPEED          = json.getInt( "COLOR_SPEED", COLOR_SPEED );
    DISPLAY_COLOR_MODE   = json.getInt( "DISPLAY_COLOR_MODE", DISPLAY_COLOR_MODE );
    DISPLAY_SHAPE_MODE   = json.getInt( "DISPLAY_SHAPE_MODE", DISPLAY_SHAPE_MODE );
    RANDOM_SCALE         = json.getFloat( "RANDOM_SCALE", RANDOM_SCALE );
    NOISE_SCALE          = json.getFloat( "NOISE_SCALE", NOISE_SCALE );
    NOISE_MIN            = json.getFloat( "NOISE_MIN", NOISE_MIN );
    NOISE_MAX            = json.getFloat( "NOISE_MAX", NOISE_MAX );
    R_MIN                = json.getFloat( "R_MIN", R_MIN );
    R_MAX                = json.getFloat( "R_MAX", R_MAX );
    DIST                 = json.getFloat( "DIST", DIST );
    RECORD               = json.getBoolean( "RECORD", RECORD );
  }
}