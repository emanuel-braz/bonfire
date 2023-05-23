import 'dart:ui';

import 'package:bonfire/bonfire.dart';

abstract class Force2D {
  dynamic id;
  Vector2 value;
  Force2D({required this.id, required this.value});

  Vector2 transform(Vector2 velocity, double dt);
}

class AccelerationForce2D extends Force2D {
  AccelerationForce2D({required super.id, required super.value});

  @override
  Vector2 transform(Vector2 velocity, double dt) {
    return velocity + value * dt;
  }
}

class ResistenceForce2D extends Force2D {
  ResistenceForce2D({required super.id, required super.value});

  @override
  Vector2 transform(Vector2 velocity, double dt) {
    return Vector2(
      lerpDouble(velocity.x, 0, dt * value.x) ?? velocity.x,
      lerpDouble(velocity.y, 0, dt * value.y) ?? velocity.y,
    );
  }
}

class LinearForce2D extends Force2D {
  LinearForce2D({required super.id, required super.value});

  @override
  Vector2 transform(Vector2 velocity, double dt) {
    return velocity + value;
  }
}