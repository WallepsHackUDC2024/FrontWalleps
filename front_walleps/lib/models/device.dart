import 'dart:convert';

class Device {
  final int id;
  final String userId;
  final String deviceName;
  final int timesWeek;
  final String daytime;
  final int duration;

  Device({
    required this.id,
    required this.userId,
    required this.deviceName,
    required this.timesWeek,
    required this.daytime,
    required this.duration,
  });

  // Convertir un objeto Device a un Map. Útil para codificar a JSON antes de enviar al backend.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user_id': userId,
      'device_name': deviceName,
      'times_week': timesWeek,
      'daytime': daytime,
      'duration': duration,
    };
  }

  // Crear un objeto Device desde un Map. Útil para decodificar JSON proveniente del backend.
  factory Device.fromMap(Map<String, dynamic> map) {
    return Device(
      id: map['id'],
      userId: map['user_id'],
      deviceName: map['device_name'],
      timesWeek: map['times_week'],
      daytime: map['daytime'],
      duration: map['duration'],
    );
  }

  // Convertir el objeto Device a JSON. Útil para enviar datos al backend.
  String toJson() => json.encode(toMap());

  // Crear un objeto Device desde una cadena JSON. Útil para procesar respuestas del backend.
  factory Device.fromJson(String source) => Device.fromMap(json.decode(source));
}
