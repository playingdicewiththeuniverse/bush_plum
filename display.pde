void display() {

  if( DISPLAY_COLOR_MODE == 1 ){
    // Default
    colorMode(RGB,255);
    background(0);
    for( int i = 0; i < c.dots.size(); i++ ){
      Dot d0 = c.dots.get(i);
      d0.displayColor = color( c.active.hasValue(i) ? 127 : 255 );
    }

  }else if( DISPLAY_COLOR_MODE == 2 ){
    // Fire
    colorMode(RGB,1.0);
    background(0);
    for( int i = 0; i < c.dots.size(); i++ ){
      Dot d0 = c.dots.get(i);
      float val = map( d0.jumpsToHome, c.maxJumps, 0.0, 0.25, 3.0 );
      float red = constrain(val - 0, 0, 1);
      float grn = constrain(val - 1, 0, 1);
      float blu = constrain(val - 2, 0, 1);
      d0.displayColor = color( red, grn, blu );
    }

  }else if( DISPLAY_COLOR_MODE == 3 ){
    // Angle
    colorMode(HSB,360);
    background(0);
    for( int i = 0; i < c.dots.size(); i++ ){
      Dot d0 = c.dots.get(i);
      Dot d1 = c.dots.get(d0.edgeIndex);
      float hue = (360 + (0) + degrees( atan2( d0.position.y - d1.position.y, d0.position.x - d1.position.x ) )) % 360;
      float sat = 360; // c.active.hasValue(i) ? 60 : 360;
      float bri = 360; // map(d0.size, R_MIN, R_MAX, 360, 120);
      d0.displayColor = color( hue, sat, bri );
    }

  }else if( DISPLAY_COLOR_MODE == 4 ){
    // Default
    colorMode(RGB,255);
    background(255);
    for( int i = 0; i < c.dots.size(); i++ ){
      Dot d0 = c.dots.get(i);
      float val = map( d0.jumpsToHome, 0, c.maxJumps, 0, 255 );
      d0.displayColor = color( val );
    }

  }




  // draw graph lines
  if( (DISPLAY_SHAPE_MODE & 2) == 2 ){
    for( int i = 0; i < c.dots.size(); i++ ){
      Dot d0 = c.dots.get(i);
      Dot d1 = c.dots.get(d0.edgeIndex);
      stroke( d0.displayColor );
      line( d0.position.x, d0.position.y, d1.position.x, d1.position.y );
    }
  }

  // draw dots
  noStroke();
  if( (DISPLAY_SHAPE_MODE & 1) == 1 ){
    for( int i = 0; i < c.dots.size(); i++ ){
      Dot d0 = c.dots.get(i);
      fill( d0.displayColor );
      ellipse( d0.position.x, d0.position.y, d0.size, d0.size );
    }
  }

}