import std.stdio;
import std.math;

struct Vector {
  // the data
  float magnitude;
  float direction;

  // the methods
  // create a Vector from an (x,y) point. returns a Vector
  static Vector fromPoint(float[2] point) {
    import std.math;
    Vector v;
    float x = point[0];
    float y = point[1];
    v.magnitude = sqrt(x^^2 + y^^2);
    v.direction = atan2(y, x);
    return v;
  }
  // converts to an (x,y) point. returns an array
  float[2] toPoint() const {
    import std.math;
    float x = cos(direction) * magnitude;
    float y = sin(direction) * magnitude;
    return [x, y];
  }
  // vector additions
  // overloaded the 'addition' binary operator
  Vector opBinary(string op:"+")(Vector rhs) const {
    auto point = toPoint();
    auto point2 = rhs.toPoint();
    point[0] += point2[0];
    point[1] += point2[1];
    return Vector.fromPoint(point);
  }
  // overloaded toString method
  void toString() {
    writeln("Vector result: ", this);
    writeln(" Point result: ", this.toPoint());
  }
}

void main() {
  auto origin = Vector(0,0);
  auto result = origin + Vector(1.0, PI);
  result.toString();
}
