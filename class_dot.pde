class Dot {
  PVector position;
  float size;
  color displayColor = color(255);

  int edgeIndex = -1;
  int jumpsToHome = 0;
  int numberOfConnections = 0;
  
  Dot( float x, float y, float _size, int _edge ){
    position = new PVector(x, y);
    size = _size;
    edgeIndex = _edge;
    int nextIndex = edgeIndex;
    while( nextIndex > 0 ){
      nextIndex = c.dots.get(nextIndex).edgeIndex;
      jumpsToHome++;
    }
  }
}