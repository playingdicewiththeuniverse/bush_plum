class Dot {
  PVector position;
  float size;
  Dot( PVector _pos, float _size ){
    position = _pos;
    size = _size;
  }
  Dot( float x, float y, float _size ){
    position = new PVector(x, y);
    size = _size;
  }

}