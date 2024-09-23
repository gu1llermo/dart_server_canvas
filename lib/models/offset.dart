import 'dart:convert';

class Offset {
  late double dx;
  late double dy;

  Offset({
    required this.dx,
    required this.dy,
  });

  Map<String, dynamic> toMap() {
    return {
      'dx': dx,
      'dy': dy,
    };
  }

  factory Offset.fromMap(Map<String, dynamic> map) {
    return Offset(
      dx: map['dx'].toDouble(),
      dy: map['dy'].toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Offset.fromJson(String source) => Offset.fromMap(json.decode(source));

  @override
  String toString() => 'Offset(dx: $dx, dy: $dy)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Offset && o.dx == dx && o.dy == dy;
  }

  @override
  int get hashCode => dx.hashCode ^ dy.hashCode;
}
